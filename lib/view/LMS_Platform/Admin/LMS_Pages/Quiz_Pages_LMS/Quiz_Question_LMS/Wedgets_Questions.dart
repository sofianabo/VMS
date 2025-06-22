import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:vms_school/Icons_File/LMS_Icons/l_m_s__icons_icons.dart';
import 'package:vms_school/Link/API/LMS_APIs/QuizAPI/Quiz_Questions_APIs/Add_Quiz_Questions_API.dart';
import 'package:vms_school/Link/API/LMS_APIs/QuizAPI/Quiz_Questions_APIs/Get_All_Quiz_Question_API.dart';
import 'package:vms_school/Link/Controller/LMS_Controllers/Admin_LMS/Quiz_Controller/Quiz_Questions_Controller.dart';
import 'package:vms_school/Link/Model/LMS_Model/Questions_Models/Quiz_Qustions_Model.dart';
import 'package:vms_school/Translate/local_controller.dart';
import 'package:vms_school/view/Both_Platform/widgets/ButtonsDialog.dart';
import 'package:vms_school/view/Both_Platform/widgets/VMSAlertDialog.dart';
import 'package:vms_school/view/LMS_Platform/Admin/LMS_Pages/Quiz_Pages_LMS/Quiz_Question_LMS/Add_Quiz_Dialogs/Add_Essay_Questions_Quiz_Dialog.dart';
import 'package:vms_school/view/LMS_Platform/Admin/LMS_Pages/Quiz_Pages_LMS/Quiz_Question_LMS/Add_Quiz_Dialogs/Add_Fill_The_Blanks_Dialog.dart';
import 'package:vms_school/view/LMS_Platform/Admin/LMS_Pages/Quiz_Pages_LMS/Quiz_Question_LMS/Add_Quiz_Dialogs/Add_From_Bank/ArticleQuestion/Add_ArticleQuestionManagment.dart';
import 'package:vms_school/view/LMS_Platform/Admin/LMS_Pages/Quiz_Pages_LMS/Quiz_Question_LMS/Add_Quiz_Dialogs/Add_From_Bank/Choose_The_Correct_Answer/Choose_the_correct_answer.dart';
import 'package:vms_school/view/LMS_Platform/Admin/LMS_Pages/Quiz_Pages_LMS/Quiz_Question_LMS/Add_Quiz_Dialogs/Add_From_Bank/Fill_The_Blank/Quiz_Fill_The_Blank_Bank.dart';
import 'package:vms_school/view/LMS_Platform/Admin/LMS_Pages/Quiz_Pages_LMS/Quiz_Question_LMS/Add_Quiz_Dialogs/Add_From_Bank/TrueOrFalse/Quiz_True_Or_False_Question_Managment.dart';
import 'package:vms_school/view/LMS_Platform/Admin/LMS_Pages/Quiz_Pages_LMS/Quiz_Question_LMS/Add_Quiz_Dialogs/Add_Single_Choice_Dialog.dart';
import 'package:vms_school/view/LMS_Platform/Admin/LMS_Pages/Quiz_Pages_LMS/Quiz_Question_LMS/Add_Quiz_Dialogs/Add_True_False_Quiz_Dialog.dart';
import 'package:vms_school/view/LMS_Platform/Admin/LMS_Pages/Quiz_Pages_LMS/Quiz_Question_LMS/Preview_Quiz.dart';
import 'package:vms_school/view/LMS_Platform/Admin/LMS_Pages/Quiz_Pages_LMS/Quiz_Question_LMS/Questions_List_Wedget.dart';

