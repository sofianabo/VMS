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
}
