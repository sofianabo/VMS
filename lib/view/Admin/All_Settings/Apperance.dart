import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:vms_school/Theme/themeController.dart';
import 'package:vms_school/Translate/local_controller.dart';

class Appearance extends StatefulWidget {
  const Appearance({super.key});

  @override
  State<Appearance> createState() => _AppearanceState();
}

class _AppearanceState extends State<Appearance> {
  var _isDarkMode = Get.isDarkMode.obs;
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topCenter,
      child: SingleChildScrollView(
        child: Column(
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
                            "assets/images/light.svg",
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
                            "assets/images/dark.svg",
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
              padding:
                  const EdgeInsets.only(left: 35.0, right: 15.0, top: 15.0),
              child: Divider(
                height: 1,
                color: Color(0xffD9D9D9),
              ),
            ),
            Padding(
              padding:
                  const EdgeInsets.only(top: 20.0, left: 15.0, right: 15.0),
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
                          GetBuilder<LocalizationController>(
                              builder: (controller) {
                        // استخدام اللغة الحالية مباشرة من controller
                        String currentLanguage =
                            controller.currentLocale.value.languageCode;

                        String initialValue = currentLanguage == 'ar'
                            ? 'Arabic'.tr
                            : 'English'.tr;

                        return DropdownButton<String>(
                          value:
                              initialValue, // تعيين اللغة الافتراضية بدون .tr لأن النص ثابت
                          isDense: true,
                          dropdownColor: Theme.of(context).cardColor,
                          alignment: AlignmentDirectional
                              .centerStart, // النص في اليسار
                          icon: Padding(
                            padding: const EdgeInsets.only(left: 15.0),
                            child: Icon(Icons.arrow_drop_down, size: 16),
                          ), // السهم في اليمين افتراضيًا
                          items: ['English'.tr, 'Arabic'.tr]
                              .map((String language) {
                            return DropdownMenuItem<String>(
                              value: language,
                              child: Text(language,
                                  style:
                                      Theme.of(context).textTheme.bodyMedium),
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
        ),
      ),
    );
  }
}
