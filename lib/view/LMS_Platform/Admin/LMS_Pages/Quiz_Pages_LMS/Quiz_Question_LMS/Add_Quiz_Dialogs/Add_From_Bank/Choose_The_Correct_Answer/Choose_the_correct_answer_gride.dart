import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vms_school/Link/Controller/AdminController/Employee_Controllers/Add_Data_controller.dart';
import 'package:vms_school/Link/Controller/LMS_Controllers/Admin_LMS/Quiz_Controller/Quiz_Questions_Controller.dart';
import 'package:vms_school/Link/Controller/LMS_Controllers/Admin_LMS/Quiz_Controller/Quiz_SingleChoice_Controller.dart';
import 'package:vms_school/Link/Model/LMS_Model/Questions_Models/Quiz_Qustions_Model.dart';
import 'package:vms_school/Translate/local_controller.dart';
import 'package:vms_school/view/Both_Platform/widgets/Squer_Button_Enabled_Disabled.dart';

class Add_Single_Choose_Quiz_From_Bank_Gride extends StatefulWidget {
  const Add_Single_Choose_Quiz_From_Bank_Gride({super.key});

  @override
  State<Add_Single_Choose_Quiz_From_Bank_Gride> createState() =>
      _Add_Single_Choose_Quiz_From_Bank_GrideState();
}

class _Add_Single_Choose_Quiz_From_Bank_GrideState
    extends State<Add_Single_Choose_Quiz_From_Bank_Gride> {
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
            child: GetBuilder<Quiz_Single_Choice_Controller>(
                builder: (controller) {
              // حساب عدد العناصر
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

  Widget _buildQuestionItem(BuildContext context,
      Quiz_Single_Choice_Controller controller, int index, double screenWidth) {
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
                        style: Theme.of(context)
                            .textTheme
                            .titleMedium!
                            .copyWith(fontSize: 16),
                        "${index + 1})- ${controller.filterdQuestions![index].description}"),
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
                            List<Answer> convertedAnswers =
                                controller.filterdQuestions![index].answer!
                                    .map((e) => Answer(
                                          id: e.id,
                                          choise: e
                                              .choice, // ملاحظة الفرق: من choice إلى choise
                                          trueAcss: e
                                              .trueAns, // ملاحظة الفرق: من trueAns إلى trueAcss
                                        ))
                                    .toList();
                            QustionList newQuestion = QustionList(
                              id: controller.filterdQuestions![index].id,
                              fileId: null,
                              type: controller.filterdQuestions![index].type,
                              description: controller
                                  .filterdQuestions![index].description,
                              isEng: 0,
                              mark: 20,
                              answer:
                                  convertedAnswers, // تحويل إلى List<Answer>
                            );
                            // إنشاء السؤال مع جميع البيانات المطلوبة

                            Get.find<Quiz_Questions_Controller>()
                                .addSingleQuestionFromBank(newQuestion);
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
                      ? Theme.of(context).canvasColor
                      : Theme.of(context).cardColor;

                  return Container(
                    width: screenWidth,
                    padding: const EdgeInsets.all(10),
                    margin: const EdgeInsets.symmetric(vertical: 5.0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      border: Border.all(
                        color: isCorrect
                            ? Theme.of(context).canvasColor
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
                    child: Text(
                      answer.choice ?? '',
                      maxLines: 10,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        color: isCorrect
                            ? Colors.white
                            : Theme.of(context).textTheme.titleMedium!.color,
                      ),
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
