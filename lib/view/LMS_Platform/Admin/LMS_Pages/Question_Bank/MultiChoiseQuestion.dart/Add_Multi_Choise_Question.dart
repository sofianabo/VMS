import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dropzone/flutter_dropzone.dart';
import 'package:get/get.dart';
import 'package:vms_school/Link/API/Error_API.dart';
import 'package:vms_school/Link/API/LMS_APIs/QuestionAPI/MultiChoiseAPI/Add_Multi_Choise_API.dart';
import 'package:vms_school/Link/Controller/LMS_Controllers/Admin_LMS/QuestionBank_Controllers/Multi_Choise_Question_Controller.dart';
import 'package:vms_school/view/Both_Platform/widgets/ButtonsDialog.dart';
import 'package:vms_school/view/Both_Platform/widgets/Squer_Button_Enabled_Disabled.dart';
import 'package:vms_school/view/Both_Platform/widgets/TextFildWithUpper.dart';
import 'package:vms_school/view/Both_Platform/widgets/VMSAlertDialog.dart';
import 'package:vms_school/view/LMS_Platform/Widget/TextFild_Question.dart';

class Add_Multi_Choise_Question extends StatefulWidget {
  const Add_Multi_Choise_Question({super.key});

  @override
  State<Add_Multi_Choise_Question> createState() =>
      _Add_Multi_Choise_QuestionState();
}

class _Add_Multi_Choise_QuestionState extends State<Add_Multi_Choise_Question> {
  final TextEditingController Question = TextEditingController();
  final TextEditingController _optionController = TextEditingController();
  final FocusNode _optionFocusNode = FocusNode();
  var cont = Get.find<Multi_Choise_Question_Controller>();
  DropzoneViewController? ctrl;

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
              cont.validateAndCleanOptions();
              if (cont.validateBeforeSave()) {
                await Add_Multi_Choise_Api().Add_Multi_Choise(
                  trueIndexes: cont.correctAnswersIndices,
                  Question: Question.text,
                  answer: cont.options,
                  Image: cont.selectedImage.value,
                );
                cont.initialAddCurr();
// تم التعديل هنا
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
          child: GetBuilder<Multi_Choise_Question_Controller>(
              builder: (controller) {
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
                  Uptext: "Add Multiple Correct Questions".tr, // تم التعديل هنا
                  hinttext:
                      "Add Multiple Correct Questions".tr, // تم التعديل هنا
                ),
                GestureDetector(
                  onTap: () {
                    controller.pickImage();
                  },
                  child: AnimatedContainer(
                    duration: const Duration(milliseconds: 500),
                    decoration: BoxDecoration(
                      borderRadius: const BorderRadius.all(Radius.circular(5)),
                      border: Border.all(color: const Color(0xffD9D9D9)),
                      color: controller.isHoveringimage
                          ? Theme.of(context).primaryColor
                          : Theme.of(context).cardColor,
                    ),
                    alignment: Alignment.center,
                    width: 600,
                    height: 100,
                    child: Stack(
                      children: [
                        DropzoneView(
                          operation: DragOperation.copy,
                          cursor: CursorType.Default,
                          onCreated: (DropzoneViewController controller) {
                            ctrl = controller;
                          },
                          onHover: () {
                            controller.updateHoverImage(true);
                          },
                          onLeave: () {
                            controller.updateHoverImage(false);
                          },
                          onDropFiles:
                              (List<DropzoneFileInterface>? files) async {
                            if (files != null && files.length == 1) {
                              final file = files.first;
                              final mimeType = await ctrl?.getFileMIME(file);
                              final fileName = await ctrl?.getFilename(file);
                              final fileBytes = await ctrl?.getFileData(file);
                              if (mimeType == 'image/jpeg' ||
                                  mimeType == 'image/png' ||
                                  fileName!.toLowerCase().endsWith('.jpg') ||
                                  fileName.toLowerCase().endsWith('.jpeg') ||
                                  fileName.toLowerCase().endsWith('.png')) {
                                controller.selectedImage.value = fileBytes;
                                controller.updateTextImage(
                                    "Image Successfully Dropped!");
                              } else {
                                controller.updateTextImage(
                                    "Error: Unsupported File Type.");
                              }
                            } else {
                              controller.updateTextImage(
                                  "Error: Only One File Is Allowed.");
                            }
                          },
                        ),
                        Center(
                          child: controller.selectedImage.value != null
                              ? IconButton(
                                  onPressed: () {
                                    controller.ClearImage();
                                  },
                                  icon: Icon(
                                    Icons.delete_outline_outlined,
                                    color: Colors.redAccent,
                                  ))
                              : Text(
                                  textAlign: TextAlign.center,
                                  controller.imageStatus,
                                  style: TextStyle(
                                    color: controller.isHoveringimage
                                        ? Colors.white
                                        : const Color(0xffCBBFBF),
                                  ),
                                ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text("Options".tr),
                    Squer_Button_Enabled_Disabled(
                      validate: false,
                      icon: Icons.add,
                      onTap: () {
                        if (controller.canAddNewOption()) {
                          controller.addOption('');
                          FocusScope.of(context).requestFocus(_optionFocusNode);
                        } else {
                          ErrorMessage("يجب تعبئة الخيار السابق");
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
                            Obx(() => Checkbox(
                                  value: controller.correctAnswersIndices
                                      .contains(index),
                                  onChanged: (bool? value) {
                                    controller.toggleCorrectAnswer(index);
                                  },
                                )),
                            Expanded(
                              child: Textfild_Question(
                                isSelected: controller.correctAnswersIndices
                                    .contains(index),
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
            );
          }),
        ),
      ),
      apptitle: "Add Question".tr,
      subtitle: "none".tr,
    );
  }
}
