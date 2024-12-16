import 'package:get/get.dart';
import 'package:vms_school/Link/Model/AdminModel/School_Models/Classes_Model.dart';

class ClassMgmtController extends GetxController {

  var Class = <Map<String, dynamic>>[].obs;

  bool isLoading = true;

  var grades;

  List<Classes>? classes;

  List<Classes>? filteredreclasses = [];


  setGeidx(vale){
     grades = vale;
     update();
  }

  addGradeList(List<String> values){
    listgradeDiag = values;
    listgradeNormal = values;
    update();
  }


  addAdminList(List<String> values){
    listAdminDiag = values;
    update();
  }

  SetClasses(Classes_Model cls){
   classes = cls.classes;
   Class.clear();

   filteredreclasses = List.from(classes!);

   if (gradeIndex.isNotEmpty) {
     filteredreclasses = filteredreclasses!.where((emp) {
       return emp.grade!.enName == gradeIndex || emp.grade!.name == gradeIndex;
     }).toList();
   }


   for (var stu in cls.classes!) {
     Class.add({
       "id": stu.id,
       "arName": stu.name,
       "enName": stu.enName,
       "argrade": stu.grade!.name,
       "engrade": stu.grade!.enName,
       "session": stu.session!.year,
       "admin": stu.admin!.userName,
       "drive": stu.driveUrl,
     });
   }
   SetIsLoading(false);
   update();
  }






  void searchRequestByName(String gradeindexed) {
    List<Classes> tempFilteredList = List.from(classes!);

    if (gradeindexed.isNotEmpty) {
      tempFilteredList = tempFilteredList.where((emp) {
        return emp.grade!.name == gradeindexed || emp.grade!.enName == gradeindexed ;
      }).toList();
    }

    filteredreclasses = tempFilteredList;
    update();
  }




  addData(String arName, String enName, String drive) {
    Class.addAll([
      {
        "arName": "$arName",
        "enName": "$enName",
        "engrade": "$selectedgradeDiagIndex",
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



  String gradeIndex = "";
  String sessionIndex = "";
  String gradeDiagIndex = "";
  String sessionDiagIndex = "";
  String AdminDiagIndex = "";
  String editeGradeIndex = "";
  String editeSessionIndex = "";
  String editeAdminIndex = "";

  List<String> listgradeNormal = [
  ];

  List<String> listsessionNormal = [
  ];

  List<String> listgradeDiag = [

  ];

  List<String> listsessionDiag = [

  ];

  List<String> listAdminDiag = [

  ];

  List<String> editeGrade = [

  ];

  List<String> editeSession = [

  ];

  List<String> editeAdmin = [

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

    if(type == "grade"){
      searchRequestByName(gradeIndex);
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

  void SetIsLoading(bool value) {
    isLoading = value;
    update();
  }
}