Widget buildDescriptionWithTextFields(
    String description, double isSmallScreen, screenWidth) {
  // تقسيم النص إلى أجزاء عند كل [...]
  final parts = description.split('[...]');

  return Wrap(
    runSpacing: 10.0,
    spacing: 10.0,
    crossAxisAlignment: WrapCrossAlignment.center,
    children: [
      for (int i = 0; i < parts.length; i++) ...[
        Text(parts[i], style: TextStyle(fontSize: isSmallScreen)),
        if (i != parts.length - 1) // لا نضيف TextField بعد الجزء الأخير
          Container(
            width: screenWidth >= 600 ? 120 : 90,
            height: screenWidth >= 600 ? 30 : 15,
            margin: const EdgeInsets.symmetric(horizontal: 4),
            child: TextField(
              readOnly: true,
              style: TextStyle(fontSize: isSmallScreen),
              decoration: InputDecoration(
                contentPadding: const EdgeInsets.symmetric(horizontal: 8),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(4),
                  borderSide: const BorderSide(color: Colors.grey),
                ),
              ),
            ),
          ),
      ],
    ],
  );
}

Widget buildButtonsRow({
  required double screenWidth,
  required double fontSize,
}) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      buildAddButton('Save'.tr, Icons.save_outlined, onPressed: () async {
        await Add_Quiz_Questions_API().Add_Quiz_Questions(
            Get.find<Quiz_Questions_Controller>().allQuestions);
      }),
      buildAddButton('Rerange'.tr, Icons.drag_handle_rounded,
          onPressed: () async {
        _showReorderDialog(Get.find<Quiz_Questions_Controller>());
      }),
      buildAddButton('Clear Paper'.tr, Icons.delete_outline_outlined,
          onPressed: () async {
        if (Get.find<Quiz_Questions_Controller>().allQuestions!.isNotEmpty) {
          Get.dialog(VMSAlertDialog(
              action: [
                ButtonDialog(
                    text: "Yes, Delete".tr,
                    onPressed: () async {
                      Get.find<Quiz_Questions_Controller>().ClearQuestions();
                      Get.back();
                    },
                    color: const Color(0xffB03D3D),
                    width: 80),
                ButtonDialog(
                    text: "No, Don't delete".tr,
                    onPressed: () {
                      Get.back();
                    },
                    color: Get.theme.primaryColor,
                    width: 80)
              ],
              contents: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    width: 400,
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: Text(
                          overflow: TextOverflow.ellipsis,
                          "Do You Want To delete all Questions".tr,
                          style: Get.theme.textTheme.bodyMedium!.copyWith(
                              fontSize: 16, fontWeight: FontWeight.normal),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              apptitle: "Delete All Question".tr,
              subtitle: "none"));
        }
      }),
      buildAddButton('Preview'.tr, Icons.preview_rounded, onPressed: () async {
        Get.dialog(showFullQuestionsPreviewDialog());
      }),
    ],
  );
}

