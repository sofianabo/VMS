import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vms_school/Link/API/LMS_APIs/QuestionAPI/Fill_The_Blanks_API.dart/Delete_Fill_The_Blanks_API.dart';
import 'package:vms_school/Link/Controller/AdminController/Employee_Controllers/Add_Data_controller.dart';
import 'package:vms_school/Link/Controller/LMS_Controllers/Admin_LMS/Quiz_Controller/Quiz_Fill_The_Blank_Controller.dart';
import 'package:vms_school/Link/Controller/LMS_Controllers/Admin_LMS/Quiz_Controller/Quiz_Questions_Controller.dart';
import 'package:vms_school/Link/Model/LMS_Model/Questions_Models/Quiz_Qustions_Model.dart';
import 'package:vms_school/Translate/local_controller.dart';
import 'package:vms_school/view/Both_Platform/widgets/ButtonsDialog.dart';
import 'package:vms_school/view/Both_Platform/widgets/Squer_Button_Enabled_Disabled.dart';
import 'package:vms_school/view/Both_Platform/widgets/VMSAlertDialog.dart';

class Quiz_Fill_The_Blank_QBank_gride extends StatefulWidget {
  const Quiz_Fill_The_Blank_QBank_gride({super.key});

  @override
  State<Quiz_Fill_The_Blank_QBank_gride> createState() =>
      _Quiz_Fill_The_Blank_QBank_grideState();
}

class _Quiz_Fill_The_Blank_QBank_grideState
    extends State<Quiz_Fill_The_Blank_QBank_gride> {
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
            child: GetBuilder<Quiz_Fill_The_Blank_Controller>(
                builder: (controller) {
              int itemCount = controller.filterdQuestions!.length;
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

  Widget _buildQuestionItem(
      BuildContext context,
      Quiz_Fill_The_Blank_Controller controller,
      int index,
      double screenWidth) {
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
                          isDelete: false,
                          validate: !(Get.find<Add_Data_controller>().roll !=
                              "observer"),
                          icon: Icons.add,
                          onTap: () {
                            QustionList newQuestion = QustionList(
                              id: controller.filterdQuestions![index].id,
                              fileId: null,
                              type: controller.filterdQuestions![index].type,
                              description: controller
                                  .filterdQuestions![index].description,
                              isEng: 0,
                              mark: 20,
                              answer: [], // تحويل إلى List<Answer>
                            );
                            // إنشاء السؤال مع جميع البيانات المطلوبة

                            Get.find<Quiz_Questions_Controller>()
                                .addSingleQuestionFromBank(newQuestion);
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
