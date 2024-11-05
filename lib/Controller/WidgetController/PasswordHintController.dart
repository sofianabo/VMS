import 'package:get/get.dart';

class PasswordHintController extends GetxController {
  bool isVisible = true;

  notHint() {
    isVisible = false;
    update();
  }

  hint() {
    isVisible = true;
    update();
  }
}
