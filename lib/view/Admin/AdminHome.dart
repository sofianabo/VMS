import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vms_school/Link/API/AdminAPI/Get_My_Profile.dart';
import 'package:vms_school/Link/Controller/AdminController/Employee_Controllers/Add_Data_controller.dart';
import 'package:vms_school/Link/Controller/AdminController/Main_Admin_Controller/AdminHomeContentController.dart';
import 'package:vms_school/Link/Controller/AdminController/Main_Admin_Controller/Admin_Profile_Content.dart';
import 'package:vms_school/main.dart';
import 'package:vms_school/view/Admin/All_Settings/Profile_Settings.dart';
import 'package:vms_school/view/Admin/All_Settings/Verifing_Code_Dialog.dart';
import 'package:vms_school/view/Admin/School_Management/ExamTable.dart';
import 'package:vms_school/view/Admin/School_Management/Illness_Pages/Illness_Screen.dart';
import 'package:vms_school/view/Admin/School_Management/PenaltyScreen/PenaltyScreen.dart';
import 'package:vms_school/view/Admin/School_Management/Rewards_Pages/Rewards_Screen.dart';
import 'package:vms_school/view/Admin/School_Management/SchoolTimeTable.dart';
import 'package:vms_school/view/Admin/School_Management/Students_Report_Card_Settings/Student_Report_Card.dart';
import 'package:vms_school/view/Admin/School_Management/Subject_Pages/Subject_Management.dart';
import 'package:vms_school/view/Admin/School_Management/Teachers_notebook_grade_record_Pages/Teachers_notebook_grade_record.dart';
import 'package:vms_school/view/Admin/School_Management/Transactions/Transaction_Management.dart';
import 'package:vms_school/view/Admin/School_Management/Vaccine_Pages/Vaccine_Screen.dart';
import 'package:vms_school/view/Admin/Students_Manager/AllGuardians.dart';
import 'package:vms_school/view/Admin/Students_Manager/AllStudent.dart';
import 'package:vms_school/view/Admin/AppBarAdmin.dart';
import 'package:vms_school/view/Admin/Dashboard/Admin_Dashboard.dart';
import 'package:vms_school/view/Admin/Employee_Manager/AllEmployee.dart';
import 'package:vms_school/view/Admin/Employee_Manager/EmployeeAttendenceManage.dart';
import 'package:vms_school/view/Admin/Employee_Manager/EmployeeStatus.dart';
import 'package:vms_school/view/Admin/Employee_Manager/Virtual_User_Management.dart';
import 'package:vms_school/view/Admin/Students_Manager//Requests.dart';
import 'package:vms_school/view/Admin/School_Management/Class_Pages/Class_Management.dart';
import 'package:vms_school/view/Admin/School_Management/Curriculum_Pages/Curriculum_Management.dart';
import 'package:vms_school/view/Admin/School_Management/Division_Pages/Division_Management.dart';
import 'package:vms_school/view/Admin/School_Management/Electronic_Pages/Electronic_Library.dart';
import 'package:vms_school/view/Admin/School_Management/Grade_Pages/Grade_Management.dart';
import 'package:vms_school/view/Admin/School_Management/School_Data/SchoolDataMGMT.dart';
import 'package:vms_school/view/Admin/School_Management/Sessions_Pages/Session_Management.dart';
import 'package:vms_school/view/Admin/SideBarAdmin.dart';
import 'package:vms_school/view/Admin/Students_Manager/StudentStatus.dart';
import 'package:vms_school/view/Admin/Students_Manager/StudentsAttendanceManagment.dart';
import 'package:vms_school/view/Admin/Students_Manager/Students_Marks/Students_Marks.dart';
import 'package:vms_school/view/Admin/Students_Manager/StudyYearStudent.dart';
import 'package:vms_school/view/Admin/Teacher_Manager/TeacherAttendanceManagment.dart';
import 'package:vms_school/view/Admin/Teacher_Manager/TeacherMangament.dart';
import 'package:vms_school/view/Admin/Teacher_Manager/TeacherStatus.dart';

class AdminHome extends StatefulWidget {
  const AdminHome({super.key});

  @override
  State<AdminHome> createState() => _AdminHomeState();
}

class _AdminHomeState extends State<AdminHome> {
  @override
  void initState() {
    CheeckHasData();
    super.initState();
  }

  CheeckHasData() {
    final con = Get.put(Add_Data_controller());
    final con2 = Get.put(Admin_Profile_Content());
    bool? hasData = prefs!.getBool("hasData");
    bool? isVerified = prefs!.getBool("isVerified");
    String? email = prefs!.getString("email");
    con.setisVerified(isVerified ?? false);
    con.sethasData(hasData ?? false);
    con.setEmail(email!);
    con.setroll(prefs!.getString("role") ?? "");
    if (con.isVerified == true) {
      if (con.hasData == false) {
        WidgetsBinding.instance.addPostFrameCallback((_) {
          con2.ChangeCurruntValue("addData");
          Get.find<AdminHomeContentController>().updateContent("My Profile");
          Get_My_Profile.Get_My_Profile_Data();
        });
      }
    } else {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        Get.dialog(
          VerifingCodeDialog(),
          barrierDismissible: false,
        );
      });
      if (con.hasData == false) {
        WidgetsBinding.instance.addPostFrameCallback((_) {
          con2.ChangeCurruntValue("addData");
          Get.find<AdminHomeContentController>().updateContent("My Profile");
          Get_My_Profile.Get_My_Profile_Data();
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Directionality(
        textDirection: TextDirection.ltr,
        child: Scaffold(
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AppbarAdmin(),
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(width: 70, child: SideBarAdmin()),
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
                        case "Student Attendance":
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
                        case "Subject Management":
                          return Subject_Management();
                        case "Class Management":
                          return ClassManagement();
                        case "Division Management":
                          return DivisionManagement();
                        case "Curriculum Management":
                          return Curriculum_Management();
                        case "Session Management":
                          return SessionManagement();
                        case "School Data Management":
                          return SchoolDataMgmt();
                        case "Electronic Library":
                          return ElectronicBook();
                        case "Illness Screen":
                          return Ilness_Screen();
                        case "Vaccine Screen":
                          return Vaccine_Screen();
                        case "Transaction":
                          return Transaction_Management();
                        case "Virtual User Management":
                          return Virtual_User_Management();
                        case "Penalties":
                          return Penaltyscreen();
                        case "Rewards":
                          return Rewards_Screen();
                        case "My Profile":
                          return ProfileSettings();
                        case "Quiz Type":
                          return Teachers_notebook_grade_record();
                        case "ExcelViewerScreen":
                          return ExcelToPdfScreen();
                        case "Students Marks":
                          return Students_Marks();
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
        ));
  }
}
