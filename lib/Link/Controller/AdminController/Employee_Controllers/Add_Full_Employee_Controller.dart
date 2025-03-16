import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class AddFullEmployeeController extends GetxController {
  Rx<Uint8List?> selectedImage = Rx<Uint8List?>(null);
  final ImagePicker _picker = ImagePicker();

  Future<void> pickImage(BuildContext context) async {
    final XFile? pickedFile =
        await _picker.pickImage(source: ImageSource.gallery, imageQuality: 80);

    if (pickedFile != null) {
      Uint8List fileBytes = await pickedFile.readAsBytes();

      selectedImage.value = fileBytes;
    } else {}
  }

  bool IsFirstError = false;
  bool IsLastError = false;
  bool IsFatherError = false;
  bool IsMotherError = false;
  bool IsBirthError = false;
  bool IsPhoneError = false;
  bool IsEmgnError = false;
  bool IsJoinError = false;
  bool IsAddressError = false;
  bool IsCAddressError = false;
  bool IsJopError = false;
  bool IsGenderError = false;
  bool IsFamilyError = false;
  bool IsQualfError = false;
  bool IsExpError = false;

  void updateFieldError(String type, bool newValue) {
    switch (type) {
      case 'first':
        IsFirstError = newValue;
        break;
      case 'last':
        IsLastError = newValue;
        break;
      case 'father':
        IsFatherError = newValue;
        break;
      case 'mother':
        IsMotherError = newValue;
        break;
      case 'birth':
        IsBirthError = newValue;
        break;
      case 'phone':
        IsPhoneError = newValue;
        break;
      case 'emgn':
        IsEmgnError = newValue;
        break;
      case 'join':
        IsJoinError = newValue;
        break;
      case 'address':
        IsAddressError = newValue;
        break;
      case 'caddress':
        IsCAddressError = newValue;
        break;
      case 'jop':
        IsJopError = newValue;
        break;
      case 'gender':
        IsGenderError = newValue;
        break;
      case 'family':
        IsFamilyError = newValue;
        break;
      case 'qua':
        IsQualfError = newValue;
        break;
      case 'exp':
        IsExpError = newValue;
        break;

      default:
        print("Error: Invalid type");
    }
    update();
  }
}
