import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vms_school/Link/Controller/AdminController/DrowerController.dart';
import 'package:vms_school/Link/Controller/AdminController/Employee_Controllers/Add_Data_controller.dart';
import 'package:vms_school/Link/Controller/AdminController/Main_Admin_Controller/AdminHomeContentController.dart';
import 'package:vms_school/view/SMS_Platform/Admin/All_Settings/Profile_Settings.dart';
import 'package:vms_school/view/SMS_Platform/Admin/Admin_Main_Screens/Drower_Sidebar.dart';
import 'package:vms_school/view/SMS_Platform/Admin/School_Management/Tables/ExamTable.dart';
import 'package:vms_school/view/SMS_Platform/Admin/School_Management/Illness_Pages/Illness_Screen.dart';
import 'package:vms_school/view/SMS_Platform/Admin/School_Management/Mohtawayat/School_Content.dart';
import 'package:vms_school/view/SMS_Platform/Admin/School_Management/PenaltyScreen/PenaltyScreen.dart';
import 'package:vms_school/view/SMS_Platform/Admin/School_Management/Rewards_Pages/Rewards_Screen.dart';
import 'package:vms_school/view/SMS_Platform/Admin/School_Management/Tables/SchoolTimeTable.dart';
import 'package:vms_school/view/SMS_Platform/Admin/School_Management/Students_Report_Card_Settings/Student_Report_Card.dart';
import 'package:vms_school/view/SMS_Platform/Admin/School_Management/Subject_Pages/Subject_Management.dart';
import 'package:vms_school/view/SMS_Platform/Admin/School_Management/Teachers_notebook_grade_record_Pages/Teachers_notebook_grade_record.dart';
import 'package:vms_school/view/SMS_Platform/Admin/School_Management/Transactions/Transaction_Management.dart';
import 'package:vms_school/view/SMS_Platform/Admin/School_Management/Vaccine_Pages/Vaccine_Screen.dart';
import 'package:vms_school/view/SMS_Platform/Admin/Students_Manager/AllGuardians.dart';
import 'package:vms_school/view/SMS_Platform/Admin/Students_Manager/AllStudent.dart';
import 'package:vms_school/view/SMS_Platform/Admin/Admin_Main_Screens/AppBarAdmin.dart';
import 'package:vms_school/view/SMS_Platform/Admin/Dashboard/Admin_Dashboard.dart';
import 'package:vms_school/view/SMS_Platform/Admin/Employee_Manager/AllEmployee.dart';
import 'package:vms_school/view/SMS_Platform/Admin/Employee_Manager/EmployeeAttendenceManage.dart';
import 'package:vms_school/view/SMS_Platform/Admin/Employee_Manager/EmployeeStatus.dart';
import 'package:vms_school/view/SMS_Platform/Admin/Employee_Manager/Virtual_User_Management.dart';
import 'package:vms_school/view/SMS_Platform/Admin/Requests/Requests.dart';
import 'package:vms_school/view/SMS_Platform/Admin/School_Management/Class_Pages/Class_Management.dart';
import 'package:vms_school/view/SMS_Platform/Admin/School_Management/Curriculum_Pages/Curriculum_Management.dart';
import 'package:vms_school/view/SMS_Platform/Admin/School_Management/Division_Pages/Division_Management.dart';
import 'package:vms_school/view/SMS_Platform/Admin/School_Management/Electronic_Pages/Electronic_Library.dart';
import 'package:vms_school/view/SMS_Platform/Admin/School_Management/Grade_Pages/Grade_Management.dart';
import 'package:vms_school/view/SMS_Platform/Admin/School_Management/School_Data/SchoolDataMGMT.dart';
import 'package:vms_school/view/SMS_Platform/Admin/School_Management/Sessions_Pages/Session_Management.dart';
import 'package:vms_school/view/SMS_Platform/Admin/Admin_Main_Screens/SideBarAdmin.dart';
import 'package:vms_school/view/SMS_Platform/Admin/Students_Manager/Export_Jalaa_Pages/Jalaa_Settings_Pages/Jalaa_App_Page.dart';
import 'package:vms_school/view/SMS_Platform/Admin/Students_Manager/StudentStatus.dart';
import 'package:vms_school/view/SMS_Platform/Admin/Students_Manager/StudentsAttendanceManagment.dart';
import 'package:vms_school/view/SMS_Platform/Admin/Students_Manager/Students_Marks/Students_Marks.dart';
import 'package:vms_school/view/SMS_Platform/Admin/Students_Manager/StudyYearStudent.dart';
import 'package:vms_school/view/SMS_Platform/Admin/Teacher_Manager/TeacherAttendanceManagment.dart';
import 'package:vms_school/view/SMS_Platform/Admin/Teacher_Manager/TeacherMangament.dart';
import 'package:vms_school/view/SMS_Platform/Admin/Teacher_Manager/TeacherStatus.dart';
import 'package:vms_school/view/SMS_Platform/Observer/Observer_AppBar.dart';
import 'package:vms_school/view/Both_Platform/widgets/ButtonsDialog.dart';

