import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:vms_school/Link/API/OpenURLs.dart';
import 'package:vms_school/Link/Controller/HomeController/HomeScreenController.dart';
import 'package:vms_school/Translate/local_controller.dart';
import 'package:vms_school/view/Both_Platform/widgets/Responsive.dart';
import 'package:vms_school/view/Both_Platform/widgets/VMSAlertDialog.dart';

class Section7 extends StatelessWidget {
  Section7({super.key});
  bool IsArabic =
      Get.find<LocalizationController>().currentLocale.value.languageCode ==
          'ar';

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).primaryColor,
      margin: const EdgeInsets.only(top: 100),
      padding: const EdgeInsets.only(top: 20),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Column(
                children: [
                  Container(
                    padding: const EdgeInsets.all(10.0),
                    decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(Radius.circular(100))),
                    height: 100,
                    width: 100,
                    child: Image.asset(
                      "assets/images/section5-image3.png",
                      width: 50,
                      height: 50,
                    )
                        .animate(onPlay: (controller) => controller.repeat())
                        .rotate(
                            duration: const Duration(seconds: 10),
                            delay: const Duration(milliseconds: 1)),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text("Virtual Modern School".tr,
                      style: Get.theme.textTheme.bodyMedium!
                          .copyWith(fontSize: 20, color: Colors.white)),
                ],
              )
            ],
          ),
          const SizedBox(
            height: 70,
          ),
          ResponsiveUI(
            desktopScreen: Column(
              children: [
                Container(
                  margin: const EdgeInsets.only(left: 150, right: 150),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        children: [
                          Text("Openning Hours".tr,
                              style: Get.theme.textTheme.bodyMedium!
                                  .copyWith(fontSize: 16, color: Colors.white)),
                          const SizedBox(
                            height: 5,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Directionality(
                                textDirection:
                                    Get.find<LocalizationController>()
                                                .currentLocale
                                                .value
                                                .languageCode ==
                                            'ar'
                                        ? TextDirection.rtl
                                        : TextDirection.ltr,
                                child: Row(
                                  children: [
                                    GetBuilder<Homescreencontroller>(
                                        builder: (controller) {
                                      return Text(
                                          "${_formatTime(controller.morningShiftStartHours)} -----> ${_formatTime(controller.morningClosingHours)}",
                                          style: Get.theme.textTheme.bodyMedium!
                                              .copyWith(
                                                  fontSize: 16,
                                                  color: Colors.white));
                                    }),
                                    const SizedBox(
                                      width: 5,
                                    ),
                                    Image.asset(
                                      "assets/images/time-icon.png",
                                      height: 20,
                                      width: 20,
                                    ),
                                  ],
                                ),
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              Directionality(
                                textDirection:
                                    Get.find<LocalizationController>()
                                                .currentLocale
                                                .value
                                                .languageCode ==
                                            'ar'
                                        ? TextDirection.rtl
                                        : TextDirection.ltr,
                                child: Row(
                                  children: [
                                    GetBuilder<Homescreencontroller>(
                                        builder: (controller) {
                                      return Text(
                                          "${_formatTime(controller.eveningShiftStartHours)} -----> ${_formatTime(controller.eveningClosingHours)}",
                                          style: Get.theme.textTheme.bodyMedium!
                                              .copyWith(
                                                  fontSize: 16,
                                                  color: Colors.white));
                                    }),
                                    const SizedBox(
                                      width: 5,
                                    ),
                                    Image.asset(
                                      "assets/images/time-icon.png",
                                      height: 20,
                                      width: 20,
                                    ),
                                  ],
                                ),
                              )
                            ],
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Row(
                            children: [
                              GetBuilder<Homescreencontroller>(
                                  builder: (controller) {
                                return GestureDetector(
                                  onTap: () => controller.urlYoutube != null &&
                                          controller.urlYoutube!.isNotEmpty &&
                                          !controller.Isloading
                                      ? launchLink(
                                          url: "${controller.urlYoutube}",
                                          type: LinkType.youtube,
                                          context: context,
                                        )
                                      : null,
                                  child: Image.asset(
                                    "assets/images/youtube-icon.png",
                                    width: 40,
                                    height: 40,
                                  ),
                                );
                              }),
                              const SizedBox(
                                width: 5,
                              ),
                              GetBuilder<Homescreencontroller>(
                                  builder: (controller) {
                                return GestureDetector(
                                  onTap: () => controller.urlFaceBook != null &&
                                          controller.urlFaceBook!.isNotEmpty &&
                                          !controller.Isloading
                                      ? launchLink(
                                          url: "${controller.urlFaceBook}",
                                          type: LinkType.facebook,
                                          context: context,
                                        )
                                      : null,
                                  child: Image.asset(
                                    "assets/images/facebook-icon.png",
                                    width: 40,
                                    height: 40,
                                  ),
                                );
                              }),
                            ],
                          ),
                        ],
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 35.0),
                            child: Row(
                              children: [
                                Text("Contact Details".tr,
                                    style: Get.theme.textTheme.bodyMedium!
                                        .copyWith(
                                            fontSize: 16, color: Colors.white)),
                              ],
                            ),
                          ),
                          const SizedBox(
                            height: 8,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Row(
                                children: [
                                  GetBuilder<Homescreencontroller>(
                                      builder: (controller) {
                                    return GestureDetector(
                                      onTap: () => controller.phonNumber !=
                                                  null &&
                                              !controller.Isloading &&
                                              controller.phonNumber!.isNotEmpty
                                          ? launchLink(
                                              url: "${controller.phonNumber}",
                                              type: LinkType.phone,
                                              context: context,
                                            )
                                          : null,
                                      child: Text(
                                          "${controller.Isloading ? "No Phone Number yet".tr : controller.phonNumber != null && controller.phonNumber!.isNotEmpty ? controller.phonNumber : "No Phone Number yet".tr}",
                                          style: Get.theme.textTheme.bodyMedium!
                                              .copyWith(
                                                  fontSize: 14,
                                                  color: Colors.white)),
                                    );
                                  }),
                                  const SizedBox(
                                    width: 8,
                                  ),
                                  Container(
                                      decoration: const BoxDecoration(
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(50)),
                                          color: Colors.white),
                                      height: 30,
                                      width: 30,
                                      child: Icon(
                                        Icons.call,
                                        color: Get.theme.primaryColor,
                                        size: 16,
                                      )),
                                ],
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              Row(
                                children: [
                                  GetBuilder<Homescreencontroller>(
                                      builder: (controller) {
                                    return GestureDetector(
                                      onTap: () =>
                                          controller.whatsAppNumber != null &&
                                                  !controller.Isloading &&
                                                  controller.whatsAppNumber!
                                                      .isNotEmpty
                                              ? launchLink(
                                                  url:
                                                      "${controller.whatsAppNumber}",
                                                  type: LinkType.phone,
                                                  context: context,
                                                )
                                              : null,
                                      child: Text(
                                          "${controller.Isloading ? "No Phone Number yet".tr : controller.whatsAppNumber != null && controller.whatsAppNumber!.isNotEmpty ? controller.whatsAppNumber : "No Phone Number yet".tr}",
                                          style: Get.theme.textTheme.bodyMedium!
                                              .copyWith(
                                                  fontSize: 14,
                                                  color: Colors.white)),
                                    );
                                  }),
                                  const SizedBox(
                                    width: 8,
                                  ),
                                  Container(
                                      decoration: const BoxDecoration(
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(50)),
                                          color: Colors.white),
                                      height: 30,
                                      width: 30,
                                      child: Icon(
                                        Icons.call,
                                        color: Get.theme.primaryColor,
                                        size: 16,
                                      )),
                                ],
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              Row(
                                children: [
                                  GetBuilder<Homescreencontroller>(
                                      builder: (controller) {
                                    return GestureDetector(
                                      onTap: () => controller.email != null &&
                                              !controller.Isloading &&
                                              controller.email!.isNotEmpty
                                          ? launchLink(
                                              url: "${controller.email}",
                                              type: LinkType.email,
                                              context: context,
                                            )
                                          : null,
                                      child: Text(
                                          "${controller.Isloading ? "No Email yet".tr : controller.email != null && controller.email!.isNotEmpty ? controller.email : "No Email yet".tr}",
                                          style: Get.theme.textTheme.bodyMedium!
                                              .copyWith(
                                                  fontSize: 14,
                                                  color: Colors.white)),
                                    );
                                  }),
                                  const SizedBox(
                                    width: 8,
                                  ),
                                  Container(
                                      decoration: const BoxDecoration(
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(50)),
                                          color: Colors.white),
                                      height: 30,
                                      width: 30,
                                      child: Icon(
                                        Icons.mail,
                                        color: Get.theme.primaryColor,
                                        size: 18,
                                      )),
                                ],
                              ),
                            ],
                          )
                        ],
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                Directionality(
                  textDirection: Get.find<LocalizationController>()
                              .currentLocale
                              .value
                              .languageCode ==
                          'ar'
                      ? TextDirection.rtl
                      : TextDirection.ltr,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Icon(
                        Icons.location_on_rounded,
                        color: Colors.white,
                        size: 20,
                      ),
                      const SizedBox(
                        width: 15,
                      ),
                      GetBuilder<Homescreencontroller>(builder: (controller) {
                        return Text(
                            "${!controller.Isloading ? controller.address != null && controller.address != "" || controller.address!.isNotEmpty ? IsArabic ? controller.address : controller.enAddress : "No Address yet".tr : "No Address yet".tr}",
                            style: Get.theme.textTheme.bodyMedium!
                                .copyWith(fontSize: 16, color: Colors.white));
                      }),
                    ],
                  ),
                ),
                Directionality(
                  textDirection: Get.find<LocalizationController>()
                              .currentLocale
                              .value
                              .languageCode ==
                          'ar'
                      ? TextDirection.rtl
                      : TextDirection.ltr,
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: 8.0),
                    child: Row(
                      spacing: 8.0,
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const Icon(
                          Icons.copyright_outlined,
                          color: Colors.white,
                          size: 18,
                        ),
                        Text("All Rights reserved. Copyright".tr,
                            style: Get.theme.textTheme.bodyMedium!
                                .copyWith(fontSize: 16, color: Colors.white)),
                      ],
                    ),
                  ),
                ),
                Directionality(
                  textDirection: Get.find<LocalizationController>()
                              .currentLocale
                              .value
                              .languageCode ==
                          'ar'
                      ? TextDirection.rtl
                      : TextDirection.ltr,
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: 8.0),
                    child: GestureDetector(
                      onTap: () {
                        Get.dialog(VMSPolicyAlertDialog(
                          contents: Container(
                            width: 800,
                            height: 600,
                            child: Column(
                              spacing: 20.0,
                              children: [
                                SvgPicture.asset(
                                  "assets/images/logolight.svg",
                                  height: 60,
                                  width: 60,
                                ),
                                Privacy_Policy()
                              ],
                            ),
                          ),
                          apptitle: "Privacy Policy".tr,
                        ));
                      },
                      child: Row(
                        spacing: 8.0,
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const Icon(
                            Icons.privacy_tip_outlined,
                            color: Colors.white,
                            size: 18,
                          ),
                          Text("Privacy Policy".tr,
                              style: Get.theme.textTheme.bodyMedium!
                                  .copyWith(fontSize: 16, color: Colors.white)),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
            tabletScreen: Column(
              children: [
                Container(
                  margin: const EdgeInsets.only(left: 100, right: 100),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        children: [
                          Text("Openning Hours".tr,
                              style: Get.theme.textTheme.bodyMedium!
                                  .copyWith(fontSize: 16, color: Colors.white)),
                          const SizedBox(
                            height: 5,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Directionality(
                                textDirection:
                                    Get.find<LocalizationController>()
                                                .currentLocale
                                                .value
                                                .languageCode ==
                                            'ar'
                                        ? TextDirection.rtl
                                        : TextDirection.ltr,
                                child: Row(
                                  children: [
                                    GetBuilder<Homescreencontroller>(
                                        builder: (controller) {
                                      return Text(
                                          "${_formatTime(controller.morningShiftStartHours)} -----> ${_formatTime(controller.morningClosingHours)}",
                                          style: Get.theme.textTheme.bodyMedium!
                                              .copyWith(
                                                  fontSize: 16,
                                                  color: Colors.white));
                                    }),
                                    const SizedBox(
                                      width: 5,
                                    ),
                                    Image.asset(
                                      "assets/images/time-icon.png",
                                      height: 20,
                                      width: 20,
                                    ),
                                  ],
                                ),
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              Directionality(
                                textDirection:
                                    Get.find<LocalizationController>()
                                                .currentLocale
                                                .value
                                                .languageCode ==
                                            'ar'
                                        ? TextDirection.rtl
                                        : TextDirection.ltr,
                                child: Row(
                                  children: [
                                    GetBuilder<Homescreencontroller>(
                                        builder: (controller) {
                                      return Text(
                                          "${_formatTime(controller.eveningShiftStartHours)} -----> ${_formatTime(controller.eveningClosingHours)}",
                                          style: Get.theme.textTheme.bodyMedium!
                                              .copyWith(
                                                  fontSize: 16,
                                                  color: Colors.white));
                                    }),
                                    const SizedBox(
                                      width: 5,
                                    ),
                                    Image.asset(
                                      "assets/images/time-icon.png",
                                      height: 20,
                                      width: 20,
                                    ),
                                  ],
                                ),
                              )
                            ],
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Row(
                            children: [
                              GetBuilder<Homescreencontroller>(
                                  builder: (controller) {
                                return GestureDetector(
                                  onTap: () => controller.urlYoutube != null &&
                                          !controller.Isloading &&
                                          controller.urlYoutube!.isNotEmpty
                                      ? launchLink(
                                          url: "${controller.urlYoutube}",
                                          type: LinkType.youtube,
                                          context: context,
                                        )
                                      : null,
                                  child: Image.asset(
                                    "assets/images/youtube-icon.png",
                                    width: 40,
                                    height: 40,
                                  ),
                                );
                              }),
                              const SizedBox(
                                width: 5,
                              ),
                              GetBuilder<Homescreencontroller>(
                                  builder: (controller) {
                                return GestureDetector(
                                  onTap: () => controller.urlFaceBook != null &&
                                          !controller.Isloading &&
                                          controller.urlFaceBook!.isNotEmpty
                                      ? launchLink(
                                          url: "${controller.urlFaceBook}",
                                          type: LinkType.facebook,
                                          context: context,
                                        )
                                      : null,
                                  child: Image.asset(
                                    "assets/images/facebook-icon.png",
                                    width: 40,
                                    height: 40,
                                  ),
                                );
                              }),
                            ],
                          ),
                        ],
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 35.0),
                            child: Row(
                              children: [
                                Text("Contact Details".tr,
                                    style: Get.theme.textTheme.bodyMedium!
                                        .copyWith(
                                            fontSize: 16, color: Colors.white)),
                              ],
                            ),
                          ),
                          const SizedBox(
                            height: 8,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Row(
                                children: [
                                  GetBuilder<Homescreencontroller>(
                                      builder: (controller) {
                                    return GestureDetector(
                                      onTap: () => controller.phonNumber !=
                                                  null &&
                                              !controller.Isloading &&
                                              controller.phonNumber!.isNotEmpty
                                          ? launchLink(
                                              url: "${controller.phonNumber}",
                                              type: LinkType.phone,
                                              context: context,
                                            )
                                          : null,
                                      child: Text(
                                          "${controller.Isloading ? "No Phone Number yet".tr : controller.phonNumber != null && controller.phonNumber!.isNotEmpty ? controller.phonNumber : "No Phone Number yet".tr}",
                                          style: Get.theme.textTheme.bodyMedium!
                                              .copyWith(
                                                  fontSize: 14,
                                                  color: Colors.white)),
                                    );
                                  }),
                                  const SizedBox(
                                    width: 8,
                                  ),
                                  Container(
                                      decoration: const BoxDecoration(
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(50)),
                                          color: Colors.white),
                                      height: 30,
                                      width: 30,
                                      child: Icon(
                                        Icons.call,
                                        color: Get.theme.primaryColor,
                                        size: 16,
                                      )),
                                ],
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              Row(
                                children: [
                                  GetBuilder<Homescreencontroller>(
                                      builder: (controller) {
                                    return GestureDetector(
                                      onTap: () =>
                                          controller.whatsAppNumber != null &&
                                                  !controller.Isloading &&
                                                  controller.whatsAppNumber!
                                                      .isNotEmpty
                                              ? launchLink(
                                                  url:
                                                      "${controller.whatsAppNumber}",
                                                  type: LinkType.phone,
                                                  context: context,
                                                )
                                              : null,
                                      child: Text(
                                          "${controller.Isloading ? "No Phone Number yet".tr : controller.whatsAppNumber != null && controller.whatsAppNumber!.isNotEmpty ? controller.whatsAppNumber : "No Phone Number yet".tr}",
                                          style: Get.theme.textTheme.bodyMedium!
                                              .copyWith(
                                                  fontSize: 14,
                                                  color: Colors.white)),
                                    );
                                  }),
                                  const SizedBox(
                                    width: 8,
                                  ),
                                  Container(
                                      decoration: const BoxDecoration(
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(50)),
                                          color: Colors.white),
                                      height: 30,
                                      width: 30,
                                      child: Icon(
                                        Icons.call,
                                        color: Get.theme.primaryColor,
                                        size: 16,
                                      )),
                                ],
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              Row(
                                children: [
                                  GetBuilder<Homescreencontroller>(
                                      builder: (controller) {
                                    return GestureDetector(
                                      onTap: () => controller.email != null &&
                                              !controller.Isloading &&
                                              controller.email!.isNotEmpty
                                          ? launchLink(
                                              url: "${controller.email}",
                                              type: LinkType.email,
                                              context: context,
                                            )
                                          : null,
                                      child: Text(
                                          "${controller.Isloading ? "No Email yet".tr : controller.email != null && controller.email!.isNotEmpty ? controller.email : "No Email yet".tr}",
                                          style: Get.theme.textTheme.bodyMedium!
                                              .copyWith(
                                                  fontSize: 16,
                                                  color: Colors.white)),
                                    );
                                  }),
                                  const SizedBox(
                                    width: 8,
                                  ),
                                  Container(
                                      decoration: const BoxDecoration(
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(50)),
                                          color: Colors.white),
                                      height: 30,
                                      width: 30,
                                      child: Icon(
                                        Icons.mail,
                                        color: Get.theme.primaryColor,
                                        size: 18,
                                      )),
                                ],
                              ),
                            ],
                          )
                        ],
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                Directionality(
                  textDirection: Get.find<LocalizationController>()
                              .currentLocale
                              .value
                              .languageCode ==
                          'ar'
                      ? TextDirection.rtl
                      : TextDirection.ltr,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Icon(
                        Icons.location_on_rounded,
                        color: Colors.white,
                        size: 20,
                      ),
                      const SizedBox(
                        width: 15,
                      ),
                      GetBuilder<Homescreencontroller>(builder: (controller) {
                        return Text(
                            "${!controller.Isloading ? controller.address != null && controller.address != "" || controller.address!.isNotEmpty ? IsArabic ? controller.address : controller.enAddress : "No Address yet".tr : "No Address yet".tr}",
                            style: Get.theme.textTheme.bodyMedium!
                                .copyWith(fontSize: 16, color: Colors.white));
                      }),
                    ],
                  ),
                ),
                Directionality(
                  textDirection: Get.find<LocalizationController>()
                              .currentLocale
                              .value
                              .languageCode ==
                          'ar'
                      ? TextDirection.rtl
                      : TextDirection.ltr,
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: 8.0),
                    child: Row(
                      spacing: 8.0,
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const Icon(
                          Icons.copyright_outlined,
                          color: Colors.white,
                          size: 18,
                        ),
                        Text("All Rights reserved. Copyright".tr,
                            style: Get.theme.textTheme.bodyMedium!
                                .copyWith(fontSize: 16, color: Colors.white)),
                      ],
                    ),
                  ),
                ),
                Directionality(
                  textDirection: Get.find<LocalizationController>()
                              .currentLocale
                              .value
                              .languageCode ==
                          'ar'
                      ? TextDirection.rtl
                      : TextDirection.ltr,
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: 8.0),
                    child: GestureDetector(
                      onTap: () {
                        Get.dialog(VMSPolicyAlertDialog(
                          contents: Container(
                            width: 800,
                            height: 600,
                            child: Column(
                              spacing: 20.0,
                              children: [
                                SvgPicture.asset(
                                  "assets/images/logolight.svg",
                                  height: 60,
                                  width: 60,
                                ),
                                Privacy_Policy()
                              ],
                            ),
                          ),
                          apptitle: "Privacy Policy".tr,
                        ));
                      },
                      child: Row(
                        spacing: 8.0,
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const Icon(
                            Icons.privacy_tip_outlined,
                            color: Colors.white,
                            size: 18,
                          ),
                          Text("Privacy Policy".tr,
                              style: Get.theme.textTheme.bodyMedium!
                                  .copyWith(fontSize: 16, color: Colors.white)),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
            mobileScreen: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  child: Column(
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("Openning Hours".tr,
                              style: Get.theme.textTheme.bodyMedium!
                                  .copyWith(fontSize: 16, color: Colors.white)),
                          const SizedBox(
                            height: 5,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Directionality(
                                textDirection:
                                    Get.find<LocalizationController>()
                                                .currentLocale
                                                .value
                                                .languageCode ==
                                            'ar'
                                        ? TextDirection.rtl
                                        : TextDirection.ltr,
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    GetBuilder<Homescreencontroller>(
                                        builder: (controller) {
                                      return Text(
                                          "${_formatTime(controller.morningShiftStartHours)} -----> ${_formatTime(controller.morningClosingHours)}",
                                          style: Get.theme.textTheme.bodyMedium!
                                              .copyWith(
                                                  fontSize: 16,
                                                  color: Colors.white));
                                    }),
                                    const SizedBox(
                                      width: 5,
                                    ),
                                    Image.asset(
                                      "assets/images/time-icon.png",
                                      height: 20,
                                      width: 20,
                                    ),
                                  ],
                                ),
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              Directionality(
                                textDirection:
                                    Get.find<LocalizationController>()
                                                .currentLocale
                                                .value
                                                .languageCode ==
                                            'ar'
                                        ? TextDirection.rtl
                                        : TextDirection.ltr,
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    GetBuilder<Homescreencontroller>(
                                        builder: (controller) {
                                      return Text(
                                          "${_formatTime(controller.eveningShiftStartHours)} -----> ${_formatTime(controller.eveningClosingHours)}",
                                          style: Get.theme.textTheme.bodyMedium!
                                              .copyWith(
                                                  fontSize: 16,
                                                  color: Colors.white));
                                    }),
                                    const SizedBox(
                                      width: 5,
                                    ),
                                    Image.asset(
                                      "assets/images/time-icon.png",
                                      height: 20,
                                      width: 20,
                                    ),
                                  ],
                                ),
                              )
                            ],
                          ),
                        ],
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(top: 20.0),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text("Contact Details".tr,
                                    style: Get.theme.textTheme.bodyMedium!
                                        .copyWith(
                                            fontSize: 16, color: Colors.white)),
                              ],
                            ),
                          ),
                          const SizedBox(
                            height: 8,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  GetBuilder<Homescreencontroller>(
                                      builder: (controller) {
                                    return GestureDetector(
                                      onTap: () => controller.phonNumber !=
                                                  null &&
                                              !controller.Isloading &&
                                              controller.phonNumber!.isNotEmpty
                                          ? launchLink(
                                              url: "${controller.phonNumber}",
                                              type: LinkType.phone,
                                              context: context,
                                            )
                                          : null,
                                      child: Text(
                                          "${controller.Isloading ? "No Phone Number yet".tr : controller.phonNumber != null && controller.phonNumber!.isNotEmpty ? controller.phonNumber : "No Phone Number yet".tr}",
                                          style: Get.theme.textTheme.bodyMedium!
                                              .copyWith(
                                                  fontSize: 14,
                                                  color: Colors.white)),
                                    );
                                  }),
                                  const SizedBox(
                                    width: 8,
                                  ),
                                  Container(
                                      decoration: const BoxDecoration(
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(50)),
                                          color: Colors.white),
                                      height: 30,
                                      width: 30,
                                      child: Icon(
                                        Icons.call,
                                        color: Get.theme.primaryColor,
                                        size: 16,
                                      )),
                                ],
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  GetBuilder<Homescreencontroller>(
                                      builder: (controller) {
                                    return GestureDetector(
                                      onTap: () =>
                                          controller.whatsAppNumber != null &&
                                                  !controller.Isloading &&
                                                  controller.whatsAppNumber!
                                                      .isNotEmpty
                                              ? launchLink(
                                                  url:
                                                      "${controller.whatsAppNumber}",
                                                  type: LinkType.phone,
                                                  context: context,
                                                )
                                              : null,
                                      child: Text(
                                          "${controller.Isloading ? "No Phone Number yet".tr : controller.whatsAppNumber != null && controller.whatsAppNumber!.isNotEmpty ? controller.whatsAppNumber : "No Phone Number yet".tr}",
                                          style: Get.theme.textTheme.bodyMedium!
                                              .copyWith(
                                                  fontSize: 14,
                                                  color: Colors.white)),
                                    );
                                  }),
                                  const SizedBox(
                                    width: 8,
                                  ),
                                  Container(
                                      decoration: const BoxDecoration(
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(50)),
                                          color: Colors.white),
                                      height: 30,
                                      width: 30,
                                      child: Icon(
                                        Icons.call,
                                        color: Get.theme.primaryColor,
                                        size: 16,
                                      )),
                                ],
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  GetBuilder<Homescreencontroller>(
                                      builder: (controller) {
                                    return GestureDetector(
                                      onTap: () => controller.email != null &&
                                              !controller.Isloading &&
                                              controller.email!.isNotEmpty
                                          ? launchLink(
                                              url: "${controller.email}",
                                              type: LinkType.email,
                                              context: context,
                                            )
                                          : null,
                                      child: Text(
                                          "${controller.Isloading ? "No Email yet".tr : controller.email != null && controller.email!.isNotEmpty ? controller.email : "No Email yet".tr}",
                                          style: Get.theme.textTheme.bodyMedium!
                                              .copyWith(
                                                  fontSize: 16,
                                                  color: Colors.white)),
                                    );
                                  }),
                                  const SizedBox(
                                    width: 8,
                                  ),
                                  Container(
                                      decoration: const BoxDecoration(
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(50)),
                                          color: Colors.white),
                                      height: 30,
                                      width: 30,
                                      child: Icon(
                                        Icons.mail,
                                        color: Get.theme.primaryColor,
                                        size: 16,
                                      )),
                                ],
                              ),
                            ],
                          )
                        ],
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                Container(
                  padding: EdgeInsets.only(right: 20.0, left: 20.0),
                  width: MediaQuery.of(context).size.width,
                  child: Directionality(
                    textDirection: Get.find<LocalizationController>()
                                .currentLocale
                                .value
                                .languageCode ==
                            'ar'
                        ? TextDirection.rtl
                        : TextDirection.ltr,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Icon(
                          Icons.location_on_rounded,
                          color: Colors.white,
                          size: 16,
                        ),
                        Expanded(
                          child: GetBuilder<Homescreencontroller>(
                              builder: (controller) {
                            return Text(
                                textAlign: TextAlign.center,
                                maxLines: 3,
                                "${!controller.Isloading ? controller.address != null && controller.address != "" || controller.address!.isNotEmpty ? IsArabic ? controller.address : controller.enAddress : "No Address yet".tr : "No Address yet".tr}",
                                style: Get.theme.textTheme.bodyMedium!.copyWith(
                                    fontSize: 16, color: Colors.white));
                          }),
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 25.0, bottom: 25.0),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      GetBuilder<Homescreencontroller>(builder: (controller) {
                        return GestureDetector(
                          onTap: () => controller.urlYoutube != null &&
                                  !controller.Isloading &&
                                  controller.urlYoutube!.isNotEmpty
                              ? launchLink(
                                  url: "${controller.urlYoutube}",
                                  type: LinkType.youtube,
                                  context: context,
                                )
                              : null,
                          child: Image.asset(
                            "assets/images/youtube-icon.png",
                            width: 40,
                            height: 40,
                          ),
                        );
                      }),
                      const SizedBox(
                        width: 5,
                      ),
                      GetBuilder<Homescreencontroller>(builder: (controller) {
                        return GestureDetector(
                          onTap: () => controller.urlFaceBook != null &&
                                  !controller.Isloading &&
                                  controller.urlFaceBook!.isNotEmpty
                              ? launchLink(
                                  url: "${controller.urlFaceBook}",
                                  type: LinkType.facebook,
                                  context: context,
                                )
                              : null,
                          child: Image.asset(
                            "assets/images/facebook-icon.png",
                            width: 40,
                            height: 40,
                          ),
                        );
                      }),
                    ],
                  ),
                ),
                Directionality(
                  textDirection: Get.find<LocalizationController>()
                              .currentLocale
                              .value
                              .languageCode ==
                          'ar'
                      ? TextDirection.rtl
                      : TextDirection.ltr,
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: 8.0),
                    child: Row(
                      spacing: 8.0,
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const Icon(
                          Icons.copyright_outlined,
                          color: Colors.white,
                          size: 18,
                        ),
                        Text("All Rights reserved. Copyright".tr,
                            style: Get.theme.textTheme.bodyMedium!
                                .copyWith(fontSize: 16, color: Colors.white)),
                      ],
                    ),
                  ),
                ),
                Directionality(
                  textDirection: Get.find<LocalizationController>()
                              .currentLocale
                              .value
                              .languageCode ==
                          'ar'
                      ? TextDirection.rtl
                      : TextDirection.ltr,
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: 8.0),
                    child: GestureDetector(
                      onTap: () {
                        Get.dialog(VMSPolicyAlertDialog(
                          contents: Container(
                            width: 800,
                            height: 600,
                            child: Column(
                              spacing: 20.0,
                              children: [
                                SvgPicture.asset(
                                  "assets/images/logolight.svg",
                                  height: 60,
                                  width: 60,
                                ),
                                Privacy_Policy()
                              ],
                            ),
                          ),
                          apptitle: "Privacy Policy".tr,
                        ));
                      },
                      child: Row(
                        spacing: 8.0,
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const Icon(
                            Icons.privacy_tip_outlined,
                            color: Colors.white,
                            size: 18,
                          ),
                          Text("Privacy Policy".tr,
                              style: Get.theme.textTheme.bodyMedium!
                                  .copyWith(fontSize: 16, color: Colors.white)),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

String _formatTime(String? time) {
  if (time == null || time.isEmpty) return "No Time yet".tr;

  final upperTime = time.toUpperCase();
  final isAm = upperTime.contains("AM");
  final isPm = upperTime.contains("PM");

  final timePart =
      time.replaceAll(RegExp(r'AM|PM', caseSensitive: false), '').trim();

  final period = isAm
      ? "AM".tr
      : isPm
          ? "PM".tr
          : "";

  return "$timePart $period";
}

class Privacy_Policy extends StatelessWidget {
  const Privacy_Policy({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(left: 15.0, right: 15.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Privacy Policy of Virtual Modern School E-portal 2023".tr,
                  style: Get.theme.textTheme.bodyMedium!
                      .copyWith(fontSize: 14, fontWeight: FontWeight.bold)),
              Text(
                  "The primary purpose of this policy is to state the user rights and responsibilities of Virtual Modern School e-portal."
                      .tr,
                  style:
                      Get.theme.textTheme.bodyMedium!.copyWith(fontSize: 14)),
              Padding(
                padding: const EdgeInsets.only(top: 15.0),
                child: Text("Overview:".tr,
                    style: Get.theme.textTheme.bodyMedium!
                        .copyWith(fontSize: 14, fontWeight: FontWeight.bold)),
              ),
              Text(
                  "The privacy policy stated below is considered a part of the terms for using the e-portal of Virtual Modern School (VMS)."
                      .tr,
                  style:
                      Get.theme.textTheme.bodyMedium!.copyWith(fontSize: 14)),
              Text(
                  "This website does not collect your personal information when you visit the website without your consent. In case you opt to offer your personal information to us, they will be only used to provide you with the services or information you required from VMS. By using this website, you agree to all terms of this privacy policy. All the information obtained from your side might be revealed to Syrian government sectors, if required, to process your request, without reference to any party."
                      .tr,
                  style:
                      Get.theme.textTheme.bodyMedium!.copyWith(fontSize: 14)),
              Text(
                  "VMS reserves the right to make any minor or major amendments to the terms of the privacy policy when necessary without any prior notification. VMS also has the right to take the necessary measures to protect the data on the website from any loss, misuse or change without a guarantee that your usage is confidential and consequently shall not be held accountable for any harm that you or any party may experience as a result of violating the confidentiality policy."
                      .tr,
                  style:
                      Get.theme.textTheme.bodyMedium!.copyWith(fontSize: 14)),
              Text(
                  "The website also implements very precise measures to protect information from any loss, misuse or change. In addition, VMS cannot ensure the confidentiality when using the website; and therefore cannot be held accountable for any harm caused."
                      .tr,
                  style:
                      Get.theme.textTheme.bodyMedium!.copyWith(fontSize: 14)),
              Text(
                  "This is governed by the law in force in Syrian Arab Republic. Each party irrevocably and unconditionally submits to the exclusive jurisdiction of the courts of Syrian Arab Republic and courts of appeal from them for determining any dispute concerning this policy."
                      .tr,
                  style:
                      Get.theme.textTheme.bodyMedium!.copyWith(fontSize: 14)),
              Padding(
                padding: const EdgeInsets.only(top: 15.0),
                child: Text("Intellectual Property Rights".tr,
                    style: Get.theme.textTheme.bodyMedium!
                        .copyWith(fontSize: 14, fontWeight: FontWeight.bold)),
              ),
              Text(
                  "Any published material on VMS e-portal and all related pages including (texts, photos, graphics, applications, designs, files, etc.) is subsumed under the category of intellectual property rights. It is prohibited to publish any content on VMS e-portal that may violate the intellectual property rights of any sector or individual."
                      .tr,
                  style:
                      Get.theme.textTheme.bodyMedium!.copyWith(fontSize: 14)),
              Text(
                  "A written consent, from the E-portal Unit, is compulsory for the general usage of the materials published on the school e-portal; except what are stipulated by the Syrian Intellectual Property Law and this policy."
                      .tr,
                  style:
                      Get.theme.textTheme.bodyMedium!.copyWith(fontSize: 14)),
              Padding(
                padding: const EdgeInsets.only(top: 15.0),
                child: Text("Use Policy:".tr,
                    style: Get.theme.textTheme.bodyMedium!
                        .copyWith(fontSize: 14, fontWeight: FontWeight.bold)),
              ),
              Text(
                  "The e-portal of VMS including all information and materials published is managed by the E-portal unit. By using the VMS e-portal, the user has accepted all the listed provisions of use policy in this privacy policy."
                      .tr,
                  style:
                      Get.theme.textTheme.bodyMedium!.copyWith(fontSize: 14)),
              Text(
                  "The E-portal Unit reserves the right to change the use policy when necessary without prior notifications."
                      .tr,
                  style:
                      Get.theme.textTheme.bodyMedium!.copyWith(fontSize: 14)),
              Text(
                  "In situations as such, the Unit may provide notifications via the e-portal of VMS to ensure that users are fully aware of such changes. The user is obligated to review the use and privacy policy in every time the website or the sub-pages are accessed, including all administrations, school members etc."
                      .tr,
                  style:
                      Get.theme.textTheme.bodyMedium!.copyWith(fontSize: 14)),
              Padding(
                padding: const EdgeInsets.only(top: 15.0),
                child: Text("1. Changes in e-portal and disclaimer:".tr,
                    style: Get.theme.textTheme.bodyMedium!
                        .copyWith(fontSize: 14, fontWeight: FontWeight.bold)),
              ),
              Text(
                  "The E-portal Unit reserves the right to change the contents of any of the school websites when necessary and without any prior notification. The E-portal Unit shows a great deal of concern to ensure that all information published on all website are accurate; however, it cannot, by any means, provide any sort of guarantee with regard to the preciseness of the content (including any text, graphics, advertisement, URL links, etc.)."
                      .tr,
                  style:
                      Get.theme.textTheme.bodyMedium!.copyWith(fontSize: 14)),
              Padding(
                padding: const EdgeInsets.only(top: 15.0),
                child: Text(
                    "2. Outage and slow connection in e-portal of VMS:".tr,
                    style: Get.theme.textTheme.bodyMedium!
                        .copyWith(fontSize: 14, fontWeight: FontWeight.bold)),
              ),
              Text(
                  "The E-portal Unit shows a great deal of concern to ensure that the e-portal is working; however, the internet is not always stable, which may cause errors, outage or delay. In such cases, the E-portal Unit is not responsible and shall not be held accountable for operating the network inside and outside the school."
                      .tr,
                  style:
                      Get.theme.textTheme.bodyMedium!.copyWith(fontSize: 14)),
              Padding(
                padding: const EdgeInsets.only(top: 15.0),
                child: Text("3. URLs of other websites:".tr,
                    style: Get.theme.textTheme.bodyMedium!
                        .copyWith(fontSize: 14, fontWeight: FontWeight.bold)),
              ),
              Text(
                  "All the URLs of websites or topics that are not related to VMS e-portal are checked for their suitability by e-portal unit, which has the right to modify or remove them in accordance with this policy. The E-portal Unit at VMS is not responsible or liable by any means for the content of these URLs."
                      .tr,
                  style:
                      Get.theme.textTheme.bodyMedium!.copyWith(fontSize: 14)),
              Padding(
                padding: const EdgeInsets.only(top: 15.0),
                child: Text("4. Privacy:".tr,
                    style: Get.theme.textTheme.bodyMedium!
                        .copyWith(fontSize: 14, fontWeight: FontWeight.bold)),
              ),
              Text(
                  "The E-portal Unit is committed to protect the privacy of all VMS e-portal users. The privacy policy organizes all web-pages of VMS."
                      .tr,
                  style:
                      Get.theme.textTheme.bodyMedium!.copyWith(fontSize: 14)),
              Padding(
                padding: const EdgeInsets.only(top: 15.0),
                child: Text(
                    "5. Appointment of supervisors and Permission Grant:".tr,
                    style: Get.theme.textTheme.bodyMedium!
                        .copyWith(fontSize: 14, fontWeight: FontWeight.bold)),
              ),
              Text(
                  "a. Every sector at the school is entitled to appoint a supervisor, one or more, provided the main supervisor has an excellent command in Arabic language. All the supervisors are eligible to obtain a username and password and, they shall be fully responsible for the content of their website."
                      .tr,
                  style:
                      Get.theme.textTheme.bodyMedium!.copyWith(fontSize: 14)),
              Text(
                  "b. The supervisor of the website is the only one who is eligible to retrieve the password from the E-portal Unit."
                      .tr,
                  style:
                      Get.theme.textTheme.bodyMedium!.copyWith(fontSize: 14)),
              Text(
                  "c. When a supervisor is appointed or changed, the E-portal Unit must be officially informed. In case the supervisor has not accessed the control panel for one month, the E-portal Unit has the right to deactivate the user of the supervisor."
                      .tr,
                  style:
                      Get.theme.textTheme.bodyMedium!.copyWith(fontSize: 14)),
              Text(
                  "d. The supervisor is fully responsible for the username and password of the website that should not be shared with others. The E-portal Unit reserves the right to de-activate the user of any supervisor who shares his/her username with another supervisor or anyone else."
                      .tr,
                  style:
                      Get.theme.textTheme.bodyMedium!.copyWith(fontSize: 14)),
              Text(
                  "e. Any department that appoints a supervisor must guarantee that the supervisor shall work minimally for 3 months as a supervisor."
                      .tr,
                  style:
                      Get.theme.textTheme.bodyMedium!.copyWith(fontSize: 14)),
              Text(
                  "f. In cases of none compliance with the policy of supervisor appointment and permission grant, the E-portal Unit reserves the right to take the necessary measure against action."
                      .tr,
                  style:
                      Get.theme.textTheme.bodyMedium!.copyWith(fontSize: 14)),
              Padding(
                padding: const EdgeInsets.only(top: 15.0),
                child: Text("6. Training Policy:".tr,
                    style: Get.theme.textTheme.bodyMedium!
                        .copyWith(fontSize: 14, fontWeight: FontWeight.bold)),
              ),
              Text(
                  "- The E-portal Unit conducts training courses, if necessary, to supervisors on how to manage the website."
                      .tr,
                  style:
                      Get.theme.textTheme.bodyMedium!.copyWith(fontSize: 14)),
              Text(
                  "- Any department that has a website related to VMS e-portal has the right to require the necessary training. The request should be made in coordination with the E-portal Unit."
                      .tr,
                  style:
                      Get.theme.textTheme.bodyMedium!.copyWith(fontSize: 14)),
              Padding(
                padding: const EdgeInsets.only(top: 15.0),
                child: Text("7. Information Security Policy:".tr,
                    style: Get.theme.textTheme.bodyMedium!
                        .copyWith(fontSize: 14, fontWeight: FontWeight.bold)),
              ),
              Text(
                  "a. The E-portal Unit employs procedural and technical measures to secure the personal information from loss, theft via encrypting them. The E-portal Unit also considers the data as properties that must be protected from loss or being accessed by unauthorized individuals."
                      .tr,
                  style:
                      Get.theme.textTheme.bodyMedium!.copyWith(fontSize: 14)),
              Text(
                  "b. Should VMS e-portal happened to be subjected to any harm, the necessary measures shall be taken according to the Combating Cyber Crime."
                      .tr,
                  style:
                      Get.theme.textTheme.bodyMedium!.copyWith(fontSize: 14)),
              Text(
                  "c. In the case of a potential security threat to VMS e-portal or e-services, the Unit of E-portal has the right to take all necessary precautionary measures."
                      .tr,
                  style:
                      Get.theme.textTheme.bodyMedium!.copyWith(fontSize: 14)),
              Padding(
                padding: const EdgeInsets.only(top: 15.0),
                child: Text("8. Publishing Policy:".tr,
                    style: Get.theme.textTheme.bodyMedium!
                        .copyWith(fontSize: 14, fontWeight: FontWeight.bold)),
              ),
              Text(
                  "VMS E-portal is considered to be the official media interface that represents all employees of the school, and thus the e-portal should be used in a proper way that benefits the school employees and departments. It also should not be misused by any means that may subject the school employees to any legal liability. Thus, the publishing policy must be followed and all contents posted on the E-portal should be translated into English and vice versa."
                      .tr,
                  style:
                      Get.theme.textTheme.bodyMedium!.copyWith(fontSize: 14)),
              Padding(
                padding: const EdgeInsets.only(top: 15.0),
                child: Text(
                    "    Published news by all school units must meet the following requirements:"
                        .tr,
                    style: Get.theme.textTheme.bodyMedium!
                        .copyWith(fontSize: 14, fontWeight: FontWeight.bold)),
              ),
              Text(
                  "1.    The content of the news (meeting, ceremony, workshop, etc.) must be a timeliness."
                      .tr,
                  style:
                      Get.theme.textTheme.bodyMedium!.copyWith(fontSize: 14)),
              Text("2.    The headline should match the news content.".tr,
                  style:
                      Get.theme.textTheme.bodyMedium!.copyWith(fontSize: 14)),
              Text("3.     The news should include one of the following:".tr,
                  style:
                      Get.theme.textTheme.bodyMedium!.copyWith(fontSize: 14)),
              Text(
                  "A.    Highlight an activity or achievement for the school or administration."
                      .tr,
                  style:
                      Get.theme.textTheme.bodyMedium!.copyWith(fontSize: 14)),
              Text(
                  "B.    Invite readers to contribute or benefit from a particular service."
                      .tr,
                  style:
                      Get.theme.textTheme.bodyMedium!.copyWith(fontSize: 14)),
              Text(
                  "C.    Comprise all necessary elements of good news stories."
                      .tr,
                  style:
                      Get.theme.textTheme.bodyMedium!.copyWith(fontSize: 14)),
              Text("D.    Be a real news story which occurred.".tr,
                  style:
                      Get.theme.textTheme.bodyMedium!.copyWith(fontSize: 14)),
              Text(
                  "E.    Attract a large number of people inside and outside the school."
                      .tr,
                  style:
                      Get.theme.textTheme.bodyMedium!.copyWith(fontSize: 14)),
              Text(
                  "F.    Written by simple and succinct language and free of unfamiliar terms."
                      .tr,
                  style:
                      Get.theme.textTheme.bodyMedium!.copyWith(fontSize: 14)),
              Text(
                  "G.    Follow the structure of writing a news (lead, facts or information of story, background, conclusion)."
                      .tr,
                  style:
                      Get.theme.textTheme.bodyMedium!.copyWith(fontSize: 14)),
              Text("H.    Personal news should be avoided.".tr,
                  style:
                      Get.theme.textTheme.bodyMedium!.copyWith(fontSize: 14)),
              Text(
                  "I.    News linked to sectors outside the school should obtain approval from concerned sectors at VMS."
                      .tr,
                  style:
                      Get.theme.textTheme.bodyMedium!.copyWith(fontSize: 14)),
              Text(
                  "J.    The news should be edited and proofread before publishing."
                      .tr,
                  style:
                      Get.theme.textTheme.bodyMedium!.copyWith(fontSize: 14)),
              Text(
                  "    Published news with photos should fulfill the following requirements:"
                      .tr,
                  style:
                      Get.theme.textTheme.bodyMedium!.copyWith(fontSize: 14)),
              Text(
                  "A.    The size of photos should be as stated by the unit of Information Technology."
                      .tr,
                  style:
                      Get.theme.textTheme.bodyMedium!.copyWith(fontSize: 14)),
              Text("B.    Clarity of photo.".tr,
                  style:
                      Get.theme.textTheme.bodyMedium!.copyWith(fontSize: 14)),
              Text(
                  "C.    Photos should not be offensive or violate the school policy."
                      .tr,
                  style:
                      Get.theme.textTheme.bodyMedium!.copyWith(fontSize: 14)),
              Text(
                  "D.    Figures’ pose and appearance should be appropriate in photos."
                      .tr,
                  style:
                      Get.theme.textTheme.bodyMedium!.copyWith(fontSize: 14)),
              Text(
                  "E.    Leaders and flags in photos should appear in proper way."
                      .tr,
                  style:
                      Get.theme.textTheme.bodyMedium!.copyWith(fontSize: 14)),
              Padding(
                padding: const EdgeInsets.only(top: 15.0),
                child: Text("9. Publishing Copyrights:".tr,
                    style: Get.theme.textTheme.bodyMedium!
                        .copyWith(fontSize: 14, fontWeight: FontWeight.bold)),
              ),
              Text(
                  "All published materials on VMS e-portal must comply with the publishing copyrights and publishing policy of the school and this includes:"
                      .tr,
                  style:
                      Get.theme.textTheme.bodyMedium!.copyWith(fontSize: 14)),
              Text(
                  "- Published journals in scientific conferences and scientific journals."
                      .tr,
                  style:
                      Get.theme.textTheme.bodyMedium!.copyWith(fontSize: 14)),
              Text("- Books and publications in electronic format".tr,
                  style:
                      Get.theme.textTheme.bodyMedium!.copyWith(fontSize: 14)),
              Text(
                  "- All e-materials that violate the intellectual property rights."
                      .tr,
                  style:
                      Get.theme.textTheme.bodyMedium!.copyWith(fontSize: 14)),
              Padding(
                padding: const EdgeInsets.only(top: 15.0),
                child: Text("10. Inappropriate Content:".tr,
                    style: Get.theme.textTheme.bodyMedium!
                        .copyWith(fontSize: 14, fontWeight: FontWeight.bold)),
              ),
              Text(
                  "The inappropriate content may include, but not exclusive to:"
                      .tr,
                  style:
                      Get.theme.textTheme.bodyMedium!.copyWith(fontSize: 14)),
              Text(
                  "a. Any text, photo or idea that implies any racism or offense."
                      .tr,
                  style:
                      Get.theme.textTheme.bodyMedium!.copyWith(fontSize: 14)),
              Text(
                  "b. Any text, photo or idea that may violate the regulations of the state, the school or the social norms."
                      .tr,
                  style:
                      Get.theme.textTheme.bodyMedium!.copyWith(fontSize: 14)),
              Text("c. Any violation to the privacy of others by any means".tr,
                  style:
                      Get.theme.textTheme.bodyMedium!.copyWith(fontSize: 14)),
              Text(
                  "d. The language of the content should be free of mistakes. The E-portal Unit reserves the right to review the content and take action against inappropriate contents."
                      .tr,
                  style:
                      Get.theme.textTheme.bodyMedium!.copyWith(fontSize: 14)),
              Padding(
                padding: const EdgeInsets.only(top: 15.0),
                child: Text("11. Update the information:".tr,
                    style: Get.theme.textTheme.bodyMedium!
                        .copyWith(fontSize: 14, fontWeight: FontWeight.bold)),
              ),
              Text(
                  "The content of the web-pages must be updated including news, contact information, phone numbers, e-mails, description of materials etc."
                      .tr,
                  style:
                      Get.theme.textTheme.bodyMedium!.copyWith(fontSize: 14)),
              Padding(
                padding: const EdgeInsets.only(top: 15.0),
                child: Text("12. Change of the E-portal Unit Policy".tr,
                    style: Get.theme.textTheme.bodyMedium!
                        .copyWith(fontSize: 14, fontWeight: FontWeight.bold)),
              ),
              Text(
                  "The E-portal Unit reserves the full right to amend this policy when necessary without any prior notification. This policy is available via the e-portal of VMS (at the bottom of main page)."
                      .tr,
                  style:
                      Get.theme.textTheme.bodyMedium!.copyWith(fontSize: 14)),
              Padding(
                padding: const EdgeInsets.only(top: 15.0),
                child: Text("13. Disclaimer".tr,
                    style: Get.theme.textTheme.bodyMedium!
                        .copyWith(fontSize: 14, fontWeight: FontWeight.bold)),
              ),
              Text(
                  "The E-portal Unit makes every effort to achieve the highest level of quality and accuracy with VMS e-portal, however, the Unit shall not bear any responsibility or liability for violating this policy."
                      .tr,
                  style:
                      Get.theme.textTheme.bodyMedium!.copyWith(fontSize: 14)),
              Padding(
                padding: const EdgeInsets.only(top: 25.0),
                child: Center(
                  child: Text("Virtual Modern School".tr,
                      style: Get.theme.textTheme.bodyMedium!
                          .copyWith(fontSize: 22)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
