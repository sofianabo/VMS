import 'package:get/get.dart';
import 'package:vms_school/Link/Controller/AdminController/School_Controllers/Admin_School_Time.dart';
import 'package:vms_school/Link/Controller/AdminController/School_Controllers/Teachernote_and_GradeReco.dart';
import 'package:vms_school/Link/Controller/AdminController/Students_Controllers/Add_Students_Controller.dart';
import 'package:vms_school/Link/Controller/AdminController/Students_Controllers/AdminStudentsAttendens.dart';
import 'package:vms_school/Link/Controller/AdminController/Students_Controllers/AllStudentsController.dart';
import 'package:vms_school/Link/Controller/AdminController/Students_Controllers/Student_Attendenc_Controller.dart';
import 'package:vms_school/Link/Controller/AdminController/Students_Controllers/StudyYearStudentsController.dart';
import 'package:vms_school/Link/Controller/AdminController/Teacher_Controllers/AllTeacherAtendenceController.dart';
import 'package:vms_school/Link/Controller/AdminController/Teacher_Controllers/AllTeachersController.dart';
import 'package:vms_school/Link/Model/AdminModel/AllClassesModel.dart';
import 'package:vms_school/Link/Model/AdminModel/School_Models/Division_Model.dart';
import 'package:vms_school/Translate/local_controller.dart';
import 'package:vms_school/main.dart';

class Divisions_Controller extends GetxController {
  List<Map<String, dynamic>> Divisions = [];

  AllClassModel? Classmodel;
  List<Division>? division;
  List<Division>? filteredDivision;

  String ClassIndex = "";
  String ClassDiagIndex = "";

  var dropclasses;
  var dropDiagClasses;
  SetClassIdx(vale) {
    dropclasses = vale;
    update();
  }

  SetClassDiagIdx(vale) {
    dropDiagClasses = vale;
    update();
  }

  addclassList(List<String> values) {
    listClass.clear();
    listClass = values;
    listClassDiag = values;
    update();
  }

  void setClass(AllClassModel cls) {
    Classmodel = cls;
    List<String> classess = [];
    if (cls.classes != null) {
      for (var g in cls.classes!) {
        if (prefs!.getString(languageKey) == 'ar')
          classess.add(g.name.toString());
        else
          classess.add(g.enName.toString());
      }
    }
    addclassList(classess);
    SetIsloading(false);
    Get.find<Allstudentscontroller>().setClassList(classess);
    Get.find<StudyYearStudentsController>().setClassList(classess);
    Get.find<Student_attendence_controller>().setClassList(classess);
    Get.find<Allteachercontroller>().SetClass(classess);
    Get.find<Allteacheratendencecontroller>().SetClass(classess);
    Get.find<StudentAttendencController>().setClassList(classess);
    Get.find<Add_Students_Controller>().SetClasslist(classess);
    Get.find<AdminSchoolTimeController>().SetClasslist(classess);
    Get.find<TeachernoteAndGradeReco>().SetClass(cls);
    update();
  }

  List<String> listClass = [];

  List<String> listClassDiag = [];

  void selectIndex(String type, String? index) {
    switch (type) {
      case 'class':
        ClassIndex = index ?? "";
        break;
      case 'classDiag':
        ClassDiagIndex = index ?? "";
        break;
    }
    if (type == "class") {
      print(ClassIndex);
      searchRequestByName(ClassIndex);
    }
    update();
  }

  void updateList(String type, List<String> options) {
    switch (type) {
      case 'class':
        listClass = options;
        break;
      case 'classDiag':
        listClassDiag = options;
        break;
    }
    update();
  }

  String get selectClassIndex => ClassIndex;

  String get selectClassDiagIndex => ClassDiagIndex;
  bool isLoading = true;

  bool Isapiloading = true;
  void SetIsloading(bool value) {
    isLoading = value;
    update();
  }

  void SetIsapiloading(bool value) {
    Isapiloading = value;
    update();
  }

  setDivisions(Division_Model allDivisionModel) {
    Divisions.clear();
    division = allDivisionModel.division;
    filteredDivision = List.from(division!);

    if (ClassIndex.isNotEmpty) {
      filteredDivision = filteredDivision!.where((emp) {
        return emp.classes!.enName == ClassIndex ||
            emp.classes!.enName == ClassIndex;
      }).toList();
    }

    for (var div in division!) {
      Divisions.add({
        'arName': div.name.toString(),
        'enName': div.enName.toString(),
        'classname': div.classes!.name.toString(),
        'classenname': div.classes!.enName.toString(),
        'meet': div.meetUrl.toString(),
        'hasStudent': div.hasStudent,
      });
    }
    SetIsapiloading(false);
    update();
  }

  void searchRequestByName(String classindexed) {
    List<Division> tempFilteredList = List.from(division!);

    if (classindexed.isNotEmpty) {
      tempFilteredList = tempFilteredList.where((cls) {
        return cls.classes!.name == classindexed ||
            cls.classes!.enName == classindexed;
      }).toList();
    }

    filteredDivision = tempFilteredList;
    update();
  }

  bool IsennameError = false;
  bool IsarnameError = false;
  bool IsclassError = false;
  bool IsmeetError = false;

  void updateFieldError(String type, bool newValue) {
    switch (type) {
      case 'ename':
        IsennameError = newValue;
        break;
      case 'arname':
        IsarnameError = newValue;
        break;
      case 'class':
        IsclassError = newValue;
        break;
      case 'meet':
        IsmeetError = newValue;
        break;

      default:
        print("Error: Invalid type");
    }
    update();
  }
}
