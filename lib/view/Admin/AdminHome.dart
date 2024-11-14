// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx/Link/API/AdminAPI/GetAllGuardiansAPI.dart';
import 'package:getx/Link/API/AdminAPI/GetAllStudentAPI.dart';
import 'package:getx/Link/API/AdminAPI/GetAllTeachersAPI.dart';
import 'package:getx/Link/Controller/AdminController/AdminHomeContentController.dart';
import 'package:getx/view/Admin/AllEmployee.dart';
import 'package:getx/view/Admin/AllGuardians.dart';
import 'package:getx/view/Admin/AllStudent.dart';
import 'package:getx/view/Admin/AppBarAdmin.dart';
import 'package:getx/view/Admin/EmployeeStatus.dart';
import 'package:getx/view/Admin/ExamTable.dart';
import 'package:getx/view/Admin/SchoolTimeTable.dart';
import 'package:getx/view/Admin/Requests.dart';
import 'package:getx/view/Admin/SideBarAdmin.dart';
import 'package:getx/view/Admin/StudentStatus.dart';
import 'package:getx/view/Admin/StudyYearStudent.dart';
import 'package:getx/view/Admin/TeacherAttendanceManagment.dart';
import 'package:getx/view/Admin/TeacherMangament.dart';
import 'package:getx/view/Admin/TeacherStatus.dart';

class AdminHome extends StatelessWidget {
  @override
  AdminHome({super.key});
  final adminC = Get.find<AdminHomeContentController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const AppbarAdmin(),
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SideBarAdmin(),
                GetBuilder<AdminHomeContentController>(builder: (cont) {
                  switch (cont.content) {
                    case "enroll requests":
                      return Requests();
                    case "Exam Table":
                      return ExamTable();
                    case "School Time Table":
                      return SchoolTimeTable();
                    case "All Students":
                      Getallstudentapi(context).Getallstudent();
                      return AllStudent();
                    case "Study Year Students":
                      return StudyTearStudents();
                    case "All Guardians":
                      GetAllGuardiansAPI(context).getAllGuardian();
                      return AllGuardians();
                    case "Student Status":
                      return StudentStatus();
                    case "Teacher Management":
                      Getallteachersapi(context).Getallteachers();
                      return TeacherManagement();
                    case "Teacher Status":
                      return TeacherStatus();
                    case "All Employee":
                      return AllEmployee();
                    case "Employee Status":
                      return const EmployeeStatus();
                    case "Teacher Attendance Managment":
                      return TeacherAttendanceManagment();
                    default:
                      return Container();
                  }
                })
              ],
            ),
          ),
          // Container(
          //   width: Get.width,
          //   child: GetBuilder<UserController>(
          //     builder: (userController) {
          //       return Text(userController.roll);
          //     },
          //   ),
          // ),
        ],
      ),
    );
  }
}
