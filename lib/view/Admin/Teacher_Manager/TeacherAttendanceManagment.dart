import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vms_school/Link/API/AdminAPI/Employees_APIs/Add_Employee_Attendence.dart';
import 'package:vms_school/Link/API/AdminAPI/Teacher_APIS/GetAllTeachersAPI.dart';
import 'package:vms_school/Link/API/AdminAPI/Teacher_APIS/IncreaseTeacherAttendenceAPI.dart';
import 'package:vms_school/Link/Controller/AdminController/Students_Controllers/Employeeecontroller.dart';
import 'package:vms_school/view/Admin/Teacher_Manager/TeacherAttendanceManagmentGrid.dart';
import 'package:vms_school/widgets/DropDown.dart';

class TeacherAttendanceManagment extends StatefulWidget {
  TeacherAttendanceManagment({super.key});

  @override
  State<TeacherAttendanceManagment> createState() =>
      _TeacherAttendanceManagmentState();
}

class _TeacherAttendanceManagmentState
    extends State<TeacherAttendanceManagment> {
  @override
  void initState() {
    super.initState();
    Increaseteacherattendenceapi.Increaseteacherattendence();
  }

  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    return GetBuilder<EmployeeController>(builder: (controller) {
      return Expanded(
          child: Column(
        children: [
          Container(
            margin: EdgeInsets.only(left: 30.0, right: 30.0, top: 30.0),
            alignment: Alignment.center,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 8.0),
                      child: DropDown(
                          title: "2024-2025",
                          width: w / 5.0,
                          options: ['abbb', 'bfddfvd']),
                    ),
                    DropDown(
                        title: "Class",
                        width: w / 5.0,
                        options: ['abbb', 'bfddfvd']),
                    DropDown(
                        title: "Division",
                        width: w / 5.0,
                        options: ['abbb', 'bfddfvd']),
                    Container(
                        width: w / 5.0,
                        child: Obx(() => Row(
                              children: [
                                Checkbox(
                                  shape: RoundedRectangleBorder(
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(4))),
                                  value: controller.allHolidayChecked.value,
                                  onChanged: (value) {
                                    controller.setAllAsHoliday(value!);
                                  },
                                ),
                                Text("Set All As a Holiday"),
                              ],
                            ))),
                    Container(
                      width: 40,
                      height: 40,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(5),
                          boxShadow: const [
                            BoxShadow(
                                color: Colors.black12,
                                offset: Offset(0, 2),
                                blurRadius: 1)
                          ]),
                      child: IconButton(
                          style: ButtonStyle(
                              backgroundColor:
                                  WidgetStatePropertyAll(Color(0xffF9F8FD)),
                              shape: WidgetStatePropertyAll(
                                  RoundedRectangleBorder(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(5))))),
                          onPressed: () async {
                            await Add_Employee_Attendence_API
                                .Add_Employee_Attendence(
                                    employees: controller.Employee);
                          },
                          icon: Icon(Icons.file_upload_outlined,
                              size: 22, color: Get.theme.primaryColor)),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Expanded(
              child: Padding(
            padding: const EdgeInsets.only(top: 15.0),
            child: TeacherAttendanceManagmentGrid(),
          )),
        ],
      ));
    });
  }
}
