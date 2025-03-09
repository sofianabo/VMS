import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vms_school/Link/Controller/AdminController/Main_Admin_Controller/Admin_Profile_Content.dart';
import 'package:vms_school/Translate/local_controller.dart';
import 'package:vms_school/view/Admin/All_Settings/Wedgets/Button_Has_IconText.dart';
import 'package:vms_school/view/Admin/All_Settings/Wedgets/TextField_Profile.dart';

class Personal extends StatefulWidget {
  const Personal({super.key});

  @override
  State<Personal> createState() => _ProfileState();
}

class _ProfileState extends State<Personal> {
  TextEditingController facebookUrl = TextEditingController();
  TextEditingController xPlatformUrl = TextEditingController();
  TextEditingController linkedinUrl = TextEditingController();
  TextEditingController instagramUrl = TextEditingController();
  TextEditingController bankAccountTitle = TextEditingController();
  TextEditingController bankName = TextEditingController();
  TextEditingController bankBranchName = TextEditingController();
  TextEditingController bankAccountNumber = TextEditingController();
  TextEditingController ifscCode = TextEditingController();
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
                  "Personal".tr,
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
                          "Social Media Info".tr,
                          style: TextStyle(fontSize: 18),
                        ),
                        Button_Has_IconText(
                          onPressed: () {
                            if (controller.enabledSocilaMediaInfo == true) {
                              controller.ChangeenabledSocilaMediaInfo(false);
                            } else {
                              controller.ChangeenabledSocilaMediaInfo(true);
                            }
                          },
                          text: controller.enabledSocilaMediaInfo
                              ? "Save".tr
                              : "Edit".tr,
                          icon: Icon(
                            controller.enabledSocilaMediaInfo
                                ? Icons.save_outlined
                                : Icons.edit,
                            color: Colors.black,
                          ),
                        )
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 15.0),
                      child: Wrap(
                        runSpacing: 25.0,
                        spacing: 25.0,
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
                                Icons.facebook,
                                color: Theme.of(context)
                                    .textTheme
                                    .bodySmall!
                                    .color,
                                size: 20,
                              ),
                              controller: facebookUrl,
                              Uptext: "Facebook URL".tr,
                              enabled: controller.enabledSocilaMediaInfo),
                          TextField_Profile(
                            upicon: Icon(
                              Icons.facebook,
                              color:
                                  Theme.of(context).textTheme.bodySmall!.color,
                              size: 20,
                            ),
                            enabled: controller.enabledSocilaMediaInfo,
                            controller: instagramUrl,
                            Uptext: "Instagram URL".tr,
                          ),
                          TextField_Profile(
                              upicon: Icon(
                                Icons.transfer_within_a_station,
                                color: Theme.of(context)
                                    .textTheme
                                    .bodySmall!
                                    .color,
                                size: 20,
                              ),
                              controller: xPlatformUrl,
                              Uptext: "X Platform URL".tr,
                              enabled: controller.enabledSocilaMediaInfo),
                          TextField_Profile(
                              upicon: Icon(
                                Icons.linked_camera,
                                color: Theme.of(context)
                                    .textTheme
                                    .bodySmall!
                                    .color,
                                size: 20,
                              ),
                              controller: linkedinUrl,
                              Uptext: "Linkedin URL".tr,
                              enabled: controller.enabledSocilaMediaInfo),
                        ],
                      ),
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
                          "Bank Info".tr,
                          style: TextStyle(fontSize: 18),
                        ),
                        Button_Has_IconText(
                          onPressed: () {
                            if (controller.enabledBanlInfo == true) {
                              controller.ChangeenabledBanlInfo(false);
                            } else {
                              controller.ChangeenabledBanlInfo(true);
                            }
                          },
                          text: controller.enabledBanlInfo
                              ? "Save".tr
                              : "Edit".tr,
                          icon: Icon(
                            controller.enabledBanlInfo
                                ? Icons.save_outlined
                                : Icons.edit,
                            color: Colors.black,
                          ),
                        )
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 15.0),
                      child: Wrap(
                        runSpacing: 25.0,
                        spacing: 25.0,
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
                              Icons.food_bank_outlined,
                              color:
                                  Theme.of(context).textTheme.bodySmall!.color,
                              size: 20,
                            ),
                            enabled: controller.enabledBanlInfo,
                            controller: bankName,
                            Uptext: "Bank Name".tr,
                          ),
                          TextField_Profile(
                            upicon: Icon(
                              Icons.comment_bank,
                              color:
                                  Theme.of(context).textTheme.bodySmall!.color,
                              size: 20,
                            ),
                            controller: bankAccountTitle,
                            Uptext: "Bank Account Title".tr,
                            enabled: controller.enabledBanlInfo,
                          ),
                          TextField_Profile(
                            upicon: Icon(
                              Icons.branding_watermark_sharp,
                              color:
                                  Theme.of(context).textTheme.bodySmall!.color,
                              size: 20,
                            ),
                            controller: bankBranchName,
                            Uptext: "Bank Branch Name".tr,
                            enabled: controller.enabledBanlInfo,
                          ),
                          TextField_Profile(
                            upicon: Icon(
                              Icons.numbers_outlined,
                              color:
                                  Theme.of(context).textTheme.bodySmall!.color,
                              size: 20,
                            ),
                            controller: bankAccountNumber,
                            Uptext: "Bank Account Number".tr,
                            enabled: controller.enabledBanlInfo,
                          ),
                          TextField_Profile(
                            upicon: Icon(
                              Icons.confirmation_num_outlined,
                              color:
                                  Theme.of(context).textTheme.bodySmall!.color,
                              size: 20,
                            ),
                            controller: ifscCode,
                            Uptext: "IFSC Code",
                            enabled: controller.enabledBanlInfo,
                          ),
                        ],
                      ),
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
