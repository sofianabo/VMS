import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vms_school/Translate/local_controller.dart';
import 'package:vms_school/view/Both_Platform/widgets/Responsive.dart';

class Section4 extends StatelessWidget {
  const Section4({super.key});

  @override
  Widget build(BuildContext context) {
    double h = 640;
    double w = MediaQuery.of(context).size.width;
    return ResponsiveUI(
      desktopScreen: Container(
        padding: EdgeInsets.only(bottom: h / 45.6),
        width: w / 2,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30),
            color: Get.theme.colorScheme.onPrimary),
        child: Column(
          children: [
            Directionality(
                textDirection: Get.find<LocalizationController>()
                            .currentLocale
                            .value
                            .languageCode ==
                        'ar'
                    ? TextDirection.rtl
                    : TextDirection.ltr,
                child: Padding(
                  padding: EdgeInsets.only(top: h / 38),
                  child: Text("Why Us?".tr,
                      style: Get.theme.textTheme.titleMedium!.copyWith()),
                )),
            SizedBox(
              height: h / 27.36,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Text(
                'Virtual Modern School is an online learning platform that helps students to learn the Syrian Education Curriculum from home. The courses of this platform are designed for elementary school, middle school, and high school all in one place.'
                    .tr,
                style: Get.theme.textTheme.bodyMedium!,
                textAlign: TextAlign.center,
                maxLines: 4,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            SizedBox(
              height: h / 34.2,
            ),
            Wrap(
              spacing: 20,
              runSpacing: 20,
              alignment: WrapAlignment.spaceAround,
              children: [
                Section4Card(
                  hight: h / 3.10909,
                  width: w / 6.736,
                  imagePath: "assets/images/section4-image1.png",
                  textLines: ["Improving educational", "Skills"],
                ),
                Section4Card(
                  hight: h / 3.10909,
                  width: w / 6.736,
                  imagePath: "assets/images/section4-image2.png",
                  textLines: ["Smart virtual", "meeting"],
                ),
                Section4Card(
                  hight: h / 3.10909,
                  width: w / 6.736,
                  imagePath: "assets/images/section4-image3.png",
                  textLines: ["Outstanding", "user - friendliness"],
                ),
                Section4Card(
                  hight: h / 3.10909,
                  width: w / 6.736,
                  imagePath: "assets/images/section4-image4.png",
                  textLines: ["Instant live", "Lessons"],
                ),
                Section4Card(
                  hight: h / 3.10909,
                  width: w / 6.736,
                  imagePath: "assets/images/section4-image5.png",
                  textLines: ["Focus on results"],
                ),
                Section4Card(
                  hight: h / 3.10909,
                  width: w / 6.736,
                  imagePath: "assets/images/section4-image6.png",
                  textLines: ["Multiple registration", "options"],
                ),
              ],
            ),
          ],
        ),
      ),
      tabletScreen: Container(
        padding: EdgeInsets.only(bottom: h / 45.6),
        width: w - 60,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30),
            color: Get.theme.colorScheme.onPrimary),
        child: Column(
          children: [
            Directionality(
                textDirection: Get.find<LocalizationController>()
                            .currentLocale
                            .value
                            .languageCode ==
                        'ar'
                    ? TextDirection.rtl
                    : TextDirection.ltr,
                child: Padding(
                  padding: EdgeInsets.only(top: h / 38, bottom: 15.0),
                  child: Text("Why Us?".tr,
                      style: Get.theme.textTheme.titleMedium!.copyWith(
                        fontWeight: FontWeight.normal,
                      )),
                )),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Text(
                'Virtual Modern School is an online learning platform that helps students to learn the Syrian Education Curriculum from home. The courses of this platform are designed for elementary school, middle school, and high school all in one place.'
                    .tr,
                style: Get.theme.textTheme.bodyMedium!.copyWith(fontSize: 12.0),
                textAlign: TextAlign.center,
                maxLines: 4,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 15.0),
              child: Wrap(
                spacing: 10,
                runSpacing: 10,
                alignment: WrapAlignment.spaceAround,
                children: [
                  Section4Card(
                    hight: 180,
                    width: (w - 90) / 3,
                    imagePath: "assets/images/section4-image1.png",
                    textLines: ["Improving educational", "Skills"],
                  ),
                  Section4Card(
                    hight: 180,
                    width: (w - 90) / 3,
                    imagePath: "assets/images/section4-image2.png",
                    textLines: ["Smart virtual", "meeting"],
                  ),
                  Section4Card(
                    hight: 180,
                    width: (w - 90) / 3,
                    imagePath: "assets/images/section4-image3.png",
                    textLines: ["Outstanding", "user - friendliness"],
                  ),
                  Section4Card(
                    hight: 180,
                    width: (w - 90) / 3,
                    imagePath: "assets/images/section4-image4.png",
                    textLines: ["Instant live", "Lessons"],
                  ),
                  Section4Card(
                    hight: 180,
                    width: (w - 90) / 3,
                    imagePath: "assets/images/section4-image5.png",
                    textLines: ["Focus on results"],
                  ),
                  Section4Card(
                    hight: 180,
                    width: (w - 90) / 3,
                    imagePath: "assets/images/section4-image6.png",
                    textLines: ["Multiple registration", "options"],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
      mobileScreen: Container(
        padding: EdgeInsets.only(bottom: h / 45.6),
        width: w - 60,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30),
            color: Get.theme.colorScheme.onPrimary),
        child: Column(
          children: [
            Directionality(
                textDirection: Get.find<LocalizationController>()
                            .currentLocale
                            .value
                            .languageCode ==
                        'ar'
                    ? TextDirection.rtl
                    : TextDirection.ltr,
                child: Padding(
                  padding: EdgeInsets.only(top: h / 38, bottom: 15.0),
                  child: Text("Why Us?".tr,
                      style: Get.theme.textTheme.titleMedium!.copyWith()),
                )),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Text(
                'Virtual Modern School is an online learning platform that helps students to learn the Syrian Education Curriculum from home. The courses of this platform are designed for elementary school, middle school, and high school all in one place.'
                    .tr,
                style: Get.theme.textTheme.bodyMedium!.copyWith(fontSize: 12.0),
                textAlign: TextAlign.center,
                maxLines: 6,
                overflow: TextOverflow.ellipsis,  
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 15.0),
              child: Wrap(
                spacing: 10,
                runSpacing: 10,
                alignment: WrapAlignment.spaceAround,
                children: [
                  Section4Card(
                    hight: 180,
                    width: (w - 90) / 3,
                    imagePath: "assets/images/section4-image1.png",
                    textLines: ["Improving educational", "Skills"],
                  ),
                  Section4Card(
                    hight: 180,
                    width: (w - 90) / 3,
                    imagePath: "assets/images/section4-image2.png",
                    textLines: ["Smart virtual", "meeting"],
                  ),
                  Section4Card(
                    hight: 180,
                    width: (w - 90) / 3,
                    imagePath: "assets/images/section4-image3.png",
                    textLines: ["Outstanding", "user - friendliness"],
                  ),
                  Section4Card(
                    hight: 180,
                    width: (w - 90) / 3,
                    imagePath: "assets/images/section4-image4.png",
                    textLines: ["Instant live", "Lessons"],
                  ),
                  Section4Card(
                    hight: 180,
                    width: (w - 90) / 3,
                    imagePath: "assets/images/section4-image5.png",
                    textLines: ["Focus on results"],
                  ),
                  Section4Card(
                    hight: 180,
                    width: (w - 90) / 3,
                    imagePath: "assets/images/section4-image6.png",
                    textLines: ["Multiple registration", "options"],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class Section4Card extends StatelessWidget {
  final double hight;
  final double width;
  final String imagePath;
  final List<String> textLines;

  const Section4Card({
    super.key,
    required this.hight,
    required this.width,
    required this.imagePath,
    required this.textLines,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 10.0),
      height: hight,
      width: width,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        color: Get.theme.scaffoldBackgroundColor,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Image.asset(
              imagePath,
              height: 60,
            ),
          ),
          SizedBox(height: 1),
          ...textLines.map((line) => Text(
                textAlign: TextAlign.center,
                line.tr,
                style: Get.theme.textTheme.bodyMedium!.copyWith(fontSize: 13.0),
              )),
        ],
      ),
    );
  }
}
