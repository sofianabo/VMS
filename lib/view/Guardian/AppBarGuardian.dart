import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:vms_school/Link/API/Guardians_API/Get_My_Data_API.dart';
import 'package:vms_school/main.dart';
import 'package:vms_school/view/Guardian/Profile_Screens/My_Profile.dart';
import 'package:vms_school/widgets/Responsive.dart';

class Appbarguardian extends StatefulWidget {
  Appbarguardian({super.key});

  @override
  State<Appbarguardian> createState() => _AppbarguardianState();
}

class _AppbarguardianState extends State<Appbarguardian> {
  TextEditingController serch = TextEditingController();

  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size.width;
    return Directionality(
        textDirection: TextDirection.rtl,
        child: ResponsiveUI(
          desktopScreen: Container(
            margin: const EdgeInsets.only(
                right: 60, left: 30, top: 15, bottom: 15.0),
            height: 77,
            child: Row(
              children: [
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    GestureDetector(
                      onTap: () {
                        Get_My_Data_API().Get_My_Data();
                        Get.dialog(ProfileDialog());
                      },
                      child: Container(
                        height: 40,
                        width: 200,
                        decoration: BoxDecoration(
                          color: Theme.of(context).cardColor,
                          border: Border.all(color: Color(0xffDAD0D0)),
                          borderRadius: BorderRadius.circular(5),
                        ),
                        child: Row(
                          children: [
                            Expanded(
                              child: Padding(
                                padding: const EdgeInsets.only(left: 5.0),
                                child: Text(
                                  textDirection: TextDirection.ltr,
                                  textAlign: TextAlign.center,
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                  "${prefs!.getString("fullname")}",
                                  style: Get.theme.textTheme.bodyMedium!
                                      .copyWith(fontSize: 12),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                Expanded(
                  child: Center(
                    child: Text(
                      "My Children".tr,
                      style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: Theme.of(context).highlightColor),
                    ),
                  ),
                ),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    SvgPicture.asset(
                      Theme.of(context).brightness == Brightness.dark
                          ? "assets/images/logodark.svg"
                          : "assets/images/logolight.svg",
                      width: 250,
                    )
                  ],
                )
              ],
            ),
          ),
          tabletScreen: Container(
            margin: const EdgeInsets.only(
                right: 60, left: 30, top: 20, bottom: 5.0),
            height: 77,
            child: Row(
              children: [
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    GestureDetector(
                      onTap: () {
                        Get_My_Data_API().Get_My_Data();
                        Get.dialog(ProfileDialog());
                      },
                      child: Container(
                        height: 40,
                        width: 200,
                        decoration: BoxDecoration(
                          color: Theme.of(context).cardColor,
                          border: Border.all(color: Color(0xffDAD0D0)),
                          borderRadius: BorderRadius.circular(5),
                        ),
                        child: Row(
                          children: [
                            Expanded(
                              child: Padding(
                                padding: const EdgeInsets.only(left: 5.0),
                                child: Text(
                                  textDirection: TextDirection.ltr,
                                  textAlign: TextAlign.center,
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                  "${prefs!.getString("fullname")}",
                                  style: Get.theme.textTheme.bodyMedium!
                                      .copyWith(fontSize: 12),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                Expanded(
                  child: Center(
                    child: Text(
                      "My Children".tr,
                      style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: Theme.of(context).highlightColor),
                    ),
                  ),
                ),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    SvgPicture.asset(
                      Theme.of(context).brightness == Brightness.dark
                          ? "assets/images/logodark.svg"
                          : "assets/images/logolight.svg",
                      width: 250,
                    )
                  ],
                )
              ],
            ),
          ),
          mobileScreen: Container(
            width: screenSize,
            margin: const EdgeInsets.only(right: 30, left: 30, top: 29),
            height: 150,
            child: Column(
              spacing: 20,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SvgPicture.asset(
                      Theme.of(context).brightness == Brightness.dark
                          ? "assets/images/logodark.svg"
                          : "assets/images/logolight.svg",
                      width: 150,
                    ),
                    GestureDetector(
                      onTap: () {
                        Get_My_Data_API().Get_My_Data();
                        Get.dialog(ProfileDialog());
                      },
                      child: Container(
                        height: 40,
                        width: 120,
                        decoration: BoxDecoration(
                          color: Theme.of(context).cardColor,
                          border: Border.all(color: Color(0xffDAD0D0)),
                          borderRadius: BorderRadius.circular(5),
                        ),
                        child: Row(
                          children: [
                            Expanded(
                              child: Padding(
                                padding: const EdgeInsets.only(left: 5.0),
                                child: Text(
                                  textDirection: TextDirection.ltr,
                                  textAlign: TextAlign.center,
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                  "${prefs!.getString("fullname")}",
                                  style: Get.theme.textTheme.bodyMedium!
                                      .copyWith(fontSize: 12),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Center(
                      child: Text(
                        maxLines: 2,
                        textAlign: TextAlign.center,
                        "My Children".tr,
                        style: TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                            color: Theme.of(context).highlightColor),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ));
  }
}
