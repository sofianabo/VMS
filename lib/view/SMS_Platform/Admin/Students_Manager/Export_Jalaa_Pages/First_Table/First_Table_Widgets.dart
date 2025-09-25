import 'package:flutter/material.dart';
import 'package:vms_school/view/SMS_Platform/Admin/Students_Manager/Export_Jalaa_Pages/Convert_Functions_For_All.dart';

Widget buildCell(String text) {
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

Widget buildleftCell(String text) {
  return Container(
    decoration: BoxDecoration(
        border: Border(
            bottom: BorderSide(color: Colors.black, width: 2),
            right: BorderSide(color: Colors.black, width: 2),
            top: BorderSide(color: Colors.black, width: 2))),
    alignment: Alignment.center,
    padding: EdgeInsets.all(8),
    height: 110,
    child: Text(
      textAlign: TextAlign.center,
      convertToArabicNumbers(text),
      style: TextStyle(
          fontSize: 16, fontFamily: "tnr", fontWeight: FontWeight.bold),
    ),
  );
}

Widget buildRotateCell(String text, {int colSpan = 1}) {
  return Container(
      height: 133,
      decoration: BoxDecoration(
          border: Border(
        top: BorderSide(color: Colors.black, width: 2),
        bottom: BorderSide(color: Colors.black, width: 2),
        left: BorderSide(color: Colors.black, width: 2),
      )),
      alignment: Alignment.center,
      padding: EdgeInsets.all(8),
      child: RotatedBox(
        quarterTurns: 3, // 1 = 90° / 2 = 180° / 3 = 270°
        child: Text(
          textAlign: TextAlign.center,
          convertToArabicNumbers(text),
          style: TextStyle(
              fontSize: 14, fontFamily: "tnr", fontWeight: FontWeight.bold),
        ),
      ));
}

Widget The_First_Semester_Cell(String text, {int colSpan = 1}) {
  return Container(
    decoration: BoxDecoration(
        border: Border(
      top: BorderSide(color: Colors.black, width: 2),
      bottom: BorderSide(color: Colors.black, width: 1),
    )),
    alignment: Alignment.center,
    child: Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(5.0),
          child: Text(
            textAlign: TextAlign.center,
            convertToArabicNumbers(text),
            style: TextStyle(
                fontSize: 14, fontFamily: "tnr", fontWeight: FontWeight.bold),
          ),
        ),
        Row(
          children: [
            Column(
              children: [
                Container(
                    alignment: Alignment.center,
                    height: 70,
                    width: 40,
                    decoration: BoxDecoration(
                      border: Border(
                        bottom: BorderSide(color: Colors.black, width: 1),
                        top: BorderSide(color: Colors.black, width: 2),
                        left: BorderSide(color: Colors.black, width: 1),
                        right: BorderSide(color: Colors.black, width: 0.5),
                      ),
                    ),
                    child: RotatedBox(
                      quarterTurns: 3, // 1 = 90° / 2 = 180° / 3 = 270°
                      child: Center(
                        child: Text(
                          textAlign: TextAlign.center,
                          "درجة الأعمال",
                          style: TextStyle(
                              fontSize: 12,
                              fontFamily: "tnr",
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    )),
                Container(
                    alignment: Alignment.center,
                    height: 30,
                    width: 40,
                    decoration: BoxDecoration(
                      border: Border(
                        bottom: BorderSide(color: Colors.black, width: 1),
                        top: BorderSide(color: Colors.black, width: 1),
                        left: BorderSide(color: Colors.black, width: 1),
                        right: BorderSide(color: Colors.black, width: 0.5),
                      ),
                    ),
                    child: Center(
                      child: Text(
                        textAlign: TextAlign.center,
                        convertToArabicNumbers("60%"),
                        style: TextStyle(
                            fontSize: 12,
                            fontFamily: "tnr",
                            fontWeight: FontWeight.bold),
                      ),
                    )),
              ],
            ),
            Column(
              children: [
                Container(
                  alignment: Alignment.center,
                  height: 70,
                  width: 60,
                  decoration: BoxDecoration(
                    border: Border(
                      bottom: BorderSide(color: Colors.black, width: 1),
                      top: BorderSide(color: Colors.black, width: 2),
                      left: BorderSide(color: Colors.black, width: 1),
                      right: BorderSide(color: Colors.black, width: 1),
                    ),
                  ),
                  child: Text(
                    textAlign: TextAlign.center,
                    "درجة الأمتحان",
                    style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        fontFamily: "tnr"),
                  ),
                ),
                Container(
                  alignment: Alignment.center,
                  height: 30,
                  width: 60,
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.black, width: 1),
                  ),
                  child: Text(
                    textAlign: TextAlign.center,
                    convertToArabicNumbers("40%"),
                    style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        fontFamily: "tnr"),
                  ),
                ),
              ],
            ),
            Column(
              children: [
                Container(
                  width: 200,
                  alignment: Alignment.center,
                  height: 70,
                  decoration: BoxDecoration(
                    border: Border(
                      bottom: BorderSide(color: Colors.black, width: 1),
                      top: BorderSide(color: Colors.black, width: 2),
                      right: BorderSide(color: Colors.black, width: 1),
                    ),
                  ),
                  child: Text(
                    textAlign: TextAlign.center,
                    "مجموع الدرجات\nللفصل الدراسي الأول",
                    style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        fontFamily: "tnr"),
                  ),
                ),
                Row(
                  children: [
                    Container(
                      width: 100,
                      alignment: Alignment.center,
                      height: 30,
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.black, width: 1),
                      ),
                      child: Text(
                        textAlign: TextAlign.center,
                        "رقما",
                        style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                            fontFamily: "tnr"),
                      ),
                    ),
                    Container(
                      width: 100,
                      alignment: Alignment.center,
                      height: 30,
                      decoration: BoxDecoration(
                        border: Border(
                          bottom: BorderSide(color: Colors.black, width: 1),
                          top: BorderSide(color: Colors.black, width: 1),
                          right: BorderSide(color: Colors.black, width: 1),
                        ),
                      ),
                      child: Text(
                        textAlign: TextAlign.center,
                        "كتابا",
                        style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                            fontFamily: "tnr"),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        )
      ],
    ),
  );
}

