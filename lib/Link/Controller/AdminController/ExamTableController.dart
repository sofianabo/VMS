import 'package:get/get.dart';
import 'package:vms_school/Link/Model/AdminModel/AllClassesModel.dart';
import 'package:vms_school/Link/Model/AdminModel/AllDivisionModel.dart';
import 'package:vms_school/Link/Model/AdminModel/AllExamTypeModel.dart';

class ExamTableController extends GetxController {
  String examTypeIndex = "";
  String examClassIndex = "";
  String examDivisionIndex = "";

  List<String> examType = [];
  List<String> examClass = [];
  List<String> examDivision = [];

  void selectIndex(String type, String? index) {
    switch (type) {
      case 'type':
        examTypeIndex = index ?? "";
        break;
      case 'class':
        examClassIndex = index ?? "";
        break;
      case 'division':
        examDivisionIndex = index ?? "";
        break;
    }
    update();
  }

  void setAllTypes(AllExamTypeModel types) {
    examType.clear();
    for (int j = 0; j < types.type!.length; j++) {
      examType.add(types.type![j].enName.toString());
    }
    update();
    updateList("type", examType);
  }

  void setAllClasses(AllClassesModel clas) {
    examClass.clear();
    for (int j = 0; j < clas.classes.length; j++) {
      examClass.add(clas.classes[j].enName.toString());
    }
    update();
    updateList("class", examClass);
  }

  void setAllDivision(AllDivisionModel division) {
    examDivision.clear();
    for (int k = 0; k < division.division!.length; k++) {
      examDivision.add(division.division![k].enName.toString());
    }
    update();
    updateList("division", examDivision);
  }

  void updateList(String type, List<String> options) {
    switch (type) {
      case 'type':
        examType = options;
        break;
      case 'class':
        examClass = options;
        break;
      case 'division':
        examDivision = options;
        break;
    }
    update();
  }

  String get selectedExamType => examTypeIndex;

  String get selectedExamClass => examClassIndex;

  String get selectedExamDivision => examDivisionIndex;
}
