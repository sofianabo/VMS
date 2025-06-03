import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:vms_school/Link/API/AuthAPI/LoginAPI.dart';
import 'package:vms_school/Link/Controller/AuthController/UserController.dart';
import 'package:vms_school/view/Both_Platform/Auth/ForgetPassword_Dialog.dart';
import 'package:vms_school/view/Both_Platform/widgets/TextFieldAuth.dart';
import 'package:vms_school/view/Both_Platform/widgets/TextFieldPassword.dart';

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
            Future<void> _performLogin(BuildContext context) async {
              if (controller.Isloading == false) {
                bool isUsernameEmpty = username.text.trim().isEmpty;
                bool isPasswordEmpty = password.text.trim().isEmpty;

                controller.updateFieldError("username", isUsernameEmpty);
                controller.updateFieldError("password", isPasswordEmpty);

                if (!(isUsernameEmpty || isPasswordEmpty)) {
                  await LoginAPI(context).login(username.text, password.text);
                }
              }
            }

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
                              crossAxisAlignment: CrossAxisAlignment.start,
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
                                  textInputAction: TextInputAction.next,
                                  onSubmitted: (_) => FocusScope.of(context)
                                      .nextFocus(), // عند الضغط على Enter
                                  isError: controller.IsusernameError,
                                  Uptext: "Username".tr,
                                  autofill: const [AutofillHints.username],
                                  controller: username,
                                  hinttext: "Username".tr,
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    TextFormPassword(
                                      width: width >= 883
                                          ? width * 0.5
                                          : width - 80,
                                      onChanged: (value) {
                                        if (value.isNotEmpty) {
                                          controller.updateFieldError(
                                              "password", false);
                                        }
                                      },
                                      textInputAction: TextInputAction
                                          .done, // لتنفيذ الإجراء عند الضغط على Enter
                                      onSubmitted: (_) {
                                        // تنفيذ الإجراء فقط إذا كانت الحقول غير فارغة
                                        if (username.text.trim().isNotEmpty &&
                                            password.text.trim().isNotEmpty) {
                                          _performLogin(context);
                                        }
                                      },
                                      isError: controller.IsPasswordError,
                                      Uptext: "Password".tr,
                                      autofill: const [AutofillHints.password],
                                      controller: password,
                                      hinttext: "Password".tr,
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          left: 8.0, right: 8.0),
                                      child: GestureDetector(
                                        onTap: () {
                                          Get.dialog(ForgetPassword());
                                        },
                                        child: Text(
                                          "Forgot your password  ?".tr,
                                          style: Get
                                              .theme.textTheme.titleMedium!
                                              .copyWith(
                                                  fontSize: 13,
                                                  fontWeight:
                                                      FontWeight.normal),
                                        ),
                                      ),
                                    )
                                  ],
                                )
                              ],
                            )
                                .animate()
                                .fadeIn(duration: const Duration(seconds: 1)),
                          ),
                        ),
                      ),
                      TextButton(
                        style: ButtonStyle(
                          shape: WidgetStatePropertyAll(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5),
                            ),
                          ),
                          backgroundColor:
                              WidgetStatePropertyAll(const Color(0xff19478d)),
                          maximumSize:
                              const WidgetStatePropertyAll(Size(250, 50)),
                          minimumSize:
                              const WidgetStatePropertyAll(Size(250, 50)),
                        ),
                        onPressed: () => _performLogin(context),
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
                                        .copyWith(
                                            color: Colors.white, fontSize: 12),
                                  ),
                                  const Padding(
                                    padding:
                                        EdgeInsets.only(left: 8.0, right: 8.0),
                                    child: Icon(
                                      Icons.login,
                                      color: Colors.white,
                                      size: 13,
                                    ),
                                  ),
                                ],
                              ),
                      ),
                      Row(
                        spacing: 10.0,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "You Don`t Have Account ?".tr,
                            style: TextStyle(color: Colors.black),
                          ),
                          GestureDetector(
                            onTap: () {
                              Get.offNamed("/enroll");
                            },
                            child: MouseRegion(
                              cursor: SystemMouseCursors.click,
                              child: Text(
                                "Enroll Now".tr,
                                style: TextStyle(
                                  color: Theme.of(context).primaryColor,
                                  fontSize: 14,
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
            );
          }),
        ],
      ),
    );
  }
}
