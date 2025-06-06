import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vms_school/Icons_File/v_m_s__icons_icons.dart';
import 'package:vms_school/Link/API/AdminAPI/School/School_Screen_APIs/Sessions/SessionAPI.dart';
import 'package:vms_school/Link/Controller/AdminController/Employee_Controllers/Add_Data_controller.dart';
import 'package:vms_school/Link/Controller/AdminController/School_Controllers/Session_Controller.dart';
import 'package:vms_school/Link/Functions/Export_Exle_Function.dart';
import 'package:vms_school/Link/Functions/Export_PDF_Function.dart';
import 'package:vms_school/Link/Model/AdminModel/School_Models/AllSessionModel.dart';
import 'package:vms_school/view/SMS_Platform/Admin/School_Management/Sessions_Pages/Add_Seassion.dart';
import 'package:vms_school/view/SMS_Platform/Admin/School_Management/Sessions_Pages/Session_Management_Grid.dart';

class SessionManagement extends StatefulWidget {
  const SessionManagement({super.key});

  @override
  State<SessionManagement> createState() => _SessionManagementState();
}

class _SessionManagementState extends State<SessionManagement> {
  TextEditingController search = TextEditingController();

  @override
  void initState() {
    Get_Session_Screen_API().Getsession();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: Column(
      children: [
        if (Get.find<Add_Data_controller>().roll != "observer")
          Container(
            margin: const EdgeInsets.only(left: 30.0, right: 30.0, top: 30.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    const Spacer(),
                    if (Get.find<Add_Data_controller>().roll != "supervisor")
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
                              Get.find<SessionController>().initialData();
                              Get.dialog(
                                Add_Session(),
                                barrierDismissible: false,
                              );
                            },
                            icon: Icon(Icons.add,
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
                            style: ButtonStyle(
                                backgroundColor: WidgetStatePropertyAll(
                                    Theme.of(context).cardColor),
                                shape: WidgetStatePropertyAll(
                                    RoundedRectangleBorder(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(5))))),
                            onPressed: () {
                              exportDataToPdf<Sessions>(
                                items:
                                    Get.find<SessionController>().sessionsss!,
                                headers: [
                                  "Year".tr,
                                  "Start Date".tr,
                                  "End Date".tr,
                                  "Status".tr,
                                ],
                                fieldMappings: {
                                  "Year".tr: (reg) => reg.year ?? "",
                                  "Start Date".tr: (reg) => reg.startDate ?? "",
                                  "End Date".tr: (reg) => reg.endDate ?? "",
                                  "Status".tr: (reg) => reg.status!.tr ?? "",
                                },
                                fileName: "Sessions".tr +
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
                            exportDataToExcel<Sessions>(
                              items: Get.find<SessionController>().sessionsss!,
                              headers: [
                                "Year".tr,
                                "Start Date".tr,
                                "End Date".tr,
                                "Status".tr,
                              ],
                              fieldMappings: {
                                "Year".tr: (reg) => reg.year ?? "",
                                "Start Date".tr: (reg) => reg.startDate ?? "",
                                "End Date".tr: (reg) => reg.endDate ?? "",
                                "Status".tr: (reg) => reg.status!.tr ?? "",
                              },
                              fileName: "Sessions".tr +
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
                ),
              ],
            ),
          ),
        Expanded(
            child: Padding(
          padding: const EdgeInsets.only(top: 15.0),
          child: SessionManagementGrid(),
        )),
      ],
    ));
  }
}
