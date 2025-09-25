import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vms_school/Link/Controller/AdminController/Students_Controllers/Jalaa_For_Students/Jalaa_Controller.dart';
import 'package:vms_school/view/SMS_Platform/Admin/Students_Manager/Export_Jalaa_Pages/Convert_Functions_For_All.dart';
import 'package:vms_school/view/SMS_Platform/Admin/Students_Manager/Export_Jalaa_Pages/First_Table/First_Table_Widgets.dart';

class First_Table_Design_SHID1 extends StatelessWidget {
  const First_Table_Design_SHID1({super.key});

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
                  'التقديرات النهائية',
                  IsTop: true,
                  IsBottom: true,
                  IsLeft: true),
            ],
          ),
          TableRow(
            children: [
              buildCellforAll(
                  height: 30,
                  'المواد الدراسية',
                  IsBottom: true,
                  IsLeft: true,
                  IsRight: true),
              buildCellforAll(
                  height: 30,
                  'تقديرات\nالفصل الأول',
                  IsBottom: true,
                  IsLeft: true),
              buildCellforAll(
                  height: 30,
                  'تقديرات\nالفصل الثاني',
                  IsBottom: true,
                  IsLeft: true),
              buildCellforAll(
                  height: 30,
                  'التقديرات النهائية',
                  IsBottom: true,
                  IsLeft: true),
            ],
          ),
        ],
      );
    });
  }
}
