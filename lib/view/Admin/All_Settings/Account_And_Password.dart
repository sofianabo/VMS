import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vms_school/Link/Controller/AdminController/Main_Admin_Controller/Admin_Profile_Content.dart';
import 'package:vms_school/Translate/local_controller.dart';
import 'package:vms_school/view/Admin/All_Settings/Wedgets/Button_Has_IconText.dart';
import 'package:vms_school/view/Admin/All_Settings/Wedgets/Profile_DatePicker.dart';
import 'package:vms_school/view/Admin/All_Settings/Wedgets/TextField_Profile.dart';
import 'package:vms_school/view/Admin/All_Settings/Wedgets/Profile_DropDown.dart';

class Account_And_Password extends StatefulWidget {
  const Account_And_Password({super.key});

  @override
  State<Account_And_Password> createState() => _ProfileState();
}

class _ProfileState extends State<Account_And_Password> {
  TextEditingController newemail =
      TextEditingController(text: "laithazzam.la.la@gmail.com");
  TextEditingController password = TextEditingController(text: "");
  TextEditingController virificationCode = TextEditingController(text: "");
  TextEditingController oldpassword = TextEditingController();
  TextEditingController newpassword = TextEditingController();
  TextEditingController confnewpassword = TextEditingController();
  bool isenapled = false;
  @override
  Widget build(BuildContext context) {
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
                    Row(
                      textDirection: Get.find<LocalizationController>()
                                  .currentLocale
                                  .value
                                  .languageCode ==
                              'ar'
                          ? TextDirection.rtl
                          : TextDirection.ltr,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "My Email".tr,
                          style: TextStyle(fontSize: 18),
                        ),
                        Button_Has_IconText(
                          onPressed: () {
                            if (controller.enabledEmailInfo == true) {
                              controller.ChangeenabledEmailInfo(false);
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
                                if (value != "laithazzam.la.la@gmail.com" &&
                                    value.isNotEmpty) {
                                  controller.ChangeenabledchangeemaildInfo(
                                      true);
                                } else {
                                  controller.ChangeenabledchangeemaildInfo(
                                      false);
                                }
                              },
                            ),
                            if (controller.enabledchangeemaildInfo == true)
                              TextField_Profile(
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
                                enabled: controller.enabledchangeemaildInfo,
                              ),
                            if (controller.enabledchangeemaildInfo == true)
                              TextField_Profile(
                                upicon: Icon(
                                  Icons.verified_outlined,
                                  color: Theme.of(context)
                                      .textTheme
                                      .bodySmall!
                                      .color,
                                  size: 20,
                                ),
                                controller: virificationCode,
                                Uptext: "Your Verification Code".tr,
                                enabled: controller.enabledchangeemaildInfo,
                              ),
                          ],
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
                    Row(
                      textDirection: Get.find<LocalizationController>()
                                  .currentLocale
                                  .value
                                  .languageCode ==
                              'ar'
                          ? TextDirection.rtl
                          : TextDirection.ltr,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Change Password".tr,
                          style: TextStyle(fontSize: 18),
                        ),
                        Button_Has_IconText(
                          onPressed: () {
                            if (controller.enabledPasswordInfo == true) {
                              controller.ChangeenabledPasswordInfo(false);
                            } else {
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
  }
}
