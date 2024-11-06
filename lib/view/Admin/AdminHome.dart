// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx/Controller/AdminController/AdminHomeContentController.dart';
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
import 'package:getx/view/Admin/TeacherMangament.dart';
import 'package:getx/view/Admin/TeacherQuorum.dart';
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
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SideBarAdmin(),
              GetBuilder<AdminHomeContentController>(builder: (cont) {
                return cont.content == "enroll requests"
                    ? Requests()
                    : cont.content == "Exam Table"
                        ? ExamTable()
                        : cont.content == "School Time Table"
                            ? SchoolTimeTable()
                            : cont.content == "All Students"
                                ? AllStudent()
                                : cont.content == "Study Year Students"
                                    ? const StudyTearStudents()
                                    : cont.content == "All Guardians"
                                        ? AllGuardians()
                                        : cont.content == "Student Status"
                                            ? const StudentStatus()
                                            : cont.content ==
                                                    "Teacher Management"
                                                ? TeacherManagement()
                                                : cont.content ==
                                                        "Teacher Status"
                                                    ? const TeacherStatus()
                                                    : cont.content ==
                                                            "All Employee"
                                                        ? AllEmployee()
                                                        : cont.content ==
                                                                "Employee Status"
                                                            ? const EmployeeStatus()
                                                            : cont.content ==
                                                                    "Teacher Quorum"
                                                                ? TeacherQuorum()
                                                                : Container();
              })
            ],
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
