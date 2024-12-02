import 'package:get/get.dart';
import 'package:vms_school/Link/Model/AdminModel/AllPenaltyModel.dart';
import 'package:vms_school/Link/Model/AdminModel/AllSessionModel.dart';

class Dropdownpenaltycontroller extends GetxController {
  List<String> penalties = [];

  void setPenalty(AllPenaltyModel penalt) {
    penalties.clear();
    for (int i = 0; i < penalt.penalty!.length; i++) {
      penalties.add(penalt.penalty![i].type.toString());
    }
    update();
  }
}
