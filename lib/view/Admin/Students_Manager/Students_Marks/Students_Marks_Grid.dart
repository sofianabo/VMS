import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:vms_school/Link/Controller/AdminController/Students_Controllers/Students_Marks_Controller.dart';
import 'package:vms_school/Link/Model/AdminModel/Students_Models/Students_Marks_Model.dart';
import 'package:vms_school/Translate/local_controller.dart';
import 'package:vms_school/main.dart';

class Students_Marks_Gen extends StatelessWidget {
  Students_Marks_Gen({super.key});

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: prefs!.getString(languageKey) == 'ar'
          ? TextDirection.rtl
          : TextDirection.ltr,
      child: GetBuilder<Students_Marks_Controller>(builder: (controller) {
        if (controller.isLoading) {
          return CircularProgressIndicator();
        }
        return SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Table(
            border: TableBorder.all(color: Colors.black, width: 1),
            columnWidths: _buildColumnWidths(controller),
            children: _buildTableRows(context, controller),
          ),
        );
      }),
    );
  }

  Map<int, TableColumnWidth> _buildColumnWidths(
      Students_Marks_Controller controller) {
    final widths = <int, TableColumnWidth>{};

    widths[0] = FixedColumnWidth(150);

    for (int i = 0; i < controller.studentsMarksModel!.quizType!.length; i++) {
      widths[i + 1] = FixedColumnWidth(
        double.parse(
            controller.studentsMarksModel!.quizType![i].size.toString()),
      );
    }

    widths[controller.studentsMarksModel!.quizType!.length + 1] =
        FixedColumnWidth(120);

    return widths;
  }

  List<TableRow> _buildTableRows(
      BuildContext context, Students_Marks_Controller controller) {
    List<TableRow> rows = [];

    // صفوف الرؤوس (تبقى كما هي)
    rows.add(TableRow(
      children: [
        tableCell(context, "اسم الطالب", -1, isHeader: true),
        ...List.generate(
          controller.studentsMarksModel!.quizType!.length,
          (index) {
            String name =
                controller.studentsMarksModel!.quizType![index].name as String;
            return tableCell(context, name, index, isHeader: true);
          },
        ),
        tableCell(context, "إجراءات", -1, isHeader: true),
      ],
    ));

    rows.add(TableRow(
      children: [
        tableCell(context, " ", -1),
        ...List.generate(controller.studentsMarksModel!.quizType!.length,
            (index) {
          List<Items> items = controller
              .studentsMarksModel!.quizType![index].items as List<Items>;
          if (items.isEmpty) {
            return tableCell(context, " ", index);
          }
          return tableCellWithItems(context, items, index, isHeader: true);
        }),
        tableCell(context, " ", -1),
      ],
    ));

    rows.add(TableRow(
      children: [
        tableCell(context, " ", -1),
        ...List.generate(controller.studentsMarksModel!.quizType!.length,
            (index) {
          List<Items> items = controller
              .studentsMarksModel!.quizType![index].items as List<Items>;
          if (controller.studentsMarksModel!.quizType![index].ratio == 0) {
            return tableCell(context, " ", index);
          }
          return tableCellWithItems(context, items, index, showRatio: true);
        }),
        tableCell(context, " ", -1),
      ],
    ));

    // صفوف الطلاب المعدلة
    for (int i = 0; i < controller.studentsMarksModel!.student!.length; i++) {
      final student = controller.studentsMarksModel!.student![i];
      rows.add(TableRow(
        children: [
          tableCell(context, student.fullName ?? "", -1),
          ...List.generate(controller.studentsMarksModel!.quizType!.length,
              (index) {
            final quizType = controller.studentsMarksModel!.quizType![index];
            return _buildEditableMarkCell(context, student, quizType);
          }),
          _buildOptionsButton(context, i, student),
        ],
      ));
    }

    return rows;
  }

  Widget _buildEditableMarkCell(
      BuildContext context, Student student, QuizType quizType) {
    // إذا كانت quizType لديها items
    if (quizType.items != null && quizType.items!.isNotEmpty) {
      List<Widget> itemCells = [];

      for (var item in quizType.items!) {
        Mark? matchingMark = student.mark?.firstWhere(
          (mark) => mark.type == item.name,
          orElse: () => Mark(),
        );

        itemCells.add(
          Expanded(
            child: Container(
              height: 45,
              decoration: BoxDecoration(border: Border.all(width: 0.5)),
              alignment: Alignment.center,
              child: _buildMarkTextField(matchingMark),
            ),
          ),
        );
      }

      return Container(
        width: double.parse(quizType.size.toString()),
        child: Row(children: itemCells),
      );
    }
    // إذا لم يكن لديها items
    else {
      Mark? matchingMark = student.mark?.firstWhere(
        (mark) => mark.type == quizType.name,
        orElse: () => Mark(),
      );

      return _buildMarkTextField(matchingMark);
    }
  }

  Widget _buildMarkTextField(Mark? mark) {
    TextEditingController _controller = TextEditingController(
      text: mark?.mark?.toString() ?? "",
    );

    return TextField(
      controller: _controller,
      keyboardType: TextInputType.number,
      maxLength: 4,
      textAlign: TextAlign.center,
      decoration: InputDecoration(
        counterText: "",
        border: InputBorder.none,
        contentPadding: EdgeInsets.zero,
        isDense: true,
      ),
      onChanged: (value) {
        if (value.isNotEmpty) {
          int? newMark = int.tryParse(value);
          if (newMark != null && mark != null) {
            mark.mark = newMark;
          }
        }
      },
      inputFormatters: [
        FilteringTextInputFormatter.digitsOnly,
      ],
      style: TextStyle(fontSize: 14),
    );
  }

  Widget _buildOptionsButton(
      BuildContext context, int studentIndex, Student student) {
    return Container(
      width: 40,
      height: 40,
      decoration: BoxDecoration(
        color: Theme.of(context).cardColor,
        borderRadius: BorderRadius.circular(5),
        boxShadow: const [
          BoxShadow(color: Colors.black12, offset: Offset(0, 2), blurRadius: 1)
        ],
      ),
      child: IconButton(
        style: const ButtonStyle(
          shape: WidgetStatePropertyAll(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(5)),
            ),
          ),
        ),
        onPressed: () {
          _printStudentData(studentIndex, student);
        },
        icon: Icon(
          Icons.more_vert_rounded,
          size: 18,
          color: Theme.of(context).highlightColor,
        ),
      ),
    );
  }

  void _printStudentData(int index, Student student) {
    print("====== بيانات الطالب ======");
    print("Index: $index");
    print("الاسم: ${student.fullName}");

    if (student.mark != null) {
      for (var mark in student.mark!) {
        print("النوع: ${mark.type} - العلامة: ${mark.mark ?? 'غير محدد'}");
      }
    }

    Get.snackbar(
      "تم الطباعة",
      "تم طباعة بيانات الطالب في الكونسول",
      snackPosition: SnackPosition.BOTTOM,
    );
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
      {bool isHeader = false}) {
    return Container(
      width: index == -1
          ? 150
          : double.parse(Get.find<Students_Marks_Controller>()
              .studentsMarksModel!
              .quizType![index]
              .size
              .toString()),
      padding: EdgeInsets.all(8),
      alignment: Alignment.center,
      child: Text(
        text,
        textAlign: TextAlign.center,
        style: TextStyle(
            fontWeight: isHeader ? FontWeight.bold : FontWeight.normal),
      ),
    );
  }
}
