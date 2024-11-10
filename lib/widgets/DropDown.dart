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
    return GetBuilder<DropDownController>(builder: (cont) {
      return Container(
        padding: EdgeInsets.all(6.0),
        alignment: Alignment.centerLeft,
        width: width,
        height: 40,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          border: Border.all(color: Colors.grey),
        ),
        child: DropdownButton<String>(
          focusColor: Colors.white,
          dropdownColor: Colors.white,
          iconDisabledColor: Colors.grey,
          iconEnabledColor: Colors.black,
          value: cont.selectedIndex,

          underline: const Text(""),
          icon: Expanded(
            child: Row(
              children: [
                Spacer(),
                const Icon(Icons.arrow_drop_down),
              ],
            ),
          ),
          style: Get.theme.primaryTextTheme.titleMedium!.copyWith(
             fontSize: 14
          ),

          onChanged: (newValue) {
            cont.selectval(newValue!);
          },
          items: [
            DropdownMenuItem<String>(
              value: "",
              enabled: false,
              child: Text(
                title,
                style: Get.theme.primaryTextTheme.titleMedium!.copyWith(
                     fontSize: 14
                ),
              ),
            ),
            ...cont.options.map<DropdownMenuItem<String>>((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(
                  value,
                  style: Get.theme.primaryTextTheme.titleMedium!.copyWith(
                       fontSize: 14
                  ),
                ),
              );
            }).toList(),
          ],

          borderRadius: BorderRadius.circular(3),
        ),
      );
    });
  }
}
