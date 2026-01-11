import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vms_school/Link/Controller/AdminController/Students_Controllers/Jalaa_For_Students/Jalaa_Controller.dart';
import 'package:vms_school/view/SMS_Platform/Admin/Students_Manager/Export_Jalaa_Pages/Convert_Functions_For_All.dart';
import 'package:vms_school/view/SMS_Platform/Admin/Students_Manager/Export_Jalaa_Pages/First_Table/First_Table_Widgets.dart';
import 'package:vms_school/view/SMS_Platform/Admin/Students_Manager/Export_Jalaa_Pages/Second_Table/Second_Table_Design.dart';

class Second_Table_Design_SHID1 extends StatelessWidget {
  Second_Table_Design_SHID1({super.key, required this.hight});
  double hight = 100.0;
  @override
  Widget build(BuildContext context) {
    return GetBuilder<Jalaa_Controller>(builder: (controller) {
      final first = controller.rebortCard!.rebort!.attendance!.firstSemester!;
      final second = controller.rebortCard!.rebort!.attendance!.secondSemester!;
      return Table(
        defaultVerticalAlignment: TableCellVerticalAlignment.middle,
        columnWidths: {
          0: FixedColumnWidth(800), // المواد الدراسية
        },
        children: [
          // Main Table Header
          TableRow(
            children: [
              Container(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        buildCellforAll("", IsTop: true, width: 60),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                buildCellforAll("جدول دوام التلميذ",
                                    width: 400,
                                    height: 40,
                                    fontSize: 14,
                                    IsTop: true,
                                    IsBottom: true,
                                    IsRight: true)
                              ],
                            ),
                            Row(
                              children: [
                                buildCellforAll("الدوام المدرسي",
                                    fontSize: 16,
                                    IsLeft: true,
                                    width: 150,
                                    height: 110,
                                    IsBottom: true,
                                    IsRight: true),
                                buildCellforAll("الدوام الفعلي",
                                    IsScale: true,
                                    height: 110,
                                    width: 60,
                                    IsLeft: true,
                                    IsBottom: true),
                                buildCellforAll("دوام التلميذ",
                                    IsScale: true,
                                    IsLeft: true,
                                    height: 110,
                                    width: 60,
                                    IsBottom: true),
                                Column(
                                  children: [
                                    buildCellforAll("الغياب",
                                        IsBottom: true,
                                        width: 130,
                                        height: 30,
                                        fontSize: 16),
                                    Row(
                                      children: [
                                        buildCellforAll(
                                            width: 65,
                                            height: 80,
                                            IsLeft: true,
                                            IsBottom: true,
                                            "مبرر",
                                            fontSize: 16),
                                        buildCellforAll(
                                            width: 65,
                                            height: 80,
                                            IsBottom: true,
                                            "غير\nمبرر",
                                            fontSize: 16),
                                      ],
                                    )
                                  ],
                                )
                              ],
                            ),
                            Row(
                              children: [
                                buildCellforAll("الفصل الأول",
                                    fontSize: 16,
                                    IsLeft: true,
                                    width: 150,
                                    height: 40,
                                    IsBottom: true,
                                    IsRight: true),
                                buildCellforAll("${first.dawamFile ?? 0}",
                                    height: 40,
                                    width: 60,
                                    fontSize: 16,
                                    IsLeft: true,
                                    IsBottom: true),
                                buildCellforAll(
                                    "${first.studentAttendance ?? 0}",
                                    IsLeft: true,
                                    fontSize: 16,
                                    height: 40,
                                    width: 60,
                                    IsBottom: true),
                                buildCellforAll(
                                    GheabAttendance(
                                        '${first.mobararAttendance ?? 0}'),
                                    IsBottom: true,
                                    IsLeft: true,
                                    width: 65,
                                    height: 40,
                                    fontSize: 16),
                                buildCellforAll(
                                  fontSize: 16,
                                  GheabAttendance(
                                      '${first.notMobararAttendance ?? 0}'),
                                  width: 65,
                                  height: 40,
                                  IsBottom: true,
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                buildCellforAll("الفصل الثاني",
                                    fontSize: 16,
                                    IsLeft: true,
                                    width: 150,
                                    height: 40,
                                    IsBottom: true,
                                    IsRight: true),
                                buildCellforAll('${second.dawamFile ?? 0}',
                                    height: 40,
                                    width: 60,
                                    fontSize: 16,
                                    IsLeft: true,
                                    IsBottom: true),
                                buildCellforAll(
                                    '${second.studentAttendance ?? 0}',
                                    IsLeft: true,
                                    fontSize: 16,
                                    height: 40,
                                    width: 60,
                                    IsBottom: true),
                                buildCellforAll(
                                    GheabAttendance(
                                        '${second.mobararAttendance ?? 0}'),
                                    IsBottom: true,
                                    IsLeft: true,
                                    width: 65,
                                    height: 40,
                                    fontSize: 16),
                                buildCellforAll(
                                  fontSize: 16,
                                  GheabAttendance(
                                      '${second.notMobararAttendance ?? 0}'),
                                  width: 65,
                                  height: 40,
                                  IsBottom: true,
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                buildCellforAll("المجموع",
                                    fontSize: 16,
                                    IsLeft: true,
                                    width: 150,
                                    height: 70,
                                    IsBottom: true,
                                    IsRight: true),
                                buildCellforAll(
                                    '${(int.tryParse(first.dawamFile.toString()) ?? 0) + (int.tryParse(second.dawamFile.toString()) ?? 0)}',
                                    height: 70,
                                    width: 60,
                                    fontSize: 16,
                                    IsLeft: true,
                                    IsBottom: true),
                                buildCellforAll(
                                    '${(int.tryParse(first.studentAttendance.toString()) ?? 0) + (int.tryParse(second.studentAttendance.toString()) ?? 0)}',
                                    IsLeft: true,
                                    fontSize: 16,
                                    height: 70,
                                    width: 60,
                                    IsBottom: true),
                                buildCellforAll(
                                    GheabAttendance(
                                      '${(int.tryParse(first.mobararAttendance.toString()) ?? 0) + (int.tryParse(second.mobararAttendance.toString()) ?? 0)}',
                                    ),
                                    IsBottom: true,
                                    IsLeft: true,
                                    width: 65,
                                    height: 70,
                                    fontSize: 16),
                                buildCellforAll(
                                  fontSize: 16,
                                  GheabAttendance(
                                    '${(int.tryParse(first.notMobararAttendance.toString()) ?? 0) + (int.tryParse(second.notMobararAttendance.toString()) ?? 0)}',
                                  ),
                                  width: 65,
                                  height: 70,
                                  IsBottom: true,
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                buildCellforAll("النسبة المئوية للدوام",
                                    fontSize: 14,
                                    IsLeft: true,
                                    width: 210,
                                    height: hight,
                                    IsBottom: true,
                                    IsRight: true),
                                buildCellforAll(
                                  fontSize: 16,
                                  calculateAverageAttendance(
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
                                  ),
                                  width: 190,
                                  height: hight,
                                  IsBottom: true,
                                ),
                              ],
                            ),
                          ],
                        ),
                        Column(
                          children: [
                            buildCellforAll("التوجيهات التربوية للمعلم",
                                width: 340,
                                height: 100,
                                IsTop: true,
                                IsRight: true,
                                IsLeft: true,
                                IsBottom: true),
                            buildCellforAll(
                                "${controller.rebortCard!.rebort!.molahdat!.firstSemester ?? " "}\n${controller.rebortCard!.rebort!.molahdat!.secondSemester ?? " "}",
                                fontSize: 14,
                                width: 340,
                                height: 200,
                                IsLeft: true,
                                IsRight: true,
                                IsBottom: true),
                            buildCellforAll("اسم المعلم و توقيعه",
                                alignment: Alignment.topRight,
                                textPadding: EdgeInsets.all(8.0),
                                fontSize: 14,
                                width: 340,
                                height: hight,
                                IsLeft: true,
                                IsRight: true,
                                IsBottom: true),
                          ],
                        ),
                      ],
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        buildCellforAll(
                            textPadding: EdgeInsets.all(5.0),
                            width: 740,
                            height: 35,
                            IsBottom: true,
                            IsRight: true,
                            IsLeft: true,
                            "نتيجة التلميذ",
                            fontSize: 14),
                        buildCellforAll(
                            textPadding: EdgeInsets.all(5.0),
                            width: 740,
                            height: 35,
                            IsBottom: true,
                            IsRight: true,
                            IsLeft: true,
                            alignment: Alignment.centerRight,
                            "نجاح الى الصف:",
                            fontSize: 14),
                        buildCellforAll(
                            textPadding: EdgeInsets.all(5.0),
                            alignment: Alignment.centerRight,
                            width: 740,
                            height: 35,
                            IsBottom: true,
                            IsRight: true,
                            IsLeft: true,
                            "رسوب في الصف:",
                            fontSize: 14),
                        buildCellforAll(
                            alignment: Alignment.centerRight,
                            textPadding: EdgeInsets.all(5.0),
                            width: 740,
                            height: 35,
                            IsBottom: true,
                            IsRight: true,
                            IsLeft: true,
                            "نقل الى الصف:                                      لأنه معيد",
                            fontSize: 14),
                        buildCellforAll(
                            alignment: Alignment.centerRight,
                            textPadding: EdgeInsets.all(5.0),
                            width: 740,
                            height: 35,
                            IsBottom: true,
                            IsRight: true,
                            IsLeft: true,
                            "نقل الى الصف:                                      لاستنفاذه سنوات الرسوب:",
                            fontSize: 14),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            buildCellforAll(
                                textPadding: EdgeInsets.all(5.0),
                                alignment: Alignment.topCenter,
                                width: 206,
                                height: 100,
                                IsBottom: true,
                                IsRight: true,
                                IsLeft: true,
                                " اسم المدير: "
                                "\n${controller.rebortCard!.rebort!.molahdat!.schoolmanager ?? ""}",
                                fontSize: 16),
                            buildCellforAll(
                                textPadding: EdgeInsets.all(5.0),
                                alignment: Alignment.topCenter,
                                width: 270,
                                height: 100,
                                IsBottom: true,
                                IsLeft: true,
                                "التوقيع",
                                fontSize: 16),
                            buildCellforAll(
                                textPadding: EdgeInsets.all(5.0),
                                alignment: Alignment.topCenter,
                                width: 264,
                                height: 100,
                                IsBottom: true,
                                IsLeft: true,
                                "الختم",
                                fontSize: 16),
                          ],
                        ),
                        Row(
                          children: [
                            buildCellforAll("",
                                IsBottom: true, width: 60, height: 29),
                            buildCellforAll(
                                width: 740,
                                height: 29,
                                IsBottom: true,
                                IsRight: true,
                                IsLeft: true,
                                "التاريخ:      /       / 2023م",
                                fontSize: 16),
                          ],
                        ),
                      ],
                    )
                  ],
                ),
              )
            ],
          ),
        ],
      );
    });
  }
}

Widget buildCell(
  String text,
  Isleft,
  Isright,
  isTop,
  IsBottom,
  IsScale,
  width,
  hight,
) {
  return Container(
    decoration:
        BoxDecoration(border: Border.all(color: Colors.black, width: 2)),
    alignment: Alignment.center,
    padding: EdgeInsets.all(8),
    height: 133,
    child: Text(
      textAlign: TextAlign.center,
      convertToArabicNumbers(text),
      style: TextStyle(
          fontSize: 18, fontFamily: "tnr", fontWeight: FontWeight.bold),
    ),
  );
}
