// ignore_for_file: file_names, must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:get/get.dart';
import 'package:getx/Link/API/AuthAPI/LoginAPI.dart';
import 'package:getx/Theme/themeController.dart';
import 'package:getx/main.dart';
import 'package:getx/view/Admin/AdminHome.dart';
import 'package:getx/widgets/AuthButton.dart';
import 'package:getx/widgets/TextFieldAuth.dart';
import 'package:getx/widgets/TextFieldPassword.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});
  TextEditingController username = TextEditingController();
  TextEditingController password = TextEditingController();
  themeController th = Get.find();

  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Color(0xfff9f8fd),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                    padding: const EdgeInsets.only(top: 62.0),
                    child: Image.asset(
                      "../../images/logo2.png",
                      width: 250,
                    )
                        .animate(onPlay: (controller) => controller.repeat())
                        .shimmer(
                            duration: Duration(seconds: 4),
                            color: Colors.white.withOpacity(0.8))),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(top: 0),
              child: SizedBox(
                width: w / 1.1,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      children: [
                        Image.asset(
                          "../../images/section5-image2.png",
                          width: w / 6.095,
                        )
                            .animate(
                                onPlay: (controller) => controller.repeat())
                            .moveY(
                              begin: 1,
                              end: 30,
                              duration: Duration(seconds: 2),
                              delay: Duration(milliseconds: 1),
                            )
                            .then()
                            .moveY(
                              begin: 30,
                              end: 1,
                              duration: Duration(seconds: 2),
                              delay: Duration(milliseconds: 1),
                            )
                      ],
                    ),
                    Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  Text(
                                    "Username",
                                    style:
                                        Get.theme.primaryTextTheme.labelSmall,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(top: 5.0),
                                    child: TextFieldAuth(
                                      controller: username,
                                      hinttext: "Username",
                                    ),
                                  )
                                ],
                              )
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 25.0),
                            child: Row(
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    Text(
                                      "Password",
                                      style:
                                          Get.theme.primaryTextTheme.labelSmall,
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(top: 5.0),
                                      child: TextFormPassword(
                                          controller: password,
                                          hinttext: "Password"),
                                    ),
                                  ],
                                )
                              ],
                            ),
                          ),
                        ],
                      ).animate().fadeIn(duration: Duration(seconds: 1)),
                    ),
                    Column(
                      children: [
                        Image.asset(
                          "../../images/section5-image1.png",
                          width: w / 5.845,
                        )
                            .animate(
                                onPlay: (controller) => controller.repeat())
                            .moveY(
                              begin: 30,
                              end: 1,
                              duration: Duration(seconds: 2),
                              delay: Duration(milliseconds: 1),
                            )
                            .then()
                            .moveY(
                              begin: 1,
                              end: 30,
                              duration: Duration(seconds: 2),
                              delay: Duration(milliseconds: 1),
                            )
                      ],
                    ),
                  ],
                ),
              ),
            ),
            ButtonAuth(
              onpressed: () async {
                Username!.setString("username", username.text);
                Password!.setString("pass", password.text);
                if (Get.isDarkMode) {
                  mode!.setBool("mode", true);
                  th.changebool();
                  await LoginAPI(context).login(username.text, password.text);
                  Get.to(
                    () => AdminHome(),
                  );
                } else {
                  th.changebool();
                  await LoginAPI(context).login(username.text, password.text);
                  Get.to(
                    () => AdminHome(),
                  );
                }
              },
              text: "Login",
            ).animate().fadeIn(duration: Duration(seconds: 1))
          ],
        ),
      ),
    );
  }
}
