import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vms_school/Link/Controller/AdminController/Students_Controllers/Jalaa_For_Students/Jalaa_Controller.dart';
import 'package:vms_school/view/SMS_Platform/Admin/Students_Manager/Export_Jalaa_Pages/Convert_Functions_For_All.dart';
import 'package:vms_school/view/SMS_Platform/Admin/Students_Manager/Export_Jalaa_Pages/First_Table/First_Table_Widgets.dart';

class All_Jalaas_Table extends StatelessWidget {
  const All_Jalaas_Table({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<Jalaa_Controller>(builder: (controller) {
      return Table(
        defaultVerticalAlignment: TableCellVerticalAlignment.middle,
        columnWidths: {
          0: FixedColumnWidth(160), // المواد الدراسية
          1: FixedColumnWidth(100), // الدرجة العظمى
          2: FixedColumnWidth(382), // الفصل الدراسي الأول
          3: FixedColumnWidth(58),// space
          4: FixedColumnWidth(100), // الدرجة العظمى
          5: FixedColumnWidth(382), // الفصل الدراسي الثاني
          6: FixedColumnWidth(58),// space
          7: FixedColumnWidth(200), // محصلة الفصلين

        },
        children: [
          // Main Table Header
          TableRow(
            children: [
              buildCell('المواد الدراسية'),
              buildCell('الدرجة العظمى',isdarage: true),
              The_First_Semester_Cell('الفصل الأول'),
              Container(
                alignment: Alignment.center,
                height: 133,
                width: 60,
                decoration: BoxDecoration(
                  border: Border(
                    left: BorderSide(color: Colors.black, width: 2),
                    right: BorderSide(color: Colors.black, width: 2),
                  ),
                ),
                child: Text(
                  textAlign: TextAlign.center,
                  " ",
                  style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      fontFamily: "tnr"),
                ),
              ),
              buildCell('الدرجة العظمى',isdarage: true),
              The_Second_Semester_Cell('الفصل الثاني'),
              Container(
                alignment: Alignment.center,
                height: 133,
                width: 60,
                decoration: BoxDecoration(
                  border: Border(
                    left: BorderSide(color: Colors.black, width: 2),
                    right: BorderSide(color: Colors.black, width: 2),
                  ),
                ),
                child: Text(
                  textAlign: TextAlign.center,
                  " ",
                  style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      fontFamily: "tnr"),
                ),
              ),
              The_Final_SUM_Semester_Cell('محصلة الفصلين')
            ],
          ),




          if (controller.rebortCard?.rebort?.mainCurriculum != null)
            ...controller.rebortCard!.rebort!.mainCurriculum!.map((mainCurr) {
              // مادة عادية
              final marks = mainCurr.insideCurr!.first.marks ?? [];
              final passingMarks = mainCurr.insideCurr!.first.passingMarks ?? [];
              if ((mainCurr.insideCurr?.length ?? 0) <= 1){
                return TableRow(
                  children: [
                    //curr
                    buildDgree(mainCurr.curriculumName ?? '',
                        isLeft: true,
                        isRight: true,
                        isBold: true,
                        passingMark: 0,
                        passingRatio: 0),
                    buildDgree(
                        passingMark: 0,
                        passingRatio: 0,
                        mainCurr.insideCurr!.first.maxMark?.toString() ?? '',
                        isLeft: true,
                        isBold: true),

                    //a3mal , 2mt7an , sum , m1n , m1w

                    buildSplitDgree(
                      data: [
                        {
                          "text": safeMarkText(marks, 0),
                          "mark": safeMarkText(marks, 0),
                          "width": 59,
                          "passingMark": GetPassingMarkAtIndex(passingMarks, 0),
                          "passingRatio": 1,
                        },
                        {
                          "text": safeMarkText(marks, 1),
                          "mark": safeMarkText(marks, 1),
                          "width": 60,
                          "passingMark": GetPassingMarkAtIndex(passingMarks, 1),
                          "passingRatio": 1,
                        },
                        {
                          "text": (safeMarkNumber(marks, 0) +
                              safeMarkNumber(marks, 1)).ceil()
                              .toString(),
                          "mark": (safeMarkNumber(marks, 0) +
                              safeMarkNumber(marks, 1)).ceil()
                              .toString(),
                          "width": 60,
                          "passingMark": GetPassingMarkAtIndex(passingMarks, 0)+ GetPassingMarkAtIndex(passingMarks, 1),
                          "passingRatio": 1,
                        },
                        {
                          "text": ((safeMarkNumber(marks, 0) +
                              safeMarkNumber(marks, 1))/2).ceil()
                              .toString(),
                          "mark": ((safeMarkNumber(marks, 0) +
                              safeMarkNumber(marks, 1))/2).ceil()
                              .toString(),
                          "width": 101,
                          "passingMark": ((GetPassingMarkAtIndex(passingMarks, 0)+ GetPassingMarkAtIndex(passingMarks, 1))/2).ceil(),
                          "passingRatio": 1,
                        },
                        {
                          "text": numberToArabicWords(((safeMarkNumber(marks, 0) +
                              safeMarkNumber(marks, 1))/2).ceil()
                              .toString()),
                          "mark": ((safeMarkNumber(marks, 0) +
                              safeMarkNumber(marks, 1))/2).ceil()
                              .toString(),
                          "width": 100,
                          "passingMark": ((GetPassingMarkAtIndex(passingMarks, 0)+ GetPassingMarkAtIndex(passingMarks, 1))/2).ceil(),
                          "passingRatio": 1,
                        },
                      ],
                    ),
                    //space
                    buildDgree('',
                        isLeft: true,
                        isRight: true,
                        passingMark: 0,
                        passingRatio: 0),

                    //daraga odma
                    buildDgree(
                        passingMark: 0,
                        passingRatio: 0,
                        mainCurr.insideCurr!.first.maxMark?.toString() ?? '',
                        isLeft: true,

                        isBold: true),

                    buildSplitDgree(
                      isRight: false,
                      data: [
                        {
                          "text": safeMarkText(marks, 2),
                          "mark": safeMarkText(marks, 2),
                          "width": 59,
                          "passingMark": GetPassingMarkAtIndex(passingMarks, 2),
                          "passingRatio": 1,
                        },
                        {
                          "text": safeMarkText(marks, 3),
                          "mark": safeMarkText(marks, 3),
                          "width": 60,
                          "passingMark": GetPassingMarkAtIndex(passingMarks, 3),
                          "passingRatio": 1,
                        },
                        {
                          "text": marks.length > 2
                              ? (safeMarkNumber(marks, 2) +
                              safeMarkNumber(marks, 3)).ceil()
                              .toString()
                              : "",
                          "mark": marks.length > 2
                              ? (safeMarkNumber(marks, 2) +
                              safeMarkNumber(marks, 3)).ceil()
                              .toString()
                              : "",
                          "width": 60,
                          "passingMark": GetPassingMarkAtIndex(passingMarks, 2)+GetPassingMarkAtIndex(passingMarks, 3),
                          "passingRatio": 1,
                        },
                        {
                          "text": marks.length > 2
                              ?((safeMarkNumber(marks, 2) +
                              safeMarkNumber(marks, 3))/2).ceil()
                              .toString() : "",
                          "mark": marks.length > 2
                              ?((safeMarkNumber(marks, 2) +
                              safeMarkNumber(marks, 3))/2).ceil()
                              .toString() : "",
                          "width": 101,
                          "passingMark": ((GetPassingMarkAtIndex(passingMarks, 2)+GetPassingMarkAtIndex(passingMarks, 3))/2).ceil(),
                          "passingRatio": 1,
                        },
                        {
                          "text": numberToArabicWords(((safeMarkNumber(marks, 2) +
                              safeMarkNumber(marks, 3))/2).ceil()
                              .toString()),
                          "mark": ((safeMarkNumber(marks, 2) +
                              safeMarkNumber(marks, 3))/2).ceil()
                              .toString(),
                          "width": 100,
                          "passingMark": ((GetPassingMarkAtIndex(passingMarks, 2)+GetPassingMarkAtIndex(passingMarks, 3))/2).ceil(),
                          "passingRatio": 1,
                        },
                      ],
                    ),

                    buildDgree('',
                        isLeft: true,
                        isRight: true,
                        passingMark: 0,
                        passingRatio: 0),

                    buildSplitDgree(
                      isLeft: true,
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
                          "passingMark": ((GetPassingMarkAtIndex(passingMarks, 0)+GetPassingMarkAtIndex(passingMarks, 1)+GetPassingMarkAtIndex(passingMarks, 2)+GetPassingMarkAtIndex(passingMarks, 3))/2).ceil(),
                          "passingRatio": 1,

                        },
                        {
                          "text": marks.length > 2
                              ? numberToArabicWords(((safeMarkNumber(marks, 0) +
                              safeMarkNumber(marks, 1) +
                              safeMarkNumber(marks, 2) +
                              safeMarkNumber(marks, 3)) /
                              2).ceil()
                              .toString())
                              : "",
                          "mark": marks.length > 2
                              ? ((safeMarkNumber(marks, 0) +
                              safeMarkNumber(marks, 1) +
                              safeMarkNumber(marks, 2) +
                              safeMarkNumber(marks, 3)) /
                              2).ceil()
                              .toString()
                              : "",
                          "width": 99,
                          "passingMark": ((GetPassingMarkAtIndex(passingMarks, 0)+GetPassingMarkAtIndex(passingMarks, 1)+GetPassingMarkAtIndex(passingMarks, 2)+GetPassingMarkAtIndex(passingMarks, 3))/2).ceil(),
                          "passingRatio": 1,

                        },
                      ],
                    ),
                  ],
                );
              }else{
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
                          "width": 98
                        }
                      ], isLeft: true, isBold: true))
                          .toList(),
                    ),




