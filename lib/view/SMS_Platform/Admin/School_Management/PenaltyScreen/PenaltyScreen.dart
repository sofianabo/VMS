import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vms_school/Icons_File/v_m_s__icons_icons.dart';
import 'package:vms_school/Link/API/AdminAPI/School/School_Screen_APIs/PenaltyAPI/AddPenaltyAPI.dart';
import 'package:vms_school/Link/API/AdminAPI/School/School_Screen_APIs/PenaltyAPI/getPenaltyAPI.dart';
import 'package:vms_school/Link/Controller/AdminController/Employee_Controllers/Add_Data_controller.dart';
import 'package:vms_school/Link/Controller/AdminController/School_Controllers/PenaltyController.dart';
import 'package:vms_school/Link/Functions/Export_Exle_Function.dart';
import 'package:vms_school/Link/Functions/Export_PDF_Function.dart';
import 'package:vms_school/Translate/local_controller.dart';
import 'package:vms_school/view/Both_Platform/widgets/ButtonsDialog.dart';
import 'package:vms_school/view/Both_Platform/widgets/TextFildWithUpper.dart';
import 'package:vms_school/view/Both_Platform/widgets/VMSAlertDialog.dart';
import 'package:vms_school/Link/Model/AdminModel/School_Models/AllPenaltyModel.dart';
import 'package:vms_school/view/SMS_Platform/Admin/School_Management/PenaltyScreen/PenaltyGrid.dart';

class Penaltyscreen extends StatefulWidget {
  const Penaltyscreen({super.key});

  @override
  State<Penaltyscreen> createState() => PenaltyscreenState();
}

class PenaltyscreenState extends State<Penaltyscreen> {
  @override
  void initState() {
    Getpenaltyapi(context).Getpenalty();
    super.initState();
  }

  TextEditingController search = TextEditingController();
  TextEditingController arName = TextEditingController();
  TextEditingController enName = TextEditingController();
  TextEditingController details = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: Column(
      children: [
        Container(
          margin: const EdgeInsets.only(left: 30.0, right: 30.0, top: 30.0),
          alignment: Alignment.center,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if (Get.find<Add_Data_controller>().roll != "observer")
                Row(
                  children: [
                    const Spacer(),
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
                            Get.dialog(GetBuilder<Penaltycontroller>(
                                builder: (controller) {
                              return VMSAlertDialog(
                                  action: [
                                    ButtonDialog(
                                        text: "Add".tr,
                                        onPressed: () async {
                                          bool isArNameEmpty =
                                              arName.text.isEmpty;
                                          bool isEnNameEmpty =
                                              enName.text.isEmpty;
                                          bool isdetEmpty =
                                              details.text.isEmpty;

                                          controller.updateFieldError(
                                              "arname", isArNameEmpty);
                                          controller.updateFieldError(
                                              "enname", isEnNameEmpty);
                                          controller.updateFieldError(
                                              "detail", isdetEmpty);

                                          if (!(isArNameEmpty ||
                                              isEnNameEmpty ||
                                              isdetEmpty)) {
                                            await Addpenaltyapi(context)
                                                .Addpenalty(
                                              name: arName.text,
                                              enName: enName.text,
                                              discription: details.text,
                                            );

                                            arName.clear();
                                            enName.clear();
                                            details.clear();
                                          }
                                        },
                                        color: Theme.of(context).primaryColor,
                                        width: 120),
                                  ],
                                  contents: SingleChildScrollView(
                                    child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      spacing: 8,
                                      children: [
                                        Textfildwithupper(
                                            isRequired: true,
                                            width: 280,
                                            isError: controller.IsEnnameError,
                                            onChanged: (value) {
                                              if (value.isNotEmpty) {
                                                controller.updateFieldError(
                                                    "enname", false);
                                              }
                                            },
                                            controller: enName,
                                            Uptext: "Penalty En - Name".tr,
                                            hinttext: "Penalty En - Name".tr),
                                        Textfildwithupper(
                                            width: 280,
                                            isRequired: true,
                                            isError: controller.IsArnameError,
                                            onChanged: (value) {
                                              if (value.isNotEmpty) {
                                                controller.updateFieldError(
                                                    "arname", false);
                                              }
                                            },
                                            controller: arName,
                                            Uptext: "Penalty Ar - Name".tr,
                                            hinttext: "Penalty Ar - Name".tr),
                                        Textfildwithupper(
                                            isRequired: true,
                                            width: 280,
                                            isError: controller.IsdeError,
                                            onChanged: (value) {
                                              if (value.isNotEmpty) {
                                                controller.updateFieldError(
                                                    "detail", false);
                                              }
                                            },
                                            controller: details,
                                            Uptext: "Details".tr,
                                            hinttext: "Details".tr),
                                      ],
                                    ),
                                  ),
                                  apptitle: "Add Penalty".tr,
                                  subtitle: "none");
                            }));
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
                              exportDataToPdf<Penalty>(
                                items: Get.find<Penaltycontroller>().penalt!,
                                headers: [
                                  "Name".tr,
                                  "Details".tr,
                                ],
                                fieldMappings: {
                                  "Name".tr: (reg) =>
                                      Get.find<LocalizationController>()
                                                  .currentLocale
                                                  .value
                                                  .languageCode ==
                                              'ar'
                                          ? reg.name
                                          : reg.enName ?? "",
                                  "Details".tr: (reg) => reg.description ?? "",
                                },
                                fileName: "Penalty".tr +
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
                            exportDataToExcel<Penalty>(
                              items: Get.find<Penaltycontroller>().penalt!,
                              headers: [
                                "Name".tr,
                                "Details".tr,
                              ],
                              fieldMappings: {
                                "Name".tr: (reg) =>
                                    Get.find<LocalizationController>()
                                                .currentLocale
                                                .value
                                                .languageCode ==
                                            'ar'
                                        ? reg.name
                                        : reg.enName ?? "",
                                "Details".tr: (reg) => reg.description ?? "",
                              },
                              fileName: "Penalty".tr +
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
          child: Penaltygrid(),
        )),
      ],
    ));
  }
}
