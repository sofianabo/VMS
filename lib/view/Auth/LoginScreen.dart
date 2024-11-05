// ignore_for_file: file_names, must_be_immutable

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx/Bindings/AdminContentBinding.dart';
import 'package:getx/Theme/themeController.dart';
import 'package:getx/view/Admin/AdminHome.dart';
import 'package:getx/widgets/TextFormSearch.dart';
import 'package:getx/widgets/TextFieldPassword.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});
  TextEditingController username = TextEditingController();
  TextEditingController password = TextEditingController();
  themeController th = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: Get.width,
        height: Get.height,
        margin: const EdgeInsets.only(top: 30),
        child: Stack(
          children: [
            Image.asset("../../images/Home-Background.png"),
            Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset("../../images/logo2.png"),
                  ],
                ),
                const SizedBox(
                  height: 50,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Column(
                      children: [
                        Image.asset("../../images/section5-image2.png")
                      ],
                    ),
                    Stack(
                      children: [
                        Opacity(
                          opacity: 0.4,
                          child: Center(
                            child: Container(
                              width: 500,
                              height: 400,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color: Colors.white54,
                                boxShadow: [
                                  BoxShadow(
                                      color: Get.theme.primaryColor,
                                      offset: const Offset(15, 15),
                                      blurRadius: 20,
                                      spreadRadius: 10),
                                ],
                              ),
                            ),
                          ),
                        ),
                        Center(
                          child: SizedBox(
                            width: 500,
                            height: 400,
                            child: Padding(
                              padding: const EdgeInsets.only(
                                  left: 25, right: 25, top: 20),
                              child: Center(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    TextFormSearch(
                                      controller: username,
                                      suffixIcon: Icons.account_box,
                                    ),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    Center(
                                      child: TextFormPassword(
                                          controller: password,
                                          maxlength: 10,
                                          labeltext: "Password".tr,
                                          activeLabel: Get.theme.primaryColor,
                                          colorlabel:
                                              Get.theme.colorScheme.secondary,
                                          prifexIcon: Icons.lock,
                                          prifexColor: Get.theme.primaryColor,
                                          focasBorder: Get.theme.primaryColor),
                                    ),
                                    const SizedBox(
                                      height: 50,
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        GestureDetector(
                                          onTap: () async {
                                            Get.to(() => AdminHome(),
                                                binding: AdminContentBinding());
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
                                          },
                                          child: Container(
                                            height: 50,
                                            width: 200,
                                            decoration: BoxDecoration(
                                                border: Border.all(
                                                    color: const Color(
                                                        0xff19478d)),
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                                color: const Color(0xff19478d)),
                                            child: Center(
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  const Icon(
                                                    Icons.login,
                                                    color: Colors.white,
                                                  ),
                                                  const SizedBox(
                                                    width: 10,
                                                  ),
                                                  Text(
                                                    "Login ",
                                                    style: Get
                                                        .theme
                                                        .primaryTextTheme
                                                        .headlineSmall,
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        Image.asset("../../images/section5-image1.png")
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
