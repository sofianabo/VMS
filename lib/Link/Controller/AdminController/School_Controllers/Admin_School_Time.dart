import 'package:get/get.dart';
import 'package:vms_school/Link/Model/AdminModel/AllClassesModel.dart';
import 'package:vms_school/Link/Model/AdminModel/AllDivisionModel.dart';

class AdminSchoolTimeController extends GetxController {
  String examClassIndex = "";
  String examDivisionIndex = "";

  List<String> examClass = [];
  List<String> examDivision = [];

  void selectIndex(String type, String? index) {
    switch (type) {
      case 'class':
        examClassIndex = index ?? "";
        break;
      case 'division':
        examDivisionIndex = index ?? "";
        break;
    }
    update();
  }

  void setAllClasses(AllClassModel clas) {
    examClass.clear();
    for (int j = 0; j < clas.classes!.length; j++) {
      examClass.add(clas.classes![j].enName.toString());
    }
    update();
    updateList("class", examClass);
  }


   void setAllDivision(AllDivisionModel division) {
    examDivision.clear();
    for (int j = 0; j < division.division!.length; j++) {
      examDivision.add(division.division![j].enName.toString());
    }
    update();
    updateList("division", examDivision);
  }

  void updateList(String type, List<String> options) {
    switch (type) {
      case 'class':
        examClass = options;
        break;
      case 'division':
        examDivision = options;
        break;
    }
    update();
  }

  String get selectedExamClass => examClassIndex;

  String get selectedExamDivision => examDivisionIndex;
}
