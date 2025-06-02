import 'package:get/get.dart';
import 'package:vms_school/Link/Model/AuthModel/UserModel.dart';
import 'package:vms_school/main.dart';

class UserController extends GetxController {
  String? token;
  String? roll;
  bool? verified;
  bool? hasData;
  var isEducationalPlatform = false.obs;
  bool Isloading = false;

  SetIsloading(bool value) {
    Isloading = value;
    update();
  }

  void GetuserInfo(UserModel user) {
    token = user.token;
    roll = user.roll;
    verified = user.verified;
    hasData = user.hasData;
    prefs!.setString("token", token!);
    SetIsloading(false);
    update();
  }

  bool IsusernameError = false;
  bool IsPasswordError = false;

  void updateFieldError(String type, bool newValue) {
    switch (type) {
      case 'username':
        IsusernameError = newValue;
        break;
      case 'password':
        IsPasswordError = newValue;
        break;
      default:
    }
    update();
  }
}
