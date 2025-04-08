import 'package:get/get.dart';

class DraweController extends GetxController {
  bool isopen = false;
  opendrawer(bool state) {
    isopen = state;
    update();
  }
}
