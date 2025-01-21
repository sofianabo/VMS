import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vms_school/Link/API/AdminAPI/School/SchoolTimeTableAPI.dart';
import 'package:vms_school/Link/API/AdminAPI/School/School_DropDown/DropdownDivisionAPI.dart';
import 'package:vms_school/Link/API/AdminAPI/School/School_Tables/DropDownExamCuriculmAPI.dart';
import 'package:vms_school/Link/Controller/AdminController/School_Controllers/Admin_School_Time.dart';
import 'package:vms_school/Link/Model/AdminModel/AllDivisionModel.dart';
import 'package:vms_school/Link/Model/AdminModel/DropDownCuriculmModel.dart';
import 'package:vms_school/Link/Model/AdminModel/SchoolTimeModel.dart';
import 'package:vms_school/view/Admin/School_Management/SchoolTimeTable.dart';

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
        case 'time':
          selectedValue = cont.selectedTimeLesson.isNotEmpty
              ? cont.selectedTimeLesson
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
              if (type == "class") {
                cont.setDevisionindex();
              }
              if (type == "time") {
                cont.setClassIndex();
                cont.setDevisionindex();
              }
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
              for (int i = 0; i < 5; i++)
                for (int j = 1; j < 8; j++) {
                  tableData[i][lessions[j]!] = "";
                }
              cont.subjectDialogList = [];

              AllDivisionModel division = await Dropdowndivisionapi(context)
                  .Dropdowndivision(cont.examClass.indexOf(value));
              cont.setAllDivision(division);
              DropDowmCuriculmModel curr =
                  await Dropdownexamcuriculmapi(context)
                      .Dropdownexamcuriculm(cont.examClass.indexOf(value));
              cont.setAllSubjectDialog(curr);
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
              for (int i = 0; i < 5; i++)
                for (int j = 1; j < 8; j++) {
                  String s = "No Lesson";
                  for (int k = 0; k < j; k++) s += " ";
                  tableData[i][lessions[j]!] = s;
                }
              m = await Schooltimetableapi(context).Schooltimetable(
                  cont.examDivision.indexOf(value), cont.timeLessonIndex);
            },
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
      case 'time':
        items.addAll(cont.timeLessonList.map((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Text(
              value,
              style: Get.theme.textTheme.bodyMedium!.copyWith(fontSize: 14),
            ),
            onTap: () {
              for (int i = 0; i < 5; i++)
                for (int j = 1; j < 8; j++) {
                  tableData[i][lessions[j]!] = "";
                }
            },
          );
        }).toList());
        break;
    }

    return items;
  }
}
