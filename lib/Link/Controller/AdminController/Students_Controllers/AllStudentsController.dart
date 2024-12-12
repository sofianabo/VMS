import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:vms_school/Link/Model/AdminModel/AllClassesModel.dart';
import 'package:vms_school/Link/Model/AdminModel/AllDivisionModel.dart';
import 'package:vms_school/Link/Model/AdminModel/AllSessionModel.dart';
import 'package:vms_school/Link/Model/AdminModel/AllStudentModel.dart';
import 'package:vms_school/Link/Model/AdminModel/School_Models/AllGradeModel.dart';


class Allstudentscontroller extends GetxController {
  late BuildContext context;
  List<Students> stud = [];
  String? Value;
  List<Students> filteredStudents = [];
  String sessionIndex = "";
  String gradeIndex = "";
  String classIndex = "";
  String divisionIndex = "";
  bool isLoading = true;
  List<String> gradelist = ["first", "tow", "three"];
  List<String> classlist = [];
  List<String> divisionlist = ["one"];
  List<String> sessionlist = [];

  void selectIndex(String type, String? index) {
    print("");

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
    }

    if(type == "grade" && Value!=null){
      searchStudentByName(Value!,gradeIndex);
    }else if(type == "grade" && Value ==null) {
      searchStudentByName("",gradeIndex);
    }

    update();
  }

  void setAllStudents(AllStudentModel model) {
    stud = model.students!;
    filteredStudents = List.from(stud);
    if (Value != null && Value!.isNotEmpty) {
      searchStudentByName(Value.toString(), gradeIndex);
    }

    if (gradeIndex.isNotEmpty) {
      filteredStudents = filteredStudents.where((emp) {
        return emp.enName == gradeIndex;
      }).toList();
    }

    setIsLoading(false);
    update();
  }

  setIsLoading(bool value){
    isLoading = value;
    update();
  }



  void searchStudentByName(String query, String grade) {
    List<Students> tempFilteredList = List.from(stud);
    if (query != null && query.isNotEmpty) {
      tempFilteredList = tempFilteredList.where((st) {
        final empFullName = st.fullName?.toLowerCase() ?? '';
        final mobile = st.mobileNumber?.toLowerCase() ?? '';
        final email = st.email?.toLowerCase() ?? '';
        return email.contains(query.toLowerCase()) ||
            empFullName.contains(query.toLowerCase())|| mobile.contains(query.toLowerCase());
      }).toList();
    }

    if (grade.isNotEmpty) {
      tempFilteredList = tempFilteredList.where((emp) {
        return emp.enName == grade;
      }).toList();
    }

    filteredStudents = tempFilteredList;
    update();
  }







  void setAllSession(AllSessionModel session) async {
    sessionlist.clear();
    for (int i = 0; i < session.sessions!.length; i++) {
      sessionlist.add(session.sessions![i].year.toString());
    }
    update();
    updateList("session", sessionlist);
  }

  void setAllClasses(AllClassModel clas) {
    classlist.clear();
    for (int j = 0; j < clas.classes!.length; j++) {
      classlist.add(clas.classes![j].enName.toString());
    }
    update();
    updateList("class", classlist);
  }

  void setAllGrades(AllGradesModel grade) {
    gradelist.clear();
    for (int k = 0; k < grade.grades!.length; k++) {
      gradelist.add(grade.grades![k].enName.toString());
    }
    update();
    updateList("grade", gradelist);
  }

  void setAllDivision(AllDivisionModel division) {
    divisionlist.clear();
    for (int k = 0; k < division.division!.length; k++) {
      divisionlist.add(division.division![k].enName.toString());
    }
    update();
    updateList("division", divisionlist);
  }

  void updateList(
    String type,
    List<String> options,
  ) {
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
    }
    update();
  }

  String get selectedsessionIndex => sessionIndex;

  String get selectedgradeIndex => gradeIndex;

  String get selectedclassIndex => classIndex;

  String get selecteddivisionIndex => divisionIndex;
}
