import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:get/get.dart';
import 'package:vms_school/Link/API/OpenURLs.dart';
import 'package:vms_school/Link/Controller/HomeController/HomeScreenController.dart';
import 'package:vms_school/Translate/local_controller.dart';
import 'package:vms_school/view/Both_Platform/widgets/Responsive.dart';

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
                                          "${!controller.Isloading ? controller.phonNumber != null || controller.phonNumber!.isNotEmpty ? "No Phone Number yet".tr : controller.phonNumber : "No Phone Number yet".tr}",
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
                                          "${!controller.Isloading ? controller.whatsAppNumber != null || controller.whatsAppNumber!.isNotEmpty ? "No Phone Number yet".tr : controller.whatsAppNumber : "No Phone Number yet".tr}",
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
                                          "${!controller.Isloading ? controller.email != null || controller.email!.isNotEmpty ? "No Email yet".tr : controller.email : "No Email yet".tr}",
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
                                          "${!controller.Isloading ? controller.phonNumber != null || controller.phonNumber!.isNotEmpty ? "No Phone Number yet".tr : controller.phonNumber : "No Phone Number yet".tr}",
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
                                          "${!controller.Isloading ? controller.whatsAppNumber != null || controller.whatsAppNumber!.isNotEmpty ? "No Phone Number yet".tr : controller.whatsAppNumber : "No Phone Number yet".tr}",
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
                                          "${!controller.Isloading ? controller.email != null || controller.email!.isNotEmpty ? "No Email yet".tr : controller.email : "No Email yet".tr}",
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
                                          "${!controller.Isloading ? controller.phonNumber != null || controller.phonNumber!.isNotEmpty ? "No Phone Number yet".tr : controller.phonNumber : "No Phone Number yet".tr}",
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
                                          "${!controller.Isloading ? controller.whatsAppNumber != null || controller.whatsAppNumber!.isNotEmpty ? "No Phone Number yet".tr : controller.whatsAppNumber : "No Phone Number yet".tr}",
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
                                          "${!controller.Isloading ? controller.email != null || controller.email!.isNotEmpty ? "No Email yet".tr : controller.email : "No Email yet".tr}",
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
