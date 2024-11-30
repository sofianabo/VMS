import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vms_school/Link/API/AdminAPI/Employees_APIs/Get_All_Employee_API.dart';
import 'package:vms_school/Link/Controller/AdminController/Students_Controllers/Employeeecontroller.dart';
import 'package:vms_school/view/Admin/Employee_Manager/EmployeeAttendenceManageGride.dart';

class EmployeeAttendanceManagment extends StatefulWidget {
  EmployeeAttendanceManagment({super.key});

  @override
  State<EmployeeAttendanceManagment> createState() => _EmployeeAttendanceManagmentState();
}

class _EmployeeAttendanceManagmentState extends State<EmployeeAttendanceManagment> {

  @override
  void initState() {
    super.initState();
    Get_All_Employee_API.Get_All_Employee();
  }

  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
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
              GetBuilder<EmployeeController>(builder: (controller) {
                return Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
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
                                        borderRadius:
                                            BorderRadius.all(Radius.circular(5))))),
                            onPressed: () {
                              print(controller.Employee);
                            },
                            icon: Icon(Icons.file_upload_outlined,
                                size: 22, color: Get.theme.primaryColor)),
                      ),
                    ],
                  );
                }
              ),
            ],
          ),
        ),
        Expanded(
            child: Padding(
          padding: const EdgeInsets.only(top: 15.0),
          child: EmployeesAttendanceManagmentGrid(),
        )),
      ],
    ));
  }
}
