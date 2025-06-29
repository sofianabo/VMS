import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vms_school/Link/Controller/AdminController/Students_Controllers/Jalaa_For_Students/Jalaa_Controller.dart';
import 'package:vms_school/view/SMS_Platform/Admin/Students_Manager/Export_Jalaa_Pages/Convert_Functions_For_All.dart';

Widget buildDgreeSecondTable(String text,
    {bool isLeft = false, bool isRight = false}) {
  return Container(
    decoration: text != ""
        ? isLeft && !isRight
            ? BoxDecoration(
                border: Border(
                  bottom: BorderSide(color: Colors.black, width: 2),
                  left: BorderSide(color: Colors.black, width: 2),
                ),
              )
            : isRight && !isLeft
                ? BoxDecoration(
                    border: Border(
                      bottom: BorderSide(color: Colors.black, width: 2),
                      right: BorderSide(color: Colors.black, width: 2),
                    ),
                  )
                : isLeft && isRight
                    ? BoxDecoration(
                        border: Border(
                          bottom: BorderSide(color: Colors.black, width: 2),
                          right: BorderSide(color: Colors.black, width: 2),
                          left: BorderSide(color: Colors.black, width: 2),
                        ),
                      )
                    : BoxDecoration(
                        border: Border(
                          bottom: BorderSide(color: Colors.black, width: 2),
                        ),
                      )
        : BoxDecoration(
            border: Border(
              right: BorderSide(color: Colors.black, width: 2),
              left: BorderSide(color: Colors.black, width: 2),
            ),
          ),
    alignment: Alignment.center,
    height: 30,
    child: Text(
      convertToArabicNumbers(text),
      textAlign: TextAlign.center,
      style: TextStyle(
          fontSize: 14, fontWeight: FontWeight.bold, fontFamily: "tnr"),
    ),
  );
}

Widget buildSplitDgreeSecondTable({
  required List<Map<String, dynamic>> data,
  bool isLeft = false,
  bool isRight = false,
}) {
  return Container(
    decoration: isLeft && !isRight
        ? BoxDecoration(
            border: Border(
              bottom: BorderSide(color: Colors.black, width: 2),
              left: BorderSide(color: Colors.black, width: 2),
            ),
          )
        : isRight && !isLeft
            ? BoxDecoration(
                border: Border(
                  bottom: BorderSide(color: Colors.black, width: 2),
                  right: BorderSide(color: Colors.black, width: 2),
                ),
              )
            : isLeft && isRight
                ? BoxDecoration(
                    border: Border(
                      bottom: BorderSide(color: Colors.black, width: 2),
                      right: BorderSide(color: Colors.black, width: 2),
                      left: BorderSide(color: Colors.black, width: 2),
                    ),
                  )
                : BoxDecoration(
                    border: Border(
                      bottom: BorderSide(color: Colors.black, width: 2),
                    ),
                  ),
    alignment: Alignment.center,
    height: 30,
    child: Row(
      children: data.asMap().entries.map((entry) {
        final index = entry.key;
        final item = entry.value;

        return Container(
          width: item['width'].toDouble(),
          alignment: Alignment.center,
          decoration: BoxDecoration(
            border: (index != 0)
                ? Border(right: BorderSide(color: Colors.black, width: 2))
                : null, // لا حدود إذا كان index ليس 0 أو 1
          ),
          child: Text(
            convertToArabicNumbers(item['text'].toString()),
            style: TextStyle(
                fontWeight: FontWeight.bold, fontSize: 14, fontFamily: "tnr"),
          ),
        );
      }).toList(),
    ),
  );
}