Widget The_Second_Semester_Cell(String text, {int colSpan = 1}) {
  return Container(
    decoration: BoxDecoration(
        border: Border(
      top: BorderSide(color: Colors.black, width: 2),
      bottom: BorderSide(color: Colors.black, width: 1),
      right: BorderSide(color: Colors.black, width: 2),
    )),
    alignment: Alignment.center,
    child: Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(5.0),
          child: Text(
            textAlign: TextAlign.center,
            convertToArabicNumbers(text),
            style: TextStyle(
                fontSize: 14, fontWeight: FontWeight.bold, fontFamily: "tnr"),
          ),
        ),
        Row(
          children: [
            Column(
              children: [
                Container(
                    alignment: Alignment.center,
                    height: 70,
                    width: 39,
                    decoration: BoxDecoration(
                      border: Border(
                        bottom: BorderSide(color: Colors.black, width: 1),
                        top: BorderSide(color: Colors.black, width: 2),
                        left: BorderSide(color: Colors.black, width: 1),
                      ),
                    ),
                    child: RotatedBox(
                      quarterTurns: 3, // 1 = 90° / 2 = 180° / 3 = 270°
                      child: Center(
                        child: Text(
                          textAlign: TextAlign.center,
                          "درجة الأعمال",
                          style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                              fontFamily: "tnr"),
                        ),
                      ),
                    )),
                Container(
                    alignment: Alignment.center,
                    height: 30,
                    width: 39,
                    decoration: BoxDecoration(
                        border: Border(
                      top: BorderSide(color: Colors.black, width: 1),
                      bottom: BorderSide(color: Colors.black, width: 1),
                      left: BorderSide(color: Colors.black, width: 1),
                    )),
                    child: Center(
                      child: Text(
                        textAlign: TextAlign.center,
                        convertToArabicNumbers("60%"),
                        style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                            fontFamily: "tnr"),
                      ),
                    )),
              ],
            ),
            Column(
              children: [
                Container(
                  alignment: Alignment.center,
                  height: 70,
                  width: 59,
                  decoration: BoxDecoration(
                    border: Border(
                      bottom: BorderSide(color: Colors.black, width: 1),
                      top: BorderSide(color: Colors.black, width: 2),
                      left: BorderSide(color: Colors.black, width: 1),
                      right: BorderSide(color: Colors.black, width: 1),
                    ),
                  ),
                  child: Text(
                    textAlign: TextAlign.center,
                    "درجة الأمتحان",
                    style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        fontFamily: "tnr"),
                  ),
                ),
                Container(
                  alignment: Alignment.center,
                  height: 30,
                  width: 59,
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.black, width: 1),
                  ),
                  child: Text(
                    textAlign: TextAlign.center,
                    convertToArabicNumbers("40%"),
                    style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        fontFamily: "tnr"),
                  ),
                ),
              ],
            ),
            Column(
              children: [
                Container(
                  width: 200,
                  alignment: Alignment.center,
                  height: 70,
                  decoration: BoxDecoration(
                    border: Border(
                      bottom: BorderSide(color: Colors.black, width: 1),
                      top: BorderSide(color: Colors.black, width: 2),
                      right: BorderSide(color: Colors.black, width: 1),
                    ),
                  ),
                  child: Text(
                    textAlign: TextAlign.center,
                    "مجموع الدرجات\nللفصل الدراسي الثاني",
                    style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        fontFamily: "tnr"),
                  ),
                ),
                Row(
                  children: [
                    Container(
                      width: 100,
                      alignment: Alignment.center,
                      height: 30,
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.black, width: 1),
                      ),
                      child: Text(
                        textAlign: TextAlign.center,
                        "رقما",
                        style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                            fontFamily: "tnr"),
                      ),
                    ),
                    Container(
                      width: 100,
                      alignment: Alignment.center,
                      height: 30,
                      decoration: BoxDecoration(
                        border: Border(
                          bottom: BorderSide(color: Colors.black, width: 1),
                          top: BorderSide(color: Colors.black, width: 1),
                          right: BorderSide(color: Colors.black, width: 1),
                        ),
                      ),
                      child: Text(
                        textAlign: TextAlign.center,
                        "كتابا",
                        style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                            fontFamily: "tnr"),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        )
      ],
    ),
  );
}

