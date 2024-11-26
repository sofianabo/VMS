import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class AddFullEmployeeController extends GetxController {
  Rx<Uint8List?> selectedImage = Rx<Uint8List?>(null); // الصورة المختارة
  final ImagePicker _picker = ImagePicker(); // لاختيار الصور من المعرض

  Future<void> pickImage(BuildContext context) async {
    // اختيار الصورة من المعرض
    final XFile? pickedFile = await _picker.pickImage(
        source: ImageSource.gallery, imageQuality: 80);

    if (pickedFile != null) {
      // تحويل الملف الذي تم اختياره إلى Uint8List
      Uint8List fileBytes = await pickedFile.readAsBytes();

      // تعيين الصورة المختارة
      selectedImage.value = fileBytes;
    } else {
      Get.snackbar("No image selected", "Please select a valid image.");
    }
  }
}
