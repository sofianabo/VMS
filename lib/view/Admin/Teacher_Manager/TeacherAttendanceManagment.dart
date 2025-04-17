import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vms_school/Link/API/AdminAPI/Employees_APIs/Add_Employee_Attendence.dart';
import 'package:vms_school/Link/API/AdminAPI/Teacher_APIS/IncreaseTeacherAttendenceAPI.dart';
import 'package:vms_school/Link/Controller/AdminController/Students_Controllers/Employeeecontroller.dart';
import 'package:vms_school/view/Admin/Teacher_Manager/TeacherAttendanceManagmentGrid.dart';
import 'package:vms_school/widgets/ButtonsDialog.dart';
import 'package:vms_school/widgets/Calender.dart';
import 'package:vms_school/widgets/TextFildWithUpper.dart';
import 'package:vms_school/widgets/VMSAlertDialog.dart';

class TeacherAttendanceManagment extends StatefulWidget {
  const TeacherAttendanceManagment({super.key});

  @override
  State<TeacherAttendanceManagment> createState() =>
      _TeacherAttendanceManagmentState();
}

class _TeacherAttendanceManagmentState
    extends State<TeacherAttendanceManagment> {
  @override
  void initState() {
    Get.find<EmployeeController>().AttendencetDate.value = DateTime.now();
    Get.find<EmployeeController>().allHolidayChecked.value = false;
    super.initState();
    Increaseteacherattendenceapi.Increaseteacherattendence(
        DateTime:
            Get.find<EmployeeController>().AttendencetDate.value.toString());
  }

  TextEditingController cuse = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return GetBuilder<EmployeeController>(builder: (controller) {
      return Expanded(
          child: Column(
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            margin: const EdgeInsets.only(left: 30.0, right: 30.0, top: 30.0),
            child: Wrap(
              alignment: WrapAlignment.spaceBetween,
              runAlignment: WrapAlignment.spaceBetween,
              runSpacing: 8.0,
              spacing: 8.0,
              children: [
                Wrap(
                  alignment: WrapAlignment.start,
                  runAlignment: WrapAlignment.start,
                  runSpacing: 8.0,
                  spacing: 8.0,
                  children: [
                    SizedBox(
                        width: 180,
                        child: Obx(() => Row(
                              children: [
                                Checkbox(
                                  shape: const RoundedRectangleBorder(
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(4))),
                                  value: controller.allHolidayChecked.value,
                                  onChanged: (value) {
                                    if (controller.teachers!.isEmpty ||
                                        controller.Isloading == true) {
                                    } else {
                                      if (value == true) {
                                        Get.dialog(VMSAlertDialog(
                                            action: [
                                              ButtonDialog(
                                                  text: "Done".tr,
                                                  onPressed: () {
                                                    controller.setAllAsHoliday(
                                                        value!, cuse.text);
                                                    Get.back();
                                                  },
                                                  color: Theme.of(context)
                                                      .primaryColor,
                                                  width: 65)
                                            ],
                                            contents: SizedBox(
                                              width: 500,
                                              child: Column(
                                                mainAxisSize: MainAxisSize.min,
                                                children: [
                                                  Textfildwithupper(
                                                      width: 250,
                                                      controller: cuse,
                                                      Uptext: "Cause".tr,
                                                      hinttext: "Cause".tr)
                                                ],
                                              ),
                                            ),
                                            apptitle:
                                                "Enter The Reason For Absence"
                                                    .tr,
                                            subtitle:
                                                "The reason for the absence of the all Teachers"
                                                    .tr));
                                      } else {
                                        controller.setAllAsHoliday(
                                            value!, null);
                                      }
                                    }
                                  },
                                ),
                                Text("Set All As a Holiday".tr),
                              ],
                            ))),
                    SetTeacherDateAttendence(
                      type: "teacher",
                      allowedDates: controller.AttendanceDateTeacher ??
                          ['${DateTime.now()}'],
                      width: 220,
                      enable: !controller.Isloading,
                    )
                  ],
                ),
                Container(
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                      color: Theme.of(context).cardColor,
                      borderRadius: BorderRadius.circular(5),
                      boxShadow: const [
                        BoxShadow(
                            color: Colors.black12,
                            offset: Offset(0, 2),
                            blurRadius: 1)
                      ]),
                  child: IconButton(
                      style: ButtonStyle(
                          backgroundColor: WidgetStatePropertyAll(
                              Theme.of(context).cardColor),
                          shape: WidgetStatePropertyAll(RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(5))))),
                      onPressed: () async {
                        if (controller.Isloading == false) {
                          if (controller.teachers!.isNotEmpty) {
                            await Add_Employee_Attendence_API
                                .Add_Employee_Attendence(
                                    Datetime: controller.AttendencetDate.value
                                        .toString(),
                                    employees: controller.Employees);
                          }
                        }
                      },
                      icon: Icon(Icons.file_upload_outlined,
                          size: 22, color: Theme.of(context).highlightColor)),
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
