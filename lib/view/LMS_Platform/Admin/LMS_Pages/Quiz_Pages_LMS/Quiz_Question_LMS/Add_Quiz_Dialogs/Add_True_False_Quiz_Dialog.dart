import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vms_school/Link/API/LMS_APIs/QuestionAPI/TrueOrFalseAPI.dart/AddTrueOrFalseAPI.dart';
import 'package:vms_school/Link/Controller/AdminController/Employee_Controllers/Add_Data_controller.dart';
import 'package:vms_school/Link/Controller/LMS_Controllers/Admin_LMS/Quiz_Controller/Quiz_Questions_Controller.dart';
import 'package:vms_school/Link/Controller/LMS_Controllers/Admin_LMS/Quiz_Controller/Quiz_True_Or_Flase_Controller.dart';
import 'package:vms_school/view/Both_Platform/widgets/ButtonsDialog.dart';
import 'package:vms_school/view/Both_Platform/widgets/TextFildWithUpper.dart';
import 'package:vms_school/view/Both_Platform/widgets/VMSAlertDialog.dart';

Add_QUIZ_True_False_Dialog() {
  TextEditingController qeustion = TextEditingController();
  return GetBuilder<Quiz_True_Or_False_Controller>(builder: (controller) {
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
                        controller: qeustion,
                        Uptext: "Question".tr,
                        hinttext: "Question".tr),
                    Row(
                      spacing: 20,
                      children: [
                        Radio<bool>(
                          activeColor: Get.theme.primaryColor,
                          value: true,
                          groupValue: controller.selectedOption,
                          onChanged: (value) {
                            controller.selectOption(value!);
                          },
                        ),
                        Text("${controller.chooseTrue}"),
                        Radio<bool>(
                          activeColor: Get.theme.primaryColor,
                          value: false,
                          groupValue: controller.selectedOption,
                          // يمكنك استبدالها بمتغير لحفظ القيمة المحددة
                          onChanged: (value) {
                            controller.selectOption(value!);
                          },
                        ),
                        Text("${controller.chooseFalse}"),
                      ],
                    ),
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Checkbox(
                          checkColor: Colors.white,
                          value: controller.IsEnglish,
                          onChanged: (value) {
                            if (Get.find<Add_Data_controller>().roll !=
                                "subAdmin") {
                              controller.updateHid(value!);
                            }
                          },
                        ),
                        Text("Is It English".tr),
                      ],
                    ),
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
                    bool isQuestionEmpty = qeustion.text.isEmpty;

                    controller.updateFieldError("question", isQuestionEmpty);

                    if (!(isQuestionEmpty)) {
                      Get.find<Quiz_Questions_Controller>()
                          .Add_Question_From_Dialog(
                              type: "TrueFalse",
                              description: qeustion.text,
                              isEng: controller.IsEnglish,
                              answer: [
                            {
                              "id": null,
                              "choise": controller.chooseTrue,
                              "trueAcss": controller.selectedOption ? 1 : 0
                            },
                            {
                              "id": null,
                              "choise": controller.chooseFalse,
                              "trueAcss": controller.selectedOption ? 0 : 1
                            }
                          ]);
                      Get.back();
                    }
                  },
                  color: Get.theme.primaryColor)
            ],
          )
        ],
        apptitle: "Add Question".tr,
        subtitle: "none");
  });
}
