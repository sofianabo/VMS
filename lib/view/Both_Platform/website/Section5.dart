// ignore_for_file: file_names

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
                    style: Get.theme.textTheme.titleMedium!),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Column(
                    children: [
                      Row(
                        children: [
                          Text(
                              "is a community of learners, including students, parents, and staff, dedicated to creating a rigorous and"
                                  .tr,
                              style: Get.theme.textTheme.bodyMedium!),
                          Text("VIRTUAL MODERN SCHOOL (VMS)".tr,
                              style: Get.theme.textTheme.bodyMedium!),
                        ],
                      ),
                      Text(
                          "inclusive educational environment. VMS students are goal-oriented, critical thinkers, and community leaders"
                              .tr,
                          style: Get.theme.textTheme.bodyMedium!),
                      Text(
                        "committed to achieving high levels of integrity and academic success."
                            .tr,
                        style: Get.theme.textTheme.bodyMedium!,
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
                              const SizedBox(
                                width: 50,
                              ),
                              Container(
                                width: w / 1.6,
                                height: h / 2.28,
                                padding: EdgeInsets.only(top: h / 22.8),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(30),
                                    color: Get.theme.colorScheme.onPrimary),
                                child: Column(
                                  children: [
                                    Text(
                                        "VIRTUAL MODERN SCHOOL (VMS) staff aim to create a supportive"
                                            .tr,
                                        style: Get.theme.textTheme.bodyMedium!),
                                    Text(
                                        "and challenging environment for all students to reach their potential,"
                                            .tr,
                                        style: Get.theme.textTheme.bodyMedium!),
                                    Text(
                                        "engaging in continuous improvement through goal setting and"
                                            .tr,
                                        style: Get.theme.textTheme.bodyMedium!),
                                    Text("reflection".tr,
                                        style: Get.theme.textTheme.bodyMedium!),
                                    SizedBox(
                                      height: h / 34.2,
                                    ),
                                    Image.asset(
                                      "assets/images/section5-image3.png",
                                      height: h / 6.84,
                                      width: w / 12.8,
                                    ),
                                    SizedBox(
                                      height: h / 34.2,
                                    ),
                                    Text("Virtual Modern School".tr,
                                        style:
                                            Get.theme.textTheme.headlineLarge!)
                                  ],
                                ),
                              ),
                              SizedBox(
                                width: w / 25.6,
                              ),
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
                    style: Get.theme.textTheme.titleMedium!),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Column(
                    children: [
                      Row(
                        children: [
                          Text(
                              "is a community of learners, including students, parents, and staff, dedicated to creating a rigorous and"
                                  .tr,
                              style: Get.theme.textTheme.bodyMedium!),
                          Text("VIRTUAL MODERN SCHOOL (VMS)".tr,
                              style: Get.theme.textTheme.bodyMedium!),
                        ],
                      ),
                      Text(
                          "inclusive educational environment. VMS students are goal-oriented, critical thinkers, and community leaders"
                              .tr,
                          style: Get.theme.textTheme.bodyMedium!),
                      Text(
                        "committed to achieving high levels of integrity and academic success."
                            .tr,
                        style: Get.theme.textTheme.bodyMedium!,
                      ),
                      Column(
                        spacing: 5.0,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Image.asset(
                                "assets/images/section5-image1.png",
                                height: h / 1.71,
                                width: w / 12.8,
                              ),
                              const SizedBox(
                                width: 50,
                              ),
                              Container(
                                width: w / 1.6,
                                height: h / 2.28,
                                padding: EdgeInsets.only(top: h / 22.8),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(30),
                                    color: Get.theme.colorScheme.onPrimary),
                                child: Column(
                                  children: [
                                    Text(
                                        "VIRTUAL MODERN SCHOOL (VMS) staff aim to create a supportive"
                                            .tr,
                                        style: Get.theme.textTheme.bodyMedium!),
                                    Text(
                                        "and challenging environment for all students to reach their potential,"
                                            .tr,
                                        style: Get.theme.textTheme.bodyMedium!),
                                    Text(
                                        "engaging in continuous improvement through goal setting and"
                                            .tr,
                                        style: Get.theme.textTheme.bodyMedium!),
                                    Text("reflection".tr,
                                        style: Get.theme.textTheme.bodyMedium!),
                                    SizedBox(
                                      height: h / 34.2,
                                    ),
                                    Image.asset(
                                      "assets/images/section5-image3.png",
                                      height: h / 6.84,
                                      width: w / 12.8,
                                    ),
                                    SizedBox(
                                      height: h / 34.2,
                                    ),
                                    Text("Virtual Modern School".tr,
                                        style:
                                            Get.theme.textTheme.headlineLarge!)
                                  ],
                                ),
                              ),
                              SizedBox(
                                width: w / 25.6,
                              ),
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
          mobileScreen: Column(
            children: [
              Padding(
                padding: EdgeInsets.only(bottom: h / 25),
                child: Text("Who Are We".tr,
                    style: Get.theme.textTheme.titleMedium!),
              ),
              Column(
                children: [
                  Container(
                    width: w,
                    padding: EdgeInsets.only(left: 12.0, right: 12.0),
                    child: Row(
                      children: [
                        Expanded(
                          child: Text(
                              textAlign: TextAlign.center,
                              maxLines: 3,
                              "is a community of learners, including students, parents, and staff, dedicated to creating a rigorous and"
                                  .tr,
                              style: Get.theme.textTheme.bodyMedium!),
                        ),
                        Text("VIRTUAL MODERN SCHOOL (VMS)".tr,
                            style: Get.theme.textTheme.bodyMedium!),
                      ],
                    ),
                  ),
                  Container(
                    width: w,
                    padding: EdgeInsets.only(left: 12.0, right: 12.0),
                    child: Column(
                      children: [
                        Text(
                            maxLines: 3,
                            textAlign: TextAlign.center,
                            "inclusive educational environment. VMS students are goal-oriented, critical thinkers, and community leaders"
                                .tr,
                            style: Get.theme.textTheme.bodyMedium!),
                        Text(
                          maxLines: 3,
                          textAlign: TextAlign.center,
                          "committed to achieving high levels of integrity and academic success."
                              .tr,
                          style: Get.theme.textTheme.bodyMedium!,
                        ),
                      ],
                    ),
                  ),
                  Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 15.0),
                        child: Container(
                          width: w - 60,
                          padding: EdgeInsets.only(top: 20.0, bottom: 20.0),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(30),
                              color: Get.theme.colorScheme.onPrimary),
                          child: Column(
                            spacing: 15.0,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(
                                  textAlign: TextAlign.center,
                                  "VIRTUAL MODERN SCHOOL (VMS) staff aim to create a supportive"
                                      .tr,
                                  style: Get.theme.textTheme.bodyMedium!
                                      .copyWith(fontSize: 13)),
                              Text(
                                  textAlign: TextAlign.center,
                                  "and challenging environment for all students to reach their potential,"
                                      .tr,
                                  style: Get.theme.textTheme.bodyMedium!
                                      .copyWith(fontSize: 13)),
                              Text(
                                  textAlign: TextAlign.center,
                                  "engaging in continuous improvement through goal setting and"
                                      .tr,
                                  style: Get.theme.textTheme.bodyMedium!
                                      .copyWith(fontSize: 13)),
                              Text(
                                  textAlign: TextAlign.center,
                                  "reflection".tr,
                                  style: Get.theme.textTheme.bodyMedium!
                                      .copyWith(fontSize: 13)),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Image.asset(
                                  "assets/images/section5-image3.png",
                                  width: 75,
                                ),
                              ),
                              Text("Virtual Modern School".tr,
                                  style: Get.theme.textTheme.headlineLarge!)
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
              )
            ],
          ),
        ));
  }
}
