import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:vms_school/Icons_File/v_m_s__icons_icons.dart';
import 'package:vms_school/Link/API/AdminAPI/School/School_Screen_APIs/SchoolDataAPI/School_Data_API.dart';
import 'package:vms_school/Link/API/AdminAPI/School/School_Screen_APIs/SchoolDataAPI/Update_School_Data.dart';
import 'package:vms_school/Link/Controller/AdminController/Employee_Controllers/Add_Data_controller.dart';
import 'package:vms_school/Link/Controller/AdminController/School_Controllers/School_Info_Controller.dart';
import 'package:vms_school/Link/Functions/Export_Exle_Function.dart';
import 'package:vms_school/Link/Functions/Export_PDF_Function.dart';
import 'package:vms_school/Translate/local_controller.dart';
import 'package:vms_school/view/SMS_Platform/Admin/School_Management/School_Data/School_Data_Bottom.dart';
import 'package:vms_school/view/Both_Platform/widgets/Squer_Button_Enabled_Disabled.dart';

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
    print(Get.find<Add_Data_controller>().roll);
    return Expanded(
      child: GetBuilder<SchoolInfoController>(builder: (controller) {
        if (controller.isLoading) {
          return Center(
            child: LoadingAnimationWidget.inkDrop(
              color: Theme.of(context).primaryColor,
              size: 60,
            ),
          );
        }
        return Column(
          children: [
            GetBuilder<Add_Data_controller>(builder: (cont) {
              if (cont.roll != "observer") {
                return Padding(
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

                          bool isEnglishAddressEmpty =
                              controller.EnglishAddress.text.isEmpty;
                          bool isArabicAddressEmpty =
                              controller.ArabicAddress.text.isEmpty;

                          bool isEnglishVillageEmpty =
                              controller.EnglishVillage.text.isEmpty;
                          bool isArabicVillageEmpty =
                              controller.ArabicVillage.text.isEmpty;

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
                              "Englishaddress", isEnglishAddressEmpty);
                          controller.updateFieldError(
                              "Arabicaddress", isArabicAddressEmpty);
                          controller.updateFieldError(
                              "Englishvill", isEnglishVillageEmpty);
                          controller.updateFieldError(
                              "Arabicvill", isArabicVillageEmpty);
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
                              isEnglishAddressEmpty ||
                              isArabicAddressEmpty ||
                              isEnglishVillageEmpty ||
                              isArabicVillageEmpty ||
                              isRegionEmpty ||
                              isPhoneEmpty ||
                              isEmailEmpty ||
                              isCreation_YearEmpty ||
                              isCongregation_numberEmpty ||
                              isTown_ChipEmpty ||
                              isWork_Begin_YearEmpty)) {
                            Update_School_Data_API(context)
                                .Update_School_Data();
                          }
                        },
                        validate:
                            Get.find<Add_Data_controller>().roll == "subAdmin",
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
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(5))))),
                              onPressed: () async {
                                bool isSchool_NameEmpty =
                                    controller.School_Name.text.isEmpty;

                                bool isLicense_NumberEmpty =
                                    controller.License_Number.text.isEmpty;

                                bool isArabicAddressEmpty =
                                    controller.ArabicAddress.text.isEmpty;

                                bool isEnglishAddressEmpty =
                                    controller.EnglishAddress.text.isEmpty;

                                bool isArabicVillageEmpty =
                                    controller.ArabicVillage.text.isEmpty;

                                bool isEnglishVillageEmpty =
                                    controller.EnglishVillage.text.isEmpty;

                                bool isRegionEmpty =
                                    controller.Region.text.isEmpty;

                                bool isPhoneEmpty =
                                    controller.Phone.text.isEmpty;
                                RegExp emailRegex = RegExp(
                                    r"^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$");
                                bool isEmailValid =
                                    emailRegex.hasMatch(controller.Email.text);
                                bool isEmailEmpty =
                                    controller.Email.text.isEmpty ||
                                        !isEmailValid;

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
                                    "Englishaddress", isEnglishAddressEmpty);
                                controller.updateFieldError(
                                    "Arabicaddress", isArabicAddressEmpty);
                                controller.updateFieldError(
                                    "Englishvill", isEnglishVillageEmpty);
                                controller.updateFieldError(
                                    "Arabicvill", isArabicVillageEmpty);

                                controller.updateFieldError(
                                    "reg", isRegionEmpty);
                                controller.updateFieldError(
                                    "phone", isPhoneEmpty);
                                controller.updateFieldError(
                                    "work", isWork_Begin_YearEmpty);
                                controller.updateFieldError(
                                    "cx", isCreation_YearEmpty);
                                controller.updateFieldError(
                                    "email", isEmailEmpty);
                                controller.updateFieldError(
                                    "cnum", isCongregation_numberEmpty);
                                controller.updateFieldError(
                                    "twn", isTown_ChipEmpty);

                                if (!(isSchool_NameEmpty ||
                                    isLicense_NumberEmpty ||
                                    isEnglishAddressEmpty ||
                                    isArabicAddressEmpty ||
                                    isEnglishVillageEmpty ||
                                    isArabicVillageEmpty ||
                                    isRegionEmpty ||
                                    isPhoneEmpty ||
                                    isEmailEmpty ||
                                    isCreation_YearEmpty ||
                                    isCongregation_numberEmpty ||
                                    isTown_ChipEmpty ||
                                    isWork_Begin_YearEmpty)) {
                                  exportSchoolDataToPdf<Map<String, dynamic>>(
                                    items: controller
                                        .SchoolInfo, // هذا هو التعديل المهم
                                    headers: [
                                      "School Name".tr,
                                      "License Number".tr,
                                      "Address".tr,
                                      "Village".tr,
                                      "Region".tr,
                                      "Phone".tr,
                                      "Email".tr,
                                      "Creation Year".tr,
                                      "Clinic Name".tr,
                                      "Congregation number".tr,
                                      "Previous name".tr,
                                      "Town Chip".tr,
                                      "Fax".tr,
                                      "Work Begin Year".tr,
                                      "Country".tr,
                                      "Morning Time".tr,
                                      "Evening Time".tr,
                                      "Whatsapp Number".tr,
                                      "Youtube URL".tr,
                                      "Facebook URL".tr,
                                      "Outstanding School".tr,
                                      "Taken Over School".tr,
                                      "Reassignment Teachers".tr,
                                      "Martyrs Sons".tr,
                                      "Internet Connection".tr,
                                      "Government Connection".tr,
                                      "Joint Building".tr,
                                      "Industrial Section".tr,
                                      "Morning".tr,
                                      "Evening".tr,
                                    ],
                                    fieldMappings: {
                                      "School Name".tr: (item) =>
                                          item["School_Name"],
                                      "License Number".tr: (item) =>
                                          item["License_Number"],
                                      "Address".tr: (item) =>
                                          Get.find<LocalizationController>()
                                                      .currentLocale
                                                      .value
                                                      .languageCode ==
                                                  'ar'
                                              ? item["Address"]
                                              : item["enAddress"],
                                      "Village".tr: (item) =>
                                          Get.find<LocalizationController>()
                                                      .currentLocale
                                                      .value
                                                      .languageCode ==
                                                  'ar'
                                              ? item["Village"]
                                              : item["enVillage"],
                                      "Region".tr: (item) => item["Region"],
                                      "Phone".tr: (item) => item["Phone"],
                                      "Email".tr: (item) => item["Email"],
                                      "Creation Year".tr: (item) =>
                                          item["Creation_Year"],
                                      "Clinic Name".tr: (item) =>
                                          item["Clinic_Name"],
                                      "Congregation number".tr: (item) =>
                                          item["Congregation_number"],
                                      "Previous name".tr: (item) =>
                                          item["Previous_name"],
                                      "Town Chip".tr: (item) =>
                                          item["Town_Chip"],
                                      "Fax".tr: (item) => item["Fax"],
                                      "Work Begin Year".tr: (item) =>
                                          item["Work_Begin_Year"],
                                      "Country".tr: (item) => item["Country"],
                                      "Outstanding School".tr: (item) =>
                                          item["Outstanding_School"] == true
                                              ? "Yes".tr
                                              : "No".tr,
                                      "Taken Over School".tr: (item) =>
                                          item["Taken_OverSchool"] == true
                                              ? "Yes".tr
                                              : "No".tr,
                                      "Reassignment Teachers".tr: (item) =>
                                          item["Reassignment_Teachers"] == true
                                              ? "Yes".tr
                                              : "No".tr,
                                      "Martyrs Sons".tr: (item) =>
                                          item["Martyrs_Sons"] == true
                                              ? "Yes".tr
                                              : "No".tr,
                                      "Internet Connection".tr: (item) =>
                                          item["Internet_Connection"] == true
                                              ? "Yes".tr
                                              : "No".tr,
                                      "Government Connection".tr: (item) =>
                                          item["Government_Connection"] == true
                                              ? "Yes".tr
                                              : "No".tr,
                                      "Joint Building".tr: (item) =>
                                          item["Joint_Building"] == true
                                              ? "Yes".tr
                                              : "No".tr,
                                      "Industrial Section".tr: (item) =>
                                          item["Industrial_Section"] == true
                                              ? "Yes".tr
                                              : "No".tr,
                                      "Morning".tr: (item) =>
                                          item["morning"] == true
                                              ? "Yes".tr
                                              : "No".tr,
                                      "Evening".tr: (item) =>
                                          item["evening"] == true
                                              ? "Yes".tr
                                              : "No".tr,
                                      "Morning Time".tr: (item) =>
                                          "${item["MorningShiftStartHours"]},${item["MorningClosingHours"]}",
                                      "Evening Time".tr: (item) =>
                                          "${item["EveningShiftStartHours"]},${item["EveningClosingHours"]}",
                                      "Whatsapp Number".tr: (item) =>
                                          item["whatsAppNumber"],
                                      "Youtube URL".tr: (item) =>
                                          item["urlYoutube"],
                                      "Facebook URL".tr: (item) =>
                                          item["urlFaceBook"],
                                    },
                                    fileName: "School Data".tr +
                                        "${DateTime.now().toIso8601String()}",
                                  );
                                }
                              },
                              icon: Icon(VMS_Icons.pdf,
                                  size: 18,
                                  color: Theme.of(context)
                                      .textTheme
                                      .titleMedium!
                                      .color!)),
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
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(5))))),
                              onPressed: () {
                                bool isSchool_NameEmpty =
                                    controller.School_Name.text.isEmpty;

                                bool isLicense_NumberEmpty =
                                    controller.License_Number.text.isEmpty;

                                bool isArabicAddressEmpty =
                                    controller.ArabicAddress.text.isEmpty;

                                bool isArabicVillageEmpty =
                                    controller.ArabicVillage.text.isEmpty;

                                bool isEnglishAddressEmpty =
                                    controller.EnglishAddress.text.isEmpty;

                                bool isEnglishVillageEmpty =
                                    controller.EnglishVillage.text.isEmpty;

                                bool isRegionEmpty =
                                    controller.Region.text.isEmpty;

                                bool isPhoneEmpty =
                                    controller.Phone.text.isEmpty;
                                RegExp emailRegex = RegExp(
                                    r"^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$");
                                bool isEmailValid =
                                    emailRegex.hasMatch(controller.Email.text);

                                bool isEmailEmpty =
                                    controller.Email.text.isEmpty ||
                                        !isEmailValid;

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
                                    "Englishaddress", isEnglishAddressEmpty);
                                controller.updateFieldError(
                                    "Arabicaddress", isArabicAddressEmpty);
                                controller.updateFieldError(
                                    "Englishvill", isEnglishVillageEmpty);
                                controller.updateFieldError(
                                    "Arabicvill", isArabicVillageEmpty);

                                controller.updateFieldError(
                                    "reg", isRegionEmpty);
                                controller.updateFieldError(
                                    "phone", isPhoneEmpty);
                                controller.updateFieldError(
                                    "work", isWork_Begin_YearEmpty);
                                controller.updateFieldError(
                                    "cx", isCreation_YearEmpty);
                                controller.updateFieldError(
                                    "email", isEmailEmpty);
                                controller.updateFieldError(
                                    "cnum", isCongregation_numberEmpty);
                                controller.updateFieldError(
                                    "twn", isTown_ChipEmpty);

                                if (!(isSchool_NameEmpty ||
                                    isLicense_NumberEmpty ||
                                    isEnglishAddressEmpty ||
                                    isArabicAddressEmpty ||
                                    isEnglishVillageEmpty ||
                                    isArabicVillageEmpty ||
                                    isRegionEmpty ||
                                    isPhoneEmpty ||
                                    isEmailEmpty ||
                                    isCreation_YearEmpty ||
                                    isCongregation_numberEmpty ||
                                    isTown_ChipEmpty ||
                                    isWork_Begin_YearEmpty)) {
                                  {
                                    exportDataToExcel<Map<String, dynamic>>(
                                      items: controller
                                          .SchoolInfo, // هذا هو التعديل المهم
                                      headers: [
                                        "School Name".tr,
                                        "License Number".tr,
                                        "Address".tr,
                                        "Village".tr,
                                        "Region".tr,
                                        "Phone".tr,
                                        "Email".tr,
                                        "Creation Year".tr,
                                        "Clinic Name".tr,
                                        "Congregation number".tr,
                                        "Previous name".tr,
                                        "Town Chip".tr,
                                        "Fax".tr,
                                        "Work Begin Year".tr,
                                        "Country".tr,
                                        "Morning Time".tr,
                                        "Evening Time".tr,
                                        "Whatsapp Number".tr,
                                        "Youtube URL".tr,
                                        "Facebook URL".tr,
                                        "Outstanding School".tr,
                                        "Taken Over School".tr,
                                        "Reassignment Teachers".tr,
                                        "Martyrs Sons".tr,
                                        "Internet Connection".tr,
                                        "Government Connection".tr,
                                        "Joint Building".tr,
                                        "Industrial Section".tr,
                                        "Morning".tr,
                                        "Evening".tr,
                                      ],
                                      fieldMappings: {
                                        "School Name".tr: (item) =>
                                            item["School_Name"],
                                        "License Number".tr: (item) =>
                                            item["License_Number"],
                                        "Address".tr: (item) =>
                                            Get.find<LocalizationController>()
                                                        .currentLocale
                                                        .value
                                                        .languageCode ==
                                                    'ar'
                                                ? item["Address"]
                                                : item["enAddress"],
                                        "Village".tr: (item) =>
                                            Get.find<LocalizationController>()
                                                        .currentLocale
                                                        .value
                                                        .languageCode ==
                                                    'ar'
                                                ? item["Village"]
                                                : item["enVillage"],
                                        "Region".tr: (item) => item["Region"],
                                        "Phone".tr: (item) => item["Phone"],
                                        "Email".tr: (item) => item["Email"],
                                        "Creation Year".tr: (item) =>
                                            item["Creation_Year"],
                                        "Clinic Name".tr: (item) =>
                                            item["Clinic_Name"],
                                        "Congregation number".tr: (item) =>
                                            item["Congregation_number"],
                                        "Previous name".tr: (item) =>
                                            item["Previous_name"],
                                        "Town Chip".tr: (item) =>
                                            item["Town_Chip"],
                                        "Fax".tr: (item) => item["Fax"],
                                        "Work Begin Year".tr: (item) =>
                                            item["Work_Begin_Year"],
                                        "Country".tr: (item) => item["Country"],
                                        "Outstanding School".tr: (item) =>
                                            item["Outstanding_School"],
                                        "Taken Over School".tr: (item) =>
                                            item["Taken_OverSchool"],
                                        "Reassignment Teachers".tr: (item) =>
                                            item["Reassignment_Teachers"],
                                        "Martyrs Sons".tr: (item) =>
                                            item["Martyrs_Sons"],
                                        "Internet Connection".tr: (item) =>
                                            item["Internet_Connection"],
                                        "Government Connection".tr: (item) =>
                                            item["Government_Connection"],
                                        "Joint Building".tr: (item) =>
                                            item["Joint_Building"],
                                        "Industrial Section".tr: (item) =>
                                            item["Industrial_Section"],
                                        "Morning".tr: (item) => item["morning"],
                                        "Evening".tr: (item) => item["evening"],
                                        "Morning Time".tr: (item) =>
                                            "${item["MorningShiftStartHours"]},${item["MorningClosingHours"]}",
                                        "Evening Time".tr: (item) =>
                                            "${item["EveningShiftStartHours"]},${item["EveningClosingHours"]}",
                                        "Whatsapp Number".tr: (item) =>
                                            item["whatsAppNumber"],
                                        "Youtube URL".tr: (item) =>
                                            item["urlYoutube"],
                                        "Facebook URL".tr: (item) =>
                                            item["urlFaceBook"],
                                      },
                                      fileName: "School Data".tr +
                                          "${DateTime.now().toIso8601String()}",
                                    );
                                  }
                                }
                              },
                              icon: Icon(VMS_Icons.xl,
                                  size: 18,
                                  color: Theme.of(context)
                                      .textTheme
                                      .titleMedium!
                                      .color!)),
                        ),
                      ),
                    ],
                  ),
                );
              } else {
                return Container();
              }
            }),
            Expanded(
              child: SingleChildScrollView(
                child: Directionality(
                  textDirection: Get.find<LocalizationController>()
                              .currentLocale
                              .value
                              .languageCode ==
                          'ar'
                      ? TextDirection.rtl
                      : TextDirection.ltr,
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: 40.0),
                    child: School_Data(),
                  ),
                ),
              ),
            ),
          ],
        );
      }),
    );
  }
}
