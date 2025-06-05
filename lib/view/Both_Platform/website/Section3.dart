// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vms_school/Translate/local_controller.dart';
import 'package:vms_school/view/Both_Platform/widgets/Responsive.dart';

class Section3 extends StatelessWidget {
  const Section3({super.key});

  @override
  Widget build(BuildContext context) {
    double h = 640;
    double w = MediaQuery.of(context).size.width;
    return Container(
        margin: EdgeInsets.only(top: 25, bottom: 30.0),
        child: ResponsiveUI(
          desktopScreen: Column(
            children: [
              Text("How I Can Enroll At Virtual Modern School".tr,
                  style: Get.theme.textTheme.titleMedium!.copyWith(
                    fontSize: 24,
                  )),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Image.asset(
                    "assets/images/section3-image1.jpg",
                    height: h / 1.14,
                    width: w / 2.4,
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: w / 64),
                    child: Directionality(
                      textDirection: Get.find<LocalizationController>()
                                  .currentLocale
                                  .value
                                  .languageCode ==
                              'ar'
                          ? TextDirection.rtl
                          : TextDirection.ltr,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                              "Parents of our students can register their children in the Virtual Modern School"
                                  .tr,
                              style: Get.theme.textTheme.bodyMedium!
                                  .copyWith(fontSize: 16)),
                          Text("by the following steps:".tr,
                              style: Get.theme.textTheme.bodyMedium!
                                  .copyWith(fontSize: 16)),
                          SizedBox(
                            height: h / 34.2,
                          ),
                          Text(
                              "1. Enter the first and last name of the guardian"
                                  .tr,
                              style: Get.theme.textTheme.bodyMedium!
                                  .copyWith(fontSize: 16)),
                          SizedBox(
                            height: h / 34.2,
                          ),
                          Text(
                              "2. Enter the mobile phone number of guardian".tr,
                              style: Get.theme.textTheme.bodyMedium!
                                  .copyWith(fontSize: 16)),
                          SizedBox(
                            height: h / 34.2,
                          ),
                          Text(
                              "3. Enter the Syrian national number of the guardian"
                                  .tr,
                              style: Get.theme.textTheme.bodyMedium!
                                  .copyWith(fontSize: 16)),
                          SizedBox(
                            height: h / 17.1,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
          tabletScreen: Column(
            spacing: 25.0,
            children: [
              Text("How I Can Enroll At Virtual Modern School".tr,
                  textAlign: TextAlign.center,
                  maxLines: 2,
                  style: Get.theme.textTheme.titleMedium!.copyWith(
                    fontWeight: FontWeight.normal,
                    fontSize: 18,
                  )),
              Container(
                padding: EdgeInsets.only(left: 20.0, right: 20.0),
                height: 300,
                width: w,
                child: Image.asset(
                  "assets/images/section3-image1.jpg",
                  fit: BoxFit.cover,
                ),
              ),
              Row(
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: 20.0, right: 20.0),
                    child: Directionality(
                      textDirection: Get.find<LocalizationController>()
                                  .currentLocale
                                  .value
                                  .languageCode ==
                              'ar'
                          ? TextDirection.rtl
                          : TextDirection.ltr,
                      child: Column(
                        spacing: 15.0,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                              textAlign: TextAlign.center,
                              "Parents of our students can register their children in the Virtual Modern School"
                                  .tr,
                              style: Get.theme.textTheme.bodyMedium!
                                  .copyWith(fontSize: 14)),
                          Text("by the following steps:".tr,
                              textAlign: TextAlign.center,
                              style: Get.theme.textTheme.bodyMedium!
                                  .copyWith(fontSize: 14)),
                          Text(
                              textAlign: TextAlign.center,
                              "1. Enter the first and last name of the guardian"
                                  .tr,
                              style: Get.theme.textTheme.bodyMedium!
                                  .copyWith(fontSize: 14)),
                          Text(
                              "2. Enter the mobile phone number of guardian".tr,
                              textAlign: TextAlign.center,
                              style: Get.theme.textTheme.bodyMedium!
                                  .copyWith(fontSize: 14)),
                          Text(
                              textAlign: TextAlign.center,
                              "3. Enter the Syrian national number of the guardian"
                                  .tr,
                              style: Get.theme.textTheme.bodyMedium!
                                  .copyWith(fontSize: 14)),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
          mobileScreen: Column(
            spacing: 25.0,
            children: [
              Text("How I Can Enroll At Virtual Modern School".tr,
                  textAlign: TextAlign.center,
                  maxLines: 2,
                  style: Get.theme.textTheme.titleMedium!.copyWith(
                    fontSize: 16,
                  )),
              Container(
                padding: EdgeInsets.only(left: 20.0, right: 20.0),
                height: 300,
                width: w,
                child: Image.asset(
                  "assets/images/section3-image1.jpg",
                  fit: BoxFit.cover,
                ),
              ),
              Row(
                children: [
                  Container(
                    padding: EdgeInsets.only(left: 25.0, right: 25.0),
                    width: w,
                    child: Directionality(
                      textDirection: Get.find<LocalizationController>()
                                  .currentLocale
                                  .value
                                  .languageCode ==
                              'ar'
                          ? TextDirection.rtl
                          : TextDirection.ltr,
                      child: Column(
                        spacing: 15.0,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                              textAlign: TextAlign.center,
                              maxLines: 2,
                              "Parents of our students can register their children in the Virtual Modern School"
                                  .tr,
                              style: Get.theme.textTheme.bodyMedium!
                                  .copyWith(fontSize: 14)),
                          Text("by the following steps:".tr,
                              textAlign: TextAlign.center,
                              maxLines: 2,
                              style: Get.theme.textTheme.bodyMedium!
                                  .copyWith(fontSize: 14)),
                          Text(
                              textAlign: TextAlign.center,
                              maxLines: 2,
                              "1. Enter the first and last name of the guardian"
                                  .tr,
                              style: Get.theme.textTheme.bodyMedium!
                                  .copyWith(fontSize: 14)),
                          Text(
                              "2. Enter the mobile phone number of guardian".tr,
                              textAlign: TextAlign.center,
                              maxLines: 2,
                              style: Get.theme.textTheme.bodyMedium!
                                  .copyWith(fontSize: 14)),
                          Text(
                              textAlign: TextAlign.center,
                              maxLines: 2,
                              "3. Enter the Syrian national number of the guardian"
                                  .tr,
                              style: Get.theme.textTheme.bodyMedium!
                                  .copyWith(fontSize: 14)),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ));
  }
}
