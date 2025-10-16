import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vms_school/Icons_File/LMS_Icons/l_m_s__icons_icons.dart';
import 'package:vms_school/Link/Controller/LMS_Controllers/Admin_LMS/Selected_Screen.dart';
import 'package:vms_school/Link/Model/LMS_Model/NumberOfContentModel.dart';
import 'package:vms_school/Link/Model/LMS_Model/StudentModel/NumberOfContentStudentModel.dart';

class Mainpagecontentcontroller extends GetxController {
  int? curriculmCount;
  int? probeCount;
  int? quizCount;
  int? fileCount;
  int? pageCount;
  int? urlCount;
  int? homeworkCount;
  String? urlMeet;

  setContentLMS(NumberOfContentStudentModel content) {
    curriculmCount = content.curriculmCount;
    probeCount = content.probeCount;
    quizCount = content.quizCount;
    fileCount = content.fileCount;
    pageCount = content.pageCount;
    urlCount = content.urlCount;
    urlMeet = content.meetUrl;
    homeworkCount = content.homework;
    Get.find<Selected_Class_Controller>().SetDataList([
      // {
      //   "name": "My Profile".tr,
      //   "subtitle":
      //       "This section contains your information and setting."
      //           .tr,
      //   "icon": LMS_Icons.divisions_lms,
      //   "count": 1,
      // },
      {
        "name": "Division Room".tr,
        "subtitle":
            "This section contains the Divisionس within the specified Class level."
                .tr,
        "icon": LMS_Icons.divisions_lms,
        "count": 1,
      },
      {
        "name": "Curriculum".tr,
        "subtitle":
            "The section contains the study materials for the specified Class level."
                .tr,
        "icon": LMS_Icons.curr_lms,
        "count": curriculmCount ?? 0,
      },
      {
        "name": "Homework".tr,
        "subtitle":
            "This section contains files from previous lessons, as well as reviews, summaries, and facilities for the student"
                .tr,
        "icon": LMS_Icons.files_lms,
        "count": homeworkCount ?? 0,
      },
      {
        "name": "Files".tr,
        "subtitle":
            "This section contains files from previous lessons, as well as reviews, summaries, and facilities for the student"
                .tr,
        "icon": LMS_Icons.files_lms,
        "count": fileCount ?? 0,
      },
      {
        "name": "Pages".tr,
        "subtitle":
            "This section contains the electronic page that is uploaded to external sites to facilitate opening it for all users"
                .tr,
        "icon": LMS_Icons.pages_lms,
        "count": pageCount ?? 0,
      },
      {
        "name": "Links".tr,
        "subtitle":
            "This section contains hyperlinks to files, images, activities, etc."
                .tr,
        "icon": LMS_Icons.links_lms,
        "count": urlCount ?? 0,
      },
      {
        "name": "Quiz".tr,
        "subtitle":
            "This section contains a short test aimed at assessing students and includes a variety of short questions."
                .tr,
        "icon": LMS_Icons.quiz_lms,
        "count": quizCount ?? 0,
      },
      {
        "name": "Trivia".tr,
        "subtitle":
            "This section contains activities that include various questions about general information about all curricula within the class."
                .tr,
        "icon": LMS_Icons.sopor_lms,
        "count": probeCount ?? 0,
      },
      {
        "name": "Tables".tr,
        "subtitle":
            "This section provides a view of all the tables of the current class, such as the schedule, tests, and exams."
                .tr,
        "icon": Icons.table_view_outlined,
        "count": "",
      },
      {
        "name": "Logout".tr,
        "subtitle":
            "This section contains activities that include various questions about general information about all curricula within the class."
                .tr,
        "icon": Icons.logout,
        "count": "",
      },
    ]);
    update();
  }
}
