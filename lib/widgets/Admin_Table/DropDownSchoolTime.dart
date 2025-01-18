import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vms_school/Link/API/AdminAPI/School/SchoolTimeTableAPI.dart';
import 'package:vms_school/Link/API/AdminAPI/School/School_DropDown/DropdownDivisionAPI.dart';
import 'package:vms_school/Link/API/AdminAPI/School/School_Tables/DropDownExamCuriculmAPI.dart';
import 'package:vms_school/Link/Controller/AdminController/School_Controllers/Admin_School_Time.dart';
import 'package:vms_school/Link/Model/AdminModel/AllDivisionModel.dart';
import 'package:vms_school/Link/Model/AdminModel/DropDownCuriculmModel.dart';

class DropDownSchoolTime extends StatelessWidget {
  final double width;
  final String title;
  final String type; // تحديد نوع الـ DropDown
  final Color? color;

  const DropDownSchoolTime({
    super.key,
    required this.title,
    this.color,
    required this.width,
    required this.type,
  });

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
        case 'classDialog':
          selectedValue = cont.selectedClassDialog.isNotEmpty
              ? cont.selectedClassDialog
              : title;
          break;
        case 'divisionDialog':
          selectedValue = cont.selectedDivisionDialog.isNotEmpty
              ? cont.selectedDivisionDialog
              : title;
          break;
        case 'subjectDialog':
          selectedValue = cont.selectedSubjectDialog.isNotEmpty
              ? cont.selectedSubjectDialog
              : title;
          break;
        case 'teacherDialog':
          selectedValue = cont.selectedTeacherDialog.isNotEmpty
              ? cont.selectedTeacherDialog
              : title;
          break;
      }

      return Container(
        padding: const EdgeInsets.all(6.0),
        alignment: Alignment.centerLeft,
        width: width,
        height: 40,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          border: Border.all(color: color ?? const Color(0xffD9D9D9)),
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
              Icon(Icons.arrow_drop_down,
                  color: Get.theme.secondaryHeaderColor),
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
            ..._getDropdownItems(cont, context),
          ],
          borderRadius: BorderRadius.circular(3),
        ),
      );
    });
  }

  List<DropdownMenuItem<String>> _getDropdownItems(
      AdminSchoolTimeController cont, BuildContext context) {
    List<DropdownMenuItem<String>> items = [];

    switch (type) {
      case 'class':
        items.addAll(cont.examClass.map((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Text(
              value,
              style: Get.theme.textTheme.bodyMedium!.copyWith(fontSize: 14),
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
              style: Get.theme.textTheme.bodyMedium!.copyWith(fontSize: 14),
            ),
            onTap: () async {
              await Schooltimetableapi(context).Schooltimetable(
                  cont.examDivision.indexOf(cont.selectedExamDivision));
              },
          );
        }).toList());
        break;
      case 'classDialog':
        items.addAll(cont.classDialogList.map((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Text(
              value,
              style: Get.theme.textTheme.bodyMedium!.copyWith(fontSize: 14),
            ),
            onTap: () async {
              AllDivisionModel division = await Dropdowndivisionapi(context)
                  .Dropdowndivision(cont.classDialogList.indexOf(value));
              cont.setAllDivisionDialog(division);
              DropDowmCuriculmModel curr =
                  await Dropdownexamcuriculmapi(context).Dropdownexamcuriculm(
                      cont.classDialogList.indexOf(value));
              cont.setAllSubjectDialog(curr);
            },
          );
        }).toList());
        break;
      case 'divisionDialog':
        items.addAll(cont.divisionDialogList.map((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Text(
              value,
              style: Get.theme.textTheme.bodyMedium!.copyWith(fontSize: 14),
            ),
          );
        }).toList());
        break;
      case 'teacherDialog':
        items.addAll(cont.teacherDialogList.map((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Text(
              value,
              style: Get.theme.textTheme.bodyMedium!.copyWith(fontSize: 14),
            ),
          );
        }).toList());
        break;
      case 'subjectDialog':
        items.addAll(cont.subjectDialogList.map((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Text(
              value,
              style: Get.theme.textTheme.bodyMedium!.copyWith(fontSize: 14),
            ),
          );
        }).toList());
        break;
    }

    return items;
  }
}
