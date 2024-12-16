import 'package:get/get.dart';
import 'package:vms_school/Link/Controller/AdminController/School_Controllers/Class_Mgmt_Controller.dart';
import 'package:vms_school/Link/Model/AdminModel/School_Models/AllGradeModel.dart';

class Dropdowngradecontroller extends GetxController {
  List<Map<String, dynamic>> grades = [];
  AllGradesModel? gradess;
  bool isLoading = true;

  void SetIsLoading(bool value) {
    isLoading = value;
    update();
  }

  void setGrades(AllGradesModel grade) {
    grades.clear();
    gradess = grade;
    List<String> gradeNames = [];
    if (grade.grades != null) {
      for (var g in grade.grades!) {
        grades.add({
          'id': g.id,
          'name': g.enName.toString(),
        });
        gradeNames.add(g.enName.toString());
      }
    }
    Get.find<ClassMgmtController>().addGradeList(gradeNames);
    SetIsLoading(false);
    update();
  }
}