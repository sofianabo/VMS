import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vms_school/Link/Controller/AdminController/Main_Admin_Controller/Admin_Profile_Content.dart';
import 'package:vms_school/Translate/local_controller.dart';
import 'package:vms_school/view/Admin/All_Settings/Wedgets/Button_Has_IconText.dart';
import 'package:vms_school/view/Admin/All_Settings/Wedgets/Long_Text_Field.dart';
import 'package:vms_school/view/Admin/All_Settings/Wedgets/Profile_DatePicker.dart';
import 'package:vms_school/view/Admin/All_Settings/Wedgets/TextField_Profile.dart';
import 'package:vms_school/view/Admin/All_Settings/Wedgets/Profile_DropDown.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  TextEditingController Firstname = TextEditingController(text: "Laith");
  TextEditingController Lastname = TextEditingController(text: "Azzam");
  TextEditingController fatherName = TextEditingController();
  TextEditingController motherName = TextEditingController();
  TextEditingController phoneNumper = TextEditingController();
  TextEditingController emergencyNumber = TextEditingController();
  TextEditingController Address = TextEditingController();
  TextEditingController currentAddress = TextEditingController();
  TextEditingController careerHistory = TextEditingController();
  TextEditingController Qualification = TextEditingController();
  TextEditingController Experience = TextEditingController();
  TextEditingController Note = TextEditingController();
  @override
  Widget build(BuildContext context) {
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
              Container(
                padding: EdgeInsets.all(15.0),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(15)),
                    border: Border.all(color: Color(0xffF6F6F6), width: 1.5)),
                child: Row(
                  textDirection: Get.find<LocalizationController>()
                              .currentLocale
                              .value
                              .languageCode ==
                          'ar'
                      ? TextDirection.rtl
                      : TextDirection.ltr,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      textDirection: Get.find<LocalizationController>()
                                  .currentLocale
                                  .value
                                  .languageCode ==
                              'ar'
                          ? TextDirection.rtl
                          : TextDirection.ltr,
                      children: [
                        CircleAvatar(
                          maxRadius: 35,
                          child: GestureDetector(
                            onTap: () {
                              showDialog(
                                context: context,
                                builder: (context) => Dialog(
                                  backgroundColor: Colors.transparent,
                                  child: GestureDetector(
                                    onTap: () => Navigator.pop(context),
                                    child: Hero(
                                      tag: 'profileImageHero',
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
                                              child: Image.asset(
                                                "../../images/Rectangle66.png",
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
                              );
                            },
                            child: Hero(
                              tag: 'profileImageHero',
                              child: ClipOval(
                                child: Image.asset(
                                  "../../images/Rectangle66.png",
                                  fit: BoxFit.cover,
                                  width: 70,
                                  height: 70,
                                ),
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding:
                              const EdgeInsets.only(left: 10.0, right: 10.0),
                          child: Column(
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
                                "Laith Haitham Azzam",
                                style: TextStyle(
                                    fontSize: 16, fontWeight: FontWeight.bold),
                              ),
                              Text("@Laithhazzam",
                                  style: TextStyle(
                                    fontSize: 12,
                                  )),
                              Text("Technical Support".tr,
                                  style: TextStyle(
                                    fontSize: 12,
                                  )),
                            ],
                          ),
                        ),
                      ],
                    ),
                    Row(
                      spacing: 8.0,
                      children: [
                        Button_Has_IconText(
                          onPressed: () {},
                          text: "Edit Picture".tr,
                          icon: Icon(
                            Icons.edit,
                            color: Colors.black,
                          ),
                        ),
                        Button_Has_IconText(
                          onPressed: () {},
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
              ),
              Container(
                margin: EdgeInsets.only(top: 15.0, bottom: 15.0),
                padding: EdgeInsets.all(15.0),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(15)),
                    border: Border.all(color: Color(0xffF6F6F6), width: 1.5)),
                child: Column(
                  spacing: 5.0,
                  children: [
                    Row(
                      textDirection: Get.find<LocalizationController>()
                                  .currentLocale
                                  .value
                                  .languageCode ==
                              'ar'
                          ? TextDirection.rtl
                          : TextDirection.ltr,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Personal Information".tr,
                          style: TextStyle(fontSize: 18),
                        ),
                        Button_Has_IconText(
                          onPressed: () {
                            if (controller.enabledPublicInfo == true) {
                              controller.ChangeenabledPublicInfo(false);
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
                    Padding(
                      padding: const EdgeInsets.only(top: 15.0),
                      child: Wrap(
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
                              color:
                                  Theme.of(context).textTheme.bodySmall!.color,
                              size: 20,
                            ),
                            controller: Firstname,
                            Uptext: "First Name".tr,
                            enabled: controller.enabledPublicInfo,
                          ),
                          TextField_Profile(
                            upicon: Icon(
                              Icons.personal_injury_rounded,
                              color:
                                  Theme.of(context).textTheme.bodySmall!.color,
                              size: 20,
                            ),
                            controller: Lastname,
                            Uptext: "Last Name".tr,
                            enabled: controller.enabledPublicInfo,
                          ),
                          TextField_Profile(
                            upicon: Icon(
                              Icons.phone_enabled_outlined,
                              color:
                                  Theme.of(context).textTheme.bodySmall!.color,
                              size: 20,
                            ),
                            controller: phoneNumper,
                            Uptext: "Phone Number".tr,
                            enabled: controller.enabledPublicInfo,
                          ),
                          TextField_Profile(
                            upicon: Icon(
                              Icons.sos,
                              color:
                                  Theme.of(context).textTheme.bodySmall!.color,
                              size: 20,
                            ),
                            enabled: controller.enabledPublicInfo,
                            controller: emergencyNumber,
                            Uptext: "Emergency Number".tr,
                          ),
                          Profile_JoinDate(
                            upicon: Icon(
                              Icons.date_range_outlined,
                              color:
                                  Theme.of(context).textTheme.bodySmall!.color,
                              size: 20,
                            ),
                            enabled: controller.enabledPublicInfo,
                            Uptext: "Join Date".tr,
                            width: 220,
                          ),
                          Profile_BirthDate(
                            upicon: Icon(
                              Icons.date_range_rounded,
                              color:
                                  Theme.of(context).textTheme.bodySmall!.color,
                              size: 20,
                            ),
                            enabled: controller.enabledPublicInfo,
                            Uptext: "Birthdate".tr,
                            width: 220,
                          ),
                          TextField_Profile(
                            upicon: Icon(
                              Icons.location_on_outlined,
                              color:
                                  Theme.of(context).textTheme.bodySmall!.color,
                              size: 20,
                            ),
                            enabled: controller.enabledPublicInfo,
                            controller: Address,
                            Uptext: "Address".tr,
                          ),
                          TextField_Profile(
                            upicon: Icon(
                              Icons.my_location_outlined,
                              color:
                                  Theme.of(context).textTheme.bodySmall!.color,
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
                    Row(
                      textDirection: Get.find<LocalizationController>()
                                  .currentLocale
                                  .value
                                  .languageCode ==
                              'ar'
                          ? TextDirection.rtl
                          : TextDirection.ltr,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "More Information".tr,
                          style: TextStyle(fontSize: 18),
                        ),
                        Button_Has_IconText(
                          onPressed: () {
                            if (controller.enabledMoreInfo == true) {
                              controller.ChangeenabledMoreInfo(false);
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
                    Padding(
                      padding: const EdgeInsets.only(top: 15.0),
                      child: Wrap(
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
                              color:
                                  Theme.of(context).textTheme.bodySmall!.color,
                              size: 20,
                            ),
                            enabled: controller.enabledMoreInfo,
                            controller: careerHistory,
                            Uptext: "Career History".tr,
                          ),
                          Long_TextField_Profile(
                            upicon: Icon(
                              Icons.comment_bank,
                              color:
                                  Theme.of(context).textTheme.bodySmall!.color,
                              size: 20,
                            ),
                            controller: Qualification,
                            Uptext: "Qualification".tr,
                            enabled: controller.enabledMoreInfo,
                          ),
                          Long_TextField_Profile(
                            upicon: Icon(
                              Icons.branding_watermark_sharp,
                              color:
                                  Theme.of(context).textTheme.bodySmall!.color,
                              size: 20,
                            ),
                            controller: Experience,
                            Uptext: "Experience".tr,
                            enabled: controller.enabledMoreInfo,
                          ),
                          Long_TextField_Profile(
                            upicon: Icon(
                              Icons.numbers_outlined,
                              color:
                                  Theme.of(context).textTheme.bodySmall!.color,
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
                      "../../images/Rectangle66.png",
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
              "../../images/Rectangle66.png",
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
