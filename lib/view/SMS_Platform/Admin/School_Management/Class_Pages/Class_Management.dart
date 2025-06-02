import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:vms_school/Icons_File/v_m_s__icons_icons.dart';
import 'package:vms_school/Link/API/AdminAPI/School/School_DropDown/DropdownAdminClassAPI.dart';
import 'package:vms_school/Link/API/AdminAPI/School/School_DropDown/DropdownGradeAPI.dart';
import 'package:vms_school/Link/API/AdminAPI/School/School_Screen_APIs/Class_API/Add_Class_API.dart';
import 'package:vms_school/Link/API/AdminAPI/School/School_Screen_APIs/Class_API/Get_All_Classes.dart';
import 'package:vms_school/Link/Controller/AdminController/Employee_Controllers/Add_Data_controller.dart';
import 'package:vms_school/Link/Controller/AdminController/Employee_Controllers/Virtual_Employee_Controller.dart';
import 'package:vms_school/Link/Controller/AdminController/School_Controllers/Class_Mgmt_Controller.dart';
import 'package:vms_school/Link/Controller/WidgetController/DropDown_Controllers/DropDownGradeController.dart.dart';
import 'package:vms_school/Link/Controller/WidgetController/DropDown_Controllers/Sessions_DropDown_Controller.dart';
import 'package:vms_school/Link/Functions/Class_Curriculm_Funcation.dart';
import 'package:vms_school/Link/Functions/Export_Exle_Function.dart';
import 'package:vms_school/Link/Functions/Export_PDF_Function.dart';
import 'package:vms_school/Translate/local_controller.dart';
import 'package:vms_school/view/Both_Platform/widgets/Admin/Admin_School/All_Screen_Sessions.dart';
import 'package:vms_school/view/Both_Platform/widgets/Admin/Admin_School/DropDownClassMgmt.dart';
import 'package:vms_school/view/Both_Platform/widgets/ButtonsDialog.dart';
import 'package:vms_school/view/Both_Platform/widgets/TextFieldDialog.dart';
import 'package:vms_school/view/Both_Platform/widgets/TextFildWithUpper.dart';
import 'package:vms_school/view/SMS_Platform/Admin/School_Management/Class_Pages/Classes_Grid.dart';
import 'package:vms_school/view/Both_Platform/widgets/VMSAlertDialog.dart';
import 'package:vms_school/Link/Model/AdminModel/School_Models/Classes_Model.dart';

class ClassManagement extends StatefulWidget {
  const ClassManagement({super.key});

  @override
  State<ClassManagement> createState() => _ClassManagementState();
}

class _ClassManagementState extends State<ClassManagement> {
  @override
  void initState() {
    Get.find<All_Screen_Sessions_Controller>().setSessionDefult();
    Get_All_Classes_API(context).Get_All_Classes();
    Getallgradeapi.Getallgrade();
    Get.find<ClassMgmtController>().gradeIndex = "";
    super.initState();
  }

  TextEditingController arName = TextEditingController();

