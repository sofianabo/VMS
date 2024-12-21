import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vms_school/Link/API/API.dart';
import 'package:vms_school/Link/API/AdminAPI/Students_APIs/AddStudentAttendenceAPI.dart';
import 'package:vms_school/Link/API/AdminAPI/Students_APIs/IncreaseAttendanceAPI.dart';
import 'package:vms_school/Link/Controller/AdminController/Students_Controllers/AdminStudentsAttendens.dart';
import 'package:vms_school/view/Admin/Students_Manager/StudentsAttendanceManagmentGrid.dart';
import 'package:vms_school/widgets/Admin_Students/DropDownStudentsAttendencemgmt.dart';

class StudentsAttendanceManagment extends StatefulWidget {
  StudentsAttendanceManagment({super.key});

  @override
  State<StudentsAttendanceManagment> createState() =>
      _StudentsAttendanceManagmentState();
}

class _StudentsAttendanceManagmentState
    extends State<StudentsAttendanceManagment> {
  @override
  void initState() {
    IncreaseAttendanceAPI(context).GetIncreaseAttendance();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    return Expanded(
        child: Column(
      children: [
        GetBuilder<Student_attendence_controller>(builder: (controller) {
          return Container(
            margin: EdgeInsets.only(left: 30.0, right: 30.0, top: 30.0),
            alignment: Alignment.center,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    DropDownStudentsAttendencemgmt(
                        title: "Grade", width: w / 5.0, type: "grade"),
                    DropDownStudentsAttendencemgmt(
                        title: "Class", width: w / 5.0, type: "class"),
                    DropDownStudentsAttendencemgmt(
                        title: "Division", width: w / 5.0, type: "class"),
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
                            await Addstudentattendenceapi.Addstudentattendence(
                                students: controller.students);
                          },
                          icon: Icon(Icons.file_upload_outlined,
                              size: 22, color: Get.theme.primaryColor)),
                    ),
                  ],
                ),
              ],
            ),
          );
        }),
        Expanded(
            child: Padding(
          padding: const EdgeInsets.only(top: 15.0),
          child: StudentsAttendanceManagmentGrid(),
        )),
      ],
    ));
  }
}
