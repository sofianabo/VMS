import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:get/get.dart';
import 'package:vms_school/Link/API/AdminAPI/Users/RePassword.dart';
import 'package:vms_school/Link/API/AdminAPI/Users/Re_Email_API.dart';
import 'package:vms_school/Link/API/Error_API.dart';
import 'package:vms_school/Link/Controller/AdminController/Employee_Controllers/Add_Data_controller.dart';
import 'package:vms_school/Link/Controller/AdminController/Main_Admin_Controller/Admin_Profile_Content.dart';
import 'package:vms_school/Translate/local_controller.dart';
import 'package:vms_school/widgets/Admin/AdminAllSettings/Button_Has_IconText.dart';
import 'package:vms_school/widgets/Admin/AdminAllSettings/TextField_Profile.dart';
import 'package:vms_school/widgets/Schema_Widget.dart';

class Account_And_Password extends StatefulWidget {
  const Account_And_Password({super.key});

  @override
  State<Account_And_Password> createState() => _ProfileState();
}

class _ProfileState extends State<Account_And_Password> {
  TextEditingController newemail = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController virificationCode = TextEditingController();
  TextEditingController oldpassword = TextEditingController();
  TextEditingController newpassword = TextEditingController();
  TextEditingController confnewpassword = TextEditingController();
  bool isfilled = false;

  var add_Data_controller = Get.find<Add_Data_controller>();

