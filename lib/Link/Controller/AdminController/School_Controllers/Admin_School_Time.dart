import 'package:get/get.dart';
import 'package:vms_school/Link/Model/AdminModel/AllClassesModel.dart';
import 'package:vms_school/Link/Model/AdminModel/AllDivisionModel.dart';
import 'package:vms_school/Link/Model/AdminModel/AllTeacherModel.dart';
import 'package:vms_school/Link/Model/AdminModel/DropDownCuriculmModel.dart';
import 'package:vms_school/Link/Model/AdminModel/SchoolTimeModel.dart';
import 'package:vms_school/Link/Model/AdminModel/School_Models/Curriculum_Model.dart';

class AdminSchoolTimeController extends GetxController {
  String examClassIndex = "";
  String examDivisionIndex = "";
  String classDialogIndex = "";
  String divisionDialogIndex = "";
  String subjectDialogIndex = "";
  String teacherDialogIndex = "";

  List<String> examClass = [];
  List<String> examDivision = [];
  List<Division>? allDivision;
  List<String> classDialogList = [];
  List<String> divisionDialogList = [];
  List<String> subjectDialogList = [];
  List<String> teacherDialogList = [];
  List<StudyShare> studyshare = [];
  bool isLoading = true;

  void setStudyShare(SchoolTimeModel model) {
    studyshare = model.studyShare!;
    setIsLoading(false);

    update();
  }

  setIsLoading(bool value) {
    isLoading = value;
    update();
  }

  void selectIndex(String type, String? index) {
    switch (type) {
      case 'class':
        examClassIndex = index ?? "";
        break;
      case 'division':
        examDivisionIndex = index ?? "";
        break;
      case 'classDialog':
        classDialogIndex = index ?? "";
        break;
      case 'divisionDialog':
        divisionDialogIndex = index ?? "";
        break;
      case 'subjectDialog':
        subjectDialogIndex = index ?? "";
        break;
      case 'teacherDialog':
        teacherDialogIndex = index ?? "";
        break;
    }
    update();
  }

  void setAllClasses(AllClassModel clas) {
    examClass.clear();
    for (int j = 0; j < clas.classes!.length; j++) {
      examClass.add(clas.classes![j].enName.toString());
    }
    update();
    updateList("class", examClass);
  }

  void setAllClassesDialog(AllClassModel clas) {
    classDialogList.clear();
    for (int j = 0; j < clas.classes!.length; j++) {
      classDialogList.add(clas.classes![j].enName.toString());
    }
    update();
    updateList("classDialog", classDialogList);
  }

  void setAllDivision(AllDivisionModel division) {
    examDivision.clear();
    allDivision = division.division;
    for (int j = 0; j < division.division!.length; j++) {
      examDivision.add(division.division![j].enName.toString());
    }
    update();
    updateList("division", examDivision);
  }

  void setAllDivisionDialog(AllDivisionModel division) {
    divisionDialogList.clear();
    for (int j = 0; j < division.division!.length; j++) {
      divisionDialogList.add(division.division![j].enName.toString());
    }
    update();
    updateList("divisionDialog", divisionDialogList);
  }

  void setAllTeacherDialog(AllTeacherModel teach) {
    teacherDialogList.clear();
    for (int j = 0; j < teach.teachers!.length; j++) {
      teacherDialogList.add(teach.teachers![j].fullName.toString());
    }
    update();
    updateList("teacherDialog", teacherDialogList);
  }

  void setAllSubjectDialog(DropDowmCuriculmModel curr) {
    subjectDialogList.clear();
    for (int j = 0; j < curr.curriculum!.length; j++) {
      subjectDialogList.add(curr.curriculum![j].name.toString());
    }

    update();
    updateList("subjectDialog", subjectDialogList);
  }

  void updateList(String type, List<String> options) {
    switch (type) {
      case 'class':
        examClass = options;
        break;
      case 'division':
        examDivision = options;
        break;
      case 'classDialog':
        classDialogList = options;
        break;
      case 'divisionDialog':
        divisionDialogList = options;
        break;
      case 'teacherDialog':
        teacherDialogList = options;
        break;
      case 'subjectDialog':
        subjectDialogList = options;
        break;
    }
    update();
  }

  String get selectedExamClass => examClassIndex;

  String get selectedExamDivision => examDivisionIndex;
  String get selectedDivisionDialog => divisionDialogIndex;
  String get selectedClassDialog => classDialogIndex;
  String get selectedSubjectDialog => subjectDialogIndex;
  String get selectedTeacherDialog => teacherDialogIndex;
}
