import 'package:get/get.dart';
import 'package:getx/Link/Model/AdminModel/AllDivisionModel.dart';

class Dropdowndivisioncontroller extends GetxController {
  List<String> division = [];

  void setDivision(AllDivisionModel div) {
    division.clear();
    for (int i = 0; i < div.division!.length; i++) {
      division.add(div.division![i].enName.toString());
    }
    update();
  }
}
