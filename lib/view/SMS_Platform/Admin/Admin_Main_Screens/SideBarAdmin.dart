import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vms_school/Icons_File/v_m_s__icons_icons.dart';
import 'package:vms_school/Link/Controller/AdminController/Employee_Controllers/Add_Data_controller.dart';
import 'package:vms_school/Link/Controller/AdminController/Main_Admin_Controller/AdminHomeContentController.dart';
import 'package:vms_school/Link/Controller/AdminController/Students_Controllers/Students_Marks_Controller.dart';
import 'package:vms_school/view/SMS_Platform/Admin/Admin_Main_Screens/SideBar_Path.dart';
import '../../../Both_Platform/widgets/SidbarAnimation.dart';

class SideBarAdmin extends StatefulWidget {
  SideBarAdmin({super.key});

  @override
  State<SideBarAdmin> createState() => _SideBarAdminState();
}

class _SideBarAdminState extends State<SideBarAdmin> {
  @override
  var controller = Get.find<Add_Data_controller>();

  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        PathSidbarAnimation(
          child: CustomPaint(
              painter: MyPainter(), child: SizedBox(width: 80, height: 500)),
        ),
        GetBuilder<AdminHomeContentController>(
          builder: (cont) {
            return Column(
              spacing: 20.0,
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                if (Get.find<Add_Data_controller>().roll != "observer")
                  HoverScale(
                    child: SidbarAnimation(
                      hoverText: "Dashboard".tr,
                      child: GestureDetector(
                        onTap: () {
                          if (controller.hasData == true) {
                            cont.updateContent("Dashboard");
                          }
                        },
                        child: Icon(
                          VMS_Icons.a1,
                          size: 18,
                          color: controller.hasData == true
                              ? Colors.white
                              : Theme.of(context).disabledColor,
                        ),
                      ),
                    ),
                  ),
                if (Get.find<Add_Data_controller>().roll != "observer")
                  HoverScale(
                    child: SidbarAnimation(
                      hoverText: "Enroll Requests".tr,
                      child: GestureDetector(
                        onTap: () {
                          if (controller.hasData == true) {
                            cont.updateContent("Enroll Requests");
                          }
                        },
                        child: Icon(
                          VMS_Icons.a2,
                          color: controller.hasData == true
                              ? Colors.white
                              : Theme.of(context).disabledColor,
                          size: 18,
                        ),
                      ),
                    ),
                  ),
                HoverScale(
                  child: SidbarAnimation(
                    hoverText: "Schedules".tr,
                    child: PopupMenuButton(
                      enabled: controller.hasData,
                      tooltip: "".tr,
                      child: Icon(
                        VMS_Icons.a3,
                        color: controller.hasData == true
                            ? Colors.white
                            : Theme.of(context).disabledColor,
                        size: 20,
                      ),
                      onSelected: (value) {
                        if (value == "Exam Table".tr) {
                          cont.updateContent("Exam Table");
                        }
                        if (value == "School Time Table".tr) {
                          cont.updateContent("School Time Table");
                        }
                        if (value == "Quiz Type".tr) {
                          cont.updateContent("Quiz Type");
                        }
                      },
                      itemBuilder: (BuildContext context) =>
                          <PopupMenuEntry<String>>[
                        PopupMenuItem<String>(
                          value: 'Exam Table'.tr,
                          child: Text('Exam Table'.tr),
                        ),
                        PopupMenuItem<String>(
                          value: 'School Time Table'.tr,
                          child: Text('School Time Table'.tr),
                        ),
                        PopupMenuItem<String>(
                          value: 'Quiz Type'.tr,
                          child: Text('Quiz Type'.tr),
                        ),
                      ],
                    ),
                  ),
                ),
                HoverScale(
                  child: SidbarAnimation(
                    hoverText: "Students".tr,
                    child: PopupMenuButton(
                      enabled: controller.hasData,
                      tooltip: "".tr,
                      child: Icon(
                        VMS_Icons.a4,
                        color: controller.hasData == true
                            ? Colors.white
                            : Theme.of(context).disabledColor,
                        size: 18,
                      ),
                      onSelected: (value) {
                        if (value == "All Students".tr) {
                          cont.updateContent("All Students");
                        }
                        if (value == "Study Year Students".tr) {
                          cont.updateContent("Study Year Students");
                        }
                        if (value == "All Guardians".tr) {
                          cont.updateContent("All Guardians");
                        }
                        if (value == "Student Attendance".tr) {
                          cont.updateContent("Student Attendance");
                        }
                        if (value == "Manage Students Attendance".tr) {
                          cont.updateContent("Manage Students Attendance");
                        }
                        if (value == "Students Marks".tr) {
                          cont.updateContent("Students Marks");
                          Get.find<Students_Marks_Controller>().setclassindex();
                          Get.find<Students_Marks_Controller>().resetinClass();
                          Get.find<Students_Marks_Controller>()
                              .resetindivision();
                          Get.find<Students_Marks_Controller>()
                              .resetinSemester();
                        }
                      },
                      itemBuilder: (BuildContext context) =>
                          <PopupMenuEntry<String>>[
                        PopupMenuItem<String>(
                          value: 'All Students'.tr,
                          child: Text('All Students'.tr),
                        ),
                        PopupMenuItem<String>(
                          value: 'Study Year Students'.tr,
                          child: Text('Study Year Students'.tr),
                        ),
                        if (Get.find<Add_Data_controller>().roll != "observer")
                          if (Get.find<Add_Data_controller>().roll !=
                              "supervisor")
                            PopupMenuItem<String>(
                              value: 'All Guardians'.tr,
                              child: Text('All Guardians'.tr),
                            ),
                        if (Get.find<Add_Data_controller>().roll != "observer")
                          PopupMenuItem<String>(
                            value: 'Student Attendance'.tr,
                            child: Text('Student Attendance'.tr),
                          ),
                        if (Get.find<Add_Data_controller>().roll != "observer")
                          PopupMenuItem<String>(
                            value: 'Manage Students Attendance'.tr,
                            child: Text('Manage Students Attendance'.tr),
                          ),
                        if (Get.find<Add_Data_controller>().roll != "observer")
                          PopupMenuItem<String>(
                            value: 'Students Marks'.tr,
                            child: Text('Students Marks'.tr),
                          ),
                      ],
                    ),
                  ),
                ),
                HoverScale(
                  child: SidbarAnimation(
                    hoverText: "Teachers".tr,
                    child: PopupMenuButton(
                      enabled: controller.hasData,
                      tooltip: "".tr,
                      child: Icon(
                        VMS_Icons.a5,
                        color: controller.hasData == true
                            ? Colors.white
                            : Theme.of(context).disabledColor,
                        size: 18,
                      ),
                      onSelected: (value) {
                        if (value == "Teacher Management".tr) {
                          cont.updateContent("Teacher Management");
                        }
                        if (value == "Teacher Status".tr) {
                          cont.updateContent("Teacher Status");
                        }
                        if (value == "Manage Teacher Attendance".tr) {
                          cont.updateContent("Manage Teacher Attendance");
                        }
                      },
                      itemBuilder: (BuildContext context) =>
                          <PopupMenuEntry<String>>[
                        PopupMenuItem<String>(
                          value: 'Teacher Management'.tr,
                          child: Text('Teacher Management'.tr),
                        ),
                        if (Get.find<Add_Data_controller>().roll != "observer")
                          PopupMenuItem<String>(
                            value: 'Teacher Status'.tr,
                            child: Text('Teacher Status'.tr),
                          ),
                        if (Get.find<Add_Data_controller>().roll != "observer")
                          PopupMenuItem<String>(
                            value: 'Manage Teacher Attendance'.tr,
                            child: Text('Manage Teacher Attendance'.tr),
                          ),
                      ],
                    ),
                  ),
                ),
                HoverScale(
                  child: SidbarAnimation(
                    hoverText: "Employees".tr,
                    child: PopupMenuButton(
                      enabled: controller.hasData,
                      tooltip: "".tr,
                      child: Icon(
                        VMS_Icons.a6,
                        color: controller.hasData == true
                            ? Colors.white
                            : Theme.of(context).disabledColor,
                        size: 20,
                      ),
                      onSelected: (value) {
                        if (value == "Employee Management".tr) {
                          cont.updateContent("Employee Management");
                        }
                        if (value == "Employee Attendance".tr) {
                          cont.updateContent("Employee Attendance");
                        }
                        if (value == "Manage Employee Attendance".tr) {
                          cont.updateContent("Manage Employee Attendance");
                        }
                        if (value == "Virtual User Management".tr) {
                          cont.updateContent("Virtual User Management");
                        }
                      },
                      itemBuilder: (BuildContext context) =>
                          <PopupMenuEntry<String>>[
                        PopupMenuItem<String>(
                          value: 'Employee Management'.tr,
                          child: Text('Employee Management'.tr),
                        ),
                        if (Get.find<Add_Data_controller>().roll != "observer")
                          PopupMenuItem<String>(
                            value: 'Employee Attendance'.tr,
                            child: Text('Employee Attendance'.tr),
                          ),
                        if (Get.find<Add_Data_controller>().roll != "observer")
                          PopupMenuItem<String>(
                            value: 'Manage Employee Attendance'.tr,
                            child: Text('Manage Employee Attendance'.tr),
                          ),
                        if (Get.find<Add_Data_controller>().roll != "observer")
                          if (Get.find<Add_Data_controller>().roll !=
                              "supervisor")
                            PopupMenuItem<String>(
                              value: 'Virtual User Management'.tr,
                              child: Text('Virtual User Management'.tr),
                            ),
                      ],
                    ),
                  ),
                ),
                HoverScale(
                  child: SidbarAnimation(
                    hoverText: "Management".tr,
                    child: PopupMenuButton(
                      enabled: controller.hasData,
                      tooltip: "".tr,
                      child: Icon(
                        VMS_Icons.a7,
                        color: controller.hasData == true
                            ? Colors.white
                            : Theme.of(context).disabledColor,
                        size: 18,
                      ),
                      onSelected: (value) {
                        if (value == "Session Management".tr) {
                          cont.updateContent("Session Management");
                        }
                        if (value == "Grade Management".tr) {
                          cont.updateContent("Grade Management");
                        }
                        if (value == "Subject Management".tr) {
                          cont.updateContent("Subject Management");
                        }
                        if (value == "Class Management".tr) {
                          cont.updateContent("Class Management");
                        }
                        if (value == "Division Management".tr) {
                          cont.updateContent("Division Management");
                        }
                        if (value == "Curriculum Management".tr) {
                          cont.updateContent("Curriculum Management");
                        }
                        if (value == "Jalaa Settings".tr) {
                          cont.updateContent("Jalaa Settings");
                        }
                      },
                      itemBuilder: (BuildContext context) =>
                          <PopupMenuEntry<String>>[
                        PopupMenuItem<String>(
                          value: 'Session Management'.tr,
                          child: Text('Session Management'.tr),
                        ),
                        PopupMenuItem<String>(
                          value: 'Grade Management'.tr,
                          child: Text('Grade Management'.tr),
                        ),
                        PopupMenuItem<String>(
                          value: 'Class Management'.tr,
                          child: Text('Class Management'.tr),
                        ),
                        PopupMenuItem<String>(
                          value: 'Division Management'.tr,
                          child: Text('Division Management'.tr),
                        ),
                        PopupMenuItem<String>(
                          value: 'Subject Management'.tr,
                          child: Text('Subject Management'.tr),
                        ),
                        PopupMenuItem<String>(
                          value: 'Curriculum Management'.tr,
                          child: Text('Curriculum Management'.tr),
                        ),
                        PopupMenuItem<String>(
                          value: 'Jalaa Settings'.tr,
                          child: Text('Jalaa Settings'.tr),
                        ),
                      ],
                    ),
                  ),
                ),
                HoverScale(
                  child: SidbarAnimation(
                    hoverText: "General".tr,
                    child: PopupMenuButton(
                      enabled: controller.hasData,
                      tooltip: "".tr,
                      child: Icon(
                        VMS_Icons.a8,
                        color: controller.hasData == true
                            ? Colors.white
                            : Theme.of(context).disabledColor,
                        size: 16,
                      ),
                      onSelected: (value) {
                        if (value == "School Data Management".tr) {
                          cont.updateContent("School Data Management");
                        }
                        if (value == "Electronic Library".tr) {
                          cont.updateContent("Electronic Library");
                        }
                        if (value == "Transaction".tr) {
                          cont.updateContent("Transaction");
                        }
                        if (value == "Illness Screen".tr) {
                          cont.updateContent("Illness Screen");
                        }
                        if (value == "Vaccine Screen".tr) {
                          cont.updateContent("Vaccine Screen");
                        }
                        if (value == "School Content".tr) {
                          cont.updateContent("School Content");
                        }
                        if (value == "Penalties".tr) {
                          cont.updateContent("Penalties");
                        }
                      },
                      itemBuilder: (BuildContext context) =>
                          <PopupMenuEntry<String>>[
                        if (Get.find<Add_Data_controller>().roll !=
                            "supervisor")
                          PopupMenuItem<String>(
                            value: 'School Data Management'.tr,
                            child: Text('School Data Management'.tr),
                          ),
                        if (Get.find<Add_Data_controller>().roll != "observer")
                          if (Get.find<Add_Data_controller>().roll !=
                              "supervisor")
                            PopupMenuItem<String>(
                              value: 'School Content'.tr,
                              child: Text('School Content'.tr),
                            ),
                        PopupMenuItem<String>(
                          value: 'Electronic Library'.tr,
                          child: Text('Electronic Library'.tr),
                        ),
                        if (Get.find<Add_Data_controller>().roll != "observer")
                          if (Get.find<Add_Data_controller>().roll !=
                              "supervisor")
                            PopupMenuItem<String>(
                              value: 'Transaction'.tr,
                              child: Text('Transaction'.tr),
                            ),
                        PopupMenuItem<String>(
                          value: 'Illness Screen'.tr,
                          child: Text('Illness Screen'.tr),
                        ),
                        PopupMenuItem<String>(
                          value: 'Vaccine Screen'.tr,
                          child: Text('Vaccine Screen'.tr),
                        ),
                        PopupMenuItem<String>(
                          value: 'Penalties'.tr,
                          child: Text('Penalties'.tr),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            );
          },
        )
      ],
    );
  }
}
