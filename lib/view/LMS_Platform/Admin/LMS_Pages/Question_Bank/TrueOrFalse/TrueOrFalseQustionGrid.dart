import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vms_school/Link/API/LMS_APIs/Admin/DeleteLinkLmsAPI.dart';
import 'package:vms_school/Link/API/LMS_APIs/Admin/ShowAnHiddenLinkLmsAPI.dart';
import 'package:vms_school/Link/API/LMS_APIs/QuestionAPI/TrueOrFalseAPI.dart/DeleteTrueOrFlaseAPI.dart';
import 'package:vms_school/Link/API/OpenURLs.dart';
import 'package:vms_school/Link/Controller/AdminController/Employee_Controllers/Add_Data_controller.dart';
import 'package:vms_school/Link/Controller/LMS_Controllers/Admin_LMS/LinksLMS_Controller.dart';
import 'package:vms_school/Link/Controller/LMS_Controllers/Admin_LMS/TrueOrFalseController.dart';
import 'package:vms_school/Translate/local_controller.dart';
import 'package:vms_school/view/Both_Platform/widgets/ButtonsDialog.dart';
import 'package:vms_school/view/Both_Platform/widgets/Squer_Button_Enabled_Disabled.dart';
import 'package:vms_school/view/Both_Platform/widgets/TextFildWithUpper.dart';
import 'package:vms_school/view/Both_Platform/widgets/VMSAlertDialog.dart';

class Trueorfalsequstiongrid extends StatefulWidget {
  const Trueorfalsequstiongrid({super.key});

  @override
  State<Trueorfalsequstiongrid> createState() => _TrueorfalsequstiongridState();
}

class _TrueorfalsequstiongridState extends State<Trueorfalsequstiongrid> {
  TextEditingController ques = TextEditingController();
  TextEditingController mark = TextEditingController();
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
              int itemCount = controller.filtered_questions!.length;
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
                          itemCount: itemCount ~/ 2, //
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
                          icon: Icons.delete_outline_outlined,
                          isDelete: true,
                          onTap: () {
                            Get.dialog(VMSAlertDialog(
                                action: [
                                  ButtonDialog(
                                      text: "Delete".tr,
                                      onPressed: () async {
                                        Deletetrueorflaseapi(context)
                                            .Deletetrueorflase(
                                          question: controller
                                              .filtered_questions![index],
                                        );
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
                                    Container(
                                      width: 400,
                                    ),
                                    Row(
                                      children: [
                                        Text(
                                          "Do You Want To deletequestion".tr +
                                              " (${controller.filtered_questions![index].description}) " +
                                              "qustionn".tr,
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
