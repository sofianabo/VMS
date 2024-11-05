// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx/Bindings/PasswordBinding.dart';
import 'package:getx/view/Auth/LoginScreen.dart';

class Section1 extends StatelessWidget {
  const Section1({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: Get.width,
      child: Row(children: [
        Stack(
          children: [
            Image.asset(
              "../../images/Home-Background.png",
              fit: BoxFit.cover,
              height: 500,
              width: 1300,
            ),
            SizedBox(
              width: Get.width,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Image.asset(
                    "../../images/Home-Background2.png",
                    width: 450,
                    height: 450,
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 50),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text("Take Your Learning",
                            style: Get.theme.primaryTextTheme.labelLarge),
                        Text("To The Next Level",
                            style: Get.theme.primaryTextTheme.labelLarge),
                        const SizedBox(
                          height: 25,
                        ),
                        Text("Virtual Modern School",
                            style: Get.theme.primaryTextTheme.labelMedium),
                        const SizedBox(
                          height: 30,
                        ),
                        Container(
                          decoration: BoxDecoration(
                              border: Border.all(
                                color: const Color(0xff19478d),
                                width: 1.0,
                              ),
                              borderRadius: BorderRadius.circular(20)),
                          height: 70,
                          width: 300,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              GestureDetector(
                                child: Container(
                                  width: 158,
                                  decoration: const BoxDecoration(
                                      color: Color(0xff19478d),
                                      borderRadius: BorderRadius.only(
                                          topRight: Radius.circular(20),
                                          bottomRight: Radius.circular(20))),
                                  alignment: Alignment.center,
                                  child: Text('Enroll',
                                      style: Get.theme.primaryTextTheme
                                          .headlineSmall),
                                ),
                                onTap: () {
                                  // Get.to(() => Registration());
                                },
                              ),
                              GestureDetector(
                                child: Container(
                                  width: 140,
                                  alignment: Alignment.center,
                                  child: Text('Sign In',
                                      style: Get
                                          .theme.primaryTextTheme.titleSmall),
                                ),
                                onTap: () {
                                  Get.to(() => LoginScreen(),
                                      binding: PasswordBinding());
                                },
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 200,
                          width: 300,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Container(
                                height: 120,
                                width: 90,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    border: Border.all(
                                      color: Colors.grey,
                                      width: 2.0,
                                    )),
                                child: Column(
                                  children: [
                                    Container(
                                      padding: const EdgeInsets.only(top: 10),
                                      height: 40,
                                      width: 40,
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(100)),
                                      child: Image.asset(
                                          "../../images/avatar1.png"),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(top: 8.0),
                                      child: Text("10 M",
                                          style: Get.theme.primaryTextTheme
                                              .bodySmall),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(top: 8.0),
                                      child: Text(
                                        "Teachers",
                                        style: Get
                                            .theme.primaryTextTheme.bodySmall,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                height: 120,
                                width: 90,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    border: Border.all(
                                      color: Colors.grey,
                                      width: 2.0,
                                    )),
                                child: Column(
                                  children: [
                                    Container(
                                      padding: const EdgeInsets.only(top: 10),
                                      height: 40,
                                      width: 40,
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(100)),
                                      child: Image.asset(
                                          "../../images/avatar2.png"),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(top: 8.0),
                                      child: Text("10 M",
                                          style: Get.theme.primaryTextTheme
                                              .bodySmall),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(top: 8.0),
                                      child: Text("Students",
                                          style: Get.theme.primaryTextTheme
                                              .bodySmall),
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                height: 120,
                                width: 90,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    border: Border.all(
                                      color: Colors.grey,
                                      width: 2.0,
                                    )),
                                child: Column(
                                  children: [
                                    Container(
                                      padding: const EdgeInsets.only(top: 10),
                                      height: 40,
                                      width: 40,
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(100)),
                                      child: Image.asset(
                                          "../../images/avatar3.png"),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(top: 8.0),
                                      child: Text("10 M",
                                          style: Get.theme.primaryTextTheme
                                              .bodySmall),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(top: 8.0),
                                      child: Text("Visitors",
                                          style: Get.theme.primaryTextTheme
                                              .bodySmall),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ]),
    );
  }
}
