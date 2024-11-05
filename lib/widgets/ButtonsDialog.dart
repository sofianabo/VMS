// ignore_for_file: file_names, must_be_immutable

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ButtonDialog extends StatelessWidget {
  ButtonDialog(
      {super.key,
      required this.text,
      required this.onPressed,
      required this.color});
  final VoidCallback onPressed;
  Color color;
  String text;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      height: 40,
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(8)),
      child: MaterialButton(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
          onPressed: onPressed,
          color: color,
          child: Text(text, style: Get.theme.primaryTextTheme.headlineSmall)),
    );
  }
}
