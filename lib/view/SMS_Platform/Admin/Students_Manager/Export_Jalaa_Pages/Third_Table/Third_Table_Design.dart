import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vms_school/Link/Controller/AdminController/Students_Controllers/Jalaa_For_Students/Jalaa_Controller.dart';
import 'package:vms_school/view/SMS_Platform/Admin/Students_Manager/Export_Jalaa_Pages/Third_Table/Third_Table_Widgets.dart';

class Third_Table_Design extends StatelessWidget {
  Third_Table_Design({super.key, required this.hight});
  double hight = 80;
  @override
  Widget build(BuildContext context) {
    return GetBuilder<Jalaa_Controller>(builder: (controller) {
      return Table(
        defaultVerticalAlignment: TableCellVerticalAlignment.middle,
        columnWidths: {
          0: FixedColumnWidth(295), // الدرجة العظمى
        },
        children: [
          TableRow(children: [
            buildDgreeHasHight("الفصل الأول", isRight: true),
          ]),
          TableRow(children: [
            buildDgreeHasHight(
                "${controller.rebortCard!.rebort!.molahdat!.firstSemester ?? ""}",
                isRight: true,
                hight: hight),
          ]),
          TableRow(children: [
            buildDgreeHasHight("الفصل الثاني", isRight: true),
          ]),
          TableRow(children: [
            buildDgreeHasHight(
                "${controller.rebortCard!.rebort!.molahdat!.secondSemester ?? ""}",
                isRight: true,
                hight: hight),
          ]),
          TableRow(children: [
            buildDgreeHasHight(
              "نتيجة التلميذ",
              isRight: true,
            ),
          ]),
          TableRow(children: [
            buildDgreeHasHight(
              Alignment: Alignment.centerRight,
              "نجاح الى الصف",
              isRight: true,
            ),
          ]),
          TableRow(children: [
            buildDgreeHasHight(
              Alignment: Alignment.centerRight,
              "رسوب في الصف",
              isRight: true,
            ),
          ]),
          TableRow(children: [
            buildDgreeHasHightWithSpace(
              "نقل الى الصف",
              "لانه معيد",
              isRight: true,
            ),
          ]),
          TableRow(children: [
            buildDgreeHasHightWithSpace(
              "نقل الى الصف",
              "لاستنفاذه سنوات الرسوب",
              isRight: true,
            ),
          ]),
        ],
      );
    });
  }
}
