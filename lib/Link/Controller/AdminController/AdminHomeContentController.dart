import 'package:get/get.dart';

class AdminHomeContentController extends GetxController {
  String content = 'dashboard';

  String get contentt => content;

  void updateContent(String c) {
    content = c;
    update();
  }
}