void _showReorderDialog(Quiz_Questions_Controller controller) {
  // حفظ النسخة الأصلية للترتيب
  final originalOrder = List<AllQuestions>.from(controller.allQuestions!);
  // نسخة مؤقتة للعمل عليها
  final tempQuestions = List<AllQuestions>.from(controller.allQuestions!);

  Get.dialog(
    VMSAlertDialog(
      action: [
        TextButton(
          child: Text("Save".tr,
              style: Get.theme.textTheme.titleMedium!
                  .copyWith(fontSize: 14, fontWeight: FontWeight.normal)),
          onPressed: () {
            controller.allQuestions!.clear();
            controller.allQuestions!.addAll(tempQuestions);
            controller.update();
            Get.back();
          },
        ),
        TextButton(
          child: Text("Back".tr,
              style: Get.theme.textTheme.titleMedium!
                  .copyWith(fontSize: 14, fontWeight: FontWeight.normal)),
          onPressed: () => Get.back(),
        )
      ],
      contents: StatefulBuilder(
        builder: (BuildContext context, StateSetter setState) {
          return SizedBox(
            width: 500,
            height: 400,
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    TextButton(
                      child: Text("Original Order".tr,
                          style: Get.theme.textTheme.titleMedium!.copyWith(
                              fontSize: 14, fontWeight: FontWeight.normal)),
                      onPressed: () {
                        setState(() {
                          tempQuestions.clear();
                          tempQuestions
                              .addAll(List<AllQuestions>.from(originalOrder));
                        });
                      },
                    ),
                    TextButton(
                      child: Text("Random Order".tr,
                          style: Get.theme.textTheme.titleMedium!.copyWith(
                              fontSize: 14, fontWeight: FontWeight.normal)),
                      onPressed: () {
                        setState(() {
                          tempQuestions.shuffle();
                        });
                      },
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                Expanded(
                  child: ReorderableListView(
                    children: [
                      for (int i = 0; i < tempQuestions.length; i++)
                        ListTile(
                          key: Key('${tempQuestions[i].hashCode}'),
                          title: Text(
                            "${i + 1}. ${tempQuestions[i].question?.name ?? 'سؤال بدون عنوان'}",
                            style: Get.textTheme.bodyMedium,
                          ),
                        ),
                    ],
                    onReorder: (oldIndex, newIndex) {
                      setState(() {
                        if (oldIndex < newIndex) newIndex -= 1;
                        final item = tempQuestions.removeAt(oldIndex);
                        tempQuestions.insert(newIndex, item);
                      });
                    },
                  ),
                ),
              ],
            ),
          );
        },
      ),
      apptitle: "Rerange".tr,
      subtitle: "none",
    ),
  );
}

Widget buildAddButton(String text, icon,
    {double? size = 175, required VoidCallback onPressed}) {
  return SizedBox(
    width: size,
    child: TextButton(
      style: ButtonStyle(
        backgroundColor: const WidgetStatePropertyAll(Colors.transparent),
        shape: WidgetStatePropertyAll(RoundedRectangleBorder(
          borderRadius: const BorderRadius.all(Radius.circular(3)),
          side: BorderSide(color: Get.theme.textTheme.titleMedium!.color!),
        )),
      ),
      onPressed: onPressed,
      child: Row(
        textDirection: Get.find<LocalizationController>()
                    .currentLocale
                    .value
                    .languageCode ==
                'ar'
            ? TextDirection.ltr
            : TextDirection.rtl,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Icon(
            icon,
            color: Get.theme.textTheme.titleMedium!.color,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 5.0),
            child: Text(
              text,
              style: Get.theme.textTheme.titleMedium!
                  .copyWith(fontSize: 14, fontWeight: FontWeight.normal),
            ),
          ),
        ],
      ),
    ),
  );
}

Widget buildQuizCard(
    BuildContext context, double fontSize, double screenWidth) {
  return Expanded(
    child: Container(
      padding: const EdgeInsets.all(15.0),
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(Radius.circular(2)),
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
      child: SingleChildScrollView(
        child: Column(
          children: [
            buildHeaderRow(fontSize),
            SizedBox(
              height: 25,
            ),
            const Divider(thickness: 1, color: Colors.black),
            GetBuilder<Quiz_Questions_Controller>(builder: (controller) {
              if (controller.IsLoading) {
                return Padding(
                  padding: const EdgeInsets.only(top: 80.0),
                  child: LoadingAnimationWidget.inkDrop(
                    color: Theme.of(context).primaryColor,
                    size: 40,
                  ),
                );
              } else {
                return buildQuestionsList(
                    screenWidth: screenWidth, isSmallScreen: fontSize);
              }
            }),
          ],
        ),
      ),
    ),
  );
}

Widget buildHeaderRow(double fontSize) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Column(
        spacing: 10.0,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("الجمهورية العربية السورية",
              style: TextStyle(fontSize: fontSize)),
          Text("وزارة التربيةالسورية", style: TextStyle(fontSize: fontSize)),
          Text("مديرية تربية السويداء", style: TextStyle(fontSize: fontSize)),
          Text("المدرسة الافتراضية الحديثة",
              style: TextStyle(fontSize: fontSize)),
        ],
      ),
      Column(
        spacing: 10.0,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("اسم الطالب: هنا ....", style: TextStyle(fontSize: fontSize)),
          Text("المدة: هنا ...............",
              style: TextStyle(fontSize: fontSize)),
          Text("الدرجة: هنا...............",
              style: TextStyle(fontSize: fontSize)),
          Text("المادة: هنا...............",
              style: TextStyle(fontSize: fontSize)),
        ],
      ),
    ],
  );
}

