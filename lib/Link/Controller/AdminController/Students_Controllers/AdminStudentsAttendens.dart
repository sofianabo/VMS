import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:vms_school/Link/API/AdminAPI/Students/Students_APIs/IncreaseAttendanceAPI.dart';
import 'package:vms_school/Link/Model/AdminModel/Students_Models/Stu_Attendence.dart';

class Student_attendence_controller extends GetxController {
  var students = <Map<String, dynamic>>[].obs;
  List<Students>? AllStudents;
  List<String>? noAttendanceDatas;
  bool isLoading = true;
  bool isUploaded = true;

  String? filterName = '';
  String? title = '';

  List<String> gradelist = [];
  bool isGradeLoading = true;
  List<String> classlist = [];
  bool isClassLoading = true;
  List<String> divisionlist = [];
  bool isDivisionLoading = true;
  List<String> sessionlist = [];

  Rx<DateTime?> AttendencetDate = Rx<DateTime?>(null);
  Future<bool> selectDate({
    required BuildContext context,
    required List<String> allowedDates,
  }) async {
    if (allowedDates.isEmpty) return false; // التأكد من وجود تواريخ مسموح بها

    List<DateTime> parsedDates =
        allowedDates.map((date) => DateTime.parse(date)).toList();

    DateTime startDate = parsedDates.first;
    DateTime endDate = parsedDates.last;

    // تحديد التاريخ الافتراضي عند الفتح
    DateTime initialDate = AttendencetDate.value ??
        (parsedDates.contains(DateTime.now()) ? DateTime.now() : startDate);

    // التأكد أن التاريخ الافتراضي يقع ضمن النطاق المسموح به
    if (initialDate.isBefore(startDate)) {
      initialDate = startDate;
    } else if (initialDate.isAfter(endDate)) {
      initialDate = endDate;
    }

    final DateTime? picked = await showDatePicker(
      context: context,
      firstDate: startDate,
      lastDate: endDate,
      initialDate: initialDate,
      selectableDayPredicate: (date) {
        return parsedDates.contains(date);
      },
    );

    if (picked != null && parsedDates.contains(picked)) {
      AttendencetDate.value = picked;
      IncreaseAttendanceAPI(context)
          .GetIncreaseAttendance(DateTime: AttendencetDate.value.toString());
      return true;
    } else {
      return false;
    }
  }

  setGradeList(List<String> value) {
    gradeIndex = "";
    gradelist.clear();
    gradelist = value;
    setGradeLoading(false);
    update();
  }

  setClassList(List<String> value) {
    classIndex = "";
    classlist.clear();
    classlist = value;
    setClassLoading(false);
    update();
  }

  setDivisionList(List<String> value) {
    setDivisionLoading(false);
    divisionlist.clear();
    divisionIndex = "";
    divisionlist = value;
    update();
  }

  setGradeLoading(bool value) {
    isGradeLoading = value;
    update();
  }

  setClassLoading(bool value) {
    isClassLoading = value;
    classIndex = "";
    update();
  }

  setDivisionLoading(bool value) {
    isDivisionLoading = value;
    update();
  }

  resetOnGradeChange() {
    classIndex = "";
    divisionIndex = "";
    update();
  }

  clearChange() {
    gradeIndex = "";
    classIndex = "";
    divisionIndex = "";
    update();
  }

  resetOnclassChange() {
    divisionIndex = "";
    update();
  }

  setData(StuAttendence stud) {
    isUploaded = false;
    AllStudents = stud.students;
    noAttendanceDatas = stud.noAttendanceDatas;
    students.clear();
    if (stud.students!.isEmpty) {
      isUploaded = true;
    }
    for (var stu in AllStudents!) {
      students.add({
        'studentId': stu.id,
        'status': 'Present',
        'cause': null,
        'name': stu.fullName,
        'imgid': stu.fileId,
      });
    }
    setIsLoading(false);
    update();
  }

  setIsLoading(bool isload) {
    isLoading = isload;
    update();
  }

  setIsUploded(bool isload, String? Data) {
    isUploaded = isload;
    title = Data!.tr;
    update();
  }

  var allHolidayChecked = false.obs; // حالة ال Checkbox

  String gradeIndex = "";
  String classIndex = "";
  String divisionIndex = "";

  void selectIndex(String type, String? index) {
    switch (type) {
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

  void updateList(String type, List<String> options) {
    switch (type) {
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

  String get selectedgradeIndex => gradeIndex;

  String get selectedclassIndex => classIndex;

  String get selecteddivisionIndex => divisionIndex;

  void updateStatus(int index, String newStatus, String? cause) {
    students[index]['status'] = newStatus;
    students[index]['cause'] = cause;
    students.refresh();
    checkAllHolidayStatus();
  }

  void setAllAsHoliday(bool checked, String? holiday) {
    allHolidayChecked.value = checked;
    for (var item in students) {
      item['status'] = checked ? 'Holiday' : 'Present';
      item['cause'] = checked ? holiday : null;
    }
    students.refresh();
  }

  void checkAllHolidayStatus() {
    allHolidayChecked.value =
        students.every((item) => item['status'] == 'Holiday');
  }

  void removeAttendence() {
    AttendencetDate.value = DateTime.now();
  }
}
