import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vms_school/Link/API/LMS_APIs/Admin/DeleteLinkLmsAPI.dart';
import 'package:vms_school/Link/API/LMS_APIs/Admin/ShowAnHiddenLinkLmsAPI.dart';
import 'package:vms_school/Link/API/LMS_APIs/QuestionAPI/TrueOrFalseAPI.dart/DeleteTrueOrFlaseAPI.dart';
import 'package:vms_school/Link/API/OpenURLs.dart';
import 'package:vms_school/Link/Controller/AdminController/Employee_Controllers/Add_Data_controller.dart';
import 'package:vms_school/Link/Controller/LMS_Controllers/Admin_LMS/LinksLMS_Controller.dart';
import 'package:vms_school/Link/Controller/LMS_Controllers/Admin_LMS/Quiz_Controller/Quiz_Questions_Controller.dart';
import 'package:vms_school/Link/Controller/LMS_Controllers/Admin_LMS/TrueOrFalseController.dart';
import 'package:vms_school/Link/Model/LMS_Model/Questions_Models/Quiz_Qustions_Model.dart';
import 'package:vms_school/Translate/local_controller.dart';
import 'package:vms_school/view/Both_Platform/widgets/ButtonsDialog.dart';
import 'package:vms_school/view/Both_Platform/widgets/Squer_Button_Enabled_Disabled.dart';
import 'package:vms_school/view/Both_Platform/widgets/TextFildWithUpper.dart';
import 'package:vms_school/view/Both_Platform/widgets/VMSAlertDialog.dart';

class Quiz_True_Or_False_Manage_Gride extends StatefulWidget {
  const Quiz_True_Or_False_Manage_Gride({super.key});

  @override
  State<Quiz_True_Or_False_Manage_Gride> createState() =>
      _Quiz_True_Or_False_Manage_GrideState();
}

class _Quiz_True_Or_False_Manage_GrideState
    extends State<Quiz_True_Or_False_Manage_Gride> {
  TextEditingController ques = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return Expanded(
      child: Padding(
        padding: const EdgeInsets.only(top: 22.0),
        child: Directionality(
          textDirection: Get.find<LocalizationController>()
                      .currentLocale
                      .value
                      .languageCode ==
                  'ar'
              ? TextDirection.rtl
              : TextDirection.ltr,
          child: SingleChildScrollView(
            child: GetBuilder<Trueorfalsecontroller>(builder: (controller) {
              int itemCount = controller.filtered_questions.length;
              return ListView.builder(
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: itemCount,
                itemBuilder: (context, index) {
                  return _buildQuestionItem(
                      context, controller, index, screenWidth - 40);
                },
              );
            }),
          ),
        ),
      ),
    );
  }

  Widget _buildQuestionItem(BuildContext context,
      Trueorfalsecontroller controller, int index, double screenWidth) {
    bool currentChoice =
        controller.filtered_questions[index].answer?.boolianChoise == 1;

    return Column(
      children: [
        Container(
          decoration: BoxDecoration(
            border: Border.all(
              color: Theme.of(context).textTheme.titleMedium!.color!,
              width: 0.5,
            ),
          ),
          width: screenWidth,
          padding: const EdgeInsets.all(20),
          child: Column(
            spacing: 20.0,
            crossAxisAlignment: Get.find<LocalizationController>()
                        .currentLocale
                        .value
                        .languageCode ==
                    'ar'
                ? CrossAxisAlignment.start
                : CrossAxisAlignment.end,
            mainAxisAlignment: Get.find<LocalizationController>()
                        .currentLocale
                        .value
                        .languageCode ==
                    'ar'
                ? MainAxisAlignment.start
                : MainAxisAlignment.end,
            children: [
              Row(
                spacing: 30.0,
                children: [
                  Expanded(
                    child: Text(
                        maxLines: 10,
                        "${index + 1})- ${controller.filtered_questions[index].description}"),
                  ),
                  Row(
                    spacing: 10.0,
                    children: [
                      Squer_Button_Enabled_Disabled(
                          validate: !(Get.find<Add_Data_controller>().roll !=
                              "observer"),
                          icon: Icons.add,
                          isDelete: false,
                          onTap: () {
                            QustionList newQuestion = QustionList(
                              id: controller.filtered_questions[index].id,
                              fileId: null,
                              type: controller.filtered_questions[index].type,
                              description: controller
                                  .filtered_questions[index].description,
                              isEng: 0,
                              mark: 20,
                              answer: [
                                if (controller.filtered_questions[index].answer!
                                        .boolianChoise !=
                                    null)
                                  Answer(
                                    id: null,
                                    choise: controller.filtered_questions[index]
                                                .isEng !=
                                            null
                                        ? "True"
                                        : "صح",
                                    trueAcss: controller
                                                .filtered_questions[index]
                                                .answer!
                                                .boolianChoise ==
                                            1
                                        ? 1
                                        : 0,
                                  ),
                                if (controller.filtered_questions[index].answer!
                                        .boolianChoise !=
                                    null)
                                  Answer(
                                    id: null,
                                    choise: controller.filtered_questions[index]
                                                .isEng !=
                                            null
                                        ? "False"
                                        : "خطأ",
                                    trueAcss: controller
                                                .filtered_questions[index]
                                                .answer!
                                                .boolianChoise ==
                                            1
                                        ? 0
                                        : 1,
                                  ),
                              ],
                            );
                            // إنشاء السؤال مع جميع البيانات المطلوبة

                            Get.find<Quiz_Questions_Controller>()
                                .addSingleQuestionFromBank(newQuestion);
                          }),
                    ],
                  ),
                ],
              ),
              Row(
                spacing: 20,
                children: [
                  Radio<bool>(
                      overlayColor: WidgetStatePropertyAll(Colors.transparent),
                      activeColor: Get.theme.primaryColor,
                      value: true,
                      groupValue:
                          currentChoice, // يمكنك استبدالها بمتغير لحفظ القيمة المحددة
                      onChanged: (bool? value) {}),
                  Text(controller.filtered_questions[index].isEng == 1
                      ? "True"
                      : "صح"),
                  Radio<bool>(
                      overlayColor: WidgetStatePropertyAll(Colors.transparent),
                      activeColor: Get.theme.primaryColor,
                      value: false,
                      groupValue:
                          currentChoice, // يمكنك استبدالها بمتغير لحفظ القيمة المحددة
                      onChanged: (bool? value) {}),
                  Text(controller.filtered_questions[index].isEng == 1
                      ? "False"
                      : "خطأ"),
                ],
              ),
            ],
          ),
        ),
        if (index < controller.filtered_questions!.length - 1)
          Padding(
            padding: MediaQuery.of(context).size.width >= 800
                ? EdgeInsets.only(bottom: 20, top: 20)
                : EdgeInsets.all(20),
            child: Divider(
              height: 3,
              color: Get.theme.textTheme.titleMedium!.color,
            ),
          )
      ],
    );
  }
}
