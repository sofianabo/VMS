import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx/Link/Controller/AdminController/Class_Mgmt_Controller.dart';

class DropDownClassMgmt extends StatelessWidget {
  final double width;
  final String title;
  final String type;
  final String? selectedValue; // إضافة هذه القيمة
  final Color? color;

  const DropDownClassMgmt({
    Key? key,
    required this.title,
    this.color,
    required this.width,
    required this.type,
    this.selectedValue,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ClassMgmtController>(builder: (cont) {
      String currentValue = selectedValue ?? title;

      switch (type) {
        case 'grade':
          currentValue = cont.selectedgradeIndex.isNotEmpty
              ? cont.selectedgradeIndex
              : title;
          break;
        case 'session':
          currentValue = cont.selectedsessionIndex.isNotEmpty
              ? cont.selectedsessionIndex
              : title;
          break;

        case 'gradediag':
          currentValue = cont.selectedgradeDiagIndex.isNotEmpty
              ? cont.selectedgradeDiagIndex
              : title;
          break;

        case 'sessiondag':
          currentValue = cont.selectedsessionDiagIndex.isNotEmpty
              ? cont.selectedsessionDiagIndex
              : title;
          break;

        case 'admin':
          currentValue = cont.selectedAdminDiagIndex.isNotEmpty
              ? cont.selectedAdminDiagIndex
              : title;
          break;

        case 'editeGrade':
          currentValue =
              cont.editeGradeIndexs.isNotEmpty ? cont.editeGradeIndexs : title;
          break;
        case 'editeSession':
          currentValue = cont.editeSessionIndexs.isNotEmpty
              ? cont.editeSessionIndexs
              : title;
          break;
        case 'editeAdmin':
          currentValue =
              cont.editeAdminIndexs.isNotEmpty ? cont.editeAdminIndexs : title;
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

  List<DropdownMenuItem<String>> _getDropdownItems(ClassMgmtController cont) {
    List<DropdownMenuItem<String>> items = [];

    switch (type) {
      case 'grade':
        items.addAll(cont.listgradeNormal.map((String value) {
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
        items.addAll(cont.listsessionNormal.map((String value) {
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

      case 'gradediag':
        items.addAll(cont.listgradeDiag.map((String value) {
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
      case 'sessiondag':
        items.addAll(cont.listsessionDiag.map((String value) {
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

      case 'editeGrade':
        items.addAll(cont.editeGrade.map((String value) {
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

      case 'editeSession':
        items.addAll(cont.editeSession.map((String value) {
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

      case 'editeAdmin':
        items.addAll(cont.editeAdmin.map((String value) {
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
