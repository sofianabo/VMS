// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:get/get.dart';

// ignore: must_be_immutable
class TextFormSearch extends StatelessWidget {
  TextEditingController controller;
  IconData suffixIcon;
  TextFormSearch(
      {super.key, required this.controller, required this.suffixIcon});

  @override
  Widget build(BuildContext context) {
       double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;
    return Form(
        child: TextFormField(
            controller: controller,
            decoration: InputDecoration(
              hintText: "Search",
              suffixIcon: Icon(
                suffixIcon,
                color: Get.theme.colorScheme.primary,
              ),
              focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(
                      color: Get.theme.colorScheme.primary, width: 2)),
              enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: const BorderSide(color: Colors.grey)),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            )));
  }
  // @override
  // void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  //   super.debugFillProperties(properties);
  //   properties.add(IntProperty('maxlength', maxlength));
  // }
}
