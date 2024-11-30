import 'package:get/get.dart';
import 'package:vms_school/Link/Model/AdminModel/AllSessionModel.dart';
import 'package:vms_school/Link/Model/AdminModel/AllStatusModel.dart';

class Dropdownstatuscontroller extends GetxController {
  List<String> status = [];

  void setStatus(AllStatusModel stat) {
    status.clear();
    for (int i = 0; i < stat.type!.length; i++) {
      status.add(stat.type![i].toString());
    }
    update();
  }
}