  TextEditingController enName = TextEditingController();
  TextEditingController driveUrl = TextEditingController();
  final ClassMgmtController controllers = Get.put(ClassMgmtController());
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

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
                        title: "Session".tr,
                        width: 250,
                        type: "session",
                        API: 'class',
                      ),
                      GetBuilder<Dropdowngradecontroller>(
                          builder: (controller) {
                        return DropDownClassMgmt(
                            isLoading: controller.isLoading,
                            title: "Grade".tr,
                            width: 250,
                            type: "grade");
                      }),
                    ],
                  ),
                  Row(
                    spacing: 8.0,
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
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
                            onPressed: () async {
                              arName.clear();
                              enName.clear();
                              driveUrl.clear();
                              Get_Admin_Class_API(context).Get_Admin_Class();
                              controllers.selectedCurriculumNames.clear();
                              controllers.selectedCurriculums.clear();
                              controllers.gradeDiagIndex = "";
                              controllers.AdminDiagIndex = "";

                              controllers.updateFieldError("arname", false);
                              controllers.updateFieldError("enname", false);
                              controllers.updateFieldError("grade", false);
                              controllers.updateFieldError("curr", false);
                              controllers.updateFieldError("account", false);

                              if (Get.find<All_Screen_Sessions_Controller>()
                                      .sessions!
                                      .current!
                                      .year !=
                                  null) {
                                Get.dialog(barrierDismissible: false,
                                    GetBuilder<ClassMgmtController>(
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
                                              bool isGradeEmpty = controller
                                                      .gradeDiagIndex.isEmpty ||
                                                  controller.gradeDiagIndex ==
                                                      "";
                                              bool isCurrEmpty = controller
                                                  .selectedCurriculums.isEmpty;

                                              bool isAccountEmpty = controller
                                                      .selectedAdminDiagIndex
                                                      .isEmpty ||
                                                  controller
                                                          .selectedAdminDiagIndex ==
                                                      "";

                                              controller.updateFieldError(
                                                  "arname", isArNameEmpty);
                                              controller.updateFieldError(
                                                  "enname", isEnNameEmpty);
                                              controller.updateFieldError(
                                                  "grade", isGradeEmpty);
                                              controller.updateFieldError(
                                                  "curr", isCurrEmpty);

                                              controller.updateFieldError(
                                                  "account", isAccountEmpty);

                                              if (!(isArNameEmpty ||
                                                  isEnNameEmpty ||
                                                  isGradeEmpty ||
                                                  isCurrEmpty ||
                                                  isAccountEmpty)) {
                                                await Add_Class_API(context).Add_Class(
                                                    gradeId: controller.grades,
                                                    driveUrl: driveUrl.text,
                                                    enName: enName.text,
                                                    name: arName.text,
                                                    sessionId: Get.find<
                                                                All_Screen_Sessions_Controller>()
                                                            .sessions!
                                                            .current!
                                                            .id ??
                                                        "",
                                                    userId: Get.find<
                                                            Virtual_Employee_Controller>()
                                                        .vecUserID,
                                                    curriculum: Get.find<
                                                            ClassMgmtController>()
                                                        .selectedCurriculums);
                                                Get.back();
                                              }
                                            },
                                            color:
                                                Theme.of(context).primaryColor,
                                            width: 120),
                                      ],
                                      contents: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          Row(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            children: [
                                              Textfildwithupper(
                                                  isRequired: true,
                                                  isError:
                                                      controller.IsEnnameError,
                                                  onChanged: (value) {
                                                    if (value.isNotEmpty) {
                                                      controller
                                                          .updateFieldError(
                                                              "enname", false);
                                                    }
                                                  },
                                                  width: 250,
                                                  controller: enName,
                                                  Uptext: "Class En - Name".tr,
                                                  hinttext:
                                                      "Class En - Name".tr),
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                    left: 15.0,
                                                    right: 15.0,
                                                    bottom: 15.0),
                                                child: Textfildwithupper(
                                                    isRequired: true,
                                                    isError: controller
                                                        .IsArnameError,
                                                    onChanged: (value) {
                                                      if (value.isNotEmpty) {
                                                        controller
                                                            .updateFieldError(
                                                                "arname",
                                                                false);
                                                      }
                                                    },
                                                    width: 250,
                                                    controller: arName,
                                                    Uptext:
                                                        "Class Ar - Name".tr,
                                                    hinttext:
                                                        "Class Ar - Name".tr),
                                              ),
                                            ],
                                          ),
                                          Row(
                                            children: [
                                              DropDownClassMgmt(
                                                  isLoading:
                                                      controller.isLoading,
                                                  isError:
                                                      controller.IsGradeError,
                                                  title: "Grade".tr,
                                                  width: 250,
                                                  type: "gradediag"),
                                              Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          left: 15.0,
                                                          right: 15.0),
                                                  child: TextFieldDialog(
                                                      readonly: true,
                                                      width: 250,
                                                      controller:
                                                          TextEditingController(
                                                              text: Get.find<
                                                                          All_Screen_Sessions_Controller>()
                                                                      .sessions!
                                                                      .current!
                                                                      .year ??
                                                                  ""),
                                                      hinttext: "Session".tr)),
                                            ],
                                          ),
                                          Row(
                                            children: [
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                    top: 15.0, bottom: 15.0),
                                                child: GetBuilder<
                                                        Virtual_Employee_Controller>(
                                                    builder: (VECcontroller) {
                                                  return DropDownClassMgmt(
                                                      isError: controller
                                                          .IsAccountError,
                                                      isLoading: VECcontroller
                                                          .isLoading,
                                                      title: "Admin Account".tr,
                                                      width: 250,
                                                      type: "admin");
                                                }),
                                              ),
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                  top: 15.0,
                                                  bottom: 15.0,
                                                  left: 15.0,
                                                  right: 15.0,
                                                ),
                                                child: Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    GestureDetector(
                                                      onTap: () =>
                                                          Class_Curriculm_Funcation(
                                                              context),
                                                      child: Container(
                                                        padding:
                                                            EdgeInsets.only(
                                                                left: 5.0,
                                                                right: 5.0),
                                                        margin: EdgeInsets.only(
                                                            left: 15.0),
                                                        width: 250,
                                                        height: 40,
                                                        decoration: controller
                                                                .IscurrError
                                                            ? BoxDecoration(
                                                                border:
                                                                    Border.all(
                                                                  color: Colors
                                                                      .red, // تغيير لون الحدود حسب حالة الخطأ
                                                                ),
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            5),
                                                              )
                                                            : BoxDecoration(
                                                                border:
                                                                    Border.all(
                                                                  color: Color(
                                                                      0xffB3B3B3), // تغيير لون الحدود حسب حالة الخطأ
                                                                ),
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            5),
                                                              ),
                                                        child: Row(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .spaceBetween,
                                                          children: [
                                                            GetBuilder<
                                                                ClassMgmtController>(
                                                              builder:
                                                                  (controller) {
                                                                return Expanded(
                                                                  child: Text(
                                                                    maxLines: 1,
                                                                    overflow:
                                                                        TextOverflow
                                                                            .ellipsis,
                                                                    style: Theme.of(
                                                                            context)
                                                                        .textTheme
                                                                        .bodyMedium,
                                                                    controller
                                                                            .selectedCurriculumNames
                                                                            .isNotEmpty
                                                                        ? controller
                                                                            .selectedCurriculumNames
                                                                            .join(
                                                                                ', ')
                                                                        : 'No selected curriculum'
                                                                            .tr, // عرض رسالة عند عدم وجود مناهج مختارة
                                                                  ),
                                                                );
                                                              },
                                                            ),
                                                            const Icon(Icons
                                                                .arrow_drop_down),
                                                          ],
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ],
                                          ),
                                          Row(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            children: [
                                              Textfildwithupper(
                                                  isRequired: false,
                                                  width: 480,
                                                  controller: driveUrl,
                                                  Uptext: "Drive URL".tr,
                                                  hinttext: "Drive URL".tr),
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                    left: 5.0, top: 36.0),
                                                child: SvgPicture.asset(
                                                    "assets/images/drive.svg",
                                                    width: 25),
                                              )
                                            ],
                                          ),
                                        ],
                                      ),
                                      apptitle: "Add Class".tr,
                                      subtitle: "none");
                                }));
                              } else {
                                Get.dialog(VMSAlertDialog(
                                    action: [],
                                    contents: Container(
                                      width: 200,
                                      height: 200,
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Text(
                                              style:
                                                  Get.theme.textTheme.bodyLarge,
                                              textAlign: TextAlign.center,
                                              maxLines: 5,
                                              "There is no open academic year available to add classes to. Please add an open academic year and try again."
                                                  .tr)
                                        ],
                                      ),
                                    ),
                                    apptitle: "No Sessions".tr,
                                    subtitle: "none"));
                              }
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
                              exportDataToPdf<Classes>(
                                items: Get.find<ClassMgmtController>()
                                    .filteredreclasses!,
                                headers: [
                                  "Name".tr,
                                  "Grade".tr,
                                  "Session".tr,
                                  "Drive URL".tr,
                                  "Admin Account".tr,
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
                                  "Grade".tr: (reg) =>
                                      Get.find<LocalizationController>()
                                                  .currentLocale
                                                  .value
                                                  .languageCode ==
                                              'ar'
                                          ? reg.grade!.name
                                          : reg.grade!.enName,
                                  "Drive URL".tr: (reg) => reg.driveUrl ?? "",
                                  "Session".tr: (reg) =>
                                      reg.session!.year ?? "",
                                  "Admin Account".tr: (reg) =>
                                      reg.admin!.userName ?? "",
                                },
                                fileName: "Class".tr +
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
                              exportDataToExcel<Classes>(
                                items: Get.find<ClassMgmtController>()
                                    .filteredreclasses!,
                                headers: [
                                  "Name".tr,
                                  "Grade".tr,
                                  "Drive URL".tr,
                                  "Admin Account".tr,
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
                                  "Grade".tr: (reg) =>
                                      Get.find<LocalizationController>()
                                                  .currentLocale
                                                  .value
                                                  .languageCode ==
                                              'ar'
                                          ? reg.grade!.name
                                          : reg.grade!.enName,
                                  "Drive URL".tr: (reg) => reg.driveUrl ?? "",
                                  "Admin Account".tr: (reg) =>
                                      reg.admin!.userName ?? "",
                                },
                                fileName: "Class".tr +
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
                      title: "Session".tr,
                      width: 250,
                      type: "session",
                      API: 'class',
                    ),
                    GetBuilder<Dropdowngradecontroller>(builder: (controller) {
                      return DropDownClassMgmt(
                          isLoading: controller.isLoading,
                          title: "Grade".tr,
                          width: 250,
                          type: "grade");
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
                          onPressed: () async {
                            arName.clear();
                            enName.clear();
                            driveUrl.clear();
                            Get_Admin_Class_API(context).Get_Admin_Class();
                            controllers.selectedCurriculumNames.clear();
                            controllers.selectedCurriculums.clear();
                            controllers.gradeDiagIndex = "";
                            controllers.AdminDiagIndex = "";

                            controllers.updateFieldError("arname", false);
                            controllers.updateFieldError("enname", false);
                            controllers.updateFieldError("grade", false);
                            controllers.updateFieldError("curr", false);
                            controllers.updateFieldError("drive", false);
                            controllers.updateFieldError("account", false);

                            Get.dialog(barrierDismissible: false,
                                GetBuilder<ClassMgmtController>(
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
                                          bool isGradeEmpty = controller
                                                  .gradeDiagIndex.isEmpty ||
                                              controller.gradeDiagIndex == "";
                                          bool isCurrEmpty = controller
                                              .selectedCurriculums.isEmpty;

                                          bool isAccountEmpty = controller
                                                  .selectedAdminDiagIndex
                                                  .isEmpty ||
                                              controller
                                                      .selectedAdminDiagIndex ==
                                                  "";

                                          controller.updateFieldError(
                                              "arname", isArNameEmpty);
                                          controller.updateFieldError(
                                              "enname", isEnNameEmpty);
                                          controller.updateFieldError(
                                              "grade", isGradeEmpty);
                                          controller.updateFieldError(
                                              "curr", isCurrEmpty);

                                          controller.updateFieldError(
                                              "account", isAccountEmpty);

                                          if (!(isArNameEmpty ||
                                              isEnNameEmpty ||
                                              isGradeEmpty ||
                                              isCurrEmpty)) {
                                            await Add_Class_API(context).Add_Class(
                                                gradeId: controller.grades,
                                                driveUrl: driveUrl.text,
                                                enName: enName.text,
                                                name: arName.text,
                                                sessionId: Get.find<
                                                            All_Screen_Sessions_Controller>()
                                                        .sessions!
                                                        .current!
                                                        .id ??
                                                    "",
                                                userId: Get.find<
                                                        Virtual_Employee_Controller>()
                                                    .vecUserID,
                                                curriculum: Get.find<
                                                        ClassMgmtController>()
                                                    .selectedCurriculums);
                                            Get.back();
                                          }
                                        },
                                        color: Theme.of(context).primaryColor,
                                        width: 120),
                                  ],
                                  contents: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          Textfildwithupper(
                                              isRequired: true,
                                              isError: controller.IsEnnameError,
                                              onChanged: (value) {
                                                if (value.isNotEmpty) {
                                                  controller.updateFieldError(
                                                      "enname", false);
                                                }
                                              },
                                              width: 250,
                                              controller: enName,
                                              Uptext: "Class En - Name".tr,
                                              hinttext: "Class En - Name".tr),
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                left: 15.0,
                                                right: 15.0,
                                                bottom: 15.0),
                                            child: Textfildwithupper(
                                                isRequired: true,
                                                isError:
                                                    controller.IsArnameError,
                                                onChanged: (value) {
                                                  if (value.isNotEmpty) {
                                                    controller.updateFieldError(
                                                        "arname", false);
                                                  }
                                                },
                                                width: 250,
                                                controller: arName,
                                                Uptext: "Class Ar - Name".tr,
                                                hinttext: "Class Ar - Name".tr),
                                          ),
                                        ],
                                      ),
                                      Row(
                                        children: [
                                          DropDownClassMgmt(
                                              isLoading: controller.isLoading,
                                              isError: controller.IsGradeError,
                                              title: "Grade".tr,
                                              width: 250,
                                              type: "gradediag"),
                                          Padding(
                                              padding: const EdgeInsets.only(
                                                  left: 15.0, right: 15.0),
                                              child: TextFieldDialog(
                                                  readonly: true,
                                                  width: 250,
                                                  controller: TextEditingController(
                                                      text: Get.find<
                                                                  All_Screen_Sessions_Controller>()
                                                              .sessions!
                                                              .current!
                                                              .year ??
                                                          ""),
                                                  hinttext: "Session".tr)),
                                        ],
                                      ),
                                      Row(
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                top: 15.0, bottom: 15.0),
                                            child: GetBuilder<
                                                    Virtual_Employee_Controller>(
                                                builder: (VECcontroller) {
                                              return DropDownClassMgmt(
                                                  isError:
                                                      controller.IsAccountError,
                                                  isLoading:
                                                      VECcontroller.isLoading,
                                                  title: "Admin Account".tr,
                                                  width: 250,
                                                  type: "admin");
                                            }),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.only(
                                              top: 15.0,
                                              bottom: 15.0,
                                              left: 15.0,
                                              right: 15.0,
                                            ),
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                GestureDetector(
                                                  onTap: () =>
                                                      Class_Curriculm_Funcation(
                                                          context),
                                                  child: Container(
                                                    padding: EdgeInsets.only(
                                                        left: 5.0, right: 5.0),
                                                    margin: EdgeInsets.only(
                                                        left: 15.0),
                                                    width: 250,
                                                    height: 40,
                                                    decoration: controller
                                                            .IscurrError
                                                        ? BoxDecoration(
                                                            border: Border.all(
                                                              color: Colors
                                                                  .red, // تغيير لون الحدود حسب حالة الخطأ
                                                            ),
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        5),
                                                          )
                                                        : BoxDecoration(
                                                            border: Border.all(
                                                              color: Color(
                                                                  0xffB3B3B3), // تغيير لون الحدود حسب حالة الخطأ
                                                            ),
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        5),
                                                          ),
                                                    child: Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceBetween,
                                                      children: [
                                                        GetBuilder<
                                                            ClassMgmtController>(
                                                          builder:
                                                              (controller) {
                                                            return Expanded(
                                                              child: Text(
                                                                maxLines: 1,
                                                                overflow:
                                                                    TextOverflow
                                                                        .ellipsis,
                                                                style: Theme.of(
                                                                        context)
                                                                    .textTheme
                                                                    .bodyMedium,
                                                                controller
                                                                        .selectedCurriculumNames
                                                                        .isNotEmpty
                                                                    ? controller
                                                                        .selectedCurriculumNames
                                                                        .join(
                                                                            ', ')
                                                                    : 'No selected curriculum'
                                                                        .tr, // عرض رسالة عند عدم وجود مناهج مختارة
                                                              ),
                                                            );
                                                          },
                                                        ),
                                                        const Icon(Icons
                                                            .arrow_drop_down),
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                      Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          Textfildwithupper(
                                              isRequired: false,
                                              width: 480,
                                              controller: driveUrl,
                                              Uptext: "Drive URL".tr,
                                              hinttext: "Drive URL".tr),
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                left: 5.0, top: 36.0),
                                            child: SvgPicture.asset(
                                                "assets/images/drive.svg",
                                                width: 25),
                                          )
                                        ],
                                      ),
                                    ],
                                  ),
                                  apptitle: "Add Class".tr,
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
                            exportDataToPdf<Classes>(
                              items: Get.find<ClassMgmtController>()
                                  .filteredreclasses!,
                              headers: [
                                "Name".tr,
                                "Grade".tr,
                                "Drive URL".tr,
                                "Admin Account".tr,
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
                                "Grade".tr: (reg) =>
                                    Get.find<LocalizationController>()
                                                .currentLocale
                                                .value
                                                .languageCode ==
                                            'ar'
                                        ? reg.grade!.name
                                        : reg.grade!.enName,
                                "Drive URL".tr: (reg) => reg.driveUrl ?? "",
                                "Admin Account".tr: (reg) =>
                                    reg.admin!.userName ?? "",
                              },
                              fileName: "Class".tr +
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
                            exportDataToExcel<Classes>(
                              items: Get.find<ClassMgmtController>()
                                  .filteredreclasses!,
                              headers: [
                                "Name".tr,
                                "Grade".tr,
                                "Admin Account".tr,
                                "Drive URL".tr,
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
                                "Grade".tr: (reg) =>
                                    Get.find<LocalizationController>()
                                                .currentLocale
                                                .value
                                                .languageCode ==
                                            'ar'
                                        ? reg.grade!.name
                                        : reg.grade!.enName,
                                "Admin Account".tr: (reg) =>
                                    reg.admin!.userName ?? "",
                                "Drive URL".tr: (reg) => reg.driveUrl ?? "",
                              },
                              fileName: "Class".tr +
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
              ),
            ),
        Expanded(
            child: Padding(
          padding: const EdgeInsets.only(top: 15.0),
          child: ClassGrid(),
        )),
      ],
    ));
  }
}
