import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:vms_school/Link/Controller/AdminController/Main_Admin_Controller/Admin_Profile_Content.dart';
import 'package:vms_school/Theme/themeController.dart';
import 'package:vms_school/Translate/local_controller.dart';

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
                            ? Appear()
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

class Appear extends StatefulWidget {
  const Appear({super.key});

  @override
  State<Appear> createState() => _AppearState();
}

class _AppearState extends State<Appear> {
  var _isDarkMode = Get.isDarkMode.obs;
  @override
  Widget build(BuildContext context) {
    return Column(
      textDirection:
          Get.find<LocalizationController>().currentLocale.value.languageCode ==
                  'ar'
              ? TextDirection.rtl
              : TextDirection.ltr,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(
              top: 25.0, left: 15.0, right: 15.0, bottom: 15.0),
          child: Text(
            "Application Theem".tr,
            style: TextStyle(fontSize: 18),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(15.0),
          child: Row(
            textDirection: Get.find<LocalizationController>()
                        .currentLocale
                        .value
                        .languageCode ==
                    'ar'
                ? TextDirection.rtl
                : TextDirection.ltr,
            spacing: 25.0,
            children: [
              GestureDetector(
                onTap: () {
                  Get.changeThemeMode(ThemeMode.light);
                  setState(() {
                    _isDarkMode.value = false;
                    ThemeController.isDarkMode = _isDarkMode.value;
                  });
                },
                child: Container(
                  padding: EdgeInsets.all(3.0),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(5.0)),
                      border: Border.all(
                          color: _isDarkMode.value == true
                              ? Colors.transparent
                              : Color(0xffD9D9D9))),
                  width: 200,
                  height: 190,
                  child: Column(
                    children: [
                      SvgPicture.asset(
                        width: 200,
                        height: 160,
                        "../../images/light.svg",
                        fit: BoxFit.fitWidth,
                      ),
                      Text(
                        "Light Theme".tr,
                      )
                    ],
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  Get.changeThemeMode(ThemeMode.dark);
                  setState(() {
                    _isDarkMode.value = true;
                    ThemeController.isDarkMode = _isDarkMode.value;
                  });
                },
                child: Container(
                  padding: EdgeInsets.all(3.0),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(5.0)),
                      border: Border.all(
                          color: _isDarkMode.value == true
                              ? Color(0xffD9D9D9)
                              : Colors.transparent)),
                  width: 200,
                  height: 190,
                  child: Column(
                    children: [
                      SvgPicture.asset(
                        width: 200,
                        height: 160,
                        "../../images/dark.svg",
                        fit: BoxFit.fitWidth,
                      ),
                      Text("Dark Theme".tr)
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 35.0, right: 15.0, top: 15.0),
          child: Divider(
            height: 1,
            color: Color(0xffD9D9D9),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 20.0, left: 15.0, right: 15.0),
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
              Text(
                "Language".tr,
                style: TextStyle(fontSize: 18),
              ),
              Directionality(
                textDirection: Get.find<LocalizationController>()
                            .currentLocale
                            .value
                            .languageCode ==
                        'ar'
                    ? TextDirection.rtl
                    : TextDirection.ltr,
                child: Container(
                  margin: EdgeInsets.symmetric(horizontal: 20.0),
                  padding: EdgeInsets.all(5.0),
                  decoration: BoxDecoration(
                    border: Border.all(color: Color(0xffD9D9D9)),
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                  child: DropdownButtonHideUnderline(child:
                      GetBuilder<LocalizationController>(builder: (controller) {
                    // استخدام اللغة الحالية مباشرة من controller
                    String currentLanguage =
                        controller.currentLocale.value.languageCode;

                    String initialValue =
                        currentLanguage == 'ar' ? 'Arabic'.tr : 'English'.tr;

                    return DropdownButton<String>(
                      value:
                          initialValue, // تعيين اللغة الافتراضية بدون .tr لأن النص ثابت
                      isDense: true,
                      dropdownColor: Theme.of(context).cardColor,
                      alignment:
                          AlignmentDirectional.centerStart, // النص في اليسار
                      icon: Padding(
                        padding: const EdgeInsets.only(left: 15.0),
                        child: Icon(Icons.arrow_drop_down, size: 16),
                      ), // السهم في اليمين افتراضيًا
                      items: ['English'.tr, 'Arabic'.tr].map((String language) {
                        return DropdownMenuItem<String>(
                          value: language,
                          child: Text(language,
                              style: Theme.of(context).textTheme.bodyMedium),
                        );
                      }).toList(),
                      onChanged: (String? newValue) {
                        // عند تغيير اللغة، سيتم التبديل بين اللغتين بناءً على القيمة المحددة
                        if (newValue == "Arabic".tr) {
                          Get.find<LocalizationController>()
                              .changeLanguage(const Locale('ar'));
                        } else {
                          Get.find<LocalizationController>()
                              .changeLanguage(const Locale('en'));
                        }
                      },
                    );
                  })),
                ),
              )
            ],
          ),
        )
      ],
    );
  }
}
