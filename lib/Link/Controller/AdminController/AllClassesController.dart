import 'package:get/get.dart';
import 'package:vms_school/Link/Model/AdminModel/AllClassesModel.dart';

class Allclassescontroller extends GetxController {
 
  String examTypeIndex = "";
  String examClassIndex = "";
  String examDivisionIndex = "";

  List<String> examType = ["Quiz", "Exam", "Midterm"];
  List<String> examClass = ["first", "tow", "three"];
  List<String> examDivision = ["one"];

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

  List<String> get options =>
      examType; // يمكنك تخصيص هذه للحصول على القوائم المطلوبة
}