String translateChoice(String choice) {
  return choice == 'true' || choice == 'True'
      ? 'صح'
      : choice == 'false' || choice == 'False'
          ? 'خطأ'
          : choice;
}

String getMarksText(int mark) {
  if (mark < 0) return 'قيمة غير صالحة';

  if (mark == 0) return 'صفر درجة';
  if (mark == 1) return 'درجة واحدة';
  if (mark == 2) return 'درجتين';

  // الأعداد من 3-10
  if (mark >= 3 && mark <= 10) return '$mark درجات';

  // الأعداد من 11-99
  if (mark >= 11 && mark <= 99) return '$mark درجة';

  // المئات الخاصة
  if (mark == 100) return 'مائة درجة';
  if (mark == 200) return 'مائتي درجة';
  if (mark == 300) return 'ثلاثمائة درجة';
  if (mark == 400) return 'أربعمائة درجة';
  if (mark == 500) return 'خمسمائة درجة';
  if (mark == 600) return 'ستمائة درجة';

  // المئات المركبة (101-199، 201-599)
  if (mark >= 101 && mark <= 199) return 'مائة و${getMarksText(mark - 100)}';
  if (mark >= 201 && mark <= 299) return 'مائتي و${getMarksText(mark - 200)}';
  if (mark >= 301 && mark <= 399)
    return 'ثلاثمائة و${getMarksText(mark - 300)}';
  if (mark >= 401 && mark <= 499)
    return 'أربعمائة و${getMarksText(mark - 400)}';
  if (mark >= 501 && mark <= 599) return 'خمسمائة و${getMarksText(mark - 500)}';

  return '$mark درجة'; // للقيم فوق 600 (إن احتجت)
}

