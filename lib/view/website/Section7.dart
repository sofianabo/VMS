import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:get/get.dart';
import 'package:vms_school/Translate/local_controller.dart';
import 'package:vms_school/main.dart';
import 'package:vms_school/widgets/Responsive.dart';

class Section7 extends StatelessWidget {
  const Section7({super.key});

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
                              Row(
                                children: [
                                  Text("8 AM -----> 1 PM".tr,
                                      style: Get.theme.textTheme.bodyMedium!
                                          .copyWith(
                                              fontSize: 16,
                                              color: Colors.white)),
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
                              const SizedBox(
                                height: 20,
                              ),
                              Row(
                                children: [
                                  Text("3 PM -----> 8 PM".tr,
                                      style: Get.theme.textTheme.bodyMedium!
                                          .copyWith(
                                              fontSize: 16,
                                              color: Colors.white)),
                                  const SizedBox(
                                    width: 5,
                                  ),
                                  Image.asset(
                                    "assets/images/time-icon.png",
                                    height: 20,
                                    width: 20,
                                  ),
                                ],
                              )
                            ],
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Row(
                            children: [
                              Image.asset(
                                "assets/images/youtube-icon.png",
                                width: 40,
                                height: 40,
                              ),
                              const SizedBox(
                                width: 5,
                              ),
                              Image.asset(
                                "assets/images/facebook-icon.png",
                                width: 40,
                                height: 40,
                              ),
                              const SizedBox(
                                width: 5,
                              ),
                              Image.asset(
                                "assets/images/linkedin-icon.png",
                                width: 40,
                                height: 40,
                              ),
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
                                  Text("SYR: 00963 994 005157",
                                      style: Get.theme.textTheme.bodyMedium!
                                          .copyWith(
                                              fontSize: 14,
                                              color: Colors.white)),
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
                                  Text("USA: 001 817 583 0666",
                                      style: Get.theme.textTheme.bodyMedium!
                                          .copyWith(
                                              fontSize: 14,
                                              color: Colors.white)),
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
                                  Text("virtualmodernschoolmedia@gmail.com",
                                      style: Get.theme.textTheme.bodyMedium!
                                          .copyWith(
                                              fontSize: 14,
                                              color: Colors.white)),
                                  const SizedBox(
                                    width: 8,
                                  ),
                                  Container(
                                      decoration: const BoxDecoration(
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(50)),
                                          color: Colors.white),
                                      height: 20,
                                      width: 20,
                                      child: Icon(
                                        Icons.mail,
                                        color: Get.theme.primaryColor,
                                        size: 14,
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
                  textDirection: prefs!.getString(languageKey) == 'ar'
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
                      Text(
                          "Shakib Arslan Street - Engineers Syndicate Building - 2nd Floor - AlSuwaidaa - Syria"
                              .tr,
                          style: Get.theme.textTheme.bodyMedium!
                              .copyWith(fontSize: 16, color: Colors.white)),
                    ],
                  ),
                ),
                Directionality(
                  textDirection: prefs!.getString(languageKey) == 'ar'
                      ? TextDirection.rtl
                      : TextDirection.ltr,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Icon(
                        Icons.copyright_outlined,
                        color: Colors.white,
                        size: 20,
                      ),
                      const SizedBox(
                        width: 3,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 10.0),
                        child: Text("All Rights reserved. Copyright".tr,
                            style: Get.theme.textTheme.bodyMedium!
                                .copyWith(fontSize: 16, color: Colors.white)),
                      ),
                    ],
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
                              Row(
                                children: [
                                  Text("8 AM -----> 1 PM".tr,
                                      style: Get.theme.textTheme.bodyMedium!
                                          .copyWith(
                                              fontSize: 16,
                                              color: Colors.white)),
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
                              const SizedBox(
                                height: 20,
                              ),
                              Row(
                                children: [
                                  Text("3 PM -----> 8 PM".tr,
                                      style: Get.theme.textTheme.bodyMedium!
                                          .copyWith(
                                              fontSize: 16,
                                              color: Colors.white)),
                                  const SizedBox(
                                    width: 5,
                                  ),
                                  Image.asset(
                                    "assets/images/time-icon.png",
                                    height: 20,
                                    width: 20,
                                  ),
                                ],
                              )
                            ],
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Row(
                            children: [
                              Image.asset(
                                "assets/images/youtube-icon.png",
                                width: 40,
                                height: 40,
                              ),
                              const SizedBox(
                                width: 5,
                              ),
                              Image.asset(
                                "assets/images/facebook-icon.png",
                                width: 40,
                                height: 40,
                              ),
                              const SizedBox(
                                width: 5,
                              ),
                              Image.asset(
                                "assets/images/linkedin-icon.png",
                                width: 40,
                                height: 40,
                              ),
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
                                  Text("SYR: 00963 994 005157",
                                      style: Get.theme.textTheme.bodyMedium!
                                          .copyWith(
                                              fontSize: 14,
                                              color: Colors.white)),
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
                                  Text("USA: 001 817 583 0666",
                                      style: Get.theme.textTheme.bodyMedium!
                                          .copyWith(
                                              fontSize: 14,
                                              color: Colors.white)),
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
                                  Text("virtualmodernschoolmedia@gmail.com",
                                      style: Get.theme.textTheme.bodyMedium!
                                          .copyWith(
                                              fontSize: 16,
                                              color: Colors.white)),
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
                Directionality(
                  textDirection: prefs!.getString(languageKey) == 'ar'
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
                      Text(
                          "Shakib Arslan Street - Engineers Syndicate Building - 2nd Floor - AlSuwaidaa - Syria"
                              .tr,
                          style: Get.theme.textTheme.bodyMedium!
                              .copyWith(fontSize: 16, color: Colors.white)),
                    ],
                  ),
                ),
                Directionality(
                  textDirection: prefs!.getString(languageKey) == 'ar'
                      ? TextDirection.rtl
                      : TextDirection.ltr,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Icon(
                        Icons.copyright_outlined,
                        color: Colors.white,
                        size: 20,
                      ),
                      const SizedBox(
                        width: 3,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 10.0),
                        child: Text("All Rights reserved. Copyright".tr,
                            style: Get.theme.textTheme.bodyMedium!
                                .copyWith(fontSize: 16, color: Colors.white)),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            mobileScreen: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  margin: const EdgeInsets.only(left: 50, right: 50),
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
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text("8 AM -----> 1 PM".tr,
                                      style: Get.theme.textTheme.bodyMedium!
                                          .copyWith(
                                              fontSize: 16,
                                              color: Colors.white)),
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
                              const SizedBox(
                                height: 20,
                              ),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text("3 PM -----> 8 PM".tr,
                                      style: Get.theme.textTheme.bodyMedium!
                                          .copyWith(
                                              fontSize: 16,
                                              color: Colors.white)),
                                  const SizedBox(
                                    width: 5,
                                  ),
                                  Image.asset(
                                    "assets/images/time-icon.png",
                                    height: 20,
                                    width: 20,
                                  ),
                                ],
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
                                  Text("SYR: 00963 994 005157",
                                      style: Get.theme.textTheme.bodyMedium!
                                          .copyWith(
                                              fontSize: 14,
                                              color: Colors.white)),
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
                                  Text("USA: 001 817 583 0666",
                                      style: Get.theme.textTheme.bodyMedium!
                                          .copyWith(
                                              fontSize: 14,
                                              color: Colors.white)),
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
                                  Text("virtualmodernschoolmedia@gmail.com",
                                      style: Get.theme.textTheme.bodyMedium!
                                          .copyWith(
                                              fontSize: 16,
                                              color: Colors.white)),
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
                    textDirection: prefs!.getString(languageKey) == 'ar'
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
                          child: Text(
                              textAlign: TextAlign.center,
                              maxLines: 3,
                              "Shakib Arslan Street - Engineers Syndicate Building - 2nd Floor - AlSuwaidaa - Syria"
                                  .tr,
                              style: Get.theme.textTheme.bodyMedium!
                                  .copyWith(fontSize: 16, color: Colors.white)),
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
                      Image.asset(
                        "assets/images/youtube-icon.png",
                        width: 40,
                        height: 40,
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      Image.asset(
                        "assets/images/facebook-icon.png",
                        width: 40,
                        height: 40,
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      Image.asset(
                        "assets/images/linkedin-icon.png",
                        width: 40,
                        height: 40,
                      ),
                    ],
                  ),
                ),
                Directionality(
                  textDirection: prefs!.getString(languageKey) == 'ar'
                      ? TextDirection.rtl
                      : TextDirection.ltr,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Icon(
                        Icons.copyright_outlined,
                        color: Colors.white,
                        size: 20,
                      ),
                      const SizedBox(
                        width: 3,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 10.0),
                        child: Text("All Rights reserved. Copyright".tr,
                            style: Get.theme.textTheme.bodyMedium!
                                .copyWith(fontSize: 16, color: Colors.white)),
                      ),
                    ],
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
