import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vms_school/Link/API/AdminAPI/School/School_DropDown/DropdownDivisionAPI.dart';
import 'package:vms_school/Link/Controller/AdminController/Students_Controllers/ExamTableController.dart';
import 'package:vms_school/Link/Model/AdminModel/AllDivisionModel.dart';

class DropDownexamTable extends StatelessWidget {
  final double width;
  final String title;
  final String type; // تحديد نوع الـ DropDown
  final Color? color;

  const DropDownexamTable({
    Key? key,
    required this.title,
    this.color,
    required this.width,
    required this.type,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ExamTableController>(builder: (cont) {
      // القيمة الافتراضية تكون العنوان، وبالاعتماد على النوع نقوم بالتغيير عند الاختيار
      String selectedValue = "";

      // تحديد القيمة المختارة بناءً على النوع
      switch (type) {
        case 'type':
          selectedValue =
              cont.selectedExamType.isNotEmpty ? cont.selectedExamType : title;
          break;
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
          dropdownColor: Get.theme.cardColor,
          iconDisabledColor: Colors.grey,
          iconEnabledColor: Get.theme.cardColor,
          value: selectedValue,
          isExpanded: true,
          underline: const SizedBox(),
          icon: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Icon(Icons.arrow_drop_down , color: Get.theme.secondaryHeaderColor),
            ],
          ),
          style: Get.theme.textTheme.bodyMedium!.copyWith(fontSize: 14),
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
                style: Get.theme.textTheme.bodyMedium!.copyWith(
                  fontSize: 14,
                ),
              ),
            ),
            ..._getDropdownItems(cont,context),
          ],
          borderRadius: BorderRadius.circular(3),
        ),
      );
    });
  }

  List<DropdownMenuItem<String>> _getDropdownItems(
      ExamTableController cont, BuildContext context) {
    List<DropdownMenuItem<String>> items = [];

    switch (type) {
      case 'type':
        items.addAll(cont.examType.map((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Text(
              value,
              style: Get.theme.textTheme.bodyMedium!
                  .copyWith(fontSize: 14),
            ),
            onTap: () {},
          );
        }).toList());
        break;
      case 'class':
        items.addAll(cont.examClass.map((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Text(
              value,
              style: Get.theme.textTheme.bodyMedium!
                  .copyWith(fontSize: 14),
            ),
            onTap: () async {
              AllDivisionModel division = await Dropdowndivisionapi(context)
                  .Dropdowndivision(cont.examClass.indexOf(value));
                   cont.setAllDivision(division);
            },
          );
        }).toList());
        break;
      case 'division':
        items.addAll(cont.examDivision.map((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Text(
              value,
              style: Get.theme.textTheme.bodyMedium!
                  .copyWith(fontSize: 14),
            ),
          );
        }).toList());
        break;
    }

    return items;
  }
}
