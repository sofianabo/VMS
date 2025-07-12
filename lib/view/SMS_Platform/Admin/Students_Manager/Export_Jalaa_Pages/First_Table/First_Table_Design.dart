import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vms_school/Link/Controller/AdminController/Students_Controllers/Jalaa_For_Students/Jalaa_Controller.dart';
import 'package:vms_school/view/SMS_Platform/Admin/Students_Manager/Export_Jalaa_Pages/Convert_Functions_For_All.dart';
import 'package:vms_school/view/SMS_Platform/Admin/Students_Manager/Export_Jalaa_Pages/First_Table/First_Table_Widgets.dart';

class First_Table_Design extends StatelessWidget {
  const First_Table_Design({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<Jalaa_Controller>(builder: (controller) {
      return Table(
        defaultVerticalAlignment: TableCellVerticalAlignment.middle,
        columnWidths: {
          0: FixedColumnWidth(160), // المواد الدراسية
          1: FixedColumnWidth(40), // الدرجة العظمى
          2: FixedColumnWidth(300), // الفصل الدراسي الأول
          3: FixedColumnWidth(300), // الفصل الدراسي الثاني
          4: FixedColumnWidth(60), // الدرجة العظمى
          5: FixedColumnWidth(60), // الدرجة العظمى
          6: FixedColumnWidth(200),
        },
        children: [
          // Main Table Header
          TableRow(
            children: [
              buildCell('المواد الدراسية'),
              buildRotateCell('الدرجة العظمى'),
              The_First_Semester_Cell('الفصل الدراسي الأول'),
              The_Second_Semester_Cell('الفصل الدراسي الثاني'),
              Container(
                height: 133,
                decoration: BoxDecoration(
                    border: Border(
                  top: BorderSide(color: Colors.black, width: 2),
                  left: BorderSide(color: Colors.black, width: 2),
                  right: BorderSide(color: Colors.black, width: 2),
                )),
              ),
              buildRotateCell('مجموع درجات\nالفصلين'),
              The_Final_SUM_Semester_Cell('الدرجة النهائية\n((محصلة الفصلين))')
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
                    buildDgree(mainCurr.curriculumName ?? '',
                        isLeft: true,
                        isRight: true,
                        isBold: true,
                        passingMark: passing,
                        passingRatio: 1),
                    buildDgree(
                        passingMark: passing,
                        passingRatio: 1,
                        mainCurr.insideCurr!.first.maxMark?.toString() ?? '',
                        isLeft: true,
                        isBold: true),
                    buildSplitDgree(
                      data: [
                        {
                          "text": safeMarkText(marks, 0),
                          "mark": safeMarkText(marks, 0),
                          "width": 39,
                          "passingMark": passing,
                          "passingRatio": 0.6,
                        },
                        {
                          "text": safeMarkText(marks, 1),
                          "mark": safeMarkText(marks, 1),
                          "width": 60,
                          "passingMark": passing,
                          "passingRatio": 0.4,
                        },
                        {
                          "text": (safeMarkNumber(marks, 0) +
                                  safeMarkNumber(marks, 1))
                              .toString(),
                          "mark": (safeMarkNumber(marks, 0) +
                                  safeMarkNumber(marks, 1))
                              .toString(),
                          "width": 100,
                          "passingMark": passing,
                          "passingRatio": 1,
                        },
                        {
                          "text": numberToArabicWords(
                              (safeMarkNumber(marks, 0) +
                                      safeMarkNumber(marks, 1))
                                  .toString()),
                          "mark": (safeMarkNumber(marks, 0) +
                                  safeMarkNumber(marks, 1))
                              .toString(),
                          "width": 101,
                          "passingMark": passing,
                          "passingRatio": 1,
                        },
                      ],
                    ),
                    buildSplitDgree(
                      isRight: true,
                      data: [
                        {
                          "text": safeMarkText(marks, 2),
                          "mark": safeMarkText(marks, 2),
                          "width": 38,
                          "passingMark": passing,
                          "passingRatio": 0.6,
                        },
                        {
                          "text": safeMarkText(marks, 3),
                          "mark": safeMarkText(marks, 3),
                          "width": 59,
                          "passingMark": passing,
                          "passingRatio": 0.4,
                        },
                        {
                          "text": marks.length > 2
                              ? (safeMarkNumber(marks, 2) +
                                      safeMarkNumber(marks, 3))
                                  .toString()
                              : "",
                          "mark": marks.length > 2
                              ? (safeMarkNumber(marks, 2) +
                                      safeMarkNumber(marks, 3))
                                  .toString()
                              : "",
                          "width": 100,
                          "passingMark": passing,
                          "passingRatio": 1,
                        },
                        {
                          "text": marks.length > 2
                              ? numberToArabicWords((safeMarkNumber(marks, 2) +
                                      safeMarkNumber(marks, 3))
                                  .toString())
                              : "",
                          "mark": marks.length > 2
                              ? (safeMarkNumber(marks, 2) +
                                      safeMarkNumber(marks, 3))
                                  .toString()
                              : "",
                          "width": 101,
                          "passingMark": passing,
                          "passingRatio": 1,
                        },
                      ],
                    ),
                    buildDgree('',
                        isLeft: true,
                        isRight: true,
                        passingMark: passing,
                        passingRatio: 1),
                    buildDgree(
                        marks.length > 2
                            ? (safeMarkNumber(marks, 0) +
                                    safeMarkNumber(marks, 1) +
                                    safeMarkNumber(marks, 2) +
                                    safeMarkNumber(marks, 3))
                                .toString()
                            : " ",
                        marks: marks.length > 2
                            ? (safeMarkNumber(marks, 0) +
                                safeMarkNumber(marks, 1) +
                                safeMarkNumber(marks, 2) +
                                safeMarkNumber(marks, 3))
                            : 0,
                        isLeft: true,
                        passingMark: passing * 2,
                        passingRatio: 1),
                    buildSplitDgree(
                      data: [
                        {
                          "text": marks.length > 2
                              ? ((safeMarkNumber(marks, 0) +
                                          safeMarkNumber(marks, 1) +
                                          safeMarkNumber(marks, 2) +
                                          safeMarkNumber(marks, 3)) /
                                      2)
                                  .ceil()
                                  .toString()
                              : "",
                          "mark": marks.length > 2
                              ? ((safeMarkNumber(marks, 0) +
                                          safeMarkNumber(marks, 1) +
                                          safeMarkNumber(marks, 2) +
                                          safeMarkNumber(marks, 3)) /
                                      2)
                                  .ceil()
                                  .toString()
                              : "",
                          "width": 99,
                          "passingMark": passing,
                          "passingRatio": 1,
                        },
                        {
                          "text": marks.length > 2
                              ? numberToArabicWords(((safeMarkNumber(marks, 0) +
                                          safeMarkNumber(marks, 1) +
                                          safeMarkNumber(marks, 2) +
                                          safeMarkNumber(marks, 3)) /
                                      2)
                                  .toString())
                              : "",
                          "mark": marks.length > 2
                              ? ((safeMarkNumber(marks, 0) +
                                          safeMarkNumber(marks, 1) +
                                          safeMarkNumber(marks, 2) +
                                          safeMarkNumber(marks, 3)) /
                                      2)
                                  .toString()
                              : "",
                          "width": 99,
                          "passingMark": passing,
                          "passingRatio": 1,
                        },
                      ],
                    ),
                  ],
                );
              } else {
                // مادة مقسمة مثل اللغة العربية
                return TableRow(
                  children: [
                    buildTowDgree(mainCurr.curriculumName ?? '',
                        isLeft: true, isRight: true, isBold: true),
                    Column(
                      children: mainCurr.insideCurr!
                          .map((subCurr) => buildTowDgreeMarks(data: [
                                {
                                  "text": mainCurr.insideCurr!.first.maxMark
                                          .toString() ??
                                      '',
                                  "width": 38
                                }
                              ], isLeft: true, isBold: true))
                          .toList(),
                    ),
                    Column(
                      children: mainCurr.insideCurr!.map((subCurr) {
                        final marks = subCurr.marks ?? [];
                        final passingmark = subCurr.passingMark ?? 0;

                        return buildTowDgreeMarks(
                          data: [
                            {
                              "text": safeMarkText(marks, 0),
                              "mark": safeMarkText(marks, 0),
                              "width": 39,
                              "passingMark": passingmark,
                              "passingRatio": 0.6,
                            },
                            {
                              "text": safeMarkText(marks, 1),
                              "mark": safeMarkText(marks, 1),
                              "width": 60,
                              "passingMark": passingmark,
                              "passingRatio": 0.4,
                            },
                            {
                              "text": (safeMarkNumber(marks, 0) +
                                      safeMarkNumber(marks, 1))
                                  .toString(),
                              "mark": (safeMarkNumber(marks, 0) +
                                      safeMarkNumber(marks, 1))
                                  .toString(),
                              "passingMark": passingmark,
                              "passingRatio": 1,
                              "width": 100
                            },
                            {
                              "text": numberToArabicWords(
                                  "${(safeMarkNumber(marks, 0) + safeMarkNumber(marks, 1)).toString()}"),
                              "passingMark": passingmark,
                              "passingRatio": 1,
                              "mark": (safeMarkNumber(marks, 0) +
                                      safeMarkNumber(marks, 1))
                                  .toString(),
                              "width": 101
                            },
                          ],
                        );
                      }).toList(),
                    ),
                    Column(
                      children: mainCurr.insideCurr!.map((subCurr) {
                        final marks = subCurr.marks ?? [];
                        final passingmark = subCurr.passingMark ?? 0;
                        return buildTowDgreeMarks(
                          isRight: true,
                          data: [
                            {
                              "text": safeMarkText(marks, 2),
                              "mark": safeMarkText(marks, 2),
                              "width": 38,
                              "passingMark": passingmark,
                              "passingRatio": 0.6,
                            },
                            {
                              "text": safeMarkText(marks, 3),
                              "mark": safeMarkText(marks, 3),
                              "width": 59,
                              "passingMark": passingmark,
                              "passingRatio": 0.4,
                            },
                            {
                              "text": marks.length > 2
                                  ? (safeMarkNumber(marks, 2) +
                                          safeMarkNumber(marks, 3))
                                      .toString()
                                  : "",
                              "mark": marks.length > 2
                                  ? (safeMarkNumber(marks, 2) +
                                          safeMarkNumber(marks, 3))
                                      .toString()
                                  : "",
                              "width": 100,
                              "passingMark": passingmark,
                              "passingRatio": 1,
                            },
                            {
                              "text": marks.length > 2
                                  ? numberToArabicWords(
                                      (safeMarkNumber(marks, 2) +
                                              safeMarkNumber(marks, 3))
                                          .toString())
                                  : "",
                              "mark": marks.length > 2
                                  ? (safeMarkNumber(marks, 2) +
                                          safeMarkNumber(marks, 3))
                                      .toString()
                                  : "",
                              "passingMark": passingmark,
                              "passingRatio": 1,
                              "width": 101
                            },
                          ],
                        );
                      }).toList(),
                    ),
                    Column(
                      children: mainCurr.insideCurr!
                          .map((_) => buildTowDgreeMarks(
                              data: [], isRight: true, isLeft: true))
                          .toList(),
                    ),
                    Column(
                      children: mainCurr.insideCurr!.map((subCurr) {
                        final marks = subCurr.marks ?? [];
                        final passing = subCurr.passingMark ?? 0;
                        int sum = 0;

                        final val1 = marks[0]; // مثلاً oral
                        final val2 = marks[1]; // مثلاً total
                        final val3 = safeMarkNumber(marks, 2); // مثلاً total
                        final val4 = safeMarkNumber(marks, 3); // مثلاً total
                        sum = val1 + val2 + val3 + val4;

                        return buildTowDgreeMarks(
                          data: [
                            {
                              "text": marks.length > 2 ? sum.toString() : "",
                              "mark": marks.length > 2 ? sum.toString() : "",
                              "passingMark": passing * 2,
                              "passingRatio": 1,
                              "width": 58
                            },
                          ],
                          isLeft: true,
                        );
                      }).toList(),
                    ),
                    Column(
                      children: mainCurr.insideCurr!.map((subCurr) {
                        final marks = subCurr.marks ?? [];
                        final passing = subCurr.passingMark ?? [];
                        int sum = 0;

                        final val1 = marks[0]; // مثلاً oral
                        final val2 = marks[1]; // مثلاً total
                        final val3 = safeMarkNumber(marks, 2); // مثلاً total
                        final val4 = safeMarkNumber(marks, 3); // مثلاً total
                        sum = val1 + val2 + val3 + val4;

                        return buildTowDgreeMarksEnd(
                          isLeft: true,
                          data: [
                            {
                              "text":
                                  "${marks.length > 2 ? double.parse((sum / 2).toString()).ceil() : ""}",
                              "mark":
                                  "${marks.length > 2 ? double.parse((sum / 2).toString()).ceil() : ""}",
                              "passingMark": passing,
                              "passingRatio": 1,
                              "width": 99
                            },
                            {
                              "text":
                                  "${marks.length > 2 ? numberToArabicWords("${sum / 2}") : ""}",
                              "mark":
                                  "${marks.length > 2 ? double.parse((sum / 2).toString()).ceil() : ""}",
                              "passingMark": passing,
                              "passingRatio": 1,
                              "width": 99
                            },
                          ],
                        );
                      }).toList(),
                    ),
                  ],
                );
              }
            }).toList(),

          // The Sum Table Row
          TableRow(
            children: [
              buildDgree(
                'المجموع العام',
                isLeft: true,
                isRight: true,
                isBold: true,
                passingMark: 100,
                passingRatio: 1,
              ),

              buildDgree(
                passingMark: calculateTotalPassingMarks(
                    controller.rebortCard!.rebort!.mainCurriculum),
                passingRatio: 1,
                '${calculateTotalCMarks(controller.rebortCard!.rebort!.mainCurriculum)}',
                isLeft: true,
                isBold: true,
              ),

              // المجموعة الأولى
              buildSplitDgree(
                data: [
                  {
                    "text": "",
                    "width": 99,
                  },
                  {
                    "text":
                        "${(safeMarkNumberAtIndex(0) + safeMarkNumberAtIndex(1)).ceil()}",
                    "mark":
                        "${(safeMarkNumberAtIndex(0) + safeMarkNumberAtIndex(1)).ceil()}",
                    "width": 100,
                    "passingMark": getTotalPassingMarks(),
                    "passingRatio": 1,
                  },
                  {
                    "text": numberToArabicWords(
                      "${(safeMarkNumberAtIndex(0) + safeMarkNumberAtIndex(1)).ceil()}",
                    ),
                    "mark":
                        "${(safeMarkNumberAtIndex(0) + safeMarkNumberAtIndex(1)).ceil()}",
                    "width": 100,
                    "passingMark": getTotalPassingMarks(),
                    "passingRatio": 1,
                  }
                ],
              ),

              // المجموعة الثانية
              buildSplitDgree(
                isRight: true,
                data: [
                  {
                    "text": "",
                    "width": 97,
                  },
                  {
                    "text": controller.rebortCard!.rebort!.solok!.length >= 2
                        ? "${(safeMarkNumberAtIndex(2) + safeMarkNumberAtIndex(3)).ceil()}"
                        : "",
                    "mark": controller.rebortCard!.rebort!.solok!.length >= 2
                        ? "${(safeMarkNumberAtIndex(2) + safeMarkNumberAtIndex(3)).ceil()}"
                        : "",
                    "width": 100,
                    "passingMark": getTotalPassingMarks(),
                    "passingRatio": 1,
                  },
                  {
                    "text": controller.rebortCard!.rebort!.solok!.length >= 2
                        ? numberToArabicWords(
                            "${(safeMarkNumberAtIndex(2) + safeMarkNumberAtIndex(3)).ceil()}",
                          )
                        : "",
                    "mark": controller.rebortCard!.rebort!.solok!.length >= 2
                        ? "${(safeMarkNumberAtIndex(2) + safeMarkNumberAtIndex(3)).ceil()}"
                        : "",
                    "width": 100,
                    "passingMark": getTotalPassingMarks(),
                    "passingRatio": 1,
                  }
                ],
              ),

              buildDgree('', isRight: true, isLeft: true),

              buildDgree(
                  isLeft: true,
                  controller.rebortCard!.rebort!.solok!.length >= 2
                      ? '${(safeMarkNumberAtIndex(0) + safeMarkNumberAtIndex(1) + safeMarkNumberAtIndex(2) + safeMarkNumberAtIndex(3)).ceil()}'
                      : " ",
                  marks: controller.rebortCard!.rebort!.solok!.length >= 2
                      ? ((safeMarkNumberAtIndex(0) +
                              safeMarkNumberAtIndex(1) +
                              safeMarkNumberAtIndex(2) +
                              safeMarkNumberAtIndex(3))
                          .ceil())
                      : 0,
                  passingMark: getTotalPassingMarks() * 2,
                  passingRatio: 1),

              buildSplitDgree(
                data: [
                  {
                    "text": controller.rebortCard!.rebort!.solok!.length >= 2
                        ? '${marksall(controller.rebortCard!.rebort!.mainCurriculum)}'
                        : "",
                    "mark": controller.rebortCard!.rebort!.solok!.length >= 2
                        ? '${marksall(controller.rebortCard!.rebort!.mainCurriculum)}'
                        : "",
                    "width": 99,
                    "passingMark": getTotalPassingMarks(),
                    "passingRatio": 1,
                  },
                  {
                    "text": controller.rebortCard!.rebort!.solok!.length >= 2
                        ? numberToArabicWords(
                            '${marksall(controller.rebortCard!.rebort!.mainCurriculum)}',
                          )
                        : "",
                    "width": 99,
                    "mark": controller.rebortCard!.rebort!.solok!.length >= 2
                        ? '${marksall(controller.rebortCard!.rebort!.mainCurriculum)}'
                        : "",
                    "passingMark": getTotalPassingMarks(),
                    "passingRatio": 1,
                  },
                ],
              ),
            ],
          ),
          if (controller.rebortCard?.rebort?.downCurriculum != null)
            ...controller.rebortCard!.rebort!.downCurriculum!.map((mainCurr) {
              final marks = mainCurr.insideCurr!.first.marks ?? [];
              final passing = mainCurr.insideCurr!.first.passingMark ?? 0;

              final int mark0 = safeMarkNumber(marks, 0);
              final int mark1 = safeMarkNumber(marks, 1);
              final int sum = mark0 + mark1;
              final double avg = sum / 2;

              return TableRow(
                children: [
                  buildDgree('${mainCurr.curriculumName}',
                      isLeft: true, isRight: true, isBold: true),
                  buildDgree('${mainCurr.insideCurr!.first.maxMark ?? ''}',
                      isLeft: true, isBold: true),
                  buildSplitDgree(
                    data: [
                      {
                        "text": "",
                        "width": 99,
                      },
                      {
                        "text": safeMarkText(marks, 0),
                        "mark": safeMarkText(marks, 0),
                        "width": 100,
                        "passingMark": passing,
                        "passingRatio": 1,
                      },
                      {
                        "text": numberToArabicWords('$mark0'),
                        "mark": safeMarkText(marks, 0),
                        "passingMark": passing,
                        "passingRatio": 1,
                        "width": 100,
                      }
                    ],
                  ),
                  buildSplitDgree(
                    isRight: true,
                    data: [
                      {
                        "text": "",
                        "width": 97,
                      },
                      {
                        "text":
                            controller.rebortCard!.rebort!.solok!.length >= 2
                                ? "$mark1"
                                : "",
                        "mark":
                            controller.rebortCard!.rebort!.solok!.length >= 2
                                ? "$mark1"
                                : "",
                        "width": 100,
                        "passingMark": passing,
                        "passingRatio": 1,
                      },
                      {
                        "text":
                            controller.rebortCard!.rebort!.solok!.length >= 2
                                ? numberToArabicWords('$mark1')
                                : "",
                        "width": 100,
                        "mark":
                            controller.rebortCard!.rebort!.solok!.length >= 2
                                ? "$mark1"
                                : "",
                        "passingMark": passing,
                        "passingRatio": 1,
                      }
                    ],
                  ),
                  buildDgree(
                    isRight: true,
                    isLeft: true,
                    '',
                  ),
                  buildDgree(
                      isLeft: true,
                      controller.rebortCard!.rebort!.solok!.length >= 2
                          ? '$sum'
                          : " ",
                      marks: controller.rebortCard!.rebort!.solok!.length >= 2
                          ? sum
                          : 0,
                      passingMark: passing * 2,
                      passingRatio: 1),
                  buildSplitDgree(
                    data: [
                      {
                        "text":
                            controller.rebortCard!.rebort!.solok!.length >= 2
                                ? '${avg.ceil()}'
                                : "",
                        "mark":
                            controller.rebortCard!.rebort!.solok!.length >= 2
                                ? '${avg.ceil()}'
                                : "",
                        "passingMark": passing,
                        "passingRatio": 1,
                        "width": 99,
                      },
                      {
                        "text":
                            controller.rebortCard!.rebort!.solok!.length >= 2
                                ? numberToArabicWords('${avg.ceil()}')
                                : "",
                        "width": 99,
                        "mark":
                            controller.rebortCard!.rebort!.solok!.length >= 2
                                ? '${avg.ceil()}'
                                : "",
                        "passingMark": passing,
                        "passingRatio": 1,
                      },
                    ],
                  ),
                ],
              );
            }).toList(),

          //The solok Table Row
          TableRow(
            children: [
              buildDgree('السلوك', isLeft: true, isRight: true, isBold: true),
              buildDgree(
                isBold: true,
                '100',
                isLeft: true,
              ),
              buildSplitDgree(
                data: [
                  {
                    "text": "",
                    "width": 99,
                  },
                  {
                    "text": controller.rebortCard!.rebort!.solok![0],
                    "width": 100,
                    "mark": controller.rebortCard!.rebort!.solok![0],
                    "passingMark": 100,
                    "passingRatio": 1,
                  },
                  {
                    "text":
                        "${numberToArabicWords("${controller.rebortCard!.rebort!.solok![0]}")}",
                    "width": 100,
                    "mark": controller.rebortCard!.rebort!.solok![0],
                    "passingMark": 100,
                    "passingRatio": 1,
                  }
                ],
              ),
              buildSplitDgree(
                isRight: true,
                data: [
                  {
                    "text": "",
                    "width": 97,
                  },
                  {
                    "text": controller.rebortCard!.rebort!.solok!.length >= 2
                        ? controller.rebortCard!.rebort!.solok![1]
                        : "",
                    "mark": controller.rebortCard!.rebort!.solok!.length >= 2
                        ? controller.rebortCard!.rebort!.solok![1]
                        : "",
                    "passingMark": 100,
                    "passingRatio": 1,
                    "width": 100,
                  },
                  {
                    "text": controller.rebortCard!.rebort!.solok!.length >= 2
                        ? "${numberToArabicWords("${controller.rebortCard!.rebort!.solok![1]}")}"
                        : "",
                    "mark": controller.rebortCard!.rebort!.solok!.length >= 2
                        ? "${controller.rebortCard!.rebort!.solok![1]}"
                        : "",
                    "passingMark": 100,
                    "passingRatio": 1,
                    "width": 100,
                  }
                ],
              ),
              buildDgree(
                isRight: true,
                isLeft: true,
                '',
              ),
              buildDgree(
                  isLeft: true,
                  controller.rebortCard!.rebort!.solok!.length >= 2
                      ? "${controller.rebortCard!.rebort!.solok![0] + controller.rebortCard!.rebort!.solok![1]}"
                      : " ",
                  passingRatio: 1,
                  passingMark: 200,
                  marks: controller.rebortCard!.rebort!.solok!.length >= 2
                      ? controller.rebortCard!.rebort!.solok![0] +
                          controller.rebortCard!.rebort!.solok![1]
                      : 0),
              buildSplitDgree(
                data: [
                  {
                    "text": controller.rebortCard!.rebort!.solok!.length >= 2
                        ? ((controller.rebortCard!.rebort!.solok![0].ceil() +
                                    controller.rebortCard!.rebort!.solok![1]
                                        .ceil()) /
                                2)
                            .ceil()
                        : "",
                    "mark": controller.rebortCard!.rebort!.solok!.length >= 2
                        ? ((controller.rebortCard!.rebort!.solok![0].ceil() +
                                    controller.rebortCard!.rebort!.solok![1]
                                        .ceil()) /
                                2)
                            .ceil()
                        : "",
                    "width": 99,
                    "passingMark": 100,
                    "passingRatio": 1,
                  },
                  {
                    "text": controller.rebortCard!.rebort!.solok!.length >= 2
                        ? "${numberToArabicWords("${((controller.rebortCard!.rebort!.solok![0].ceil() + controller.rebortCard!.rebort!.solok![1].ceil()) / 2).ceil()}")}"
                        : "",
                    "mark": controller.rebortCard!.rebort!.solok!.length >= 2
                        ? ((controller.rebortCard!.rebort!.solok![0].ceil() +
                                    controller.rebortCard!.rebort!.solok![1]
                                        .ceil()) /
                                2)
                            .ceil()
                        : "",
                    "width": 99,
                    "passingMark": 100,
                    "passingRatio": 1,
                  },
                ],
              ),
            ],
          ),
          // The Second Sum Table Row
          TableRow(
            children: [
              buildDgree('المجموع النهائي',
                  isLeft: true, isRight: true, isBold: true),
              buildDgree(
                '${calculateTotalCMarks(controller.rebortCard!.rebort!.downCurriculum) + 100 + calculateTotalCMarks(controller.rebortCard!.rebort!.mainCurriculum)}',
                isLeft: true,
                isBold: true,
              ),
              buildSplitDgree(
                data: [
                  {
                    "text": "",
                    "width": 99,
                  },
                  {
                    "text":
                        '${sumMarksAtIndex(controller.rebortCard!.rebort!.downCurriculum, 0) + controller.rebortCard!.rebort!.solok![0] + sumMarksAtIndex(controller.rebortCard!.rebort!.mainCurriculum, 0) + sumMarksAtIndex(controller.rebortCard!.rebort!.mainCurriculum, 1)}',
                    "mark":
                        '${sumMarksAtIndex(controller.rebortCard!.rebort!.downCurriculum, 0) + controller.rebortCard!.rebort!.solok![0] + sumMarksAtIndex(controller.rebortCard!.rebort!.mainCurriculum, 0) + sumMarksAtIndex(controller.rebortCard!.rebort!.mainCurriculum, 1)}',
                    "width": 100,
                    "passingMark": calculateTotalPassingMarks(
                            controller.rebortCard!.rebort!.downCurriculum) +
                        100 +
                        calculateTotalPassingMarks(
                            controller.rebortCard!.rebort!.mainCurriculum),
                    "passingRatio": 1,
                  },
                  {
                    "text": numberToArabicWords(
                        '${sumMarksAtIndex(controller.rebortCard!.rebort!.downCurriculum, 0) + controller.rebortCard!.rebort!.solok![0] + sumMarksAtIndex(controller.rebortCard!.rebort!.mainCurriculum, 0) + sumMarksAtIndex(controller.rebortCard!.rebort!.mainCurriculum, 1)}'),
                    "width": 100,
                    "mark":
                        '${sumMarksAtIndex(controller.rebortCard!.rebort!.downCurriculum, 0) + controller.rebortCard!.rebort!.solok![0] + sumMarksAtIndex(controller.rebortCard!.rebort!.mainCurriculum, 0) + sumMarksAtIndex(controller.rebortCard!.rebort!.mainCurriculum, 1)}',
                    "passingMark": calculateTotalPassingMarks(
                            controller.rebortCard!.rebort!.downCurriculum) +
                        100 +
                        calculateTotalPassingMarks(
                            controller.rebortCard!.rebort!.mainCurriculum),
                    "passingRatio": 1,
                  }
                ],
              ),
              buildSplitDgree(
                isRight: true,
                data: [
                  {
                    "text": "",
                    "width": 97,
                  },
                  {
                    "text": controller.rebortCard!.rebort!.solok!.length >= 2
                        ? '${sumMarksAtIndex(controller.rebortCard!.rebort!.downCurriculum, 1) + controller.rebortCard!.rebort!.solok![1] + sumMarksAtIndex(controller.rebortCard!.rebort!.mainCurriculum, 2) + sumMarksAtIndex(controller.rebortCard!.rebort!.mainCurriculum, 3)}'
                        : '',
                    "mark": controller.rebortCard!.rebort!.solok!.length >= 2
                        ? '${sumMarksAtIndex(controller.rebortCard!.rebort!.downCurriculum, 1) + controller.rebortCard!.rebort!.solok![1] + sumMarksAtIndex(controller.rebortCard!.rebort!.mainCurriculum, 2) + sumMarksAtIndex(controller.rebortCard!.rebort!.mainCurriculum, 3)}'
                        : '',
                    "width": 100,
                    "passingMark": calculateTotalPassingMarks(
                            controller.rebortCard!.rebort!.downCurriculum) +
                        100 +
                        calculateTotalPassingMarks(
                            controller.rebortCard!.rebort!.mainCurriculum),
                    "passingRatio": 1,
                  },
                  {
                    "text": controller.rebortCard!.rebort!.solok!.length >= 2
                        ? numberToArabicWords(
                            '${sumMarksAtIndex(controller.rebortCard!.rebort!.downCurriculum, 1) + controller.rebortCard!.rebort!.solok![1] + sumMarksAtIndex(controller.rebortCard!.rebort!.mainCurriculum, 2) + sumMarksAtIndex(controller.rebortCard!.rebort!.mainCurriculum, 3)}')
                        : '',
                    "width": 100,
                    "mark": controller.rebortCard!.rebort!.solok!.length >= 2
                        ? '${sumMarksAtIndex(controller.rebortCard!.rebort!.downCurriculum, 1) + controller.rebortCard!.rebort!.solok![1] + sumMarksAtIndex(controller.rebortCard!.rebort!.mainCurriculum, 2) + sumMarksAtIndex(controller.rebortCard!.rebort!.mainCurriculum, 3)}'
                        : '',
                    "passingMark": calculateTotalPassingMarks(
                            controller.rebortCard!.rebort!.downCurriculum) +
                        100 +
                        calculateTotalPassingMarks(
                            controller.rebortCard!.rebort!.mainCurriculum),
                    "passingRatio": 1,
                  }
                ],
              ),
              buildDgree('', isRight: true, isLeft: true),
              buildDgree(
                  isLeft: true,
                  controller.rebortCard!.rebort!.solok!.length >= 2
                      ? '${(sumMarksAtIndex(controller.rebortCard!.rebort!.downCurriculum, 0) + controller.rebortCard!.rebort!.solok![0] + sumMarksAtIndex(controller.rebortCard!.rebort!.mainCurriculum, 0) + sumMarksAtIndex(controller.rebortCard!.rebort!.mainCurriculum, 1) + sumMarksAtIndex(controller.rebortCard!.rebort!.downCurriculum, 1) + controller.rebortCard!.rebort!.solok![1] + sumMarksAtIndex(controller.rebortCard!.rebort!.mainCurriculum, 2) + sumMarksAtIndex(controller.rebortCard!.rebort!.mainCurriculum, 3)).ceil()}'
                      : ' ',
                  marks: controller.rebortCard!.rebort!.solok!.length >= 2
                      ? (sumMarksAtIndex(
                                  controller.rebortCard!.rebort!.downCurriculum,
                                  0) +
                              controller.rebortCard!.rebort!.solok![0] +
                              sumMarksAtIndex(
                                  controller.rebortCard!.rebort!.mainCurriculum,
                                  0) +
                              sumMarksAtIndex(
                                  controller.rebortCard!.rebort!.mainCurriculum,
                                  1) +
                              sumMarksAtIndex(
                                  controller.rebortCard!.rebort!.downCurriculum,
                                  1) +
                              controller.rebortCard!.rebort!.solok![1] +
                              sumMarksAtIndex(
                                  controller.rebortCard!.rebort!.mainCurriculum,
                                  2) +
                              sumMarksAtIndex(
                                  controller.rebortCard!.rebort!.mainCurriculum,
                                  3))
                          .ceil()
                      : 0,
                  passingMark: (calculateTotalPassingMarks(
                              controller.rebortCard!.rebort!.downCurriculum) +
                          100 +
                          calculateTotalPassingMarks(
                              controller.rebortCard!.rebort!.mainCurriculum)) *
                      2,
                  passingRatio: 1),
              buildSplitDgree(
                data: [
                  {
                    "text": controller.rebortCard!.rebort!.solok!.length >= 2
                        ? '${(marksall(controller.rebortCard!.rebort!.mainCurriculum) + marksall(controller.rebortCard!.rebort!.downCurriculum) + (controller.rebortCard!.rebort!.solok![0].ceil() + controller.rebortCard!.rebort!.solok![1].ceil()) / 2).ceil()}'
                        : '',
                    "width": 99,
                    "mark": controller.rebortCard!.rebort!.solok!.length >= 2
                        ? '${(marksall(controller.rebortCard!.rebort!.mainCurriculum) + marksall(controller.rebortCard!.rebort!.downCurriculum) + (controller.rebortCard!.rebort!.solok![0].ceil() + controller.rebortCard!.rebort!.solok![1].ceil()) / 2).ceil()}'
                        : '',
                    "passingMark": calculateTotalPassingMarks(
                            controller.rebortCard!.rebort!.downCurriculum) +
                        100 +
                        calculateTotalPassingMarks(
                            controller.rebortCard!.rebort!.mainCurriculum),
                    "passingRatio": 1,
                  },
                  {
                    "text": controller.rebortCard!.rebort!.solok!.length >= 2
                        ? numberToArabicWords(
                            '${(marksall(controller.rebortCard!.rebort!.mainCurriculum) + marksall(controller.rebortCard!.rebort!.downCurriculum) + (controller.rebortCard!.rebort!.solok![0].ceil() + controller.rebortCard!.rebort!.solok![1].ceil()) / 2).ceil()}')
                        : '',
                    "width": 99,
                    "mark": controller.rebortCard!.rebort!.solok!.length >= 2
                        ? '${(marksall(controller.rebortCard!.rebort!.mainCurriculum) + marksall(controller.rebortCard!.rebort!.downCurriculum) + (controller.rebortCard!.rebort!.solok![0].ceil() + controller.rebortCard!.rebort!.solok![1].ceil()) / 2).ceil()}'
                        : '',
                    "passingMark": calculateTotalPassingMarks(
                            controller.rebortCard!.rebort!.downCurriculum) +
                        100 +
                        calculateTotalPassingMarks(
                            controller.rebortCard!.rebort!.mainCurriculum),
                    "passingRatio": 1,
                  },
                ],
              ),
            ],
          ),
        ],
      );
    });
  }
}
