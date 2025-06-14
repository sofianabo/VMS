import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vms_school/Link/API/Error_API.dart';
import 'package:vms_school/Link/API/LMS_APIs/QuestionAPI/Fill_The_Blanks_API.dart/Add_Fill_The_Blanks_API.dart';
import 'package:vms_school/Link/Controller/LMS_Controllers/Admin_LMS/QuestionBank_Controllers/Fill_The_Blank_Controller.dart';
import 'package:vms_school/view/Both_Platform/widgets/ButtonsDialog.dart';
import 'package:vms_school/view/Both_Platform/widgets/Squer_Button_Enabled_Disabled.dart';
import 'package:vms_school/view/Both_Platform/widgets/TextFildWithUpper.dart';
import 'package:vms_school/view/Both_Platform/widgets/VMSAlertDialog.dart';

class Add_Fill_The_Blank_Dialog extends StatefulWidget {
  const Add_Fill_The_Blank_Dialog({super.key});

  @override
  State<Add_Fill_The_Blank_Dialog> createState() =>
      _Add_Fill_The_Blank_DialogState();
}

class _Add_Fill_The_Blank_DialogState extends State<Add_Fill_The_Blank_Dialog> {
  final TextEditingController Question = TextEditingController();
  final TextEditingController _optionController = TextEditingController();
  final FocusNode _optionFocusNode = FocusNode();
  var cont = Get.find<Fill_The_Blank_Controller>();
  @override
  void dispose() {
    _optionController.dispose();
    _optionFocusNode.dispose();
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
              await Add_Fill_The_Blanks_API().Fill_The_Blanks_API(
                Question: Question.text,
              );
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
          child: GetBuilder<Fill_The_Blank_Controller>(builder: (controller) {
            return Column(
              children: [
                Container(
                  width: 600,
                  height: 60,
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Theme.of(context).textTheme.titleMedium!.color!,
                      width: 0.5,
                    ),
                  ),
                ),
                Textfildwithupper(
                  width: 600,
                  isError: controller.IsAnameError,
                  onChanged: (value) {
                    controller.updateFieldError("aname", value.isEmpty);
                  },
                  isRequired: true,
                  controller: Question,
                  Uptext: "Questions Title".tr,
                  hinttext: "Questions Title".tr,
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
