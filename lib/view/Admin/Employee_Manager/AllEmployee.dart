import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vms_school/Link/API/AdminAPI/Employees_APIs/Get_All_Employee_API.dart';
import 'package:vms_school/Link/Controller/AdminController/Employee_Controllers/Add_Data_controller.dart';
import 'package:vms_school/Link/Controller/AdminController/Employee_Controllers/AllEmpolyeeController.dart';
import 'package:vms_school/Link/Controller/WidgetController/DropDown_Controllers/Sessions_DropDown_Controller.dart';
import 'package:vms_school/Link/Functions/Export_Exle_Function.dart';
import 'package:vms_school/Link/Functions/Export_PDF_Function.dart';
import 'package:vms_school/view/Admin/Employee_Manager/Add_Employee.dart';
import 'package:vms_school/view/Admin/Employee_Manager/Add_Full_Employee.dart';
import 'package:vms_school/view/Admin/Employee_Manager/AllEmployeeGrid.dart';
import 'package:vms_school/widgets/Admin/Admin_Employee/DropDownAllEmployee.dart';
import 'package:vms_school/widgets/Admin/Admin_School/All_Screen_Sessions.dart';
import 'package:vms_school/widgets/TextFormSearch.dart';
import '../../../Icons_File/v_m_s__icons_icons.dart';
import 'package:vms_school/Link/Model/AdminModel/EmployeeModels/All_Employee_Model.dart';

class AllEmployee extends StatefulWidget {
  const AllEmployee({super.key});

  @override
  State<AllEmployee> createState() => _AllEmployeeState();
}

class _AllEmployeeState extends State<AllEmployee> {
  TextEditingController search = TextEditingController();

