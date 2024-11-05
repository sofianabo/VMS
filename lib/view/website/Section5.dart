// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class Section5 extends StatelessWidget {
  const Section5({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin:const EdgeInsets.only(top: 100),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 25.0),
            child: Text("Who Are We", style: Get.theme.primaryTextTheme.titleLarge),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Column(
                children: [
                  Row(
                    children: [
                      Text(
                          "is a community of learners, including students, parents, and staff, dedicated to creating a rigorous and",
                          style: Get.theme.primaryTextTheme.bodySmall),
                      Text("VIRTUAL MODERN SCHOOL (VMS)",
                          style: Get.theme.primaryTextTheme.bodySmall),
                    ],
                  ),
                  Text(
                      " inclusive educational environment. VMS students are goal-oriented, critical thinkers, and community leaders ",
                      style: Get.theme.primaryTextTheme.bodySmall),
                  Text(
                    "committed to achieving high levels of integrity and academic success.",
                    style: Get.theme.primaryTextTheme.bodySmall,
                  ),
                  Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Image.asset(
                            "../../images/section5-image1.png",
                            height: 400,
                            width: 100,
                          ),
                          const SizedBox(
                            width: 50,
                          ),
                          Container(
                            width: 800,
                            height: 300,
                            padding:const EdgeInsets.only(top: 30),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(30),
                                color: const Color(0xffeaf0ff)),
                            child: Column(
                              children: [
                                Text(
                                    "VIRTUAL MODERN SCHOOL (VMS) staff aim to create a supportive",
                                    style:
                                        Get.theme.primaryTextTheme.bodySmall),
                                Text(
                                    "and challenging environment for all students to reach their potential,",
                                    style:
                                        Get.theme.primaryTextTheme.bodySmall),
                                Text(
                                    "engaging in continuous improvement through goal setting and",
                                    style:
                                        Get.theme.primaryTextTheme.bodySmall),
                                Text("reflection",
                                    style:
                                        Get.theme.primaryTextTheme.bodySmall),
                                const SizedBox(
                                  height: 20,
                                ),
                                Image.asset(
                                  "../../images/section5-image3.png",
                                  height: 100,
                                  width: 100,
                                ),
                                const SizedBox(
                                  height: 20,
                                ),
                                 Text("Virtual Modern School",
                                    style:
                                        Get.theme.primaryTextTheme.titleSmall!.copyWith(
                                          color: Colors.black
                                        ))
                              ],
                            ),
                          ),
                          const SizedBox(
                            width: 50,
                          ),
                          Image.asset(
                            "../../images/section5-image2.png",
                            height: 400,
                            width: 100,
                          ),
                        ],
                      ),
                      Image.asset(
                        "../../images/section5-image4.png",
                      ),
                    ],
                  ),
                ],
              )
            ],
          ),
        ],
      ),
    );
  }
}
