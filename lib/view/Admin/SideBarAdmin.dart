import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vms_school/Icons_File/v_m_s__icons_icons.dart';
import 'package:vms_school/Link/Controller/AdminController/Main_Admin_Controller/AdminHomeContentController.dart';
import 'package:vms_school/view/Admin/SideBar_Path.dart';
import '../../widgets/SidbarAnimation.dart';

class SideBarAdmin extends StatelessWidget {
  SideBarAdmin({super.key});
  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    return Stack(
        alignment: Alignment.center,
      children: [
        CustomPaint(
            painter: MyPainter(),
            child: SizedBox(width: 90, height: h > 635 ? h / 1.2 : h / 1.25)),
        GetBuilder<AdminHomeContentController>(builder: (cont) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SidbarAnimation(
                  child: GestureDetector(
                onTap: () {
                  cont.updateContent("Dashboard");
                },
                child: Icon(
                  VMS_Icons.a1,
                  size: 18,
                  color: Colors.white,
                ),
              )),
              SidbarAnimation(
                  child: Padding(
                padding: EdgeInsets.only(top: h / 34.2),
                child: GestureDetector(
                  onTap: () {
                    cont.updateContent("Enroll Requests");
                  },
                  child: const Icon(
                    VMS_Icons.a2,
                    color: Colors.white,
                    size: 18,
                  ),
                ),
              )),
              SidbarAnimation(
                child: Padding(
                  padding: EdgeInsets.only(top: h / 34.2),
                  child: PopupMenuButton(
                    tooltip: "",
                    child: const Icon(
                      VMS_Icons.a3,
                      color: Colors.white,
                      size: 18,
                    ),
                    onSelected: (value) {
                      if (value == "Exam Table") {
                        cont.updateContent("Exam Table");
                      }
                      if (value == "School Time Table") {
                        cont.updateContent("School Time Table");
                      }
                    },
                    itemBuilder: (BuildContext context) =>
                        <PopupMenuEntry<String>>[
                      PopupMenuItem<String>(
                        value: 'Exam Table',
                        child: Text('Exam Table',
                          ),
                      ),
                      PopupMenuItem<String>(
                        value: 'School Time Table',
                        child: Text('School Time Table',
                          ),
                      ),
                    ],
                  ),
                ),
              ),
              SidbarAnimation(
                child: Padding(
                  padding: EdgeInsets.only(top: h / 34.2),
                  child: PopupMenuButton(
                    tooltip: "",
                    child: const Icon(
                      VMS_Icons.a4,
                      color: Colors.white,
                      size: 18,
                    ),
                    onSelected: (value) {
                      if (value == "All Students") {
                        cont.updateContent("All Students");
                      }
                      if (value == "Study Year Students") {
                        cont.updateContent("Study Year Students");
                      }
                      if (value == "All Guardians") {
                        cont.updateContent("All Guardians");
                      }
                      if (value == "Student Attendance") {
                        cont.updateContent("Student Attendance");
                      }
                      if (value == "Students Attendance Managment") {
                        cont.updateContent("Students Attendance Managment");
                      }
                    },
                    itemBuilder: (BuildContext context) =>
                        <PopupMenuEntry<String>>[
                      PopupMenuItem<String>(
                        value: 'All Students',
                        child: Text('All Students',
                          ),
                      ),
                      PopupMenuItem<String>(
                        value: 'Study Year Students',
                        child: Text('Study Year Students',
                          ),
                      ),
                      PopupMenuItem<String>(
                        value: 'All Guardians',
                        child: Text('All Guardians',
                          ),
                      ),
                      PopupMenuItem<String>(
                        value: 'Student Attendance',
                        child: Text('Student Attendance',
                          ),
                      ),
                      PopupMenuItem<String>(
                        value: 'Students Attendance Managment',
                        child: Text('Students Attendance Managment',
                          ),
                      ),
                    ],
                  ),
                ),
              ),
              SidbarAnimation(
                child: Padding(
                  padding: EdgeInsets.only(top: h / 34.2),
                  child: PopupMenuButton(
                    tooltip: "",
                    child: const Icon(
                      VMS_Icons.a5,
                      color: Colors.white,
                      size: 16,
                    ),
                    onSelected: (value) {
                      if (value == "Teacher Management") {
                        cont.updateContent("Teacher Management");
                      }
                      if (value == "Teacher Status") {
                        cont.updateContent("Teacher Status");
                      }
                      if (value == "Teacher Attendance Managment") {
                        cont.updateContent("Teacher Attendance Managment");
                      }
                    },
                    itemBuilder: (BuildContext context) =>
                        <PopupMenuEntry<String>>[
                      PopupMenuItem<String>(
                        value: 'Teacher Management',
                        child: Text('Teacher Management',
                          ),
                      ),
                      PopupMenuItem<String>(
                        value: 'Teacher Status',
                        child: Text('Teacher Status',
                          ),
                      ),
                      PopupMenuItem<String>(
                        value: 'Teacher Attendance Managment',
                        child: Text('Teacher Attendance Managment',
                          ),
                      ),
                    ],
                  ),
                ),
              ),
              SidbarAnimation(
                child: Padding(
                  padding: EdgeInsets.only(top: h / 34.2),
                  child: PopupMenuButton(
                    tooltip: "",
                    child: const Icon(
                      VMS_Icons.a6,
                      color: Colors.white,
                      size: 20,
                    ),
                    onSelected: (value) {
                      if (value == "Employee Management") {
                        cont.updateContent("Employee Management");
                      }
                      if (value == "Employee Attendance") {
                        cont.updateContent("Employee Attendance");
                      }
                      if (value == "Employee Attendance Manage") {
                        cont.updateContent("Employee Attendance Manage");
                      }
                      if (value == "Virtual User Management") {
                        cont.updateContent("Virtual User Management");
                      }
                    },
                    itemBuilder: (BuildContext context) =>
                        <PopupMenuEntry<String>>[
                      PopupMenuItem<String>(
                        value: 'Employee Management',
                        child: Text('Employee Management',
                          ),
                      ),
                      PopupMenuItem<String>(
                        value: 'Employee Attendance',
                        child: Text('Employee Attendance',
                          ),
                      ),
                      PopupMenuItem<String>(
                        value: 'Employee Attendance Manage',
                        child: Text('Employee Attendance Manage',
                          ),
                      ),
                      PopupMenuItem<String>(
                        value: 'Virtual User Management',
                        child: Text('Virtual User Management',
                          ),
                      ),
                    ],
                  ),
                ),
              ),
              SidbarAnimation(
                child: Padding(
                  padding: EdgeInsets.only(top: h / 34.2),
                  child: PopupMenuButton(
                    tooltip: "",
                    child: const Icon(
                      VMS_Icons.a7,
                      color: Colors.white,
                      size: 16,
                    ),
                    onSelected: (value) {
                      if (value == "Session Management") {
                        cont.updateContent("Session Management");
                      }
                      if (value == "Grade Management") {
                        cont.updateContent("Grade Management");
                      }
                      if (value == "Class Management") {
                        cont.updateContent("Class Management");
                      }
                      if (value == "Division Management") {
                        cont.updateContent("Division Management");
                      }
                      if (value == "Curriculum Management") {
                        cont.updateContent("Curriculum Management");
                      }
                    },
                    itemBuilder: (BuildContext context) =>
                        <PopupMenuEntry<String>>[
                      PopupMenuItem<String>(
                        value: 'Session Management',
                        child: Text('Session Management',
                          ),
                      ),
                      PopupMenuItem<String>(
                        value: 'Grade Management',
                        child: Text('Grade Management',
                          ),
                      ),
                      PopupMenuItem<String>(
                        value: 'Class Management',
                        child: Text('Class Management',
                          ),
                      ),
                      PopupMenuItem<String>(
                        value: 'Division Management',
                        child: Text('Division Management',
                          ),
                      ),
                      PopupMenuItem<String>(
                        value: 'Curriculum Management',
                        child: Text('Curriculum Management',
                          ),
                      ),
                    ],
                  ),
                ),
              ),
              SidbarAnimation(
                child: Padding(
                  padding: EdgeInsets.only(top: h / 34.2),
                  child: PopupMenuButton(
                    tooltip: "",
                    child: const Icon(
                      VMS_Icons.a8,
                      color: Colors.white,
                      size: 16,
                    ),
                    onSelected: (value) {
                      if (value == "School Data Management") {
                        cont.updateContent("School Data Management");
                      }
                      if (value == "Electronic Library") {
                        cont.updateContent("Electronic Library");
                      }
                    },
                    itemBuilder: (BuildContext context) =>
                        <PopupMenuEntry<String>>[
                      PopupMenuItem<String>(
                        value: 'School Data Management',
                        child: Text('School Data Management',
                          ),
                      ),
                      PopupMenuItem<String>(
                        value: 'Electronic Library',
                        child: Text('Electronic Library',
                          ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          );
        })
      ],
    );
  }
}
