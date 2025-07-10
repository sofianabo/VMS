import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:vms_school/Link/API/API.dart';
import 'package:vms_school/Link/Controller/LMS_Controllers/Admin_LMS/Quiz_Controller/Quiz_Questions_Controller.dart';
import 'package:vms_school/view/Both_Platform/widgets/LargeTextField.dart';
import 'package:vms_school/view/LMS_Platform/Admin/LMS_Pages/Quiz_Pages_LMS/Quiz_Question_LMS/Wedgets_Questions.dart';
import 'package:vms_school/view/LMS_Platform/Widget/TextFild_Question.dart';
import 'package:vms_school/Link/Model/LMS_Model/Questions_Models/Quiz_Qustions_Model.dart';

Widget buildQuestionsList(
    {required double screenWidth, required double isSmallScreen}) {
  return GetBuilder<Quiz_Questions_Controller>(
    builder: (controller) {
      if (controller.allQuestions == null || controller.allQuestions!.isEmpty) {
        return Center(
          child: Padding(
            padding: const EdgeInsets.only(top: 50.0),
            child: Text(
              "No Questions".tr,
              style: Get.theme.textTheme.titleLarge!.copyWith(
                fontSize: 22,
                fontWeight: FontWeight.normal,
              ),
            ),
          ),
        );
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

          final questionType = questionGroup.qustionList![0].type;

          Widget questionWidget;
          switch (questionType) {
            case "Blank":
              questionWidget = _buildBlankQuestion(
                controller: controller,
                questionGroup: questionGroup,
                index: index,
                screenWidth: screenWidth,
                isSmallScreen: isSmallScreen,
              );
              break;
            case "TrueFalse":
              questionWidget = _buildTrueFalseQuestion(
                controller: controller,
                questionGroup: questionGroup,
                index: index,
                screenWidth: screenWidth,
                isSmallScreen: isSmallScreen,
              );
              break;
            case "SingleChoice":
              questionWidget = _buildSingleChoiceQuestion(
                controller: controller,
                questionGroup: questionGroup,
                index: index,
                screenWidth: screenWidth,
                isSmallScreen: isSmallScreen,
              );
              break;
            case "Text":
              questionWidget = _buildTextQuestion(
                controller: controller,
                questionGroup: questionGroup,
                index: index,
                screenWidth: screenWidth,
                isSmallScreen: isSmallScreen,
              );
              break;
            case "MultiChoice":
              questionWidget = _buildMuiltiChoiceQuestion(
                controller: controller,
                questionGroup: questionGroup,
                index: index,
                screenWidth: screenWidth,
                isSmallScreen: isSmallScreen,
              );
              break;
            case "Matching":
              questionWidget = _buildMatchingQuestion(
                controller: controller,
                questionGroup: questionGroup,
                index: index,
                screenWidth: screenWidth,
                isSmallScreen: isSmallScreen,
              );
              break;

            default:
              return const SizedBox.shrink();
          }

          return Column(
            children: [
              questionWidget,
              const Divider(thickness: 0.5, color: Colors.black),
            ],
          );
        },
      );
    },
  );
}

Widget _buildMatchingQuestion({
  required Quiz_Questions_Controller controller,
  required Question questionGroup, // النوع من موديلك الأساسي
  required int index,
  required double screenWidth,
  required double isSmallScreen,
}) {
  // استخراج أسئلة وأجوبة من qustionList
  List<String> questions = [];
  List<String> answers = [];

  if (questionGroup.qustionList != null) {
    for (var q in questionGroup.qustionList!) {
      // نص السؤال (الوصف أو النص)
      String questionText = q.description ?? q.text ?? '';
      questions.add(questionText);

      // الجواب: نستخرج أول إجابة إن وجدت كـ نص
      if (q.answer != null && q.answer!.isNotEmpty) {
        // نأخذ إما choise أو text
        String ansText = q.answer![0].choise ?? q.answer![0].text ?? '';
        answers.add(ansText);
      } else {
        answers.add('');
      }
    }
  }

  return Container(
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(5),
      border: Border.all(
        color: Get.textTheme.titleMedium!.color!,
        width: 0.5,
      ),
      color: Get.theme.cardColor,
    ),
    child: Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text("Questions".tr,
                  style: TextStyle(fontWeight: FontWeight.bold)),
              Text("Answers".tr, style: TextStyle(fontWeight: FontWeight.bold)),
            ],
          ),
        ),
        ListView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: questions.length,
          itemBuilder: (context, pairIndex) {
            return Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
              child: Row(
                children: [
                  // مربع السؤال
                  Expanded(
                    child: Container(
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        border: Border.all(
                          color:
                              Theme.of(context).textTheme.titleMedium!.color!,
                          width: 0.5,
                        ),
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: Text(
                        questions[pairIndex],
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                  const SizedBox(width: 10),
                  // سهم المطابقة
                  Icon(Icons.arrow_forward,
                      color: Get.theme.textTheme.bodyMedium!.color),
                  const SizedBox(width: 10),
                  // مربع الجواب
                  Expanded(
                    child: Container(
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        border: Border.all(
                          color:
                              Theme.of(context).textTheme.titleMedium!.color!,
                          width: 0.5,
                        ),
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: Text(
                        answers[pairIndex],
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ],
    ),
  );
}

Widget _buildQuestionHeader({
  required Quiz_Questions_Controller controller,
  required questionGroup,
  required int index,
  required double screenWidth,
  required double isSmallScreen,
  required TextEditingController textController,
}) {
  return Padding(
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
                fontWeight: FontWeight.bold,
              ),
            ),
            Text_Fild_Question_Add(
              maxwidth: screenWidth,
              fontSize: isSmallScreen,
              controller: textController,
              hinttext: "${controller.allQuestions![index].question!.name}",
            ),
          ],
        ),
        _buildMarksWidget(controller, questionGroup, isSmallScreen),
      ],
    ),
  );
}

