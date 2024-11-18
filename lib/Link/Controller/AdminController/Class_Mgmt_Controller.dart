import 'package:get/get.dart';

class ClassMgmtController extends GetxController {
  List<Map<String, dynamic>> Classes = [
    {
      "arName": "First Class",
      "enName": "First Class",
      "class": "Twelveth scientific grade",
      "division": "Twelveth scientific grade",
      "drive": "https://192.168.1.1",
    },
  ];

  addData(String arName, String enName, String drive) {
    Classes.addAll([
      {
        "arName": "$arName",
        "enName": "$enName",
        "class": "$selectedClassDiagIndex",
        "division": "$selectedDivisionDiagIndex",
        "drive": "$drive",
      }
    ]);
    update();
  }

  String gradeIndex = "";
  String sessionIndex = "";
  String ClassDiagIndex = "";
  String DivisionDiagIndex = "";
  String AdminDiagIndex = "";

  List<String> listClass = ["first", "tow", "three"];
  List<String> listDivision = ["one"];
  List<String> listClassDiag = ["one"];
  List<String> listDivisionDiag = ["one"];
  List<String> listAdminDiag = ["one", "tow"];

  void selectIndex(String type, String? index) {
    switch (type) {
      case 'grade':
        gradeIndex = index ?? "";
        break;
      case 'session':
        sessionIndex = index ?? "";
        break;

      case 'classdiag':
        ClassDiagIndex = index ?? "";
        break;
      case 'divisiondiag':
        DivisionDiagIndex = index ?? "";
        break;
      case 'admin':
        AdminDiagIndex = index ?? "";
        break;
    }
    update();
  }

  void updateList(String type, List<String> options) {
    switch (type) {
      case 'class':
        listClass = options;
        break;
      case 'division':
        listDivision = options;
        break;
      case 'classdiag':
        listClass = options;
        break;
      case 'divisiondiag':
        listDivision = options;
        break;
      case 'admin':
        listClassDiag = options;
        break;
    }
    update();
  }

  String get selectedClassIndex => gradeIndex;

  String get selectedDivisionIndex => sessionIndex;

  String get selectedClassDiagIndex => ClassDiagIndex;

  String get selectedDivisionDiagIndex => DivisionDiagIndex;

  String get selectedAdminDiagIndex => AdminDiagIndex;
}
