import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vms_school/Link/API/LMS_APIs/QuestionAPI/ArticleAPI/DeleteArticleAPI.dart';
import 'package:vms_school/Link/Controller/AdminController/Employee_Controllers/Add_Data_controller.dart';
import 'package:vms_school/Link/Controller/LMS_Controllers/Admin_LMS/QuestionBank_Controllers/ArticleQuestionController.dart';
import 'package:vms_school/Link/Controller/LMS_Controllers/Admin_LMS/Quiz_Controller/Quiz_Questions_Controller.dart';
import 'package:vms_school/Link/Model/LMS_Model/Questions_Models/Quiz_Qustions_Model.dart';
import 'package:vms_school/Translate/local_controller.dart';
import 'package:vms_school/view/Both_Platform/widgets/ButtonsDialog.dart';
import 'package:vms_school/view/Both_Platform/widgets/Squer_Button_Enabled_Disabled.dart';
import 'package:vms_school/view/Both_Platform/widgets/VMSAlertDialog.dart';

class Article_Qustion_Grid_From_Bank extends StatefulWidget {
  const Article_Qustion_Grid_From_Bank({super.key});

  @override
  State<Article_Qustion_Grid_From_Bank> createState() =>
      _Article_Qustion_Grid_From_BankState();
}

class _Article_Qustion_Grid_From_BankState
    extends State<Article_Qustion_Grid_From_Bank> {
  TextEditingController ques = TextEditingController();
  TextEditingController mark = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    int getCrossAxisCount() {
      return 1;
    }

    double getChildAspectRatio() {
      if (screenWidth >= 613) return 3;
      if (screenWidth >= 486) return 2.5;
      return 1.2;
    }

    return Expanded(
      child: Directionality(
        textDirection: Get.find<LocalizationController>()
                    .currentLocale
                    .value
                    .languageCode ==
                'ar'
            ? TextDirection.rtl
            : TextDirection.ltr,
        child: GetBuilder<Articlequestioncontroller>(builder: (controller) {
          return Container(
            width: screenWidth >= 768 ? screenWidth - 70 : 800,
            padding: EdgeInsets.only(bottom: 20.0),
            margin: EdgeInsets.only(top: 10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(5)),
              color: Colors.transparent,
            ),
            child: GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: getCrossAxisCount(),
                  crossAxisSpacing: 20.0,
                  mainAxisSpacing: 20.0,
                  childAspectRatio: getChildAspectRatio()),
              shrinkWrap: true,
              itemCount: controller.filtered_articleQuestion.length,
              itemBuilder: (context, index) {
                return Container(
                  padding: EdgeInsets.all(15),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      border: Border.all(
                          color:
                              Theme.of(context).textTheme.titleMedium!.color!,
                          width: 0.5),
                      color: Theme.of(context).cardColor,
                      boxShadow: const [
                        BoxShadow(
                            color: Colors.black26,
                            offset: Offset(0, 2),
                            blurRadius: 1)
                      ]),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    spacing: 15.0,
                    children: [
                      Expanded(
                          child: Center(
                        child: SingleChildScrollView(
                          child: Text(
                            "${controller.filtered_articleQuestion[index].description}",
                            textAlign: TextAlign.center,
                          ),
                        ),
                      )),
                      Squer_Button_Enabled_Disabled(
                          validate: !(Get.find<Add_Data_controller>().roll !=
                              "observer"),
                          icon: Icons.add,
                          isDelete: false,
                          onTap: () {
                            // إنشاء السؤال مع جميع البيانات المطلوبة
                            QustionList newQuestion = QustionList(
                              id: controller.filtered_articleQuestion[index].id,
                              fileId: controller
                                  .filtered_articleQuestion[index].fileId,
                              type: controller
                                  .filtered_articleQuestion[index].type,
                              description: controller
                                  .filtered_articleQuestion[index].description,
                              isEng: 0,
                              mark: 20, // أو أي قيمة تريدها
                              answer: controller
                                      .filtered_articleQuestion[index].answer ??
                                  [], // تأكد من وجود الإجابات
                            );

// إضافة السؤال
                            Get.find<Quiz_Questions_Controller>()
                                .addSingleQuestionFromBank(newQuestion);
                          }),
                    ],
                  ),
                );
              },
            ),
          );
        }),
      ),
    );
  }
}
