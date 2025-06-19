import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:vms_school/Link/Controller/LMS_Controllers/Admin_LMS/Quiz_Controller/Quiz_Questions_Controller.dart';
import 'package:vms_school/view/Both_Platform/widgets/LargeTextField.dart';
import 'package:vms_school/view/LMS_Platform/Admin/LMS_Pages/Quiz_Pages_LMS/Quiz_Question_LMS/Wedgets_Questions.dart';
import 'package:vms_school/view/LMS_Platform/Widget/TextFild_Question.dart';

Widget buildQuestionsList({required screenWidth, required isSmallScreen}) {
  return Column(
    children: [
      GetBuilder<Quiz_Questions_Controller>(
        builder: (controller) {
          if (controller.allQuestions == null ||
              controller.allQuestions!.isEmpty) {
            return Center(
                child: Padding(
              padding: const EdgeInsets.only(top: 50.0),
              child: Text("No Questions".tr,
                  style: Get.theme.textTheme.titleLarge!
                      .copyWith(fontSize: 22, fontWeight: FontWeight.normal)),
            ));
          } else {
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
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "${controller.getQuestionNumber(index)} : ",
                                  style: TextStyle(
                                      fontSize: isSmallScreen,
                                      fontWeight: FontWeight.bold),
                                ),
                                Text_Fild_Question_Add(
                                  maxwidth: screenWidth,
                                  fontSize: isSmallScreen,
                                  controller: controller.Blank,
                                  hinttext:
                                      "${controller.allQuestions![index].question!.name}",
                                ),
                              ],
                            ),
                            GetBuilder<Quiz_Questions_Controller>(
                                id: "marks",
                                builder: (cont_Mark) {
                                  double totalMarks = questionGroup.qustionList!
                                      .fold(
                                          0,
                                          (sum, question) =>
                                              sum + (question.mark ?? 0));
                                  return Text(
                                    "( ${getMarksText(int.parse("$totalMarks"))} )",
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: isSmallScreen),
                                  );
                                }),
                          ],
                        ),
                      ),
                      ...questionGroup.qustionList!
                          .asMap()
                          .entries
                          .map((entry) {
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
                              Row(
                                spacing: 4,
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Text(
                                    "(", // إغلاق القوس فقط
                                    style: TextStyle(
                                      color: Colors.grey,
                                      fontSize: isSmallScreen,
                                    ),
                                  ),
                                  SizedBox(
                                    width: 40, // عرض مناسب للتحرير
                                    child: TextField(
                                      maxLength: 3,
                                      textAlign: TextAlign.center,
                                      controller: TextEditingController(
                                          text: question.mark?.toString()),
                                      keyboardType: TextInputType.number,
                                      decoration: InputDecoration(
                                        counterText: "", // نص عداد فارغ
                                        border: InputBorder.none,
                                        contentPadding: EdgeInsets.zero,
                                      ),
                                      style: TextStyle(
                                        color: Colors.grey,
                                        fontSize: isSmallScreen,
                                      ),
                                      onChanged: (value) {
                                        double? newMark =
                                            double.tryParse(value);
                                        if (newMark != null) {
                                          question.mark = int.parse("$newMark");
                                          controller.update(['marks']);
                                        }
                                      },
                                    ),
                                  ),
                                  Text(
                                    ")", // إغلاق القوس فقط
                                    style: TextStyle(
                                      color: Colors.grey,
                                      fontSize: isSmallScreen,
                                    ),
                                  ),
                                ],
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
                            Row(
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "${controller.getQuestionNumber(index)} : ",
                                  style: TextStyle(
                                      fontSize: isSmallScreen,
                                      fontWeight: FontWeight.bold),
                                ),
                                Text_Fild_Question_Add(
                                  maxwidth: screenWidth,
                                  fontSize: isSmallScreen,
                                  controller: controller.True_False,
                                  hinttext:
                                      "${controller.allQuestions![index].question!.name}",
                                ),
                              ],
                            ),
                            GetBuilder<Quiz_Questions_Controller>(
                                id: "marks",
                                builder: (cont_Mark) {
                                  double totalMarks = questionGroup.qustionList!
                                      .fold(
                                          0,
                                          (sum, question) =>
                                              sum + (question.mark ?? 0));
                                  return Text(
                                    "( ${getMarksText(int.parse("$totalMarks"))} )",
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: isSmallScreen),
                                  );
                                }),
                          ],
                        ),
                      ),
                      ...questionGroup.qustionList!
                          .asMap()
                          .entries
                          .map((entry) {
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
                                  Row(
                                    spacing: 4,
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Text(
                                        "(", // إغلاق القوس فقط
                                        style: TextStyle(
                                          color: Colors.grey,
                                          fontSize: isSmallScreen,
                                        ),
                                      ),
                                      SizedBox(
                                        width: 40,
                                        child: TextField(
                                          maxLength: 3,
                                          textAlign: TextAlign.center,
                                          controller: TextEditingController(
                                            text: question.mark?.toString() ??
                                                '0', // قيمة افتراضية إذا كانت null
                                          ),
                                          keyboardType:
                                              TextInputType.numberWithOptions(
                                            signed:
                                                false, // لا يسمح بالأرقام السالبة
                                            decimal:
                                                false, // لا يسمح بالكسور العشرية (أعداد صحيحة فقط)
                                          ),
                                          inputFormatters: [
                                            FilteringTextInputFormatter
                                                .digitsOnly, // يقبل الأرقام فقط
                                            LengthLimitingTextInputFormatter(
                                                3), // تحديد الطول الأقصى
                                          ],
                                          decoration: InputDecoration(
                                            counterText: "",
                                            border: InputBorder.none,
                                            contentPadding: EdgeInsets.zero,
                                            isDense:
                                                true, // لتقليل المساحة الداخلية
                                          ),
                                          style: TextStyle(
                                            color: Colors.grey,
                                            fontSize: isSmallScreen,
                                          ),
                                          onChanged: (value) {
                                            if (value.isNotEmpty) {
                                              final parsedValue =
                                                  int.tryParse(value);
                                              if (parsedValue != null) {
                                                question.mark = parsedValue;
                                                controller.update(['marks']);
                                              }
                                            } else {
                                              question.mark =
                                                  0; // قيمة افتراضية إذا تم مسح الحقل
                                              controller.update(['marks']);
                                            }
                                          },
                                        ),
                                      ),
                                      Text(
                                        ")", // إغلاق القوس فقط
                                        style: TextStyle(
                                          color: Colors.grey,
                                          fontSize: isSmallScreen,
                                        ),
                                      ),
                                    ],
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
                                              .copyWith(
                                                  fontSize: isSmallScreen),
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
                } else if (questionGroup.qustionList![0].type ==
                    "SingleChoice") {
                  return Column(
                    spacing: 15.0,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 13.0, bottom: 13.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "${controller.getQuestionNumber(index)} : ",
                                  style: TextStyle(
                                      fontSize: isSmallScreen,
                                      fontWeight: FontWeight.bold),
                                ),
                                Text_Fild_Question_Add(
                                  maxwidth: screenWidth,
                                  fontSize: isSmallScreen,
                                  controller: controller.Single_Choice,
                                  hinttext:
                                      "${controller.allQuestions![index].question!.name}",
                                ),
                              ],
                            ),
                            GetBuilder<Quiz_Questions_Controller>(
                                id: "marks",
                                builder: (cont_Mark) {
                                  double totalMarks = questionGroup.qustionList!
                                      .fold(
                                          0,
                                          (sum, question) =>
                                              sum + (question.mark ?? 0));
                                  return Text(
                                    "( ${getMarksText(int.parse("$totalMarks"))} )",
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: isSmallScreen),
                                  );
                                }),
                          ],
                        ),
                      ),
                      ...questionGroup.qustionList!
                          .asMap()
                          .entries
                          .map((entry) {
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
                                  Row(
                                    spacing: 4,
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Text(
                                        "(", // إغلاق القوس فقط
                                        style: TextStyle(
                                          color: Colors.grey,
                                          fontSize: isSmallScreen,
                                        ),
                                      ),
                                      SizedBox(
                                        width: 40,
                                        child: TextField(
                                          maxLength: 3,
                                          textAlign: TextAlign.center,
                                          controller: TextEditingController(
                                            text: question.mark?.toString() ??
                                                '0', // قيمة افتراضية إذا كانت null
                                          ),
                                          keyboardType:
                                              TextInputType.numberWithOptions(
                                            signed:
                                                false, // لا يسمح بالأرقام السالبة
                                            decimal:
                                                false, // لا يسمح بالكسور العشرية (أعداد صحيحة فقط)
                                          ),
                                          inputFormatters: [
                                            FilteringTextInputFormatter
                                                .digitsOnly, // يقبل الأرقام فقط
                                            LengthLimitingTextInputFormatter(
                                                3), // تحديد الطول الأقصى
                                          ],
                                          decoration: InputDecoration(
                                            counterText: "",
                                            border: InputBorder.none,
                                            contentPadding: EdgeInsets.zero,
                                            isDense:
                                                true, // لتقليل المساحة الداخلية
                                          ),
                                          style: TextStyle(
                                            color: Colors.grey,
                                            fontSize: isSmallScreen,
                                          ),
                                          onChanged: (value) {
                                            if (value.isNotEmpty) {
                                              final parsedValue =
                                                  int.tryParse(value);
                                              if (parsedValue != null) {
                                                question.mark = parsedValue;
                                                controller.update(['marks']);
                                              }
                                            } else {
                                              question.mark =
                                                  0; // قيمة افتراضية إذا تم مسح الحقل
                                              controller.update(['marks']);
                                            }
                                          },
                                        ),
                                      ),
                                      Text(
                                        ")", // إغلاق القوس فقط
                                        style: TextStyle(
                                          color: Colors.grey,
                                          fontSize: isSmallScreen,
                                        ),
                                      ),
                                    ],
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
                            Row(
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "${controller.getQuestionNumber(index)} : ",
                                  style: TextStyle(
                                      fontSize: isSmallScreen,
                                      fontWeight: FontWeight.bold),
                                ),
                                Text_Fild_Question_Add(
                                  maxwidth: screenWidth,
                                  fontSize: isSmallScreen,
                                  controller: controller.Text_Question,
                                  hinttext:
                                      "${controller.allQuestions![index].question!.name}",
                                ),
                              ],
                            ),
                            GetBuilder<Quiz_Questions_Controller>(
                                id: "marks",
                                builder: (cont_Mark) {
                                  double totalMarks = questionGroup.qustionList!
                                      .fold(
                                          0,
                                          (sum, question) =>
                                              sum + (question.mark ?? 0));
                                  return Text(
                                    "( ${getMarksText(int.parse("$totalMarks"))} )",
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: isSmallScreen),
                                  );
                                }),
                          ],
                        ),
                      ),
                      ...questionGroup.qustionList!
                          .asMap()
                          .entries
                          .map((entry) {
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
                                  Row(
                                    spacing: 4,
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Text(
                                        "(", // إغلاق القوس فقط
                                        style: TextStyle(
                                          color: Colors.grey,
                                          fontSize: isSmallScreen,
                                        ),
                                      ),
                                      SizedBox(
                                        width: 40,
                                        child: TextField(
                                          maxLength: 3,
                                          textAlign: TextAlign.center,
                                          controller: TextEditingController(
                                            text: question.mark?.toString() ??
                                                '0', // قيمة افتراضية إذا كانت null
                                          ),
                                          keyboardType:
                                              TextInputType.numberWithOptions(
                                            signed:
                                                false, // لا يسمح بالأرقام السالبة
                                            decimal:
                                                false, // لا يسمح بالكسور العشرية (أعداد صحيحة فقط)
                                          ),
                                          inputFormatters: [
                                            FilteringTextInputFormatter
                                                .digitsOnly, // يقبل الأرقام فقط
                                            LengthLimitingTextInputFormatter(
                                                3), // تحديد الطول الأقصى
                                          ],
                                          decoration: InputDecoration(
                                            counterText: "",
                                            border: InputBorder.none,
                                            contentPadding: EdgeInsets.zero,
                                            isDense:
                                                true, // لتقليل المساحة الداخلية
                                          ),
                                          style: TextStyle(
                                            color: Colors.grey,
                                            fontSize: isSmallScreen,
                                          ),
                                          onChanged: (value) {
                                            if (value.isNotEmpty) {
                                              final parsedValue =
                                                  int.tryParse(value);
                                              if (parsedValue != null) {
                                                question.mark = parsedValue;
                                                controller.update(['marks']);
                                              }
                                            } else {
                                              question.mark =
                                                  0; // قيمة افتراضية إذا تم مسح الحقل
                                              controller.update(['marks']);
                                            }
                                          },
                                        ),
                                      ),
                                      Text(
                                        ")", // إغلاق القوس فقط
                                        style: TextStyle(
                                          color: Colors.grey,
                                          fontSize: isSmallScreen,
                                        ),
                                      ),
                                    ],
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
          }
        },
      ),
    ],
  );
}
