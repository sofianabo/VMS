import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx/Link/API/AdminAPI/DropdownDivisionAPI.dart';
import 'package:getx/Link/API/AdminAPI/DropdownSessionsAPI.dart';
import 'package:getx/Link/API/AdminAPI/GetAllStudentAPI.dart';
import 'package:getx/Link/Controller/AdminController/AllStudentsController.dart';
import 'package:getx/Link/Controller/AdminController/Session_Controller.dart';
import 'package:getx/Link/Controller/WidgetController/DropDownController.dart';
import 'package:getx/Link/Model/AdminModel/AllDivisionModel.dart';

class DropDownAllStudents extends StatelessWidget {
  final double width;
  final String title;
  final String type;
  final Color? color;

  const DropDownAllStudents({
    Key? key,
    required this.title,
    this.color,
    required this.width,
    required this.type,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<Allstudentscontroller>(builder: (cont) {
      String selectedValue = "";

      switch (type) {
        case 'session':
          selectedValue = cont.selectedsessionIndex.isNotEmpty
              ? cont.selectedsessionIndex
              : title;

          break;
        case 'grade':
          selectedValue = cont.selectedgradeIndex.isNotEmpty
              ? cont.selectedgradeIndex
              : title;
          break;
        case 'class':
          selectedValue = cont.selectedclassIndex.isNotEmpty
              ? cont.selectedclassIndex
              : title;

          break;
        case 'division':
          selectedValue = cont.selecteddivisionIndex.isNotEmpty
              ? cont.selecteddivisionIndex
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
          isExpanded: true,
          underline: const SizedBox(),
          // تأكيد عدم وجود خط تحت الـ Dropdown
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
                  color: Colors.black, // لون العنوان
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
      Allstudentscontroller cont, BuildContext context) {
    List<DropdownMenuItem<String>> items = [];
    String sessionSelected = "";
    String gradeSelected = "";
    String classSelected = "";
    String divisionSelected = "";

    switch (type) {
      case 'session':
        items.addAll(cont.sessionlist.map((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Text(
              value,
              style: Get.theme.primaryTextTheme.titleMedium!
                  .copyWith(fontSize: 14),
            ),
            onTap: () async {
              sessionSelected = value;
              await Getallstudentapi(context).Getallstudent(
                  cont.sessionlist.indexOf(sessionSelected),
                  cont.gradelist.indexOf(gradeSelected),
                  cont.classlist.indexOf(classSelected),
                  cont.divisionlist.indexOf(divisionSelected));
            },
          );
        }).toList());
        break;
      case 'grade':
        items.addAll(cont.gradelist.map((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Text(
              value,
              style: Get.theme.primaryTextTheme.titleMedium!
                  .copyWith(fontSize: 14),
            ),
            onTap: () async {
              gradeSelected = value;
              await Getallstudentapi(context).Getallstudent(
                  cont.sessionlist.indexOf(sessionSelected),
                  cont.gradelist.indexOf(gradeSelected),
                  cont.classlist.indexOf(classSelected),
                  cont.divisionlist.indexOf(divisionSelected));
            },
          );
        }).toList());
        break;
      case 'class':
        items.addAll(cont.classlist.map((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Text(
              value,
              style: Get.theme.primaryTextTheme.titleMedium!
                  .copyWith(fontSize: 14),
            ),
            onTap: () async {
              classSelected = value;
              AllDivisionModel division = await Dropdowndivisionapi(context)
                  .Dropdowndivision(cont.classlist.indexOf(value));
              cont.setAllDivision(division);
              await Getallstudentapi(context).Getallstudent(
                  cont.sessionlist.indexOf(sessionSelected),
                  cont.gradelist.indexOf(gradeSelected),
                  cont.classlist.indexOf(classSelected),
                  cont.divisionlist.indexOf(divisionSelected));
              print(cont.classlist.indexOf(classSelected));
            },
          );
        }).toList());
        break;
      case 'division':
        items.addAll(cont.divisionlist.map((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Text(
              value,
              style: Get.theme.primaryTextTheme.titleMedium!
                  .copyWith(fontSize: 14),
            ),
            onTap: () async {
              divisionSelected = value;
              await Getallstudentapi(context).Getallstudent(
                  cont.sessionlist.indexOf(sessionSelected),
                  cont.gradelist.indexOf(gradeSelected),
                  cont.classlist.indexOf(classSelected),
                  cont.divisionlist.indexOf(divisionSelected));
            },
          );
        }).toList());
        break;
    }

    return items;
  }
}
