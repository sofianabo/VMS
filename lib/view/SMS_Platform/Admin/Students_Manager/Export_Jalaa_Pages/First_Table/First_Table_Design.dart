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

                return TableRow(
                  children: [
                    buildDgree(mainCurr.curriculumName ?? '',
                        isLeft: true, isRight: true, isBold: true),
                    buildDgree(
                        mainCurr.insideCurr!.first.cMark?.toString() ?? '',
                        isLeft: true,
                        isBold: true),
                    buildSplitDgree(
                      data: [
                        {"text": safeMarkText(marks, 0), "width": 39},
                        {"text": safeMarkText(marks, 1), "width": 60},
                        {
                          "text": (safeMarkNumber(marks, 0) +
                                  safeMarkNumber(marks, 1))
                              .toString(),
                          "width": 100
                        },
                        {
                          "text": numberToArabicWords(
                              (safeMarkNumber(marks, 0) +
                                      safeMarkNumber(marks, 1))
                                  .toString()),
                          "width": 101
                        },
                      ],
                    ),
                    buildSplitDgree(
                      isRight: true,
                      data: [
                        {"text": safeMarkText(marks, 2), "width": 38},
                        {"text": safeMarkText(marks, 3), "width": 59},
                        {
                          "text": marks.length > 2
                              ? (safeMarkNumber(marks, 2) +
                                      safeMarkNumber(marks, 3))
                                  .toString()
                              : "",
                          "width": 100
                        },
                        {
                          "text": marks.length > 2
                              ? numberToArabicWords((safeMarkNumber(marks, 2) +
                                      safeMarkNumber(marks, 3))
                                  .toString())
                              : "",
                          "width": 101
                        },
                      ],
                    ),
                    buildDgree('', isLeft: true, isRight: true),
                    buildDgree(
                        marks.length > 2
                            ? (safeMarkNumber(marks, 0) +
                                    safeMarkNumber(marks, 1) +
                                    safeMarkNumber(marks, 2) +
                                    safeMarkNumber(marks, 3))
                                .toString()
                            : " ",
                        isLeft: true),
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
                          "width": 99
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
                          "width": 99
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
                                  "text": mainCurr.insideCurr!.first.cMark
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
                        return buildTowDgreeMarks(
                          data: [
                            {"text": safeMarkText(marks, 0), "width": 39},
                            {"text": safeMarkText(marks, 1), "width": 60},
                            {
                              "text": (safeMarkNumber(marks, 0) +
                                      safeMarkNumber(marks, 1))
                                  .toString(),
                              "width": 100
                            },
                            {
                              "text": numberToArabicWords(
                                  "${(safeMarkNumber(marks, 0) + safeMarkNumber(marks, 1)).toString()}"),
                              "width": 101
                            },
                          ],
                        );
                      }).toList(),
                    ),
                    Column(
                      children: mainCurr.insideCurr!.map((subCurr) {
                        final marks = subCurr.marks ?? [];
                        return buildTowDgreeMarks(
                          isRight: true,
                          data: [
                            {"text": safeMarkText(marks, 2), "width": 38},
                            {"text": safeMarkText(marks, 3), "width": 59},
                            {
                              "text": marks.length > 2
                                  ? (safeMarkNumber(marks, 2) +
                                          safeMarkNumber(marks, 3))
                                      .toString()
                                  : "",
                              "width": 100
                            },
                            {
                              "text": marks.length > 2
                                  ? numberToArabicWords(
                                      (safeMarkNumber(marks, 2) +
                                              safeMarkNumber(marks, 3))
                                          .toString())
                                  : "",
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
                              "width": 99
                            },
                            {
                              "text":
                                  "${marks.length > 2 ? numberToArabicWords("${sum / 2}") : ""}",
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
              buildDgree('المجموع العام',
                  isLeft: true, isRight: true, isBold: true),

              buildDgree(
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
                    "width": 100,
                  },
                  {
                    "text": numberToArabicWords(
                      "${(safeMarkNumberAtIndex(0) + safeMarkNumberAtIndex(1)).ceil()}",
                    ),
                    "width": 100,
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
                    "width": 100,
                  },
                  {
                    "text": controller.rebortCard!.rebort!.solok!.length >= 2
                        ? numberToArabicWords(
                            "${(safeMarkNumberAtIndex(2) + safeMarkNumberAtIndex(3)).ceil()}",
                          )
                        : "",
                    "width": 100,
                  }
                ],
              ),

              buildDgree('', isRight: true, isLeft: true),

              buildDgree(
                isLeft: true,
                controller.rebortCard!.rebort!.solok!.length >= 2
                    ? '${(safeMarkNumberAtIndex(0) + safeMarkNumberAtIndex(1) + safeMarkNumberAtIndex(2) + safeMarkNumberAtIndex(3)).ceil()}'
                    : " ",
              ),

              buildSplitDgree(
                data: [
                  {
                    "text": controller.rebortCard!.rebort!.solok!.length >= 2
                        ? '${marksall(controller.rebortCard!.rebort!.mainCurriculum)}'
                        : "",
                    "width": 99,
                  },
                  {
                    "text": controller.rebortCard!.rebort!.solok!.length >= 2
                        ? numberToArabicWords(
                            '${marksall(controller.rebortCard!.rebort!.mainCurriculum)}',
                          )
                        : "",
                    "width": 99,
                  },
                ],
              ),
            ],
          ),
          if (controller.rebortCard?.rebort?.downCurriculum != null)
            ...controller.rebortCard!.rebort!.downCurriculum!.map((mainCurr) {
              final marks = mainCurr.insideCurr!.first.marks ?? [];

              final int mark0 = safeMarkNumber(marks, 0);
              final int mark1 = safeMarkNumber(marks, 1);
              final int sum = mark0 + mark1;
              final double avg = sum / 2;

              return TableRow(
                children: [
                  buildDgree('${mainCurr.curriculumName}',
                      isLeft: true, isRight: true, isBold: true),
                  buildDgree('${mainCurr.insideCurr!.first.cMark ?? ''}',
                      isLeft: true, isBold: true),
                  buildSplitDgree(
                    data: [
                      {
                        "text": "",
                        "width": 99,
                      },
                      {
                        "text": safeMarkText(marks, 0),
                        "width": 100,
                      },
                      {
                        "text": numberToArabicWords('$mark0'),
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
                        "width": 100,
                      },
                      {
                        "text":
                            controller.rebortCard!.rebort!.solok!.length >= 2
                                ? numberToArabicWords('$mark1')
                                : "",
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
                        ? '$sum'
                        : " ",
                  ),
                  buildSplitDgree(
                    data: [
                      {
                        "text":
                            controller.rebortCard!.rebort!.solok!.length >= 2
                                ? '${avg.ceil()}'
                                : "",
                        "width": 99,
                      },
                      {
                        "text":
                            controller.rebortCard!.rebort!.solok!.length >= 2
                                ? numberToArabicWords('${avg.ceil()}')
                                : "",
                        "width": 99,
                      },
                    ],
                  ),
                ],
              );
            }).toList(),

          //The Sum Table Row
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
                  },
                  {
                    "text":
                        "${numberToArabicWords("${controller.rebortCard!.rebort!.solok![0]}")}",
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
                    "text": controller.rebortCard!.rebort!.solok!.length >= 2
                        ? controller.rebortCard!.rebort!.solok![1]
                        : "",
                    "width": 100,
                  },
                  {
                    "text": controller.rebortCard!.rebort!.solok!.length >= 2
                        ? "${numberToArabicWords("${controller.rebortCard!.rebort!.solok![1]}")}"
                        : "",
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
              ),
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
                    "width": 99,
                  },
                  {
                    "text": controller.rebortCard!.rebort!.solok!.length >= 2
                        ? "${numberToArabicWords("${((controller.rebortCard!.rebort!.solok![0].ceil() + controller.rebortCard!.rebort!.solok![1].ceil()) / 2).ceil()}")}"
                        : "",
                    "width": 99,
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
                    "width": 100,
                  },
                  {
                    "text": numberToArabicWords(
                        '${sumMarksAtIndex(controller.rebortCard!.rebort!.downCurriculum, 0) + controller.rebortCard!.rebort!.solok![0] + sumMarksAtIndex(controller.rebortCard!.rebort!.mainCurriculum, 0) + sumMarksAtIndex(controller.rebortCard!.rebort!.mainCurriculum, 1)}'),
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
                    "text": controller.rebortCard!.rebort!.solok!.length >= 2
                        ? '${sumMarksAtIndex(controller.rebortCard!.rebort!.downCurriculum, 1) + controller.rebortCard!.rebort!.solok![1] + sumMarksAtIndex(controller.rebortCard!.rebort!.mainCurriculum, 2) + sumMarksAtIndex(controller.rebortCard!.rebort!.mainCurriculum, 3)}'
                        : '',
                    "width": 100,
                  },
                  {
                    "text": controller.rebortCard!.rebort!.solok!.length >= 2
                        ? numberToArabicWords(
                            '${sumMarksAtIndex(controller.rebortCard!.rebort!.downCurriculum, 1) + controller.rebortCard!.rebort!.solok![1] + sumMarksAtIndex(controller.rebortCard!.rebort!.mainCurriculum, 2) + sumMarksAtIndex(controller.rebortCard!.rebort!.mainCurriculum, 3)}')
                        : '',
                    "width": 100,
                  }
                ],
              ),
              buildDgree('', isRight: true, isLeft: true),
              buildDgree(
                isLeft: true,
                controller.rebortCard!.rebort!.solok!.length >= 2
                    ? '${(sumMarksAtIndex(controller.rebortCard!.rebort!.downCurriculum, 0) + controller.rebortCard!.rebort!.solok![0] + sumMarksAtIndex(controller.rebortCard!.rebort!.mainCurriculum, 0) + sumMarksAtIndex(controller.rebortCard!.rebort!.mainCurriculum, 1) + sumMarksAtIndex(controller.rebortCard!.rebort!.downCurriculum, 1) + controller.rebortCard!.rebort!.solok![1] + sumMarksAtIndex(controller.rebortCard!.rebort!.mainCurriculum, 2) + sumMarksAtIndex(controller.rebortCard!.rebort!.mainCurriculum, 3)).ceil()}'
                    : ' ',
              ),
              buildSplitDgree(
                data: [
                  {
                    "text": controller.rebortCard!.rebort!.solok!.length >= 2
                        ? '${(marksall(controller.rebortCard!.rebort!.mainCurriculum) + marksall(controller.rebortCard!.rebort!.downCurriculum) + (controller.rebortCard!.rebort!.solok![0].ceil() + controller.rebortCard!.rebort!.solok![1].ceil()) / 2).ceil()}'
                        : '',
                    "width": 99,
                  },
                  {
                    "text": controller.rebortCard!.rebort!.solok!.length >= 2
                        ? numberToArabicWords(
                            '${(marksall(controller.rebortCard!.rebort!.mainCurriculum) + marksall(controller.rebortCard!.rebort!.downCurriculum) + (controller.rebortCard!.rebort!.solok![0].ceil() + controller.rebortCard!.rebort!.solok![1].ceil()) / 2).ceil()}')
                        : '',
                    "width": 99,
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
