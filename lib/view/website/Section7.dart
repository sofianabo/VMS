import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Section7 extends StatelessWidget {
  const Section7({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 500,
      color: Get.theme.primaryColor,
      margin: const EdgeInsets.only(top: 100),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Column(
                children: [
                  SizedBox(
                    height: 100,
                    width: 100,
                    child: Image.asset("../../images/section5-image3.png"),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text("Virtual Modern School",
                      style: Get.theme.primaryTextTheme.labelMedium),
                ],
              )
            ],
          ),
          const SizedBox(
            height: 70,
          ),
          Container(
            margin:const EdgeInsets.only(left: 150, right: 150),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    Text("Openning Hours",
                        style: Get.theme.primaryTextTheme.bodyMedium),
                    const SizedBox(
                      height: 8,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Row(
                          children: [
                            Text("8 AM -----> 1 PM",
                                style: Get.theme.primaryTextTheme.bodyMedium),
                            const SizedBox(
                              width: 5,
                            ),
                            Image.asset(
                              "../../images/time-icon.png",
                              height: 20,
                              width: 20,
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 3,
                        ),
                        Row(
                          children: [
                            Text("3 PM -----> 8 PM",
                                style: Get.theme.primaryTextTheme.bodyMedium),
                            const SizedBox(
                              width: 5,
                            ),
                            Image.asset(
                              "../../images/time-icon.png",
                              height: 20,
                              width: 20,
                            ),
                          ],
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        Image.asset(
                          "../../images/youtube-icon.png",
                          width: 40,
                          height: 40,
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                        Image.asset(
                          "../../images/facebook-icon.png",
                          width: 40,
                          height: 40,
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                        Image.asset(
                          "../../images/linkedin-icon.png",
                          width: 40,
                          height: 40,
                        ),
                      ],
                    ),
                  ],
                ),
                Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("Contact Details",
                            style: Get.theme.primaryTextTheme.bodyMedium),
                      ],
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Row(
                          children: [
                            Text("SYR:00963 994 005157",
                                style: Get.theme.primaryTextTheme.bodyMedium),
                            const SizedBox(
                              width: 8,
                            ),
                            Image.asset(
                              "../../images/call-icon.png",
                              height: 40,
                              width: 40,
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Row(
                          children: [
                            Text("USA:001 817 583 0666",
                                style: Get.theme.primaryTextTheme.bodyMedium),
                            const SizedBox(
                              width: 8,
                            ),
                            Image.asset(
                              "../../images/call-icon.png",
                              height: 40,
                              width: 40,
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Row(
                          children: [
                            Text("virtualmodernschoolmedia@gmail.com",
                                style: Get.theme.primaryTextTheme.bodyMedium),
                            const SizedBox(
                              width: 8,
                            ),
                            Container(
                                width: 30,
                                height: 30,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(200),
                                    color: Colors.white),
                                child:
                                    Image.asset("../../images/email-icon.png")),
                          ],
                        ),
                      ],
                    )
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                  "Shakib Arslan Street - Engineers Syndicate Building - 2nd Floor - AlSuwaidaa - Syria",
                  style: Get.theme.primaryTextTheme.bodyMedium),
              const SizedBox(
                width: 15,
              ),
              Image.asset("../../images/location-icon.png"),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("VMS . Powered by FSL Team",
                  style: Get.theme.primaryTextTheme.bodyMedium),
              const SizedBox(
                width: 3,
              ),
              Image.asset("../../images/c-icon.png"),
              const SizedBox(
                width: 3,
              ),
               Text("All Rights reserved. Copyright",
                  style: Get.theme.primaryTextTheme.bodyMedium),
            ],
          ),
        ],
      ),
    );
  }
}