Widget The_Final_SUM_Semester_Cell(String text, {int colSpan = 1}) {
  return Column(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Container(
        decoration: BoxDecoration(
          border: Border(
            bottom: BorderSide(color: Colors.black, width: 1),
            top: BorderSide(color: Colors.black, width: 2),
          ),
        ),
        width: 300,
        alignment: Alignment.center,
        height: 103,
        child: Text(
          textAlign: TextAlign.center,
          convertToArabicNumbers(text),
          style: TextStyle(
              fontSize: 14, fontWeight: FontWeight.bold, fontFamily: "tnr"),
        ),
      ),
      Row(
        children: [
          Container(
            width: 100,
            alignment: Alignment.center,
            height: 30,
            decoration: BoxDecoration(
              border: Border(
                bottom: BorderSide(color: Colors.black, width: 2),
                top: BorderSide(color: Colors.black, width: 1),
                left: BorderSide(color: Colors.black, width: 1),
              ),
            ),
            child: Text(
              textAlign: TextAlign.center,
              "رقما",
              style: TextStyle(
                  fontSize: 14, fontWeight: FontWeight.bold, fontFamily: "tnr"),
            ),
          ),
          Container(
            width: 100,
            alignment: Alignment.center,
            height: 30,
            decoration: BoxDecoration(
              border: Border(
                bottom: BorderSide(color: Colors.black, width: 2),
                top: BorderSide(color: Colors.black, width: 1),
                right: BorderSide(color: Colors.black, width: 1),
              ),
            ),
            child: Text(
              textAlign: TextAlign.center,
              "كتابةً",
              style: TextStyle(
                  fontSize: 14, fontWeight: FontWeight.bold, fontFamily: "tnr"),
            ),
          ),
        ],
      ),
    ],
  );
}

