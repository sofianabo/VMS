import 'package:get/get.dart';

class ClassMgmtController extends GetxController {
  List<Map<String, dynamic>> Classes = [
    {
      "arName": "الصف الأول",
      "enName": "First Class",
      "grade": "Twelfth Scientific Grade",
      "session": "First Semester",
      "admin": "System Administration",
      "drive": "https://192.168.1.1",
    },
  ];

  addData(String arName, String enName, String drive) {
    Classes.addAll([
      {
        "arName": "$arName",
        "enName": "$enName",
        "grade": "$selectedgradeDiagIndex",
        "session": "$selectedsessionDiagIndex",
        "admin": "$selectedAdminDiagIndex",
        "drive": "$drive",
      }
    ]);
    gradeDiagIndex = "";
    sessionDiagIndex = "";
    AdminDiagIndex = "";
    update();
  }

  deleteclass(int idx) {
    Classes.removeAt(idx);
    update();
  }

  updatedata(int idx, String arName, String enName, String drive) {
    Classes[idx] = {
      "arName": "$arName",
      "enName": "$enName",
      "grade": "$editeGradeIndexs",
      "session": "$editeSessionIndexs",
      "admin": "$editeAdminIndexs",
      "drive": "$drive",
    };
    update();
  }

  String gradeIndex = "";
  String sessionIndex = "";
  String gradeDiagIndex = "";
  String sessionDiagIndex = "";
  String AdminDiagIndex = "";
  String editeGradeIndex = "";
  String editeSessionIndex = "";
  String editeAdminIndex = "";

  List<String> listgradeNormal = [
    "Twelfth Scientific Grade",
    "Eleventh Scientific Grade",
    "Tenth Scientific Grade",
    "Ninth Scientific Grade",
    "Eighth Scientific Grade",
    "Seventh Scientific Grade"
  ];

  List<String> listsessionNormal = [
    "First Semester",
    "Second Semester",
    "Summer Session"
  ];

  List<String> listgradeDiag = [
    "Twelfth Scientific Grade",
    "Eleventh Scientific Grade",
    "Tenth Scientific Grade",
    "Ninth Scientific Grade",
    "Eighth Scientific Grade",
    "Seventh Scientific Grade"
  ];

  List<String> listsessionDiag = [
    "First Semester",
    "Second Semester",
    "Summer Session"
  ];

  List<String> listAdminDiag = [
    "System Administration",
    "Content Management",
    "User Management"
  ];

  List<String> editeGrade = [
    "Twelfth Scientific Grade",
    "Eleventh Scientific Grade",
    "Tenth Scientific Grade",
    "Ninth Scientific Grade",
    "Eighth Scientific Grade",
    "Seventh Scientific Grade"
  ];

  List<String> editeSession = [
    "First Semester",
    "Second Semester",
    "Summer Session"
  ];

  List<String> editeAdmin = [
    "System Administration",
    "Content Management",
    "User Management"
  ];

  void selectIndex(String type, String? index) {
    switch (type) {
      case 'grade':
        gradeIndex = index ?? "";
        break;
      case 'session':
        sessionIndex = index ?? "";
        break;
      case 'gradediag':
        gradeDiagIndex = index ?? "";
        break;
      case 'sessiondag':
        sessionDiagIndex = index ?? "";
        break;
      case 'admin':
        AdminDiagIndex = index ?? "";
        break;
      case 'editeGrade':
        editeGradeIndex = index ?? "";
        break;
      case 'editeSession':
        editeSessionIndex = index ?? "";
        break;
      case 'editeAdmin':
        editeAdminIndex = index ?? "";
        break;
    }
    update();
  }

  void updateList(String type, List<String> options) {
    switch (type) {
      case 'grade':
        listgradeNormal = options;
        break;
      case 'session':
        listsessionNormal = options;
        break;
      case 'gradediag':
        listgradeDiag = options;
        break;
      case 'sessiondag':
        listsessionDiag = options;
        break;
      case 'admin':
        listAdminDiag = options;
        break;

      case 'editeGrade':
        editeGrade = options;
        break;

      case 'editeSession':
        editeSession = options;
        break;

      case 'editeAdmin':
        editeAdmin = options;
        break;
    }
    update();
  }

  String get selectedgradeIndex => gradeIndex;

  String get selectedsessionIndex => sessionIndex;

  String get selectedgradeDiagIndex => gradeDiagIndex;

  String get selectedsessionDiagIndex => sessionDiagIndex;

  String get selectedAdminDiagIndex => AdminDiagIndex;

  String get editeGradeIndexs => editeGradeIndex;

  String get editeSessionIndexs => editeSessionIndex;

  String get editeAdminIndexs => editeAdminIndex;
}
