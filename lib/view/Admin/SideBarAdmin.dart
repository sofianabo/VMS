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
        Image.asset("../../images/sidebarAdmin.png", height: 550),
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
                IconButton(
                    onPressed: () {
                      cont.updateContent("All Students");
                    },
                    icon: const Icon(Icons.book)),
                IconButton(
                    onPressed: () {
                      cont.updateContent("Study Year Students");
                    },
                    icon: const Icon(Icons.data_array)),
                IconButton(
                    onPressed: () {
                      cont.updateContent("All Guardians");
                    },
                    icon: const Icon(Icons.person_sharp)),
                IconButton(
                    onPressed: () {
                      cont.updateContent("Student Status");
                    },
                    icon: const Icon(Icons.date_range)),
                IconButton(
                    onPressed: () {
                      cont.updateContent("Teacher Management");
                    },
                    icon: const Icon(Icons.manage_history)),
                IconButton(
                    onPressed: () {
                      cont.updateContent("Teacher Status");
                    },
                    icon: const Icon(Icons.date_range_sharp)),
                IconButton(
                    onPressed: () {
                      cont.updateContent("All Employee");
                    },
                    icon: const Icon(Icons.work)),
                IconButton(
                    onPressed: () {
                      cont.updateContent("Employee Status");
                    },
                    icon: const Icon(Icons.date_range)),
              ],
            );
          }),
        )
      ],
    );
  }
}
