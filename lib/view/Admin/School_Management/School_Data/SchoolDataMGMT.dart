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
import 'package:vms_school/view/Admin/School_Management/School_Data/School_Data_Bottom.dart';
import 'package:vms_school/widgets/Squer_Button_Enabled_Disabled.dart';

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
          child: Center(
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
                  child: School_Data(),
                ),
              ),
            ),
          ),
        ],
      );
    }));
  }
}