  @override
  void fillControllersWithData() {
    newemail.text = add_Data_controller.myData?.email ?? '';
    isfilled = true;
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return GetBuilder<Add_Data_controller>(builder: (add_Data_controller) {
      if (isfilled == false) {
        if (add_Data_controller.isLoading == false) {
          fillControllersWithData();
        }
      }
      return Align(
        alignment: Alignment.topCenter,
        child: SingleChildScrollView(
          child: GetBuilder<Admin_Profile_Content>(builder: (controller) {
            return Column(
              textDirection: Get.find<LocalizationController>()
                          .currentLocale
                          .value
                          .languageCode ==
                      'ar'
                  ? TextDirection.rtl
                  : TextDirection.ltr,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(
                      top: 25.0, left: 15.0, right: 15.0, bottom: 15.0),
                  child: Text(
                    "Account And Password".tr,
                    style: TextStyle(fontSize: 18),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 15.0),
                  padding: EdgeInsets.all(15.0),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(15)),
                      border: Border.all(color: Color(0xffF6F6F6), width: 1.5)),
                  child: Column(
                    spacing: 5.0,
                    children: [
                      Container(
                        width: screenWidth,
                        child: Wrap(
                          runSpacing: 10.0,
                          textDirection: Get.find<LocalizationController>()
                                      .currentLocale
                                      .value
                                      .languageCode ==
                                  'ar'
                              ? TextDirection.rtl
                              : TextDirection.ltr,
                          spacing: 10.0,
                          crossAxisAlignment: WrapCrossAlignment.center,
                          alignment: WrapAlignment.spaceBetween,
                          runAlignment: WrapAlignment.spaceBetween,
                          children: [
                            Text(
                              "My Email".tr,
                              style: TextStyle(fontSize: 18),
                            ),
                            Button_Has_IconText(
                              width: 103,
                              onPressed: () {
                                if (controller.enabledEmailInfo) {
                                  if (controller.enabledchangeemaildInfo) {
                                    RegExp emailRegex = RegExp(
                                        r"^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$");
                                    bool isEmailValid =
                                        emailRegex.hasMatch(newemail.text);

                                    RegExp passwordRegex =
                                        RegExp(r"^[a-zA-Z0-9]{8,}$");
                                    bool isPasswordValid =
                                        passwordRegex.hasMatch(password.text);

                                    if (!isEmailValid) {
                                      ErrorMessage(
                                        "البريد الإلكتروني غير صالح. تأكد من احتوائه على @ و .com",
                                      );

                                      return;
                                    }

                                    if (!isPasswordValid) {
                                      ErrorMessage(
                                        "يجب أن تكون كلمة المرور 8 محارف على الأقل وأن تحتوي على أحرف إنجليزية فقط",
                                      );

                                      return;
                                    }
                                    Re_Email_API().Re_Email(
                                        email: newemail.text,
                                        password: password.text,
                                        showdiag: true);
                                  } else {
                                    controller.ChangeenabledEmailInfo(false);
                                  }
                                } else {
                                  controller.ChangeenabledEmailInfo(true);
                                }
                              },
                              text: controller.enabledEmailInfo
                                  ? "Save".tr
                                  : "Edit".tr,
                              icon: Icon(
                                controller.enabledEmailInfo
                                    ? Icons.save_outlined
                                    : Icons.edit,
                                color: Colors.black,
                              ),
                            )
                          ],
                        ),
                      ),
                      Column(
                        spacing: 15.0,
                        textDirection: Get.find<LocalizationController>()
                                    .currentLocale
                                    .value
                                    .languageCode ==
                                'ar'
                            ? TextDirection.rtl
                            : TextDirection.ltr,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            width: screenWidth,
                            child: Wrap(
                              spacing: 12.0,
                              textDirection: Get.find<LocalizationController>()
                                          .currentLocale
                                          .value
                                          .languageCode ==
                                      'ar'
                                  ? TextDirection.rtl
                                  : TextDirection.ltr,
                              children: [
                                if (add_Data_controller.isLoading == false)
                                  TextField_Profile(
                                    fieldType: "email",
                                    width: 350,
                                    upicon: Icon(
                                      Icons.email_outlined,
                                      color: Theme.of(context)
                                          .textTheme
                                          .bodySmall!
                                          .color,
                                      size: 20,
                                    ),
                                    controller: newemail,
                                    Uptext: "My Email".tr,
                                    enabled: controller.enabledEmailInfo,
                                    onChanged: (value) {
                                      if (value !=
                                              "${add_Data_controller.myData!.email}" &&
                                          value.isNotEmpty) {
                                        controller
                                            .ChangeenabledchangeemaildInfo(
                                                true);
                                      } else {
                                        controller
                                            .ChangeenabledchangeemaildInfo(
                                                false);
                                      }
                                    },
                                  ),
                                if (add_Data_controller.isLoading == true)
                                  SchemaWidget(
                                          radius: 50, width: 250, height: 40)
                                      .animate(
                                          onPlay: (controller) =>
                                              controller.repeat())
                                      .shimmer(
                                          angle: 1,
                                          color: Colors.grey.withOpacity(0.2),
                                          duration: const Duration(seconds: 1),
                                          delay: const Duration(seconds: 1)),
                                if (controller.enabledEmailInfo == true)
                                  if (controller.enabledchangeemaildInfo ==
                                      true)
                                    TextField_Profile(
                                      isError: controller.IsPasswordError,
                                      hidePassword: controller.ShowPassword,
                                      IconButton: IconButton(
                                          onPressed: () {
                                            controller.ChangeShowPassword(
                                                !controller.ShowPassword);
                                          },
                                          icon: Icon(controller.ShowPassword
                                              ? Icons.visibility_off
                                              : Icons.remove_red_eye_outlined)),
                                      upicon: Icon(
                                        Icons.password,
                                        color: Theme.of(context)
                                            .textTheme
                                            .bodySmall!
                                            .color,
                                        size: 20,
                                      ),
                                      controller: password,
                                      Uptext: "Your Password".tr,
                                      enabled:
                                          controller.enabledchangeemaildInfo,
                                    ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 15.0),
                  padding: EdgeInsets.all(15.0),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(15)),
                      border: Border.all(color: Color(0xffF6F6F6), width: 1.5)),
                  child: Column(
                    spacing: 0.0,
                    children: [
                      Container(
                        width: screenWidth,
                        child: Wrap(
                          runSpacing: 10.0,
                          textDirection: Get.find<LocalizationController>()
                                      .currentLocale
                                      .value
                                      .languageCode ==
                                  'ar'
                              ? TextDirection.rtl
                              : TextDirection.ltr,
                          spacing: 10.0,
                          crossAxisAlignment: WrapCrossAlignment.center,
                          alignment: WrapAlignment.spaceBetween,
                          runAlignment: WrapAlignment.spaceBetween,
                          children: [
                            Text(
                              "Change Password".tr,
                              style: TextStyle(fontSize: 18),
                            ),
                            Button_Has_IconText(
                              width: 103,
                              onPressed: () async {
                                if (controller.enabledPasswordInfo) {
                                  bool isOldEmpty =
                                      oldpassword.text.trim().isEmpty;
                                  bool isNewEmpty =
                                      newpassword.text.trim().isEmpty;
                                  bool isConfirmEmpty =
                                      confnewpassword.text.trim().isEmpty;

                                  bool allEmpty = isOldEmpty &&
                                      isNewEmpty &&
                                      isConfirmEmpty;
                                  bool allFilled = !isOldEmpty &&
                                      !isNewEmpty &&
                                      !isConfirmEmpty;

                                  if (allEmpty) {
                                    controller.ChangeenabledPasswordInfo(false);
                                    return;
                                  }

                                  // تحديث حالة الأخطاء للحقول الفارغة
                                  controller.updatePasswordError(
                                      "old", isOldEmpty);
                                  controller.updatePasswordError(
                                      "new", isNewEmpty);
                                  controller.updatePasswordError(
                                      "confirm", isConfirmEmpty);

                                  // التحقق من تطابق الباسوورد الجديد مع التأكيد
                                  if (newpassword.text.trim() !=
                                      confnewpassword.text.trim()) {
                                    controller.updatePasswordError(
                                        "confirm", true);
                                    return; // إيقاف العملية حتى يتم التصحيح
                                  }

                                  // إرسال الطلب إذا كانت جميع الحقول ممتلئة وكلمات المرور متطابقة
                                  if (allFilled) {
                                    if (await Re_Password_API().Re_Password(
                                            oldPassword: oldpassword.text,
                                            newPassword: newpassword.text) ==
                                        200) {
                                      oldpassword.clear();
                                      newpassword.clear();
                                      confnewpassword.clear();
                                    }
                                  }
                                } else {
                                  controller.updatePasswordError("old", false);
                                  controller.updatePasswordError("new", false);
                                  controller.updatePasswordError(
                                      "confirm", false);
                                  controller.ChangeenabledPasswordInfo(true);
                                }
                              },
                              text: controller.enabledPasswordInfo
                                  ? "Save".tr
                                  : "Edit".tr,
                              icon: Icon(
                                controller.enabledPasswordInfo
                                    ? Icons.save_outlined
                                    : Icons.edit,
                                color: Colors.black,
                              ),
                            )
                          ],
                        ),
                      ),
                      Column(
                        mainAxisSize: MainAxisSize.min,
                        textDirection: Get.find<LocalizationController>()
                                    .currentLocale
                                    .value
                                    .languageCode ==
                                'ar'
                            ? TextDirection.rtl
                            : TextDirection.ltr,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(top: 15.0),
                            child: Row(
                              textDirection: Get.find<LocalizationController>()
                                          .currentLocale
                                          .value
                                          .languageCode ==
                                      'ar'
                                  ? TextDirection.rtl
                                  : TextDirection.ltr,
                              children: [
                                TextField_Profile(
                                  isError: controller.IsOldPasswordError,
                                  hidePassword: controller.ShowOldPassword,
                                  IconButton: IconButton(
                                      onPressed: () {
                                        controller.ChangeShowOldPassword(
                                            !controller.ShowOldPassword);
                                      },
                                      icon: Icon(
                                        controller.ShowOldPassword
                                            ? Icons.visibility_off
                                            : Icons.remove_red_eye_outlined,
                                        color: Theme.of(context)
                                            .textTheme
                                            .bodySmall!
                                            .color,
                                      )),
                                  upicon: Icon(
                                    Icons.password,
                                    color: Theme.of(context)
                                        .textTheme
                                        .bodySmall!
                                        .color,
                                    size: 20,
                                  ),
                                  controller: oldpassword,
                                  Uptext: "Old Password".tr,
                                  enabled: controller.enabledPasswordInfo,
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding:
                                const EdgeInsets.only(top: 15.0, bottom: 15.0),
                            child: Row(
                              textDirection: Get.find<LocalizationController>()
                                          .currentLocale
                                          .value
                                          .languageCode ==
                                      'ar'
                                  ? TextDirection.rtl
                                  : TextDirection.ltr,
                              children: [
                                TextField_Profile(
                                  fieldType: "password",
                                  isError: controller.IsNewPasswordError,
                                  hidePassword: controller.ShowNewPassword,
                                  IconButton: IconButton(
                                      onPressed: () {
                                        controller.ChangeShowNewPassword(
                                            !controller.ShowNewPassword);
                                      },
                                      icon: Icon(
                                        controller.ShowNewPassword
                                            ? Icons.visibility_off
                                            : Icons.remove_red_eye_outlined,
                                        color: Theme.of(context)
                                            .textTheme
                                            .bodySmall!
                                            .color,
                                      )),
                                  upicon: Icon(
                                    Icons.password,
                                    color: Theme.of(context)
                                        .textTheme
                                        .bodySmall!
                                        .color,
                                    size: 20,
                                  ),
                                  controller: newpassword,
                                  Uptext: "New Password".tr,
                                  enabled: controller.enabledPasswordInfo,
                                ),
                              ],
                            ),
                          ),
                          Row(
                            textDirection: Get.find<LocalizationController>()
                                        .currentLocale
                                        .value
                                        .languageCode ==
                                    'ar'
                                ? TextDirection.rtl
                                : TextDirection.ltr,
                            children: [
                              TextField_Profile(
                                customErrorMessage:
                                    confnewpassword.text.trim() != "" &&
                                            confnewpassword.text.isNotEmpty
                                        ? "كلمات المرور غير متطابقة"
                                        : "لا يمكن ترك الحقل فارغ",
                                fieldType: "password",
                                isError: controller.IsConfirmPasswordError,
                                hidePassword: controller.ShowConfirmPassword,
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
                                upicon: Icon(
                                  Icons.password_outlined,
                                  color: Theme.of(context)
                                      .textTheme
                                      .bodySmall!
                                      .color,
                                  size: 20,
                                ),
                                controller: confnewpassword,
                                Uptext: "Confirm New Password".tr,
                                enabled: controller.enabledPasswordInfo,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            );
          }),
        ),
      );
    });
  }
}
