import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vms_school/Link/Controller/AdminController/School_Controllers/Teachernote_and_GradeReco.dart';
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
      child: GetBuilder<TeachernoteAndGradeReco>(builder: (controller) {
        return Table(
          border: TableBorder.all(color: Colors.black, width: 1),
          columnWidths: {
            for (int i = 0; i < controller.columnWidths.length; i++)
              i: FixedColumnWidth(controller.columnWidths[i]),
          },
          children: _buildTableRows(context, controller),
        );
      }),
    );
  }
}

List<TableRow> _buildTableRows(
    BuildContext context, TeachernoteAndGradeReco controller) {
  List<TableRow> rows = [];

  rows.add(TableRow(
    children: List.generate(
      controller.groups.length,
      (index) {
        String name = controller.groups[index]['name'] as String;
        return tableCell(context, name, index, isHeader: true);
      },
    ),
  ));

  // صف لعرض العناصر (items) فقط
  rows.add(TableRow(
    children: List.generate(controller.groups.length, (index) {
      // تحويل items إلى List<dynamic>
      List<dynamic> items = controller.groups[index]['items'] as List<dynamic>;
      if (items.isEmpty) {
        return tableCell(context, " ", index);
      }
      return tableCellWithItems(context, items, index, isHeader: true);
    }),
  ));

  // صف لعرض نسبة كل مجموعة
  rows.add(TableRow(
    children: List.generate(controller.groups.length, (index) {
      // تحويل items إلى List<dynamic>
      List<dynamic> items = controller.groups[index]['items'] as List<dynamic>;
      if (controller.groups[index]['ratio'] == 0) {
        return tableCell(context, " ", index);
      }
      return tableCellWithItems(context, items, index, showRatio: true);
    }),
  ));

  return rows;
}

Widget tableCellWithItems(BuildContext context, List items, int index,
    {bool showRatio = false, bool isHeader = false}) {
  return Container(
    width: Get.find<TeachernoteAndGradeReco>().columnWidths[index],
    child: items.isEmpty
        ? Center(
            child: Text(
              showRatio
                  ? Get.find<TeachernoteAndGradeReco>()
                      .groups[index]['ratio']
                      .toString()
                  : '',
              textAlign: TextAlign.center,
            ),
          )
        : Row(
            children: List.generate(items.length, (itemIndex) {
              return Expanded(
                child: Container(
                  height: 45,
                  decoration: BoxDecoration(border: Border.all(width: 0.5)),
                  alignment: Alignment.center,
                  child: Text(
                    showRatio
                        ? items[itemIndex]['ratio'].toString()
                        : items[itemIndex]['name'],
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontWeight:
                            isHeader ? FontWeight.bold : FontWeight.normal),
                  ),
                ),
              );
            }),
          ),
  );
}

Widget tableCell(BuildContext context, String text, int index,
    {bool isHeader = false}) {
  return Container(
    width: Get.find<TeachernoteAndGradeReco>().columnWidths[index],
    padding: EdgeInsets.all(8),
    alignment: Alignment.center,
    child: Text(
      text,
      textAlign: TextAlign.center,
      style:
          TextStyle(fontWeight: isHeader ? FontWeight.bold : FontWeight.normal),
    ),
  );
}
