// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:get/get.dart';

// ignore: must_be_immutable
class TextFormSearch extends StatelessWidget {
  TextEditingController controller;
  IconData suffixIcon;
  double radius;
  double? width;
  TextFormSearch(
      {super.key, required this.controller, required this.suffixIcon,required this.radius , this.width});

  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    return Container(
      alignment: Alignment.center,
      width: width!=null ? width :  w / 4.4137,
      height: 40,
      child: TextFormField(
          style: TextStyle(fontSize: 14),
          controller: controller,
          decoration: InputDecoration(
            hintText: "Search By Name",
            hintStyle: Get.theme.primaryTextTheme.titleMedium!
                .copyWith(fontSize: 12, color: Color(0xffB3B3B3)),
            suffixIcon: Icon(
              suffixIcon,
              color: Color(0xffB3B3B3),
              size: 16,
            ),
            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(radius),
                borderSide:
                    BorderSide(color: Get.theme.colorScheme.primary, width: 1)),
            enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(radius),
                borderSide: const BorderSide(color: Color(0xffB3B3B3))),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(radius),
            ),
          )),
    );
  }
}
