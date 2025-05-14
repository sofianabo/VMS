// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vms_school/Translate/local_controller.dart';
import 'package:vms_school/main.dart';
import 'package:vms_school/widgets/Responsive.dart';

class Section2 extends StatelessWidget {
  const Section2({super.key});

  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;
    return Container(
      margin: EdgeInsets.only(top: h / 8.55),
      child: ResponsiveUI(
        desktopScreen: Column(
          children: [
            Text("Who Can We Register At Virtual Modern School".tr,
                textAlign: TextAlign.center,
                style: Get.theme.textTheme.titleMedium!.copyWith(
                  fontSize: 24,
                )),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(bottom: h / 38),
                      child: Directionality(
                        textDirection:  Get.find<LocalizationController>().currentLocale.value.languageCode ==
                  'ar'
                            ? TextDirection.rtl
                            : TextDirection.ltr,
                        child: Row(
                          children: [
                            Container(
                              height: h / 22.8,
                              width: w / 42.66,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(1000),
                                color: const Color(0xff47ccaa),
                              ),
                              child: const Icon(
                                Icons.emoji_emotions_outlined,
                                color: Colors.white,
                              ),
                            ),
                            SizedBox(
                              width: w / 64,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Anyone who resides outside Syria desires to learn the Syrian Educational Curriculums from Elementary"
                                      .tr,
                                  style: Get.theme.textTheme.bodyMedium!,
                                ),
                                Text(
                                    "to Middle and High schools can enroll and graduate to be awarded the High school Diploma granted"
                                        .tr,
                                    style: Get.theme.textTheme.bodyMedium!),
                                Text(
                                    "by the Ministry of Education at Syrian Arab Republic"
                                        .tr,
                                    style: Get.theme.textTheme.bodyMedium!),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: h / 34.2,
                    ),
                    Directionality(
                      textDirection:  Get.find<LocalizationController>().currentLocale.value.languageCode ==
                  'ar'
                          ? TextDirection.rtl
                          : TextDirection.ltr,
                      child: Row(
                        children: [
                          Container(
                            height: h / 22.4,
                            width: w / 42.66,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(1000),
                                color: const Color(0xff946ffb)),
                            child: const Icon(
                              Icons.emoji_events_outlined,
                              color: Colors.white,
                            ),
                          ),
                          const SizedBox(
                            width: 20,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                  "People with special needs who are residing in Syria are uncapable to study in regular schools uncapable"
                                      .tr
                                      .tr,
                                  style: Get.theme.textTheme.bodyMedium!),
                              Text(
                                  "to study uncapable to study in regular schools and exceptional students cases determined by the"
                                      .tr
                                      .tr,
                                  style: Get.theme.textTheme.bodyMedium!),
                              Text(
                                  "Ministry of Education at Syrian Arab Diploma granted by the Ministry of Education at Syrian Arab"
                                      .tr
                                      .tr,
                                  style: Get.theme.textTheme.bodyMedium!),
                              Text("Republic".tr,
                                  style: Get.theme.textTheme.bodyMedium!),
                            ],
                          ),
                        ],
                      ),
                    )
                  ],
                ),
                Image.asset(
                  "assets/images/section2-image1.png",
                  height: h / 1.52,
                  width: w / 2.56,
                )
              ],
            ),
          ],
        ),
        tabletScreen: Column(
          spacing: 25.0,
          children: [
            Text("Who Can We Register At Virtual Modern School".tr,
                textAlign: TextAlign.center,
                style: Get.theme.textTheme.titleMedium!.copyWith(
                  fontSize: 20,
                )),
            Padding(
              padding: const EdgeInsets.only(top: 20.0, bottom: 20.0),
              child: Image.asset(
                "assets/images/section2-image1.png",
                width: 300,
                height: 300,
              ),
            ),
            Padding(
              padding: EdgeInsets.only(right: 10.0, left: 10.0),
              child: Directionality(
                textDirection:  Get.find<LocalizationController>().currentLocale.value.languageCode ==
                  'ar'
                    ? TextDirection.rtl
                    : TextDirection.ltr,
                child: Row(
                  spacing: 25.0,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: 30,
                      height: 30,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(1000),
                        color: const Color(0xff47ccaa),
                      ),
                      child: const Icon(
                        size: 16,
                        Icons.emoji_emotions_outlined,
                        color: Colors.white,
                      ),
                    ),
                    Container(
                      width: w - 80,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            maxLines: 3,
                            "Anyone who resides outside Syria desires to learn the Syrian Educational Curriculums from Elementary"
                                .tr,
                            style: Get.theme.textTheme.bodyMedium!
                                .copyWith(fontSize: 16.0),
                          ),
                          Text(
                              maxLines: 3,
                              "to Middle and High schools can enroll and graduate to be awarded the High school Diploma granted"
                                  .tr,
                              style: Get.theme.textTheme.bodyMedium!
                                  .copyWith(fontSize: 16.0)),
                          Text(
                              maxLines: 3,
                              "by the Ministry of Education at Syrian Arab Republic"
                                  .tr,
                              style: Get.theme.textTheme.bodyMedium!
                                  .copyWith(fontSize: 16.0)),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(right: 10.0, left: 10.0),
              child: Directionality(
                textDirection:  Get.find<LocalizationController>().currentLocale.value.languageCode ==
                  'ar'
                    ? TextDirection.rtl
                    : TextDirection.ltr,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  spacing: 25.0,
                  children: [
                    Container(
                      width: 30,
                      height: 30,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(1000),
                          color: const Color(0xff946ffb)),
                      child: const Icon(
                        size: 16,
                        Icons.emoji_events_outlined,
                        color: Colors.white,
                      ),
                    ),
                    Container(
                      width: w - 80,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                              maxLines: 3,
                              "People with special needs who are residing in Syria are uncapable to study in regular schools uncapable"
                                  .tr
                                  .tr,
                              style: Get.theme.textTheme.bodyMedium!
                                  .copyWith(fontSize: 16.0)),
                          Text(
                              maxLines: 3,
                              "to study uncapable to study in regular schools and exceptional students cases determined by the"
                                  .tr
                                  .tr,
                              style: Get.theme.textTheme.bodyMedium!
                                  .copyWith(fontSize: 16.0)),
                          Text(
                              maxLines: 3,
                              "Ministry of Education at Syrian Arab Diploma granted by the Ministry of Education at Syrian Arab"
                                  .tr
                                  .tr,
                              style: Get.theme.textTheme.bodyMedium!
                                  .copyWith(fontSize: 16.0)),
                          Text("Republic".tr,
                              style: Get.theme.textTheme.bodyMedium!
                                  .copyWith(fontSize: 16.0)),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
        mobileScreen: Column(
          spacing: 25.0,
          children: [
            Text("Who Can We Register At Virtual Modern School".tr,
                textAlign: TextAlign.center,
                style: Get.theme.textTheme.titleMedium!.copyWith(
                  fontSize: 16,
                )),
            Padding(
              padding: const EdgeInsets.only(top: 20.0, bottom: 20.0),
              child: Image.asset(
                "assets/images/section2-image1.png",
                width: 150,
                height: 200,
              ),
            ),
            Padding(
              padding: EdgeInsets.only(right: 10.0, left: 10.0),
              child: Directionality(
                textDirection:  Get.find<LocalizationController>().currentLocale.value.languageCode ==
                  'ar'
                    ? TextDirection.rtl
                    : TextDirection.ltr,
                child: Row(
                  spacing: 25.0,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: 30,
                      height: 30,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(1000),
                        color: const Color(0xff47ccaa),
                      ),
                      child: const Icon(
                        size: 16,
                        Icons.emoji_emotions_outlined,
                        color: Colors.white,
                      ),
                    ),
                    Container(
                      width: w - 80,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            maxLines: 3,
                            "Anyone who resides outside Syria desires to learn the Syrian Educational Curriculums from Elementary"
                                .tr,
                            style: Get.theme.textTheme.bodyMedium!
                                .copyWith(fontSize: 12.0),
                          ),
                          Text(
                              maxLines: 3,
                              "to Middle and High schools can enroll and graduate to be awarded the High school Diploma granted"
                                  .tr,
                              style: Get.theme.textTheme.bodyMedium!
                                  .copyWith(fontSize: 12.0)),
                          Text(
                              maxLines: 3,
                              "by the Ministry of Education at Syrian Arab Republic"
                                  .tr,
                              style: Get.theme.textTheme.bodyMedium!
                                  .copyWith(fontSize: 12.0)),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(right: 10.0, left: 10.0),
              child: Directionality(
                textDirection:  Get.find<LocalizationController>().currentLocale.value.languageCode ==
                  'ar'
                    ? TextDirection.rtl
                    : TextDirection.ltr,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  spacing: 25.0,
                  children: [
                    Container(
                      width: 30,
                      height: 30,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(1000),
                          color: const Color(0xff946ffb)),
                      child: const Icon(
                        size: 16,
                        Icons.emoji_events_outlined,
                        color: Colors.white,
                      ),
                    ),
                    Container(
                      width: w - 80,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                              maxLines: 3,
                              "People with special needs who are residing in Syria are uncapable to study in regular schools uncapable"
                                  .tr
                                  .tr,
                              style: Get.theme.textTheme.bodyMedium!
                                  .copyWith(fontSize: 12.0)),
                          Text(
                              maxLines: 3,
                              "to study uncapable to study in regular schools and exceptional students cases determined by the"
                                  .tr
                                  .tr,
                              style: Get.theme.textTheme.bodyMedium!
                                  .copyWith(fontSize: 12.0)),
                          Text(
                              maxLines: 3,
                              "Ministry of Education at Syrian Arab Diploma granted by the Ministry of Education at Syrian Arab"
                                  .tr
                                  .tr,
                              style: Get.theme.textTheme.bodyMedium!
                                  .copyWith(fontSize: 12.0)),
                          Text("Republic".tr,
                              style: Get.theme.textTheme.bodyMedium!
                                  .copyWith(fontSize: 12.0)),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
