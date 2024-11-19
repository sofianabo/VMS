import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx/Link/Controller/AdminController/DropDownDivisions_Controller.dart';

class DropDownDivisionMgmt extends StatelessWidget {
  final double width;
  final String title;
  final String type;
  final String? selectedValue; // إضافة هذه القيمة
  final Color? color;

  const DropDownDivisionMgmt({
    Key? key,
    required this.title,
    this.color,
    required this.width,
    required this.type,
    this.selectedValue,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<DropdownDivisions_Controller>(builder: (cont) {
      String currentValue = selectedValue ?? title;

      switch (type) {
        case 'session':
          currentValue = cont.selectSessionIndex.isNotEmpty
              ? cont.selectSessionIndex
              : title;
          break;

        case 'class':
          currentValue =
              cont.selectClassIndex.isNotEmpty ? cont.selectClassIndex : title;
          break;

        case 'classDiag':
          currentValue = cont.selectClassDiagIndex.isNotEmpty
              ? cont.selectClassDiagIndex
              : title;
          break;

        default:
          break;
      }

      return Container(
        padding: EdgeInsets.all(6.0),
        alignment: Alignment.centerLeft,
        width: width,
        height: 40,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          border: Border.all(color: color ?? Color(0xffD9D9D9)),
        ),
        child: DropdownButton<String>(
          focusColor: Colors.white,
          dropdownColor: Colors.white,
          iconDisabledColor: Colors.grey,
          iconEnabledColor: Colors.black,
          value: currentValue,
          isExpanded: true,
          underline: const SizedBox(),
          icon: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              const Icon(Icons.arrow_drop_down),
            ],
          ),
          style: Get.theme.primaryTextTheme.titleMedium!.copyWith(fontSize: 14),
          onChanged: (newValue) {
            if (newValue != null) {
              cont.selectIndex(type, newValue);
            }
          },
          items: [
            DropdownMenuItem<String>(
              value: title,
              enabled: false,
              child: Text(
                title,
                style: Get.theme.primaryTextTheme.titleMedium!.copyWith(
                  fontSize: 14,
                  color: Colors.black,
                ),
              ),
            ),
            ..._getDropdownItems(cont),
          ],
          borderRadius: BorderRadius.circular(3),
        ),
      );
    });
  }

  List<DropdownMenuItem<String>> _getDropdownItems(
      DropdownDivisions_Controller cont) {
    List<DropdownMenuItem<String>> items = [];

    switch (type) {
      case 'session':
        items.addAll(cont.listSession.map((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Text(
              value,
              style: Get.theme.primaryTextTheme.titleMedium!
                  .copyWith(fontSize: 14),
            ),
          );
        }).toList());
        break;
      case 'class':
        items.addAll(cont.listClass.map((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Text(
              value,
              style: Get.theme.primaryTextTheme.titleMedium!
                  .copyWith(fontSize: 14),
            ),
          );
        }).toList());
        break;

      case 'classDiag':
        items.addAll(cont.listClassDiag.map((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Text(
              value,
              style: Get.theme.primaryTextTheme.titleMedium!
                  .copyWith(fontSize: 14),
            ),
          );
        }).toList());
        break;
    }

    return items;
  }
}
