import 'package:get/get.dart';

class DropDownController extends GetxController {
  String selectedIndex = "";
  List<String> options = ["ar", "en"];

  void selectval(String? i) {
    selectedIndex = i!;
    update();
  }

  void UpdateOpt(List<String> op) {
    options = op;
    op.clear();
    update();
  }
}
