import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:vms_school/Link/Model/AdminModel/AllClassesModel.dart';
import 'package:vms_school/Link/Model/AdminModel/AllDivisionModel.dart';
import 'package:vms_school/Link/Model/AdminModel/AllSessionModel.dart';
import 'package:vms_school/Link/Model/AdminModel/AllTeacherAttendenceModel.dart';
import 'package:vms_school/Link/Model/AdminModel/School_Models/AllGradeModel.dart';

class Allteacheratendencecontroller extends GetxController {
  late BuildContext context;
  List<Teacherattendance> teacher = [];
  List<Teacherattendance> filteredteacher = [];
  String sessionIndex = "";
  bool isLoading = true;
  List<String> sessionlist = [];

  void restor() {
    teacher.clear();
    filteredteacher.clear();
    isLoading = true;
    update();
  }

  void selectIndex(String type, String? index) {
    print("");

    switch (type) {
      case 'session':
        sessionIndex = index ?? "";
        break;
    }
    update();
  }

  void setAllteachers(AllTeacherAttendenceModel model) {
    teacher = model.teacherattendance!;
    filteredteacher = List.from(teacher);
    setIsLoading(false);
    update();
  }

  setIsLoading(bool value) {
    isLoading = value;
    update();
  }

  void searchattendenceByName(String query) {
    if (query.isEmpty) {
      filteredteacher = List.from(teacher);
    } else {
      filteredteacher = teacher
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

  void updateList(
    String type,
    List<String> options,
  ) {
    switch (type) {
      case 'session':
        sessionlist = options;
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

  Rx<DateTime?> get selectDateindex => AttendencetDate;
}