Widget _buildMarksWidget(
  Quiz_Questions_Controller controller,
  questionGroup,
  double isSmallScreen,
) {
  return GetBuilder<Quiz_Questions_Controller>(
    id: "marks",
    builder: (cont_Mark) {
      double totalMarks = questionGroup.qustionList!.fold(
        0,
        (sum, question) => sum + (question.mark ?? 0),
      );
      questionGroup.fullMark = int.parse(totalMarks.toString());
      return Text(
        "( ${getMarksText(int.parse("$totalMarks"))} )",
        style: TextStyle(
          color: Colors.black,
          fontSize: isSmallScreen,
        ),
      );
    },
  );
}

Widget _buildMarkInput({
  required question,
  required Quiz_Questions_Controller controller,
  required double isSmallScreen,
}) {
  return Row(
    spacing: 4,
    mainAxisSize: MainAxisSize.min,
    children: [
      Text(
        "(",
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
            text: question.mark?.toString() ?? '0',
          ),
          keyboardType: TextInputType.numberWithOptions(
            signed: false,
            decimal: false,
          ),
          inputFormatters: [
            FilteringTextInputFormatter.digitsOnly,
            LengthLimitingTextInputFormatter(3),
          ],
          decoration: const InputDecoration(
            counterText: "",
            border: InputBorder.none,
            contentPadding: EdgeInsets.zero,
            isDense: true,
          ),
          style: TextStyle(
            color: Colors.grey,
            fontSize: isSmallScreen,
          ),
          onChanged: (value) {
            if (value.isNotEmpty) {
              final parsedValue = int.tryParse(value);
              if (parsedValue != null) {
                question.mark = parsedValue;
                controller.update(['marks']);
              }
            } else {
              question.mark = 0;
              controller.update(['marks']);
            }
          },
        ),
      ),
      Text(
        ")",
        style: TextStyle(
          color: Colors.grey,
          fontSize: isSmallScreen,
        ),
      ),
    ],
  );
}

Widget _buildBlankQuestion({
  required Quiz_Questions_Controller controller,
  required questionGroup,
  required int index,
  required double screenWidth,
  required double isSmallScreen,
}) {
  return Column(
    spacing: 15.0,
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      _buildQuestionHeader(
        controller: controller,
        questionGroup: questionGroup,
        index: index,
        screenWidth: screenWidth,
        isSmallScreen: isSmallScreen,
        textController: controller.Blank,
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
                  "${questionIndex + 1} )- ${question.description}",
                  isSmallScreen,
                  screenWidth,
                ),
              ),
            if (question.mark != null)
              _buildMarkInput(
                question: question,
                controller: controller,
                isSmallScreen: isSmallScreen,
              ),
          ],
        );
      }).toList(),
    ],
  );
}

Widget _buildTrueFalseQuestion({
  required Quiz_Questions_Controller controller,
  required questionGroup,
  required int index,
  required double screenWidth,
  required double isSmallScreen,
}) {
  return Column(
    spacing: 15.0,
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      _buildQuestionHeader(
        controller: controller,
        questionGroup: questionGroup,
        index: index,
        screenWidth: screenWidth,
        isSmallScreen: isSmallScreen,
        textController: controller.True_False,
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
                    "${questionIndex + 1} )- ${question.description}",
                    style: TextStyle(fontSize: isSmallScreen),
                  ),
                if (question.mark != null)
                  _buildMarkInput(
                    question: question,
                    controller: controller,
                    isSmallScreen: isSmallScreen,
                  ),
              ],
            ),
            Row(
              spacing: 30.0,
              children: [
                if (question.answer != null && question.answer!.isNotEmpty)
                  ...question.answer!.map((answer) {
                    return Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Radio<bool>(
                          overlayColor:
                              const WidgetStatePropertyAll(Colors.transparent),
                          activeColor: Get.theme.primaryColor,
                          value: answer.trueAcss == 1,
                          groupValue: true,
                          onChanged: (bool? value) {},
                        ),
                        Text(
                          question.isEng == true
                              ? answer.choise!
                              : translateChoice(answer.choise!),
                          style: Get.textTheme.bodyMedium!.copyWith(
                            fontSize: isSmallScreen,
                          ),
                        ),
                      ],
                    );
                  }).toList(),
              ],
            ),
          ],
        );
      }).toList(),
    ],
  );
}

