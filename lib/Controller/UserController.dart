import 'package:get/get.dart';
import 'package:getx/Model/UserModel.dart';

class UserController extends GetxController {
  var roll = "";
  var token = "";
  // void onInit() async {
  //   roll = "";
  //   token = "";
  //   super.onInit();
  // }

  void GetuserInfo(UserModel user) {
    roll = user.roll!;
    token = user.token!;
    update();
    print(" the role is " + roll);
  }

}
