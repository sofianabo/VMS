import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vms_school/Link/API/AdminAPI/Employees_APIs/GetEmployeeAttendenceAPI.dart';
import 'package:vms_school/Link/Controller/AdminController/Employee_Controllers/EmployeeAttendenceController.dart';
import 'package:vms_school/Link/Controller/WidgetController/DropDown_Controllers/Sessions_DropDown_Controller.dart';
import 'package:vms_school/Link/Functions/Export_Exle_Function.dart';
import 'package:vms_school/Link/Functions/Export_PDF_Function.dart';
import 'package:vms_school/view/Admin/Employee_Manager/EmployeeStatusGrid.dart';
import 'package:vms_school/widgets/Admin/Admin_Employee/DropDownEmployeeAttendence.dart';
import 'package:vms_school/widgets/Admin/Admin_School/All_Screen_Sessions.dart';
import 'package:vms_school/widgets/Calender.dart';
import '../../../Icons_File/v_m_s__icons_icons.dart';
import '../../../widgets/TextFormSearch.dart';
import 'package:vms_school/Link/Model/AdminModel/EmployeeModels/AllEmployeeAttendeceModel.dart';

class EmployeeStatus extends StatefulWidget {
  const EmployeeStatus({super.key});

  @override
  State<EmployeeStatus> createState() => _EmployeeStatusState();
}