Widget buildDgree(
  String text, {
  bool isLeft = false,
  bool isRight = false,
  bool isBold = false,
  int passingMark = 100,
  double passingRatio = 1.0, // خليها double مثلاً 0.6 = 60%
  int? marks,
}) {
  double? mark = marks != null ? marks.toDouble() : null;

  // إذا passingRatio بين 0 و1 (مثلاً 0.6)
  // فالنسبة اللي تحسبها = passingMark * passingRatio
  double passingThreshold = passingMark * passingRatio;

  bool isFail = mark != null && mark < passingThreshold;

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
      textAlign: TextAlign.center,
      convertToArabicNumbers(text),
      style: TextStyle(
        fontSize: 13,
        fontWeight: isBold ? FontWeight.bold : FontWeight.normal,
        fontFamily: "tnr",
        color: isFail ? Colors.red : Colors.black,
      ),
    ),
  );
}

Widget buildSplitDgree({
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

        // استخراج العلامة
        double? mark = double.tryParse(item['mark'].toString());

        // استخراج القيم، إن لم تكن موجودة لا يعتبر راسب
        double? passingMark = item['passingMark']?.toDouble();
        double? passingRatio = item['passingRatio']?.toDouble();

        // التحقق من الرسوب فقط إذا كانت جميع القيم موجودة وصحيحة
        bool isFail = passingMark != null &&
            passingRatio != null &&
            mark != null &&
            mark < passingMark * passingRatio;

        return Container(
          width: item['width'].toDouble(),
          alignment: Alignment.center,
          decoration: BoxDecoration(
            border: (index != 0)
                ? Border(right: BorderSide(color: Colors.black, width: 2))
                : null,
          ),
          child: Text(
            textAlign: TextAlign.center,
            convertToArabicNumbers(item['text'].toString()),
            style: TextStyle(
              fontSize: (index != data.length - 1) ? 12 : 10,
              fontFamily: "tnr",
              fontWeight: FontWeight.bold,
              color:
                  isFail ? Colors.red : Colors.black, // 👈 اللون الافتراضي أسود
            ),
          ),
        );
      }).toList(),
    ),
  );
}

Widget buildTowDgreeMarks({
  required List<Map<dynamic, dynamic>> data,
  bool isLeft = false,
  bool isRight = false,
  bool isBold = false,
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

        // استخراج البيانات
        double? mark = double.tryParse(item['mark']?.toString() ?? '');
        double? passingMark = item['passingMark']?.toDouble();
        double? passingRatio = item['passingRatio']?.toDouble();

        bool isFail = false;
        if (passingMark != null && passingRatio != null && mark != null) {
          double threshold = passingMark * passingRatio;
          isFail = mark < threshold;
        }

        return Container(
          width: item['width'].toDouble(),
          alignment: Alignment.center,
          decoration: BoxDecoration(
            border: (index != 0)
                ? Border(right: BorderSide(color: Colors.black, width: 2))
                : null,
          ),
          child: Text(
            textAlign: TextAlign.center,
            convertToArabicNumbers(item['text'].toString()),
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: (index != 3) ? 12 : 11,
              fontFamily: "tnr",
              color: isFail ? Colors.red : Colors.black,
            ),
          ),
        );
      }).toList(),
    ),
  );
}

