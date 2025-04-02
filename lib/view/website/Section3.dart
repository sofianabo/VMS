// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vms_school/Translate/local_controller.dart';
import 'package:vms_school/main.dart';

class Section3 extends StatelessWidget {
  const Section3({super.key});

  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;
    return Container(
      margin: EdgeInsets.only(top: h / 6.84),
      child: Column(
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
                  textDirection: prefs!.getString(languageKey) == 'ar'
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
                          "1. Enter the first and last name of the guardian".tr,
                          style: Get.theme.textTheme.bodyMedium!
                              .copyWith(fontSize: 16)),
                      SizedBox(
                        height: h / 34.2,
                      ),
                      Text("2. Enter the mobile phone number of guardian".tr,
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
                      Container(
                        height: h / 13.68,
                        width: w / 9.846,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Get.theme.primaryColor),
                        child: Center(
                          child: Text("Read More".tr,
                              style: Get.theme.textTheme.displayMedium!),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
