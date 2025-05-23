import 'package:get/get.dart';

class errorHandel extends GetxController {
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
  bool IspasswordError = false;
  bool IsconfirmPasswordError = false;
  bool IsemgError = false;

  void updateFieldError(String type, bool newValue) {
    switch (type) {
      case 'first':
        IsFirstError = newValue;
        break;
      case 'emg':
        IsemgError = newValue;
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
      case 'password':
        IspasswordError = newValue;
        break;
      case 'confirmPassword':
        IsconfirmPasswordError = newValue;
        break;

      default:
    }
    update();
  }
}
