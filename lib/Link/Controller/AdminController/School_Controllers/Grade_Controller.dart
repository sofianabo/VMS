import 'package:get/get.dart';
import 'package:vms_school/Link/Model/AdminModel/School_Models/AllGradeModel.dart'
    as gr;

class Grade_Controller extends GetxController {
  var Grades = <Map<String, dynamic>>[].obs;

  List<gr.Grades>? grades;

  bool isLoading = true;

  setData(gr.AllGradesModel AllGrade) {
    grades = AllGrade.grades;
    Grades.clear();
    for (var stu in AllGrade.grades!) {
      Grades.add({
        'id': stu.id.toString(),
        'name': stu.name.toString(),
        'enName': stu.enName.toString(),
        'feeCount': stu.feeCount.toString(),
        'hasStudent': stu.hasStudent == 1 ? true : false,
      });
    }
    setIsLoading(false);
    update();
  }

  setIsLoading(bool isload) {
    isLoading = isload;
    update();
  }

  DeleteGrade(int index) {
    Grades.removeAt(index);
    update();
  }

  bool IsarnameError = false;
  bool IsennameError = false;
  bool IsfeeError = false;
  void updateFieldError(String type, bool newValue) {
    switch (type) {
      case 'arname':
        IsarnameError = newValue;
        break;
      case 'enname':
        IsennameError = newValue;
        break;
      case 'fee':
        IsfeeError = newValue;
        break;
      default:
        print("Error: Invalid type");
    }
    update();
  }
}
