import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:vms_school/Link/Controller/AdminController/School_Controllers/Teachernote_and_GradeReco.dart';
import 'package:vms_school/Link/Functions/Add_Table_Quiz_Functions.dart';

class GradesTableScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<TeachernoteAndGradeReco>(builder: (controller) {
      return controller.ClassIndex.trim().toString() != ""
          ? controller.isQuizTypeLoading == true
              ? LoadingAnimationWidget.inkDrop(
                  color: Theme.of(context).primaryColor,
                  size: 60,
                )
              : controller.groups.isNotEmpty
                  ? Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: GestureDetector(
                        onTap: () {
                          Get.dialog(Rerange_Group());
                        },
                        child: Obx(() {
                          return Table(
                            textDirection: TextDirection.rtl,
                            border:
                                TableBorder.all(color: Colors.black, width: 1),
                            columnWidths: {
                              for (int i = 0;
                                  i < controller.columnWidths.length;
                                  i++)
                                i: FixedColumnWidth(controller.columnWidths[i]),
                            },
                            children: _buildTableRows(context, controller),
                          );
                        }),
                      ),
                    )
                  : Center(
                      child: Text("No Quiz Type",
                          style: Theme.of(context)
                              .textTheme
                              .titleLarge!
                              .copyWith(
                                  fontSize: 16, fontWeight: FontWeight.normal)))
          : Center(
              child: Text("Please Select Class First",
                  style: Theme.of(context)
                      .textTheme
                      .titleLarge!
                      .copyWith(fontSize: 16, fontWeight: FontWeight.normal)));
    });
  }

  List<TableRow> _buildTableRows(
      BuildContext context, TeachernoteAndGradeReco controller) {
    List<TableRow> rows = [];

    // صف الرأس (أسماء المجموعات)
    rows.add(TableRow(
      children: List.generate(
        controller.groups.length,
        (index) {
          String name = controller.groups[index]['name'] as String;
          return tableCell(context, name, index, isHeader: true);
        },
      ),
    ));

    // صف العناصر والنسب مع دمج الخلايا الفارغة
    rows.add(TableRow(
      children: List.generate(controller.groups.length, (index) {
        List<dynamic> items =
            controller.groups[index]['items'] as List<dynamic>;
        dynamic ratio = controller.groups[index]['ratio'];

        if (items.isEmpty) {
          // إذا لم يكن هناك items نعرض ratio في خلية واحدة كبيرة
          return Container(
            height: 90, // ارتفاع مضاعف لدمج الصفين
            decoration: BoxDecoration(border: Border.all(width: 0.5)),
            alignment: Alignment.center,
            child: Text(
              ratio == 0 ? " " : ratio.toString(),
              textAlign: TextAlign.center,
            ),
          );
        } else {
          // إذا كان هناك items نعرضها في صفين
          return Column(
            children: [
              // صف العناصر
              Container(
                height: 45,
                child: Row(
                  children: items.map((item) {
                    return Expanded(
                      child: Container(
                        decoration:
                            BoxDecoration(border: Border.all(width: 0.5)),
                        alignment: Alignment.center,
                        child: Text(
                          item['name'],
                          textAlign: TextAlign.center,
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
                  children: items.map((item) {
                    return Expanded(
                      child: Container(
                        decoration:
                            BoxDecoration(border: Border.all(width: 0.5)),
                        alignment: Alignment.center,
                        child: Text(
                          item['ratio'].toString(),
                          textAlign: TextAlign.center,
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
    ));

    return rows;
  }

  Widget tableCellWithItems(BuildContext context, List items, int index,
      {bool showRatio = false, bool isHeader = false}) {
    return GestureDetector(
      onHorizontalDragUpdate: (details) {
        double newWidth =
            Get.find<TeachernoteAndGradeReco>().columnWidths[index] +
                details.primaryDelta!;
        if (newWidth >= 80.0 && newWidth <= 800.0) {
          Get.find<TeachernoteAndGradeReco>().resizeColumn(index,
              details.primaryDelta!); // استدعاء تغيير الحجم من الـ controller
        }
      },
      child: MouseRegion(
        cursor: SystemMouseCursors.resizeLeftRight,
        child: SizedBox(
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
                        decoration:
                            BoxDecoration(border: Border.all(width: 0.5)),
                        alignment: Alignment.center,
                        child: Text(
                          showRatio
                              ? items[itemIndex]['ratio'].toString()
                              : items[itemIndex]['name'],
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontWeight: isHeader
                                  ? FontWeight.bold
                                  : FontWeight.normal),
                        ),
                      ),
                    );
                  }),
                ),
        ),
      ),
    );
  }

  Widget tableCell(BuildContext context, String text, int index,
      {bool isHeader = false}) {
    return GestureDetector(
      onHorizontalDragUpdate: (details) {
        // حساب نصف عرض A4 بالنقاط المنطقية
        double widthInPixels =
            210 * 3.7795 * MediaQuery.of(context).devicePixelRatio;
        double maxWidth = widthInPixels / 2;

        // حساب العرض الجديد بعد التغيير
        double newWidth =
            Get.find<TeachernoteAndGradeReco>().columnWidths[index] +
                details.primaryDelta!;

        // طباعة لتتأكد من القيمة التي تحسبها
        print('maxWidth: $maxWidth, newWidth: $newWidth');

        // التأكد أن العرض الجديد لا يتجاوز الحد الأقصى ولا أقل من الحد الأدنى
        if (newWidth >= 80.0 && newWidth <= maxWidth) {
          Get.find<TeachernoteAndGradeReco>()
              .resizeColumn(index, details.primaryDelta!);
        } else {
          // تطبيق الحد الأقصى أو الأدنى هنا
          if (newWidth > maxWidth) {
            Get.find<TeachernoteAndGradeReco>().resizeColumn(
                index,
                maxWidth -
                    Get.find<TeachernoteAndGradeReco>().columnWidths[index]);
          } else if (newWidth < 80.0) {
            Get.find<TeachernoteAndGradeReco>().resizeColumn(index,
                80.0 - Get.find<TeachernoteAndGradeReco>().columnWidths[index]);
          }
        }
      },
      child: MouseRegion(
        cursor: SystemMouseCursors.resizeLeftRight,
        child: Container(
          width: Get.find<TeachernoteAndGradeReco>().columnWidths[index],
          padding: EdgeInsets.all(8),
          alignment: Alignment.center,
          child: Text(
            text,
            textAlign: TextAlign.center,
            style: TextStyle(
                fontWeight: isHeader ? FontWeight.bold : FontWeight.normal),
          ),
        ),
      ),
    );
  }
}
