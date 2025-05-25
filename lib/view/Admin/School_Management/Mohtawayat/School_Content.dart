import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vms_school/Icons_File/v_m_s__icons_icons.dart';
import 'package:vms_school/Link/API/AdminAPI/School/School_Screen_APIs/SchoolContentAPI/Add_School_Content.dart';
import 'package:vms_school/Link/API/AdminAPI/School/School_Screen_APIs/SchoolContentAPI/School_Content_API.dart';
import 'package:vms_school/Link/Controller/AdminController/School_Controllers/School_Content_Controller.dart';
import 'package:vms_school/Link/Functions/Export_Exle_Function.dart';
import 'package:vms_school/Link/Functions/Export_PDF_Function.dart';
import 'package:vms_school/view/Admin/School_Management/Mohtawayat/School_Content_Grid.dart';
import 'package:vms_school/widgets/ButtonsDialog.dart';
import 'package:vms_school/widgets/TextFildWithUpper.dart';
import 'package:vms_school/widgets/VMSAlertDialog.dart';
import 'package:vms_school/Link/Model/AdminModel/School_Models/SchoolContentModel.dart';

class School_Content extends StatefulWidget {
  const School_Content({super.key});

  @override
  State<School_Content> createState() => _School_ContentState();
}

class _School_ContentState extends State<School_Content> {
  @override
  void initState() {
    Get_Content_Screen_API(context).Get_Content_Screen();
    super.initState();
  }

  TextEditingController arName = TextEditingController();
  TextEditingController enName = TextEditingController();

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
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(5))))),
                        onPressed: () {
                          arName.clear();
                          enName.clear();

                          Get.find<School_Content_Controller>()
                              .updateFieldError("arname", false);
                          Get.find<School_Content_Controller>()
                              .updateFieldError("enname", false);

                          Get.dialog(barrierDismissible: false,
                              GetBuilder<School_Content_Controller>(
                                  builder: (controller) {
                            return VMSAlertDialog(
                                action: [
                                  ButtonDialog(
                                      text: "Add".tr,
                                      onPressed: () async {
                                        bool isArNameEmpty =
                                            arName.text.isEmpty;
                                        bool isenNameEmpty =
                                            enName.text.isEmpty;

                                        controller.updateFieldError(
                                            "arname", isArNameEmpty);

                                        controller.updateFieldError(
                                            "enname", isenNameEmpty);

                                        if (!(isArNameEmpty || isenNameEmpty)) {
                                          await Add_Content_Screen_API(context)
                                              .Add_Content_Screen(
                                            name: arName.text,
                                            enname: enName.text,
                                          );
                                        }
                                      },
                                      color: Theme.of(context).primaryColor,
                                      width: 120),
                                ],
                                contents: Column(
                                  spacing: 10.0,
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Textfildwithupper(
                                        width: 300,
                                        isRequired: true,
                                        isError: controller.IsnameError,
                                        onChanged: (value) {
                                          if (value.isNotEmpty) {
                                            controller.updateFieldError(
                                                "arname", false);
                                          }
                                        },
                                        controller: arName,
                                        Uptext: "Content Name".tr,
                                        hinttext: "Content Name".tr),
                                    Textfildwithupper(
                                        width: 300,
                                        isRequired: true,
                                        isError: controller.IsennameError,
                                        onChanged: (value) {
                                          if (value.isNotEmpty) {
                                            controller.updateFieldError(
                                                "enname", false);
                                          }
                                        },
                                        controller: enName,
                                        Uptext: "Content En Name".tr,
                                        hinttext: "Content En Name".tr),
                                  ],
                                ),
                                apptitle: "Add Content".tr,
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
                            exportDataToPdf<Data>(
                              items:
                                  Get.find<School_Content_Controller>().model!,
                              headers: [
                                "Name".tr,
                                "English Name".tr,
                              ],
                              fieldMappings: {
                                "Name".tr: (reg) => reg.name ?? "",
                                "English Name".tr: (reg) => reg.enName ?? "",
                              },
                              fileName: "School Content".tr +
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
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(5))))),
                        onPressed: () {
                          exportDataToExcel<Data>(
                            items: Get.find<School_Content_Controller>().model!,
                            headers: [
                              "Name".tr,
                              "English Name".tr,
                            ],
                            fieldMappings: {
                              "Name".tr: (reg) => reg.name ?? "",
                              "English Name".tr: (reg) => reg.enName ?? "",
                            },
                            fileName: "School Content".tr +
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
          child: School_Content_Grid(),
        )),
      ],
    ));
  }
}
