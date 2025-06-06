import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vms_school/Icons_File/v_m_s__icons_icons.dart';
import 'package:vms_school/Link/API/AdminAPI/School/School_Screen_APIs/Grade_Screen/Add_Grade_API.dart';
import 'package:vms_school/Link/API/AdminAPI/School/School_Screen_APIs/Grade_Screen/Grade_Screen_API.dart';
import 'package:vms_school/Link/Controller/AdminController/Employee_Controllers/Add_Data_controller.dart';
import 'package:vms_school/Link/Controller/AdminController/School_Controllers/Grade_Controller.dart';
import 'package:vms_school/Link/Functions/Export_Exle_Function.dart';
import 'package:vms_school/Link/Functions/Export_PDF_Function.dart';
import 'package:vms_school/Translate/local_controller.dart';

import 'package:vms_school/view/Both_Platform/widgets/ButtonsDialog.dart';
import 'package:vms_school/view/Both_Platform/widgets/TextFildWithUpper.dart';
import 'package:vms_school/view/Both_Platform/widgets/VMSAlertDialog.dart';
import 'package:vms_school/Link/Model/AdminModel/School_Models/AllGradeModel.dart';
import 'package:vms_school/view/SMS_Platform/Admin/School_Management/Grade_Pages/GradeManagementGrid.dart';

class GradeManagement extends StatefulWidget {
  const GradeManagement({super.key});

  @override
  State<GradeManagement> createState() => _GradeManagementState();
}

class _GradeManagementState extends State<GradeManagement> {
  @override
  void initState() {
    Get_All_Grade_API(context).Get_All_Grade();
    super.initState();
  }

  TextEditingController search = TextEditingController();
  TextEditingController arName = TextEditingController();
  TextEditingController enName = TextEditingController();
  TextEditingController feeCount = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: Column(
      children: [
        if (Get.find<Add_Data_controller>().roll != "observer")
          Container(
            margin: const EdgeInsets.only(left: 30.0, right: 30.0, top: 30.0),
            alignment: Alignment.center,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
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
                            arName.clear();
                            enName.clear();
                            feeCount.clear();
                            Get.dialog(barrierDismissible: false,
                                GetBuilder<Grade_Controller>(
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

                                          bool isFeeEmpty =
                                              feeCount.text.isEmpty;

                                          controller.updateFieldError(
                                              "arname", isArNameEmpty);
                                          controller.updateFieldError(
                                              "enname", isEnNameEmpty);
                                          controller.updateFieldError(
                                              "fee", isFeeEmpty);

                                          if (!(isArNameEmpty ||
                                              isEnNameEmpty ||
                                              isFeeEmpty)) {
                                            await Add_Grade_API(context)
                                                .Add_Grade(
                                              name: arName.text,
                                              enName: enName.text,
                                              feeCount: feeCount.text,
                                            );
                                          }
                                        },
                                        color: Theme.of(context).primaryColor,
                                        width: 120),
                                  ],
                                  contents: Container(
                                    width: 320,
                                    child: SingleChildScrollView(
                                      child: Column(
                                        spacing: 8.0,
                                        mainAxisSize: MainAxisSize.min,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          Textfildwithupper(
                                              width: 280,
                                              isRequired: true,
                                              isError: controller.IsennameError,
                                              onChanged: (value) {
                                                if (value.isNotEmpty) {
                                                  controller.updateFieldError(
                                                      "enname", false);
                                                }
                                              },
                                              controller: enName,
                                              Uptext: "Grade En - Name".tr,
                                              hinttext: "Grade En - Name".tr),
                                          Textfildwithupper(
                                              width: 280,
                                              isRequired: true,
                                              isError: controller.IsarnameError,
                                              onChanged: (value) {
                                                if (value.isNotEmpty) {
                                                  controller.updateFieldError(
                                                      "arname", false);
                                                }
                                              },
                                              controller: arName,
                                              Uptext: "Grade Ar - Name".tr,
                                              hinttext: "Grade Ar - Name".tr),
                                          Textfildwithupper(
                                              width: 280,
                                              isRequired: true,
                                              isError: controller.IsfeeError,
                                              onChanged: (value) {
                                                if (value.isNotEmpty) {
                                                  controller.updateFieldError(
                                                      "fee", false);
                                                }
                                              },
                                              controller: feeCount,
                                              fieldType: "number",
                                              Uptext: "Fee Count".tr,
                                              hinttext: "Fee Count".tr),
                                        ],
                                      ),
                                    ),
                                  ),
                                  apptitle: "Add Grade".tr,
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
                              exportDataToPdf<Grades>(
                                items: Get.find<Grade_Controller>().grades!,
                                headers: [
                                  "Name".tr,
                                  "Fee Count".tr,
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
                                  "Fee Count".tr: (reg) => reg.feeCount ?? "",
                                },
                                fileName: "Grade".tr +
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
                            exportDataToExcel<Grades>(
                              items: Get.find<Grade_Controller>().grades!,
                              headers: [
                                "Name".tr,
                                "Fee Count".tr,
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
                                "Fee Count".tr: (reg) => reg.feeCount ?? "",
                              },
                              fileName: "Grade".tr +
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
          child: GradeTable(),
        )),
      ],
    ));
  }
}
