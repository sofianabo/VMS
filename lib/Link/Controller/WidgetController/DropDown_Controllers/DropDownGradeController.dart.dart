import 'package:get/get.dart';
import 'package:vms_school/Link/Model/AdminModel/School_Models/AllGradeModel.dart';

class Dropdowngradecontroller extends GetxController {
  List<String> grades = [];

  void setGrades(AllGradesModel grade) {
    grades.clear();
    for (int i = 0; i < grade.grades!.length; i++) {
      grades.add(grade.grades![i].enName.toString());
    }
    update();
  }
}