Widget buildRotateWithTextCell(String text, String secondText,
    {bool isLeft = false, bool isRight = false}) {
  return Column(
    children: [
      Container(
          decoration: text != ""
              ? isLeft && !isRight
                  ? BoxDecoration(
                      border: Border(
                        top: BorderSide(color: Colors.black, width: 2),
                        left: BorderSide(color: Colors.black, width: 2),
                      ),
                    )
                  : isRight && !isLeft
                      ? BoxDecoration(
                          border: Border(
                            top: BorderSide(color: Colors.black, width: 2),
                            right: BorderSide(color: Colors.black, width: 2),
                          ),
                        )
                      : isLeft && isRight
                          ? BoxDecoration(
                              border: Border(
                                top: BorderSide(color: Colors.black, width: 2),
                                right:
                                    BorderSide(color: Colors.black, width: 2),
                                left: BorderSide(color: Colors.black, width: 2),
                              ),
                            )
                          : BoxDecoration(
                              border: Border(
                                top: BorderSide(color: Colors.black, width: 2),
                              ),
                            )
              : BoxDecoration(
                  border: Border(
                    top: BorderSide(color: Colors.black, width: 2),
                    right: BorderSide(color: Colors.black, width: 2),
                    left: BorderSide(color: Colors.black, width: 2),
                  ),
                ),
          height: 102,
          alignment: Alignment.center,
          padding: EdgeInsets.all(8),
          child: RotatedBox(
            quarterTurns: 3, // 1 = 90° / 2 = 180° / 3 = 270°
            child: Text(
              convertToArabicNumbers(text),
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: 14, fontWeight: FontWeight.bold, fontFamily: "tnr"),
            ),
          )),
      Container(
          height: 31,
          decoration: text != ""
              ? isLeft && !isRight
                  ? BoxDecoration(
                      border: Border(
                        top: BorderSide(color: Colors.black, width: 2),
                        left: BorderSide(color: Colors.black, width: 2),
                      ),
                    )
                  : isRight && !isLeft
                      ? BoxDecoration(
                          border: Border(
                            top: BorderSide(color: Colors.black, width: 2),
                            right: BorderSide(color: Colors.black, width: 2),
                            bottom: BorderSide(color: Colors.black, width: 2),
                          ),
                        )
                      : isLeft && isRight
                          ? BoxDecoration(
                              border: Border(
                                top: BorderSide(color: Colors.black, width: 2),
                                right:
                                    BorderSide(color: Colors.black, width: 2),
                                left: BorderSide(color: Colors.black, width: 2),
                              ),
                            )
                          : BoxDecoration(
                              border: Border(
                                top: BorderSide(color: Colors.black, width: 2),
                              ),
                            )
              : BoxDecoration(
                  border: Border(
                    top: BorderSide(color: Colors.black, width: 2),
                    right: BorderSide(color: Colors.black, width: 2),
                    left: BorderSide(color: Colors.black, width: 2),
                  ),
                ),
          alignment: Alignment.center,
          child: Padding(
            padding: const EdgeInsets.only(top: 3.0),
            child: Text(
              convertToArabicNumbers(secondText),
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: 14, fontWeight: FontWeight.bold, fontFamily: "tnr"),
            ),
          )),
    ],
  );
}

Widget buildRotateWithTextCellWithBottom(String text, String secondText,
    {bool isLeft = false, bool isRight = false}) {
  return Column(
    children: [
      Container(
          decoration: BoxDecoration(
            border: Border(
              top: BorderSide(color: Colors.black, width: 2),
              right: BorderSide(color: Colors.black, width: 2),
              left: BorderSide(color: Colors.black, width: 2),
            ),
          ),
          height: 102,
          alignment: Alignment.center,
          padding: EdgeInsets.all(8),
          child: RotatedBox(
            quarterTurns: 3, // 1 = 90° / 2 = 180° / 3 = 270°
            child: Text(
              convertToArabicNumbers(text),
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: 12, fontWeight: FontWeight.bold, fontFamily: "tnr"),
            ),
          )),
      Container(
          height: 31,
          decoration: BoxDecoration(
            border: Border(
              top: BorderSide(color: Colors.black, width: 2),
              right: BorderSide(color: Colors.black, width: 2),
              left: BorderSide(color: Colors.black, width: 2),
              bottom: BorderSide(color: Colors.black, width: 2),
            ),
          ),
          alignment: Alignment.center,
          child: Padding(
            padding: const EdgeInsets.only(top: 3.0),
            child: Text(
              convertToArabicNumbers(secondText),
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: 14, fontWeight: FontWeight.bold, fontFamily: "tnr"),
            ),
          )),
    ],
  );
}

