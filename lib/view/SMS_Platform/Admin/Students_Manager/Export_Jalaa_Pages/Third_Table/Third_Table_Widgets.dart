import 'package:flutter/material.dart';
import 'package:vms_school/view/SMS_Platform/Admin/Students_Manager/Export_Jalaa_Pages/Convert_Functions_For_All.dart';

Widget buildDgreeHasHight(
  String text, {
  bool isRight = false,
  double hight = 30,
  AlignmentGeometry Alignment = Alignment.center,
}) {
  return Container(
    decoration: isRight
        ? BoxDecoration(
            border: Border(
              right: BorderSide(color: Colors.black, width: 2),
              left: BorderSide(color: Colors.black, width: 2),
              bottom: BorderSide(color: Colors.black, width: 2),
            ),
          )
        : BoxDecoration(
            border: Border(
              left: BorderSide(color: Colors.black, width: 2),
              bottom: BorderSide(color: Colors.black, width: 2),
            ),
          ),
    alignment: Alignment,
    height: hight,
    child: Padding(
      padding: const EdgeInsets.only(right: 8),
      child: Text(
        convertToArabicNumbers(text),
        textAlign: TextAlign.center,
        style: TextStyle(
            fontSize: 14, fontFamily: "tnr", fontWeight: FontWeight.bold),
      ),
    ),
  );
}

Widget buildDgreeHasHightWithSpace(
  String text,
  String Secondtext, {
  bool isRight = false,
  double hight = 30,
  AlignmentGeometry Alignment = Alignment.center,
}) {
  return Container(
    decoration: isRight
        ? BoxDecoration(
            border: Border(
              right: BorderSide(color: Colors.black, width: 2),
              left: BorderSide(color: Colors.black, width: 2),
              bottom: BorderSide(color: Colors.black, width: 2),
            ),
          )
        : BoxDecoration(
            border: Border(
              left: BorderSide(color: Colors.black, width: 2),
              bottom: BorderSide(color: Colors.black, width: 2),
            ),
          ),
    alignment: Alignment,
    height: hight,
    child: Padding(
      padding: const EdgeInsets.only(right: 8, left: 40.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            convertToArabicNumbers(text),
            textAlign: TextAlign.center,
            style: TextStyle(
                fontSize: 14, fontFamily: "tnr", fontWeight: FontWeight.bold),
          ),
          Text(
            convertToArabicNumbers(Secondtext),
            textAlign: TextAlign.center,
            style: TextStyle(
                fontSize: 14, fontFamily: "tnr", fontWeight: FontWeight.bold),
          ),
        ],
      ),
    ),
  );
}
