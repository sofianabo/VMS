import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vms_school/Link/API/API.dart';
import 'package:vms_school/Link/API/AdminAPI/Employees_APIs/Update_Employee_Info.dart';
import 'package:vms_school/Link/Controller/AdminController/Employee_Controllers/Add_Data_controller.dart';
import 'package:vms_school/Link/Controller/AdminController/Main_Admin_Controller/Admin_DropDown_Profile_Controller.dart';
import 'package:vms_school/Link/Controller/AdminController/Main_Admin_Controller/Admin_Profile_Content.dart';
import 'package:vms_school/Translate/local_controller.dart';
import 'package:vms_school/main.dart';
import 'package:intl/intl.dart' as intl;
import 'package:vms_school/widgets/Admin/AdminAllSettings/Button_Has_IconText.dart';
import 'package:vms_school/widgets/Admin/AdminAllSettings/Long_Text_Field.dart';
import 'package:vms_school/widgets/Admin/AdminAllSettings/Profile_DatePicker.dart';
import 'package:vms_school/widgets/Admin/AdminAllSettings/Profile_DropDown.dart';
import 'package:vms_school/widgets/Admin/AdminAllSettings/TextField_Profile.dart';

intl.DateFormat format = intl.DateFormat("yyyy-MM-dd");

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  var add_Data_controller = Get.find<Add_Data_controller>();

  TextEditingController Firstname = TextEditingController();
  TextEditingController Lastname = TextEditingController();
  TextEditingController Mothername = TextEditingController();
  TextEditingController Fathername = TextEditingController();
  TextEditingController phoneNumper = TextEditingController();
  TextEditingController emergencyNumber = TextEditingController();
  TextEditingController Address = TextEditingController();
  TextEditingController currentAddress = TextEditingController();
  TextEditingController careerHistory = TextEditingController();
  TextEditingController Qualification = TextEditingController();
  TextEditingController Experience = TextEditingController();
  TextEditingController Note = TextEditingController();
  TextEditingController Joindate = TextEditingController();

  @override
  void fillControllersWithData() {
    Firstname.text = add_Data_controller.myData?.firstName ?? '';
    Lastname.text = add_Data_controller.myData?.lastName ?? '';
    Mothername.text = add_Data_controller.myData?.motherName ?? '';
    Fathername.text = add_Data_controller.myData?.fatherName ?? '';
    phoneNumper.text = add_Data_controller.myData?.phone ?? '';
    emergencyNumber.text = add_Data_controller.myData?.emergencyNumber ?? '';
    Address.text = add_Data_controller.myData?.address ?? '';
    currentAddress.text = add_Data_controller.myData?.currentAddress ?? '';
    careerHistory.text = add_Data_controller.myData?.careerHistory ?? '';
    Qualification.text = add_Data_controller.myData?.qualification ?? '';
    Experience.text = add_Data_controller.myData?.experience ?? '';
    Note.text = add_Data_controller.myData?.note ?? '';
    Joindate.text = add_Data_controller.myData?.joinDate ?? '';

    add_Data_controller.Birthdate.value =
        add_Data_controller.myData?.birthDate != null
            ? format.parse(add_Data_controller.myData!.birthDate!)
            : null;
    Get.put(Profile_DropDown_Controller()).Family_StatusIndex =
        add_Data_controller.myData!.familystatus != null
            ? "${add_Data_controller.myData!.familystatus}"
            : "";
    Get.put(Profile_DropDown_Controller()).GenderIndex =
        add_Data_controller.myData!.gender != null
            ? "${add_Data_controller.myData!.gender}"
            : "";
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return GetBuilder<Add_Data_controller>(builder: (add_Data_controller) {
      if (add_Data_controller.isLoading == false) {
        fillControllersWithData();
      }
      return Align(
        alignment: Alignment.topCenter,
        child: SingleChildScrollView(
          child: GetBuilder<Admin_Profile_Content>(builder: (controller) {
            return Column(
              textDirection: Get.find<LocalizationController>()
                          .currentLocale
                          .value
                          .languageCode ==
                      'ar'
                  ? TextDirection.rtl
                  : TextDirection.ltr,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(
                      top: 25.0, left: 15.0, right: 15.0, bottom: 15.0),
                  child: Text(
                    "Profile".tr,
                    style: TextStyle(fontSize: 18),
                  ),
                ),
                GetBuilder<Add_Data_controller>(builder: (picController) {
                  return Container(
                    width: screenWidth,
                    padding: EdgeInsets.all(15.0),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(15)),
                        border:
                            Border.all(color: Color(0xffF6F6F6), width: 1.5)),
                    child: Wrap(
                      crossAxisAlignment: WrapCrossAlignment.center,
                      runAlignment: WrapAlignment.center,
                      alignment: screenWidth >= 682
                          ? WrapAlignment.spaceBetween
                          : WrapAlignment.center,
                      spacing: 10.0,
                      runSpacing: 10.0,
                      textDirection: Get.find<LocalizationController>()
                                  .currentLocale
                                  .value
                                  .languageCode ==
                              'ar'
                          ? TextDirection.rtl
                          : TextDirection.ltr,
                      children: [
                        Wrap(
                          crossAxisAlignment: WrapCrossAlignment.center,
                          runAlignment: WrapAlignment.center,
                          alignment: WrapAlignment.center,
                          spacing: 10.0,
                          runSpacing: 10.0,
                          textDirection: Get.find<LocalizationController>()
                                      .currentLocale
                                      .value
                                      .languageCode ==
                                  'ar'
                              ? TextDirection.rtl
                              : TextDirection.ltr,
                          children: [
                            CircleAvatar(
                              maxRadius: 80,
                              child: GestureDetector(
                                onTap: () {
                                  showDialog(
                                    context: context,
                                    builder: (context) => Dialog(
                                      backgroundColor: Colors.transparent,
                                      child: GestureDetector(
                                        onTap: () {
                                          Get.back();
                                        },
                                        child: Material(
                                          color: Colors.transparent,
                                          child: Center(
                                            child: AnimatedContainer(
                                              duration: const Duration(
                                                  milliseconds: 500),
                                              curve: Curves.fastOutSlowIn,
                                              decoration: BoxDecoration(
                                                shape: BoxShape.circle,
                                                boxShadow: [
                                                  BoxShadow(
                                                    color: Colors.black
                                                        .withOpacity(0.5),
                                                    blurRadius: 20,
                                                    offset: const Offset(0, 10),
                                                  ),
                                                ],
                                              ),
                                              child: ClipOval(
                                                child: add_Data_controller
                                                            .myData?.imageId !=
                                                        null
                                                    ? Image.network(
                                                        headers: {
                                                          "ngrok-skip-browser-warning":
                                                              "true",
                                                          'User-Agent':
                                                              'Custom User-Agent',
                                                          'accept':
                                                              'application/json',
                                                          'authorization':
                                                              'Bearer ${prefs!.getString("token")}',
                                                        },
                                                        "$getimage${add_Data_controller.myData!.imageId}",
                                                        fit: BoxFit.cover,
                                                        width: 400,
                                                        height: 400,
                                                      )
                                                    : Text(
                                                        picController.myData
                                                                ?.firstName
                                                                ?.substring(
                                                                    0, 1)
                                                                .toUpperCase() ??
                                                            '',
                                                        style: Get.textTheme
                                                            .titleLarge
                                                            ?.copyWith(
                                                          color: Colors.white,
                                                          fontSize: 26,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                        ),
                                                      ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  );
                                },
                                child: ClipOval(
                                  child: add_Data_controller.myData?.imageId !=
                                          null
                                      ? Image.network(
                                          headers: {
                                            "ngrok-skip-browser-warning":
                                                "true",
                                            'User-Agent': 'Custom User-Agent',
                                            'accept': 'application/json',
                                            'authorization':
                                                'Bearer ${prefs!.getString("token")}',
                                          },
                                          "$getimage${add_Data_controller.myData!.imageId}",
                                          fit: BoxFit.cover,
                                          width: 400,
                                          height: 400,
                                        )
                                      : Text(
                                          picController.myData?.firstName
                                                  ?.substring(0, 1)
                                                  .toUpperCase() ??
                                              '',
                                          style: Get.textTheme.titleLarge
                                              ?.copyWith(
                                            color: Colors.white,
                                            fontSize: 26,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                ),
                              ),
                            ),
                            Column(
                              mainAxisSize: MainAxisSize.min,
                              textDirection: Get.find<LocalizationController>()
                                          .currentLocale
                                          .value
                                          .languageCode ==
                                      'ar'
                                  ? TextDirection.rtl
                                  : TextDirection.ltr,
                              spacing: 5.0,
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "${add_Data_controller.myData!.firstName} ${add_Data_controller.myData!.lastName}",
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold),
                                ),
                                Text("@${add_Data_controller.myData!.userName}",
                                    style: TextStyle(
                                      fontSize: 12,
                                    )),
                                Text(
                                    "${add_Data_controller.myData!.jobTitle}"
                                        .tr,
                                    style: TextStyle(
                                      fontSize: 12,
                                    )),
                                Text(
                                    "${add_Data_controller.myData!.contractType}"
                                        .tr,
                                    style: TextStyle(
                                      fontSize: 12,
                                    )),
                              ],
                            ),
                          ],
                        ),
                        Row(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Button_Has_IconText(
                              width: 140,
                              onPressed: () {
                                add_Data_controller.pickImage(context, true);
                              },
                              text: add_Data_controller.myData!.imageId == null
                                  ? "Add Picture".tr
                                  : "Edit Picture".tr,
                              icon: Icon(
                                Icons.edit,
                                color: Colors.black,
                              ),
                            ),
                            if (add_Data_controller.myData!.imageId != null)
                              Button_Has_IconText(
                                width: 140,
                                onPressed: () {
                                  Update_Employee_Information
                                      .Update_Employee_Info(
                                          Type: "public", selectedImage: null);
                                },
                                text: "Delete Picture".tr,
                                icon: Icon(
                                  Icons.delete_outline_outlined,
                                  color: Color(0xffB03D3D),
                                ),
                              )
                          ],
                        )
                      ],
                    ),
                  );
                }),
                Container(
                  width: screenWidth,
                  margin: EdgeInsets.only(top: 15.0, bottom: 15.0),
                  padding: EdgeInsets.all(15.0),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(15)),
                      border: Border.all(color: Color(0xffF6F6F6), width: 1.5)),
                  child: Column(
                    spacing: 5.0,
                    children: [
                      Container(
                        width: screenWidth,
                        child: Wrap(
                          runSpacing: 10.0,
                          textDirection: Get.find<LocalizationController>()
                                      .currentLocale
                                      .value
                                      .languageCode ==
                                  'ar'
                              ? TextDirection.rtl
                              : TextDirection.ltr,
                          spacing: 10.0,
                          crossAxisAlignment: WrapCrossAlignment.center,
                          alignment: WrapAlignment.spaceBetween,
                          runAlignment: WrapAlignment.spaceBetween,
                          children: [
                            Text(
                              "Personal Information".tr,
                              style: TextStyle(fontSize: 18),
                            ),
                            Button_Has_IconText(
                              width: 103,
                              onPressed: () {
                                if (controller.enabledPublicInfo == true) {
                                  Update_Employee_Information
                                      .Update_Employee_Info(
                                          Type: "public",
                                          First_Name: Firstname.text,
                                          Last_Name: Lastname.text,
                                          Mother_Name: Mothername.text,
                                          Father_Name: Fathername.text,
                                          Phone_Numper: phoneNumper.text,
                                          Emergency_Number:
                                              emergencyNumber.text,
                                          Address: Address.text,
                                          Current_Address: currentAddress.text,
                                          Career_History: careerHistory.text,
                                          Qualification: Qualification.text,
                                          Experience: Experience.text,
                                          Note: Note.text,
                                          Birth_Date: add_Data_controller
                                              .Birthdate.value
                                              .toString(),
                                          Gender: Get.find<
                                                  Profile_DropDown_Controller>()
                                              .selecteGenderIndex,
                                          Family_State: Get.find<
                                                  Profile_DropDown_Controller>()
                                              .selecteFamily_StatusIndex);
                                } else {
                                  controller.ChangeenabledPublicInfo(true);
                                }
                              },
                              text: controller.enabledPublicInfo
                                  ? "Save".tr
                                  : "Edit".tr,
                              icon: Icon(
                                controller.enabledPublicInfo
                                    ? Icons.save_outlined
                                    : Icons.edit,
                                color: Colors.black,
                              ),
                            )
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 15.0),
                        child: Wrap(
                          alignment: WrapAlignment.spaceBetween,
                          runAlignment: WrapAlignment.spaceBetween,
                          runSpacing: 25.0,
                          spacing: 25.0,
                          textDirection: Get.find<LocalizationController>()
                                      .currentLocale
                                      .value
                                      .languageCode ==
                                  'ar'
                              ? TextDirection.rtl
                              : TextDirection.ltr,
                          children: [
                            TextField_Profile(
                              upicon: Icon(
                                Icons.personal_injury_rounded,
                                color: Theme.of(context)
                                    .textTheme
                                    .bodySmall!
                                    .color,
                                size: 20,
                              ),
                              controller: Firstname,
                              Uptext: "First Name".tr,
                              enabled: controller.enabledPublicInfo,
                            ),
                            TextField_Profile(
                              upicon: Icon(
                                Icons.personal_injury_rounded,
                                color: Theme.of(context)
                                    .textTheme
                                    .bodySmall!
                                    .color,
                                size: 20,
                              ),
                              controller: Lastname,
                              Uptext: "Last Name".tr,
                              enabled: controller.enabledPublicInfo,
                            ),
                            TextField_Profile(
                              upicon: Icon(
                                Icons.boy,
                                color: Theme.of(context)
                                    .textTheme
                                    .bodySmall!
                                    .color,
                                size: 20,
                              ),
                              controller: Fathername,
                              Uptext: "Father Name".tr,
                              enabled: controller.enabledPublicInfo,
                            ),
                            TextField_Profile(
                              upicon: Icon(
                                Icons.girl,
                                color: Theme.of(context)
                                    .textTheme
                                    .bodySmall!
                                    .color,
                                size: 20,
                              ),
                              controller: Mothername,
                              Uptext: "Mother Name".tr,
                              enabled: controller.enabledPublicInfo,
                            ),
                            TextField_Profile(
                              upicon: Icon(
                                Icons.phone_enabled_outlined,
                                color: Theme.of(context)
                                    .textTheme
                                    .bodySmall!
                                    .color,
                                size: 20,
                              ),
                              controller: phoneNumper,
                              Uptext: "Phone Number".tr,
                              enabled: controller.enabledPublicInfo,
                            ),
                            TextField_Profile(
                              upicon: Icon(
                                Icons.sos,
                                color: Theme.of(context)
                                    .textTheme
                                    .bodySmall!
                                    .color,
                                size: 20,
                              ),
                              enabled: controller.enabledPublicInfo,
                              controller: emergencyNumber,
                              Uptext: "Emergency Number".tr,
                            ),
                            TextField_Profile(
                              upicon: Icon(
                                Icons.date_range_rounded,
                                color: Theme.of(context)
                                    .textTheme
                                    .bodySmall!
                                    .color,
                                size: 20,
                              ),
                              enabled: false,
                              controller: Joindate,
                              Uptext: "Join Date".tr,
                            ),
                            Profile_BirthDate(
                              upicon: Icon(
                                Icons.date_range_rounded,
                                color: Theme.of(context)
                                    .textTheme
                                    .bodySmall!
                                    .color,
                                size: 20,
                              ),
                              enabled: controller.enabledPublicInfo,
                              Uptext: "Birthdate".tr,
                              width: 220,
                            ),
                            TextField_Profile(
                              upicon: Icon(
                                Icons.location_on_outlined,
                                color: Theme.of(context)
                                    .textTheme
                                    .bodySmall!
                                    .color,
                                size: 20,
                              ),
                              enabled: controller.enabledPublicInfo,
                              controller: Address,
                              Uptext: "Address".tr,
                            ),
                            TextField_Profile(
                              upicon: Icon(
                                Icons.my_location_outlined,
                                color: Theme.of(context)
                                    .textTheme
                                    .bodySmall!
                                    .color,
                                size: 20,
                              ),
                              enabled: controller.enabledPublicInfo,
                              controller: currentAddress,
                              Uptext: "Current Address".tr,
                            ),
                            Profile_DropDown(
                                upicon: Icon(
                                  Icons.transgender_outlined,
                                  color: Theme.of(context)
                                      .textTheme
                                      .bodySmall!
                                      .color,
                                  size: 20,
                                ),
                                labelText: "Gender".tr,
                                enabled: controller.enabledPublicInfo,
                                title: "Gender".tr,
                                width: 220,
                                type: "Gender"),
                            Profile_DropDown(
                                upicon: Icon(
                                  Icons.family_restroom_outlined,
                                  color: Theme.of(context)
                                      .textTheme
                                      .bodySmall!
                                      .color,
                                  size: 20,
                                ),
                                labelText: "Family Status".tr,
                                enabled: controller.enabledPublicInfo,
                                title: "Family Status".tr,
                                width: 220,
                                type: "Family_Status")
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 15.0),
                  padding: EdgeInsets.all(15.0),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(15)),
                      border: Border.all(color: Color(0xffF6F6F6), width: 1.5)),
                  child: Column(
                    spacing: 5.0,
                    children: [
                      Container(
                        width: screenWidth,
                        child: Wrap(
                          runSpacing: 10.0,
                          textDirection: Get.find<LocalizationController>()
                                      .currentLocale
                                      .value
                                      .languageCode ==
                                  'ar'
                              ? TextDirection.rtl
                              : TextDirection.ltr,
                          spacing: 10.0,
                          crossAxisAlignment: WrapCrossAlignment.center,
                          alignment: WrapAlignment.spaceBetween,
                          runAlignment: WrapAlignment.spaceBetween,
                          children: [
                            Text(
                              "More Information".tr,
                              style: TextStyle(fontSize: 18),
                            ),
                            Button_Has_IconText(
                              width: 103,
                              onPressed: () {
                                if (controller.enabledMoreInfo == true) {
                                  Update_Employee_Information
                                      .Update_Employee_Info(
                                          Type: "more",
                                          Note: Note.text,
                                          Experience: Experience.text,
                                          Qualification: Qualification.text,
                                          Career_History: careerHistory.text);
                                } else {
                                  controller.ChangeenabledMoreInfo(true);
                                }
                              },
                              text: controller.enabledMoreInfo
                                  ? "Save".tr
                                  : "Edit".tr,
                              icon: Icon(
                                controller.enabledMoreInfo
                                    ? Icons.save_outlined
                                    : Icons.edit,
                                color: Colors.black,
                              ),
                            )
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 15.0),
                        child: Wrap(
                          alignment: WrapAlignment.spaceBetween,
                          runAlignment: WrapAlignment.spaceBetween,
                          runSpacing: 25.0,
                          spacing: 25.0,
                          textDirection: Get.find<LocalizationController>()
                                      .currentLocale
                                      .value
                                      .languageCode ==
                                  'ar'
                              ? TextDirection.rtl
                              : TextDirection.ltr,
                          children: [
                            Long_TextField_Profile(
                              upicon: Icon(
                                Icons.food_bank_outlined,
                                color: Theme.of(context)
                                    .textTheme
                                    .bodySmall!
                                    .color,
                                size: 20,
                              ),
                              enabled: controller.enabledMoreInfo,
                              controller: careerHistory,
                              Uptext: "Career History".tr,
                            ),
                            Long_TextField_Profile(
                              upicon: Icon(
                                Icons.comment_bank,
                                color: Theme.of(context)
                                    .textTheme
                                    .bodySmall!
                                    .color,
                                size: 20,
                              ),
                              controller: Qualification,
                              Uptext: "Qualification".tr,
                              enabled: controller.enabledMoreInfo,
                            ),
                            Long_TextField_Profile(
                              upicon: Icon(
                                Icons.branding_watermark_sharp,
                                color: Theme.of(context)
                                    .textTheme
                                    .bodySmall!
                                    .color,
                                size: 20,
                              ),
                              controller: Experience,
                              Uptext: "Experience".tr,
                              enabled: controller.enabledMoreInfo,
                            ),
                            Long_TextField_Profile(
                              upicon: Icon(
                                Icons.numbers_outlined,
                                color: Theme.of(context)
                                    .textTheme
                                    .bodySmall!
                                    .color,
                                size: 20,
                              ),
                              controller: Note,
                              Uptext: "Note".tr,
                              enabled: controller.enabledMoreInfo,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            );
          }),
        ),
      );
    });
  }
}

class ProfileImageWithHoverDialog extends StatefulWidget {
  const ProfileImageWithHoverDialog({Key? key}) : super(key: key);

  @override
  State<ProfileImageWithHoverDialog> createState() =>
      _ProfileImageWithHoverDialogState();
}

class _ProfileImageWithHoverDialogState
    extends State<ProfileImageWithHoverDialog> {
  Timer? _hoverTimer;
  bool _isDialogOpen = false;

  void _showImageDialog() {
    if (_isDialogOpen) return;
    _isDialogOpen = true;

    Get.dialog(
      Dialog(
        backgroundColor: Colors.transparent,
        child: GestureDetector(
          onTap: () => _closeDialog(),
          child: Hero(
            tag: 'profileImageHero',
            child: Material(
              color: Colors.transparent,
              child: Center(
                child: AnimatedContainer(
                  duration: const Duration(milliseconds: 500),
                  curve: Curves.fastOutSlowIn,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.5),
                        blurRadius: 20,
                        offset: const Offset(0, 10),
                      ),
                    ],
                  ),
                  child: ClipOval(
                    child: Image.asset(
                      "assets/images/Rectangle66.png",
                      fit: BoxFit.cover,
                      width: 400,
                      height: 400,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
      barrierDismissible: true,
    ).then((_) {
      _isDialogOpen = false;
    });
  }

  void _closeDialog() {
    if (_isDialogOpen) {
      Navigator.of(Get.overlayContext!).pop();
    }
  }

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) {
        _hoverTimer =
            Timer(const Duration(milliseconds: 500), _showImageDialog);
      },
      onExit: (_) {
        _hoverTimer?.cancel();
        _closeDialog();
      },
      child: Hero(
        tag: 'profileImageHero',
        child: CircleAvatar(
          maxRadius: 35,
          child: ClipOval(
            child: Image.asset(
              "assets/images/Rectangle66.png",
              fit: BoxFit.cover,
              width: 70,
              height: 70,
            ),
          ),
        ),
      ),
    );
  }
}
