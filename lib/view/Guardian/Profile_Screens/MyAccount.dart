import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vms_school/Link/Controller/AuthController/Enroll_Controller.dart';
import 'package:vms_school/widgets/TextFildWithUpper.dart';

class MyAccount extends StatefulWidget {
  const MyAccount({super.key});

  @override
  State<MyAccount> createState() => _MyAccountState();
}

class _MyAccountState extends State<MyAccount> {
  TextEditingController Email = TextEditingController();

  TextEditingController Username = TextEditingController();

  TextEditingController password = TextEditingController();
  TextEditingController Oldpassword = TextEditingController();

  TextEditingController Confirm = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return GetBuilder<EnrollController>(builder: (controller) {
      return SingleChildScrollView(
        child: Column(
          children: [
            Column(
              spacing: 5.0,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Textfildwithupper(
                    readOnly: true,
                    fieldType: "email",
                    width: 400,
                    controller: Email,
                    Uptext: "Email".tr,
                    hinttext: "Email".tr),
                Padding(
                  padding: const EdgeInsets.only(top: 20.0, bottom: 20.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Expanded(
                        child: Divider(
                          thickness: 1,
                          color: Get.theme.textTheme.bodyMedium!.color,
                          endIndent: 10, // المسافة بين الخط والنص
                        ),
                      ),
                      Text(
                        "Password".tr,
                        style: TextStyle(
                          color: Get.theme.textTheme.bodyMedium!.color,
                          fontSize: 16,
                        ),
                      ),
                      Expanded(
                        child: Divider(
                          thickness: 1,
                          color: Get.theme.textTheme.bodyMedium!.color,
                          indent: 10, // المسافة بين الخط والنص
                        ),
                      ),
                    ],
                  ),
                ),
                Textfildwithupper(
                    onChanged: (value) {
                      if (value.isNotEmpty) {
                        controller.updateFieldError("oldpassword", false);
                      }
                    },
                    isError: controller.IsoldPasswordError,
                    IconButton: IconButton(
                        onPressed: () {
                          controller.ChangeShowoldPassword(
                              !controller.ShowoldPassword);
                        },
                        icon: Icon(
                          controller.ShowoldPassword
                              ? Icons.visibility_off
                              : Icons.remove_red_eye_outlined,
                          color: Theme.of(context).textTheme.bodySmall!.color,
                        )),
                    hidePassword: controller.ShowoldPassword,
                    isRequired: true,
                    fieldType: "password",
                    width: 400,
                    controller: Oldpassword,
                    Uptext: "Old Password".tr,
                    hinttext: "Old Password".tr),
                Textfildwithupper(
                    onChanged: (value) {
                      if (value.isNotEmpty) {
                        controller.updateFieldError("password", false);
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
                          color: Theme.of(context).textTheme.bodySmall!.color,
                        )),
                    hidePassword: controller.ShowPassword,
                    isRequired: true,
                    fieldType: "password",
                    width: 400,
                    controller: password,
                    Uptext: "Password".tr,
                    hinttext: "Password".tr),
                Textfildwithupper(
                    customErrorMessage:
                        Confirm.text.trim() != "" && Confirm.text.isNotEmpty
                            ? "كلمات المرور غير متطابقة"
                            : "لا يمكن ترك الحقل فارغ",
                    width: 400,
                    onChanged: (value) {
                      if (value.isNotEmpty) {
                        controller.updateFieldError("cpassword", false);
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
                          color: Theme.of(context).textTheme.bodySmall!.color,
                        )),
                    hidePassword: controller.ShowConfirmPassword,
                    isRequired: true,
                    controller: Confirm,
                    hinttext: "Confirm Password".tr,
                    Uptext: "Confirm Password".tr),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(top: 30.0),
              child: TextButton(
                  style: ButtonStyle(
                    shape: WidgetStatePropertyAll(RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(5)))),
                    backgroundColor:
                        WidgetStatePropertyAll(Get.theme.canvasColor),
                    foregroundColor: WidgetStatePropertyAll(Colors.white),
                  ),
                  onPressed: () async {
                    if (controller.Isloading == false) {
                      bool isUsernameEmpty = Username.text.trim().isEmpty;

                      bool isEmailEmpty = Email.text.trim().isEmpty;
                      bool isoldpassword = Oldpassword.text.trim().isEmpty;
                      bool isPasswordEmpty = password.text.trim().isEmpty;
                      bool isConfirmPasswordEmpty = Confirm.text.trim().isEmpty;

                      RegExp emailRegex = RegExp(
                          r"^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$");
                      bool isEmailValid = emailRegex.hasMatch(Email.text);

                      RegExp passwordRegex = RegExp(r"^[a-zA-Z0-9]{8,}$");
                      bool isPasswordValid =
                          passwordRegex.hasMatch(password.text);

                      // تحديث الأخطاء بناءً على الإدخال
                      controller.updateFieldError("username", isUsernameEmpty);
                      controller.updateFieldError("oldpassword", isoldpassword);

                      controller.updateFieldError(
                          "email", isEmailEmpty || !isEmailValid);
                      controller.updateFieldError(
                          "password", isPasswordEmpty || !isPasswordValid);
                      controller.updateFieldError(
                          "cpassword",
                          isConfirmPasswordEmpty ||
                              password.text != Confirm.text);

                      // إذا لم يكن هناك أي أخطاء، قم بإضافة ولي الأمر
                      if (!(isUsernameEmpty ||
                          isEmailEmpty ||
                          !isEmailValid ||
                          isPasswordEmpty ||
                          !isPasswordValid ||
                          !isoldpassword ||
                          isConfirmPasswordEmpty ||
                          password.text != Confirm.text)) {}
                    }
                  },
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    spacing: 10.0,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(
                            top: 5.0, bottom: 5.0, left: 20.0, right: 20.0),
                        child: Text("Save".tr),
                      ),
                      Icon(Icons.save_outlined)
                    ],
                  )),
            )
          ],
        ),
      );
    });
  }
}
