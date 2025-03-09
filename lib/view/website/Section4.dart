import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vms_school/Translate/local_controller.dart';
import 'package:vms_school/main.dart';

class Section4 extends StatelessWidget {
  const Section4({super.key});

  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;
    return Container(
      padding: EdgeInsets.only(bottom: h / 45.6),
      width: w / 2,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          color: Get.theme.colorScheme.onPrimary),
      child: Column(
        children: [
          Directionality(
              textDirection: prefs!.getString(languageKey) == 'ar'
                  ? TextDirection.rtl
                  : TextDirection.ltr,
              child: Padding(
                padding: EdgeInsets.only(top: h / 38),
                child:
                    Text("Why Us?".tr, style: Get.theme.textTheme.titleMedium!),
              )),
          SizedBox(
            height: h / 27.36,
          ),
          Text(
              "Virtual Modern School is an online learning platform that helps students to learn the"
                  .tr,
              style: Get.theme.textTheme.bodyMedium!),
          Text(
              "Syrian Education Curriculum from home. The courses of this platform are designed"
                  .tr,
              style: Get.theme.textTheme.bodyMedium!),
          Text(
              "for elementary school, middle school, and high school all in one place."
                  .tr,
              style: Get.theme.textTheme.bodyMedium!),
          SizedBox(
            height: h / 34.2,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Container(
                padding: EdgeInsets.only(top: h / 68.4, bottom: h / 68.4),
                height: h / 3.10909,
                width: w / 6.736,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    color: Get.theme.scaffoldBackgroundColor),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Image.asset(
                      "../../images/section4-image1.png",
                      height: h / 7.6,
                    ),
                    SizedBox(
                      height: h / 68.4,
                    ),
                    Text("Improving educational".tr,
                        style: Get.theme.textTheme.bodyMedium!),
                    Text("Skills".tr, style: Get.theme.textTheme.bodyMedium!)
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.only(top: h / 68.4, bottom: h / 68.4),
                height: h / 3.10909,
                width: w / 6.736,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    color: Get.theme.scaffoldBackgroundColor),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Image.asset(
                      "../../images/section4-image2.png",
                      height: h / 7.6,
                    ),
                    SizedBox(
                      height: h / 68.4,
                    ),
                    Text("Smart virtual".tr,
                        style: Get.theme.textTheme.bodyMedium!),
                    Text("meeting".tr, style: Get.theme.textTheme.bodyMedium!)
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.only(top: h / 68.4, bottom: h / 68.4),
                height: h / 3.10909,
                width: w / 6.736,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    color: Get.theme.scaffoldBackgroundColor),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Image.asset(
                      "../../images/section4-image3.png",
                      height: h / 7.6,
                    ),
                    SizedBox(
                      height: h / 68.4,
                    ),
                    Text("Outstanding".tr,
                        style: Get.theme.textTheme.bodyMedium!),
                    Text("user - friendliness".tr,
                        style: Get.theme.textTheme.bodyMedium!)
                  ],
                ),
              ),
            ],
          ),
          SizedBox(
            height: h / 34.2,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Container(
                padding: EdgeInsets.only(top: h / 68.4, bottom: h / 68.4),
                height: h / 3.10909,
                width: w / 6.736,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    color: Get.theme.scaffoldBackgroundColor),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Image.asset(
                      "../../images/section4-image4.png",
                      height: h / 7.6,
                    ),
                    SizedBox(
                      height: h / 68.4,
                    ),
                    Text("Instant live".tr,
                        style: Get.theme.textTheme.bodyMedium!),
                    Text("Lessons".tr, style: Get.theme.textTheme.bodyMedium!)
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.only(top: h / 68.4, bottom: h / 68.4),
                height: h / 3.10909,
                width: w / 6.736,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    color: Get.theme.scaffoldBackgroundColor),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Image.asset(
                      "../../images/section4-image5.png",
                      height: h / 7.6,
                    ),
                    SizedBox(
                      height: h / 68.4,
                    ),
                    Text("Focus on results".tr,
                        style: Get.theme.textTheme.bodyMedium!)
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.only(top: h / 68.4, bottom: h / 68.4),
                height: h / 3.10909,
                width: w / 6.736,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    color: Get.theme.scaffoldBackgroundColor),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Image.asset(
                      "../../images/section4-image6.png",
                      height: h / 7.6,
                    ),
                    SizedBox(
                      height: h / 68.4,
                    ),
                    Text("Multiple registration".tr,
                        style: Get.theme.textTheme.bodyMedium!),
                    Text("options".tr, style: Get.theme.textTheme.bodyMedium!)
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
