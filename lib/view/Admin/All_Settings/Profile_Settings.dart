import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:vms_school/Link/Controller/AdminController/Main_Admin_Controller/Admin_Profile_Content.dart';
import 'package:vms_school/Theme/themeController.dart';
import 'package:vms_school/Translate/local_controller.dart';
import 'package:vms_school/view/Admin/All_Settings/Apperance.dart';
import 'package:vms_school/view/Admin/All_Settings/Prof_Section.dart';
import 'package:vms_school/view/Admin/All_Settings/Wedgets/Personal_Section.dart';

class ProfileSettings extends StatefulWidget {
  ProfileSettings({super.key});

  @override
  State<ProfileSettings> createState() => _ProfileSettingsState();
}

class _ProfileSettingsState extends State<ProfileSettings> {
  @override
  Widget build(BuildContext context) {
    var _isDarkMode = Get.isDarkMode.obs;
    return GetBuilder<Admin_Profile_Content>(builder: (controller) {
      return Expanded(
        child: Container(
          margin: EdgeInsets.only(left: 15.0, top: 20.0),
          padding: EdgeInsets.all(25.0),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(10)),
            color: Theme.of(context).primaryColorDark,
          ),
          child: Column(
            crossAxisAlignment: Get.find<LocalizationController>()
                        .currentLocale
                        .value
                        .languageCode ==
                    'ar'
                ? CrossAxisAlignment.end
                : CrossAxisAlignment.start,
            children: [
              Text(
                "Application and Profile Settings".tr,
                style: TextStyle(fontSize: 20),
              ),
              Expanded(
                child: Container(
                  margin: EdgeInsets.only(top: 15.0),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      color: Theme.of(context).cardColor),
                  child: Row(
                    textDirection: Get.find<LocalizationController>()
                                .currentLocale
                                .value
                                .languageCode ==
                            'ar'
                        ? TextDirection.rtl
                        : TextDirection.ltr,
                    children: [
                      Container(
                        margin: EdgeInsets.only(left: 15.0, top: 20.0),
                        width: 260,
                        child: Padding(
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
                            mainAxisSize: MainAxisSize.max,
                            spacing: 25.0,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(top: 5.0),
                                child: Text(
                                  "  " + "Settings".tr,
                                  style: TextStyle(fontSize: 16),
                                ),
                              ),
                              GestureDetector(
                                onTap: () {
                                  controller.ChangeCurruntValue("Profile");
                                },
                                child: AnimatedContainer(
                                  decoration: BoxDecoration(
                                      color: controller.curruntValue ==
                                              "Profile"
                                          ? _isDarkMode.value
                                              ? Theme.of(context).indicatorColor
                                              : Color(0xffEBEBEB)
                                          : Theme.of(context).cardColor,
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(20))),
                                  padding: EdgeInsets.all(5.0),
                                  duration: Duration(milliseconds: 150),
                                  child: Row(
                                    textDirection:
                                        Get.find<LocalizationController>()
                                                    .currentLocale
                                                    .value
                                                    .languageCode ==
                                                'ar'
                                            ? TextDirection.rtl
                                            : TextDirection.ltr,
                                    children: [
                                      Icon(Icons.dataset_linked_outlined),
                                      Text("  " + "Profile".tr + "  ")
                                    ],
                                  ),
                                ),
                              ),
                              GestureDetector(
                                onTap: () {
                                  controller.ChangeCurruntValue("Personal");
                                },
                                child: AnimatedContainer(
                                  decoration: BoxDecoration(
                                      color: controller.curruntValue ==
                                              "Personal"
                                          ? _isDarkMode.value
                                              ? Theme.of(context).indicatorColor
                                              : Color(0xffEBEBEB)
                                          : Theme.of(context).cardColor,
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(20))),
                                  padding: EdgeInsets.all(5.0),
                                  duration: Duration(milliseconds: 150),
                                  child: Row(
                                    textDirection:
                                        Get.find<LocalizationController>()
                                                    .currentLocale
                                                    .value
                                                    .languageCode ==
                                                'ar'
                                            ? TextDirection.rtl
                                            : TextDirection.ltr,
                                    children: [
                                      Icon(Icons.person_2_outlined),
                                      Text("  " + "Personal".tr + "  ")
                                    ],
                                  ),
                                ),
                              ),
                              GestureDetector(
                                onTap: () {
                                  controller.ChangeCurruntValue("Password");
                                },
                                child: AnimatedContainer(
                                  decoration: BoxDecoration(
                                      color: controller.curruntValue ==
                                              "Password"
                                          ? _isDarkMode.value
                                              ? Theme.of(context).indicatorColor
                                              : Color(0xffEBEBEB)
                                          : Theme.of(context).cardColor,
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(20))),
                                  padding: EdgeInsets.all(5.0),
                                  duration: Duration(milliseconds: 150),
                                  child: Row(
                                    textDirection:
                                        Get.find<LocalizationController>()
                                                    .currentLocale
                                                    .value
                                                    .languageCode ==
                                                'ar'
                                            ? TextDirection.rtl
                                            : TextDirection.ltr,
                                    children: [
                                      Icon(Icons.password_outlined),
                                      Text("  " + "Password".tr + "  ")
                                    ],
                                  ),
                                ),
                              ),
                              GestureDetector(
                                onTap: () {
                                  controller.ChangeCurruntValue("Appearance");
                                },
                                child: AnimatedContainer(
                                  decoration: BoxDecoration(
                                      color: controller.curruntValue ==
                                              "Appearance"
                                          ? _isDarkMode.value
                                              ? Theme.of(context).indicatorColor
                                              : Color(0xffEBEBEB)
                                          : Theme.of(context).cardColor,
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(20))),
                                  padding: EdgeInsets.all(5.0),
                                  duration: Duration(milliseconds: 150),
                                  child: Row(
                                    textDirection:
                                        Get.find<LocalizationController>()
                                                    .currentLocale
                                                    .value
                                                    .languageCode ==
                                                'ar'
                                            ? TextDirection.rtl
                                            : TextDirection.ltr,
                                    children: [
                                      Icon(
                                          Icons.settings_applications_outlined),
                                      Text(
                                        "  " + "Appearance".tr + "  ",
                                        maxLines: 2,
                                        textAlign: TextAlign.center,
                                        overflow: TextOverflow.ellipsis,
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      VerticalDivider(
                        width: 2,
                        color: Color(0xffF6F6F6),
                      ),
                      Expanded(
                          child: Padding(
                        padding: const EdgeInsets.only(left: 15.0, right: 15.0),
                        child: controller.curruntValue == "Appearance"
                            ? Appearance()
                            : controller.curruntValue == "Profile"
                                ? Profile()
                                : controller.curruntValue == "Personal"
                                    ? Personal()
                                    : Text("data"),
                      ))
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      );
    });
  }
}
