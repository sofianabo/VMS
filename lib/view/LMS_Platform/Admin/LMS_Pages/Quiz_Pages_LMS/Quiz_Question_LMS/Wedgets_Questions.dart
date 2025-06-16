import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vms_school/Icons_File/LMS_Icons/l_m_s__icons_icons.dart';
import 'package:vms_school/Translate/local_controller.dart';
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

Widget buildButtonsRow() {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      buildAddButton('Save'.tr, Icons.save_outlined),
      buildAddButton('Preview'.tr, Icons.preview_rounded),
    ],
  );
}

Widget buildAddButton(String text, icon, {double? size = 175}) {
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
      onPressed: () {},
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
            buildQuestionsList(
                screenWidth: screenWidth, isSmallScreen: fontSize),
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
                        size: 250),
                    buildAddButton("Addition from the bank".tr, LMS_Icons.tf,
                        size: 250),
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
                        size: 250),
                    buildAddButton(
                        "Addition from the bank".tr, LMS_Icons.checkone,
                        size: 250),
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
                        size: 250),
                    buildAddButton("Addition from the bank".tr, LMS_Icons.fill,
                        size: 250),
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
                        size: 250),
                    buildAddButton(
                        "Addition from the bank".tr, LMS_Icons.dragdrop,
                        size: 250),
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
                        size: 250),
                    buildAddButton("Addition from the bank".tr, LMS_Icons.paper,
                        size: 250),
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
                        size: 250),
                    buildAddButton(
                        "Addition from the bank".tr, LMS_Icons.multiselect,
                        size: 250),
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
                        size: 250),
                    buildAddButton("Addition from the bank".tr, LMS_Icons.same,
                        size: 250),
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
