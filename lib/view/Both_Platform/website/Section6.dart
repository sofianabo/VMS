// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vms_school/view/Both_Platform/widgets/Responsive.dart';

class Section6 extends StatelessWidget {
  const Section6({super.key});

  @override
  Widget build(BuildContext context) {
    double h = 640;
    double w = MediaQuery.of(context).size.width;
    return Container(
      margin: EdgeInsets.only(top: h / 17.1),
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.only(bottom: h / 34.2),
            child: Text("What Do We Do".tr,
                style: Get.theme.textTheme.titleMedium!.copyWith()),
          ),
          ResponsiveUI(
            desktopScreen: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Column(
                  children: [
                    Text(
                        "We develop a culture of excellence that includes a robust instructional program aligned to the"
                            .tr,
                        style: Get.theme.textTheme.bodyMedium!),
                    Text(
                        "highest standards with a focus on implementing balanced literacy through reading and writing"
                            .tr,
                        style: Get.theme.textTheme.bodyMedium!),
                    Text(
                        "workshops, while cultivating competency across all subject areas."
                            .tr,
                        style: Get.theme.textTheme.bodyMedium!),
                    SizedBox(
                      height: h / 34.2,
                    ),
                    Container(
                      width: w / 1.7066,
                      height: h / 2.28,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(100),
                      ),
                      child: Image.asset(
                        "assets/images/section6-image1.jpg",
                        fit: BoxFit.cover,
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.only(top: h / 38, bottom: h / 68.4),
                      width: w / 1.7066,
                      child: Column(
                        children: [
                          Text(
                              textAlign: TextAlign.center,
                              "We are committed to developing well-rounded students who embody our core values: Be Safe, Be Respectful, Be Responsible, and Be Mindful. Our vibrant learning environment encourages discovery and creative expression, making every student feel valued.\n\nWe provide our educators with robust professional development to enhance teaching practices and boost student success. Through collaboration and a community schools model, we align resources to ensure every student thrives. Join us in our journey towards excellence!"
                                  .tr,
                              style: Get.theme.textTheme.bodyMedium!),
                        ],
                      ),
                    ),
                  ],
                )
              ],
            ),
            tabletScreen: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Column(
                  children: [
                    Text(
                        "We develop a culture of excellence that includes a robust instructional program aligned to the"
                            .tr,
                        style: Get.theme.textTheme.bodyMedium!),
                    Text(
                        "highest standards with a focus on implementing balanced literacy through reading and writing"
                            .tr,
                        style: Get.theme.textTheme.bodyMedium!),
                    Text(
                        "workshops, while cultivating competency across all subject areas."
                            .tr,
                        style: Get.theme.textTheme.bodyMedium!),
                    SizedBox(
                      height: h / 34.2,
                    ),
                    Container(
                      width: w / 1.7066,
                      height: h / 2.28,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(100),
                      ),
                      child: Image.asset(
                        "assets/images/section6-image1.jpg",
                        fit: BoxFit.cover,
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.only(top: h / 38, bottom: h / 68.4),
                      width: w / 1.7066,
                      child: Column(
                        children: [
                          Text(
                              textAlign: TextAlign.center,
                              "We are committed to developing well-rounded students who embody our core values: Be Safe, Be Respectful, Be Responsible, and Be Mindful. Our vibrant learning environment encourages discovery and creative expression, making every student feel valued.\n\nWe provide our educators with robust professional development to enhance teaching practices and boost student success. Through collaboration and a community schools model, we align resources to ensure every student thrives. Join us in our journey towards excellence!"
                                  .tr,
                              style: Get.theme.textTheme.bodyMedium!),
                        ],
                      ),
                    ),
                  ],
                )
              ],
            ),
            mobileScreen: Column(
              children: [
                Column(
                  spacing: 10.0,
                  children: [
                    Text(
                        textAlign: TextAlign.center,
                        "We develop a culture of excellence that includes a robust instructional program aligned to the"
                            .tr,
                        style: Get.theme.textTheme.bodyMedium!
                            .copyWith(fontSize: 13.0)),
                    Text(
                        textAlign: TextAlign.center,
                        "highest standards with a focus on implementing balanced literacy through reading and writing"
                            .tr,
                        style: Get.theme.textTheme.bodyMedium!
                            .copyWith(fontSize: 13.0)),
                    Text(
                        textAlign: TextAlign.center,
                        "workshops, while cultivating competency across all subject areas."
                            .tr,
                        style: Get.theme.textTheme.bodyMedium!
                            .copyWith(fontSize: 13.0)),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 15.0),
                  child: Container(
                    width: w - 40,
                    height: 300,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(100),
                    ),
                    child: Image.asset(
                      "assets/images/section6-image1.jpg",
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(top: 20.0, bottom: 20.0),
                  width: w - 40,
                  child: Column(
                    children: [
                      Text(
                          textAlign: TextAlign.center,
                          "We are committed to developing well-rounded students who embody our core values: Be Safe, Be Respectful, Be Responsible, and Be Mindful. Our vibrant learning environment encourages discovery and creative expression, making every student feel valued.\n\nWe provide our educators with robust professional development to enhance teaching practices and boost student success. Through collaboration and a community schools model, we align resources to ensure every student thrives. Join us in our journey towards excellence!"
                              .tr,
                          style: Get.theme.textTheme.bodyMedium!),
                    ],
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
