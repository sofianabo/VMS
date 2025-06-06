import 'package:flutter/material.dart';
import 'package:flutter_dropzone/flutter_dropzone.dart';
import 'package:get/get.dart';
import 'package:vms_school/Icons_File/v_m_s__icons_icons.dart';
import 'package:vms_school/Link/API/AdminAPI/School/School_Screen_APIs/Illness_APIs/Add_Illness_API.dart';
import 'package:vms_school/Link/API/AdminAPI/School/School_Screen_APIs/Illness_APIs/Get_All_Illness_API.dart';
import 'package:vms_school/Link/Controller/AdminController/Employee_Controllers/Add_Data_controller.dart';
import 'package:vms_school/Link/Controller/AdminController/School_Controllers/Illness_Controller.dart';
import 'package:vms_school/Link/Functions/Export_Exle_Function.dart';
import 'package:vms_school/Link/Functions/Export_PDF_Function.dart';
import 'package:vms_school/Link/Model/AdminModel/School_Models/Illness_Model.dart';
import 'package:vms_school/Theme/themeController.dart';
import 'package:vms_school/view/SMS_Platform/Admin/School_Management/Illness_Pages/Illness_Grid.dart';
import 'package:vms_school/view/Both_Platform/widgets/ButtonsDialog.dart';
import 'package:vms_school/view/Both_Platform/widgets/TextFildWithUpper.dart';
import 'package:vms_school/view/Both_Platform/widgets/TextFormSearch.dart';
import 'package:vms_school/view/Both_Platform/widgets/VMSAlertDialog.dart';

class Ilness_Screen extends StatefulWidget {
  Ilness_Screen({super.key});

  @override
  State<Ilness_Screen> createState() => _Ilness_ScreenState();
}

class _Ilness_ScreenState extends State<Ilness_Screen> {
  TextEditingController search = TextEditingController();
  TextEditingController name = TextEditingController();
  TextEditingController enName = TextEditingController();

  @override
  void initState() {
    Get_Illness_API(context).Get_Illness();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    return Expanded(
        child: Column(
      children: [
        Container(
          width: w,
          margin: EdgeInsets.only(left: 30.0, right: 30.0, top: 30.0),
          alignment: Alignment.center,
          child: Wrap(
            alignment: WrapAlignment.spaceBetween,
            crossAxisAlignment: WrapCrossAlignment.center,
            runAlignment: WrapAlignment.spaceBetween,
            spacing: 10.0,
            runSpacing: 8.0,
            children: [
              GetBuilder<Illness_Controller>(builder: (controller) {
                return TextFormSearch(
                  click: () {
                    controller.clearFilter();
                  },
                  onchange: (value) {
                    controller.searchByName(value);
                  },
                  width: w >= 1060
                      ? w * 0.7
                      : w >= 732
                          ? w * 0.8
                          : w * 0.9,
                  radius: 5,
                  controller: search,
                  suffixIcon:
                      search.text.isNotEmpty ? Icons.close : Icons.search,
                );
              }),
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
                        child: IconButton(
                            style: ButtonStyle(
                                backgroundColor: WidgetStatePropertyAll(
                                    Theme.of(context).cardColor),
                                shape: WidgetStatePropertyAll(
                                    RoundedRectangleBorder(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(5))))),
                            onPressed: () {
                              var controller = Get.find<Illness_Controller>();
                              controller.updateFieldError("arname", false);
                              controller.updateFieldError("enname", false);
                              Get.dialog(
                                  barrierDismissible: false, addIllDialog());
                            },
                            icon: Icon(Icons.add,
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
                              exportDataToPdf<Illness>(
                                items: Get.find<Illness_Controller>()
                                    .filteredIllness!,
                                headers: [
                                  "Name".tr,
                                  "English Name".tr,
                                ],
                                fieldMappings: {
                                  "Name".tr: (reg) => reg.name ?? "",
                                  "English Name".tr: (reg) => reg.enName ?? "",
                                },
                                fileName: "illness".tr +
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
                            style: ButtonStyle(
                                backgroundColor: WidgetStatePropertyAll(
                                    Theme.of(context).cardColor),
                                shape: WidgetStatePropertyAll(
                                    RoundedRectangleBorder(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(5))))),
                            onPressed: () {
                              exportDataToExcel<Illness>(
                                items: Get.find<Illness_Controller>()
                                    .filteredIllness!,
                                headers: [
                                  "Name".tr,
                                  "English Name".tr,
                                ],
                                fieldMappings: {
                                  "Name".tr: (reg) => reg.name ?? "",
                                  "English Name".tr: (reg) => reg.enName ?? "",
                                },
                                fileName: "illness".tr +
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
          ),
        ),
        Expanded(
            child: Padding(
          padding: const EdgeInsets.only(top: 15.0),
          child: Illness_Grid(),
        )),
      ],
    ));
  }

  addIllDialog() {
    return GetBuilder<Illness_Controller>(builder: (controller) {
      return VMSAlertDialog(
          contents: SizedBox(
            width: 400,
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Wrap(
                    spacing: 20.0,
                    runSpacing: 20.0,
                    crossAxisAlignment: WrapCrossAlignment.center,
                    children: [
                      Textfildwithupper(
                        isRequired: true,
                        isError: controller.IsAnameError,
                        onChanged: (value) {
                          if (value.isNotEmpty) {
                            controller.updateFieldError("arname", false);
                          }
                        },
                        width: 350,
                        controller: name,
                        Uptext: "Name".tr,
                        hinttext: "Name".tr,
                      ),
                      Textfildwithupper(
                          isRequired: true,
                          isError: controller.IsEnameError,
                          onChanged: (value) {
                            if (value.isNotEmpty) {
                              controller.updateFieldError("enname", false);
                            }
                          },
                          width: 350,
                          controller: enName,
                          Uptext: "English Name".tr,
                          hinttext: "English Name".tr),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 10.0),
                    child: Wrap(
                      spacing: 20.0,
                      runSpacing: 20.0,
                      children: [
                        Obx(() => Checkbox(
                              value: controller.chronic.value,
                              onChanged: (value) {
                                controller.togglechronic(value!);
                              },
                            )),
                        Text("Is Chronic".tr,
                            style: Get.theme.textTheme.bodyMedium!
                                .copyWith(fontSize: 16)),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          action: [
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                ButtonDialog(
                    width: 150,
                    text: "Add Illness".tr,
                    onPressed: () async {
                      bool isArNameEmpty = name.text.isEmpty;
                      bool isEnNameEmpty = enName.text.isEmpty;
                      controller.updateFieldError("arname", isArNameEmpty);
                      controller.updateFieldError("enname", isEnNameEmpty);

                      if (!(isArNameEmpty || isEnNameEmpty)) {
                        await Add_Illness_API(context).Add_Illness(
                          name: name.text,
                          enName: enName.text,
                          chronic: controller.chronic.value,
                        );

                        name.clear();
                        enName.clear();
                      }
                    },
                    color: Theme.of(context).canvasColor)
              ],
            )
          ],
          apptitle: "Add Illness".tr,
          subtitle: "none");
    });
  }
}
