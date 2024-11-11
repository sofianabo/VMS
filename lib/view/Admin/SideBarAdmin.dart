// ignore_for_file: must_be_immutable, file_names

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx/Link/Controller/AdminController/AdminHomeContentController.dart';
import 'package:getx/Icons_File/v_m_s__icons_icons.dart';

class SideBarAdmin extends StatelessWidget {
  SideBarAdmin({super.key});
  AdminHomeContentController adminContent = Get.find();
  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;
    return Stack(
        alignment: Alignment.center,
      children: [
        Image.asset("../../images/sidebarAdmin.png",
            height: h > 635 ? h / 1.2 : h / 1.25),
        Container(
          alignment: Alignment.center,
          child: GetBuilder<AdminHomeContentController>(builder: (cont) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      VMS_Icons.a1,
                      size: 18,
                      color: Colors.white,
                    )),
                IconButton(
                  onPressed: () {
                    cont.updateContent("enroll requests");
                  },
                    icon: const Icon(
                      VMS_Icons.a2,
                      color: Colors.white,
                      size: 18,

                    )
                ),
                Padding(
                  padding: EdgeInsets.only(top: h / 68.4),
                  child: PopupMenuButton(
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
                            style: Get.theme.primaryTextTheme.bodySmall),
                      ),
                      PopupMenuItem<String>(
                        value: 'School Time Table',
                        child: Text('School Time Table',
                            style: Get.theme.primaryTextTheme.bodySmall),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: h / 34.2),
                  child: PopupMenuButton(
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
                      if (value == "Student Status") {
                        cont.updateContent("Student Status");
                      }
                    },
                    itemBuilder: (BuildContext context) =>
                        <PopupMenuEntry<String>>[
                      PopupMenuItem<String>(
                        value: 'All Students',
                        child: Text('All Students',
                            style: Get.theme.primaryTextTheme.bodySmall),
                      ),
                      PopupMenuItem<String>(
                        value: 'Study Year Students',
                        child: Text('Study Year Students',
                            style: Get.theme.primaryTextTheme.bodySmall),
                      ),
                      PopupMenuItem<String>(
                        value: 'All Guardians',
                        child: Text('All Guardians',
                            style: Get.theme.primaryTextTheme.bodySmall),
                      ),
                      PopupMenuItem<String>(
                        value: 'Student Status',
                        child: Text('Student Status',
                            style: Get.theme.primaryTextTheme.bodySmall),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: h / 34.2),
                  child: PopupMenuButton(
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
                      if (value == "Teacher Quorum") {
                        cont.updateContent("Teacher Quorum");
                      }
                    },
                    itemBuilder: (BuildContext context) =>
                        <PopupMenuEntry<String>>[
                      PopupMenuItem<String>(
                        value: 'Teacher Management',
                        child: Text('Teacher Management',
                            style: Get.theme.primaryTextTheme.bodySmall),
                      ),
                      PopupMenuItem<String>(
                        value: 'Teacher Status',
                        child: Text('Teacher Status',
                            style: Get.theme.primaryTextTheme.bodySmall),
                      ),
                      PopupMenuItem<String>(
                        value: 'Teacher Quorum',
                        child: Text('Teacher Quorum',
                            style: Get.theme.primaryTextTheme.bodySmall),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: h / 34.2),
                  child: PopupMenuButton(
                    child: const Icon(
                      VMS_Icons.a6,
                      color: Colors.white,
                      size: 20,
                    ),
                    onSelected: (value) {
                      if (value == "All Employee") {
                        cont.updateContent("All Employee");
                      }
                      if (value == "Employee Status") {
                        cont.updateContent("Employee Status");
                      }
                    },
                    itemBuilder: (BuildContext context) =>
                        <PopupMenuEntry<String>>[
                      PopupMenuItem<String>(
                        value: 'All Employee',
                        child: Text('All Employee',
                            style: Get.theme.primaryTextTheme.bodySmall),
                      ),
                      PopupMenuItem<String>(
                        value: 'Employee Status',
                        child: Text('Employee Status',
                            style: Get.theme.primaryTextTheme.bodySmall),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: h / 34.2),
                  child: PopupMenuButton(
                      child: Icon(
                        VMS_Icons.a7,
                      color: Colors.white,
                        size: 20,
                      ),
                      itemBuilder: (BuildContext context) {
                        return <PopupMenuEntry<String>>[];
                      }),
                ),
                Padding(
                  padding: EdgeInsets.only(top: h / 34.2),
                  child: PopupMenuButton(
                      child: const Icon(
                        VMS_Icons.a8,
                      color: Colors.white,
                        size: 20,
                      ),
                      itemBuilder: (BuildContext context) {
                        return <PopupMenuEntry<String>>[];
                      }),
                )
              ],
            );
          }),
        )
      ],
    );
  }
}
