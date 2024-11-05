import 'package:get/get.dart';
import 'package:getx/Controller/WidgetController/PasswordHintController.dart';

class PasswordBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(PasswordHintController(), permanent: true);
  }
}
