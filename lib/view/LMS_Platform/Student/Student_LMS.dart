import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vms_school/Link/API/API.dart';
import 'package:vms_school/Link/API/LMS_APIs/Admin/GetNumberOfContentAPI.dart';
import 'package:vms_school/Link/API/LMS_APIs/StudentLms/NumberOfContentStudentAPI.dart';
import 'package:vms_school/Link/API/OpenURLs.dart';
import 'package:vms_school/Link/Controller/LMS_Controllers/Admin_LMS/Selected_Screen.dart';
import 'package:vms_school/Link/Controller/LMS_Controllers/StudentLMSController.dart/MainPageContentController.dart';
import 'package:vms_school/Translate/local_controller.dart';
import 'package:vms_school/main.dart';
import 'package:vms_school/view/LMS_Platform/Admin/Admin_Main_Screens/AppBarTransaction.dart';
import 'package:vms_school/view/LMS_Platform/Admin/LMS_Pages/Curriculum_LMS/Curriculum_Management.dart';
import 'package:vms_school/view/LMS_Platform/Admin/LMS_Pages/Division_LMS/Division_Grid.dart';
import 'package:vms_school/view/LMS_Platform/Admin/LMS_Pages/Division_LMS/HomeWorkManagement.dart';
import 'package:vms_school/view/LMS_Platform/Admin/LMS_Pages/Files_LMS/Files_LMS.dart';
import 'package:vms_school/view/LMS_Platform/Admin/LMS_Pages/LinksLMS/LinkLMSMangamnt.dart';
import 'package:vms_school/view/LMS_Platform/Admin/LMS_Pages/Pages_LmsScreen/PagesLmsMangament.dart';
import 'package:vms_school/view/LMS_Platform/Admin/LMS_Pages/Question_Bank/ArticleQuestion/ArticleQuestionManagment.dart';
import 'package:vms_school/view/LMS_Platform/Admin/LMS_Pages/Question_Bank/Choose_The_Correct_Answer/Choose_the_correct_answer.dart';
import 'package:vms_school/view/LMS_Platform/Admin/LMS_Pages/Question_Bank/DragDrop_Question.dart/DragDrop_Question.dart';
import 'package:vms_school/view/LMS_Platform/Admin/LMS_Pages/Question_Bank/Fill_The_Blank/Fill_The_Blank.dart';
import 'package:vms_school/view/LMS_Platform/Admin/LMS_Pages/Question_Bank/MatchingQuestion/MatchingQuestion.dart';
import 'package:vms_school/view/LMS_Platform/Admin/LMS_Pages/Question_Bank/MultiChoiseQuestion.dart/Multi_Choise_Question.dart';
import 'package:vms_school/view/LMS_Platform/Admin/LMS_Pages/Question_Bank/Question_Bank_Page.dart';
import 'package:vms_school/view/LMS_Platform/Admin/LMS_Pages/Question_Bank/TrueOrFalse/TrueOrFalseQuestionManagment.dart';
import 'package:vms_school/view/LMS_Platform/Admin/LMS_Pages/Quiz_Pages_LMS/Quiz_Page/Quiz_LMSPage.dart';
import 'package:vms_school/view/LMS_Platform/Admin/LMS_Pages/Quiz_Pages_LMS/Quiz_Question_LMS/Quiz_Question.dart';
import 'package:vms_school/view/LMS_Platform/Admin/LMS_Pages/Selected_Class_Screen.dart';
import 'package:vms_school/view/LMS_Platform/Admin/LMS_Pages/Students_LMS/LMS_Student.dart';
import 'package:vms_school/view/LMS_Platform/Student/FilesStudent/FileStudentMange.dart';
import 'package:vms_school/view/LMS_Platform/Student/HomeworkStudent/HomeworkStudentMange.dart';
import 'package:vms_school/view/LMS_Platform/Student/LinkStudent/LinkStudentMange.dart';
import 'package:vms_school/view/LMS_Platform/Student/PageStudent/PageStudentMange.dart';
import 'package:vms_school/view/LMS_Platform/Student/QuizStudent/QuizStudentMange.dart';
import 'package:vms_school/view/LMS_Platform/Student/SelectedStudentLMs.dart';
import 'package:vms_school/view/LMS_Platform/Student/StudentProfile.dart';
import 'package:vms_school/view/LMS_Platform/Student/curriulumStudentLMSScreen.dart';

class Student_Home_LMS extends StatefulWidget {
  Student_Home_LMS({super.key});

  @override
  State<Student_Home_LMS> createState() => _Student_Home_LMSState();
}

class _Student_Home_LMSState extends State<Student_Home_LMS> {
  @override
  void initState() {
    Numberofcontentstudentapi().Numberofcontentstudent(
        int.parse(prefs!.getString("classId").toString()));
    Get.find<Selected_Class_Controller>().initialinClass(
        prefs!.getString("fullname").toString(),
        int.parse(prefs!.getString("classId").toString()));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GetBuilder<Selected_Class_Controller>(builder: (controller) {
        return Column(
          children: [
            Appbartransaction(),
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
                    if (controller.moveMenu.isEmpty)
                      return Selectedstudentlms();

                    final current = controller.moveMenu.last;

                    if (current == "Curriculum".tr) {
                      return Curriulumstudentlmsscreen();
                    }
                     else if (current == "My Profile".tr) {
                      return Studentprofile();
                    } 
                     else if (current == "Homework".tr) {
                      return Homeworkstudentmange();
                    } else if (current == "Files".tr) {
                      return Filestudentmange();
                    } else if (current == "Links".tr) {
                      return Linkstudentmange();
                    } else if (current == "Pages".tr) {
                      return Pagestudentmange();
                    } else if (current == "Quiz".tr) {
                      // return Quizstudentmange();
                                          return Text("هذا القسم متوقف حالياً");

                    }  else if (current == "Trivia".tr) {
                      // return Text("Trivia");
                                          return Text("هذا القسم متوقف حالياً");

                    }
                    
                     else {
                      return Selectedstudentlms();
                    }
                  },
                ),
              ),
            ),
          ],
        );
      }),
    );
  }
}