  @override
  void initState() {
    Get.find<All_Screen_Sessions_Controller>().setSessionDefult();
    Get_All_Employee_API.Get_All_Employee();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return Expanded(
        child: Column(
      children: [
        if (screenWidth > 769)
          Container(
            width: screenWidth,
            margin: const EdgeInsets.only(left: 30.0, right: 30.0, top: 30.0),
            child: Wrap(
              alignment: WrapAlignment.spaceBetween,
              runSpacing: 10.0,
              spacing: 10.0,
              crossAxisAlignment: WrapCrossAlignment.center,
              runAlignment: WrapAlignment.start,
              children: [
                Wrap(
                  runSpacing: 10.0,
                  spacing: 10.0,
                  children: [
                    DropDownAllSessions(
                      title: "Session".tr,
                      width: 200,
                      type: "session",
                      API: "AllEmployee",
                    ),
                    Dropdownallemployee(
                        title: "Job Title".tr, width: 200, type: "jobTitle"),
                    GetBuilder<Allempolyeecontroller>(builder: (controller) {
                      return TextFormSearch(
                        click: () {
                          controller.clearFilter();
                          print("Filter cleared");
                        },
                        width: 408,
                        radius: 5,
                        controller: search,
                        onchange: (value) {
                          controller.searchRequestByName(
                              value, controller.jobTitleIndex);
                        },
                        suffixIcon:
                            search.text.isNotEmpty ? Icons.close : Icons.search,
                      );
                    }),
                  ],
                ),
                if (Get.find<Add_Data_controller>().roll != "observer")
                  if (Get.find<Add_Data_controller>().roll != "supervisor")
                    Row(
                      spacing: 10.0,
                      mainAxisSize: MainAxisSize.min,
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
                          child: PopupMenuButton(
                            enabled: Get.find<Add_Data_controller>().roll !=
                                "subAdmin",
                            style: ButtonStyle(
                                backgroundColor: WidgetStatePropertyAll(
                                    Get.find<Add_Data_controller>().roll ==
                                            "subAdmin"
                                        ? Get.theme.disabledColor
                                        : Theme.of(context).cardColor),
                                shape: const WidgetStatePropertyAll(
                                    RoundedRectangleBorder(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(5))))),
                            tooltip: "",
                            child: Icon(Icons.add,
                                size: 18,
                                color: Get.find<Add_Data_controller>().roll ==
                                        "subAdmin"
                                    ? Get.theme.disabledColor
                                    : Theme.of(context)
                                        .textTheme
                                        .titleMedium!
                                        .color!),
                            onSelected: (value) async {
                              if (value == "Add Employee".tr) {
                                Get.find<Allempolyeecontroller>().resertError();
                                Get.find<Allempolyeecontroller>().reset();
                                Get.dialog(
                                  AddEmployee(),
                                  barrierDismissible: false,
                                );
                              }
                              if (value == "Add Full Employee".tr) {
                                Get.find<Allempolyeecontroller>().reset();
                                Get.dialog(
                                  Add_Full_Employee(),
                                  barrierDismissible: false,
                                );
                              }
                            },
                            itemBuilder: (BuildContext context) =>
                                <PopupMenuEntry<String>>[
                              PopupMenuItem<String>(
                                  value: 'Add Employee'.tr,
                                  child: Text(
                                    'Add Employee'.tr,
                                  )),
                              PopupMenuItem<String>(
                                  value: 'Add Full Employee'.tr,
                                  child: Text('Add Full Employee'.tr)),
                            ],
                          ),
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
                                  shape: WidgetStatePropertyAll(
                                      RoundedRectangleBorder(
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(5))))),
                              onPressed: () {
                                exportDataToPdf<Employees>(
                                  items: Get.find<Allempolyeecontroller>()
                                      .filteredreemployees,
                                  headers: [
                                    "Name".tr,
                                    "Username".tr,
                                    "Job Title".tr,
                                    "Salary".tr,
                                    "Email".tr,
                                  ],
                                  fieldMappings: {
                                    "Name".tr: (reg) => reg.fullName ?? "",
                                    "Username".tr: (reg) => reg.userName ?? "",
                                    "Job Title".tr: (reg) =>
                                        reg.jobTitle!.tr ?? "",
                                    "Salary".tr: (reg) => reg.salary ?? "",
                                    "Email".tr: (reg) => reg.email ?? "",
                                  },
                                  fileName: "Employee".tr +
                                      ' ${DateTime.now().toIso8601String()}',
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
                              style: ButtonStyle(
                                  backgroundColor: WidgetStatePropertyAll(
                                      Theme.of(context).cardColor),
                                  shape: WidgetStatePropertyAll(
                                      RoundedRectangleBorder(
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(5))))),
                              onPressed: () {
                                exportDataToExcel<Employees>(
                                  items: Get.find<Allempolyeecontroller>()
                                      .filteredreemployees,
                                  headers: [
                                    "Name".tr,
                                    "Username".tr,
                                    "Job Title".tr,
                                    "Salary".tr,
                                    "Email".tr,
                                  ],
                                  fieldMappings: {
                                    "Name".tr: (reg) => reg.fullName ?? "",
                                    "Username".tr: (reg) => reg.userName ?? "",
                                    "Job Title".tr: (reg) =>
                                        reg.jobTitle!.tr ?? "",
                                    "Salary".tr: (reg) => reg.salary ?? "",
                                    "Email".tr: (reg) => reg.email ?? "",
                                  },
                                  fileName: "Employee".tr +
                                      ' ${DateTime.now().toIso8601String()}',
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
            ),
          ),
        if (screenWidth <= 769)
          Container(
            width: screenWidth,
            height: 40,
            margin: const EdgeInsets.only(left: 30.0, right: 30.0, top: 30.0),
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                spacing: 10.0,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    spacing: 18.0,
                    children: [
                      DropDownAllSessions(
                        title: "Session".tr,
                        width: 200,
                        type: "session",
                        API: "AllEmployee",
                      ),
                      Dropdownallemployee(
                          title: "Job Title".tr, width: 200, type: "jobTitle"),
                      GetBuilder<Allempolyeecontroller>(builder: (controller) {
                        return Padding(
                          padding: const EdgeInsets.only(left: 8.0),
                          child: TextFormSearch(
                            click: () {
                              controller.clearFilter();
                              print("Filter cleared");
                            },
                            width: 408,
                            radius: 5,
                            controller: search,
                            onchange: (value) {
                              controller.searchRequestByName(
                                  value, controller.jobTitleIndex);
                            },
                            suffixIcon: search.text.isNotEmpty
                                ? Icons.close
                                : Icons.search,
                          ),
                        );
                      }),
                    ],
                  ),
                  if (Get.find<Add_Data_controller>().roll != "observer")
                    if (Get.find<Add_Data_controller>().roll != "supervisor")
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
                            child: PopupMenuButton(
                              enabled: Get.find<Add_Data_controller>().roll !=
                                  "subAdmin",
                              style: ButtonStyle(
                                  backgroundColor: WidgetStatePropertyAll(
                                      Get.find<Add_Data_controller>().roll ==
                                              "subAdmin"
                                          ? Get.theme.disabledColor
                                          : Theme.of(context).cardColor),
                                  shape: const WidgetStatePropertyAll(
                                      RoundedRectangleBorder(
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(5))))),
                              tooltip: "",
                              child: Icon(Icons.add,
                                  size: 18,
                                  color: Get.find<Add_Data_controller>().roll ==
                                          "subAdmin"
                                      ? Get.theme.disabledColor
                                      : Theme.of(context)
                                          .textTheme
                                          .titleMedium!
                                          .color!),
                              onSelected: (value) async {
                                if (value == "Add Employee".tr) {
                                  Get.find<Allempolyeecontroller>()
                                      .resertError();
                                  Get.find<Allempolyeecontroller>().reset();
                                  Get.dialog(
                                    AddEmployee(),
                                    barrierDismissible: false,
                                  );
                                }
                                if (value == "Add Full Employee".tr) {
                                  Get.find<Allempolyeecontroller>().reset();
                                  Get.dialog(
                                    Add_Full_Employee(),
                                    barrierDismissible: false,
                                  );
                                }
                              },
                              itemBuilder: (BuildContext context) =>
                                  <PopupMenuEntry<String>>[
                                PopupMenuItem<String>(
                                    value: 'Add Employee'.tr,
                                    child: Text(
                                      'Add Employee'.tr,
                                    )),
                                PopupMenuItem<String>(
                                    value: 'Add Full Employee'.tr,
                                    child: Text('Add Full Employee'.tr)),
                              ],
                            ),
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
                                  style: ButtonStyle(
                                      backgroundColor: WidgetStatePropertyAll(
                                          Theme.of(context).cardColor),
                                      shape: WidgetStatePropertyAll(
                                          RoundedRectangleBorder(
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(5))))),
                                  onPressed: () {
                                    exportDataToPdf<Employees>(
                                      items: Get.find<Allempolyeecontroller>()
                                          .filteredreemployees,
                                      headers: [
                                        "Name".tr,
                                        "Username".tr,
                                        "Job Title".tr,
                                        "Salary".tr,
                                        "Email".tr,
                                      ],
                                      fieldMappings: {
                                        "Name".tr: (reg) => reg.fullName ?? "",
                                        "Username".tr: (reg) =>
                                            reg.userName ?? "",
                                        "Job Title".tr: (reg) =>
                                            reg.jobTitle!.tr ?? "",
                                        "Salary".tr: (reg) => reg.salary ?? "",
                                        "Email".tr: (reg) => reg.email ?? "",
                                      },
                                      fileName: "Employee".tr +
                                          ' ${DateTime.now().toIso8601String()}',
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
                                    shape: WidgetStatePropertyAll(
                                        RoundedRectangleBorder(
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(5))))),
                                onPressed: () {
                                  exportDataToExcel<Employees>(
                                    items: Get.find<Allempolyeecontroller>()
                                        .filteredreemployees,
                                    headers: [
                                      "Name".tr,
                                      "Username".tr,
                                      "Job Title".tr,
                                      "Salary".tr,
                                      "Email".tr,
                                    ],
                                    fieldMappings: {
                                      "Name".tr: (reg) => reg.fullName ?? "",
                                      "Username".tr: (reg) =>
                                          reg.userName ?? "",
                                      "Job Title".tr: (reg) =>
                                          reg.jobTitle!.tr ?? "",
                                      "Salary".tr: (reg) => reg.salary ?? "",
                                      "Email".tr: (reg) => reg.email ?? "",
                                    },
                                    fileName: "Employee".tr +
                                        ' ${DateTime.now().toIso8601String()}',
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
              ),
            ),
          ),
        Expanded(
            child: Padding(
          padding: const EdgeInsets.only(top: 15.0),
          child: AllEmployeeGrid(),
        )),
      ],
    ));
  }
}
