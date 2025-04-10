import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:get/get.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:vms_school/Link/API/AuthAPI/LoginAPI.dart';
import 'package:vms_school/Link/Controller/AuthController/UserController.dart';
import 'package:vms_school/Translate/local_controller.dart';
import 'package:vms_school/main.dart';
import 'package:vms_school/widgets/Responsive.dart';
import 'package:vms_school/widgets/TextFieldAuth.dart';
import 'package:vms_school/widgets/TextFieldPassword.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});
  TextEditingController username = TextEditingController();
  TextEditingController password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: const Color(0xfff9f8fd),
      body: ResponsiveUI(
        desktopScreen: SingleChildScrollView(
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                      padding: const EdgeInsets.only(top: 62.0),
                      child: Image.asset(
                        "assets/images/logo2.png",
                        width: 250,
                      )
                          .animate(onPlay: (controller) => controller.repeat())
                          .shimmer(
                              duration: const Duration(seconds: 4),
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
                            "assets/images/section5-image1.png",
                            width: w / 5.845,
                          )
                              .animate(
                                  onPlay: (controller) => controller.repeat())
                              .moveY(
                                begin: 1,
                                end: 30,
                                duration: const Duration(seconds: 2),
                                delay: const Duration(milliseconds: 1),
                              )
                              .then()
                              .moveY(
                                begin: 30,
                                end: 1,
                                duration: const Duration(seconds: 2),
                                delay: const Duration(milliseconds: 1),
                              )
                        ],
                      ),
                      Center(
                        child: Directionality(
                          textDirection: prefs!.getString(languageKey) == 'ar'
                              ? TextDirection.rtl
                              : TextDirection.ltr,
                          child: Form(
                            child: AutofillGroup(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceAround,
                                        children: [
                                          Text(
                                            "Username".tr,
                                            style:
                                                Get.theme.textTheme.bodyMedium!,
                                          ),
                                          Padding(
                                            padding:
                                                const EdgeInsets.only(top: 5.0),
                                            child: TextFieldAuth(
                                              autofill: const [
                                                AutofillHints.username
                                              ],
                                              controller: username,
                                              hinttext: "Username".tr,
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
                                              "Password".tr,
                                              style: Get
                                                  .theme.textTheme.bodyMedium!,
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  top: 5.0),
                                              child: TextFormPassword(
                                                  autofill: const [
                                                    AutofillHints.password
                                                  ],
                                                  controller: password,
                                                  hinttext: "Password".tr),
                                            ),
                                          ],
                                        )
                                      ],
                                    ),
                                  ),
                                ],
                              )
                                  .animate()
                                  .fadeIn(duration: const Duration(seconds: 1)),
                            ),
                          ),
                        ),
                      ),
                      Column(
                        children: [
                          Image.asset(
                            "assets/images/section5-image2.png",
                            width: w / 6.095,
                          )
                              .animate(
                                  onPlay: (controller) => controller.repeat())
                              .moveY(
                                begin: 30,
                                end: 1,
                                duration: const Duration(seconds: 2),
                                delay: const Duration(milliseconds: 1),
                              )
                              .then()
                              .moveY(
                                begin: 1,
                                end: 30,
                                duration: const Duration(seconds: 2),
                                delay: const Duration(milliseconds: 1),
                              )
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              GetBuilder<UserController>(builder: (controller) {
                return TextButton(
                        style: ButtonStyle(
                          shape: WidgetStatePropertyAll(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5),
                            ),
                          ),
                          backgroundColor:
                              WidgetStatePropertyAll(Get.theme.primaryColor),
                          maximumSize:
                              const WidgetStatePropertyAll(Size(200, 60)),
                          minimumSize:
                              const WidgetStatePropertyAll(Size(200, 60)),
                        ),
                        onPressed: () async {
                          if (controller.Isloading == false) {
                            await LoginAPI(context)
                                .login(username.text, password.text);
                          }
                        },
                        child: controller.Isloading == true
                            ? LoadingAnimationWidget.inkDrop(
                                color: Colors.white,
                                size: 25,
                              )
                            : Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Text(
                                    "Login".tr,
                                    style: Get.theme.textTheme.displayMedium!
                                        .copyWith(fontSize: 15),
                                  ),
                                  const Padding(
                                    padding:
                                        EdgeInsets.only(left: 8.0, right: 8.0),
                                    child: Icon(
                                      Icons.login,
                                      color: Colors.white,
                                      size: 17,
                                    ),
                                  ),
                                ],
                              ))
                    .animate()
                    .fadeIn(duration: const Duration(seconds: 1));
              })
            ],
          ),
        ),
        tabletScreen: SingleChildScrollView(
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                      padding: const EdgeInsets.only(top: 62.0),
                      child: Image.asset(
                        "assets/images/logo2.png",
                        width: 250,
                      )
                          .animate(onPlay: (controller) => controller.repeat())
                          .shimmer(
                              duration: const Duration(seconds: 4),
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
                            "assets/images/section5-image1.png",
                            width: w / 5.845,
                          )
                              .animate(
                                  onPlay: (controller) => controller.repeat())
                              .moveY(
                                begin: 1,
                                end: 30,
                                duration: const Duration(seconds: 2),
                                delay: const Duration(milliseconds: 1),
                              )
                              .then()
                              .moveY(
                                begin: 30,
                                end: 1,
                                duration: const Duration(seconds: 2),
                                delay: const Duration(milliseconds: 1),
                              )
                        ],
                      ),
                      Center(
                        child: Directionality(
                          textDirection: prefs!.getString(languageKey) == 'ar'
                              ? TextDirection.rtl
                              : TextDirection.ltr,
                          child: Form(
                            child: AutofillGroup(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceAround,
                                        children: [
                                          Text(
                                            "Username".tr,
                                            style:
                                                Get.theme.textTheme.bodyMedium!,
                                          ),
                                          Padding(
                                            padding:
                                                const EdgeInsets.only(top: 5.0),
                                            child: TextFieldAuth(
                                              autofill: const [
                                                AutofillHints.username
                                              ],
                                              controller: username,
                                              hinttext: "Username".tr,
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
                                              "Password".tr,
                                              style: Get
                                                  .theme.textTheme.bodyMedium!,
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  top: 5.0),
                                              child: TextFormPassword(
                                                  autofill: const [
                                                    AutofillHints.password
                                                  ],
                                                  controller: password,
                                                  hinttext: "Password".tr),
                                            ),
                                          ],
                                        )
                                      ],
                                    ),
                                  ),
                                ],
                              )
                                  .animate()
                                  .fadeIn(duration: const Duration(seconds: 1)),
                            ),
                          ),
                        ),
                      ),
                      Column(
                        children: [
                          Image.asset(
                            "assets/images/section5-image2.png",
                            width: w / 6.095,
                          )
                              .animate(
                                  onPlay: (controller) => controller.repeat())
                              .moveY(
                                begin: 30,
                                end: 1,
                                duration: const Duration(seconds: 2),
                                delay: const Duration(milliseconds: 1),
                              )
                              .then()
                              .moveY(
                                begin: 1,
                                end: 30,
                                duration: const Duration(seconds: 2),
                                delay: const Duration(milliseconds: 1),
                              )
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              GetBuilder<UserController>(builder: (controller) {
                return TextButton(
                        style: ButtonStyle(
                          shape: WidgetStatePropertyAll(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5),
                            ),
                          ),
                          backgroundColor:
                              WidgetStatePropertyAll(Get.theme.primaryColor),
                          maximumSize:
                              const WidgetStatePropertyAll(Size(200, 60)),
                          minimumSize:
                              const WidgetStatePropertyAll(Size(200, 60)),
                        ),
                        onPressed: () async {
                          if (controller.Isloading == false) {
                            await LoginAPI(context)
                                .login(username.text, password.text);
                          }
                        },
                        child: controller.Isloading == true
                            ? LoadingAnimationWidget.inkDrop(
                                color: Colors.white,
                                size: 25,
                              )
                            : Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Text(
                                    "Login".tr,
                                    style: Get.theme.textTheme.displayMedium!
                                        .copyWith(fontSize: 15),
                                  ),
                                  const Padding(
                                    padding:
                                        EdgeInsets.only(left: 8.0, right: 8.0),
                                    child: Icon(
                                      Icons.login,
                                      color: Colors.white,
                                      size: 17,
                                    ),
                                  ),
                                ],
                              ))
                    .animate()
                    .fadeIn(duration: const Duration(seconds: 1));
              })
            ],
          ),
        ),
        mobileScreen: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset(
                  "assets/images/logo2.png",
                  width: w / 2,
                ).animate(onPlay: (controller) => controller.repeat()).shimmer(
                    duration: const Duration(seconds: 4),
                    color: Colors.white.withOpacity(0.8)),
                Padding(
                  padding: const EdgeInsets.only(top: 50),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Directionality(
                        textDirection: prefs!.getString(languageKey) == 'ar'
                            ? TextDirection.rtl
                            : TextDirection.ltr,
                        child: Form(
                          child: AutofillGroup(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Row(
                                  children: [
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceAround,
                                      children: [
                                        Text(
                                          "Username".tr,
                                          style: Get.theme.textTheme.bodyMedium!
                                              .copyWith(fontSize: 12),
                                        ),
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(top: 5.0),
                                          child: TextFieldAuth(
                                            width: w - 60,
                                            hight: 40,
                                            autofill: const [
                                              AutofillHints.username
                                            ],
                                            controller: username,
                                            hinttext: "Username".tr,
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
                                            "Password".tr,
                                            style: Get
                                                .theme.textTheme.bodyMedium!
                                                .copyWith(fontSize: 12),
                                          ),
                                          Padding(
                                            padding:
                                                const EdgeInsets.only(top: 5.0),
                                            child: TextFormPassword(
                                                width: w - 60,
                                                hight: 40,
                                                autofill: const [
                                                  AutofillHints.password
                                                ],
                                                controller: password,
                                                hinttext: "Password".tr),
                                          ),
                                        ],
                                      )
                                    ],
                                  ),
                                ),
                              ],
                            )
                                .animate()
                                .fadeIn(duration: const Duration(seconds: 1)),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 45.0),
                  child: GetBuilder<UserController>(builder: (controller) {
                    return TextButton(
                            style: ButtonStyle(
                              shape: WidgetStatePropertyAll(
                                RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(5),
                                ),
                              ),
                              backgroundColor: WidgetStatePropertyAll(
                                  Get.theme.primaryColor),
                              maximumSize:
                                  WidgetStatePropertyAll(Size((w - 80), 40)),
                              minimumSize:
                                  WidgetStatePropertyAll(Size((w - 80), 40)),
                            ),
                            onPressed: () async {
                              if (controller.Isloading == false) {
                                await LoginAPI(context)
                                    .login(username.text, password.text);
                              }
                            },
                            child: controller.Isloading == true
                                ? LoadingAnimationWidget.inkDrop(
                                    color: Colors.white,
                                    size: 16,
                                  )
                                : Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Text(
                                        "Login".tr,
                                        style: Get
                                            .theme.textTheme.displayMedium!
                                            .copyWith(fontSize: 12),
                                      ),
                                      const Padding(
                                        padding: EdgeInsets.only(
                                            left: 8.0, right: 8.0),
                                        child: Icon(
                                          Icons.login,
                                          color: Colors.white,
                                          size: 13,
                                        ),
                                      ),
                                    ],
                                  ))
                        .animate()
                        .fadeIn(duration: const Duration(seconds: 1));
                  }),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