class _EmployeeStatusState extends State<EmployeeStatus> {
  TextEditingController search = TextEditingController();
  @override
  void initState() {
    Get.find<All_Screen_Sessions_Controller>().setSessionDefult();
    Get.find<Employeeattendencecontroller>().AttendencetDate.value =
        DateTime.now();
    Get.find<Employeeattendencecontroller>().JopTitleIndex = "";
    Getemployeeattendenceapi().Getemployeeattendence();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double w = Get.width;
    return Expanded(
        child: Column(
      children: [
        if (w > 769)
          Container(
            width: w,
            margin: const EdgeInsets.only(left: 30.0, right: 30.0, top: 30.0),
            child:
                GetBuilder<Employeeattendencecontroller>(builder: (controller) {
              return Wrap(
                alignment: WrapAlignment.spaceBetween,
                runAlignment: WrapAlignment.spaceBetween,
                crossAxisAlignment: WrapCrossAlignment.center,
                runSpacing: 10.0,
                spacing: 10.0,
                children: [
                  Wrap(
                    alignment: WrapAlignment.start,
                    runAlignment: WrapAlignment.start,
                    crossAxisAlignment: WrapCrossAlignment.center,
                    runSpacing: 10.0,
                    spacing: 10.0,
                    children: [
                      DropDownAllSessions(
                          API: "EmpState",
                          title: "session".tr,
                          width: 220,
                          type: "session"),
                      DropDownEmployeeAttendence(
                        type: "jobTitle",
                        title: "Job Title".tr,
                        width: 220,
                      ),
                      selectEmployeeDateAttendence(
                        width: 220,
                      ),
                      TextFormSearch(
                        click: () {
                          controller.clearFilter();
                        },
                        onchange: (value) {
                          controller.searchRequestByName(
                              value, controller.JopTitleIndex);
                        },
                        width: 220,
                        radius: 5,
                        controller: search,
                        suffixIcon:
                            search.text.isNotEmpty ? Icons.close : Icons.search,
                      ),
                    ],
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    spacing: 10.0,
                    children: [
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
                            style: const ButtonStyle(
                                shape: WidgetStatePropertyAll(
                                    RoundedRectangleBorder(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(5))))),
                            onPressed: () {
                              exportDataToPdf<Attendance>(
                                items: controller.filteredreemployees,
                                headers: [
                                  "Full Name".tr,
                                  "State".tr,
                                ],
                                fieldMappings: {
                                  "Full Name".tr: (reg) => reg.fullName ?? "",
                                  "State".tr: (reg) => reg.status!.tr ?? "",
                                },
                                fileName: "Employee Attendance".tr +
                                    '${DateTime.now().toIso8601String()}',
                              );
                            },
                            icon: Icon(VMS_Icons.pdf,
                                size: 18,
                                color: Theme.of(context)
                                    .textTheme
                                    .titleMedium!
                                    .color!)),
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
                            style: const ButtonStyle(
                                shape: WidgetStatePropertyAll(
                                    RoundedRectangleBorder(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(5))))),
                            onPressed: () {
                              exportDataToExcel<Attendance>(
                                items: controller.filteredreemployees,
                                headers: [
                                  "Full Name".tr,
                                  "State".tr,
                                ],
                                fieldMappings: {
                                  "Full Name".tr: (reg) => reg.fullName ?? "",
                                  "State".tr: (reg) => reg.status!.tr ?? "",
                                },
                                fileName: "Employee Attendance".tr +
                                    '${DateTime.now().toIso8601String()}',
                              );
                            },
                            icon: Icon(VMS_Icons.xl,
                                size: 18,
                                color: Theme.of(context)
                                    .textTheme
                                    .titleMedium!
                                    .color!)),
                      ),
                    ],
                  )
                ],
              );
            }),
          ),
        if (w <= 769)
          Container(
            width: w,
            margin: const EdgeInsets.only(left: 30.0, right: 30.0, top: 30.0),
            child:
                GetBuilder<Employeeattendencecontroller>(builder: (controller) {
              return SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  spacing: 8.0,
                  children: [
                    Row(
                      spacing: 8.0,
                      children: [
                        DropDownAllSessions(
                            API: "EmpState",
                            title: "session".tr,
                            width: 220,
                            type: "session"),
                        DropDownEmployeeAttendence(
                          type: "jobTitle",
                          title: "Job Title".tr,
                          width: 220,
                        ),
                        selectEmployeeDateAttendence(
                          width: 220,
                        ),
                        TextFormSearch(
                          click: () {
                            controller.clearFilter();
                          },
                          onchange: (value) {
                            controller.searchRequestByName(
                                value, controller.JopTitleIndex);
                          },
                          width: 220,
                          radius: 5,
                          controller: search,
                          suffixIcon: search.text.isNotEmpty
                              ? Icons.close
                              : Icons.search,
                        ),
                      ],
                    ),
                    Row(
                      children: [
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
                              style: const ButtonStyle(
                                  shape: WidgetStatePropertyAll(
                                      RoundedRectangleBorder(
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(5))))),
                              onPressed: () {
                                exportDataToExcel<Attendance>(
                                  items: controller.filteredreemployees,
                                  headers: [
                                    "Full Name".tr,
                                    "State".tr,
                                  ],
                                  fieldMappings: {
                                    "Full Name".tr: (reg) => reg.fullName ?? "",
                                    "State".tr: (reg) => reg.status!.tr ?? "",
                                  },
                                  fileName: "Employee Attendance".tr +
                                      '${DateTime.now().toIso8601String()}',
                                );
                              },
                              icon: Icon(VMS_Icons.xl,
                                  size: 18,
                                  color: Theme.of(context)
                                      .textTheme
                                      .titleMedium!
                                      .color!)),
                        ),
                        Padding(
                          padding:
                              const EdgeInsets.only(right: 10.0, left: 10.0),
                          child: Container(
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
                                style: const ButtonStyle(
                                    shape: WidgetStatePropertyAll(
                                        RoundedRectangleBorder(
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(5))))),
                                onPressed: () {
                                  exportDataToPdf<Attendance>(
                                    items: controller.filteredreemployees,
                                    headers: [
                                      "Full Name".tr,
                                      "State".tr,
                                    ],
                                    fieldMappings: {
                                      "Full Name".tr: (reg) =>
                                          reg.fullName ?? "",
                                      "State".tr: (reg) => reg.status!.tr ?? "",
                                    },
                                    fileName: "Employee Attendance".tr +
                                        '${DateTime.now().toIso8601String()}',
                                  );
                                },
                                icon: Icon(VMS_Icons.pdf,
                                    size: 18,
                                    color: Theme.of(context)
                                        .textTheme
                                        .titleMedium!
                                        .color!)),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              );
            }),
          ),
        Expanded(
            child: Padding(
          padding: const EdgeInsets.only(top: 15.0),
          child: EmpolyeeStatusGrid(),
        )),
      ],
    ));
  }
}
