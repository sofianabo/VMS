import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vms_school/Link/API/Error_API.dart';
import 'package:vms_school/Link/API/LMS_APIs/QuestionAPI/MatchingAPI/AddMatchingAPI.dart';
import 'package:vms_school/Link/API/LMS_APIs/QuestionAPI/MultiChoiseAPI/Add_Multi_Choise_API.dart';
import 'package:vms_school/Link/Controller/LMS_Controllers/Admin_LMS/QuestionBank_Controllers/MatchingQuestionController.dart';
import 'package:vms_school/Link/Controller/LMS_Controllers/Admin_LMS/QuestionBank_Controllers/Multi_Choise_Question_Controller.dart';
import 'package:vms_school/view/Both_Platform/widgets/ButtonsDialog.dart';
import 'package:vms_school/view/Both_Platform/widgets/Squer_Button_Enabled_Disabled.dart';
import 'package:vms_school/view/Both_Platform/widgets/TextFildWithUpper.dart';
import 'package:vms_school/view/Both_Platform/widgets/VMSAlertDialog.dart';
import 'package:vms_school/view/LMS_Platform/Widget/TextFild_Question.dart';

class Add_Matching_Question extends StatefulWidget {
  const Add_Matching_Question({super.key});

  @override
  State<Add_Matching_Question> createState() => _Add_Matching_QuestionState();
}

class _Add_Matching_QuestionState extends State<Add_Matching_Question> {
  final TextEditingController Question = TextEditingController();
  var cont = Get.find<Matching_Question_Controller>();

  @override
  void dispose() {
    Question.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return VMSAlertDialog(
      action: [
        ButtonDialog(
          color: Get.theme.primaryColor,
          onPressed: () async {
            bool isquestion = Question.text.isEmpty;
            cont.updateFieldError("aname", isquestion);

            if (!isquestion) {
              cont.validateAndCleanOptions();
              if (cont.validateBeforeSave()) {
                await Add_Matching_api().Add_Matching(
                  Question: Question.text,
                  ques: cont.firstSectionOptions,
                  ans: cont.secondSectionOptions,
                );
               
              }
            }
          },
          width: 150,
          text: "Add Question".tr,
        )
      ],
      contents: Container(
        width: 600,
        constraints: BoxConstraints(maxHeight: 500),
        child: SingleChildScrollView(
          child:
              GetBuilder<Matching_Question_Controller>(builder: (controller) {
            return Column(
              children: [
                Textfildwithupper(
                  width: 600,
                  isError: controller.IsAnameError,
                  onChanged: (value) {
                    controller.updateFieldError("aname", value.isEmpty);
                  },
                  isRequired: true,
                  controller: Question,
                  Uptext: "Add Question".tr,
                  hinttext: "Enter your question here".tr,
                ),
                const SizedBox(height: 20),
                // عنواني الأقسام
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text("Questions".tr,
                        style: TextStyle(fontWeight: FontWeight.bold)),
                    Text("Answers".tr,
                        style: TextStyle(fontWeight: FontWeight.bold)),
                  ],
                ),
                const SizedBox(height: 10),
                // زر الإضافة
                Align(
                  alignment: Alignment.centerRight,
                  child: Squer_Button_Enabled_Disabled(
                    validate: false,
                    icon: Icons.add,
                    onTap: () {
                      if (controller.canAddNewOption()) {
                        controller.addOption();
                      } else {
                        ErrorMessage("يجب تعبئة الحقول السابقة أولاً");
                      }
                    },
                  ),
                ),
                const SizedBox(height: 10),
                // قائمة الحقول
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    border: Border.all(
                      color: Theme.of(context).textTheme.titleMedium!.color!,
                      width: 0.5,
                    ),
                    color: Theme.of(context).cardColor,
                  ),
                  child: ListView.builder(
                    padding: const EdgeInsets.all(8.0),
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: controller.firstSectionOptions.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.only(bottom: 8.0),
                        child: Row(
                          children: [
                            // حقل القسم الأول
                            Expanded(
                              child: Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 4.0),
                                child: TextField(
                                  controller: TextEditingController(
                                      text: controller
                                          .firstSectionOptions[index]),
                                  onChanged: (value) {
                                    controller.firstSectionOptions[index] =
                                        value;
                                  },
                                  decoration: InputDecoration(
                                    hintText: "Question".tr,
                                    border: OutlineInputBorder(),
                                  ),
                                ),
                              ),
                            ),
                            // حقل القسم الثاني
                            Expanded(
                              child: Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 4.0),
                                child: TextField(
                                  controller: TextEditingController(
                                      text: index <
                                              controller
                                                  .secondSectionOptions.length
                                          ? controller
                                              .secondSectionOptions[index]
                                          : ''),
                                  onChanged: (value) {
                                    if (index <
                                        controller
                                            .secondSectionOptions.length) {
                                      controller.secondSectionOptions[index] =
                                          value;
                                    } else {
                                      controller.secondSectionOptions
                                          .add(value);
                                    }
                                  },
                                  decoration: InputDecoration(
                                    hintText: "Answer".tr,
                                    border: OutlineInputBorder(),
                                  ),
                                ),
                              ),
                            ),
                            // زر الحذف
                            IconButton(
                              icon: Icon(Icons.delete, color: Colors.red),
                              onPressed: () {
                                controller.removeOption(index);
                              },
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ),
              ],
            );
          }),
        ),
      ),
      apptitle: "Add Question".tr,
      subtitle: "none".tr,
    );
  }
}
