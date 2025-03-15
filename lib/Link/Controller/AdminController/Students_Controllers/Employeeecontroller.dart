import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vms_school/Link/API/AdminAPI/Employees_APIs/IncreaseEmployeAttendenceAPI.dart';
import 'package:vms_school/Link/API/AdminAPI/Teacher_APIS/IncreaseTeacherAttendenceAPI.dart';
import 'package:vms_school/Link/Model/AdminModel/IncreaseEmpolyeeAttendenceModel.dart';
import 'package:vms_school/Link/Model/AdminModel/IncreaseTeacherAttendenceModel.dart';

class EmployeeController extends GetxController {
  bool Isloading = true;

  List<Employee>? employees;
  List<Teacher>? teachers;
  List<String>? AttendanceDateEmployee;
  List<String>? AttendanceDateTeacher;

  var Employees = <Map<String, dynamic>>[].obs;

  setData(IncreaseEmpolyeeAttendenceModel employee) {
    employees = employee.employee;
    Employees.clear();
    AttendanceDateEmployee = employee.noAttendanceDatas;
    for (var emp in employees!) {
      Employees.add({
        'employeeId': emp.id!,
        'status': 'Present',
        'cause': null,
        'name': emp.fullName!,
        'imgid': emp.imageId ?? "",
      });
    }
    setIsload(false);
    update();
  }

  setTeacherData(IncreaseTeacherAttendenceModel teach) {
    teachers = teach.teacher;
    Employees.clear();
    AttendanceDateTeacher = teach.noAttendanceDatas;
    for (var t in teachers!) {
      Employees.add({
        'employeeId': t.id!,
        'status': 'Present',
        'cause': null,
        'name': t.fullName!,
        'imgid': t.imageId ?? "",
      });
    }
    setIsload(false);
    update();
  }

  setIsload(bool value) {
    Isloading = value;
    update();
  }

  var allHolidayChecked = false.obs;

  void updateStatus(int index, String newStatus, String? cause) {
    Employees[index]['cause'] = cause;
    Employees[index]['status'] = newStatus;
    Employees.refresh();
    checkAllHolidayStatus();
  }

  void setAllAsHoliday(bool checked, String? holiday) {
    allHolidayChecked.value = checked;
    for (var item in Employees) {
      item['status'] = checked ? 'Holiday' : 'Present';
      item['cause'] = checked ? holiday : null;
    }

    Employees.refresh();
  }

  void checkAllHolidayStatus() {
    allHolidayChecked.value =
        Employees.every((item) => item['status'] == 'Holiday');
  }

  Rx<DateTime?> AttendencetDate = Rx<DateTime?>(null);
  Future<bool> selectDate({
    required BuildContext context,
    required List<String> allowedDates,
    required String type,
  }) async {
    if (allowedDates.isEmpty) return false; // التأكد من وجود تواريخ مسموح بها

    List<DateTime> parsedDates =
        allowedDates.map((date) => DateTime.parse(date)).toList();

    DateTime startDate = parsedDates.first;
    DateTime endDate = parsedDates.last;

    DateTime initialDate = AttendencetDate.value ??
        (parsedDates.contains(DateTime.now()) ? DateTime.now() : startDate);

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
      if (type == "teacher") {
        Increaseteacherattendenceapi.Increaseteacherattendence(
            DateTime: AttendencetDate.value.toString());
      } else {
        Increaseemployeattendenceapi.Increaseemployeattendence(
            DateTime: AttendencetDate.value.toString());
      }
      return true;
    } else {
      return false;
    }
  }

  void removeAttendence() {
    AttendencetDate.value = DateTime.now();
  }

  void Doneupload() {
    employees?.clear();
    teachers?.clear();
    update();
  }
}
