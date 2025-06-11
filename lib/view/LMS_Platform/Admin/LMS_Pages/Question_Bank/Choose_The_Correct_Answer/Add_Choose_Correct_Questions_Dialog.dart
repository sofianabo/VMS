import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vms_school/Link/API/Error_API.dart';
import 'package:vms_school/Link/Controller/LMS_Controllers/Admin_LMS/QuestionBank_Controllers/Choose_The_Correct_Answer_Controller.dart';
import 'package:vms_school/view/Both_Platform/widgets/ButtonsDialog.dart';
import 'package:vms_school/view/Both_Platform/widgets/Squer_Button_Enabled_Disabled.dart';
import 'package:vms_school/view/Both_Platform/widgets/TextFildWithUpper.dart';
import 'package:vms_school/view/Both_Platform/widgets/VMSAlertDialog.dart';
import 'package:vms_school/view/LMS_Platform/Widget/TextFild_Question.dart';

class Add_Choose_Correct_Questions_Dialog extends StatefulWidget {
  const Add_Choose_Correct_Questions_Dialog({super.key});

  @override
  State<Add_Choose_Correct_Questions_Dialog> createState() =>
      _Add_Choose_Correct_Questions_DialogState();
}

class _Add_Choose_Correct_Questions_DialogState
    extends State<Add_Choose_Correct_Questions_Dialog> {
  final TextEditingController _optionController = TextEditingController();
  final FocusNode _optionFocusNode = FocusNode();

  @override
  void dispose() {
    _optionController.dispose();
    _optionFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<Choose_The_Correct_Answer>(builder: (controller) {
      return VMSAlertDialog(
        action: [
          ButtonDialog(
            color: Get.theme.primaryColor,
            onPressed: () {
              bool isquestion = controller.question.isEmpty;
              controller.updateFieldError("aname", isquestion);

              if (!isquestion) {
                controller.validateAndCleanOptions();
                if (controller.validateBeforeSave()) {
                  // تنفيذ عملية الحفظ هنا
                }
              }
            },
            width: 150,
            text: "Add".tr,
          )
        ],
        contents: Container(
          width: 600,
          constraints: BoxConstraints(maxHeight: 500),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Textfildwithupper(
                  width: 600,
                  isError: controller.IsAnameError,
                  onChanged: (value) {
                    controller.question = value;
                    controller.updateFieldError("aname", value.isEmpty);
                  },
                  isRequired: true,
                  controller: TextEditingController(text: controller.question),
                  Uptext: "Add Choose Correct Questions".tr,
                  hinttext: "Add Choose Correct Questions".tr,
                ),
                const SizedBox(height: 20),
                Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text("الخيارات".tr),
                    Squer_Button_Enabled_Disabled(
                      validate: false,
                      icon: Icons.add,
                      onTap: () {
                        if (controller.canAddNewOption()) {
                          controller.addOption('');
                          FocusScope.of(context).requestFocus(_optionFocusNode);
                        } else {
                          ErrorMessage("يجب تعبآة الخيار السابق");
                        }
                      },
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    border: Border.all(
                      color: Theme.of(context).textTheme.titleMedium!.color!,
                      width: 0.5,
                    ),
                    color: Theme.of(context).cardColor,
                    boxShadow: const [
                      BoxShadow(
                        color: Colors.black26,
                        offset: Offset(0, 2),
                        blurRadius: 1,
                      ),
                    ],
                  ),
                  child: ListView.builder(
                    padding: const EdgeInsets.only(
                      bottom: 18,
                      left: 8.0,
                      right: 8.0,
                      top: 8.0,
                    ),
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: controller.options.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.only(top: 8.0),
                        child: Row(
                          spacing: 10.0,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Obx(() => Radio<int>(
                                  value: index,
                                  groupValue: controller.correctAnswerIndex,
                                  onChanged: (int? value) {
                                    controller.setCorrectAnswerIndex(value);
                                  },
                                )),
                            Expanded(
                              child: Textfild_Question(
                                isSelected:
                                    controller.correctAnswerIndex == index,
                                hinttext: "Option".tr + " ${index + 1}",
                                controller: TextEditingController(
                                    text: controller.options[index]),
                                onChanged: (value) {
                                  controller.options[index] = value;
                                },
                              ),
                            ),
                            Squer_Button_Enabled_Disabled(
                              isDelete: true,
                              validate: false,
                              icon: Icons.delete_outline_outlined,
                              onTap: () {
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
            ),
          ),
        ),
        apptitle: "Add Question".tr,
        subtitle: "none".tr,
      );
    });
  }
}
