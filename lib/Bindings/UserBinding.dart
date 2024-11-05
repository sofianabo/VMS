import 'package:get/get.dart';
import 'package:getx/Controller/UserController.dart';
import 'package:getx/Controller/WidgetController/PasswordHintController.dart';

class UserBiniding extends Bindings {
  @override
  void dependencies() {
    Get.put(UserController(), permanent: true);
  }
}
