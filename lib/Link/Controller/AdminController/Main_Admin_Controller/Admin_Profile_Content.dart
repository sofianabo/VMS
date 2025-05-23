import 'package:get/get.dart';

class Admin_Profile_Content extends GetxController {
  String curruntValue = "Profile";
  bool enabledPublicInfo = false;
  bool enabledMoreInfo = false;
  bool enabledSocilaMediaInfo = false;
  bool enabledBanlInfo = false;
  bool enabledEmailInfo = false;
  bool enabledPasswordInfo = false;
  bool enabledchangeemaildInfo = false;

  //Password Info For Screen
  bool ShowOldPassword = true;
  bool ShowNewPassword = true;
  bool ShowConfirmPassword = true;
  bool ShowPassword = true;

  //Password Info For Screen
  bool IsOldPasswordError = false;
  bool IsNewPasswordError = false;
  bool IsConfirmPasswordError = false;
  bool IsPasswordError = false;
  // bool ShowOldPassword = true;
  // bool ShowNewPassword = true;
  // bool ShowConfirmPassword = true;
  // bool ShowPassword = true;
  // bool ShowOldPassword = true;
  // bool ShowNewPassword = true;
  // bool ShowConfirmPassword = true;
  // bool ShowPassword = true;
  // bool ShowOldPassword = true;
  // bool ShowNewPassword = true;
  // bool ShowConfirmPassword = true;
  // bool ShowPassword = true;

  void updatePasswordError(String type, bool newValue) {
    switch (type) {
      case 'old':
        IsOldPasswordError = newValue;
        break;
      case 'new':
        IsNewPasswordError = newValue;
        break;
      case 'confirm':
        IsConfirmPasswordError = newValue;
        break;
      case 'password':
        IsPasswordError = newValue;
        break;
      default:
    }
    update();
  }

  resetAll() {
    enabledPublicInfo = false;
    enabledMoreInfo = false;
    enabledSocilaMediaInfo = false;
    enabledBanlInfo = false;
    enabledEmailInfo = false;
    enabledPasswordInfo = false;
    enabledchangeemaildInfo = false;
    update();
  }

  ChangeCurruntValue(String value) {
    curruntValue = value;
    update();
  }

  ChangeShowOldPassword(bool value) {
    ShowOldPassword = value;
    update();
  }

  ChangeShowNewPassword(bool value) {
    ShowNewPassword = value;
    update();
  }

  ChangeShowConfirmPassword(bool value) {
    ShowConfirmPassword = value;
    update();
  }

  ChangeShowPassword(bool value) {
    ShowPassword = value;
    update();
  }

  ChangeenabledPublicInfo(bool value) {
    enabledPublicInfo = value;
    update();
  }

  ChangeenabledchangeemaildInfo(bool value) {
    enabledchangeemaildInfo = value;
    update();
  }

  ChangeenabledMoreInfo(bool value) {
    enabledMoreInfo = value;
    update();
  }

  ChangeenabledSocilaMediaInfo(bool value) {
    enabledSocilaMediaInfo = value;
    update();
  }

  ChangeenabledBanlInfo(bool value) {
    enabledBanlInfo = value;
    update();
  }

  ChangeenabledEmailInfo(bool value) {
    enabledEmailInfo = value;
    update();
  }

  ChangeenabledPasswordInfo(bool value) {
    enabledPasswordInfo = value;
    update();
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
