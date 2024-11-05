// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Section2 extends StatelessWidget {
  const Section2({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 100),
      child: Column(
        children: [
          Text("Who Can We Register At Virtual Modern School",
              style: Get.theme.primaryTextTheme.titleLarge),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Column(
                children: [
                  Row(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text(
                              "Anyone who resides outside Syria desires to learn the Syrian Educational Curriculums from Elementary",
                              style: Get.theme.primaryTextTheme.bodySmall),
                          Text(
                              "to Middle and High schools can enroll and graduate to be awarded the High school Diploma granted",
                              style: Get.theme.primaryTextTheme.bodySmall),
                          Text(
                              "by the Ministry of Education at Syrian Arab Republic",
                              style: Get.theme.primaryTextTheme.bodySmall),
                        ],
                      ),
                      const SizedBox(
                        width: 20,
                      ),
                      Container(
                        height: 30,
                        width: 30,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(1000),
                            color: const Color(0xff47ccaa)),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text(
                              "People with special needs who are residing in Syria are uncapable to study in regular schools uncapable",
                              style: Get.theme.primaryTextTheme.bodySmall),
                          Text(
                              "to study uncapable to study in regular schools and exceptional students cases determined by the",
                              style: Get.theme.primaryTextTheme.bodySmall),
                          Text(
                              "Ministry of Education at Syrian Arab Diploma granted by the Ministry of Education at Syrian Arab",
                              style: Get.theme.primaryTextTheme.bodySmall),
                          Text("Republic",
                              style: Get.theme.primaryTextTheme.bodySmall),
                        ],
                      ),
                      const SizedBox(
                        width: 20,
                      ),
                      Container(
                        height: 30,
                        width: 30,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(1000),
                            color: const Color(0xff946ffb)),
                      ),
                    ],
                  )
                ],
              ),
              Image.asset(
                "../../images/section2-image1.png",
                height: 450,
                width: 500,
              )
            ],
          ),
        ],
      ),
    );
  }
}