Widget _buildSingleChoiceQuestion({
  required Quiz_Questions_Controller controller,
  required questionGroup,
  required int index,
  required double screenWidth,
  required double isSmallScreen,
}) {
  return Column(
    spacing: 15.0,
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      _buildQuestionHeader(
        controller: controller,
        questionGroup: questionGroup,
        index: index,
        screenWidth: screenWidth,
        isSmallScreen: isSmallScreen,
        textController: controller.Single_Choice,
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
                    "${questionIndex + 1} )- ${question.description}",
                    style: TextStyle(fontSize: isSmallScreen),
                  ),
                if (question.mark != null)
                  _buildMarkInput(
                    question: question,
                    controller: controller,
                    isSmallScreen: isSmallScreen,
                  ),
              ],
            ),
            Column(
              spacing: 2.0,
              children: [
                if (question.answer != null && question.answer!.isNotEmpty)
                  ...question.answer!.map((answer) {
                    return Container(
                      width: screenWidth,
                      padding: const EdgeInsets.all(10),
                      margin: const EdgeInsets.symmetric(vertical: 5.0),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        border: Border.all(
                          color: answer.trueAcss == 1
                              ? Get.theme.canvasColor
                              : Get.theme.textTheme.titleMedium!.color!,
                          width: 0.5,
                        ),
                        color: answer.trueAcss == 1
                            ? Get.theme.canvasColor
                            : Get.theme.cardColor,
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
                              : Get.theme.textTheme.titleMedium!.color,
                        ),
                      ),
                    );
                  }).toList(),
              ],
            ),
          ],
        );
      }).toList(),
    ],
  );
}

Widget _buildMuiltiChoiceQuestion({
  required Quiz_Questions_Controller controller,
  required questionGroup,
  required int index,
  required double screenWidth,
  required double isSmallScreen,
}) {
  return Column(
    spacing: 15.0,
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      _buildQuestionHeader(
        controller: controller,
        questionGroup: questionGroup,
        index: index,
        screenWidth: screenWidth,
        isSmallScreen: isSmallScreen,
        textController: controller.Muilti_Choice,
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
                    "${questionIndex + 1} )- ${question.description}",
                    style: TextStyle(fontSize: isSmallScreen),
                  ),
                if (question.mark != null)
                  _buildMarkInput(
                    question: question,
                    controller: controller,
                    isSmallScreen: isSmallScreen,
                  ),
              ],
            ),
            question.fileId == null
                ? Center(
                    child: Text(""),
                  )
                : Center(
                    child: SizedBox(
                        width: 300,
                        height: 200,
                        child: Image.network(
                          "$getimage${question.fileId}",
                          fit: BoxFit.fitWidth,
                        )),
                  ),
            Column(
              spacing: 2.0,
              children: [
                if (question.answer != null && question.answer!.isNotEmpty)
                  ...question.answer!.map((answer) {
                    return Container(
                      width: screenWidth,
                      padding: const EdgeInsets.all(10),
                      margin: const EdgeInsets.symmetric(vertical: 5.0),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        border: Border.all(
                          color: answer.trueAcss == 1
                              ? Get.theme.canvasColor
                              : Get.theme.textTheme.titleMedium!.color!,
                          width: 0.5,
                        ),
                        color: answer.trueAcss == 1
                            ? Get.theme.canvasColor
                            : Get.theme.cardColor,
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
                              : Get.theme.textTheme.titleMedium!.color,
                        ),
                      ),
                    );
                  }).toList(),
              ],
            ),
          ],
        );
      }).toList(),
    ],
  );
}

Widget _buildTextQuestion({
  required Quiz_Questions_Controller controller,
  required questionGroup,
  required int index,
  required double screenWidth,
  required double isSmallScreen,
}) {
  return Column(
    spacing: 15.0,
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      _buildQuestionHeader(
        controller: controller,
        questionGroup: questionGroup,
        index: index,
        screenWidth: screenWidth,
        isSmallScreen: isSmallScreen,
        textController: controller.Text_Question,
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
                    "${questionIndex + 1} )- ${question.description}",
                    style: TextStyle(fontSize: isSmallScreen),
                  ),
                if (question.mark != null)
                  _buildMarkInput(
                    question: question,
                    controller: controller,
                    isSmallScreen: isSmallScreen,
                  ),
              ],
            ),
            Large_Quiz_Field(
              width: screenWidth,
              Hight: 180,
              readOnly: true,
              controller: TextEditingController(),
              hinttext: "hinttext",
            ),
          ],
        );
      }).toList(),
    ],
  );
}
