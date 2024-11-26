import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vms_school/Link/Controller/AdminController/Admin_School_Time.dart';

class DropDownSchoolTime extends StatelessWidget {
  final double width;
  final String title;
  final String type; // تحديد نوع الـ DropDown
  final Color? color;

  const DropDownSchoolTime({
    Key? key,
    required this.title,
    this.color,
    required this.width,
    required this.type,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AdminSchoolTimeController>(builder: (cont) {
      // تعيين القيمة الافتراضية لـ selectedValue
      String selectedValue = title;

      switch (type) {
        case 'class':
          selectedValue = cont.selectedExamClass.isNotEmpty
              ? cont.selectedExamClass
              : title;
          break;
        case 'division':
          selectedValue = cont.selectedExamDivision.isNotEmpty
              ? cont.selectedExamDivision
              : title;
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
          value: selectedValue,
          // استخدم selectedValue مباشرة
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
      AdminSchoolTimeController cont) {
    List<DropdownMenuItem<String>> items = [];

    switch (type) {
      case 'class':
        items.addAll(cont.examClass.map((String value) {
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
      case 'division':
        items.addAll(cont.examDivision.map((String value) {
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