Widget buildTowDgreeMarksEnd({
  required List<Map<dynamic, dynamic>> data,
  bool isLeft = false,
}) {
  return Container(
    decoration: BoxDecoration(
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

        // استخراج القيم
        double? mark = double.tryParse(item['mark']?.toString() ?? '');
        double? passingMark = item['passingMark']?.toDouble();
        double? passingRatio = item['passingRatio']?.toDouble();

        // التحقق من الرسوب
        bool isFail = false;
        if (passingMark != null && passingRatio != null && mark != null) {
          double threshold = passingMark * passingRatio;
          isFail = mark < threshold;
        }

        return Container(
          width: item['width'].toDouble(),
          alignment: Alignment.center,
          decoration: BoxDecoration(
            border: (index != 0)
                ? Border(right: BorderSide(color: Colors.black, width: 2))
                : null,
          ),
          child: Text(
            textAlign: TextAlign.center,
            convertToArabicNumbers(item['text'].toString()),
            style: TextStyle(
              fontSize: (index != data.length - 1) ? 12 : 11,
              fontFamily: "tnr",
              fontWeight: FontWeight.bold,
              color: isFail ? Colors.red : Colors.black,
            ),
          ),
        );
      }).toList(),
    ),
  );
}

Widget buildTowDgree(String text,
    {bool isLeft = false, bool isRight = false, bool isBold = false}) {
  return Container(
    decoration: BoxDecoration(
      border: Border(
        right: BorderSide(color: Colors.black, width: 2),
        left: BorderSide(color: Colors.black, width: 2),
        bottom: BorderSide(color: Colors.black, width: 2),
      ),
    ),
    alignment: Alignment.center,
    height: 60,
    child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Expanded(
          child: Container(
            decoration: BoxDecoration(
              border: Border(
                left: BorderSide(color: Colors.black, width: 2),
              ),
            ),
            width: 30,
            alignment: Alignment.center,
            child: RotatedBox(
              quarterTurns: 3, // 1 = 90° / 2 = 180° / 3 = 270°
              child: Text(
                textAlign: TextAlign.center,
                convertToArabicNumbers(text),
                style: TextStyle(
                    fontWeight:
                        isBold == true ? FontWeight.bold : FontWeight.normal,
                    fontSize: 12,
                    fontFamily: "tnr"),
              ),
            ),
          ),
        ),
        Column(
          children: [
            Container(
              decoration: BoxDecoration(
                border: Border(
                  bottom: BorderSide(color: Colors.black, width: 2),
                ),
              ),
              width: 120,
              alignment: Alignment.center,
              height: 30,
              child: Text(
                textAlign: TextAlign.center,
                "المهارات الشفوية",
                style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    fontFamily: "tnr"),
              ),
            ),
            Container(
              alignment: Alignment.center,
              height: 28,
              child: Text(
                textAlign: TextAlign.center,
                "المهارات الكتابية",
                style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    fontFamily: "tnr"),
              ),
            )
          ],
        )
      ],
    ),
  );
}

Widget buildCellforAll(
  String text, {
  bool IsLeft = false,
  bool IsRight = false,
  bool IsTop = false,
  bool IsBottom = false,
  bool IsScale = false,
  double width = 50.0,
  double height = 50.0,
  double fontSize = 18.0,
  Alignment alignment = Alignment.center,
  EdgeInsets textPadding = EdgeInsets.zero, // 🆕 Padding مخصص للنص
}) {
  return Container(
    width: width,
    height: height,
    decoration: BoxDecoration(
      border: Border(
        left: IsLeft
            ? BorderSide(color: Colors.black, width: 2)
            : BorderSide.none,
        right: IsRight
            ? BorderSide(color: Colors.black, width: 2)
            : BorderSide.none,
        top:
            IsTop ? BorderSide(color: Colors.black, width: 2) : BorderSide.none,
        bottom: IsBottom
            ? BorderSide(color: Colors.black, width: 2)
            : BorderSide.none,
      ),
    ),
    alignment: alignment,
    padding: EdgeInsets.zero, // نترك الحاوية بدون padding
    child: Padding(
      padding: textPadding, // 🟢 نضيف padding حول النص فقط
      child: IsScale
          ? RotatedBox(
              quarterTurns: 3,
              child: Text(
                convertToArabicNumbers(text),
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: fontSize,
                  fontFamily: "tnr",
                  fontWeight: FontWeight.bold,
                ),
              ),
            )
          : Text(
              convertToArabicNumbers(text),
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: fontSize,
                fontFamily: "tnr",
                fontWeight: FontWeight.bold,
              ),
            ),
    ),
  );
}
