import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vms_school/Icons_File/v_m_s__icons_icons.dart';
import 'package:vms_school/Link/API/AdminAPI/Location_API/Locations_API.dart';
import 'package:vms_school/Link/API/AdminAPI/School/School_Screen_APIs/Vaccines_APIs/Add_Vaccines_API.dart';
import 'package:vms_school/Link/API/AdminAPI/School/School_Screen_APIs/Vaccines_APIs/Get_All_Vaccines_API.dart';
import 'package:vms_school/Link/Controller/AdminController/Employee_Controllers/Add_Data_controller.dart';
import 'package:vms_school/Link/Controller/AdminController/Location_controller.dart';
import 'package:vms_school/Link/Controller/AdminController/School_Controllers/Vaccines_Controller.dart';
import 'package:vms_school/Link/Functions/Export_Exle_Function.dart';
import 'package:vms_school/Link/Functions/Export_PDF_Function.dart';
import 'package:vms_school/Link/Model/AdminModel/School_Models/Vaccines_Model.dart';
import 'package:vms_school/view/Both_Platform/widgets/Admin/Admin_School/Vaccian_DropDown.dart';
import 'package:vms_school/view/Both_Platform/widgets/ButtonsDialog.dart';
import 'package:vms_school/view/Both_Platform/widgets/TextFildWithUpper.dart';
import 'package:vms_school/view/Both_Platform/widgets/TextFormSearch.dart';
import 'package:vms_school/view/Both_Platform/widgets/VMSAlertDialog.dart';
import 'package:vms_school/view/SMS_Platform/Admin/School_Management/Vaccine_Pages/Vaccine_Grid.dart';

class Vaccine_Screen extends StatefulWidget {
  Vaccine_Screen({super.key});

  @override
  State<Vaccine_Screen> createState() => _Vaccine_ScreenState();
}

class _Vaccine_ScreenState extends State<Vaccine_Screen> {
  TextEditingController search = TextEditingController();

  TextEditingController name = TextEditingController();
  TextEditingController enName = TextEditingController();
  @override
  void initState() {
    Get_Vaccines_API(context).Get_Vaccines();
    Get_Location_API.Get_Locations();
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
              GetBuilder<Vaccines_Controller>(builder: (controller) {
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
                    spacing: 10,
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
                                shape: WidgetStatePropertyAll(
                                    RoundedRectangleBorder(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(5))))),
                            onPressed: () {
                              var controller = Get.find<Vaccines_Controller>();
                              controller.updateFieldError("arname", false);
                              controller.updateFieldError("enname", false);
                              controller.LocationIndex = "Syria".tr;
                              name.clear();
                              enName.clear();
                              Get.dialog(
                                  barrierDismissible: false,
                                  addVaccineDialog());
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
                                shape: WidgetStatePropertyAll(
                                    RoundedRectangleBorder(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(5))))),
                            onPressed: () {
                              exportDataToPdf<Vaccine>(
                                items: Get.find<Vaccines_Controller>()
                                    .filteredvaccine!,
                                headers: [
                                  "Name".tr,
                                  "English Name".tr,
                                ],
                                fieldMappings: {
                                  "Name".tr: (reg) => reg.name ?? "",
                                  "English Name".tr: (reg) => reg.enName ?? "",
                                },
                                fileName: "Vaccine".tr +
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
                                shape: WidgetStatePropertyAll(
                                    RoundedRectangleBorder(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(5))))),
                            onPressed: () {
                              exportDataToExcel<Vaccine>(
                                items: Get.find<Vaccines_Controller>()
                                    .filteredvaccine!,
                                headers: [
                                  "Name".tr,
                                  "English Name".tr,
                                ],
                                fieldMappings: {
                                  "Name".tr: (reg) => reg.name ?? "",
                                  "English Name".tr: (reg) => reg.enName ?? "",
                                },
                                fileName: "Vaccine".tr +
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
          child: Vaccine_Grid(),
        )),
      ],
    ));
  }

  addVaccineDialog() {
    return GetBuilder<Vaccines_Controller>(builder: (controller) {
      return VMSAlertDialog(
          contents: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                width: 400,
              ),
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
                  hinttext: "Name".tr),
              Padding(
                padding: const EdgeInsets.only(top: 10.0),
                child: Textfildwithupper(
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
              ),
              Padding(
                padding: const EdgeInsets.only(top: 15.0),
                child: DropdownVaccian(
                    isLoading: controller.isLoadingLocation,
                    title: "Location".tr,
                    width: 350,
                    type: "Location"),
              ),
            ],
          ),
          action: [
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                ButtonDialog(
                    width: 150,
                    text: "Add Vaccine".tr,
                    onPressed: () async {
                      bool isArNameEmpty = name.text.isEmpty;
                      bool isEnNameEmpty = enName.text.isEmpty;

                      controller.updateFieldError("arname", isArNameEmpty);
                      controller.updateFieldError("enname", isEnNameEmpty);

                      if (!(isArNameEmpty || isEnNameEmpty)) {
                        await Add_Vaccines_API(context).Add_Vaccines(
                          name: name.text,
                          enName: enName.text,
                          locationId:
                              Get.find<Location_controller>().Locationsid,
                        );
                      }
                    },
                    color: Theme.of(context).canvasColor)
              ],
            )
          ],
          apptitle: "Add Vaccine".tr,
          subtitle: "none");
    });
  }
}
