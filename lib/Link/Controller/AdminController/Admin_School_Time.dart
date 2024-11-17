import 'package:get/get.dart';

class AdminSchoolTimeController extends GetxController {
  String examClassIndex = "";
  String examDivisionIndex = "";

  List<String> examClass = ["first", "tow", "three"];
  List<String> examDivision = ["one"];

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
