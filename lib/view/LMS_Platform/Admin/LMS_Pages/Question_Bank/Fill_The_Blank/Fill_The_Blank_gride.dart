import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vms_school/Link/API/LMS_APIs/QuestionAPI/Choose_The_Correct_API.dart/Delete_Choose_The_Correct_API.dart';
import 'package:vms_school/Link/API/LMS_APIs/QuestionAPI/Fill_The_Blanks_API.dart/Delete_Fill_The_Blanks_API.dart';
import 'package:vms_school/Link/Controller/AdminController/Employee_Controllers/Add_Data_controller.dart';
import 'package:vms_school/Link/Controller/LMS_Controllers/Admin_LMS/QuestionBank_Controllers/Fill_The_Blank_Controller.dart';
import 'package:vms_school/Translate/local_controller.dart';
import 'package:vms_school/view/Both_Platform/widgets/ButtonsDialog.dart';
import 'package:vms_school/view/Both_Platform/widgets/Squer_Button_Enabled_Disabled.dart';
import 'package:vms_school/view/Both_Platform/widgets/VMSAlertDialog.dart';

class Fill_The_Blank_gride extends StatefulWidget {
  const Fill_The_Blank_gride({super.key});

  @override
  State<Fill_The_Blank_gride> createState() => _Fill_The_Blank_grideState();
}

class _Fill_The_Blank_grideState extends State<Fill_The_Blank_gride> {
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
            child: GetBuilder<Fill_The_Blank_Controller>(builder: (controller) {
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

  Widget _buildQuestionItem(BuildContext context,
      Fill_The_Blank_Controller controller, int index, double screenWidth) {
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
                    child: Wrap(
                      crossAxisAlignment: WrapCrossAlignment.end,
                      spacing: 10.0,
                      runSpacing: 10.0,
                      children: _buildTextWithDividers(
                        context,
                        "${index + 1})- ${controller.filterdQuestions![index].description}",
                      ),
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
                                        await Delete_Fill_The_Blanks_API()
                                            .Delete_Fill_The_Blanks(
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
                                          "Are you sure you want to delete this question ?"
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

// دالة لبناء قائمة من العناصر (نصوص وdividers)
List<Widget> _buildTextWithDividers(BuildContext context, String text) {
  final pattern = RegExp(r'\[\.{3}\]'); // يبحث عن [...]
  final parts = text.split(pattern);
  List<Widget> widgets = [];

  for (int i = 0; i < parts.length; i++) {
    widgets.add(
      Text(
        parts[i],
        style: Theme.of(context).textTheme.titleMedium?.copyWith(fontSize: 16),
        maxLines: 10,
      ),
    );

    // إضافة Divider بعد كل جزء ماعدا الأخير
    if (i < parts.length - 1) {
      widgets.add(
        Container(
          decoration: BoxDecoration(
              color: Get.theme.textTheme.titleMedium!.color,
              borderRadius: BorderRadius.all(Radius.circular(50))),
          alignment: Alignment.center,
          width: 70,
          height: 1,
        ),
      );
    }
  }

  return widgets;
}
