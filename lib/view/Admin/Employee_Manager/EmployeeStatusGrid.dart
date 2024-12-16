// ignore_for_file: must_be_immutable, file_names

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vms_school/Link/API/AdminAPI/Employees_APIs/EmployeeAttendenceByIdAPI.dart';
import 'package:vms_school/Link/API/AdminAPI/Employees_APIs/GetEmployeeAttendenceAPI.dart';
import 'package:vms_school/Link/Controller/AdminController/Employee_Controllers/EmployeeAttendenceController.dart';
import 'package:vms_school/Link/Controller/AdminController/Employee_Controllers/oneEmployeeAttendenceController.dart';
import 'package:vms_school/Link/Model/AdminModel/oneEmployeeAttendenceModel.dart';

import '../../../widgets/GridAnimation.dart';
import '../../../widgets/VMSAlertDialog.dart';

class EmpolyeeStatusGrid extends StatefulWidget {
  EmpolyeeStatusGrid({super.key});

  @override
  State<EmpolyeeStatusGrid> createState() => _EmpolyeeStatusGridState();
}

class _EmpolyeeStatusGridState extends State<EmpolyeeStatusGrid> {
  TextEditingController serch = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return GetBuilder<Employeeattendencecontroller>(builder: (controller) {
      return GridView.builder(
        padding: const EdgeInsets.only(top: 10, left: 40, right: 40),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 4,
            crossAxisSpacing: 20.0,
            mainAxisSpacing: 20.0,
            childAspectRatio: 1.4),
        itemCount: controller.employee.length, // عدد العناصر في الشبكة
        itemBuilder: (context, index) {
          return HoverScaleCard(
            child: GestureDetector(
              onTap: () async {
                oneEmployeeAttendenceModel empModel =
                    await Employeeattendencebyidapi(context)
                        .Employeeattendencebyid(controller.employee[index].id!);

                Get.dialog(GetBuilder<Oneemployeeattendencecontroller>(
                  builder: (oneControl) {
                    return VMSAlertDialog(
                      action: [Text("")],
                      contents: SizedBox(
                        width: 600,
                        height: Get.height,
                        child: Column(
                          children: [
                            SizedBox(
                              width: Get.width,
                              child: SingleChildScrollView(
                                child: DataTable(
                                  border: TableBorder.all(
                                    color: Get.theme.primaryColor,
                                    width: 1.0,
                                  ),
                                  columns: [
                                    DataColumn(
                                      label: Text(
                                        'Date',
                                        style: Get.theme.textTheme.bodyMedium,
                                      ),
                                    ),
                                    DataColumn(
                                      label: Text(
                                        'Status',
                                        style: Get.theme.textTheme.bodyMedium,
                                      ),
                                    ),
                                    DataColumn(
                                      label: Text(
                                        'Cause',
                                        style: Get.theme.textTheme.bodyMedium,
                                      ),
                                    ),
                                  ],
                                  rows: [
                                    // هنا نقوم بملئ الصفوف ببيانات الطالب
                                    for (var emp
                                        in empModel.employeeAttendance ?? [])
                                      DataRow(
                                        cells: [
                                          DataCell(
                                            Text(
                                              emp.date ?? 'N/A',
                                              style: Get
                                                  .theme.textTheme.bodyMedium,
                                            ),
                                          ),
                                          //status
                                          DataCell(
                                            Text(
                                              emp.status ?? 'N/A',
                                              style: Get
                                                  .theme.textTheme.bodyMedium,
                                            ),
                                          ),
                                          DataCell(
                                            Text(
                                              emp.cause ?? 'N/A',
                                              style: Get
                                                  .theme.textTheme.bodyMedium,
                                            ),
                                          ),
                                        ],
                                      ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      apptitle:
                          "${controller.employee[index].fullName} Attendence ",
                      subtitle: "none",
                    );
                  },
                ));
              },
              child: Container(
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      border: Border.all(color: Colors.grey, width: 0.5),
                      color: Colors.white,
                      boxShadow: const [
                        BoxShadow(
                            color: Colors.black26,
                            offset: Offset(0, 2),
                            blurRadius: 1)
                      ]),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: Text(
                                "${controller.employee[index].fullName}",
                                style: Get.theme.textTheme.bodyMedium!.copyWith(
                                    fontSize: 20, fontWeight: FontWeight.bold)),
                          ),
                          Image.asset("../../images/Rectangle66.png",
                              height: 100, width: 100)
                        ],
                      ),
                      Text("${controller.employee[index].status}",
                          style: Get.theme.textTheme.bodyMedium!.copyWith(
                              fontSize: 16,
                              color: controller.employee[index].status ==
                                      "Present"
                                  ? Color(0xff2F9742)
                                  : controller.employee[index].status ==
                                          "Truant"
                                      ? Color(0xff972F2F)
                                      : controller.employee[index].status ==
                                              "Vacation"
                                          ? Color(0xffB27671)
                                          : controller.employee[index].status ==
                                                  "Late"
                                              ? Color(0xff349393)
                                              : Color(0xff134B70))),
                      Text("${controller.employee[index].jobTitle}",
                          style: Get.theme.textTheme.bodyMedium!),
                    ],
                  )),
            ),
          );
        },
      );
    });
  }
}
