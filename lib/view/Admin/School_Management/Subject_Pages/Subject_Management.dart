import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vms_school/Icons_File/v_m_s__icons_icons.dart';
import 'package:vms_school/Link/API/AdminAPI/School/School_Screen_APIs/Subject_Screen/Add_Subject_API.dart';
import 'package:vms_school/Link/API/AdminAPI/School/School_Screen_APIs/Subjects_API/Get_Subjects_API.dart';
import 'package:vms_school/Link/Controller/AdminController/Employee_Controllers/Add_Data_controller.dart';
import 'package:vms_school/Link/Controller/AdminController/School_Controllers/Subject_Controller.dart';
import 'package:vms_school/Link/Functions/Export_Exle_Function.dart';
import 'package:vms_school/Link/Functions/Export_PDF_Function.dart';
import 'package:vms_school/view/Admin/School_Management/Subject_Pages/Subject_Management_Grid.dart';
import 'package:vms_school/widgets/ButtonsDialog.dart';
import 'package:vms_school/widgets/TextFildWithUpper.dart';
import 'package:vms_school/widgets/VMSAlertDialog.dart';

import '../../../../Link/Model/AdminModel/School_Models/Subject_Model.dart';

class Subject_Management extends StatefulWidget {
  const Subject_Management({super.key});

  @override
  State<Subject_Management> createState() => _Subject_ManagementState();
}

class _Subject_ManagementState extends State<Subject_Management> {
  @override
  void initState() {
    Get_Subject_Screen_API(context).Get_Subject_Screen();
    super.initState();
  }

  TextEditingController arName = TextEditingController();
  TextEditingController enName = TextEditingController();

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
                            Get.find<Subject_Controller>()
                                .updateFieldError("arname", false);
                            Get.find<Subject_Controller>()
                                .updateFieldError("enname", false);
                            Get.dialog(barrierDismissible: false,
                                GetBuilder<Subject_Controller>(
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

                                          controller.updateFieldError(
                                              "arname", isArNameEmpty);
                                          controller.updateFieldError(
                                              "enname", isEnNameEmpty);

                                          if (!(isArNameEmpty ||
                                              isEnNameEmpty)) {
                                            await Add_Subject_API(context)
                                                .Add_Subject(
                                              name: arName.text,
                                              enName: enName.text,
                                            );
                                          }
                                        },
                                        color: Theme.of(context).primaryColor,
                                        width: 120),
                                  ],
                                  contents: SingleChildScrollView(
                                    child: Column(
                                      spacing: 8,
                                      mainAxisSize: MainAxisSize.min,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Textfildwithupper(
                                            width: 280,
                                            isRequired: true,
                                            isError: controller.IsEnnameError,
                                            onChanged: (value) {
                                              if (value.isNotEmpty) {
                                                controller.updateFieldError(
                                                    "enname", false);
                                              }
                                            },
                                            controller: enName,
                                            Uptext: "Subject En - Name".tr,
                                            hinttext: "Subject En - Name".tr),
                                        Textfildwithupper(
                                            isRequired: true,
                                            width: 280,
                                            isError: controller.IsArnameError,
                                            onChanged: (value) {
                                              if (value.isNotEmpty) {
                                                controller.updateFieldError(
                                                    "arname", false);
                                              }
                                            },
                                            controller: arName,
                                            Uptext: "Subject Ar - Name".tr,
                                            hinttext: "Subject Ar - Name".tr),
                                      ],
                                    ),
                                  ),
                                  apptitle: "Add Subject".tr,
                                  subtitle: "none");
                            }));
                          },
                          icon: Icon(Icons.add,
                              size: 18,
                              color: Theme.of(context).highlightColor)),
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
                              exportDataToPdf<Subject>(
                                items: Get.find<Subject_Controller>().subject!,
                                headers: [
                                  "Name".tr,
                                  "English Name".tr,
                                ],
                                fieldMappings: {
                                  "Name".tr: (reg) => reg.name ?? "",
                                  "English Name".tr: (reg) => reg.enName ?? "",
                                },
                                fileName: "Subjectssss".tr +
                                    '${DateTime.now().toIso8601String()}',
                              );
                            },
                            icon: Icon(VMS_Icons.pdf,
                                size: 18,
                                color: Theme.of(context).highlightColor)),
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
                            exportDataToExcel<Subject>(
                              items: Get.find<Subject_Controller>().subject!,
                              headers: [
                                "Name".tr,
                                "English Name".tr,
                              ],
                              fieldMappings: {
                                "Name".tr: (reg) => reg.name ?? "",
                                "English Name".tr: (reg) => reg.enName ?? "",
                              },
                              fileName: "Subjectssss".tr +
                                  '${DateTime.now().toIso8601String()}',
                            );
                          },
                          icon: Icon(VMS_Icons.xl,
                              size: 18,
                              color: Theme.of(context).highlightColor)),
                    ),
                  ],
                ),
              ],
            ),
          ),
        Expanded(
            child: Padding(
          padding: const EdgeInsets.only(top: 15.0),
          child: Subject_Management_Grid(),
        )),
      ],
    ));
  }
}
