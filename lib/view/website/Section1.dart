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
                        Text("We CARE ABOUT \n YOUR FUTURE",
                            textAlign: TextAlign.left,
                            style: Get.theme.primaryTextTheme.labelLarge),
                        Container(
                          padding: EdgeInsets.only(top: 10.0),
                          width: 400,
                          child: Text("Join us to enter a better world filled with advanced educational methods through Virtual Modern School",
                              style: Get.theme.primaryTextTheme.labelLarge!.copyWith(fontSize: 14),
                          textAlign: TextAlign.left,
                          ),
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        Container(
                          decoration: BoxDecoration(
                              border: Border.all(
                                color: const Color(0xff19478d),
                                width: 1.0,
                              ),
                              borderRadius: BorderRadius.circular(12)),
                          height: 50,
                          width: 350,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              GestureDetector(
                                child: Container(
                                  width: 188,
                                  decoration: const BoxDecoration(
                                      color: Color(0xff19478d),
                                      borderRadius: BorderRadius.only(
                                          topRight: Radius.circular(11),
                                          bottomRight: Radius.circular(11))),
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
                                  width: 160,
                                  height: 50,
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
                          width: 350,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Container(
                                height: 120,
                                width: 100,
                                decoration: BoxDecoration(
                                    color: Color(0xffFFFDFB),
                                    borderRadius: BorderRadius.circular(21),
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
                                              .bodySmall!.copyWith(
                                              fontSize: 16,
                                            color: Get.theme.primaryColor
                                          )),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(top: 8.0),
                                      child: Text(
                                        "Teachers",
                                        style: Get
                                            .theme.primaryTextTheme.bodySmall!.copyWith(
                                          fontSize: 14,
                                          color: Get.theme.primaryColor),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                padding: EdgeInsets.only(left: 10,right: 10),
                                height: 120,
                                width: 100,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(21),
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
                                              .bodySmall!.copyWith(
                                              fontSize: 16,
                                              color: Get.theme.primaryColor)),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(top: 8.0),
                                      child: Text("Students",
                                          style: Get.theme.primaryTextTheme
                                              .bodySmall!.copyWith(
                                              fontSize: 14,
                                              color: Get.theme.primaryColor)),
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                height: 120,
                                width: 100,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(21),
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
                                              .bodySmall!.copyWith(
                                              fontSize: 16,
                                              color: Get.theme.primaryColor)),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(top: 8.0),
                                      child: Text("Visitors",
                                          style: Get.theme.primaryTextTheme
                                               .bodySmall!.copyWith(
                                              fontSize: 14,
                                              color: Get.theme.primaryColor)),
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
