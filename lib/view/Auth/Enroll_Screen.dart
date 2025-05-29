import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:vms_school/Link/API/AuthAPI/Enroll_API.dart';
import 'package:vms_school/Link/Controller/AuthController/Enroll_Controller.dart';
import 'package:vms_school/widgets/TextFildWithUpper.dart';

class EnrollScreen extends StatefulWidget {
  EnrollScreen({super.key});

  @override
  State<EnrollScreen> createState() => _EnrollScreenState();
}

class _EnrollScreenState extends State<EnrollScreen> {
  TextEditingController Email = TextEditingController();

  TextEditingController Username = TextEditingController();

  TextEditingController First = TextEditingController();

  TextEditingController Last = TextEditingController();

  TextEditingController National = TextEditingController();

  TextEditingController Phone = TextEditingController();

  TextEditingController password = TextEditingController();

  TextEditingController Confirm = TextEditingController();

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
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
                  "assets/images/Enroll_Images/2.jpg",
                  fit: BoxFit.cover,
                ),
              ),
            ).animate(onPlay: (controller) => controller.repeat()).shimmer(
                angle: 1,
                color: Colors.white.withOpacity(0.4),
                duration: const Duration(seconds: 5),
                delay: const Duration(seconds: 1)),
          GetBuilder<EnrollController>(builder: (controller) {
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
                      const SizedBox(height: 8),
                      Column(
                        spacing: 2.0,
                        children: [
                          Wrap(
                            spacing: 20.0,
                            runSpacing: 2.0,
                            crossAxisAlignment: WrapCrossAlignment.center,
                            children: [
                              Textfildwithupper(
                                  onChanged: (value) {
                                    if (value.isNotEmpty) {
                                      controller.updateFieldError(
                                          "email", false);
                                    }
                                  },
                                  isError: controller.IsEmailError,
                                  isRequired: true,
                                  fieldType: "email",
                                  width: 310,
                                  controller: Email,
                                  Uptext: "Email".tr,
                                  hinttext: "Email".tr),
                              Textfildwithupper(
                                  onChanged: (value) {
                                    if (value.isNotEmpty) {
                                      controller.updateFieldError(
                                          "username", false);
                                    }
                                  },
                                  isError: controller.IsusernameError,
                                  isRequired: true,
                                  width: 310,
                                  controller: Username,
                                  Uptext: "Username".tr,
                                  hinttext: "Username".tr),
                            ],
                          ),
                          Wrap(
                            spacing: 20.0,
                            runSpacing: 2.0,
                            crossAxisAlignment: WrapCrossAlignment.center,
                            children: [
                              Textfildwithupper(
                                  onChanged: (value) {
                                    if (value.isNotEmpty) {
                                      controller.updateFieldError(
                                          "name", false);
                                    }
                                  },
                                  isError: controller.IsnameError,
                                  isRequired: true,
                                  width: 310,
                                  controller: First,
                                  Uptext: "First Name".tr,
                                  hinttext: "First Name".tr),
                              Textfildwithupper(
                                  onChanged: (value) {
                                    if (value.isNotEmpty) {
                                      controller.updateFieldError(
                                          "last", false);
                                    }
                                  },
                                  isError: controller.IsLastnameError,
                                  isRequired: true,
                                  width: 310,
                                  controller: Last,
                                  Uptext: "Last Name".tr,
                                  hinttext: "Last Name".tr),
                            ],
                          ),
                          Wrap(
                            spacing: 20.0,
                            runSpacing: 2.0,
                            crossAxisAlignment: WrapCrossAlignment.center,
                            children: [
                              Textfildwithupper(
                                  onChanged: (value) {
                                    if (value.isNotEmpty) {
                                      controller.updateFieldError("nid", false);
                                    }
                                  },
                                  isError: controller.IsnidError,
                                  isRequired: true,
                                  fieldType: "number",
                                  width: 310,
                                  controller: National,
                                  Uptext: "National ID".tr,
                                  hinttext: "National ID".tr),
                              Textfildwithupper(
                                  onChanged: (value) {
                                    if (value.isNotEmpty) {
                                      controller.updateFieldError(
                                          "phone", false);
                                    }
                                  },
                                  isError: controller.IsphoneError,
                                  isRequired: true,
                                  fieldType: "phone",
                                  width: 310,
                                  controller: Phone,
                                  Uptext: "Phone".tr,
                                  hinttext: "Phone".tr),
                            ],
                          ),
                          Wrap(
                            spacing: 20.0,
                            runSpacing: 2.0,
                            crossAxisAlignment: WrapCrossAlignment.center,
                            children: [
                              Textfildwithupper(
                                  onChanged: (value) {
                                    if (value.isNotEmpty) {
                                      controller.updateFieldError(
                                          "password", false);
                                    }
                                  },
                                  isError: controller.IsPasswordError,
                                  IconButton: IconButton(
                                      onPressed: () {
                                        controller.ChangeShowPassword(
                                            !controller.ShowPassword);
                                      },
                                      icon: Icon(
                                        controller.ShowPassword
                                            ? Icons.visibility_off
                                            : Icons.remove_red_eye_outlined,
                                        color: Theme.of(context)
                                            .textTheme
                                            .bodySmall!
                                            .color,
                                      )),
                                  hidePassword: controller.ShowPassword,
                                  isRequired: true,
                                  fieldType: "password",
                                  width: 310,
                                  controller: password,
                                  Uptext: "Password".tr,
                                  hinttext: "Password".tr),
                              Textfildwithupper(
                                  customErrorMessage:
                                      Confirm.text.trim() != "" &&
                                              Confirm.text.isNotEmpty
                                          ? "كلمات المرور غير متطابقة"
                                          : "لا يمكن ترك الحقل فارغ",
                                  width: 310,
                                  onChanged: (value) {
                                    if (value.isNotEmpty) {
                                      controller.updateFieldError(
                                          "cpassword", false);
                                    }
                                  },
                                  isError: controller.IsConfirmPasswordError,
                                  fieldType: "password",
                                  IconButton: IconButton(
                                      onPressed: () {
                                        controller.ChangeShowConfirmPassword(
                                            !controller.ShowConfirmPassword);
                                      },
                                      icon: Icon(
                                        controller.ShowConfirmPassword
                                            ? Icons.visibility_off
                                            : Icons.remove_red_eye_outlined,
                                        color: Theme.of(context)
                                            .textTheme
                                            .bodySmall!
                                            .color,
                                      )),
                                  hidePassword: controller.ShowConfirmPassword,
                                  isRequired: true,
                                  controller: Confirm,
                                  hinttext: "Confirm Password".tr,
                                  Uptext: "Confirm Password".tr),
                            ],
                          ),
                        ],
                      ),
                      const SizedBox(height: 10),
                      TextButton(
                              style: ButtonStyle(
                                shape: WidgetStatePropertyAll(
                                  RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(5),
                                  ),
                                ),
                                backgroundColor: WidgetStatePropertyAll(
                                    const Color(0xff19478d)),
                                maximumSize:
                                    const WidgetStatePropertyAll(Size(250, 50)),
                                minimumSize:
                                    const WidgetStatePropertyAll(Size(250, 50)),
                              ),
                              onPressed: () async {
                                if (controller.Isloading == false) {
                                  bool isUsernameEmpty =
                                      Username.text.trim().isEmpty;
                                  bool isNameEmpty = First.text.trim().isEmpty;
                                  bool isLastNameEmpty =
                                      Last.text.trim().isEmpty;
                                  bool isPhoneEmpty = Phone.text.trim().isEmpty;
                                  bool isNationalIDEmpty =
                                      National.text.trim().isEmpty;
                                  bool isEmailEmpty = Email.text.trim().isEmpty;
                                  bool isPasswordEmpty =
                                      password.text.trim().isEmpty;
                                  bool isConfirmPasswordEmpty =
                                      Confirm.text.trim().isEmpty;

                                  RegExp emailRegex = RegExp(
                                      r"^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$");
                                  bool isEmailValid =
                                      emailRegex.hasMatch(Email.text);

                                  RegExp passwordRegex =
                                      RegExp(r"^[a-zA-Z0-9]{8,}$");
                                  bool isPasswordValid =
                                      passwordRegex.hasMatch(password.text);

                                  // تحديث الأخطاء بناءً على الإدخال
                                  controller.updateFieldError(
                                      "username", isUsernameEmpty);
                                  controller.updateFieldError(
                                      "name", isNameEmpty);
                                  controller.updateFieldError(
                                      "last", isLastNameEmpty);
                                  controller.updateFieldError(
                                      "phone", isPhoneEmpty);
                                  controller.updateFieldError(
                                      "nid", isNationalIDEmpty);
                                  controller.updateFieldError(
                                      "email", isEmailEmpty || !isEmailValid);
                                  controller.updateFieldError("password",
                                      isPasswordEmpty || !isPasswordValid);
                                  controller.updateFieldError(
                                      "cpassword",
                                      isConfirmPasswordEmpty ||
                                          password.text != Confirm.text);

                                  // إذا لم يكن هناك أي أخطاء، قم بإضافة ولي الأمر
                                  if (!(isUsernameEmpty ||
                                      isNameEmpty ||
                                      isPhoneEmpty ||
                                      isNationalIDEmpty ||
                                      isEmailEmpty ||
                                      !isEmailValid ||
                                      isLastNameEmpty ||
                                      isPasswordEmpty ||
                                      !isPasswordValid ||
                                      isConfirmPasswordEmpty ||
                                      password.text != Confirm.text)) {
                                    await Enroll_API().Enroll_Now(
                                        name: First.text + " " + Last.text,
                                        email: Email.text,
                                        nationalid: National.text,
                                        phone: Phone.text,
                                        username: Username.text,
                                        password: password.text);
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
                                          "Enroll Now".tr,
                                          style: Get
                                              .theme.textTheme.displayMedium!
                                              .copyWith(fontSize: 15),
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
                            "You Have Account ?".tr,
                            style: TextStyle(color: Colors.black),
                          ),
                          GestureDetector(
                            onTap: () {
                              Get.offAllNamed("/login");
                            },
                            child: MouseRegion(
                              cursor: SystemMouseCursors.click,
                              child: Text(
                                "Sign In".tr,
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
