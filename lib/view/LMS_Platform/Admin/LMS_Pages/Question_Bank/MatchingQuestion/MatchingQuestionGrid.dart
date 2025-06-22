import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vms_school/Link/API/LMS_APIs/QuestionAPI/Choose_The_Correct_API.dart/Delete_Choose_The_Correct_API.dart';
import 'package:vms_school/Link/API/LMS_APIs/QuestionAPI/MultiChoiseAPI/Delete_Multi_Choice_API.dart';
import 'package:vms_school/Link/Controller/AdminController/Employee_Controllers/Add_Data_controller.dart';
import 'package:vms_school/Link/Controller/LMS_Controllers/Admin_LMS/QuestionBank_Controllers/Multi_Choise_Question_Controller.dart';
import 'package:vms_school/Translate/local_controller.dart';
import 'package:vms_school/view/Both_Platform/widgets/ButtonsDialog.dart';
import 'package:vms_school/view/Both_Platform/widgets/Squer_Button_Enabled_Disabled.dart';
import 'package:vms_school/view/Both_Platform/widgets/VMSAlertDialog.dart';

class Matching_Question_Grid extends StatefulWidget {
  const Matching_Question_Grid({super.key});

  @override
  State<Matching_Question_Grid> createState() =>
      _Matching_Question_GridState();
}

class _Matching_Question_GridState
    extends State<Matching_Question_Grid> {
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
            child: GetBuilder<Multi_Choise_Question_Controller>(
                builder: (controller) {
              // حساب عدد العناصر
              int itemCount = controller.filterdQuestions!.length;
              if (screenWidth <= 800) {
                return ListView.builder(
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: itemCount,
                  itemBuilder: (context, index) {
                    return _buildQuestionItem(
                        context, controller, index, screenWidth - 40);
                  },
                );
              } else {
                return Container(
                  width: screenWidth,
                  padding: EdgeInsets.only(left: 20, right: 20.0, bottom: 20.0),
                  margin: EdgeInsets.only(left: 20, right: 20.0),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // العمود الأول للأسئلة الفردية (1, 3, 5, ...)
                      Expanded(
                        child: ListView.builder(
                          physics: NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          itemCount: (itemCount + 1) ~/ 2,
                          itemBuilder: (context, index) {
                            int questionIndex = index * 2;
                            if (questionIndex >= itemCount) return SizedBox();
                            return _buildQuestionItem(context, controller,
                                questionIndex, screenWidth / 2 - 30);
                          },
                        ),
                      ),
                      SizedBox(width: 20), // مسافة بين العمودين
                      // العمود الثاني للأسئلة الزوجية (2, 4, 6, ...)
                      Expanded(
                        child: ListView.builder(
                          physics: NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          itemCount: itemCount ~/ 2,
                          itemBuilder: (context, index) {
                            int questionIndex = index * 2 + 1;
                            if (questionIndex >= itemCount) return SizedBox();
                            return _buildQuestionItem(context, controller,
                                questionIndex, screenWidth / 2 - 30);
                          },
                        ),
                      ),
                    ],
                  ),
                );
              }
            }),
          ),
        ),
      ),
    );
  }

  Widget _buildQuestionItem(
      BuildContext context,
      Multi_Choise_Question_Controller controller,
      int index,
      double screenWidth) {
    // الحصول على قائمة الإجابات الصحيحة
    final correctAnswers = controller.filterdQuestions![index].answer!
        .where((answer) => answer.trueAns == 1)
        .toList();

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
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                            maxLines: 10,
                            style: Theme.of(context)
                                .textTheme
                                .titleMedium!
                                .copyWith(fontSize: 16),
                            "${index + 1})- ${controller.filterdQuestions![index].description}"),
                      ],
                    ),
                  ),
                  Row(
                    spacing: 10.0,
                    children: [
                      Squer_Button_Enabled_Disabled(
                          isDelete: true,
                          validate: !(Get.find<Add_Data_controller>().roll !=
                              "observer"),
                          icon: Icons.delete_outline_outlined,
                          onTap: () {
                            Get.dialog(VMSAlertDialog(
                                action: [
                                  ButtonDialog(
                                      text: "Delete".tr,
                                      onPressed: () async {
                                        await Delete_Multi_Choice_Api()
                                            .Delete_Multi_Choice(
                                                question: controller
                                                    .filterdQuestions![index]);
                                      },
                                      color: const Color(0xffB03D3D),
                                      width: 80),
                                  ButtonDialog(
                                      text: "Cancel".tr,
                                      onPressed: () {
                                        Get.back();
                                      },
                                      color: Theme.of(context).primaryColor,
                                      width: 80)
                                ],
                                contents: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Container(width: 400),
                                    Row(
                                      children: [
                                        Text(
                                          "Are you sure you want to delete this question ?".tr
                                              .tr,
                                          style: Get.theme.textTheme.bodyMedium!
                                              .copyWith(
                                                  fontSize: 16,
                                                  fontWeight:
                                                      FontWeight.normal),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                                apptitle: "Delete Question".tr,
                                subtitle: "none"));
                          }),
                    ],
                  )
                ],
              ),
              ListView.builder(
                shrinkWrap: true,
                itemCount: controller.filterdQuestions![index].answer!.length,
                itemBuilder: (context, Question_Index) {
                  final answer = controller
                      .filterdQuestions![index].answer![Question_Index];
                  final isCorrect = answer.trueAns == 1;
                  final color = isCorrect
                      ? const Color(0xff498160)
                      : Theme.of(context).cardColor;

                  return Container(
                    width: screenWidth,
                    padding: const EdgeInsets.all(10),
                    margin: const EdgeInsets.symmetric(vertical: 5.0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      border: Border.all(
                        color: isCorrect
                            ? const Color(0xff498160)
                            : Theme.of(context).textTheme.titleMedium!.color!,
                        width: 0.5,
                      ),
                      color: color,
                      boxShadow: const [
                        BoxShadow(
                          color: Colors.black26,
                          offset: Offset(0, 2),
                          blurRadius: 1,
                        ),
                      ],
                    ),
                    child: Row(
                      children: [
                        if (isCorrect)
                          Padding(
                            padding: const EdgeInsets.only(right: 8.0),
                            child: Icon(Icons.check,
                                color: Colors.white, size: 16),
                          ),
                        Expanded(
                          child: Text(
                            answer.choice ?? '',
                            maxLines: 10,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                              color: isCorrect
                                  ? Colors.white
                                  : Theme.of(context)
                                      .textTheme
                                      .titleMedium!
                                      .color,
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                },
              )
            ],
          ),
        ),
        if (index < controller.filterdQuestions!.length - 1)
          Padding(
            padding: MediaQuery.of(context).size.width >= 800
                ? EdgeInsets.only(bottom: 20, top: 20)
                : EdgeInsets.all(20),
            child: Divider(
              height: 2,
              color: Get.theme.textTheme.titleMedium!.color,
            ),
          )
      ],
    );
  }
}
