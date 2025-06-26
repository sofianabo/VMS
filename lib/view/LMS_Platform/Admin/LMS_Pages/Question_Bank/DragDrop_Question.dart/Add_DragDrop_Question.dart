import 'dart:convert';
import 'dart:html';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:vms_school/Link/API/Error_API.dart';
import 'package:vms_school/Link/API/LMS_APIs/QuestionAPI/DragDrop_Question_APi/Add_DragDrop_API.dart';
import 'package:vms_school/Link/Controller/LMS_Controllers/Admin_LMS/QuestionBank_Controllers/Drag_Drop_Question_Controller.dart';
import 'package:vms_school/view/Both_Platform/widgets/ButtonsDialog.dart';
import 'package:vms_school/view/Both_Platform/widgets/Squer_Button_Enabled_Disabled.dart';
import 'package:vms_school/view/Both_Platform/widgets/TextFildWithUpper.dart';
import 'package:vms_school/view/Both_Platform/widgets/VMSAlertDialog.dart';

class Add_Dragdrop_Question extends StatefulWidget {
  const Add_Dragdrop_Question({super.key});

  @override
  State<Add_Dragdrop_Question> createState() => _Add_Dragdrop_QuestionState();
}

class _Add_Dragdrop_QuestionState extends State<Add_Dragdrop_Question> {
  final TextEditingController Question = TextEditingController();
  var cont = Get.find<DragDrop_Question_Controller>();
  final ImagePicker _picker = ImagePicker();

  @override
  void dispose() {
    Question.dispose();
    super.dispose();
  }

  Future<void> _pickImage(int index, bool isFirstSection) async {
    try {
      final XFile? pickedFile = await _picker.pickImage(
        source: ImageSource.gallery,
        imageQuality: 80,
      );

      if (pickedFile != null) {
        final bytes = await pickedFile.readAsBytes();
        final imageUrl =
            'data:image/${pickedFile.path.split('.').last};base64,${base64Encode(bytes)}';

        if (isFirstSection) {
          cont.updateFirstSectionImage(index, imageUrl);
        } else {
          cont.updateSecondSectionImage(index, imageUrl);
        }
      }
    } catch (e) {
      ErrorMessage("Failed to pick image: ${e.toString()}");
    }
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
                List<Map<String, dynamic>> questions = [];
                List<Map<String, dynamic>> answers = [];

                for (var option in cont.firstSectionOptions) {
                  questions.add({
                    'text': option.text,
                    'file': option.imagePath,
                  });
                }

                for (var option in cont.secondSectionOptions) {
                  answers.add({
                    'text': option.text,
                    'file': option.imagePath,
                  });
                }

                await Add_Dragdrop_Api().Add_Dragdrop(
                  Question: Question.text,
                  questions: questions
                      .map((q) => {
                            'text': q['text'],
                            'file': q['file'], // تغيير من image إلى file
                          })
                      .toList(),
                  answers: answers
                      .map((a) => {
                            'text': a['text'],
                            'file': a['file'], // تغيير من image إلى file
                          })
                      .toList(),
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
        constraints: const BoxConstraints(maxHeight: 500),
        child: SingleChildScrollView(
          child:
              GetBuilder<DragDrop_Question_Controller>(builder: (controller) {
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
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text("Questions".tr,
                        style: const TextStyle(fontWeight: FontWeight.bold)),
                    Text("Answers".tr,
                        style: const TextStyle(fontWeight: FontWeight.bold)),
                  ],
                ),
                const SizedBox(height: 10),
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
                        return Card(
                          elevation: 2,
                          margin: const EdgeInsets.only(bottom: 8.0),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              crossAxisAlignment:
                                  CrossAxisAlignment.start, // محاذاة من الأعلى
                              children: [
                                Expanded(
                                  child: _buildOptionSection(
                                    context,
                                    index,
                                    true,
                                    controller.firstSectionOptions[index],
                                  ),
                                ),
                                Expanded(
                                  child: _buildOptionSection(
                                    context,
                                    index,
                                    false,
                                    controller.secondSectionOptions[index],
                                  ),
                                ),
                                IconButton(
                                  icon: const Icon(Icons.delete,
                                      color: Colors.red),
                                  onPressed: () =>
                                      controller.removeOption(index),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    )),
              ],
            );
          }),
        ),
      ),
      apptitle: "Add Question".tr,
      subtitle: "none".tr,
    );
  }

  Widget _buildOptionSection(BuildContext context, int index,
      bool isFirstSection, DragDrop_Question_Items option) {
    TextEditingController textController =
        TextEditingController(text: option.text ?? '');
    const fixedHeight = 100.0; // ارتفاع ثابت لجميع العناصر

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 4.0),
      child: SizedBox(
        height: fixedHeight, // تحديد ارتفاع ثابت
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: TextButton(
                    style: TextButton.styleFrom(
                      backgroundColor:
                          option.isText ? Colors.blue.withOpacity(0.2) : null,
                    ),
                    onPressed: () {
                      if (isFirstSection) {
                        cont.toggleTextField(index, true);
                      } else {
                        cont.toggleTextField(index, false);
                      }
                    },
                    child: Text(
                      "Text".tr,
                      style: Get.theme.textTheme.titleMedium!
                          .copyWith(fontSize: 12),
                    ),
                  ),
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: TextButton(
                    style: TextButton.styleFrom(
                      backgroundColor:
                          option.isImage ? Colors.blue.withOpacity(0.2) : null,
                    ),
                    onPressed: () => _pickImage(index, isFirstSection),
                    child: Text(
                      "Image".tr,
                      style: Get.theme.textTheme.titleMedium!
                          .copyWith(fontSize: 12),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 8),
            Expanded(
              child: _buildContentSection(
                  option, textController, index, isFirstSection),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildContentSection(DragDrop_Question_Items option,
      TextEditingController textController, int index, bool isFirstSection) {
    if (option.showTextField || option.isText) {
      return TextField(
        controller: textController,
        onChanged: (value) {
          if (isFirstSection) {
            cont.updateFirstSectionText(index, value);
          } else {
            cont.updateSecondSectionText(index, value);
          }
        },
        maxLines: 3,
        decoration: InputDecoration(
          hintText: isFirstSection
              ? "Enter question text".tr
              : "Enter answer text".tr,
          border: const OutlineInputBorder(),
          contentPadding: const EdgeInsets.all(8.0),
        ),
      );
    } else if (option.isImage && option.imagePath != null) {
      return Container(
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey),
          borderRadius: BorderRadius.circular(4),
        ),
        child: Stack(
          children: [
            Center(
              child: option.imageBytes != null
                  ? Image.memory(
                      option.imageBytes!,
                      height: double.infinity,
                      width: double.infinity,
                      fit: BoxFit.contain,
                    )
                  : Image.network(
                      option.imagePath!,
                      height: double.infinity,
                      width: double.infinity,
                      fit: BoxFit.contain,
                    ),
            ),
            Positioned(
              right: 0,
              top: 0,
              child: IconButton(
                icon: const Icon(Icons.close, color: Colors.red),
                onPressed: () {
                  if (isFirstSection) {
                    cont.updateFirstSectionText(index, '');
                  } else {
                    cont.updateSecondSectionText(index, '');
                  }
                },
              ),
            ),
          ],
        ),
      );
    } else {
      return Container();
    }
  }
}
