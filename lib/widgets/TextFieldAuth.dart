// ignore_for_file: must_be_immutable, file_names

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TextFieldAuth extends StatelessWidget {
  TextFieldAuth(
      {super.key,
      required this.controller,
      this.width,
      this.hight,
      required this.hinttext,
      required this.autofill});
  TextEditingController controller = TextEditingController();
  String hinttext = "";
  Iterable<String> autofill;
  double? width;
  double? hight;
  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    return Container(
      color: Colors.white,
      margin: EdgeInsets.only(top: 5),
      width: width ?? w / 2.56,
      height: hight ?? 50,
      child: TextFormField(
        autofillHints: autofill,
        autofocus: true,
        controller: controller,
        style: TextStyle(color: Colors.black),
        decoration: InputDecoration(
          hintText: hinttext,
          hintStyle: const TextStyle(fontSize: 12, color: Colors.grey),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(5),
              borderSide:
                  BorderSide(color: Get.theme.colorScheme.primary, width: 2)),
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(5),
              borderSide: const BorderSide(color: Colors.grey)),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5),
          ),
        ),
      ),
    );
  }
}
