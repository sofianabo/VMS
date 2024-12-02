import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:vms_school/Link/Model/AdminModel/AllClassesModel.dart';
import 'package:vms_school/Link/Model/AdminModel/AllDivisionModel.dart';
import 'package:vms_school/Link/Model/AdminModel/AllSessionModel.dart';
import 'package:vms_school/Link/Model/AdminModel/AllStudentAttendenceModel.dart';
import 'package:vms_school/Link/Model/AdminModel/School_Models/AllGradeModel.dart';


class StudentAttendencController extends GetxController {
  late BuildContext context;
  List<Attendance> stud = [];
  List<Attendance> filteredStudents = [];
  String sessionIndex = "";
  String gradeIndex = "";
  String classIndex = "";
  String divisionIndex = "";
  bool isLoading = true;
  List<String> gradelist = [];
  List<String> classlist = [];
  List<String> divisionlist = [];
  List<String> sessionlist = [];

    void restor() {
    stud.clear();
    filteredStudents.clear();
    isLoading = true;
    update();
  }
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
    update();
  }

  void setAllStudents(AllStudentAttendenceModel model) {
    stud = model.attendance!;
    filteredStudents = List.from(stud);
    setIsLoading(false);
    update();
  }

  setIsLoading(bool value) {
    isLoading = value;
    update();
  }

  void searchattendenceByName(String query) {
    if (query.isEmpty) {
      filteredStudents = List.from(stud);
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

    Rx<DateTime?> AttendencetDate = Rx<DateTime?>(null);

  void selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: AttendencetDate.value ?? DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
    );
    if (picked != null) {
      AttendencetDate.value = picked;
    }
  }

  String get selectedsessionIndex => sessionIndex;

  String get selectedgradeIndex => gradeIndex;

  String get selectedclassIndex => classIndex;

  String get selecteddivisionIndex => divisionIndex;

    Rx<DateTime?> get selectDateindex => AttendencetDate;

}
