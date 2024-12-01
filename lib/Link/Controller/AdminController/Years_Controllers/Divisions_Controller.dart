import 'package:get/get.dart';

class DropdownDivisions_Controller extends GetxController {
  List<Map<String, dynamic>> Division = [
    {
      "arName": "الفصل الأول",
      "enName": "First Division",
      "class": "Twelfth Scientific Grade",
      "meet": "https://192.168.1.1",
    },
  ];

  String SessionIndex = "";
  String ClassIndex = "";
  String ClassDiagIndex = "";

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

  List<String> listClassDiag = [
    "Twelfth Scientific Grade",
    "Eleventh Scientific Grade",
    "Tenth Scientific Grade",
    "Ninth Scientific Grade",
    "Eighth Scientific Grade",
    "Seventh Scientific Grade"
  ];

  addData(String arName, String enName, String drive) {
    Division.addAll([
      {
        "arName": "$arName",
        "enName": "$enName",
        "class": "$selectClassDiagIndex",
        "meet": "$drive",
      }
    ]);
    ClassDiagIndex = "";
    update();
  }

  updatedata(int idx, String arName, String enName, String drive) {
    Division[idx] = {
      "arName": "$arName",
      "enName": "$enName",
      "class": "$selectClassDiagIndex",
      "meet": "$drive",
    };
    ClassDiagIndex = "";
    update();
  }

  deleteDivision(int index) {
    Division.removeAt(index);
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
      case 'classDiag':
        ClassDiagIndex = index ?? "";
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
      case 'classDiag':
        listClassDiag = options;
        break;
    }
    update();
  }

  String get selectSessionIndex => SessionIndex;

  String get selectClassIndex => ClassIndex;

  String get selectClassDiagIndex => ClassDiagIndex;
}
