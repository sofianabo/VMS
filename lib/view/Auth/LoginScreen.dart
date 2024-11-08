// ignore_for_file: file_names, must_be_immutable

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx/Bindings/AdminContentBinding.dart';
import 'package:getx/Theme/themeController.dart';
import 'package:getx/view/Admin/AdminHome.dart';
import 'package:getx/widgets/AuthButton.dart';
import 'package:getx/widgets/TextFieldAuth.dart';
import 'package:getx/widgets/TextFormSearch.dart';
import 'package:getx/widgets/TextFieldPassword.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});
  TextEditingController username = TextEditingController();
  TextEditingController password = TextEditingController();
  themeController th = Get.find();

  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;
    print(h);
    print(w);
    return Scaffold(
      backgroundColor: Color(0xfff9f8fd),
      body: Container(
        color: Color(0xfff9f8fd),
        width: w,
        height: h,
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 62.0),
                  child: Image.asset(
                    "../../images/logo2.png",
                    height: h / 6.84,
                    width: w / 3.42,
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(top: 35),
              child: Container(
                height: h / 1.8,
                width: w / 1.1,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      children: [
                        Image.asset(
                          "../../images/section5-image2.png",
                          height: h / 1.9,
                          width: w / 6.095,
                        )
                      ],
                    ),
                    Center(
                      child: Container(
                        height: h / 2.886,
                        width: w / 2.509,
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
                                      "UserName",
                                      style:
                                          Get.theme.primaryTextTheme.labelSmall,
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(top: 5.0),
                                      child: TextFieldAuth(
                                        controller: username,
                                        hinttext: "UserName",
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
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    children: [
                                      Text(
                                        "Password",
                                        style: Get
                                            .theme.primaryTextTheme.labelSmall,
                                      ),
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(top: 5.0),
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
                        ),
                      ),
                    ),
                    Column(
                      children: [
                        Image.asset(
                          "../../images/section5-image1.png",
                          width: w / 5.845,
                          height: h / 1.814,
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ),
            ButtonAuth(
              onpressed: () {
                Get.to(() => AdminHome(), binding: AdminContentBinding());
              },
              text: "Login",
            )
          ],
        ),
      ),
    );
  }
}

  // Username!.setString(
                                          //     "username", username.text);
                                          // Password!.setString(
                                          //     "pass", password.text);
                                          // print("object");
                                          // if (Get.isDarkMode) {
                                          //   mode!.setBool("mode", true);
                                          //   th.changebool();
                                          //   await LoginAPI(context).login(
                                          //       username.text, password.text);
                                          //   await Get.to(() => AdminHome(),
                                          //       binding: UserBiniding());
                                          // } else {
                                          //   th.changebool();
                                          //   await LoginAPI(context).login(
                                          //       username.text, password.text);
                                          //   await Get.to(() => AdminHome(),
                                          //       binding: UserBiniding());
                                          // }
