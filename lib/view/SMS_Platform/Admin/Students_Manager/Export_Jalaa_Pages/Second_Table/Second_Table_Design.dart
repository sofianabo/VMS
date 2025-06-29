import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vms_school/Link/Controller/AdminController/Students_Controllers/Jalaa_For_Students/Jalaa_Controller.dart';
import 'package:vms_school/view/SMS_Platform/Admin/Students_Manager/Export_Jalaa_Pages/Convert_Functions_For_All.dart';
import 'package:vms_school/view/SMS_Platform/Admin/Students_Manager/Export_Jalaa_Pages/Second_Table/Second_Table_Widgets.dart';

class Second_Table_Design extends StatelessWidget {
  const Second_Table_Design({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<Jalaa_Controller>(builder: (controller) {
      return Table(
        defaultVerticalAlignment: TableCellVerticalAlignment.middle,
        columnWidths: {
          0: FixedColumnWidth(80), // الدرجة العظمى
          1: FixedColumnWidth(40), // الدرجة العظمى
          2: FixedColumnWidth(40), // الدرجة العظمى
          3: FixedColumnWidth(80), // الدرجة العظمى
          4: FixedColumnWidth(55), // الدرجة العظمى
        },
        children: [
          TableRow(
            children: [
              buildRotateWithTextCell('الدوام المدرسي', "الفصل الأول",
                  isRight: true),
              buildRotateWithTextCell('الدوام الفعلي',
                  "${controller.rebortCard!.rebort!.attendance!.firstSemester!.dawamFiele ?? 0}",
                  isRight: true),
              buildRotateWithTextCell('دوام التلميذ',
                  "${controller.rebortCard!.rebort!.attendance!.firstSemester!.studentAttendance ?? 0}",
                  isRight: true),
              buildRotateGheabCell('الغياب', isRight: true),
              buildRotateWithTextCellWithBottom('النسبة المئوية\nللدوام',
                  "${((int.parse((controller.rebortCard!.rebort!.attendance!.firstSemester!.studentAttendance ?? 0).toString()) * 100) / int.parse(controller.rebortCard!.rebort!.attendance!.firstSemester!.dawamFiele.toString())).ceil()}%",
                  isLeft: true, isRight: true),
            ],
          ),
          TableRow(
            children: [
              buildDgreeSecondTable('الفصل الثاني', isRight: true),
              buildDgreeSecondTable(
                  isRight: true,
                  '${controller.rebortCard!.rebort!.attendance!.secondSemester!.dawamFiele}'),
              buildDgreeSecondTable(
                  isRight: true,
                  '${controller.rebortCard!.rebort!.attendance!.secondSemester!.studentAttendance}'),
              buildSplitDgreeSecondTable(
                isRight: true,
                data: [
                  {
                    "text": GheabAttendance(controller.rebortCard!.rebort!
                        .attendance!.secondSemester!.mobararAttendance
                        .toString()),
                    "width": 38,
                  },
                  {
                    "text": GheabAttendance(controller.rebortCard!.rebort!
                        .attendance!.secondSemester!.notMobararAttendance
                        .toString()),
                    "width": 40,
                  },
                ],
              ),
              buildDgreeSecondTable(
                  "${((int.parse(controller.rebortCard!.rebort!.attendance!.secondSemester!.studentAttendance.toString()) * 100) / int.parse(controller.rebortCard!.rebort!.attendance!.secondSemester!.dawamFiele.toString())).ceil()}%",
                  isLeft: true,
                  isRight: true),
            ],
          ),
          TableRow(
            children: [
              buildDgreeSecondTable('المجموع', isRight: true),
              buildDgreeSecondTable(
                  isRight: true,
                  '${int.parse(controller.rebortCard!.rebort!.attendance!.firstSemester!.dawamFiele.toString()) + int.parse(controller.rebortCard!.rebort!.attendance!.secondSemester!.dawamFiele.toString())}'),
              buildDgreeSecondTable(
                  isRight: true,
                  '${int.parse(controller.rebortCard!.rebort!.attendance!.firstSemester!.studentAttendance.toString()) + int.parse(controller.rebortCard!.rebort!.attendance!.secondSemester!.studentAttendance.toString())}'),
              buildSplitDgreeSecondTable(
                isRight: true,
                data: [
                  {
                    "text": GheabAttendance(
                      '${int.parse(controller.rebortCard!.rebort!.attendance!.firstSemester!.mobararAttendance.toString()) + int.parse(controller.rebortCard!.rebort!.attendance!.secondSemester!.mobararAttendance.toString())}',
                    ),
                    "width": 38,
                  },
                  {
                    "text": GheabAttendance(
                      '${int.parse(controller.rebortCard!.rebort!.attendance!.firstSemester!.notMobararAttendance.toString()) + int.parse(controller.rebortCard!.rebort!.attendance!.secondSemester!.notMobararAttendance.toString())}',
                    ),
                    "width": 40,
                  },
                ],
              ),
              buildDgreeSecondTable(
                  "${((((int.parse(controller.rebortCard!.rebort!.attendance!.firstSemester!.studentAttendance.toString()) * 100) / int.parse(controller.rebortCard!.rebort!.attendance!.firstSemester!.dawamFiele.toString())).ceil()) + ((int.parse(controller.rebortCard!.rebort!.attendance!.secondSemester!.studentAttendance.toString()) * 100) / int.parse(controller.rebortCard!.rebort!.attendance!.secondSemester!.dawamFiele.toString())).ceil()) / 2}%",
                  isLeft: true,
                  isRight: true),
            ],
          ),
        ],
      );
    });
  }
}
