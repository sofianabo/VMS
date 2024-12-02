import 'package:get/get.dart';
import 'package:vms_school/Link/Model/AdminModel/AllClassesModel.dart';
import 'package:vms_school/Link/Model/AdminModel/AllDivisionModel.dart';
import 'package:vms_school/Link/Model/AdminModel/AllGradeModel.dart';
import 'package:vms_school/Link/Model/AdminModel/AllPenaltyModel.dart';
import 'package:vms_school/Link/Model/AdminModel/AllSessionModel.dart';
import 'package:vms_school/Link/Model/AdminModel/AllStudyYearModel.dart';

class StudyYearStudentsController extends GetxController {
  String sessionIndex = "";
  String gradeIndex = "";
  String classIndex = "";
  String divisionIndex = "";
  String penaltyIndex = "";
  bool isLoading = true;

  List<String> sessionlist = [];
  List<String> gradelist = [];
  List<String> classlist = [];
  List<String> divisionlist = [];
  List<String> penaltyList = [];
    List<Students> stud = [];
  List<Students> filteredStudents = [];

  void selectIndex(String type, String? index) {
    switch (type) {
      case 'session':
        sessionIndex = index ?? "";
        break;
      case 'grade':
        gradeIndex = index ?? "";
        break;
      case 'class': 
        classIndex = index ?? "";
        break;
      case 'division':
        divisionIndex = index ?? "";
        break;
      case 'penalty':
        penaltyIndex = index ?? "";
        break;
    }
    update();
  }

  
  void setAllStudents(AllStudyYearModel model) {
    stud = model.students!;
    filteredStudents = List.from(stud);
    setIsLoading(false);
    update();
  }

   setIsLoading(bool value){
    isLoading = value;
    update();
  }
  void searchStudentByName(String query) {
    if (query.isEmpty) {
      filteredStudents =
          List.from(stud);
    } else {
      filteredStudents = stud
          .where((student) =>
              student.fullName != null &&
              student.fullName!.toLowerCase().contains(query.toLowerCase()))
          .toList();
    }
    update();
  }

  void setAllSession(AllSessionModel session) async {
    sessionlist.clear();
    for (int i = 0; i < session.sessions!.length; i++) {
      sessionlist.add(session.sessions![i].year.toString());
      print(session.sessions![i].year.toString());
    }
    update();
    updateList("session", sessionlist);
  }

  void setAllClasses(AllClassesModel clas) {
    classlist.clear();
    for (int j = 0; j < clas.classes.length; j++) {
      classlist.add(clas.classes[j].enName.toString());
    }
    update();
    updateList("class", classlist);
  }

  void setAllGrades(AllGradesModel grade) {
    gradelist.clear();
    for (int j = 0; j < grade.grades!.length; j++) {
      gradelist.add(grade.grades![j].enName.toString());
    }
    update();
    updateList("grade", gradelist);
  }

  void setAllDivision(AllDivisionModel division) {
    divisionlist.clear();
    for (int j = 0; j < division.division!.length; j++) {
      divisionlist.add(division.division![j].enName.toString());
    }
    update();
    updateList("division", divisionlist);
  }

  void setAllPenalty(AllPenaltyModel penalty) {
    penaltyList.clear();
    for (int j = 0; j < penalty.penalty!.length; j++) {
      penaltyList.add(penalty.penalty![j].type.toString());
    }
    update();
    updateList("penalty", penaltyList);
  }

  void updateList(String type, List<String> options) {
    switch (type) {
      case 'session':
        sessionlist = options;
        break;
      case 'grade':
        gradelist = options;
        break;
      case 'class':
        classlist = options;
        break;
      case 'division':
        divisionlist = options;
        break;
      case 'penalty':
        penaltyList = options;
        break;
    }
    update();
  }

  String get selectedsessionIndex => sessionIndex;

  String get selectedgradeIndex => gradeIndex;

  String get selectedclassIndex => classIndex;

  String get selecteddivisionIndex => divisionIndex;

  String get selectedPenaltyIndex => penaltyIndex;
}
