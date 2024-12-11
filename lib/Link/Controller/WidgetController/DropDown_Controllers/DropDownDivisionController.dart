import 'package:get/get.dart';
import 'package:vms_school/Link/Model/AdminModel/AllDivisionModel.dart';

class Dropdowndivisioncontroller extends GetxController {
  List<String> division = [];
  List<Division> allDivision = [];
  void setDivision(AllDivisionModel div) {
    division.clear();
    allDivision = div.division!;
    for (int i = 0; i < div.division!.length; i++) {
      division.add(div.division![i].enName.toString());
    }
    update();
  }
}
