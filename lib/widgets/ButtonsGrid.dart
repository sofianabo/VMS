// ignore_for_file: file_names, must_be_immutable

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ButtonsGrid extends StatelessWidget {
  ButtonsGrid(
      {super.key,
      required this.text,
      required this.onPressed,
      required this.color});
  final VoidCallback onPressed;
  Color color;
  String text;
  @override
  Widget build(BuildContext context) {
      double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;
    return Container(
      width: w/9.846,
      height: h/22.8,
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(8)),
      child: MaterialButton(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
          onPressed: onPressed,
          color: color,
          child: Text(text, style: Get.theme.primaryTextTheme.headlineSmall)),
    );
  }
}
