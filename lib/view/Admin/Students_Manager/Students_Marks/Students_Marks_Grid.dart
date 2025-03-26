import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:vms_school/Link/Controller/AdminController/Students_Controllers/Students_Marks_Controller.dart';
import 'package:vms_school/Link/Model/AdminModel/Students_Models/Students_Marks_Model.dart';
import 'package:vms_school/Translate/local_controller.dart';
import 'package:vms_school/main.dart';

class Students_Marks_Gen extends StatefulWidget {
  const Students_Marks_Gen({super.key});

  @override
  State<Students_Marks_Gen> createState() => _Students_Marks_GenState();
}

class _Students_Marks_GenState extends State<Students_Marks_Gen> {
  final List<TextEditingController> _controllers = [];
  final ScrollController _headerScrollController = ScrollController();
  final ScrollController _bodyScrollController = ScrollController();
  final ScrollController _verticalScrollController = ScrollController();

  @override
  void initState() {
    super.initState();

    _headerScrollController.addListener(_syncHeaderScroll);
  }

  @override
  void dispose() {
    _controllers.forEach((controller) => controller.dispose());
    _headerScrollController.removeListener(_syncHeaderScroll);
    _headerScrollController.dispose();
    _bodyScrollController.dispose();
    _verticalScrollController.dispose();
    super.dispose();
  }

