import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx/Link/Controller/AdminController/Class_Mgmt_Controller.dart';

class DropDownClassMgmt extends StatelessWidget {
  final double width;
  final String title;
  final String type; // تحديد نوع الـ DropDown
  final Color? color;

  const DropDownClassMgmt({
    Key? key,
    required this.title,
    this.color,
    required this.width,
    required this.type,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ClassMgmtController>(builder: (cont) {
      // تعيين القيمة الافتراضية لـ selectedValue
      String selectedValue = title;

      switch (type) {
        case 'grade':
          selectedValue = cont.selectedClassIndex.isNotEmpty
              ? cont.selectedClassIndex
              : title;
          break;
        case 'session':
          selectedValue = cont.selectedDivisionIndex.isNotEmpty
              ? cont.selectedDivisionIndex
              : title;
          break;

        case 'classdiag':
          selectedValue = cont.selectedClassDiagIndex.isNotEmpty
              ? cont.selectedClassDiagIndex
              : title;
          break;
        case 'divisiondiag':
          selectedValue = cont.selectedDivisionDiagIndex.isNotEmpty
              ? cont.selectedDivisionDiagIndex
              : title;
          break;
        case 'admin':
          selectedValue = cont.selectedAdminDiagIndex.isNotEmpty
              ? cont.selectedAdminDiagIndex
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

  List<DropdownMenuItem<String>> _getDropdownItems(ClassMgmtController cont) {
    List<DropdownMenuItem<String>> items = [];

    switch (type) {
      case 'grade':
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
      case 'session':
        items.addAll(cont.listDivision.map((String value) {
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

      case 'classdiag':
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
      case 'divisiondiag':
        items.addAll(cont.listDivisionDiag.map((String value) {
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
      case 'admin':
        items.addAll(cont.listAdminDiag.map((String value) {
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
