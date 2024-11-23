import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx/Link/Controller/AdminController/AdminHomeContentController.dart';
import 'package:getx/view/Admin/AllEmployee.dart';
import 'package:getx/view/Admin/AllGuardians.dart';
import 'package:getx/view/Admin/AllStudent.dart';
import 'package:getx/view/Admin/AppBarAdmin.dart';
import 'package:getx/view/Admin/Dashboardc/Admin_Dashboard.dart';
import 'package:getx/view/Admin/EmployeeAttendenceManage.dart';
import 'package:getx/view/Admin/EmployeeStatus.dart';
import 'package:getx/view/Admin/Employee_Manager/Virtual_User_Management.dart';
import 'package:getx/view/Admin/ExamTable.dart';
import 'package:getx/view/Admin/SchoolTimeTable.dart';
import 'package:getx/view/Admin/Requests.dart';
import 'package:getx/view/Admin/School_Management/Class_Pages/Class_Management.dart';
import 'package:getx/view/Admin/School_Management/Curriculum_Pages/Curriculum_Management.dart';
import 'package:getx/view/Admin/School_Management/Division_Pages/Division_Management.dart';
import 'package:getx/view/Admin/School_Management/Electronic_Pages/Electronic_Library.dart';
import 'package:getx/view/Admin/School_Management/Grade_Pages/Grade_Management.dart';
import 'package:getx/view/Admin/School_Management/School_Data/SchoolDataMGMT.dart';
import 'package:getx/view/Admin/School_Management/Sessions_Pages/Session_Management.dart';
import 'package:getx/view/Admin/SideBarAdmin.dart';
import 'package:getx/view/Admin/StudentStatus.dart';
import 'package:getx/view/Admin/StudentsAttendanceManagment.dart';
import 'package:getx/view/Admin/StudyYearStudent.dart';
import 'package:getx/view/Admin/TeacherAttendanceManagment.dart';
import 'package:getx/view/Admin/TeacherMangament.dart';
import 'package:getx/view/Admin/TeacherStatus.dart';

class AdminHome extends StatelessWidget {
  @override
  AdminHome({super.key});
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
                    case "Enroll Requests":
                      return Requests();
                    case "Exam Table":
                      return ExamTable();
                    case "Dashboard":
                      return AdminDashboard();
                    case "School Time Table":
                      return SchoolTimeTable();
                    case "All Students":
                      return AllStudent();
                    case "Study Year Students":
                      return StudyYearStudents();
                    case "All Guardians":
                      return AllGuardians();
                    case "Student Status":
                      return StudentStatus();
                    case "Teacher Management":
                      return TeacherManagement();
                    case "Teacher Status":
                      return TeacherStatus();
                    case "Employee Management":
                      return AllEmployee();
                    case "Employee Attendance":
                      return EmployeeStatus();
                    case "Employee Attendance Manage":
                      return EmployeeAttendanceManagment();
                    case "Teacher Attendance Managment":
                      return TeacherAttendanceManagment();
                    case "Students Attendance Managment":
                      return StudentsAttendanceManagment();
                    case "Grade Management":
                      return GradeManagement();
                    case "Class Management":
                      return ClassManagement();
                    case "Division Management":
                      return DivisionManagement();
                    case "Curriculum Management":
                      return Curriculum_Management();
                    case "Session Management":
                      return SessionManagement();

                    case "School Data Management":
                      return MyCheckBoxScreen();

                    case "Electronic Library":
                      return ElectronicBook();

                    case "Virtual User Management":
                      return Virtual_User_Management();

                    default:
                      return AdminDashboard();
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
