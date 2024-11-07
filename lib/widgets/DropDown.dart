// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx/Controller/WidgetController/DropDownController.dart';

class DropDown extends StatelessWidget {
  double width;
  String title = "";
  List<String> options = [];

  DropDown(
      {super.key,
      required this.width,
      required this.title,
      required this.options});
  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;
    return GetBuilder<DropDownController>(builder: (cont) {
      return Container(
        width: width, //280
        height: 40,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          border: Border.all(color: Colors.grey),
        ),
        child: DropdownButton<String>(
          value: cont.selectedIndex,

          underline: const Text(""),
          icon: const Icon(Icons.arrow_drop_down),
          style: Get.theme.primaryTextTheme.titleMedium,

          onChanged: (newValue) {
            cont.selectval(newValue!);
          },
          items: [
            DropdownMenuItem<String>(
              value: "",
              enabled: false,
              child: Text(
                title,
                style: Get.theme.primaryTextTheme.titleMedium,
              ),
            ),
            ...cont.options.map<DropdownMenuItem<String>>((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(
                  value,
                  style: Get.theme.primaryTextTheme.bodySmall,
                ),
              );
            }).toList(),
          ],

          borderRadius: BorderRadius.circular(3),
          padding: const EdgeInsets.symmetric(
              horizontal: 16.0, vertical: 12.0), // إضافة بعض المسافة
        ),
      );
    });
  }
}