Widget buildRotateGheabCell(String text,
    {bool isLeft = false, bool isRight = false}) {
  var mobarar = Get.find<Jalaa_Controller>()
      .rebortCard!
      .rebort!
      .attendance!
      .firstSemester!
      .mobararAttendance;
  var notmobarar = Get.find<Jalaa_Controller>()
      .rebortCard!
      .rebort!
      .attendance!
      .firstSemester!
      .notMobararAttendance;
  return Container(
    height: 133,
    child: Column(
      children: [
        Container(
          decoration: text != ""
              ? isLeft && !isRight
                  ? BoxDecoration(
                      border: Border(
                        top: BorderSide(color: Colors.black, width: 2),
                        left: BorderSide(color: Colors.black, width: 2),
                      ),
                    )
                  : isRight && !isLeft
                      ? BoxDecoration(
                          border: Border(
                            top: BorderSide(color: Colors.black, width: 2),
                            right: BorderSide(color: Colors.black, width: 2),
                          ),
                        )
                      : isLeft && isRight
                          ? BoxDecoration(
                              border: Border(
                                top: BorderSide(color: Colors.black, width: 2),
                                right:
                                    BorderSide(color: Colors.black, width: 2),
                                left: BorderSide(color: Colors.black, width: 2),
                              ),
                            )
                          : BoxDecoration(
                              border: Border(
                                top: BorderSide(color: Colors.black, width: 2),
                              ),
                            )
              : BoxDecoration(
                  border: Border(
                    top: BorderSide(color: Colors.black, width: 2),
                    right: BorderSide(color: Colors.black, width: 2),
                    left: BorderSide(color: Colors.black, width: 2),
                  ),
                ),
          width: 80,
          height: 35,
          child: Center(
            child: Text(
              convertToArabicNumbers(text),
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: 14, fontWeight: FontWeight.bold, fontFamily: "tnr"),
            ),
          ),
        ),
        Row(
          children: [
            Column(
              children: [
                Container(
                  decoration: BoxDecoration(
                    border: Border(
                      top: BorderSide(color: Colors.black, width: 2),
                      bottom: BorderSide(color: Colors.black, width: 2),
                      right: BorderSide(color: Colors.black, width: 2),
                    ),
                  ),
                  width: 40,
                  height: 69,
                  child: RotatedBox(
                    quarterTurns: 3, // 1 = 90° / 2 = 180° / 3 = 270°
                    child: Center(
                      child: Text(
                        "مبرر",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                            fontFamily: "tnr"),
                      ),
                    ),
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                    border: Border(
                      bottom: BorderSide(color: Colors.black, width: 2),
                      right: BorderSide(color: Colors.black, width: 2),
                    ),
                  ),
                  width: 40,
                  height: 29,
                  child: Center(
                    child: Text(
                      mobarar != 0
                          ? convertToArabicNumbers(
                              "${mobarar}",
                            )
                          : "-",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          fontFamily: "tnr"),
                    ),
                  ),
                ),
              ],
            ),
            Column(
              children: [
                Container(
                  decoration: BoxDecoration(
                    border: Border(
                      top: BorderSide(color: Colors.black, width: 2),
                      bottom: BorderSide(color: Colors.black, width: 2),
                      right: BorderSide(color: Colors.black, width: 2),
                    ),
                  ),
                  width: 40,
                  height: 69,
                  child: RotatedBox(
                    quarterTurns: 3, // 1 = 90° / 2 = 180° / 3 = 270°
                    child: Center(
                      child: Text(
                        "غير مبرر",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                            fontFamily: "tnr"),
                      ),
                    ),
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                    border: Border(
                      bottom: BorderSide(color: Colors.black, width: 2),
                      right: BorderSide(color: Colors.black, width: 2),
                    ),
                  ),
                  width: 40,
                  height: 29,
                  child: Center(
                    child: Text(
                      notmobarar != 0
                          ? convertToArabicNumbers(
                              "${notmobarar}",
                            )
                          : "-",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          fontFamily: "tnr"),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ],
    ),
  );
}
