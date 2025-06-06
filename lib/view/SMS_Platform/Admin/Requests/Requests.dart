import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vms_school/Icons_File/v_m_s__icons_icons.dart';
import 'package:vms_school/Link/API/AdminAPI/Students/RequestsAPI/RequestsAPI.dart';
import 'package:vms_school/Link/Controller/AdminController/Students_Controllers/RequestsController.dart';
import 'package:vms_school/Link/Functions/Export_Exle_Function.dart';
import 'package:vms_school/Link/Functions/Export_PDF_Function.dart';
import 'package:vms_school/Link/Model/AdminModel/Students_Models/RequestsModel.dart';
import 'package:vms_school/view/SMS_Platform/Admin/Requests/RequestsGrid.dart';
import 'package:vms_school/view/Both_Platform/widgets/Admin/Admin_Requests/DropDownRequestEnroll.dart';
import 'package:vms_school/view/Both_Platform/widgets/Calender.dart';
import 'package:vms_school/view/Both_Platform/widgets/TextFormSearch.dart';

class Requests extends StatefulWidget {
  const Requests({super.key});

  @override
  State<Requests> createState() => _RequestsState();
}

class _RequestsState extends State<Requests> {
  TextEditingController search = TextEditingController();
  @override
  void initState() {
    Get.find<Requestscontroller>().InitialRequests();
    GetAllRequestsapi(context).GetAllRequests();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return Expanded(
        child: Column(
      children: [
        if (screenWidth > 769)
          GetBuilder<Requestscontroller>(builder: (controller) {
            return Container(
              width: Get.width,
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
                      Dropdownrequestenroll(
                          isLoading: false,
                          title: "Status".tr,
                          width: 200,
                          type: "status"),
                      selectDateRequest(
                        width: 200,
                      ),
                      TextFormSearch(
                        click: () {
                          controller.clearName();
                        },
                        onchange: (value) {
                          controller.searchByName(value, controller.statusindex,
                              controller.filterDate);
                        },
                        radius: 5,
                        width: 408,
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
                              exportDataToExcel<Registration>(
                                items: controller.filteredregistration,
                                headers: [
                                  "Guardian Name".tr,
                                  "Guardian Email".tr,
                                  "Guardian Mobile".tr,
                                  "Guardian National ID".tr,
                                  "Student Name".tr,
                                  "Student Class".tr,
                                  "Previous Class".tr,
                                  "Request Date".tr,
                                  "Request State".tr,
                                ],
                                fieldMappings: {
                                  "Guardian Name".tr: (reg) =>
                                      reg.guardian?.name ?? "",
                                  "Guardian Email".tr: (reg) =>
                                      reg.guardian?.email ?? "",
                                  "Guardian Mobile".tr: (reg) =>
                                      reg.guardian?.phone?.toString() ?? "",
                                  "Guardian National ID".tr: (reg) =>
                                      reg.guardian?.nationalId ?? "",
                                  "Student Name".tr: (reg) =>
                                      reg.student?.name ?? "",
                                  "Student Class".tr: (reg) =>
                                      reg.student?.clas ?? "",
                                  "Previous Class".tr: (reg) =>
                                      reg.student?.previousClass?.toString() ??
                                      "",
                                  "Request Date".tr: (reg) =>
                                      reg.date?.toString() ?? "",
                                  "Request State".tr: (reg) =>
                                      reg.type!.tr ?? "",
                                },
                                fileName:
                                    'registrations_export_${DateTime.now().toIso8601String()}',
                              );
                            },
                            icon: Icon(VMS_Icons.xl,
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
                              exportDataToPdf<Registration>(
                                items: controller.filteredregistration,
                                headers: [
                                  "Guardian Name".tr,
                                  "Guardian Email".tr,
                                  "Guardian Mobile".tr,
                                  "Guardian National ID".tr,
                                  "Student Name".tr,
                                  "Student Class".tr,
                                  "Previous Class".tr,
                                  "Request Date".tr,
                                  "Request State".tr,
                                ],
                                fieldMappings: {
                                  "Guardian Name".tr: (reg) =>
                                      reg.guardian?.name ?? "",
                                  "Guardian Email".tr: (reg) =>
                                      reg.guardian?.email ?? "",
                                  "Guardian Mobile".tr: (reg) =>
                                      reg.guardian?.phone?.toString() ?? "",
                                  "Guardian National ID".tr: (reg) =>
                                      reg.guardian?.nationalId ?? "",
                                  "Student Name".tr: (reg) =>
                                      reg.student?.name ?? "",
                                  "Student Class".tr: (reg) =>
                                      reg.student?.clas ?? "",
                                  "Previous Class".tr: (reg) =>
                                      reg.student?.previousClass?.toString() ??
                                      "",
                                  "Request Date".tr: (reg) =>
                                      reg.date?.toString() ?? "",
                                  "Request State".tr: (reg) =>
                                      reg.type!.tr ?? "",
                                },
                                fileName:
                                    'registrations_export_${DateTime.now().toIso8601String()}',
                              );
                            },
                            icon: Icon(VMS_Icons.pdf,
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
            );
          }),
        if (screenWidth <= 769)
          GetBuilder<Requestscontroller>(builder: (controller) {
            return SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                spacing: 10.0,
                children: [
                  Dropdownrequestenroll(
                      isLoading: false,
                      title: "Status".tr,
                      width: 200,
                      type: "status"),
                  Padding(
                    padding: const EdgeInsets.only(left: 10.0),
                    child: selectDateRequest(
                      width: 200,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 10.0),
                    child: TextFormSearch(
                      click: () {
                        controller.clearName();
                      },
                      onchange: (value) {
                        controller.searchByName(value, controller.statusindex,
                            controller.filterDate);
                      },
                      radius: 5,
                      width: 408,
                      controller: search,
                      suffixIcon:
                          search.text.isNotEmpty ? Icons.close : Icons.search,
                    ),
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
                              exportDataToExcel<Registration>(
                                items: controller.filteredregistration,
                                headers: [
                                  "Guardian Name".tr,
                                  "Guardian Email".tr,
                                  "Guardian Mobile".tr,
                                  "Guardian National ID".tr,
                                  "Student Name".tr,
                                  "Student Class".tr,
                                  "Previous Class".tr,
                                  "Request Date".tr,
                                  "Request State".tr,
                                ],
                                fieldMappings: {
                                  "Guardian Name".tr: (reg) =>
                                      reg.guardian?.name ?? "",
                                  "Guardian Email".tr: (reg) =>
                                      reg.guardian?.email ?? "",
                                  "Guardian Mobile".tr: (reg) =>
                                      reg.guardian?.phone?.toString() ?? "",
                                  "Guardian National ID".tr: (reg) =>
                                      reg.guardian?.nationalId ?? "",
                                  "Student Name".tr: (reg) =>
                                      reg.student?.name ?? "",
                                  "Student Class".tr: (reg) =>
                                      reg.student?.clas ?? "",
                                  "Previous Class".tr: (reg) =>
                                      reg.student?.previousClass?.toString() ??
                                      "",
                                  "Request Date".tr: (reg) =>
                                      reg.date?.toString() ?? "",
                                  "Request State".tr: (reg) =>
                                      reg.type!.tr ?? "",
                                },
                                fileName:
                                    'registrations_export_${DateTime.now().toIso8601String()}',
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
                        padding: const EdgeInsets.only(right: 10.0, left: 10.0),
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
                                exportDataToPdf<Registration>(
                                  items: controller.filteredregistration,
                                  headers: [
                                    "Guardian Name".tr,
                                    "Guardian Email".tr,
                                    "Guardian Mobile".tr,
                                    "Guardian National ID".tr,
                                    "Student Name".tr,
                                    "Student Class".tr,
                                    "Previous Class".tr,
                                    "Request Date".tr,
                                    "Request State".tr,
                                  ],
                                  fieldMappings: {
                                    "Guardian Name".tr: (reg) =>
                                        reg.guardian?.name ?? "",
                                    "Guardian Email".tr: (reg) =>
                                        reg.guardian?.email ?? "",
                                    "Guardian Mobile".tr: (reg) =>
                                        reg.guardian?.phone?.toString() ?? "",
                                    "Guardian National ID".tr: (reg) =>
                                        reg.guardian?.nationalId ?? "",
                                    "Student Name".tr: (reg) =>
                                        reg.student?.name ?? "",
                                    "Student Class".tr: (reg) =>
                                        reg.student?.clas ?? "",
                                    "Previous Class".tr: (reg) =>
                                        reg.student?.previousClass
                                            ?.toString() ??
                                        "",
                                    "Request Date".tr: (reg) =>
                                        reg.date?.toString() ?? "",
                                    "Request State".tr: (reg) =>
                                        reg.type!.tr ?? "",
                                  },
                                  fileName:
                                      'registrations_export_${DateTime.now().toIso8601String()}',
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
        Expanded(
            child: Padding(
          padding: const EdgeInsets.only(top: 15.0),
          child: RequestsGrid(),
        )),
      ],
    ));
  }
}
