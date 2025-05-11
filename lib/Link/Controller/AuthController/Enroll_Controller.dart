import 'package:get/get.dart';

class EnrollController extends GetxController {
  bool Isloading = false;

  SetIsloading(bool value) {
    Isloading = value;
    update();
  }

  bool ShowConfirmPassword = true;
  bool ShowPassword = true;
  bool ShowoldPassword = true;
//here is new error validate
  bool IsusernameError = false;
  bool IsnameError = false;
  bool IsLastnameError = false;
  bool IsphoneError = false;
  bool IsnidError = false;
  bool IsEmailError = false;
  bool IsPasswordError = false;
  bool IsConfirmPasswordError = false;
  bool IsoldPasswordError = false;

  void updateFieldError(String type, bool newValue) {
    switch (type) {
      case 'username':
        IsusernameError = newValue;
        break;
      case 'name':
        IsnameError = newValue;
        break;
      case 'last':
        IsLastnameError = newValue;
        break;
      case 'email':
        IsEmailError = newValue;
        break;
      case 'password':
        IsPasswordError = newValue;
        break;
      case 'cpassword':
        IsConfirmPasswordError = newValue;
        break;
      case 'oldpassword':
        IsoldPasswordError = newValue;
        break;
      case 'phone':
        IsphoneError = newValue;
        break;
      case 'nid':
        IsnidError = newValue;
        break;
      default:
        print("Error: Invalid type");
    }
    update();
  }

  ChangeShowConfirmPassword(bool value) {
    ShowConfirmPassword = value;
    print(value);
    update();
  }

  ChangeShowPassword(bool value) {
    ShowPassword = value;
    print(value);
    update();
  }

  ChangeShowoldPassword(bool value) {
    ShowoldPassword = value;
    print(value);
    update();
  }

  void resetError() {
    ShowConfirmPassword = true;
    ShowPassword = true;
    IsusernameError = false;
    IsnameError = false;
    IsphoneError = false;
    IsnidError = false;
    IsEmailError = false;
    IsPasswordError = false;
    IsConfirmPasswordError = false;
    IsLastnameError = false;
    update();
  }
}
