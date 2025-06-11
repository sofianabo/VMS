import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vms_school/Icons_File/LMS_Icons/l_m_s__icons_icons.dart';

class Selected_Class_Controller extends GetxController {
  List<String> moveMenu = [];
  int? classid;
  int? divisionid;
  initialinClass(String value, int id) {
    moveMenu = [];
    moveMenu.add(value);
    classid = id;
    update();
  }

  void addToPath(String value) {
    final existingIndex = moveMenu.indexOf(value);
    if (existingIndex != -1) {
      moveMenu = moveMenu.sublist(0, existingIndex + 1);
    } else {
      moveMenu.add(value);
    }
    update();
  }

  // عند الضغط على عنصر: نمسح كل ما بعده
  void onItemTap(int index) {
    moveMenu = moveMenu.sublist(0, index + 1);
    update();
    print('المسار الحالي: ${moveMenu.join(" / ")}');
  }

  List<Map<String, dynamic>> dataList = [
    {
      "name": "Curriculums".tr,
      "subtitle":
          "The section contains the study materials for the specified Class level."
              .tr,
      "icon": LMS_Icons.curr_lms,
    },
    {
      "name": "Divisions".tr,
      "subtitle":
          "This section contains the Divisionس within the specified Class level."
              .tr,
      "icon": LMS_Icons.divisions_lms,
    },
    {
      "name": "Files".tr,
      "subtitle":
          "This section contains files from previous lessons, as well as reviews, summaries, and facilities for the student"
              .tr,
      "icon": LMS_Icons.files_lms,
    },
    {
      "name": "Links".tr,
      "subtitle":
          "This section contains hyperlinks to files, images, activities, etc."
              .tr,
      "icon": LMS_Icons.links_lms,
    },
    {
      "name": "Pages".tr,
      "subtitle":
          "This section contains the electronic page that is uploaded to external sites to facilitate opening it for all users"
              .tr,
      "icon": LMS_Icons.pages_lms,
    },
    {
      "name": "Quiz".tr,
      "subtitle":
          "This section contains a short test aimed at assessing students and includes a variety of short questions."
              .tr,
      "icon": LMS_Icons.quiz_lms,
    },
    {
      "name": "Question Bank".tr,
      "subtitle":
          "This section contains a set of questions that are organized and stored electronically in advance and are used in preparing tests and assessments."
              .tr,
      "icon": LMS_Icons.qustion_bank_lms,
    },
    {
      "name": "Trivia".tr,
      "subtitle":
          "This section contains activities that include various questions about general information about all curricula within the class."
              .tr,
      "icon": LMS_Icons.sopor_lms,
    },
  ];

  bool isLoading = false;
}
