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
      final first = controller.rebortCard!.rebort!.attendance!.firstSemester!;
      final second = controller.rebortCard!.rebort!.attendance!.secondSemester!;

      return Table(
        defaultVerticalAlignment: TableCellVerticalAlignment.middle,
        columnWidths: {
          0: FixedColumnWidth(80),
          1: FixedColumnWidth(40),
          2: FixedColumnWidth(40),
          3: FixedColumnWidth(80),
          4: FixedColumnWidth(55),
        },
        children: [
          TableRow(
            children: [
              buildRotateWithTextCell('الدوام المدرسي', "الفصل الأول",
                  isRight: true),
              buildRotateWithTextCell(
                  'الدوام الفعلي', "${first.dawamFile ?? 0}",
                  isRight: true),
              buildRotateWithTextCell(
                  'دوام التلميذ', "${first.studentAttendance ?? 0}",
                  isRight: true),
              buildRotateGheabCell('الغياب', isRight: true),
              buildRotateWithTextCellWithBottom(
                'النسبة المئوية\nللدوام',
                calculateAttendancePercentage(
                  int.tryParse(first.studentAttendance.toString()) ?? 0,
                  int.tryParse(first.dawamFile.toString()) ?? 0,
                ),
                isLeft: true,
                isRight: true,
              ),
            ],
          ),
          TableRow(
            children: [
              buildDgreeSecondTable('الفصل الثاني', isRight: true),
              buildDgreeSecondTable(isRight: true, '${second.dawamFile ?? 0}'),
              buildDgreeSecondTable(
                  isRight: true, '${second.studentAttendance ?? 0}'),
              buildSplitDgreeSecondTable(
                isRight: true,
                data: [
                  {
                    "text": GheabAttendance('${second.mobararAttendance ?? 0}'),
                    "width": 38,
                  },
                  {
                    "text":
                        GheabAttendance('${second.notMobararAttendance ?? 0}'),
                    "width": 40,
                  },
                ],
              ),
              buildDgreeSecondTable(
                calculateAttendancePercentage(
                  int.tryParse(second.studentAttendance.toString()) ?? 0,
                  int.tryParse(second.dawamFile.toString()) ?? 0,
                ),
                isLeft: true,
                isRight: true,
              ),
            ],
          ),
          TableRow(
            children: [
              buildDgreeSecondTable('المجموع', isRight: true),
              buildDgreeSecondTable(
                isRight: true,
                '${(int.tryParse(first.dawamFile.toString()) ?? 0) + (int.tryParse(second.dawamFile.toString()) ?? 0)}',
              ),
              buildDgreeSecondTable(
                isRight: true,
                '${(int.tryParse(first.studentAttendance.toString()) ?? 0) + (int.tryParse(second.studentAttendance.toString()) ?? 0)}',
              ),
              buildSplitDgreeSecondTable(
                isRight: true,
                data: [
                  {
                    "text": GheabAttendance(
                      '${(int.tryParse(first.mobararAttendance.toString()) ?? 0) + (int.tryParse(second.mobararAttendance.toString()) ?? 0)}',
                    ),
                    "width": 38,
                  },
                  {
                    "text": GheabAttendance(
                      '${(int.tryParse(first.notMobararAttendance.toString()) ?? 0) + (int.tryParse(second.notMobararAttendance.toString()) ?? 0)}',
                    ),
                    "width": 40,
                  },
                ],
              ),
              buildDgreeSecondTable(
                calculateAverageAttendance(
                  student1:
                      int.tryParse(first.studentAttendance.toString()) ?? 0,
                  total1: int.tryParse(first.dawamFile.toString()) ?? 0,
                  student2:
                      int.tryParse(second.studentAttendance.toString()) ?? 0,
                  total2: int.tryParse(second.dawamFile.toString()) ?? 0,
                ),
                isLeft: true,
                isRight: true,
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
