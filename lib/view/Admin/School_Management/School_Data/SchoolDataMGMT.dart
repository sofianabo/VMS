import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:vms_school/Icons_File/v_m_s__icons_icons.dart';
import 'package:vms_school/Link/API/AdminAPI/School/School_Info_Export.dart';
import 'package:vms_school/Link/API/AdminAPI/School/School_Screen_APIs/School_Data_API.dart';
import 'package:vms_school/Link/API/AdminAPI/School/School_Screen_APIs/Update_School_Data.dart';
import 'package:vms_school/Link/Controller/AdminController/Employee_Controllers/Add_Data_controller.dart';
import 'package:vms_school/Link/Controller/AdminController/School_Controllers/School_Info_Controller.dart';
import 'package:vms_school/Translate/local_controller.dart';
import 'package:vms_school/main.dart';
import 'package:vms_school/widgets/Squer_Button_Enabled_Disabled.dart';
import 'package:vms_school/widgets/TextFildWithUpper.dart';

class SchoolDataMgmt extends StatefulWidget {
  const SchoolDataMgmt({super.key});

  @override
  State<SchoolDataMgmt> createState() => _SchoolDataMgmtState();
}

class _SchoolDataMgmtState extends State<SchoolDataMgmt> {
  @override
  void initState() {
    School_Data_API(context).School_Data();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: GetBuilder<SchoolInfoController>(builder: (controller) {
      if (controller.isLoading) {
        return Expanded(
          child: Container(
            width: Get.width * 0.9,
            child: LoadingAnimationWidget.inkDrop(
              color: Theme.of(context).primaryColor,
              size: 60,
            ),
          ),
        );
      }
      return Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 18.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Squer_Button_Enabled_Disabled(
                  icon: Icons.save,
                  onTap: () {
                    bool isSchool_NameEmpty =
                        controller.School_Name.text.isEmpty;

                    bool isLicense_NumberEmpty =
                        controller.License_Number.text.isEmpty;

                    bool isAddressEmpty = controller.Address.text.isEmpty;

                    bool isVillageEmpty = controller.Village.text.isEmpty;

                    bool isRegionEmpty = controller.Region.text.isEmpty;

                    bool isPhoneEmpty = controller.Phone.text.isEmpty;
                    RegExp emailRegex = RegExp(
                        r"^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$");
                    bool isEmailValid =
                        emailRegex.hasMatch(controller.Email.text);
                    bool isEmailEmpty =
                        controller.Email.text.isEmpty || !isEmailValid;

                    bool isCreation_YearEmpty =
                        controller.Creation_Year.text.isEmpty;

                    bool isCongregation_numberEmpty =
                        controller.Congregation_number.text.isEmpty;

                    bool isTown_ChipEmpty = controller.Town_Chip.text.isEmpty;

                    bool isWork_Begin_YearEmpty =
                        controller.Work_Begin_Year.text.isEmpty;

                    controller.updateFieldError("name", isSchool_NameEmpty);
                    controller.updateFieldError("lic", isLicense_NumberEmpty);
                    controller.updateFieldError("address", isAddressEmpty);
                    controller.updateFieldError("vill", isVillageEmpty);
                    controller.updateFieldError("reg", isRegionEmpty);
                    controller.updateFieldError("phone", isPhoneEmpty);
                    controller.updateFieldError("work", isWork_Begin_YearEmpty);
                    controller.updateFieldError("cx", isCreation_YearEmpty);
                    controller.updateFieldError("email", isEmailEmpty);
                    controller.updateFieldError(
                        "cnum", isCongregation_numberEmpty);
                    controller.updateFieldError("twn", isTown_ChipEmpty);

                    if (!(isSchool_NameEmpty ||
                        isLicense_NumberEmpty ||
                        isAddressEmpty ||
                        isVillageEmpty ||
                        isRegionEmpty ||
                        isPhoneEmpty ||
                        isEmailEmpty ||
                        isCreation_YearEmpty ||
                        isCongregation_numberEmpty ||
                        isTown_ChipEmpty ||
                        isWork_Begin_YearEmpty)) {
                      Update_School_Data_API(context).Update_School_Data();
                    }
                  },
                  validate: Get.find<Add_Data_controller>().roll == "subAdmin",
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 10.0),
                  child: Container(
                    width: 40,
                    height: 40,
                    decoration: BoxDecoration(
                        color: Get.theme.cardColor,
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
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(5))))),
                        onPressed: () async {
                          bool isSchool_NameEmpty =
                              controller.School_Name.text.isEmpty;

                          bool isLicense_NumberEmpty =
                              controller.License_Number.text.isEmpty;

                          bool isAddressEmpty = controller.Address.text.isEmpty;

                          bool isVillageEmpty = controller.Village.text.isEmpty;

                          bool isRegionEmpty = controller.Region.text.isEmpty;

                          bool isPhoneEmpty = controller.Phone.text.isEmpty;
                          RegExp emailRegex = RegExp(
                              r"^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$");
                          bool isEmailValid =
                              emailRegex.hasMatch(controller.Email.text);
                          bool isEmailEmpty =
                              controller.Email.text.isEmpty || !isEmailValid;

                          bool isCreation_YearEmpty =
                              controller.Creation_Year.text.isEmpty;

                          bool isCongregation_numberEmpty =
                              controller.Congregation_number.text.isEmpty;

                          bool isTown_ChipEmpty =
                              controller.Town_Chip.text.isEmpty;

                          bool isWork_Begin_YearEmpty =
                              controller.Work_Begin_Year.text.isEmpty;

                          controller.updateFieldError(
                              "name", isSchool_NameEmpty);
                          controller.updateFieldError(
                              "lic", isLicense_NumberEmpty);
                          controller.updateFieldError(
                              "address", isAddressEmpty);
                          controller.updateFieldError("vill", isVillageEmpty);
                          controller.updateFieldError("reg", isRegionEmpty);
                          controller.updateFieldError("phone", isPhoneEmpty);
                          controller.updateFieldError(
                              "work", isWork_Begin_YearEmpty);
                          controller.updateFieldError(
                              "cx", isCreation_YearEmpty);
                          controller.updateFieldError("email", isEmailEmpty);
                          controller.updateFieldError(
                              "cnum", isCongregation_numberEmpty);
                          controller.updateFieldError("twn", isTown_ChipEmpty);

                          if (!(isSchool_NameEmpty ||
                              isLicense_NumberEmpty ||
                              isAddressEmpty ||
                              isVillageEmpty ||
                              isRegionEmpty ||
                              isPhoneEmpty ||
                              isEmailEmpty ||
                              isCreation_YearEmpty ||
                              isCongregation_numberEmpty ||
                              isTown_ChipEmpty ||
                              isWork_Begin_YearEmpty)) {
                            await exportToPdf(controller.SchoolInfo);
                          }
                        },
                        icon: Icon(VMS_Icons.pdf,
                            size: 18, color: Theme.of(context).highlightColor)),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 20.0, left: 10.0),
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
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(5))))),
                        onPressed: () {
                          bool isSchool_NameEmpty =
                              controller.School_Name.text.isEmpty;

                          bool isLicense_NumberEmpty =
                              controller.License_Number.text.isEmpty;

                          bool isAddressEmpty = controller.Address.text.isEmpty;

                          bool isVillageEmpty = controller.Village.text.isEmpty;

                          bool isRegionEmpty = controller.Region.text.isEmpty;

                          bool isPhoneEmpty = controller.Phone.text.isEmpty;
                          RegExp emailRegex = RegExp(
                              r"^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$");
                          bool isEmailValid =
                              emailRegex.hasMatch(controller.Email.text);

                          bool isEmailEmpty =
                              controller.Email.text.isEmpty || !isEmailValid;

                          bool isCreation_YearEmpty =
                              controller.Creation_Year.text.isEmpty;

                          bool isCongregation_numberEmpty =
                              controller.Congregation_number.text.isEmpty;

                          bool isTown_ChipEmpty =
                              controller.Town_Chip.text.isEmpty;

                          bool isWork_Begin_YearEmpty =
                              controller.Work_Begin_Year.text.isEmpty;

                          controller.updateFieldError(
                              "name", isSchool_NameEmpty);
                          controller.updateFieldError(
                              "lic", isLicense_NumberEmpty);
                          controller.updateFieldError(
                              "address", isAddressEmpty);
                          controller.updateFieldError("vill", isVillageEmpty);
                          controller.updateFieldError("reg", isRegionEmpty);
                          controller.updateFieldError("phone", isPhoneEmpty);
                          controller.updateFieldError(
                              "work", isWork_Begin_YearEmpty);
                          controller.updateFieldError(
                              "cx", isCreation_YearEmpty);
                          controller.updateFieldError("email", isEmailEmpty);
                          controller.updateFieldError(
                              "cnum", isCongregation_numberEmpty);
                          controller.updateFieldError("twn", isTown_ChipEmpty);

                          if (!(isSchool_NameEmpty ||
                              isLicense_NumberEmpty ||
                              isAddressEmpty ||
                              isVillageEmpty ||
                              isRegionEmpty ||
                              isPhoneEmpty ||
                              isEmailEmpty ||
                              isCreation_YearEmpty ||
                              isCongregation_numberEmpty ||
                              isTown_ChipEmpty ||
                              isWork_Begin_YearEmpty)) {
                            exportToExcel(controller.SchoolInfo, [
                              'مرحبا',
                              'مرحبا',
                              'مرحبا',
                              'مرحبا',
                              'مرحبا',
                              'مرحبا',
                              'مرحبا',
                              'مرحبا',
                              'مرحبا',
                              'مرحبا',
                              'مرحبا',
                              'مرحبا',
                              'مرحبا',
                            ]);
                          }
                        },
                        icon: Icon(VMS_Icons.xl,
                            size: 18, color: Theme.of(context).highlightColor)),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Directionality(
                textDirection: prefs!.getString(languageKey) == "ar"
                    ? TextDirection.rtl
                    : TextDirection.ltr,
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 40.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      GetBuilder<SchoolInfoController>(builder: (controller) {
                        return Container(
                            padding: const EdgeInsets.all(15.0),
                            decoration: BoxDecoration(
                                border:
                                    Border.all(color: const Color(0xffB3B3B3)),
                                borderRadius:
                                    const BorderRadius.all(Radius.circular(5))),
                            margin: const EdgeInsets.only(
                                left: 30.0, right: 30.0, top: 30.0),
                            alignment: Alignment.center,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Textfildwithupper(
                                        enabled: Get.find<Add_Data_controller>()
                                                .roll !=
                                            "subAdmin",
                                        isRequired: true,
                                        isError: controller.IsnameError,
                                        onChanged: (value) {
                                          if (value.isNotEmpty) {
                                            controller.updateFieldError(
                                                "name", false);
                                          }
                                        },
                                        width: Get.width / 2.5,
                                        controller: controller.School_Name,
                                        Uptext: "School Name".tr,
                                        hinttext: "School Name".tr),
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          left: 20.0, right: 20.0),
                                      child: Textfildwithupper(
                                          enabled:
                                              Get.find<Add_Data_controller>()
                                                      .roll !=
                                                  "subAdmin",
                                          isError: controller.IslicError,
                                          onChanged: (value) {
                                            if (value.isNotEmpty) {
                                              controller.updateFieldError(
                                                  "lic", false);
                                            }
                                          },
                                          isRequired: true,
                                          width: Get.width / 2.5,
                                          controller: controller.License_Number,
                                          Uptext: "License Number".tr,
                                          hinttext: "License Number".tr),
                                    )
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Textfildwithupper(
                                        enabled: Get.find<Add_Data_controller>()
                                                .roll !=
                                            "subAdmin",
                                        isError: controller.IsaddressError,
                                        onChanged: (value) {
                                          if (value.isNotEmpty) {
                                            controller.updateFieldError(
                                                "address", false);
                                          }
                                        },
                                        isRequired: true,
                                        width: Get.width / 2.5,
                                        controller: controller.Address,
                                        Uptext: "Address".tr,
                                        hinttext: "Address".tr),
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          left: 20.0, right: 20.0),
                                      child: Textfildwithupper(
                                          enabled:
                                              Get.find<Add_Data_controller>()
                                                      .roll !=
                                                  "subAdmin",
                                          isError: controller.IsvillError,
                                          onChanged: (value) {
                                            if (value.isNotEmpty) {
                                              controller.updateFieldError(
                                                  "vill", false);
                                            }
                                          },
                                          isRequired: true,
                                          width: Get.width / 2.5,
                                          controller: controller.Village,
                                          Uptext: "Village".tr,
                                          hinttext: "Village".tr),
                                    )
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Textfildwithupper(
                                        enabled: Get.find<Add_Data_controller>()
                                                .roll !=
                                            "subAdmin",
                                        isError: controller.IsregError,
                                        onChanged: (value) {
                                          if (value.isNotEmpty) {
                                            controller.updateFieldError(
                                                "reg", false);
                                          }
                                        },
                                        isRequired: true,
                                        width: Get.width / 2.5,
                                        controller: controller.Region,
                                        Uptext: "Region".tr,
                                        hinttext: "Region".tr),
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          left: 20.0, right: 20.0),
                                      child: Textfildwithupper(
                                          enabled:
                                              Get.find<Add_Data_controller>()
                                                      .roll !=
                                                  "subAdmin",
                                          isError: controller.Isphoneror,
                                          onChanged: (value) {
                                            if (value.isNotEmpty) {
                                              controller.updateFieldError(
                                                  "phone", false);
                                            }
                                          },
                                          fieldType: "phone",
                                          isRequired: true,
                                          width: Get.width / 2.5,
                                          controller: controller.Phone,
                                          Uptext: "Phone".tr,
                                          hinttext: "Phone".tr),
                                    )
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Textfildwithupper(
                                        enabled: Get.find<Add_Data_controller>()
                                                .roll !=
                                            "subAdmin",
                                        isError: controller.IsworkError,
                                        onChanged: (value) {
                                          if (value.isNotEmpty) {
                                            controller.updateFieldError(
                                                "work", false);
                                          }
                                        },
                                        fieldType: "number",
                                        isRequired: true,
                                        width: Get.width / 2.5,
                                        controller: controller.Work_Begin_Year,
                                        Uptext: "Work Begin Year".tr,
                                        hinttext: "Work Begin Year".tr),
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          left: 20.0, right: 20.0),
                                      child: Textfildwithupper(
                                          enabled:
                                              Get.find<Add_Data_controller>()
                                                      .roll !=
                                                  "subAdmin",
                                          isError: controller.IscxError,
                                          onChanged: (value) {
                                            if (value.isNotEmpty) {
                                              controller.updateFieldError(
                                                  "cx", false);
                                            }
                                          },
                                          fieldType: "number",
                                          isRequired: true,
                                          width: Get.width / 2.5,
                                          controller: controller.Creation_Year,
                                          Uptext: "Creation Year".tr,
                                          hinttext: "Creation Year".tr),
                                    )
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Textfildwithupper(
                                        enabled: Get.find<Add_Data_controller>()
                                                .roll !=
                                            "subAdmin",
                                        isError: controller.IsemailError,
                                        onChanged: (value) {
                                          if (value.isNotEmpty) {
                                            controller.updateFieldError(
                                                "email", false);
                                          }
                                        },
                                        fieldType: "email",
                                        isRequired: true,
                                        width: Get.width / 2.5,
                                        controller: controller.Email,
                                        Uptext: "Email".tr,
                                        hinttext: "Email".tr),
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          left: 20.0, right: 20.0),
                                      child: Textfildwithupper(
                                          enabled:
                                              Get.find<Add_Data_controller>()
                                                      .roll !=
                                                  "subAdmin",
                                          width: Get.width / 2.5,
                                          controller: controller.Fax,
                                          Uptext: "Fax".tr,
                                          hinttext: "Fax".tr),
                                    )
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Textfildwithupper(
                                        enabled: Get.find<Add_Data_controller>()
                                                .roll !=
                                            "subAdmin",
                                        width: Get.width / 2.5,
                                        controller: controller.Clinic_Name,
                                        Uptext: "Clinic Name".tr,
                                        hinttext: "Clinic Name".tr),
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          left: 20.0, right: 20.0),
                                      child: Textfildwithupper(
                                          enabled:
                                              Get.find<Add_Data_controller>()
                                                      .roll !=
                                                  "subAdmin",
                                          fieldType: "number",
                                          isError: controller.IscnumError,
                                          onChanged: (value) {
                                            if (value.isNotEmpty) {
                                              controller.updateFieldError(
                                                  "cnum", false);
                                            }
                                          },
                                          isRequired: true,
                                          width: Get.width / 2.5,
                                          controller:
                                              controller.Congregation_number,
                                          Uptext: "Congregation number".tr,
                                          hinttext: "Congregation number".tr),
                                    )
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Textfildwithupper(
                                        enabled: Get.find<Add_Data_controller>()
                                                .roll !=
                                            "subAdmin",
                                        width: Get.width / 2.5,
                                        controller: controller.Previous_name,
                                        Uptext: "Previous name".tr,
                                        hinttext: "Previous name".tr),
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          left: 20.0, right: 20.0),
                                      child: Textfildwithupper(
                                          enabled:
                                              Get.find<Add_Data_controller>()
                                                      .roll !=
                                                  "subAdmin",
                                          isError: controller.IstwnError,
                                          onChanged: (value) {
                                            if (value.isNotEmpty) {
                                              controller.updateFieldError(
                                                  "twn", false);
                                            }
                                          },
                                          isRequired: true,
                                          width: Get.width / 2.5,
                                          controller: controller.Town_Chip,
                                          Uptext: "Town Chip".tr,
                                          hinttext: "Town Chip".tr),
                                    )
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    SizedBox(
                                      width: Get.width / 2.5,
                                      child: Column(
                                        children: [
                                          Obx(() => Row(
                                                children: [
                                                  Checkbox(
                                                    checkColor: Colors.white,
                                                    value: controller
                                                        .Outstanding_School
                                                        .value,
                                                    onChanged: (value) {
                                                      if (Get.find<
                                                                  Add_Data_controller>()
                                                              .roll !=
                                                          "subAdmin") {
                                                        controller
                                                            .Outstanding_School
                                                            .value = value!;
                                                      }
                                                    },
                                                  ),
                                                  Text("Outstanding School".tr),
                                                ],
                                              )),
                                          Obx(() => Row(
                                                children: [
                                                  Checkbox(
                                                    checkColor: Colors.white,
                                                    value: controller
                                                        .Taken_OverSchool.value,
                                                    onChanged: (value) {
                                                      if (Get.find<
                                                                  Add_Data_controller>()
                                                              .roll !=
                                                          "subAdmin") {
                                                        controller
                                                            .Taken_OverSchool
                                                            .value = value!;
                                                      }
                                                    },
                                                  ),
                                                  Text("Taken Over School".tr),
                                                ],
                                              )),
                                          Obx(() => Row(
                                                children: [
                                                  Checkbox(
                                                    checkColor: Colors.white,
                                                    value: controller
                                                        .Reassignment_Teachers
                                                        .value,
                                                    onChanged: (value) {
                                                      if (Get.find<
                                                                  Add_Data_controller>()
                                                              .roll !=
                                                          "subAdmin") {
                                                        controller
                                                            .Reassignment_Teachers
                                                            .value = value!;
                                                      }
                                                    },
                                                  ),
                                                  Text("Reassignment Teachers"
                                                      .tr),
                                                ],
                                              )),
                                          Obx(() => Row(
                                                children: [
                                                  Checkbox(
                                                    checkColor: Colors.white,
                                                    value: controller
                                                        .Martyrs_Sons.value,
                                                    onChanged: (value) {
                                                      if (Get.find<
                                                                  Add_Data_controller>()
                                                              .roll !=
                                                          "subAdmin") {
                                                        controller.Martyrs_Sons
                                                            .value = value!;
                                                      }
                                                    },
                                                  ),
                                                  Text("Martyrs Sons".tr),
                                                ],
                                              )),
                                          Obx(() => Row(
                                                children: [
                                                  Checkbox(
                                                    checkColor: Colors.white,
                                                    value: controller
                                                        .evening.value,
                                                    onChanged: (value) {
                                                      if (Get.find<
                                                                  Add_Data_controller>()
                                                              .roll !=
                                                          "subAdmin") {
                                                        controller.evening
                                                            .value = value!;
                                                      }
                                                    },
                                                  ),
                                                  Text("Evening".tr),
                                                ],
                                              )),
                                        ],
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          left: 20.0, right: 20.0),
                                      child: SizedBox(
                                        width: Get.width / 2.5,
                                        child: Column(
                                          children: [
                                            Obx(() => Row(
                                                  children: [
                                                    Checkbox(
                                                      checkColor: Colors.white,
                                                      value: controller
                                                          .Internet_Connection
                                                          .value,
                                                      onChanged: (value) {
                                                        if (Get.find<
                                                                    Add_Data_controller>()
                                                                .roll !=
                                                            "subAdmin") {
                                                          controller
                                                              .Internet_Connection
                                                              .value = value!;
                                                        }
                                                      },
                                                    ),
                                                    Text("Internet Connection"
                                                        .tr),
                                                  ],
                                                )),
                                            Obx(() => Row(
                                                  children: [
                                                    Checkbox(
                                                      checkColor: Colors.white,
                                                      value: controller
                                                          .Government_Connection
                                                          .value,
                                                      onChanged: (value) {
                                                        if (Get.find<
                                                                    Add_Data_controller>()
                                                                .roll !=
                                                            "subAdmin") {
                                                          controller
                                                              .Government_Connection
                                                              .value = value!;
                                                        }
                                                      },
                                                    ),
                                                    Text("Government Connection"
                                                        .tr),
                                                  ],
                                                )),
                                            Obx(() => Row(
                                                  children: [
                                                    Checkbox(
                                                      checkColor: Colors.white,
                                                      value: controller
                                                          .Joint_Building.value,
                                                      onChanged: (value) {
                                                        if (Get.find<
                                                                    Add_Data_controller>()
                                                                .roll !=
                                                            "subAdmin") {
                                                          controller
                                                              .Joint_Building
                                                              .value = value!;
                                                        }
                                                      },
                                                    ),
                                                    Text("Joint Building".tr),
                                                  ],
                                                )),
                                            Obx(() => Row(
                                                  children: [
                                                    Checkbox(
                                                      checkColor: Colors.white,
                                                      value: controller
                                                          .Industrial_Section
                                                          .value,
                                                      onChanged: (value) {
                                                        if (Get.find<
                                                                    Add_Data_controller>()
                                                                .roll !=
                                                            "subAdmin") {
                                                          controller
                                                              .Industrial_Section
                                                              .value = value!;
                                                        }
                                                      },
                                                    ),
                                                    Text("Industrial Section"
                                                        .tr),
                                                  ],
                                                )),
                                            Obx(() => Row(
                                                  children: [
                                                    Checkbox(
                                                      checkColor: Colors.white,
                                                      value: controller
                                                          .morning.value,
                                                      onChanged: (value) {
                                                        if (Get.find<
                                                                    Add_Data_controller>()
                                                                .roll !=
                                                            "subAdmin") {
                                                          controller.morning
                                                              .value = value!;
                                                        }
                                                      },
                                                    ),
                                                    Text("Morning".tr),
                                                  ],
                                                )),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ));
                      }),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      );
    }));
  }
}
