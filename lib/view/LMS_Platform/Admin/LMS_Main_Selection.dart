import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vms_school/Link/Controller/LMS_Controllers/Admin_LMS/Selected_Screen.dart';
import 'package:vms_school/Translate/local_controller.dart';
import 'package:vms_school/view/LMS_Platform/Admin/Admin_Main_Screens/AppBarTransaction.dart';
import 'package:vms_school/view/LMS_Platform/Admin/LMS_Pages/Curriculum_LMS/Curriculum_Management.dart';
import 'package:vms_school/view/LMS_Platform/Admin/LMS_Pages/Division_LMS/Division_Grid.dart';
import 'package:vms_school/view/LMS_Platform/Admin/LMS_Pages/Division_LMS/HomeWorkManagement.dart';
import 'package:vms_school/view/LMS_Platform/Admin/LMS_Pages/Files_LMS/Files_LMS.dart';
import 'package:vms_school/view/LMS_Platform/Admin/LMS_Pages/LinksLMS/LinkLMSMangamnt.dart';
import 'package:vms_school/view/LMS_Platform/Admin/LMS_Pages/Question_Bank/Question_Bank_Page.dart';
import 'package:vms_school/view/LMS_Platform/Admin/LMS_Pages/Selected_Class_Screen.dart';
import 'package:vms_school/view/LMS_Platform/Admin/LMS_Pages/Students_LMS/LMS_Student.dart';

class Selected_Class_Screen extends StatelessWidget {
  Selected_Class_Screen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Appbartransaction(),
          SizedBox(
            height: 10,
          ),
          Expanded(
            child: Directionality(
              textDirection: Get.find<LocalizationController>()
                          .currentLocale
                          .value
                          .languageCode ==
                      'ar'
                  ? TextDirection.rtl
                  : TextDirection.ltr,
              child: GetBuilder<Selected_Class_Controller>(
                builder: (controller) {
                  if (controller.moveMenu.isEmpty) return SelectedClassLMs();

                  final current = controller.moveMenu.last;

                  if (current == "Curriculum".tr) {
                    return Curriculum_ManagementLMS();
                  } else if (current == "Divisions".tr) {
                    return DivisionGrid();
                  } else if (current == "Files".tr) {
                    return Files_LMS();
                  } else if (current == "Links".tr) {
                    return Linklmsmangamnt();
                  } else if (current == "Pages".tr) {
                    return Text("Pages");
                  } else if (current == "Quiz".tr) {
                    return Text("Quiz");
                  } else if (current == "Question Bank".tr) {
                    return QuestionBankPage();
                  } else if (current == "Trivia".tr) {
                    return Text("Trivia");
                  } else if (current == "All Students".tr) {
                    return LMS_Students();
                  } else if (current == "Homework".tr) {
                    return Homeworkmanagement();
                  } else {
                    return SelectedClassLMs();
                  }
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
