// ignore_for_file: file_names, must_be_immutable

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ButtonDialog extends StatelessWidget {
  ButtonDialog(
      {super.key,
      required this.text,
      required this.onPressed,
      required this.color,
      required this.width});
  final VoidCallback onPressed;
  Color color;
  String text;
  double width;
  @override
  Widget build(BuildContext context) {

    return Container(
      width: width,
      height: 40,
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(8)),
      child: MaterialButton(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
          onPressed: onPressed,
          color: color,
          child: Text(text, style: Get.theme.primaryTextTheme.headlineSmall!.copyWith(
            fontFamily: "Cairo"
          ))),
    );
  }
}