class AdminHome extends StatefulWidget {
  const AdminHome({super.key});

  @override
  State<AdminHome> createState() => _AdminHomeState();
}

var addController = Get.find<Add_Data_controller>();

class _AdminHomeState extends State<AdminHome> {
  @override
  Widget build(BuildContext context) {
    return Directionality(
        textDirection: TextDirection.ltr,
        child: Scaffold(
          body: GetBuilder<AdminHomeContentController>(builder: (controller) {
            return GetBuilder<DraweController>(builder: (cont) {
              if (MediaQuery.of(context).size.width >= 769) {
                cont.opendrawer(false);
              }
              return GetBuilder<Add_Data_controller>(builder: (conts) {
                if (!conts.isVerified) {
                  return Center(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      mainAxisSize: MainAxisSize.max,
                      spacing: 10.0,
                      children: [
                        Text("You have not confirmed your account yet.".tr),
                        ButtonDialog(
                            text: "Verified Now".tr,
                            onPressed: () async {
                              if (!conts.isVerified) {
                                if (!Get.isDialogOpen!) {
                                  await conts.showVerificationDialog();
                                }
                              }
                            },
                            color: Theme.of(context).primaryColor,
                            width: 250),
                      ],
                    ),
                  );
                } else {
                  return Stack(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(
                            left: MediaQuery.of(context).size.width >= 769
                                ? 70.0
                                : 0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            if (addController.roll != "observer") AppbarAdmin(),
                            if (addController.roll == "observer")
                              AppbarObserver(),
                            Expanded(
                              child: Stack(
                                children: [
                                  if (cont.isopen) const DraweHome(),
                                  IgnorePointer(
                                    ignoring: cont.isopen,
                                    child: AnimatedContainer(
                                      curve: Easing.standard,
                                      transform: Matrix4.identity()
                                        ..translate(cont.isopen ? -90.0 : 0.0,
                                            cont.isopen ? 130.0 : 0.0, 0.0)
                                        ..rotateX(cont.isopen ? 0.4 : 0.0)
                                        ..rotateY(cont.isopen ? 0.4 : 0.0)
                                        ..scale(cont.isopen ? 0.8 : 1.0),
                                      duration: Duration(milliseconds: 300),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Builder(
                                            builder: (context) {
                                              switch (controller.content) {
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
                                                case "Manage Employee Attendance":
                                                  return EmployeeAttendanceManagment();
                                                case "Manage Teacher Attendance":
                                                  return TeacherAttendanceManagment();
                                                case "Manage Students Attendance":
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
                                                case "School Content":
                                                  return School_Content();
                                                case "Jalaa Settings":
                                                  return Jalaa_Up_Page();
                                                default:
                                                  return AdminDashboard();
                                              }
                                            },
                                          )
                                        ],
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      LayoutBuilder(
                        builder: (context, constraints) {
                          if (constraints.maxWidth >= 769) {
                            return Padding(
                              padding: const EdgeInsets.only(top: 70.0),
                              child: SizedBox(
                                width: 70,
                                child: constraints.maxHeight >= 420
                                    ? SideBarAdmin()
                                    : Container(
                                        height: 500,
                                        child: SingleChildScrollView(
                                          child: SideBarAdmin(),
                                        ),
                                      ),
                              ),
                            );
                          } else {
                            return SizedBox.shrink();
                          }
                        },
                      ),
                    ],
                  );
                }
              });
            });
          }),
        ));
  }
}
