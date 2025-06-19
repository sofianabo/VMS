import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vms_school/Link/API/LMS_APIs/QuestionAPI/Fill_The_Blanks_API.dart/Add_Fill_The_Blanks_API.dart';
import 'package:vms_school/Link/Controller/LMS_Controllers/Admin_LMS/Quiz_Controller/Quiz_Fill_The_Blank_Controller.dart';
import 'package:vms_school/Link/Controller/LMS_Controllers/Admin_LMS/Quiz_Controller/Quiz_Questions_Controller.dart';
import 'package:vms_school/Translate/local_controller.dart';
import 'package:vms_school/view/Both_Platform/widgets/ButtonsDialog.dart';
import 'package:vms_school/view/Both_Platform/widgets/LargeTextField.dart';
import 'package:vms_school/view/Both_Platform/widgets/VMSAlertDialog.dart';

class Add_Fill_The_Blanks_Quiz_Dialog extends StatefulWidget {
  const Add_Fill_The_Blanks_Quiz_Dialog({super.key});

  @override
  State<Add_Fill_The_Blanks_Quiz_Dialog> createState() =>
      _Add_Fill_The_Blanks_Quiz_DialogState();
}

class _Add_Fill_The_Blanks_Quiz_DialogState
    extends State<Add_Fill_The_Blanks_Quiz_Dialog> {
  final TextEditingController Question = TextEditingController();
  final TextEditingController _optionController = TextEditingController();
  final FocusNode _optionFocusNode = FocusNode();
  var cont = Get.find<Quiz_Fill_The_Blank_Controller>();
  final FocusNode questionFocusNode = FocusNode();

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
              Get.find<Quiz_Questions_Controller>().Add_Question_From_Dialog(
                type: "Blank", // استخدام نوع السؤال من الـ controller
                description: Question.text,
                isEng: false,
                answer: [],
              );
            }
            Get.back();
          },
          width: 150,
          text: "Add".tr,
        )
      ],
      contents: Container(
        width: 600,
        constraints: BoxConstraints(maxHeight: 500),
        child: SingleChildScrollView(
          child:
              GetBuilder<Quiz_Fill_The_Blank_Controller>(builder: (controller) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              spacing: 20.0,
              children: [
                Container(
                  width: 200,
                  child: TextButton(
                      style: ButtonStyle(
                          backgroundColor:
                              WidgetStatePropertyAll(Colors.transparent),
                          shape: WidgetStatePropertyAll(RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(Radius.circular(3)),
                            side: BorderSide(
                                color: Get.theme.textTheme.titleMedium!.color!),
                          ))),
                      onPressed: () {
                        Question.text += " [...] ";
                        questionFocusNode.requestFocus();

                        Question.selection = TextSelection.fromPosition(
                            TextPosition(offset: Question.text.length));
                      },
                      child: Row(
                        textDirection: Get.find<LocalizationController>()
                                    .currentLocale
                                    .value
                                    .languageCode ==
                                'ar'
                            ? TextDirection.ltr
                            : TextDirection.rtl,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            "[.....]",
                            style: Get.theme.textTheme.headlineMedium!.copyWith(
                                color: Color(0xff134B70), fontSize: 12),
                          ),
                          Padding(
                            padding:
                                const EdgeInsets.only(left: 5.0, right: 5.0),
                            child: Text(
                              'Add Blank'.tr,
                              style: Get.theme.textTheme.headlineMedium!
                                  .copyWith(color: Color(0xff134B70)),
                            ),
                          ),
                        ],
                      )),
                ),
                LargeTextField(
                  TextDirections: isFirstCharEnglish(Question.text),
                  width: 600,
                  isError: controller.IsAnameError,
                  onChanged: (value) {
                    controller.updateFieldError("aname", value.isEmpty);
                  },
                  isRequired: true,
                  controller: Question,
                  hinttext: "Questions Title".tr,
                  focusNode: questionFocusNode,
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

isFirstCharEnglish(String text) {
  if (text.isEmpty) return TextDirection.rtl;
  final firstChar = text.trim()[0];
  bool isEnglish = RegExp(r'^[a-zA-Z]').hasMatch(firstChar);
  print(isEnglish);
  if (isEnglish) {
    return TextDirection.ltr;
  } else {
    return TextDirection.rtl;
  }
}
