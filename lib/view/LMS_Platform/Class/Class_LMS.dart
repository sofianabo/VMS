import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vms_school/Link/API/API.dart';
import 'package:vms_school/Link/API/LMS_APIs/Admin/GetNumberOfContentAPI.dart';
import 'package:vms_school/Link/Controller/LMS_Controllers/Admin_LMS/Selected_Screen.dart';
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
import 'package:vms_school/view/SMS_Platform/Admin/Admin_Main_Screens/AdminHome.dart';

class Class_LMS_Screen extends StatefulWidget {
  Class_LMS_Screen({super.key});

  @override
  State<Class_LMS_Screen> createState() => _Class_LMS_ScreenState();
}

class _Class_LMS_ScreenState extends State<Class_LMS_Screen> {
  @override
  void initState() {
    Getnumberofcontentapi()
        .Getnumberofcontent(int.parse(prefs!.getString("classId").toString()));
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
            if (controller.teacherid != null && controller.moveMenu.length <= 1)
              TeacherRowWidget(),
            SizedBox(
              height: 20,
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
                      return Pageslmsmangament();
                    } else if (current == "Quiz".tr) {
                      return QuizLmspage();
                    } else if (current == "Question Bank".tr) {
                      // return QuestionBankPage();
                      return Text("هذا القسم متوقف حالياً");
                    } else if (current == "True or False".tr) {
                      // return Trueorfalsequestionmanagment();
                      return Text("هذا القسم متوقف حالياً");
                    } else if (current == "MultiChoise".tr) {
                      // return Multi_Choise_Question();
                      return Text("هذا القسم متوقف حالياً");
                    } else if (current == "Matching".tr) {
                      // return Matching_Question();
                      return Text("هذا القسم متوقف حالياً");
                    } else if (current == "article".tr) {
                      // return Articlequestionmanagment();
                      return Text("هذا القسم متوقف حالياً");
                    } else if (current == "Choose the correct answer".tr) {
                      // return Choose_the_correct_answer();
                      return Text("هذا القسم متوقف حالياً");
                    } else if (current == "Fill in the blanks".tr) {
                      // return Fill_The_Blank();
                      return Text("هذا القسم متوقف حالياً");
                    } else if (current == "Drag and Drop".tr) {
                      // return Dragdrop_Question();
                      return Text("هذا القسم متوقف حالياً");
                    } else if (current == "Trivia".tr) {
                      // return Text("Trivia");
                      return Text("هذا القسم متوقف حالياً");
                    } else if (current == "All Students".tr) {
                      return LMS_Students();
                    } else if (current == "Homework".tr) {
                      return Homeworkmanagement();
                    } else if (current == "Add Questions".tr) {
                      // return QuizQuestion();
                      return Text("هذا القسم متوقف حالياً");
                    } else {
                      return SelectedClassLMs();
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

class TeacherRowWidget extends StatelessWidget {
  const TeacherRowWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<Selected_Class_Controller>();

    // نظهر الـ Row فقط إذا المعلم موجود وmoveMenu <= 1
    if (controller.teacherid == null || controller.moveMenu.length > 1) {
      return const SizedBox.shrink();
    }

    return Padding(
      padding: const EdgeInsets.only(left: 50.0, right: 50.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          PopupMenuButton<int>(
            tooltip: "",
            onSelected: (value) async {
              if (value == 1) {
                // تمديد ساعة
                controller.extendTime(3600);
                print("⏰ تم تمديد الوقت لساعة إضافية");
              } else if (value == 2) {
                controller.logoutUser();
                print("🚪 تسجيل الخروج");
              }
            },
            itemBuilder: (context) => [
              PopupMenuItem(
                value: 1,
                child: Row(
                  children: [
                    Icon(Icons.access_time,
                        size: 18, color: Get.theme.primaryColor),
                    const SizedBox(width: 8),
                    Text(
                      "تمديد الوقت",
                      style: TextStyle(
                        fontSize: 12,
                        color: Get.theme.primaryColor,
                      ),
                    ),
                  ],
                ),
              ),
              PopupMenuItem(
                value: 2,
                child: Row(
                  children: const [
                    Icon(Icons.logout, size: 18, color: Color(0xffB03D3D)),
                    SizedBox(width: 8),
                    Text(
                      "تسجيل الخروج",
                      style: TextStyle(fontSize: 12, color: Color(0xffB03D3D)),
                    ),
                  ],
                ),
              ),
            ],
            child: GetBuilder<Selected_Class_Controller>(
              builder: (_) {
                final imageId = controller.imageid;
                final fullName = controller.fullname ?? "";

                return Container(
                  height: 40,
                  width: 200,
                  decoration: BoxDecoration(
                    color: Theme.of(context).cardColor,
                    border: Border.all(color: const Color(0xffDAD0D0)),
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(3.0),
                        child: CircleAvatar(
                          radius: 20,
                          backgroundColor: Theme.of(context).primaryColorLight,
                          child: (imageId != null && imageId != 0)
                              ? CircleAvatar(
                                  radius: 20,
                                  backgroundColor:
                                      Theme.of(context).primaryColor,
                                  backgroundImage: NetworkImage(
                                    "$getimage$imageId",
                                  ),
                                )
                              : Text(
                                  fullName.isNotEmpty
                                      ? fullName.substring(0, 1).toUpperCase()
                                      : "?",
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 12,
                                  ),
                                ),
                        ),
                      ),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.only(left: 5.0),
                          child: Text(
                            fullName,
                            textAlign: TextAlign.center,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: Get.theme.textTheme.bodyMedium!
                                .copyWith(fontSize: 12),
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
          Obx(() {
            final seconds = controller.remainingSeconds.value;
            final minutes = (seconds ~/ 60).toString().padLeft(2, '0');
            final secs = (seconds % 60).toString().padLeft(2, '0');

            return Container(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
              decoration: BoxDecoration(
                color: Colors.black.withOpacity(0.05),
                borderRadius: BorderRadius.circular(5),
              ),
              child: Row(
                children: [
                  Icon(Icons.timer, size: 16, color: Get.theme.primaryColor),
                  const SizedBox(width: 5),
                  Text(
                    "$minutes:$secs",
                    style: TextStyle(
                      fontSize: 12,
                      color: Get.theme.primaryColor,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            );
          }),
        ],
      ),
    );
  }
}
