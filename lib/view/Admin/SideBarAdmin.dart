// ignore_for_file: must_be_immutable, file_names

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx/Controller/AdminController/AdminHomeContentController.dart';

class SideBarAdmin extends StatelessWidget {
  SideBarAdmin({super.key});
  AdminHomeContentController adminContent = Get.find();
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image.asset("../../images/sidebarAdmin.png", height: 720),
        Container(
          margin: const EdgeInsets.only(top: 100, left: 20),
          child: GetBuilder<AdminHomeContentController>(builder: (cont) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                IconButton(onPressed: () {}, icon: const Icon(Icons.dashboard)),
                IconButton(
                    onPressed: () {
                      cont.updateContent("enroll requests");
                    },
                    icon: const Icon(Icons.request_page)),
                PopupMenuButton(
                  child: const Icon(Icons.table_chart),
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
                PopupMenuButton(
                  child: const Icon(Icons.table_chart),
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
                PopupMenuButton(
                  child: const Icon(Icons.table_chart),
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
                PopupMenuButton(
                  child: const Icon(Icons.table_chart),
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
              ],
            );
          }),
        )
      ],
    );
  }
}
