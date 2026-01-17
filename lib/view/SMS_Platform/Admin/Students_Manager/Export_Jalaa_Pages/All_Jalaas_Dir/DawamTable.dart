import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vms_school/Link/Controller/AdminController/Students_Controllers/Jalaa_For_Students/Jalaa_Controller.dart';
import 'package:vms_school/view/SMS_Platform/Admin/Students_Manager/Export_Jalaa_Pages/First_Table/First_Table_Widgets.dart';


class DawamTable extends StatelessWidget {
  const DawamTable({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<Jalaa_Controller>(builder: (controller) {
      final first = controller.rebortCard!.rebort!.attendance!.firstSemester!;
      final second = controller.rebortCard!.rebort!.attendance!.secondSemester!;

      return Column(
        children: [
          Table(
            border: TableBorder.all(width: 2),
            defaultVerticalAlignment: TableCellVerticalAlignment.middle,
            columnWidths: {
              0: FixedColumnWidth(110), // المواد الدراسية
              1: FixedColumnWidth(50), // الدرجة العظمى
              2: FixedColumnWidth(50), // الفصل الدراسي الأول
              3: FixedColumnWidth(50),// space
              4: FixedColumnWidth(60), // الدرجة العظمى
            },
            children: [
              TableRow(
                children: [
                  dawams('الدوام' , isdarage: true),
                  dawams('الكامل' , isdarage: true),
                  dawams('الفعلي' , isdarage: true),
                  dawams('غياب مبرر' , isdarage: true),
                  dawams('غياب غير مبرر' , isdarage: true),
                ],
              ),
              TableRow(
                children: [
                  dawams('الفصل الأول' , isdarage: true),
                  dawams('${first.studentAttendance}' ),
                  dawams('${first.dawamFile}' ),
                  dawams('${first.mobararAttendance}'),
                  dawams('${first.notMobararAttendance}'),
                ],
              ),
              TableRow(
                children: [
                  dawams('الفصل الثاني' , isdarage: true),
                  dawams('${second.studentAttendance}' ),
                  dawams('${second.dawamFile}' ),
                  dawams('${second.mobararAttendance}'),
                  dawams('${second.notMobararAttendance}'),
                ],
              ),
              TableRow(
                children: [
                  dawams('محموع الفصلين' , isdarage: true),
                  dawams('${(second.studentAttendance! + first.studentAttendance!)??""}' ),
                  dawams('${(second.dawamFile! + first.dawamFile!)??""}' ),
                  dawams('${(second.mobararAttendance!+first.mobararAttendance!)??""}'),
                  dawams('${(second.notMobararAttendance!+first.notMobararAttendance!)??""}'),
                ],
              ),

            ],
          ),

          Table(
            border: TableBorder(
              right: BorderSide(width: 2),
              left:  BorderSide(width: 2),
              bottom:  BorderSide(width: 2),
            ),
            defaultVerticalAlignment: TableCellVerticalAlignment.middle,
            columnWidths: {
              0: FixedColumnWidth(110), // المواد الدراسية
              1: FixedColumnWidth(210), // الدرجة العظمى
            },
            children: [
              TableRow(
                children: [
                  Container(
                      decoration: BoxDecoration(
                          border: Border(
                              left: BorderSide(color: Colors.black , width: 1)
                          )
                      ),
                      child: dawams('النسبة المئوية' , isdarage: true)),
                  Container(
                    decoration: BoxDecoration(
                        border: Border(
                            right: BorderSide(color: Colors.black , width: 1)
                        )
                    ),
                    child: dawams( calculateAverageAttendance(
                      student1: int.tryParse(first
                          .studentAttendance
                          .toString()) ??
                          0,
                      total1: int.tryParse(
                          first.dawamFile.toString()) ??
                          0,
                      student2: int.tryParse(second
                          .studentAttendance
                          .toString()) ??
                          0,
                      total2: int.tryParse(
                          second.dawamFile.toString()) ??
                          0,
                    )),
                  ),
                ],
              ),

            ],
          ),
        ],
      );
    });
  }
}

// دالة لحساب النسبة بشكل آمن
String calculateAttendancePercentage(int student, int total) {
  if (total == 0) return '0%';
  return "${((student * 100) / total).ceil()}%";
}

// دالة لحساب المعدل بين نسبتين مع حماية من NaN
String calculateAverageAttendance({
  required int student1,
  required int total1,
  required int student2,
  required int total2,
}) {
  double percent1 = total1 == 0 ? 0 : (student1 * 100) / total1;
  double percent2 = total2 == 0 ? 0 : (student2 * 100) / total2;
  return "${((percent1.ceil() + percent2.ceil()) / 2).ceil()}%";
}
