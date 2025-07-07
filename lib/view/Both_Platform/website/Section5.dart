import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vms_school/view/Both_Platform/widgets/Responsive.dart';

class Section5 extends StatelessWidget {
  const Section5({super.key});

  @override
  Widget build(BuildContext context) {
    double h = 640;
    double w = MediaQuery.of(context).size.width;
    return Container(
      margin: EdgeInsets.only(top: h / 6.84),
      child: ResponsiveUI(
        desktopScreen: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(bottom: h / 25),
              child: Text("Who Are We".tr,
                  style: Get.theme.textTheme.titleMedium!.copyWith()),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Column(
                  children: [
                    // النص الأول المعدل
                    Container(
                      width: w * 0.8,
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      child: Text(
                        'is a community of learners, including students, parents, and staff, dedicated to creating a rigorous and VIRTUAL MODERN SCHOOL (VMS) inclusive educational environment. VMS students are goal-oriented, critical thinkers, and community leaders committed to achieving high levels of integrity and academic success.'
                            .tr,
                        style: Get.theme.textTheme.bodyMedium!,
                        textAlign: TextAlign.center,
                        maxLines: 3,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Image.asset(
                              "assets/images/section5-image1.png",
                              height: h / 1.71,
                              width: w / 12.8,
                            ),
                            const SizedBox(width: 50),
                            Container(
                              width: w / 1.6,
                              height: h / 2.28,
                              padding: EdgeInsets.only(top: h / 22.8),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(30),
                                color: Get.theme.colorScheme.onPrimary,
                              ),
                              child: Column(
                                children: [
                                  // النص الثاني المعدل
                                  Padding(
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 20),
                                    child: Text(
                                      "VIRTUAL MODERN SCHOOL (VMS) staff aim to create a supportive and challenging environment for all students to reach their potential, engaging in continuous improvement through goal setting and reflection"
                                          .tr,
                                      style: Get.theme.textTheme.bodyMedium!,
                                      textAlign: TextAlign.center,
                                      maxLines: 4,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ),
                                  SizedBox(height: h / 34.2),
                                  Image.asset(
                                    "assets/images/section5-image3.png",
                                    height: h / 6.84,
                                    width: w / 12.8,
                                  ),
                                  SizedBox(height: h / 34.2),
                                  Text(
                                    "Virtual Modern School".tr,
                                    style: Get.theme.textTheme.headlineLarge!
                                        .copyWith(
                                      fontWeight: FontWeight.normal,
                                    ),
                                  )
                                ],
                              ),
                            ),
                            SizedBox(width: w / 25.6),
                            Image.asset(
                              "assets/images/section5-image2.png",
                              height: h / 1.71,
                              width: w / 12.8,
                            ),
                          ],
                        ),
                        Image.asset(
                          "assets/images/section5-image4.png",
                          width: 110,
                        ),
                      ],
                    ),
                  ],
                )
              ],
            ),
          ],
        ),
        tabletScreen: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(bottom: h / 25),
              child: Text("Who Are We".tr,
                  style: Get.theme.textTheme.titleMedium!.copyWith()),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Column(
                  children: [
                    // النص الأول المعدل للتابلت
                    Container(
                      width: w * 0.9,
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      child: Text(
                        'is a community of learners, including students, parents, and staff, dedicated to creating a rigorous and VIRTUAL MODERN SCHOOL (VMS) inclusive educational environment. VMS students are goal-oriented, critical thinkers, and community leaders committed to achieving high levels of integrity and academic success.'
                            .tr,
                        style: Get.theme.textTheme.bodyMedium!,
                        textAlign: TextAlign.center,
                        maxLines: 4,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Image.asset(
                              "assets/images/section5-image1.png",
                              height: h / 2,
                              width: w / 8,
                            ),
                            const SizedBox(width: 20),
                            Container(
                              width: w / 1.8,
                              height: h / 2.5,
                              padding: EdgeInsets.only(top: 20),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(30),
                                color: Get.theme.colorScheme.onPrimary,
                              ),
                              child: Column(
                                children: [
                                  // النص الثاني المعدل للتابلت
                                  Padding(
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 20),
                                    child: Text(
                                      "VIRTUAL MODERN SCHOOL (VMS) staff aim to create a supportive and challenging environment for all students to reach their potential, engaging in continuous improvement through goal setting and reflection"
                                          .tr,
                                      style: Get.theme.textTheme.bodyMedium!,
                                      textAlign: TextAlign.center,
                                      maxLines: 5,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ),
                                  SizedBox(height: 20),
                                  Image.asset(
                                    "assets/images/section5-image3.png",
                                    height: h / 8,
                                    width: w / 8,
                                  ),
                                  SizedBox(height: 20),
                                  Text(
                                    "Virtual Modern School".tr,
                                    style: Get.theme.textTheme.headlineLarge!
                                        .copyWith(
                                      fontWeight: FontWeight.normal,
                                    ),
                                  )
                                ],
                              ),
                            ),
                            SizedBox(width: 20),
                            Image.asset(
                              "assets/images/section5-image2.png",
                              height: h / 2,
                              width: w / 8,
                            ),
                          ],
                        ),
                        Image.asset(
                          "assets/images/section5-image4.png",
                          width: 110,
                        ),
                      ],
                    ),
                  ],
                )
              ],
            ),
          ],
        ),
        mobileScreen: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(bottom: h / 25),
              child: Text("Who Are We".tr,
                  style: Get.theme.textTheme.titleMedium!.copyWith()),
            ),
            Column(
              children: [
                // النص الأول المعدل للموبايل
                Container(
                  width: w,
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: Text(
                    'is a community of learners, including students, parents, and staff, dedicated to creating a rigorous and VIRTUAL MODERN SCHOOL (VMS) inclusive educational environment. VMS students are goal-oriented, critical thinkers, and community leaders committed to achieving high levels of integrity and academic success.'
                        .tr,
                    style: Get.theme.textTheme.bodyMedium!,
                    textAlign: TextAlign.center,
                    maxLines: 7,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 15.0),
                      child: Container(
                        width: w - 60,
                        padding: EdgeInsets.all(20),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          color: Get.theme.colorScheme.onPrimary,
                        ),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            // النص الثاني المعدل للموبايل
                            Text(
                              "VIRTUAL MODERN SCHOOL (VMS) staff aim to create a supportive and challenging environment for all students to reach their potential, engaging in continuous improvement through goal setting and reflection"
                                  .tr,
                              style: Get.theme.textTheme.bodyMedium!
                                  .copyWith(fontSize: 14),
                              textAlign: TextAlign.center,
                              maxLines: 6,
                              overflow: TextOverflow.ellipsis,
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Image.asset(
                                "assets/images/section5-image3.png",
                                width: 75,
                              ),
                            ),
                            Text(
                              "Virtual Modern School".tr,
                              style:
                                  Get.theme.textTheme.headlineLarge!.copyWith(
                                fontWeight: FontWeight.normal,
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 15.0),
                      child: Image.asset(
                        "assets/images/section5-image4.png",
                        width: 100,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
