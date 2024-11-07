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
    return Container(
      width: w / 4.4137,
      height: h / 17.1,
      child: TextFormField(
          controller: controller,
          decoration: InputDecoration(
            hintText: "Search",
            hintStyle: Get.theme.primaryTextTheme.titleMedium,
            suffixIcon: Icon(
              suffixIcon,
              color: Get.theme.colorScheme.primary,
            ),
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
          )),
    );
  }
  // @override
  // void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  //   super.debugFillProperties(properties);
  //   properties.add(IntProperty('maxlength', maxlength));
  // }
}