  void _syncHeaderScroll() {
    _bodyScrollController.jumpTo(_headerScrollController.offset);
  }

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: prefs!.getString(languageKey) == 'ar'
          ? TextDirection.rtl
          : TextDirection.ltr,
      child: GetBuilder<Students_Marks_Controller>(builder: (controller) {
        if (controller.ClassIndex == "") {
          return Center(
              child: Text(
            "Selected Class".tr,
            style: Theme.of(context)
                .textTheme
                .titleLarge!
                .copyWith(fontSize: 22, fontWeight: FontWeight.normal),
          ));
        }

        if (controller.DivisionIndex == "") {
          return Center(
              child: Text(
            "Selected Division".tr,
            style: Theme.of(context)
                .textTheme
                .titleLarge!
                .copyWith(fontSize: 22, fontWeight: FontWeight.normal),
          ));
        }
        if (controller.CurriculumIndex == "") {
          return Center(
              child: Text(
            "Selected Curriculum".tr,
            style: Theme.of(context)
                .textTheme
                .titleLarge!
                .copyWith(fontSize: 22, fontWeight: FontWeight.normal),
          ));
        }

        if (controller.isLoading) {
          return const Center(child: CircularProgressIndicator());
        }

        if (controller.studentsMarksModel?.quizType == null ||
            controller.studentsMarksModel!.quizType!.isEmpty) {
          return Center(
            child: Text(
              "No Quiz Type".tr,
              style: Theme.of(context)
                  .textTheme
                  .titleLarge!
                  .copyWith(fontSize: 22, fontWeight: FontWeight.normal),
            ),
          );
        }

        _initFocusNodesAndControllers(controller);

        // حساب العرض الكلي للجدول
        final totalWidth = _calculateTotalWidth(controller);

        return Column(
          children: [
            // الجدول العلوي (الرأس)
            SizedBox(
              height: 135, // ارتفاع ثابت للرأس
              child: ScrollConfiguration(
                behavior: ScrollConfiguration.of(context).copyWith(
                  dragDevices: {
                    PointerDeviceKind.touch,
                    PointerDeviceKind.mouse
                  },
                ),
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  controller: _headerScrollController,
                  child: SizedBox(
                    width: totalWidth,
                    child: _buildHeaderTable(context, controller),
                  ),
                ),
              ),
            ),
            // الجدول السفلي (المحتوى)
            Expanded(
              child: ScrollConfiguration(
                behavior: ScrollConfiguration.of(context).copyWith(
                  dragDevices: {
                    PointerDeviceKind.touch,
                    PointerDeviceKind.mouse
                  },
                ),
                child: SingleChildScrollView(
                  controller: _verticalScrollController,
                  scrollDirection: Axis.vertical,
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    controller: _bodyScrollController,
                    child: SizedBox(
                      width: totalWidth,
                      child: _buildStudentsTable(context, controller),
                    ),
                  ),
                ),
              ),
            ),
          ],
        );
      }),
    );
  }

  double _calculateTotalWidth(Students_Marks_Controller controller) {
    double width = 150.0; // عرض عمود اسم الطالب

    for (final quizType in controller.studentsMarksModel!.quizType!) {
      width += double.parse(quizType.size.toString());
    }

    width += 102.0; // عرض عمود الإجراءات
    return width;
  }

  Widget _buildHeaderTable(
      BuildContext context, Students_Marks_Controller controller) {
    return Table(
      border: TableBorder.all(color: Colors.black, width: 1),
      columnWidths: _buildColumnWidths(controller),
      defaultVerticalAlignment: TableCellVerticalAlignment.middle,
      children: [
        // صف الرأس الأول (الأسماء الرئيسية)
        TableRow(
          decoration: BoxDecoration(color: Get.theme.primaryColor),
          children: [
            _buildHeaderCell("اسم الطالب", Colors.white),
            ...controller.studentsMarksModel!.quizType!.map((quizType) {
              return _buildHeaderCell(quizType.name.toString(), Colors.white);
            }),
            _buildHeaderCell("إجراءات", Colors.white),
          ],
        ),
        // صف مدمج للعناصر والنسب
        TableRow(
          decoration: BoxDecoration(color: Get.theme.primaryColor),
          children: [
            _buildHeaderCell(" ", Colors.white),
            ...controller.studentsMarksModel!.quizType!.map((quizType) {
              if (quizType.items!.isEmpty) {
                // إذا لم يكن هناك items نعرض ratio المجموعة في خلية واحدة
                return quizType.ratio == 0
                    ? _buildHeaderCell(" ", Colors.white)
                    : _buildHeaderCell(quizType.ratio.toString(), Colors.white);
              } else {
                // إذا كان هناك items نعرضها مع نسبها
                return Column(
                  children: [
                    // صف العناصر
                    Container(
                      height: 45,
                      child: Row(
                        children: quizType.items!.map((item) {
                          return Expanded(
                            child: Container(
                              decoration:
                                  BoxDecoration(border: Border.all(width: 0.5)),
                              alignment: Alignment.center,
                              child: Text(
                                item.name.toString(),
                                textAlign: TextAlign.center,
                                style: const TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          );
                        }).toList(),
                      ),
                    ),
                    // صف النسب
                    Container(
                      height: 45,
                      child: Row(
                        children: quizType.items!.map((item) {
                          return Expanded(
                            child: Container(
                              decoration:
                                  BoxDecoration(border: Border.all(width: 0.5)),
                              alignment: Alignment.center,
                              child: Text(
                                item.ratio.toString(),
                                textAlign: TextAlign.center,
                                style: const TextStyle(color: Colors.white),
                              ),
                            ),
                          );
                        }).toList(),
                      ),
                    ),
                  ],
                );
              }
            }),
            _buildHeaderCell(" ", Colors.white),
          ],
        ),
      ],
    );
  }

  Widget _buildStudentsTable(
      BuildContext context, Students_Marks_Controller controller) {
    return Table(
      border: TableBorder.all(color: Colors.black, width: 1),
      columnWidths: _buildColumnWidths(controller),
      defaultVerticalAlignment: TableCellVerticalAlignment.middle,
      children: controller.filterdstudent!.map((student) {
        return TableRow(
          children: [
            _buildStudentNameCell(student.fullName ?? ""),
            ...controller.studentsMarksModel!.quizType!.map((quizType) {
              return _buildEditableMarkCell(student, quizType);
            }),
            _buildOptionsButton(student),
          ],
        );
      }).toList(),
    );
  }

  Widget _buildHeaderCell(String text, Color color) {
    return Container(
      height: 45,
      alignment: Alignment.center,
      child: Text(
        text,
        textAlign: TextAlign.center,
        style: TextStyle(color: color, fontWeight: FontWeight.bold),
      ),
    );
  }

  Widget _buildItemsHeaderCell(QuizType quizType, bool isHeader,
      {bool showRatio = false}) {
    // إذا كان showRatio صحيحًا وكانت العناصر فارغة، نعرض نسبة المجموعة
    if (showRatio && quizType.items!.isEmpty) {
      return _buildHeaderCell(quizType.ratio.toString(), Colors.white);
    }

    // إذا كان showRatio صحيحًا وهناك عناصر، نعرض نسبة كل عنصر
    if (showRatio && quizType.items!.isNotEmpty) {
      return Container(
        height: 45,
        child: Row(
          children: quizType.items!.map((item) {
            return Expanded(
              child: Container(
                decoration: BoxDecoration(border: Border.all(width: 0.5)),
                alignment: Alignment.center,
                child: Text(
                  item.ratio.toString(),
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: isHeader ? FontWeight.bold : FontWeight.normal,
                  ),
                ),
              ),
            );
          }).toList(),
        ),
      );
    }

    // إذا لم يكن showRatio صحيحًا، نعرض العناصر إن وجدت
    if (quizType.items!.isNotEmpty) {
      return Container(
        height: 45,
        child: Row(
          children: quizType.items!.map((item) {
            return Expanded(
              child: Container(
                decoration: BoxDecoration(border: Border.all(width: 0.5)),
                alignment: Alignment.center,
                child: Text(
                  item.name.toString(),
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: isHeader ? FontWeight.bold : FontWeight.normal,
                  ),
                ),
              ),
            );
          }).toList(),
        ),
      );
    }

    // الحالة الافتراضية
    return _buildHeaderCell(" ", Colors.white);
  }

  Widget _buildStudentNameCell(String name) {
    return Container(
      height: 45,
      alignment: Alignment.center,
      child: Text(
        name,
        textAlign: TextAlign.center,
        style: const TextStyle(color: Colors.black),
      ),
    );
  }

  Widget _buildEditableMarkCell(Student student, QuizType quizType) {
    if (quizType.items == null || quizType.items!.isEmpty) {
      final mark = student.mark?.firstWhere(
        (m) => m.type == quizType.name,
        orElse: () => Mark(),
      );
      return _buildMarkTextField(mark);
    }

    return Container(
      height: 45,
      child: Row(
        children: quizType.items!.map((item) {
          final mark = student.mark?.firstWhere(
            (m) => m.type == item.name,
            orElse: () => Mark(),
          );
          return Expanded(
            child: Container(
              decoration: BoxDecoration(border: Border.all(width: 0.5)),
              alignment: Alignment.center,
              child: _buildMarkTextField(mark),
            ),
          );
        }).toList(),
      ),
    );
  }

  Widget _buildMarkTextField(Mark? mark) {
    final controller =
        TextEditingController(text: mark?.mark?.toString() ?? "");
    _controllers.add(controller);

    return TextField(
      controller: controller,
      keyboardType: TextInputType.number,
      maxLength: 4,
      textAlign: TextAlign.center,
      decoration: const InputDecoration(
        counterText: "",
        border: InputBorder.none,
        contentPadding: EdgeInsets.zero,
        isDense: true,
      ),
      onTap: () {
        // تحديد كل النص عند النقر
        controller.selection = TextSelection(
          baseOffset: 0,
          extentOffset: controller.text.length,
        );
      },
      onChanged: (value) {
        if (value.isNotEmpty && mark != null) {
          mark.mark = int.tryParse(value);
        }
      },
    );
  }

  Widget _buildOptionsButton(Student student) {
    return Container(
      width: 40,
      height: 40,
      alignment: Alignment.center,
      child: IconButton(
        icon: const Icon(Icons.more_vert, size: 20),
        onPressed: () => _printStudentData(student),
      ),
    );
  }

  void _printStudentData(Student student) {
    debugPrint("Student: ${student.fullName}");
    // ... باقي كود الطباعة ...
  }

  Map<int, TableColumnWidth> _buildColumnWidths(
      Students_Marks_Controller controller) {
    final widths = <int, TableColumnWidth>{};
    widths[0] = const FixedColumnWidth(150); // عمود اسم الطالب

    for (int i = 0; i < controller.studentsMarksModel!.quizType!.length; i++) {
      widths[i + 1] = FixedColumnWidth(
        double.parse(
            controller.studentsMarksModel!.quizType![i].size.toString()),
      );
    }

    widths[controller.studentsMarksModel!.quizType!.length + 1] =
        const FixedColumnWidth(102); // عمود الإجراءات

    return widths;
  }

  void _initFocusNodesAndControllers(Students_Marks_Controller controller) {
    _controllers.forEach((c) => c.dispose());
    _controllers.clear();
  }

  Widget tableCellWithItems(BuildContext context, List<Items> items, int index,
      {bool showRatio = false, bool isHeader = false}) {
    return Container(
      width: double.parse(Get.find<Students_Marks_Controller>()
          .studentsMarksModel!
          .quizType![index]
          .size
          .toString()),
      child: items.isEmpty
          ? Center(
              child: Text(
                showRatio
                    ? Get.find<Students_Marks_Controller>()
                        .studentsMarksModel!
                        .quizType![index]
                        .ratio
                        .toString()
                    : '',
                textAlign: TextAlign.center,
                style: const TextStyle(color: Colors.white),
              ),
            )
          : Row(
              children: items.map((item) {
                return Expanded(
                  child: Container(
                    height: 45,
                    decoration: BoxDecoration(border: Border.all(width: 0.5)),
                    alignment: Alignment.center,
                    child: Text(
                      showRatio ? "${item.ratio.toString()}" : "${item.name}",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight:
                              isHeader ? FontWeight.bold : FontWeight.normal),
                    ),
                  ),
                );
              }).toList(),
            ),
    );
  }

  Widget tableCell(BuildContext context, String text, int index,
      {bool isHeader = false, Color textColor = Colors.white}) {
    return Container(
      width: index == -1
          ? 150
          : double.parse(Get.find<Students_Marks_Controller>()
              .studentsMarksModel!
              .quizType![index]
              .size
              .toString()),
      height: 45,
      padding: const EdgeInsets.all(8),
      alignment: Alignment.center,
      child: Text(
        text,
        textAlign: TextAlign.center,
        style: TextStyle(
            color: textColor,
            fontWeight: isHeader ? FontWeight.bold : FontWeight.normal),
      ),
    );
  }
}
