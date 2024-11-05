// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Section3 extends StatelessWidget {
  const Section3({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 100),
      child: Column(
        children: [
          Text("How I Can Enroll At Virtual Modern School",
    style: Get.theme.primaryTextTheme.titleLarge!.copyWith(
    fontSize: 24,
    )),
    Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Image.asset(
                "../../images/section3-image1.jpg",
                height: 600,
                width: 600,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Directionality(
                    textDirection: TextDirection.rtl,
                    child: Text(
                        "Parents of our students can register their children in the Virtual Modern School ",
                        style: Get.theme.primaryTextTheme.bodyMedium),
                  ),
                  Directionality(
                    textDirection: TextDirection.ltr,
                    child: Text(" by the following steps:",
                        style: Get.theme.primaryTextTheme.bodyMedium),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Directionality(
                    textDirection: TextDirection.ltr,
                    child: Text("1. Enter the first and last name of the guardian",
                        style: Get.theme.primaryTextTheme.bodySmall),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Directionality(
                    textDirection: TextDirection.ltr,
                    child: Text("2. Enter the guardian's mobile phone number",
                        style: Get.theme.primaryTextTheme.bodySmall),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Directionality(
                    textDirection: TextDirection.ltr,
                    child: Text("3. Enter the Syrian national number of the guardian",
                        style: Get.theme.primaryTextTheme.bodySmall),
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  Container(
                    height: 50,
                    width: 130,
                    decoration: BoxDecoration(
                        border: Border.all(color: const Color(0xff19478d)),
                        borderRadius: BorderRadius.circular(10),
                        color: Get.theme.primaryColor),
                    child: Center(
                      child: Text("Read More",
                          style: Get.theme.primaryTextTheme.headlineSmall),
                    ),
                  )
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
