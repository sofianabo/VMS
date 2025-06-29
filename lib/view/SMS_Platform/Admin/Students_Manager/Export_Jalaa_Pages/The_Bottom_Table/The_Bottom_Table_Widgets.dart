import 'package:flutter/material.dart';
import 'package:vms_school/view/SMS_Platform/Admin/Students_Manager/Export_Jalaa_Pages/Convert_Functions_For_All.dart';

Widget BottombuildCell(
  String text, {
  bool isLeft = false,
  bool isRight = false,
  bool isBold = false,
  double fontsize = 14,
}) {
  return Container(
    decoration: text != ""
        ? isLeft && !isRight
            ? BoxDecoration(
                border: Border(
                  left: BorderSide(color: Colors.black, width: 2),
                  bottom: BorderSide(color: Colors.black, width: 2),
                ),
              )
            : isRight && !isLeft
                ? BoxDecoration(
                    border: Border(
                      right: BorderSide(color: Colors.black, width: 2),
                      bottom: BorderSide(color: Colors.black, width: 2),
                    ),
                  )
                : isLeft && isRight
                    ? BoxDecoration(
                        border: Border(
                          right: BorderSide(color: Colors.black, width: 2),
                          left: BorderSide(color: Colors.black, width: 2),
                          bottom: BorderSide(color: Colors.black, width: 2),
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
              bottom: BorderSide(color: Colors.black, width: 2),
              left: BorderSide(color: Colors.black, width: 2),
            ),
          ),
    alignment: Alignment.center,
    height: 60,
    child: Text(
      convertToArabicNumbers(text),
      textAlign: TextAlign.center,
      style: TextStyle(
          fontSize: fontsize,
          fontFamily: "tnr",
          fontWeight: isBold ? FontWeight.bold : FontWeight.normal),
    ),
  );
}
