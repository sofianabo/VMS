// ignore_for_file: must_be_immutable, file_names

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LargeTextField extends StatelessWidget {
  LargeTextField({super.key, required this.controller, required this.hinttext});
  TextEditingController controller = TextEditingController();
  String hinttext = "";
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 5),
      width: 540,
      height: 150,
      child: TextFormField(
        controller: controller,
        decoration: InputDecoration(
          hintText: hinttext,
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide:
                  BorderSide(color: Get.theme.colorScheme.primary, width: 2)),
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: const BorderSide(color: Colors.grey)),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
      ),
    );
  }
}
