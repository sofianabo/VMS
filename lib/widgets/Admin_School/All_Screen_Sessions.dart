import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vms_school/Link/API/AdminAPI/Employees_APIs/Get_All_Employee_API.dart';
import 'package:vms_school/Link/API/AdminAPI/School/School_DropDown/DropdownClassesAPI.dart';
import 'package:vms_school/Link/API/AdminAPI/School/School_Screen_APIs/Class_API/Get_All_Classes.dart';
import 'package:vms_school/Link/API/AdminAPI/School/School_Screen_APIs/Curriculm_API/Get_All_Curriculm.dart';
import 'package:vms_school/Link/API/AdminAPI/School/School_Screen_APIs/Division_API/Get_All_Division.dart';
import 'package:vms_school/Link/API/AdminAPI/Students_APIs/GetAllStudentAPI.dart';
import 'package:vms_school/Link/API/AdminAPI/Students_APIs/StudentAttendenceAPI.dart';
import 'package:vms_school/Link/API/AdminAPI/Teacher_APIS/GetAllTeachersAPI.dart';
import 'package:vms_school/Link/Controller/WidgetController/Sessions_DropDown_Controller.dart';

class DropDownAllSessions extends StatelessWidget {
  final double width;
  final String title;
  final String API;
  final String type;
  final Color? color;

  const DropDownAllSessions({
    Key? key,
    required this.title,
    required this.API,
    this.color,
    required this.width,
    required this.type,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<All_Screen_Sessions_Controller>(builder: (cont) {
      String selectedValue = "";

      switch (type) {
        case 'session':
          selectedValue = cont.selectedsessionIndex.isNotEmpty
              ? cont.selectedsessionIndex
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
          icon: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              const Icon(Icons.arrow_drop_down),
            ],
          ),
          style: Get.theme.textTheme.bodyMedium!.copyWith(fontSize: 14),
          onChanged: (newValue) {
            if (newValue != null) {
              cont.selectIndex(type, newValue);
              cont.setsessionid(cont.sessions!.sessions!
                  .firstWhere((session) => session.year == newValue)
                  .id);
              switch (API) {
                case 'AllStudents':
                  Getallstudentapi.Getallstudent(sessionID: cont.sessionId);
                  break;
                case 'TeacherManagement':
                  Getallteachersapi.Getallteachers();
                  break;
                case 'AllEmployee':
                  Get_All_Employee_API.Get_All_Employee();
                  break;
                case 'class':
                  Get_All_Classes_API(context)
                      .Get_All_Classes(sessionID: cont.sessionId);
                  break;
                case 'division':
                  Get_All_Division_API(context)
                      .Get_All_Division(sessionId: cont.sessionId);
                  break;
                case 'StudentState':
                  Studentattendenceapi(context)
                      .Studentattendence(sessionID: cont.sessionId);
                  break;
              }
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
      All_Screen_Sessions_Controller cont) {
    List<DropdownMenuItem<String>> items = [];

    switch (type) {
      case 'session':
        items.addAll(cont.sessionlist.map((String value) {
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
