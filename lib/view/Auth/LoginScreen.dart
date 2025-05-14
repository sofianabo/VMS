import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_svg/flutter_svg.dart';
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
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: const Color(0xfff9f8fd),
      body: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        mainAxisSize: MainAxisSize.max,
        children: [
          if (width >= 883)
            Container(
              height: height,
              width: width * 0.4,
              child: Opacity(
                opacity: 1, // 25% opacity
                child: Image.asset(
                  "assets/images/Enroll_Images/5.jpg",
                  fit: BoxFit.cover,
                ),
              ),
            ).animate(onPlay: (controller) => controller.repeat()).shimmer(
                angle: 1,
                color: Colors.white.withOpacity(0.4),
                duration: const Duration(seconds: 5),
                delay: const Duration(seconds: 1)),
          GetBuilder<UserController>(builder: (controller) {
            return Expanded(
              child: Padding(
                padding: const EdgeInsets.all(32.0),
                child: SingleChildScrollView(
                  child: Column(
                    spacing: 20.0,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SvgPicture.asset(
                        "assets/images/logolight.svg",
                        width: 310,
                      )
                          .animate(onPlay: (controller) => controller.repeat())
                          .shimmer(
                              angle: 1,
                              color: Colors.white.withOpacity(0.4),
                              duration: const Duration(seconds: 5),
                              delay: const Duration(seconds: 1)),
                      Padding(
                        padding: const EdgeInsets.only(top: 100.0, bottom: 30),
                        child: Form(
                          child: AutofillGroup(
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              spacing: 10.0,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                TextFieldAuth(
                                  width:
                                      width >= 883 ? width * 0.5 : width - 80,
                                  onChanged: (value) {
                                    if (value.isNotEmpty) {
                                      controller.updateFieldError(
                                          "username", false);
                                    }
                                  },
                                  isError: controller.IsusernameError,
                                  Uptext: "Username".tr,
                                  autofill: const [AutofillHints.username],
                                  controller: username,
                                  hinttext: "Username".tr,
                                ),
                                TextFormPassword(
                                    width:
                                        width >= 883 ? width * 0.5 : width - 80,
                                    onChanged: (value) {
                                      if (value.isNotEmpty) {
                                        controller.updateFieldError(
                                            "password", false);
                                      }
                                    },
                                    isError: controller.IsPasswordError,
                                    Uptext: "Password".tr,
                                    autofill: const [AutofillHints.password],
                                    controller: password,
                                    hinttext: "Password".tr),
                              ],
                            )
                                .animate()
                                .fadeIn(duration: const Duration(seconds: 1)),
                          ),
                        ),
                      ),
                      Column(
                        spacing: 15.0,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          TextButton(
                                  style: ButtonStyle(
                                    shape: WidgetStatePropertyAll(
                                      RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(5),
                                      ),
                                    ),
                                    backgroundColor: WidgetStatePropertyAll(
                                        const Color(0xff19478d)),
                                    maximumSize: const WidgetStatePropertyAll(
                                        Size(250, 50)),
                                    minimumSize: const WidgetStatePropertyAll(
                                        Size(250, 50)),
                                  ),
                                  onPressed: () async {
                                    if (controller.Isloading == false) {
                                      bool isUsernameEmpty =
                                          username.text.trim().isEmpty;

                                      bool isPasswordEmpty =
                                          password.text.trim().isEmpty;

                                      controller.updateFieldError(
                                          "username", isUsernameEmpty);

                                      controller.updateFieldError(
                                          "password", isPasswordEmpty);

                                      // إذا لم يكن هناك أي أخطاء، قم بإضافة ولي الأمر
                                      if (!(isUsernameEmpty ||
                                          isPasswordEmpty)) {
                                        await LoginAPI(context).login(
                                            username.text, password.text);
                                      }
                                    }
                                  },
                                  child: controller.Isloading == true
                                      ? LoadingAnimationWidget.inkDrop(
                                          color: Colors.white,
                                          size: 25,
                                        )
                                      : Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            Text(
                                              "Login".tr,
                                              style: Get.theme.textTheme
                                                  .displayMedium!
                                                  .copyWith(
                                                      color: Colors.white,
                                                      fontSize: 12),
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
                              .fadeIn(duration: const Duration(seconds: 1)),
                          Row(
                            spacing: 10.0,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "You Don`t Have Account ?".tr,
                                style: TextStyle(
                                    color: Colors.black, fontSize: 14),
                              ),
                              GestureDetector(
                                onTap: () {
                                  Get.toNamed("/enroll");
                                },
                                child: MouseRegion(
                                  cursor: SystemMouseCursors.click,
                                  child: Text(
                                    "Enroll Now".tr,
                                    style: TextStyle(
                                      color: const Color(0xff19478d),
                                      fontSize: 14,
                                    ),
                                  ),
                                ),
                              )
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            );
          }),
        ],
      ),
    );
  }
}