                    Column(
                      children: mainCurr.insideCurr!.map((subCurr) {
                        final marks = subCurr.marks ?? [];
                        final passingMarks = subCurr.passingMarks ?? [];

                        return buildTowDgreeMarks(
                           data: [
                        {
                          "text": safeMarkText(marks, 0),
                          "mark": safeMarkText(marks, 0),
                          "width": 59,
                          "passingMark": GetPassingMarkAtIndex(passingMarks, 0),
                          "passingRatio": 1,
                        },
                        {
                          "text": safeMarkText(marks, 1),
                          "mark": safeMarkText(marks, 1),
                          "width": 60,
                          "passingMark": GetPassingMarkAtIndex(passingMarks, 1),
                          "passingRatio": 1,
                        },
                        {
                          "text": (safeMarkNumber(marks, 0) +
                              safeMarkNumber(marks, 1)).ceil()
                              .toString(),
                          "mark": (safeMarkNumber(marks, 0) +
                              safeMarkNumber(marks, 1)).ceil()
                              .toString(),
                          "width": 60,
                          "passingMark": GetPassingMarkAtIndex(passingMarks, 0)+GetPassingMarkAtIndex(passingMarks, 1),
                          "passingRatio": 1,
                        },
                        {
                          "text": ((safeMarkNumber(marks, 0) +
                              safeMarkNumber(marks, 1))/2).ceil()
                              .toString(),
                          "mark": ((safeMarkNumber(marks, 0) +
                              safeMarkNumber(marks, 1))/2).ceil()
                              .toString(),
                          "width": 101,
                          "passingMark": (GetPassingMarkAtIndex(passingMarks, 0) + GetPassingMarkAtIndex(passingMarks, 1))/2.ceil(),
                          "passingRatio": 1,
                        },
                        {
                          "text": numberToArabicWords(((safeMarkNumber(marks, 0) +
                              safeMarkNumber(marks, 1))/2).ceil()
                              .toString()),
                          "mark": ((safeMarkNumber(marks, 0) +
                              safeMarkNumber(marks, 1))/2).ceil()
                              .toString(),
                          "width": 100,
                          "passingMark": (GetPassingMarkAtIndex(passingMarks, 0) + GetPassingMarkAtIndex(passingMarks, 1))/2.ceil(),
                          "passingRatio": 1,
                        },
                      ],
                        );
                      }).toList(),
                    ),
                    Column(
                      children: [
                        buildDgree('',
                            isLeft: true,
                            isRight: true,
                            passingMark: 0,
                            passingRatio: 0),
                        buildDgree('',
                            isLeft: true,
                            isRight: true,
                            passingMark: 0,
                            passingRatio: 0),
                      ],
                    ),
                    Column(
                      children: mainCurr.insideCurr!
                          .map((subCurr) => buildTowDgreeMarks(data: [
                        {
                          "text": mainCurr.insideCurr!.first.maxMark
                              .toString() ??
                              '',
                          "width": 98
                        }
                      ], isLeft: true
                          , isBold: true))
                          .toList(),
                    ),
                    Column(
                      children: mainCurr.insideCurr!.map((subCurr) {
                        final marks = subCurr.marks ?? [];
                        return buildTowDgreeMarks(
                          isRight: false,
                          data: [
                        {
                          "text": safeMarkText(marks, 2),
                          "mark": safeMarkText(marks, 2),
                          "width": 59,
                          "passingMark": GetPassingMarkAtIndex(passingMarks, 2),
                          "passingRatio":1,
                        },
                        {
                          "text": safeMarkText(marks, 3),
                          "mark": safeMarkText(marks, 3),
                          "width": 60,
                          "passingMark": GetPassingMarkAtIndex(passingMarks, 3),
                          "passingRatio":1,
                        },
                        {
                          "text": marks.length > 2
                              ? (safeMarkNumber(marks, 2) +
                              safeMarkNumber(marks, 3)).ceil()
                              .toString()
                              : "",
                          "mark": marks.length > 2
                              ? (safeMarkNumber(marks, 2) +
                              safeMarkNumber(marks, 3)).ceil()
                              .toString()
                              : "",
                          "width": 60,
                          "passingMark": GetPassingMarkAtIndex(passingMarks, 2)+GetPassingMarkAtIndex(passingMarks, 3),
                          "passingRatio":1,
                        },
                        {
                          "text": marks.length > 2
                              ?((safeMarkNumber(marks, 2) +
                              safeMarkNumber(marks, 3))/2).ceil()
                              .toString() : "",
                          "mark": marks.length > 2
                              ?((safeMarkNumber(marks, 2) +
                              safeMarkNumber(marks, 3))/2).ceil()
                              .toString() : "",
                          "width": 101,
                          "passingMark": ((GetPassingMarkAtIndex(passingMarks, 2)+GetPassingMarkAtIndex(passingMarks, 3))/2).ceil(),
                          "passingRatio":1,
                        },
                        {
                          "text": numberToArabicWords(((safeMarkNumber(marks, 2) +
                              safeMarkNumber(marks, 3))/2).ceil()
                              .toString()),
                          "mark": ((safeMarkNumber(marks, 2) +
                              safeMarkNumber(marks, 3))/2).ceil()
                              .toString(),
                          "width": 100,
                          "passingMark": ((GetPassingMarkAtIndex(passingMarks, 2)+GetPassingMarkAtIndex(passingMarks, 3))/2).ceil(),
                          "passingRatio":1,
                        },
                      ],
                        );
                      }).toList(),
                    ),
                 Column(
                   children: [
                     buildDgree('',
                         isLeft: true,
                         isRight: true,
                         passingMark: 0,
                         passingRatio: 0),
                     buildDgree('',
                         isLeft: true,
                         isRight: true,
                         passingMark: 0,
                         passingRatio: 0),
                   ],
                 ),