Widget buildSidePanel(BuildContext context) {
  return Container(
    width: 300,
    decoration: BoxDecoration(
      borderRadius: const BorderRadius.only(
          topRight: Radius.circular(5), topLeft: Radius.circular(5)),
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
    child: Column(
      spacing: 10.0,
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 5.0, bottom: 5.0),
          child: Column(
            children: [
              Text("Question Types".tr,
                  style: Get.theme.textTheme.titleMedium!.copyWith(
                    fontSize: 16,
                  )),
              Divider(
                color: Get.theme.textTheme.titleMedium!.color,
                thickness: 3,
              ),
            ],
          ),
        ),
        Expanded(
          child: SingleChildScrollView(
            child: Column(
              children: [
                Column(
                  spacing: 15.0,
                  children: [
                    Text(
                      "True Or False".tr,
                      style: Get.theme.textTheme.titleMedium!
                          .copyWith(fontSize: 14),
                    ),
                    buildAddButton("Add as a new question".tr, Icons.add,
                        size: 250, onPressed: () {
                      Get.dialog(Add_QUIZ_True_False_Dialog());
                    }),
                    buildAddButton("Addition from the bank".tr, LMS_Icons.tf,
                        size: 250, onPressed: () {
                      Get.dialog(Add_True_False_Quiz_From_Bank());
                    }),
                    Divider(
                      color: Get.theme.textTheme.titleMedium!.color,
                      thickness: 0.5,
                    ),
                  ],
                ),
                Column(
                  spacing: 15.0,
                  children: [
                    Text("Choose the correct".tr,
                        style: Get.theme.textTheme.titleMedium!
                            .copyWith(fontSize: 14)),
                    buildAddButton("Add as a new question".tr, Icons.add,
                        size: 250, onPressed: () {
                      Get.dialog(Add_Single_Choose_Quiz_Dialog());
                    }),
                    buildAddButton(
                        "Addition from the bank".tr, LMS_Icons.checkone,
                        size: 250, onPressed: () {
                      Get.dialog(Add_Single_Choose_Quiz_From_Bank_Dialog());
                    }),
                    Divider(
                      color: Get.theme.textTheme.titleMedium!.color,
                      thickness: 0.5,
                    ),
                  ],
                ),
                Column(
                  spacing: 15.0,
                  children: [
                    Text("Fill in the blanks".tr,
                        style: Get.theme.textTheme.titleMedium!
                            .copyWith(fontSize: 14)),
                    buildAddButton("Add as a new question".tr, Icons.add,
                        size: 250, onPressed: () {
                      Get.dialog(Add_Fill_The_Blanks_Quiz_Dialog());
                    }),
                    buildAddButton("Addition from the bank".tr, LMS_Icons.fill,
                        size: 250, onPressed: () {
                      Get.dialog(Quiz_Fill_The_Blank_QBank());
                    }),
                    Divider(
                      color: Get.theme.textTheme.titleMedium!.color,
                      thickness: 0.5,
                    ),
                  ],
                ),
                Column(
                  spacing: 15.0,
                  children: [
                    Text("Drag and drop texts and images".tr,
                        style: Get.theme.textTheme.titleMedium!
                            .copyWith(fontSize: 14)),
                    buildAddButton("Add as a new question".tr, Icons.add,
                        size: 250, onPressed: () {}),
                    buildAddButton(
                        "Addition from the bank".tr, LMS_Icons.dragdrop,
                        size: 250, onPressed: () {}),
                    Divider(
                      color: Get.theme.textTheme.titleMedium!.color,
                      thickness: 0.5,
                    ),
                  ],
                ),
                Column(
                  spacing: 15.0,
                  children: [
                    Text("Essay questions".tr,
                        style: Get.theme.textTheme.titleMedium!
                            .copyWith(fontSize: 14)),
                    buildAddButton("Add as a new question".tr, Icons.add,
                        size: 250, onPressed: () {
                      Get.dialog(Add_Essay_questions_Quiz_Dialog());
                    }),
                    buildAddButton("Addition from the bank".tr, LMS_Icons.paper,
                        size: 250, onPressed: () {
                      Get.dialog(Add_Article_question_From_Bank());
                    }),
                    Divider(
                      color: Get.theme.textTheme.titleMedium!.color,
                      thickness: 0.5,
                    ),
                  ],
                ),
                Column(
                  spacing: 15.0,
                  children: [
                    Text("Multiple-choice question with multiple answers".tr,
                        style: Get.theme.textTheme.titleMedium!
                            .copyWith(fontSize: 14)),
                    buildAddButton("Add as a new question".tr, Icons.add,
                        size: 250, onPressed: () {}),
                    buildAddButton(
                        "Addition from the bank".tr, LMS_Icons.multiselect,
                        size: 250, onPressed: () {}),
                    Divider(
                      color: Get.theme.textTheme.titleMedium!.color,
                      thickness: 0.5,
                    ),
                  ],
                ),
                Column(
                  spacing: 15.0,
                  children: [
                    Text("Matching questions".tr,
                        style: Get.theme.textTheme.titleMedium!
                            .copyWith(fontSize: 14)),
                    buildAddButton("Add as a new question".tr, Icons.add,
                        size: 250, onPressed: () {}),
                    buildAddButton("Addition from the bank".tr, LMS_Icons.same,
                        size: 250, onPressed: () {}),
                    Divider(
                      color: Get.theme.textTheme.titleMedium!.color,
                      thickness: 0.5,
                    ),
                  ],
                ),
                SizedBox(
                  height: 20.0,
                )
              ],
            ),
          ),
        )
      ],
    ),
  );
}
