import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:vms_school/Link/Controller/AdminController/Main_Admin_Controller/Admin_Profile_Content.dart';
import 'package:vms_school/Theme/themeController.dart';
import 'package:vms_school/Translate/local_controller.dart';

Widget ProfileDialog() {
  final _isDarkMode = Get.isDarkMode.obs;
  return BackdropFilter(
    filter: ImageFilter.blur(sigmaX: 1, sigmaY: 1),
    child: GetBuilder<Admin_Profile_Content>(builder: (controller) {
      return AlertDialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5),
        ),
        surfaceTintColor: Colors.transparent,
        insetPadding: EdgeInsets.zero,
        titlePadding: EdgeInsets.zero,
        contentPadding: EdgeInsets.zero,
        actionsPadding: EdgeInsets.zero,
        content: Container(
            width: 700,
            height: 500,
            child: Row(
              children: [
                Container(
                  width: 200,
                  color: Color(0xffFAFAFA),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      spacing: 25.0,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 25.0),
                          child: Text("  " + "Settings".tr),
                        ),
                        GestureDetector(
                          onTap: () {
                            controller.ChangeCurruntValue("Profile");
                          },
                          child: AnimatedContainer(
                            decoration: BoxDecoration(
                                color: controller.curruntValue == "Profile"
                                    ? Color(0xffEBEBEB)
                                    : Color(0xffFAFAFA),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(3))),
                            padding: EdgeInsets.all(5.0),
                            duration: Duration(milliseconds: 150),
                            child: Row(
                              children: [
                                Icon(Icons.verified_user),
                                Text("  " + "Profile".tr)
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
                                color: controller.curruntValue == "Personal"
                                    ? Color(0xffEBEBEB)
                                    : Color(0xffFAFAFA),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(3))),
                            padding: EdgeInsets.all(5.0),
                            duration: Duration(milliseconds: 150),
                            child: Row(
                              children: [
                                Icon(Icons.verified_user),
                                Text("  " + "Personal".tr)
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
                                color: controller.curruntValue == "Password"
                                    ? Color(0xffEBEBEB)
                                    : Color(0xffFAFAFA),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(3))),
                            padding: EdgeInsets.all(5.0),
                            duration: Duration(milliseconds: 150),
                            child: Row(
                              children: [
                                Icon(Icons.verified_user),
                                Text("  " + "Password".tr)
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
                                color: controller.curruntValue == "Appearance"
                                    ? Color(0xffEBEBEB)
                                    : Color(0xffFAFAFA),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(3))),
                            padding: EdgeInsets.all(5.0),
                            duration: Duration(milliseconds: 150),
                            child: Row(
                              children: [
                                Icon(Icons.verified_user),
                                SizedBox(
                                    width: 145,
                                    child: Text(
                                      "  " + "Appearance".tr,
                                      maxLines: 2,
                                      textAlign: TextAlign.center,
                                      overflow: TextOverflow.ellipsis,
                                    ))
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                    child: controller.curruntValue == "Appearance"
                        ? Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(
                                    top: 25.0,
                                    left: 15.0,
                                    right: 15.0,
                                    bottom: 15.0),
                                child: Text("Application Theem".tr),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(15.0),
                                child: Row(
                                  spacing: 25.0,
                                  children: [
                                    GestureDetector(
                                      onTap: () {
                                        Get.changeThemeMode(ThemeMode.light);
                                        _isDarkMode.value = false;
                                        Themecontroller.isDarkMode =
                                            _isDarkMode.value;
                                      },
                                      child: Container(
                                        padding: EdgeInsets.all(3.0),
                                        decoration: BoxDecoration(
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(5.0)),
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
                                            Text("Light Theme".tr)
                                          ],
                                        ),
                                      ),
                                    ),
                                    GestureDetector(
                                      onTap: () {
                                        Get.changeThemeMode(ThemeMode.dark);
                                        _isDarkMode.value = true;
                                        Themecontroller.isDarkMode =
                                            _isDarkMode.value;
                                      },
                                      child: Container(
                                        padding: EdgeInsets.all(3.0),
                                        decoration: BoxDecoration(
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(5.0)),
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
                                padding: const EdgeInsets.only(
                                    left: 35.0, right: 15.0, top: 15.0),
                                child: Divider(
                                  height: 1,
                                  color: Color(0xffD9D9D9),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(
                                    top: 20.0, left: 15.0, right: 15.0),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text("Language".tr),
                                    Directionality(
                                      textDirection: TextDirection.ltr,
                                      child: Container(
                                        margin: EdgeInsets.symmetric(
                                            horizontal: 20.0),
                                        padding: EdgeInsets.all(5.0),
                                        decoration: BoxDecoration(
                                          border: Border.all(
                                              color: Color(0xffD9D9D9)),
                                          borderRadius:
                                              BorderRadius.circular(5.0),
                                        ),
                                        child: DropdownButtonHideUnderline(
                                            child: GetBuilder<
                                                    LocalizationController>(
                                                builder: (controller) {
                                          // استخدام اللغة الحالية مباشرة من controller
                                          String currentLanguage = controller
                                              .currentLocale.value.languageCode;

                                          String initialValue =
                                              currentLanguage == 'ar'
                                                  ? 'Arabic'.tr
                                                  : 'English'.tr;

                                          return DropdownButton<String>(
                                            value:
                                                initialValue, // تعيين اللغة الافتراضية بدون .tr لأن النص ثابت
                                            isDense: true,
                                            dropdownColor: Colors.white,
                                            alignment: AlignmentDirectional
                                                .centerStart, // النص في اليسار
                                            icon: Padding(
                                              padding: const EdgeInsets.only(
                                                  left: 15.0),
                                              child: Icon(Icons.arrow_drop_down,
                                                  size: 16),
                                            ), // السهم في اليمين افتراضيًا
                                            items: ['English'.tr, 'Arabic'.tr]
                                                .map((String language) {
                                              return DropdownMenuItem<String>(
                                                value: language,
                                                child: Text(
                                                  language,
                                                  style: TextStyle(
                                                    fontSize: 14,
                                                    color: Colors.black,
                                                    fontWeight:
                                                        FontWeight.normal,
                                                  ),
                                                ),
                                              );
                                            }).toList(),
                                            onChanged: (String? newValue) {
                                              // عند تغيير اللغة، سيتم التبديل بين اللغتين بناءً على القيمة المحددة
                                              if (newValue == "Arabic".tr) {
                                                Get.find<
                                                        LocalizationController>()
                                                    .changeLanguage(
                                                        const Locale('ar'));
                                              } else {
                                                Get.find<
                                                        LocalizationController>()
                                                    .changeLanguage(
                                                        const Locale('en'));
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
                          )
                        : Text("data"))
              ],
            )),
      );
    }),
  );
}
