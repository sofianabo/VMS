import 'package:get/get.dart';

class DropDownCurriculumn_Controller extends GetxController {
  List<Map<String, dynamic>> Curriculum = [
    {
      "name": "اللغة العربية",
      "img": "First Division",
      "max": "500",
      "passing": "400",
      "class": "Twelfth Scientific Grade",
      "semester": "Twelfth Scientific Grade",
      "isFulling": "true",
    },
  ];

  bool isFailingSubject = false;

  void updateSelection(bool value) {
    isFailingSubject = value;
    update();
  }

  String SessionIndex = "";
  String ClassIndex = "";
  String semesterIndex = "";

  List<String> listSession = [
    "First Semester",
    "Second Semester",
    "Summer Session",
  ];

  List<String> listClass = [
    "Twelfth Scientific Grade",
    "Eleventh Scientific Grade",
    "Tenth Scientific Grade",
    "Ninth Scientific Grade",
    "Eighth Scientific Grade",
    "Seventh Scientific Grade"
  ];

  List<String> listSemester = [
    "Twelfth Scientific Grade",
    "Eleventh Scientific Grade",
    "Tenth Scientific Grade",
    "Ninth Scientific Grade",
    "Eighth Scientific Grade",
    "Seventh Scientific Grade"
  ];

  addData(String Name, String max, String passing) {
    Curriculum.addAll([
      {
        "name": "$Name",
        "img": "First Division",
        "max": "$max",
        "passing": "$passing",
        "class": "$selectClassIndex",
        "semester": "$selectsemesterIndex",
        "isFulling": "$isFailingSubject",
      }
    ]);
    ClassIndex = "";
    semesterIndex = "";
    SessionIndex = "";
    isFailingSubject = false;
    update();
  }

  deleteCurriculum(int index) {
    Curriculum.removeAt(index);
    update();
  }

  void selectIndex(String type, String? index) {
    switch (type) {
      case 'session':
        SessionIndex = index ?? "";
        break;
      case 'class':
        ClassIndex = index ?? "";
        break;
      case 'semester':
        semesterIndex = index ?? "";
        break;
    }
    update();
  }

  void updateList(String type, List<String> options) {
    switch (type) {
      case 'session':
        listSession = options;
        break;
      case 'class':
        listClass = options;
        break;
      case 'semester':
        listSemester = options;
        break;
    }
    update();
  }

  String get selectSessionIndex => SessionIndex;

  String get selectClassIndex => ClassIndex;

  String get selectsemesterIndex => semesterIndex;
}
