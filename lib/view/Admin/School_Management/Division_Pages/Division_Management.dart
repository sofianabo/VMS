import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:vms_school/Icons_File/v_m_s__icons_icons.dart';
import 'package:vms_school/Link/API/AdminAPI/School/School_DropDown/DropdownClassesAPI.dart';
import 'package:vms_school/Link/API/AdminAPI/School/School_Screen_APIs/Division_API/Add_Division_API.dart';
import 'package:vms_school/Link/API/AdminAPI/School/School_Screen_APIs/Division_API/Get_All_Division.dart';
import 'package:vms_school/Link/Controller/AdminController/Employee_Controllers/Add_Data_controller.dart';
import 'package:vms_school/Link/Controller/AdminController/School_Controllers/Divisions_Controller.dart';
import 'package:vms_school/Link/Controller/WidgetController/DropDown_Controllers/Sessions_DropDown_Controller.dart';
import 'package:vms_school/Link/Functions/Export_Exle_Function.dart';
import 'package:vms_school/Link/Functions/Export_PDF_Function.dart';
import 'package:vms_school/Translate/local_controller.dart';
import 'package:vms_school/view/Admin/School_Management/Division_Pages/Division_Grid.dart';
import 'package:vms_school/widgets/Admin/Admin_School/All_Screen_Sessions.dart';
import 'package:vms_school/widgets/Admin/Admin_School/DropDownDivisionMgmt.dart';
import 'package:vms_school/widgets/ButtonsDialog.dart';
import 'package:vms_school/widgets/TextFildWithUpper.dart';
import 'package:vms_school/widgets/VMSAlertDialog.dart';
import 'package:vms_school/Link/Model/AdminModel/School_Models/Division_Model.dart';

class DivisionManagement extends StatefulWidget {
  const DivisionManagement({super.key});

  @override
  State<DivisionManagement> createState() => _DivisionManagementState();
}

class _DivisionManagementState extends State<DivisionManagement> {
  TextEditingController arName = TextEditingController();

  TextEditingController enName = TextEditingController();

