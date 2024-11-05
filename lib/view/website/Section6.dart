// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Section6 extends StatelessWidget {
  const Section6({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: Get.width,
      margin:const EdgeInsets.only(top: 100),
      child: Column(
        children: [
          Text("What Do We", style: Get.theme.primaryTextTheme.titleLarge),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Column(
                children: [
                  Text(
                      "We develop a culture of excellence that includes a robust instructional program aligned to the",
                      style: Get.theme.primaryTextTheme.bodyMedium),
                  Text(
                      "highest standards with a focus on implementing balanced literacy through reading and writing",
                      style: Get.theme.primaryTextTheme.bodyMedium),
                  Text(
                      "workshops, while cultivating competency across all subject areas.",
                      style: Get.theme.primaryTextTheme.bodyMedium),
             const     SizedBox(
                    height: 30,
                  ),
                  Container(
                    width: 750,
                    height: 300,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(100),
                    ),
                    child: Image.asset(
                      "../../images/section6-image1.jpg",
                      fit: BoxFit.cover,
                    ),
                  ),
                  Text(
                      "We are committed to developing well-rounded students who embody our core values: Be Safe, Be",
                      style: Get.theme.primaryTextTheme.bodyMedium),
                  Text(
                      "Respectful, Be Responsible, and Be Mindful. Our vibrant learning environment encourages discovery",
                      style: Get.theme.primaryTextTheme.bodyMedium),
                  Text(
                      "and creative expression, making every student feel valued.",
                      style: Get.theme.primaryTextTheme.bodyMedium),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                      "We provide our educators with robust professional development to enhance teaching practices and",
                      style: Get.theme.primaryTextTheme.bodyMedium),
                  Text(
                      "boost student success. Through collaboration and a community schools model, we align resources to",
                      style: Get.theme.primaryTextTheme.bodyMedium),
                  Text(
                      "ensure every student thrives. Join us in our journey towards excellence!",
                      style: Get.theme.primaryTextTheme.bodyMedium),
                ],
              )
            ],
          ),
        ],
      ),
    );
  }
}