                    Column(
                      children: mainCurr.insideCurr!.map((subCurr) {
                        print(passingMarks);
                       final maxall = ((GetPassingMarkAtIndex(passingMarks,0)+
                           GetPassingMarkAtIndex(passingMarks,1)+
                           GetPassingMarkAtIndex(passingMarks,2)+
                           GetPassingMarkAtIndex(passingMarks,3)
                       )/2).ceil();
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
                          "text": marks.length > 2
                              ? (sum / 2)
                              .ceil()
                              .toString()
                              : "",
                          "mark": marks.length > 2
                              ? (sum / 2)
                              .ceil()
                              .toString()
                              : "",
                          "width": 99,
                          "passingMark": maxall,
                          "passingRatio":1,
                        },
                        {
                          "text": marks.length > 2
                              ? numberToArabicWords((sum / 2)
                              .toString())
                              : "",
                          "mark": marks.length > 2
                              ? (sum / 2)
                              .toString()
                              : "",
                          "width": 99,
                          "passingMark": maxall,
                          "passingRatio":1,
                        },
                      ],
                          isLeft: true,
                        );
                      }).toList(),
                    ),

                  ],
                );
              }}).toList(),

          TableRow(
            children: [


              buildDgree(

                'المجموع العام',
                isLeft: true,
                isRight: true,
                isBold: true,
                ismaj: true,
                passingMark: 0,
                passingRatio: 0,
              ),

              buildDgree(
                ismaj: true,
                passingMark: 0,
                passingRatio: 0,
                '${calculateTotalCMarks(controller.rebortCard!.rebort!.mainCurriculum)}',
                isLeft: true,
                isBold: true,
              ),


              //a3mal , 2mt7an , sum , m1n , m1w

                buildSplitDgree(
                  ismag: true,
                  data: [
                    {
                      "text": safeMarkNumberAtIndex(0)
                          .ceil(),

                      "mark": safeMarkNumberAtIndex(0)
                        .ceil(),
                      "width": 59,
                      "passingMark": safePassingMarkNumberAtIndex(0),
                      "passingRatio":1,
                    },
                    {
                      "text": safeMarkNumberAtIndex(1)
                          .ceil(),

                      "mark": safeMarkNumberAtIndex(1)
                          .ceil(),
                      "width": 60,
                      "passingMark": safePassingMarkNumberAtIndex(1),
                      "passingRatio":1,
                    },
                    {
                      "text": (safeMarkNumberAtIndex(0) +
                          safeMarkNumberAtIndex( 1)).ceil()
                          .toString(),
                      "mark": (safeMarkNumberAtIndex(0) +
                          safeMarkNumberAtIndex( 1)).ceil()
                          .toString(),
                      "width": 60,
                      "passingMark": safePassingMarkNumberAtIndex(0)+safePassingMarkNumberAtIndex(1),
                      "passingRatio": 1,
                    },
                    {
                      "text": ((safeMarkNumberAtIndex( 0) +
                          safeMarkNumberAtIndex( 1))/2).ceil()
                          .toString(),
                      "mark": ((safeMarkNumberAtIndex( 0) +
                          safeMarkNumberAtIndex( 1))/2).ceil()
                          .toString(),
                      "width": 101,
                      "passingMark": ((safePassingMarkNumberAtIndex(0)+safePassingMarkNumberAtIndex(1))/2).ceil(),
                      "passingRatio": 1,
                    },
                    {
                      "text": numberToArabicWords(((safeMarkNumberAtIndex( 0) +
                          safeMarkNumberAtIndex( 1))/2).ceil()
                          .toString()),
                      "mark": ((safeMarkNumberAtIndex( 0) +
                          safeMarkNumberAtIndex( 1))/2).ceil()
                          .toString(),
                      "width": 100,
                      "passingMark": ((safePassingMarkNumberAtIndex(0)+safePassingMarkNumberAtIndex(1))/2).ceil(),
                      "passingRatio": 1,
                    },
                  ],
                ),
                //space
                buildDgree('',
                    isLeft: true,
                    isRight: true,
                    passingMark: 0,
                    passingRatio: 0),

                //daraga odma
              buildDgree(
                ismaj: true,
                passingMark: 0,
                passingRatio: 0,
                '${calculateTotalCMarks(controller.rebortCard!.rebort!.mainCurriculum)}',
                isLeft: true,
                isBold: true,
              ),


              buildSplitDgree(
                ismag: true,
                  isRight: false,
                  data: [
                    {
                      "text": safeMarkNumberAtIndex( 2) == 0 ?"" :safeMarkNumberAtIndex( 2),
                      "mark": safeMarkNumberAtIndex( 2) == 0 ?"" :safeMarkNumberAtIndex( 2),
                      "width": 59,
                      "passingMark": safePassingMarkNumberAtIndex(2),
                      "passingRatio": 1,
                    },
                    {
                      "text": safeMarkNumberAtIndex( 3) == 0 ?"" :safeMarkNumberAtIndex( 3),
                      "mark": safeMarkNumberAtIndex( 3) == 0 ?"" :safeMarkNumberAtIndex( 3),
                      "width": 60,
                      "passingMark": safePassingMarkNumberAtIndex(3),
                      "passingRatio": 1,
                    },
                    {
                      "text": safeMarkNumberAtIndex( 2)==0? "":   (safeMarkNumberAtIndex( 2) +
                          safeMarkNumberAtIndex( 3)).ceil()
                          .toString()
                         ,
                      "mark":  safeMarkNumberAtIndex( 2)==0? "": (safeMarkNumberAtIndex( 2) +
                          safeMarkNumberAtIndex( 3)).ceil()
                          .toString()
                          ,
                      "width": 60,
                      "passingMark": (safePassingMarkNumberAtIndex(2)+safePassingMarkNumberAtIndex(3)).ceil(),
                      "passingRatio": 1,
                    },
                    {
                      "text": safeMarkNumberAtIndex( 2)==0? "": ((safeMarkNumberAtIndex( 2) +
                          safeMarkNumberAtIndex( 3))/2).ceil()
                          .toString(),
                      "mark":  safeMarkNumberAtIndex( 2)==0? "":((safeMarkNumberAtIndex( 2) +
                          safeMarkNumberAtIndex( 3))/2).ceil()
                          .toString(),
                      "width": 101,
                      "passingMark": ((safePassingMarkNumberAtIndex(2)+safePassingMarkNumberAtIndex(3))/2).ceil(),
                      "passingRatio": 1,
                    },
                    {
                      "text":  safeMarkNumberAtIndex( 2)==0? "":numberToArabicWords(((safeMarkNumberAtIndex( 2) +
                          safeMarkNumberAtIndex( 3))/2).ceil()
                          .toString()),
                      "mark":  safeMarkNumberAtIndex( 2)==0? "":((safeMarkNumberAtIndex( 2) +
                          safeMarkNumberAtIndex( 3))/2).ceil()
                          .toString(),
                      "width": 100,
                      "passingMark": ((safePassingMarkNumberAtIndex(2)+safePassingMarkNumberAtIndex(3))/2).ceil(),
                      "passingRatio": 1,
                    },
                  ],
                ),

                buildDgree('',
                    isLeft: true,
                    isRight: true,
                    passingMark: 0,
                    passingRatio: 0),

                buildSplitDgree(
                  ismag: true,
                  isLeft: true,
                  data: [
                    {
                      "text":   safeMarkNumberAtIndex( 2)==0? "":((safeMarkNumberAtIndex( 0) +
                          safeMarkNumberAtIndex( 1) +
                          safeMarkNumberAtIndex( 2) +
                          safeMarkNumberAtIndex( 3)) /
                          2)
                          .ceil()
                          .toString()
                         ,
                      "mark": safeMarkNumberAtIndex( 2)==0? "":((safeMarkNumberAtIndex( 0) +
                          safeMarkNumberAtIndex( 1) +
                          safeMarkNumberAtIndex( 2) +
                          safeMarkNumberAtIndex( 3)) /
                          2)
                          .ceil()
                          .toString()
                          ,
                      "width": 99,
                      "passingMark": ((
                          safePassingMarkNumberAtIndex(0)+
                              safePassingMarkNumberAtIndex(1)+
                              safePassingMarkNumberAtIndex(2)+
                              safePassingMarkNumberAtIndex(3)
                      )/2).ceil(),
                      "passingRatio": 1,
                    },
                    {
                      "text":  safeMarkNumberAtIndex( 2)==0? "": numberToArabicWords(((safeMarkNumberAtIndex(0) +
                          safeMarkNumberAtIndex( 1) +
                          safeMarkNumberAtIndex( 2) +
                          safeMarkNumberAtIndex( 3)) /
                          2).ceil()
                          .toString())
                          ,
                      "mark": safeMarkNumberAtIndex( 2)==0? "":((safeMarkNumberAtIndex( 0) +
                          safeMarkNumberAtIndex( 1) +
                          safeMarkNumberAtIndex( 2) +
                          safeMarkNumberAtIndex( 3)) /
                          2).ceil()
                          .toString()
                          ,
                      "width": 99,
                      "passingMark": ((
                          safePassingMarkNumberAtIndex(0)+
                              safePassingMarkNumberAtIndex(1)+
                              safePassingMarkNumberAtIndex(2)+
                              safePassingMarkNumberAtIndex(3)
                      )/2).ceil(),
                      "passingRatio": 1,
                    },
                  ],
                ),

            ],
          ),


          if (controller.rebortCard?.rebort?.downCurriculum != null)
            ...controller.rebortCard!.rebort!.downCurriculum!.map((mainCurr) {
              final marks = mainCurr.insideCurr!.first.marks ?? [];
              final passingMarks = mainCurr.insideCurr!.first.passingMarks ?? [];

              
          

              return TableRow(
                children: [
                  //curr
                  buildDgree(mainCurr.curriculumName ?? '',
                      isLeft: true,
                      isRight: true,
                      isBold: true,
                      passingMark: 0,
                      passingRatio: 0),
                  //daraga odma
                  buildDgree(
                      passingMark: 0,
                      passingRatio: 0,
                      mainCurr.insideCurr!.first.maxMark?.toString() ?? '',
                      isLeft: true,
                      isBold: true),

                  //a3mal , 2mt7an , sum , m1n , m1w

                  buildSplitDgree(
                    data: [
                      {
                        "text": safeMarkText(marks, 0),
                        "mark": safeMarkText(marks, 0),
                        "width": 59,
                        "passingMark": GetPassingMarkAtIndex(passingMarks,0),
                        "passingRatio": 1,
                      },
                      {
                        "text": safeMarkText(marks, 1),
                        "mark": safeMarkText(marks, 1),
                        "width": 60,
                        "passingMark": GetPassingMarkAtIndex(passingMarks,1),
                        "passingRatio": 1,
                      },
                      {
                        "text": (safeMarkNumber(marks, 0) +
                            safeMarkNumber(marks, 1)).ceil()
                            .toString(),
                        "mark": (safeMarkNumber(marks, 0) +
                            safeMarkNumber(marks, 1)).ceil()
                            .toString(),
                        "width": 60,
                        "passingMark": (GetPassingMarkAtIndex(passingMarks,0)+GetPassingMarkAtIndex(passingMarks,1)),
                        "passingRatio": 1,
                      },
                      {
                        "text": ((safeMarkNumber(marks, 0) +
                            safeMarkNumber(marks, 1))/2).ceil()
                            .toString(),
                        "mark": ((safeMarkNumber(marks, 0) +
                            safeMarkNumber(marks, 1))/2).ceil()
                            .toString(),
                        "width": 101,
                        "passingMark": ((GetPassingMarkAtIndex(passingMarks,0)+GetPassingMarkAtIndex(passingMarks,1))/2).ceil(),
                        "passingRatio": 1,
                      },
                      {
                        "text": numberToArabicWords(((safeMarkNumber(marks, 0) +
                            safeMarkNumber(marks, 1))/2).ceil()
                            .toString()),
                        "mark": ((safeMarkNumber(marks, 0) +
                            safeMarkNumber(marks, 1))/2).ceil()
                            .toString(),
                        "width": 100,
                        "passingMark": ((GetPassingMarkAtIndex(passingMarks,0)+GetPassingMarkAtIndex(passingMarks,1))/2).ceil(),
                        "passingRatio": 1,

                      },
                    ],
                  ),
                  //space
                  buildDgree('',
                      isLeft: true,
                      isRight: true,
                      passingMark: 0,
                      passingRatio: 0),

                  //daraga odma
                  buildDgree(
                      passingMark: 0,
                      passingRatio: 0,
                      mainCurr.insideCurr!.first.maxMark?.toString() ?? '',
                      isLeft: true,

                      isBold: true),

                  buildSplitDgree(
                    isRight: false,
                    data: [
                      {
                        "text": safeMarkText(marks, 2),
                        "mark": safeMarkText(marks, 2),
                        "width": 59,
                        "passingMark": GetPassingMarkAtIndex(passingMarks,2),
                        "passingRatio": 1,
                      },
                      {
                        "text": safeMarkText(marks, 3),
                        "mark": safeMarkText(marks, 3),
                        "width": 60,
                        "passingMark": GetPassingMarkAtIndex(passingMarks,3),
                        "passingRatio": 1,
                      },
                      {
                        "text": marks.length > 2
                            ? (safeMarkNumber(marks, 2) +
                            safeMarkNumber(marks, 3)).ceil()
                            .toString()
                            : "",
                        "mark": marks.length > 2
                            ? (safeMarkNumber(marks, 2) +
                            safeMarkNumber(marks, 3)).ceil()
                            .toString()
                            : "",
                        "width": 60,
                        "passingMark": (GetPassingMarkAtIndex(passingMarks,2)+GetPassingMarkAtIndex(passingMarks,3)).ceil(),
                        "passingRatio": 1,
                      },
                      {
                        "text":safeMarkNumber(marks, 2)  ==0 ? "": ((safeMarkNumber(marks, 2) +
                            safeMarkNumber(marks, 3))/2).ceil()
                            .toString(),
                        "mark":  safeMarkNumber( marks,2)==0? "":((safeMarkNumber(marks, 2) +
                            safeMarkNumber(marks, 3))/2).ceil()
                            .toString(),
                        "width": 101,
                        "passingMark": ((GetPassingMarkAtIndex(passingMarks,2)+GetPassingMarkAtIndex(passingMarks,3))/2).ceil(),
                        "passingRatio": 1,
                      },
                      {
                        "text": numberToArabicWords(((safeMarkNumber(marks, 2) +
                            safeMarkNumber(marks, 3))/2).ceil()
                            .toString()),
                        "mark": ((safeMarkNumber(marks, 2) +
                            safeMarkNumber(marks, 3))/2).ceil()
                            .toString(),
                        "width": 100,
                        "passingMark": ((GetPassingMarkAtIndex(passingMarks,2)+GetPassingMarkAtIndex(passingMarks,3))/2).ceil(),
                        "passingRatio": 1,

                      },
                    ],
                  ),

                  buildDgree('',
                      isLeft: true,
                      isRight: true,
                      passingMark: 0,
                      passingRatio: 0),

                  buildSplitDgree(
                    isLeft: true,
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
                        "passingMark": ((
                            GetPassingMarkAtIndex(passingMarks , 0)+
                                GetPassingMarkAtIndex(passingMarks , 1)+
                                GetPassingMarkAtIndex(passingMarks , 2)+
                                GetPassingMarkAtIndex(passingMarks , 3)
                        )/2).ceil(),
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
                        "passingMark": ((
                            GetPassingMarkAtIndex(passingMarks , 0)+
                                GetPassingMarkAtIndex(passingMarks , 1)+
                                GetPassingMarkAtIndex(passingMarks , 2)+
                                GetPassingMarkAtIndex(passingMarks , 3)
                        )/2).ceil(),
                        "passingRatio": 1,
                      },
                    ],
                  ),
                ],
              );
            }).toList(),




          TableRow(
            children: [


              buildDgree(

                'المجموع النهائي',
                isLeft: true,
                isRight: true,
                isBold: true,
                ismaj: true,
                passingMark: 100,
                passingRatio: 1,
              ),

              buildDgree(
                ismaj: true,
                passingMark: calculateTotalPassingMarks(controller.rebortCard!.rebort!.downCurriculum)  + calculateTotalPassingMarks(controller.rebortCard!.rebort!.mainCurriculum),
                passingRatio: 1,
                '${calculateTotalCMarks(controller.rebortCard!.rebort!.downCurriculum)  + calculateTotalCMarks(controller.rebortCard!.rebort!.mainCurriculum)}',
                isLeft: true,
                isBold: true,
              ),


              //a3mal , 2mt7an , sum , m1n , m1w

              buildSplitDgree(
                ismag: true,
                data: [
                  {
                    "text": (sumMarksAtIndex(controller.rebortCard!.rebort!.mainCurriculum,0)  +sumMarksAtIndex(controller.rebortCard!.rebort!.downCurriculum,0))
                        .ceil(),

                    "mark": (sumMarksAtIndex(controller.rebortCard!.rebort!.mainCurriculum,0)  +sumMarksAtIndex(controller.rebortCard!.rebort!.downCurriculum,0))

                        .ceil(),
                    "width": 59,
                    "passingMark": (sumPassingMarksAtIndex(controller.rebortCard!.rebort!.mainCurriculum,0)+sumPassingMarksAtIndex(controller.rebortCard!.rebort!.downCurriculum,0)),
                    "passingRatio":1,
                  },
                  {
                    "text": (sumMarksAtIndex(controller.rebortCard!.rebort!.mainCurriculum,1)  +sumMarksAtIndex(controller.rebortCard!.rebort!.downCurriculum,1))
                        .ceil(),

                    "mark": (sumMarksAtIndex(controller.rebortCard!.rebort!.mainCurriculum,1)  +sumMarksAtIndex(controller.rebortCard!.rebort!.downCurriculum,1))
                        .ceil(),
                    "width": 60,
                    "passingMark": (sumPassingMarksAtIndex(controller.rebortCard!.rebort!.mainCurriculum,1)+sumPassingMarksAtIndex(controller.rebortCard!.rebort!.downCurriculum,1)),
                    "passingRatio":1,

                  },
                  {
                    "text": ((sumMarksAtIndex(controller.rebortCard!.rebort!.mainCurriculum,0)  +sumMarksAtIndex(controller.rebortCard!.rebort!.downCurriculum,0)) + (sumMarksAtIndex(controller.rebortCard!.rebort!.mainCurriculum,1)  +sumMarksAtIndex(controller.rebortCard!.rebort!.downCurriculum,1)) ).ceil()
                        .toString(),
                    "mark": ((sumMarksAtIndex(controller.rebortCard!.rebort!.mainCurriculum,0)  +sumMarksAtIndex(controller.rebortCard!.rebort!.downCurriculum,0)) + (sumMarksAtIndex(controller.rebortCard!.rebort!.mainCurriculum,1)  +sumMarksAtIndex(controller.rebortCard!.rebort!.downCurriculum,1)) ).ceil()
                        .toString(),
                    "width": 60,
                    "passingMark": (sumPassingMarksAtIndex(controller.rebortCard!.rebort!.mainCurriculum,0)+sumPassingMarksAtIndex(controller.rebortCard!.rebort!.downCurriculum,0)+sumPassingMarksAtIndex(controller.rebortCard!.rebort!.mainCurriculum,1)+sumPassingMarksAtIndex(controller.rebortCard!.rebort!.downCurriculum,1)).ceil(),
                    "passingRatio":1,
                  },
                  {
                    "text": (((sumMarksAtIndex(controller.rebortCard!.rebort!.mainCurriculum,0)  +sumMarksAtIndex(controller.rebortCard!.rebort!.downCurriculum,0)) + (sumMarksAtIndex(controller.rebortCard!.rebort!.mainCurriculum,1)  +sumMarksAtIndex(controller.rebortCard!.rebort!.downCurriculum,1)) )/2).ceil()
                        .toString(),
                    "mark": (((sumMarksAtIndex(controller.rebortCard!.rebort!.mainCurriculum,0)  +sumMarksAtIndex(controller.rebortCard!.rebort!.downCurriculum,0)) + (sumMarksAtIndex(controller.rebortCard!.rebort!.mainCurriculum,1)  +sumMarksAtIndex(controller.rebortCard!.rebort!.downCurriculum,1)) )/2).ceil()
                        .toString(),
                    "width": 101,
                    "passingMark": ((sumPassingMarksAtIndex(controller.rebortCard!.rebort!.mainCurriculum,0)+sumPassingMarksAtIndex(controller.rebortCard!.rebort!.downCurriculum,0)+sumPassingMarksAtIndex(controller.rebortCard!.rebort!.mainCurriculum,1)+sumPassingMarksAtIndex(controller.rebortCard!.rebort!.downCurriculum,1))/2).ceil(),
                    "passingRatio":1,
                  },
                  {
                    "text": numberToArabicWords((((sumMarksAtIndex(controller.rebortCard!.rebort!.mainCurriculum,0)  +sumMarksAtIndex(controller.rebortCard!.rebort!.downCurriculum,0)) + (sumMarksAtIndex(controller.rebortCard!.rebort!.mainCurriculum,1)  +sumMarksAtIndex(controller.rebortCard!.rebort!.downCurriculum,1)) )/2).ceil()
                        .toString()),
                    "mark": (((sumMarksAtIndex(controller.rebortCard!.rebort!.mainCurriculum,0)  +sumMarksAtIndex(controller.rebortCard!.rebort!.downCurriculum,0)) + (sumMarksAtIndex(controller.rebortCard!.rebort!.mainCurriculum,1)  +sumMarksAtIndex(controller.rebortCard!.rebort!.downCurriculum,1)) )/2).ceil()
                        .toString(),
                    "width": 100,
                    "passingMark": ((sumPassingMarksAtIndex(controller.rebortCard!.rebort!.mainCurriculum,0)+sumPassingMarksAtIndex(controller.rebortCard!.rebort!.downCurriculum,0)+sumPassingMarksAtIndex(controller.rebortCard!.rebort!.mainCurriculum,1)+sumPassingMarksAtIndex(controller.rebortCard!.rebort!.downCurriculum,1))/2).ceil(),
                    "passingRatio":1,
                  },
                ],
              ),
              //space
              buildDgree('',

                  isLeft: true,
                  isRight: true,
                  passingMark: 0,
                  passingRatio: 0),

              //daraga odma
              buildDgree(
                ismaj: true,
                passingMark: 0 ,
                passingRatio: 0,
                '${calculateTotalCMarks(controller.rebortCard!.rebort!.downCurriculum)+ calculateTotalCMarks(controller.rebortCard!.rebort!.mainCurriculum)}',
                isLeft: true,
                isBold: true,
              ),


              buildSplitDgree(
                ismag: true,
                isRight: false,
                data: [
                  {
                    "text": safeMarkNumberAtIndex( 2)==0? "": sumMarksAtIndex(controller.rebortCard!.rebort!.downCurriculum,2)+sumMarksAtIndex(controller.rebortCard!.rebort!.mainCurriculum,2),
                    "mark": safeMarkNumberAtIndex( 2)==0? "": sumMarksAtIndex(controller.rebortCard!.rebort!.downCurriculum,2)+sumMarksAtIndex(controller.rebortCard!.rebort!.mainCurriculum,2),
                    "width": 59,
                    "passingMark": sumPassingMarksAtIndex(controller.rebortCard!.rebort!.mainCurriculum,2)+sumPassingMarksAtIndex(controller.rebortCard!.rebort!.downCurriculum,2),
                    "passingRatio": 1,
                  },
                  {
                    "text":  safeMarkNumberAtIndex( 2)==0? "":sumMarksAtIndex(controller.rebortCard!.rebort!.downCurriculum,3)+sumMarksAtIndex(controller.rebortCard!.rebort!.mainCurriculum,3),
                    "mark":  safeMarkNumberAtIndex( 2)==0? "":sumMarksAtIndex(controller.rebortCard!.rebort!.downCurriculum,3)+sumMarksAtIndex(controller.rebortCard!.rebort!.mainCurriculum,3),
                    "width": 60,
                    "passingMark": sumPassingMarksAtIndex(controller.rebortCard!.rebort!.mainCurriculum,3)+sumPassingMarksAtIndex(controller.rebortCard!.rebort!.downCurriculum,3),
                    "passingRatio": 1,},
                  {
                    "text": safeMarkNumberAtIndex( 2)==0? "":(sumMarksAtIndex(controller.rebortCard!.rebort!.downCurriculum,2) +
                        sumMarksAtIndex(controller.rebortCard!.rebort!.downCurriculum,3)
                    + sumMarksAtIndex(controller.rebortCard!.rebort!.mainCurriculum,2) +
                  sumMarksAtIndex(controller.rebortCard!.rebort!.mainCurriculum,3)

                    ).ceil()
                        .toString()
                    ,
                    "mark":  safeMarkNumberAtIndex( 2)==0? "": (sumMarksAtIndex(controller.rebortCard!.rebort!.downCurriculum,2) +
                        sumMarksAtIndex(controller.rebortCard!.rebort!.downCurriculum,3) + sumMarksAtIndex(controller.rebortCard!.rebort!.mainCurriculum,2) +
                        sumMarksAtIndex(controller.rebortCard!.rebort!.mainCurriculum,3)).ceil()
                        .toString()
                    ,
                    "width": 60,
                    "passingMark": (
                        sumPassingMarksAtIndex(controller.rebortCard!.rebort!.mainCurriculum,2)
                            +sumPassingMarksAtIndex(controller.rebortCard!.rebort!.downCurriculum,2)
                            +sumPassingMarksAtIndex(controller.rebortCard!.rebort!.mainCurriculum,3)
                            +sumPassingMarksAtIndex(controller.rebortCard!.rebort!.downCurriculum,3)
                    ).ceil(),
                    "passingRatio": 1,
                  },
                  {
                    "text":  safeMarkNumberAtIndex( 2)==0? "":((sumMarksAtIndex(controller.rebortCard!.rebort!.downCurriculum,2) +
                        sumMarksAtIndex(controller.rebortCard!.rebort!.downCurriculum,3)  + sumMarksAtIndex(controller.rebortCard!.rebort!.mainCurriculum,2) +
                        sumMarksAtIndex(controller.rebortCard!.rebort!.mainCurriculum,3))/2).ceil()
                        .toString(),
                    "mark":  safeMarkNumberAtIndex( 2)==0? "":((sumMarksAtIndex(controller.rebortCard!.rebort!.downCurriculum,2) +
                        sumMarksAtIndex(controller.rebortCard!.rebort!.downCurriculum,3) + sumMarksAtIndex(controller.rebortCard!.rebort!.mainCurriculum,2) +
                        sumMarksAtIndex(controller.rebortCard!.rebort!.mainCurriculum,3))/2).ceil()
                        .toString(),
                    "width": 101,
                    "passingMark": ((
                        sumPassingMarksAtIndex(controller.rebortCard!.rebort!.mainCurriculum,2)
                            +sumPassingMarksAtIndex(controller.rebortCard!.rebort!.downCurriculum,2)
                            +sumPassingMarksAtIndex(controller.rebortCard!.rebort!.mainCurriculum,3)
                            +sumPassingMarksAtIndex(controller.rebortCard!.rebort!.downCurriculum,3)
                    )/2).ceil(),
                    "passingRatio": 1,
                  },
                  {
                    "text": numberToArabicWords(((sumMarksAtIndex(controller.rebortCard!.rebort!.downCurriculum,2) +
                        sumMarksAtIndex(controller.rebortCard!.rebort!.downCurriculum,3) + sumMarksAtIndex(controller.rebortCard!.rebort!.mainCurriculum,2) +
                        sumMarksAtIndex(controller.rebortCard!.rebort!.mainCurriculum,3))/2).ceil()
                        .toString()),
                    "mark": ((sumMarksAtIndex(controller.rebortCard!.rebort!.downCurriculum,2) +
                        sumMarksAtIndex(controller.rebortCard!.rebort!.downCurriculum,3) + sumMarksAtIndex(controller.rebortCard!.rebort!.mainCurriculum,2) +
                        sumMarksAtIndex(controller.rebortCard!.rebort!.mainCurriculum,3))/2).ceil()
                        .toString(),
                    "width": 100,
                    "passingMark": ((
                        sumPassingMarksAtIndex(controller.rebortCard!.rebort!.mainCurriculum,2)
                            +sumPassingMarksAtIndex(controller.rebortCard!.rebort!.downCurriculum,2)
                            +sumPassingMarksAtIndex(controller.rebortCard!.rebort!.mainCurriculum,3)
                            +sumPassingMarksAtIndex(controller.rebortCard!.rebort!.downCurriculum,3)
                    )/2).ceil(),
                    "passingRatio": 1,
                  },
                ],
              ),

              buildDgree('',
                  isLeft: true,
                  isRight: true,
                  passingMark: 0,
                  passingRatio: 0),

              buildSplitDgree(
                ismag: true,
                isLeft: true,
                data: [
                  {
                    "text":   safeMarkNumberAtIndex( 2)==0? "":(((sumMarksAtIndex(controller.rebortCard!.rebort!.downCurriculum,0) +
                        sumMarksAtIndex(controller.rebortCard!.rebort!.downCurriculum,1) +
                        sumMarksAtIndex(controller.rebortCard!.rebort!.downCurriculum,2) +
                        sumMarksAtIndex(controller.rebortCard!.rebort!.downCurriculum,3))+
                        (sumMarksAtIndex(controller.rebortCard!.rebort!.mainCurriculum,0) +
                        sumMarksAtIndex(controller.rebortCard!.rebort!.mainCurriculum,1) +
                        sumMarksAtIndex(controller.rebortCard!.rebort!.mainCurriculum,2) +
                        sumMarksAtIndex(controller.rebortCard!.rebort!.mainCurriculum,3))) /
                        2)
                        .ceil()
                        .toString()
                    ,
                    "mark": safeMarkNumberAtIndex( 2)==0? "":(((sumMarksAtIndex(controller.rebortCard!.rebort!.downCurriculum,0) +
                        sumMarksAtIndex(controller.rebortCard!.rebort!.downCurriculum,1) +
                        sumMarksAtIndex(controller.rebortCard!.rebort!.downCurriculum,2) +
                        sumMarksAtIndex(controller.rebortCard!.rebort!.downCurriculum,3))+
                        (sumMarksAtIndex(controller.rebortCard!.rebort!.mainCurriculum,0) +
                            sumMarksAtIndex(controller.rebortCard!.rebort!.mainCurriculum,1) +
                            sumMarksAtIndex(controller.rebortCard!.rebort!.mainCurriculum,2) +
                            sumMarksAtIndex(controller.rebortCard!.rebort!.mainCurriculum,3))) /
                        2)
                        .ceil()
                        .toString()
                    ,
                    "width": 99,
                    "passingMark": (((
                        sumPassingMarksAtIndex(controller.rebortCard!.rebort!.mainCurriculum,0)
                            +sumPassingMarksAtIndex(controller.rebortCard!.rebort!.mainCurriculum,1)
                            +sumPassingMarksAtIndex(controller.rebortCard!.rebort!.mainCurriculum,2)
                            +sumPassingMarksAtIndex(controller.rebortCard!.rebort!.mainCurriculum,3)
                    )+
                        (
                            sumPassingMarksAtIndex(controller.rebortCard!.rebort!.downCurriculum,0)
                                +sumPassingMarksAtIndex(controller.rebortCard!.rebort!.downCurriculum,1)
                                +sumPassingMarksAtIndex(controller.rebortCard!.rebort!.downCurriculum,2)
                                +sumPassingMarksAtIndex(controller.rebortCard!.rebort!.downCurriculum,3)
                        ))/2
                    ).ceil(),
                    "passingRatio": 1,
                  },
                  {
                    "text":  safeMarkNumberAtIndex( 2)==0? "": numberToArabicWords((((sumMarksAtIndex(controller.rebortCard!.rebort!.downCurriculum,0) +
                        sumMarksAtIndex(controller.rebortCard!.rebort!.downCurriculum,1) +
                        sumMarksAtIndex(controller.rebortCard!.rebort!.downCurriculum,2) +
                        sumMarksAtIndex(controller.rebortCard!.rebort!.downCurriculum,3))+
                        (sumMarksAtIndex(controller.rebortCard!.rebort!.mainCurriculum,0) +
                            sumMarksAtIndex(controller.rebortCard!.rebort!.mainCurriculum,1) +
                            sumMarksAtIndex(controller.rebortCard!.rebort!.mainCurriculum,2) +
                            sumMarksAtIndex(controller.rebortCard!.rebort!.mainCurriculum,3))) /
                        2).ceil()
                        .toString())
                    ,
                    "mark": safeMarkNumberAtIndex( 2)==0? "":((((sumMarksAtIndex(controller.rebortCard!.rebort!.downCurriculum,0) +
                        sumMarksAtIndex(controller.rebortCard!.rebort!.downCurriculum,1) +
                        sumMarksAtIndex(controller.rebortCard!.rebort!.downCurriculum,2) +
                        sumMarksAtIndex(controller.rebortCard!.rebort!.downCurriculum,3))+
                        (sumMarksAtIndex(controller.rebortCard!.rebort!.mainCurriculum,0) +
                            sumMarksAtIndex(controller.rebortCard!.rebort!.mainCurriculum,1) +
                            sumMarksAtIndex(controller.rebortCard!.rebort!.mainCurriculum,2) +
                            sumMarksAtIndex(controller.rebortCard!.rebort!.mainCurriculum,3))) /
                        2)).ceil()
                        .toString()
                    ,
                    "width": 99,
                    "passingMark": (((
                        sumPassingMarksAtIndex(controller.rebortCard!.rebort!.mainCurriculum,0)
                            +sumPassingMarksAtIndex(controller.rebortCard!.rebort!.mainCurriculum,1)
                            +sumPassingMarksAtIndex(controller.rebortCard!.rebort!.mainCurriculum,2)
                            +sumPassingMarksAtIndex(controller.rebortCard!.rebort!.mainCurriculum,3)
                    )+
                        (
                            sumPassingMarksAtIndex(controller.rebortCard!.rebort!.downCurriculum,0)
                                +sumPassingMarksAtIndex(controller.rebortCard!.rebort!.downCurriculum,1)
                                +sumPassingMarksAtIndex(controller.rebortCard!.rebort!.downCurriculum,2)
                                +sumPassingMarksAtIndex(controller.rebortCard!.rebort!.downCurriculum,3)
                        )
                    )/2).ceil(),
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
