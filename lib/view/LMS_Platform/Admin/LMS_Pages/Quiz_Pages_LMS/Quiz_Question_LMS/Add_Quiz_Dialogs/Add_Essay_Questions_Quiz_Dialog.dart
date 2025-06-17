import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vms_school/Link/Controller/LMS_Controllers/Admin_LMS/Quiz_Controller/Quiz_Articale_Quiz_Controller.dart';
import 'package:vms_school/Link/Controller/LMS_Controllers/Admin_LMS/Quiz_Controller/Quiz_Questions_Controller.dart';
import 'package:vms_school/view/Both_Platform/widgets/ButtonsDialog.dart';
import 'package:vms_school/view/Both_Platform/widgets/TextFildWithUpper.dart';
import 'package:vms_school/view/Both_Platform/widgets/VMSAlertDialog.dart';

class Add_Essay_questions_Quiz_Dialog extends StatefulWidget {
  const Add_Essay_questions_Quiz_Dialog({super.key});

  @override
  State<Add_Essay_questions_Quiz_Dialog> createState() =>
      _Add_Essay_questions_Quiz_DialogState();
}

class _Add_Essay_questions_Quiz_DialogState
    extends State<Add_Essay_questions_Quiz_Dialog> {
  final TextEditingController Question = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return GetBuilder<Quiz_Articale_Quiz_Controller>(builder: (controller) {
      return VMSAlertDialog(
          contents: SizedBox(
            width: 400,
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Column(
                    spacing: 10.0,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Textfildwithupper(
                          isRequired: true,
                          onChanged: (value) {
                            if (value.isNotEmpty) {
                              controller.updateFieldError("question", false);
                            }
                          },
                          width: 350,
                          isError: controller.IsQuestionError,
                          controller: Question,
                          Uptext: "Question".tr,
                          hinttext: "Question".tr),
                    ],
                  ),
                ],
              ),
            ),
          ),
          action: [
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                ButtonDialog(
                    width: 150,
                    text: "Add Question".tr,
                    onPressed: () async {
                      bool isQuestionEmpty = Question.text.isEmpty;

                      controller.updateFieldError("question", isQuestionEmpty);

                      if (!(isQuestionEmpty)) {
                        Get.find<Quiz_Questions_Controller>()
                            .Add_Question_From_Dialog(
                          type: "fill", // استخدام نوع السؤال من الـ controller
                          description: Question.text,
                          isEng: false,
                          answer: [],
                        );
                        Get.back();
                      }
                    },
                    color: Theme.of(context).primaryColor)
              ],
            )
          ],
          apptitle: "Add Question".tr,
          subtitle: "none");
    });
  }
}
