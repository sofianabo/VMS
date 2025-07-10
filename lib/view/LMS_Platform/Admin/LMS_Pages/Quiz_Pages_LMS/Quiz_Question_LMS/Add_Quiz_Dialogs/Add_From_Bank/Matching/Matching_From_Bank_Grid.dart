import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vms_school/Link/Controller/AdminController/Employee_Controllers/Add_Data_controller.dart';
import 'package:vms_school/Link/Controller/LMS_Controllers/Admin_LMS/Quiz_Controller/Quiz_Matching_Question_Controller.dart';
import 'package:vms_school/Link/Controller/LMS_Controllers/Admin_LMS/Quiz_Controller/Quiz_Questions_Controller.dart';
import 'package:vms_school/Translate/local_controller.dart';
import 'package:vms_school/view/Both_Platform/widgets/Squer_Button_Enabled_Disabled.dart';
import 'package:vms_school/Link/Model/LMS_Model/Questions_Models/MatchingQuestionModel.dart'
    as matching;
import 'package:vms_school/Link/Model/LMS_Model/Questions_Models/Quiz_Qustions_Model.dart';

class Matching_From_Bank_Grid extends StatefulWidget {
  const Matching_From_Bank_Grid({super.key});

  @override
  State<Matching_From_Bank_Grid> createState() =>
      _Matching_From_Bank_GridState();
}

class _Matching_From_Bank_GridState extends State<Matching_From_Bank_Grid> {
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
            child: GetBuilder<Quiz_Matching_Question_Controller>(
                builder: (controller) {
              int itemCount = controller.filterdQuestions?.length ?? 0;

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
      Quiz_Matching_Question_Controller controller,
      int index,
      double screenWidth) {
    final question = controller.filterdQuestions?[index];

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
                          "${index + 1})- ${question?.description ?? ''}",
                        ),
                      ],
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
                            matching.Question rawQuestion =
                                controller.filterdQuestions![index];

// تحقق من وجود بيانات
                            if (rawQuestion.questions != null &&
                                rawQuestion.answer != null &&
                                rawQuestion.questions!.length ==
                                    rawQuestion.answer!.length) {
                              List<Answer> convertedAnswers = [];

                              for (int i = 0;
                                  i < rawQuestion.questions!.length;
                                  i++) {
                                convertedAnswers.add(Answer(
                                  id: null,
                                  choise: null,
                                  trueAcss: 1,
                                  questionId: rawQuestion.id,
                                  questionBankId: null,
                                  fileId: null,
                                  text:
                                      '${rawQuestion.questions![i]} = ${rawQuestion.answer![i]}',
                                ));
                              }

                              QustionList newQuestion = QustionList(
                                id: null,
                                fileId: null,
                                type: rawQuestion.type ?? "Matching",
                                description: rawQuestion.description,
                                isEng: rawQuestion.isEng,
                                mark: rawQuestion.mark ?? 20,
                                questionId: rawQuestion.id,
                                questionBankId: null,
                                text: rawQuestion.description,
                                answer: convertedAnswers,
                              );

                              Get.find<Quiz_Questions_Controller>()
                                  .addSingleQuestionFromBank(newQuestion);
                            } else {
                              Get.snackbar("خطأ",
                                  "البيانات غير مكتملة أو غير متطابقة بين السؤال والإجابة");
                            }
                          }),
                    ],
                  )
                ],
              ),
              const SizedBox(height: 20),
              // عرض أزواج المطابقة
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  border: Border.all(
                    color: Theme.of(context).textTheme.titleMedium!.color!,
                    width: 0.5,
                  ),
                  color: Theme.of(context).cardColor,
                ),
                child: Column(
                  children: [
                    // عناوين الأقسام
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Text("Questions".tr,
                              style: TextStyle(fontWeight: FontWeight.bold)),
                          Text("Answers".tr,
                              style: TextStyle(fontWeight: FontWeight.bold)),
                        ],
                      ),
                    ),
                    // قائمة أزواج المطابقة
                    ListView.builder(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemCount: question?.questions?.length ?? 0,
                      itemBuilder: (context, pairIndex) {
                        return Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 8.0, vertical: 4.0),
                          child: Row(
                            children: [
                              // عنصر القسم الأول
                              Expanded(
                                child: Container(
                                  padding: const EdgeInsets.all(10),
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                      color: Theme.of(context)
                                          .textTheme
                                          .titleMedium!
                                          .color!,
                                      width: 0.5,
                                    ),
                                    borderRadius: BorderRadius.circular(5),
                                  ),
                                  child: Text(
                                    question?.questions?[pairIndex] ?? '',
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                              ),
                              const SizedBox(width: 10),
                              // سهم المطابقة
                              Icon(Icons.arrow_forward,
                                  color: Get.theme.textTheme.bodyMedium!.color),
                              const SizedBox(width: 10),
                              // عنصر القسم الثاني
                              Expanded(
                                child: Container(
                                  padding: const EdgeInsets.all(10),
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                      color: Theme.of(context)
                                          .textTheme
                                          .titleMedium!
                                          .color!,
                                      width: 0.5,
                                    ),
                                    borderRadius: BorderRadius.circular(5),
                                  ),
                                  child: Text(
                                    pairIndex < (question?.answer?.length ?? 0)
                                        ? question!.answer![pairIndex]
                                        : '',
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        if (index < (controller.filterdQuestions?.length ?? 0) - 1)
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
