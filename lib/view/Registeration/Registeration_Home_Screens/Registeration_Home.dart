import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vms_school/Link/API/AdminAPI/Get_My_Profile.dart';
import 'package:vms_school/Link/Controller/AdminController/DrowerController.dart';
import 'package:vms_school/Link/Controller/AdminController/Employee_Controllers/Add_Data_controller.dart';
import 'package:vms_school/Link/Controller/AdminController/Main_Admin_Controller/AdminHomeContentController.dart';
import 'package:vms_school/Link/Controller/AdminController/Main_Admin_Controller/Admin_Profile_Content.dart';
import 'package:vms_school/Link/middleware/auth_middleware.dart';
import 'package:vms_school/main.dart';
import 'package:vms_school/view/Admin/All_Settings/Profile_Settings.dart';
import 'package:vms_school/view/Admin/All_Settings/Verifing_Code_Dialog.dart';
import 'package:vms_school/view/Admin/Admin_Main_Screens/Drower_Sidebar.dart';
import 'package:vms_school/view/Admin/School_Management/Tables/ExamTable.dart';
import 'package:vms_school/view/Admin/School_Management/Illness_Pages/Illness_Screen.dart';
import 'package:vms_school/view/Admin/School_Management/Mohtawayat/School_Content.dart';
import 'package:vms_school/view/Admin/School_Management/PenaltyScreen/PenaltyScreen.dart';
import 'package:vms_school/view/Admin/School_Management/Rewards_Pages/Rewards_Screen.dart';
import 'package:vms_school/view/Admin/School_Management/Tables/SchoolTimeTable.dart';
import 'package:vms_school/view/Admin/School_Management/Students_Report_Card_Settings/Student_Report_Card.dart';
import 'package:vms_school/view/Admin/School_Management/Subject_Pages/Subject_Management.dart';
import 'package:vms_school/view/Admin/School_Management/Teachers_notebook_grade_record_Pages/Teachers_notebook_grade_record.dart';
import 'package:vms_school/view/Admin/School_Management/Transactions/Transaction_Management.dart';
import 'package:vms_school/view/Admin/School_Management/Vaccine_Pages/Vaccine_Screen.dart';
import 'package:vms_school/view/Admin/Students_Manager/AllGuardians.dart';
import 'package:vms_school/view/Admin/Students_Manager/AllStudent.dart';
import 'package:vms_school/view/Admin/Admin_Main_Screens/AppBarAdmin.dart';
import 'package:vms_school/view/Admin/Dashboard/Admin_Dashboard.dart';
import 'package:vms_school/view/Admin/Employee_Manager/AllEmployee.dart';
import 'package:vms_school/view/Admin/Employee_Manager/EmployeeAttendenceManage.dart';
import 'package:vms_school/view/Admin/Employee_Manager/EmployeeStatus.dart';
import 'package:vms_school/view/Admin/Employee_Manager/Virtual_User_Management.dart';
import 'package:vms_school/view/Admin/Requests/Requests.dart';
import 'package:vms_school/view/Admin/School_Management/Class_Pages/Class_Management.dart';
import 'package:vms_school/view/Admin/School_Management/Curriculum_Pages/Curriculum_Management.dart';
import 'package:vms_school/view/Admin/School_Management/Division_Pages/Division_Management.dart';
import 'package:vms_school/view/Admin/School_Management/Electronic_Pages/Electronic_Library.dart';
import 'package:vms_school/view/Admin/School_Management/Grade_Pages/Grade_Management.dart';
import 'package:vms_school/view/Admin/School_Management/School_Data/SchoolDataMGMT.dart';
import 'package:vms_school/view/Admin/School_Management/Sessions_Pages/Session_Management.dart';
import 'package:vms_school/view/Admin/Admin_Main_Screens/SideBarAdmin.dart';
import 'package:vms_school/view/Admin/Students_Manager/StudentStatus.dart';
import 'package:vms_school/view/Admin/Students_Manager/StudentsAttendanceManagment.dart';
import 'package:vms_school/view/Admin/Students_Manager/Students_Marks/Students_Marks.dart';
import 'package:vms_school/view/Admin/Students_Manager/StudyYearStudent.dart';
import 'package:vms_school/view/Admin/Teacher_Manager/TeacherAttendanceManagment.dart';
import 'package:vms_school/view/Admin/Teacher_Manager/TeacherMangament.dart';
import 'package:vms_school/view/Admin/Teacher_Manager/TeacherStatus.dart';
import 'package:vms_school/view/Observer/Observer_AppBar.dart';
import 'package:vms_school/view/Registeration/Registeration_Home_Screens/AppBarRegisteration.dart';
import 'package:vms_school/widgets/ButtonsDialog.dart';
import 'package:vms_school/widgets/Responsive.dart';

class RegisterationHome extends StatefulWidget {
  const RegisterationHome({super.key});

  @override
  State<RegisterationHome> createState() => _RegisterationHomeState();
}

var addController = Get.find<Add_Data_controller>();

class _RegisterationHomeState extends State<RegisterationHome> {
  @override
  Widget build(BuildContext context) {
    return Directionality(
        textDirection: TextDirection.ltr,
        child: Scaffold(
          body: GetBuilder<AdminHomeContentController>(builder: (controller) {
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
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        AppbarRegisteration(),
                        Expanded(
                          child: Builder(
                            builder: (context) {
                              switch (controller.content) {
                                case "Enroll Requests":
                                  return Requests();
                                case "My Profile":
                                  return ProfileSettings();
                                default:
                                  return Requests();
                              }
                            },
                          ),
                        ),
                      ],
                    ),
                  ],
                );
              }
            });
          }),
        ));
  }
}
