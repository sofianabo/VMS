import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vms_school/Link/API/API.dart';
import 'package:vms_school/Link/API/LMS_APIs/QuestionAPI/DragDrop_Question_APi/Delete_DragDrop_API.dart';
import 'package:vms_school/Link/API/LMS_APIs/QuestionAPI/MatchingAPI/Delete_Matching_API.dart';
import 'package:vms_school/Link/Controller/AdminController/Employee_Controllers/Add_Data_controller.dart';
import 'package:vms_school/Link/Controller/LMS_Controllers/Admin_LMS/QuestionBank_Controllers/Drag_Drop_Question_Controller.dart';
import 'package:vms_school/Link/Controller/LMS_Controllers/Admin_LMS/QuestionBank_Controllers/MatchingQuestionController.dart';
import 'package:vms_school/Link/Controller/LMS_Controllers/Admin_LMS/Quiz_Controller/Quiz_DragDrop_Question_Controller.dart';
import 'package:vms_school/Translate/local_controller.dart';
import 'package:vms_school/view/Both_Platform/widgets/ButtonsDialog.dart';
import 'package:vms_school/view/Both_Platform/widgets/Squer_Button_Enabled_Disabled.dart';
import 'package:vms_school/view/Both_Platform/widgets/VMSAlertDialog.dart';

import '../../../../../../../../../Link/Model/LMS_Model/Questions_Models/DragDrop_Question_Model.dart';

class Dragdrop_From_Bank_Grid extends StatefulWidget {
  const Dragdrop_From_Bank_Grid({super.key});

  @override
  State<Dragdrop_From_Bank_Grid> createState() => _Dragdrop_From_Bank_GridState();
}

class _Dragdrop_From_Bank_GridState extends State<Dragdrop_From_Bank_Grid> {
  final controller = Get.find<Quiz_DragDrop_Question_Controller>();
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
            child: GetBuilder<Quiz_DragDrop_Question_Controller>(
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
      Quiz_DragDrop_Question_Controller controller,
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
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Expanded(
                    child: Text(
                      "${index + 1})- ${question?.description ?? ''}",
                      style: Theme.of(context)
                          .textTheme
                          .titleMedium!
                          .copyWith(fontSize: 16),
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
                            // QustionList newQuestion = QustionList(
                            //   id: controller.filterdQuestions![index].id,
                            //   fileId: null,
                            //   type: controller.filterdQuestions![index].type,
                            //   description: controller
                            //       .filterdQuestions![index].description,
                            //   isEng: 0,
                            //   mark: 20,
                            //   answer: [], // تحويل إلى List<Answer>
                            // );
                            // إنشاء السؤال مع جميع البيانات المطلوبة

                            // Get.find<Quiz_Questions_Controller>()
                            //     .addSingleQuestionFromBank(newQuestion);
                          }),
                    ],
                  )
                ],
              ),
              const SizedBox(height: 20),
              _buildQuestionPairs(question),
            ],
          ),
        ),
        if (index < (controller.filterdQuestions?.length ?? 0) - 1)
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 20),
            child: Divider(height: 2),
          ),
      ],
    );
  }

  Widget _buildQuestionPairs(Question? question) {
    return Container(
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
          ListView.builder(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            itemCount: question?.questions?.length ?? 0,
            itemBuilder: (context, pairIndex) {
              final questionItem = question?.questions?[pairIndex];
              Answer? answerItem;
              if (question?.answer != null &&
                  pairIndex < question!.answer!.length) {
                answerItem = question.answer![pairIndex];
              }

              return IntrinsicHeight(
                // <-- هذا هو الحل السحري
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 8.0, vertical: 4.0),
                  child: Row(
                    crossAxisAlignment:
                        CrossAxisAlignment.stretch, // <-- مهم للتوسيع الرأسي
                    children: [
                      // عرض السؤال
                      Expanded(
                        child: Container(
                          margin: EdgeInsets.only(right: 8),
                          child: _buildItemContent(
                            text: questionItem?.text,
                            fileId: questionItem?.fileId,
                          ),
                        ),
                      ),

                      // السهم
                      Center(
                        child: Icon(Icons.arrow_forward, size: 20),
                      ),

                      // عرض الإجابة
                      Expanded(
                        child: Container(
                          margin: EdgeInsets.only(left: 8),
                          child: answerItem != null
                              ? _buildItemContent(
                                  text: answerItem.text,
                                  fileId: answerItem.fileId,
                                )
                              : _buildEmptyItemContent(),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }

  Widget _buildEmptyItemContent() {
    const fixedHeight = 80.0;

    return SizedBox(
      height: fixedHeight,
      child: Container(
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          border: Border.all(
            color: Theme.of(context).textTheme.titleMedium!.color!,
            width: 0.5,
          ),
          borderRadius: BorderRadius.circular(5),
        ),
        child: Center(
          child: Text('-', textAlign: TextAlign.center),
        ),
      ),
    );
  }

  Widget _buildItemContent({String? text, int? fileId}) {
    const fixedHeight = 80.0; // يمكنك تغيير هذا الارتفاع حسب احتياجاتك

    // إذا كان كل من النص و fileId فارغين
    if ((text == null || text.isEmpty) && fileId == null) {
      return _buildEmptyItemContent();
    }

    return Container(
      height: fixedHeight,
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        border: Border.all(
          color: Theme.of(context).textTheme.titleMedium!.color!,
          width: 0.5,
        ),
        borderRadius: BorderRadius.circular(5),
      ),
      child: Center(
        child: fileId != null
            ? Image.network(
                "$getimage$fileId",
                height: fixedHeight - 5,
                width: 100,
                fit: BoxFit.contain,
                errorBuilder: (context, error, stackTrace) =>
                    Icon(Icons.broken_image),
              )
            : Text(
                text ?? '-',
                textAlign: TextAlign.center,
              ),
      ),
    );
  }
}
