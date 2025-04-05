import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:vms_school/Link/API/AdminAPI/Employees_APIs/Update_Employee_Info.dart';
import 'package:vms_school/Link/Model/AdminModel/My_Data_Model.dart';

class Add_Data_controller extends GetxController {
  bool isLoading = true;
  MyData? myData;
  String? email;
  String? roll;

  setIsloading(bool value) {
    isLoading = value;
    update();
  }

  setMyData(My_Profile_Data data) {
    myData = data.myData;

    update();
  }

  bool isVerified = false;
  bool hasData = false;

  Rx<DateTime?> Birthdate = Rx<DateTime?>(null);
  Rx<DateTime?> Joindate = Rx<DateTime?>(null);
  void selectBirthDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: Birthdate.value ?? DateTime.now(),
      firstDate: DateTime(1950),
      lastDate: DateTime(2100),
    );
    if (picked != null) {
      Birthdate.value = picked;
    }
  }

  void selectJoinDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: Joindate.value ?? DateTime.now(),
      firstDate: DateTime(2020),
      lastDate: DateTime(DateTime.now().year + 1),
    );
    if (picked != null) {
      Joindate.value = picked;
    }
  }

  Rx<Uint8List?> selectedImage = Rx<Uint8List?>(null);
  final ImagePicker _picker = ImagePicker();

  Future<void> pickImage(BuildContext context, bool isUpdate) async {
    final XFile? pickedFile =
        await _picker.pickImage(source: ImageSource.gallery, imageQuality: 80);

    if (pickedFile != null) {
      Uint8List fileBytes = await pickedFile.readAsBytes();

      selectedImage.value = fileBytes;
      if (isUpdate == true) {
        Update_Employee_Information.Update_Employee_Info(
            selectedImage: selectedImage.value, Type: '');
      }
    } else {}
    update();
  }

  void removeimage() {
    selectedImage.value = null;
    update();
  }

  void sethasData(bool value) {
    hasData = value;
    update();
  }

  void setroll(String value) {
    roll = value;
    update();
  }

  void setEmail(String value) {
    email = value;
    update();
  }

  void setisVerified(bool value) {
    isVerified = value;
    update();
  }
}
