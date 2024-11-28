import 'package:get/get.dart';
import 'package:vms_school/Link/Model/AdminModel/AllExamTypeModel.dart';

class Dropdownexamtypecontroller extends GetxController {
  List<String> examType = [];

  void setTypes(AllExamTypeModel type) {
    examType.clear();
    for (int i = 0; i < type.type!.length; i++) {
      examType.add(type.type![i].enName.toString());
    }
    update();
  }
}
