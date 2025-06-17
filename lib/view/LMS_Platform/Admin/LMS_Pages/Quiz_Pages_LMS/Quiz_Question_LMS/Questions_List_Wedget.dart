import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vms_school/Link/Controller/LMS_Controllers/Admin_LMS/Quiz_Controller/Quiz_Questions_Controller.dart';
import 'package:vms_school/view/Both_Platform/widgets/LargeTextField.dart';
import 'package:vms_school/view/LMS_Platform/Admin/LMS_Pages/Quiz_Pages_LMS/Quiz_Question_LMS/Wedgets_Questions.dart';

Widget buildQuestionsList({required screenWidth, required isSmallScreen}) {
  return Column(
    children: [
      GetBuilder<Quiz_Questions_Controller>(
        builder: (controller) {
          if (controller.allQuestions == null ||
              controller.allQuestions!.isEmpty) {
            return const Center(child: CircularProgressIndicator());
          }

          return ListView.builder(
            physics: const AlwaysScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: controller.allQuestions!.length,
            itemBuilder: (context, index) {
              final questionGroup = controller.allQuestions![index].question;
              if (questionGroup == null ||
                  questionGroup.qustionList == null ||
                  questionGroup.qustionList!.isEmpty) {
                return const SizedBox.shrink();
              }

              if (questionGroup.qustionList![0].type == "Blank") {
                return Column(
                  spacing: 15.0,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 13.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "${controller.getQuestionNumber(index)} : " +
                                "${questionGroup.name ?? "بدون عنوان"}",
                            style: TextStyle(
                                fontSize: isSmallScreen,
                                fontWeight: FontWeight.bold),
                          ),
                          Text(
                            "( ${getMarksText(questionGroup.fullMark ?? 0)} )",
                            style: TextStyle(
                                color: Colors.black, fontSize: isSmallScreen),
                          ),
                        ],
                      ),
                    ),
                    ...questionGroup.qustionList!.asMap().entries.map((entry) {
                      final questionIndex = entry.key;
                      final question = entry.value;
                      return Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          if (question.description != null)
                            Expanded(
                              child: buildDescriptionWithTextFields(
                                  "${questionIndex + 1} )- " +
                                      "${question.description}",
                                  isSmallScreen,
                                  screenWidth),
                            ),
                          if (question.mark != null)
                            Text(
                              "( ${getMarksText(question.mark ?? 0)} )",
                              style: TextStyle(
                                  color: Colors.grey, fontSize: isSmallScreen),
                            ),
                        ],
                      );
                    }).toList(),
                    const Divider(thickness: 0.5, color: Colors.black),
                  ],
                );
              } else if (questionGroup.qustionList![0].type == "TrueFalse") {
                return Column(
                  spacing: 15.0,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 13.0, bottom: 13.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "${controller.getQuestionNumber(index)} : " +
                                "${questionGroup.name ?? "بدون عنوان"}",
                            style: TextStyle(
                                fontSize: isSmallScreen,
                                fontWeight: FontWeight.bold),
                          ),
                          Text(
                            "( ${getMarksText(questionGroup.fullMark ?? 0)} )",
                            style: TextStyle(
                                color: Colors.black, fontSize: isSmallScreen),
                          ),
                        ],
                      ),
                    ),
                    ...questionGroup.qustionList!.asMap().entries.map((entry) {
                      final questionIndex = entry.key;
                      final question = entry.value;
                      return Column(
                        spacing: 15.0,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              if (question.description != null)
                                Text(
                                  "${questionIndex + 1} )- " +
                                      "${question.description}",
                                  style: TextStyle(fontSize: isSmallScreen),
                                ),
                              if (question.mark != null)
                                Text(
                                  "( ${getMarksText(question.mark ?? 0)} )",
                                  style: TextStyle(
                                      color: Colors.grey,
                                      fontSize: isSmallScreen),
                                ),
                            ],
                          ),
                          Row(
                            spacing: 30.0,
                            children: [
                              if (question.answer != null &&
                                  question.answer!.isNotEmpty)
                                ...question.answer!.map((answer) {
                                  return Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Radio<bool>(
                                        overlayColor: WidgetStatePropertyAll(
                                            Colors.transparent),
                                        activeColor: Get.theme.primaryColor,
                                        value: answer.trueAcss == 1,
                                        groupValue: true,
                                        onChanged: (bool? value) {},
                                      ),
                                      Text(
                                        question.isEng == true
                                            ? answer.choise!
                                            : translateChoice(answer.choise!),
                                        style: Get.textTheme.bodyMedium!
                                            .copyWith(fontSize: isSmallScreen),
                                      ), // مسافة بين الخيارات
                                    ],
                                  );
                                }).toList(),
                            ],
                          ),
                        ],
                      );
                    }).toList(),
                    const Divider(thickness: 0.5, color: Colors.black),
                  ],
                );
              } else if (questionGroup.qustionList![0].type == "SingleChoice") {
                return Column(
                  spacing: 15.0,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 13.0, bottom: 13.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "${controller.getQuestionNumber(index)} : " +
                                "${questionGroup.name ?? "بدون عنوان"}",
                            style: TextStyle(
                                fontSize: isSmallScreen,
                                fontWeight: FontWeight.bold),
                          ),
                          Text(
                            "( ${getMarksText(questionGroup.fullMark ?? 0)} )",
                            style: TextStyle(
                                color: Colors.black, fontSize: isSmallScreen),
                          ),
                        ],
                      ),
                    ),
                    ...questionGroup.qustionList!.asMap().entries.map((entry) {
                      final questionIndex = entry.key;
                      final question = entry.value;
                      return Column(
                        spacing: 15.0,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              if (question.description != null)
                                Text(
                                  "${questionIndex + 1} )- " +
                                      "${question.description}",
                                  style: TextStyle(fontSize: isSmallScreen),
                                ),
                              if (question.mark != null)
                                Text(
                                  "( ${getMarksText(question.mark ?? 0)} )",
                                  style: TextStyle(
                                      color: Colors.grey,
                                      fontSize: isSmallScreen),
                                ),
                            ],
                          ),
                          Column(
                            spacing: 2.0,
                            children: [
                              if (question.answer != null &&
                                  question.answer!.isNotEmpty)
                                ...question.answer!.map((answer) {
                                  return Container(
                                    width: screenWidth,
                                    padding: const EdgeInsets.all(10),
                                    margin: const EdgeInsets.symmetric(
                                        vertical: 5.0),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(5),
                                      border: Border.all(
                                        color: answer.trueAcss == 1
                                            ? Theme.of(context).canvasColor
                                            : Theme.of(context)
                                                .textTheme
                                                .titleMedium!
                                                .color!,
                                        width: 0.5,
                                      ),
                                      color: answer.trueAcss == 1
                                          ? Theme.of(context).canvasColor
                                          : Theme.of(context).cardColor,
                                      boxShadow: const [
                                        BoxShadow(
                                          color: Colors.black26,
                                          offset: Offset(0, 2),
                                          blurRadius: 1,
                                        ),
                                      ],
                                    ),
                                    child: Text(
                                      answer.choise ?? '',
                                      maxLines: 10,
                                      overflow: TextOverflow.ellipsis,
                                      style: TextStyle(
                                        fontSize: isSmallScreen,
                                        color: answer.trueAcss == 1
                                            ? Colors.white
                                            : Theme.of(context)
                                                .textTheme
                                                .titleMedium!
                                                .color,
                                      ),
                                    ),
                                  );
                                }).toList(),
                            ],
                          ),
                        ],
                      );
                    }).toList(),
                    const Divider(thickness: 0.5, color: Colors.black),
                  ],
                );
              } else if (questionGroup.qustionList![0].type == "Text") {
                return Column(
                  spacing: 15.0,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 13.0, bottom: 13.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "${controller.getQuestionNumber(index)} : " +
                                "${questionGroup.name ?? "بدون عنوان"}",
                            style: TextStyle(
                                fontSize: isSmallScreen,
                                fontWeight: FontWeight.bold),
                          ),
                          Text(
                            "( ${getMarksText(questionGroup.fullMark ?? 0)} )",
                            style: TextStyle(
                                color: Colors.black, fontSize: isSmallScreen),
                          ),
                        ],
                      ),
                    ),
                    ...questionGroup.qustionList!.asMap().entries.map((entry) {
                      final questionIndex = entry.key;
                      final question = entry.value;
                      return Column(
                        spacing: 15.0,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              if (question.description != null)
                                Text(
                                  "${questionIndex + 1} )- " +
                                      "${question.description}",
                                  style: TextStyle(fontSize: isSmallScreen),
                                ),
                              if (question.mark != null)
                                Text(
                                  "( ${getMarksText(question.mark ?? 0)} )",
                                  style: TextStyle(
                                      color: Colors.grey,
                                      fontSize: isSmallScreen),
                                ),
                            ],
                          ),
                          Large_Quiz_Field(
                              width: screenWidth,
                              Hight: 180,
                              readOnly: true,
                              controller: TextEditingController(),
                              hinttext: "hinttext"),
                        ],
                      );
                    }).toList(),
                    const Divider(thickness: 0.5, color: Colors.black),
                  ],
                );
              } else {
                return const SizedBox.shrink();
              }
            },
          );
        },
      ),
      Text("data")
    ],
  );
}