  TextEditingController driveUrl = TextEditingController();
  @override
  void initState() {
    Get.find<All_Screen_Sessions_Controller>().setSessionDefult();
    Get_All_Division_API(context).Get_All_Division();
    Getallclassapi.getAllClasses();
    Get.find<Divisions_Controller>().ClassIndex = "";
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    AddDivision() {
      return GetBuilder<Divisions_Controller>(builder: (controller) {
        return VMSAlertDialog(
            action: [
              ButtonDialog(
                  text: "Add".tr,
                  onPressed: () async {
                    bool isArNameEmpty = arName.text.isEmpty;
                    bool isEnNameEmpty = enName.text.isEmpty;
                    bool isDriveEmpty = driveUrl.text.isEmpty;
                    bool isclassEmpty = controller.ClassDiagIndex.isEmpty ||
                        controller.ClassDiagIndex.isEmpty == "";

                    controller.updateFieldError("ename", isEnNameEmpty);
                    controller.updateFieldError("arname", isArNameEmpty);
                    controller.updateFieldError("meet", isDriveEmpty);
                    controller.updateFieldError("class", isclassEmpty);

                    if (!(isArNameEmpty ||
                        isEnNameEmpty ||
                        isDriveEmpty ||
                        isclassEmpty)) {
                      await Add_Division_API(context).Add_Division(
                        classId: controller.dropDiagClasses,
                        enName: enName.text,
                        name: arName.text,
                        meetUrl: driveUrl.text,
                      );

                      arName.clear();
                      enName.clear();
                      driveUrl.clear();
                      Get.back();
                    }
                  },
                  color: Theme.of(context).primaryColor,
                  width: 120),
            ],
            contents: SingleChildScrollView(
              child: Container(
                width: 540,
                child: Wrap(
                  alignment: WrapAlignment.center,
                  runAlignment: WrapAlignment.center,
                  crossAxisAlignment: WrapCrossAlignment.center,
                  runSpacing: 10.0,
                  spacing: 10.0,
                  children: [
                    Wrap(
                      spacing: 8.0,
                      runSpacing: 8.0,
                      alignment: WrapAlignment.center,
                      runAlignment: WrapAlignment.center,
                      crossAxisAlignment: WrapCrossAlignment.center,
                      children: [
                        Textfildwithupper(
                            isError: controller.IsennameError,
                            isRequired: true,
                            onChanged: (value) {
                              if (value.isNotEmpty) {
                                controller.updateFieldError("ename", false);
                              }
                            },
                            width: 250,
                            controller: enName,
                            Uptext: "Division En - Name".tr,
                            hinttext: "Division En - Name".tr),
                        Textfildwithupper(
                            isError: controller.IsarnameError,
                            isRequired: true,
                            onChanged: (value) {
                              if (value.isNotEmpty) {
                                controller.updateFieldError("arname", false);
                              }
                            },
                            width: 250,
                            controller: arName,
                            Uptext: "Division Ar - Name".tr,
                            hinttext: "Division Ar - Name".tr),
                      ],
                    ),
                    Wrap(
                      runSpacing: 8.0,
                      spacing: 8.0,
                      alignment: WrapAlignment.center,
                      runAlignment: WrapAlignment.center,
                      crossAxisAlignment: WrapCrossAlignment.end,
                      children: [
                        GetBuilder<Divisions_Controller>(builder: (controller) {
                          return Padding(
                            padding: const EdgeInsets.only(bottom: 17.0),
                            child: DropDownDivisionMgmt(
                                isError: controller.IsclassError,
                                isLoading: controller.isLoading,
                                title: "Class".tr,
                                width: 250,
                                type: "classDiag"),
                          );
                        }),
                        Row(
                          spacing: 10.0,
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Textfildwithupper(
                                isError: controller.IsmeetError,
                                isRequired: true,
                                onChanged: (value) {
                                  if (value.isNotEmpty) {
                                    controller.updateFieldError("meet", false);
                                  }
                                },
                                width: 215,
                                controller: driveUrl,
                                Uptext: "Meet URL".tr,
                                hinttext: "Meet URL".tr),
                            Padding(
                              padding: const EdgeInsets.only(top: 36.0),
                              child: SvgPicture.asset("assets/images/meet.svg",
                                  width: 25),
                            )
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            apptitle: "Add Division".tr,
            subtitle: "none");
      });
    }

    return Expanded(
        child: Column(
      children: [
        if (Get.find<Add_Data_controller>().roll != "observer")
          if (screenWidth > 769)
            Container(
              width: screenWidth,
              margin: const EdgeInsets.only(left: 30.0, right: 30.0, top: 30.0),
              child: Wrap(
                alignment: WrapAlignment.spaceBetween,
                runSpacing: 10.0,
                spacing: 10.0,
                crossAxisAlignment: WrapCrossAlignment.center,
                runAlignment: WrapAlignment.spaceBetween,
                children: [
                  Wrap(
                    alignment: WrapAlignment.start,
                    runSpacing: 10.0,
                    spacing: 10.0,
                    crossAxisAlignment: WrapCrossAlignment.center,
                    runAlignment: WrapAlignment.start,
                    children: [
                      DropDownAllSessions(
                          API: "division",
                          title: "Session".tr,
                          width: 250,
                          type: "session"),
                      GetBuilder<Divisions_Controller>(builder: (controller) {
                        return DropDownDivisionMgmt(
                            isLoading: controller.isLoading,
                            title: "Class".tr,
                            width: 250,
                            type: "class");
                      }),
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
                              driveUrl.clear();
                              Get.find<Divisions_Controller>().ClassDiagIndex =
                                  "";
                              Get.find<Divisions_Controller>()
                                  .updateFieldError("ename", false);
                              Get.find<Divisions_Controller>()
                                  .updateFieldError("arname", false);
                              Get.find<Divisions_Controller>()
                                  .updateFieldError("meet", false);
                              Get.find<Divisions_Controller>()
                                  .updateFieldError("class", false);
                              Get.dialog(
                                AddDivision(),
                                barrierDismissible: false,
                              );
                            },
                            icon: Icon(Icons.add,
                                size: 18,
                                color: Theme.of(context).highlightColor)),
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
                              exportDataToPdf<Division>(
                                items: Get.find<Divisions_Controller>()
                                    .filteredDivision!,
                                headers: [
                                  "Name".tr,
                                  "Class".tr,
                                  "Meet URL".tr,
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
                                  "Class".tr: (reg) =>
                                      Get.find<LocalizationController>()
                                                  .currentLocale
                                                  .value
                                                  .languageCode ==
                                              'ar'
                                          ? reg.classes!.name
                                          : reg.classes!.enName,
                                  "Meet URL".tr: (reg) => reg.meetUrl ?? "",
                                },
                                fileName: "Division".tr +
                                    '${DateTime.now().toIso8601String()}',
                              );
                            },
                            icon: Icon(VMS_Icons.pdf,
                                size: 18,
                                color: Theme.of(context).highlightColor)),
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
                              exportDataToExcel<Division>(
                                items: Get.find<Divisions_Controller>()
                                    .filteredDivision!,
                                headers: [
                                  "Name".tr,
                                  "Class".tr,
                                  "Meet URL".tr,
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
                                  "Class".tr: (reg) =>
                                      Get.find<LocalizationController>()
                                                  .currentLocale
                                                  .value
                                                  .languageCode ==
                                              'ar'
                                          ? reg.classes!.name
                                          : reg.classes!.enName,
                                  "Meet URL".tr: (reg) => reg.meetUrl ?? "",
                                },
                                fileName: "Division".tr +
                                    '${DateTime.now().toIso8601String()}',
                              );
                            },
                            icon: Icon(VMS_Icons.xl,
                                size: 18,
                                color: Theme.of(context).highlightColor)),
                      ),
                    ],
                  )
                ],
              ),
            ),
        if (Get.find<Add_Data_controller>().roll != "observer")
          if (screenWidth <= 769)
            Container(
              width: screenWidth,
              margin: const EdgeInsets.only(left: 30.0, right: 30.0, top: 30.0),
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  spacing: 10.0,
                  children: [
                    DropDownAllSessions(
                        API: "division",
                        title: "Session".tr,
                        width: 250,
                        type: "session"),
                    GetBuilder<Divisions_Controller>(builder: (controller) {
                      return DropDownDivisionMgmt(
                          isLoading: controller.isLoading,
                          title: "Class".tr,
                          width: 250,
                          type: "class");
                    }),
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
                            Get.find<Divisions_Controller>().ClassDiagIndex =
                                "";
                            arName.clear();
                            enName.clear();
                            driveUrl.clear();
                            Get.find<Divisions_Controller>()
                                .updateFieldError("ename", false);
                            Get.find<Divisions_Controller>()
                                .updateFieldError("arname", false);
                            Get.find<Divisions_Controller>()
                                .updateFieldError("meet", false);
                            Get.find<Divisions_Controller>()
                                .updateFieldError("class", false);
                            Get.dialog(
                              AddDivision(),
                              barrierDismissible: false,
                            );
                          },
                          icon: Icon(Icons.add,
                              size: 18,
                              color: Theme.of(context).highlightColor)),
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
                            exportDataToPdf<Division>(
                              items: Get.find<Divisions_Controller>()
                                  .filteredDivision!,
                              headers: [
                                "Name".tr,
                                "Class".tr,
                                "Meet URL".tr,
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
                                "Class".tr: (reg) =>
                                    Get.find<LocalizationController>()
                                                .currentLocale
                                                .value
                                                .languageCode ==
                                            'ar'
                                        ? reg.classes!.name
                                        : reg.classes!.enName,
                                "Meet URL".tr: (reg) => reg.meetUrl ?? "",
                              },
                              fileName: "Division".tr +
                                  '${DateTime.now().toIso8601String()}',
                            );
                          },
                          icon: Icon(VMS_Icons.pdf,
                              size: 18,
                              color: Theme.of(context).highlightColor)),
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
                            exportDataToExcel<Division>(
                              items: Get.find<Divisions_Controller>()
                                  .filteredDivision!,
                              headers: [
                                "Name".tr,
                                "Class".tr,
                                "Meet URL".tr,
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
                                "Class".tr: (reg) =>
                                    Get.find<LocalizationController>()
                                                .currentLocale
                                                .value
                                                .languageCode ==
                                            'ar'
                                        ? reg.classes!.name
                                        : reg.classes!.enName,
                                "Meet URL".tr: (reg) => reg.meetUrl ?? "",
                              },
                              fileName: "Division".tr +
                                  '${DateTime.now().toIso8601String()}',
                            );
                          },
                          icon: Icon(VMS_Icons.xl,
                              size: 18,
                              color: Theme.of(context).highlightColor)),
                    ),
                  ],
                ),
              ),
            ),
        Expanded(
            child: Padding(
          padding: const EdgeInsets.only(top: 15.0),
          child: DivisionGrid(),
        )),
      ],
    ));
  }
}
