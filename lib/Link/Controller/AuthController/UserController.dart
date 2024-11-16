import 'package:get/get.dart';
import 'package:getx/Link/Model/AuthModel/UserModel.dart';
import 'package:getx/main.dart';

class UserController extends GetxController {
  String? token;
  String? roll;
  bool? verified;
  bool? hasData;

  void GetuserInfo(UserModel user) {
    token = user.token;
    roll = user.roll;
    verified = user.verified;
    hasData = user.hasData;
    tokenPref!.setString("token", token!);
    update();
  }
}