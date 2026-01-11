import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vms_school/Link/Controller/AdminController/Students_Controllers/Jalaa_For_Students/Jalaa_Controller.dart';
import 'package:vms_school/view/SMS_Platform/Admin/Students_Manager/Export_Jalaa_Pages/Convert_Functions_For_All.dart';
import 'package:vms_school/view/SMS_Platform/Admin/Students_Manager/Export_Jalaa_Pages/First_Table/First_Table_Widgets.dart';

class First_Table_Design_SHID1 extends StatelessWidget {
  First_Table_Design_SHID1({super.key, required this.hight});
  double hight = 40;
  @override
  Widget build(BuildContext context) {
    return GetBuilder<Jalaa_Controller>(builder: (controller) {
      return Table(
        defaultVerticalAlignment: TableCellVerticalAlignment.middle,
        columnWidths: {
          0: FixedColumnWidth(200), // المواد الدراسية
          1: FixedColumnWidth(150), // الدرجة العظمى
          2: FixedColumnWidth(150), // الفصل الدراسي الأول
          3: FixedColumnWidth(100), // الفصل الدراسي الثاني
        },
        children: [
          // Main Table Header
          TableRow(
            children: [
              buildCellforAll(
                  height: 150,
                  'المواد الدراسية',
                  IsTop: true,
                  IsBottom: true,
                  IsLeft: true,
                  IsRight: true),
              buildCellforAll(
                  height: 150,
                  'تقديرات\nالفصل الأول',
                  IsTop: true,
                  IsBottom: true,
                  IsLeft: true),
              buildCellforAll(
                  height: 150,
                  'تقديرات\nالفصل الثاني',
                  IsTop: true,
                  IsBottom: true,
                  IsLeft: true),
              buildCellforAll(
                  height: 150,
                  'التقدير\nالنهائي',
                  IsTop: true,
                  IsBottom: true,
                  IsLeft: true),
            ],
          ),

          if (controller.rebortCard?.rebort?.mainCurriculum != null)
            ...controller.rebortCard!.rebort!.mainCurriculum!.map((mainCurr) {
              if ((mainCurr.insideCurr?.length ?? 0) <= 1) {
                // مادة عادية
                final marks = mainCurr.insideCurr!.first.marks ?? [];
                final passing = mainCurr.insideCurr!.first.passingMark ?? 0;

                return TableRow(
                  children: [
                    buildCellforAll(
                        fontSize: 14,
                        height: hight,
                        'ughlhj',
                        IsBottom: true,
                        IsLeft: true,
                        IsRight: true),
                    buildCellforAll(
                        fontSize: 14,
                        height: hight,
                        'ممتاز',
                        IsBottom: true,
                        IsLeft: true),
                    buildCellforAll(
                        fontSize: 14,
                        height: hight,
                        'ممتاز',
                        IsBottom: true,
                        IsLeft: true),
                    buildCellforAll(
                        fontSize: 14,
                        height: hight,
                        'ممتاز',
                        IsBottom: true,
                        IsLeft: true),
                  ],
                );
              } else {
                // مادة مقسمة مثل اللغة العربية
                return TableRow(
                  children: [
                    buildCellforAll(
                        fontSize: 14,
                        height: hight,
                        'التربية الدينية',
                        IsBottom: true,
                        IsLeft: true,
                        IsRight: true),
                    buildCellforAll(
                        fontSize: 14,
                        height: hight,
                        'ممتاز',
                        IsBottom: true,
                        IsLeft: true),
                    buildCellforAll(
                        fontSize: 14,
                        height: hight,
                        'ممتاز',
                        IsBottom: true,
                        IsLeft: true),
                    buildCellforAll(
                        fontSize: 14,
                        height: hight,
                        'ممتاز',
                        IsBottom: true,
                        IsLeft: true),
                  ],
                );
              }
            }).toList(),

          //The solok Table Row

          TableRow(
            children: [
              buildCellforAll(
                  fontSize: 14,
                  height: hight,
                  'السلوك',
                  IsBottom: true,
                  IsLeft: true,
                  IsRight: true),
              buildCellforAll(
                  fontSize: 14,
                  height: hight,
                  'ممتاز',
                  IsBottom: true,
                  IsLeft: true),
              buildCellforAll(
                  fontSize: 14,
                  height: hight,
                  'ممتاز',
                  IsBottom: true,
                  IsLeft: true),
              buildCellforAll(
                  fontSize: 14,
                  height: hight,
                  'ممتاز',
                  IsBottom: true,
                  IsLeft: true),
            ],
          ),
        ],
      );
    });
  }
}
