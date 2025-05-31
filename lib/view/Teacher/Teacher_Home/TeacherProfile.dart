import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:vms_school/Link/API/AuthAPI/LogoutAPI.dart';
import 'package:vms_school/Link/Controller/AdminController/Employee_Controllers/Add_Data_controller.dart';
import 'package:vms_school/Link/Controller/AdminController/Main_Admin_Controller/Admin_Profile_Content.dart';
import 'package:vms_school/Translate/local_controller.dart';
import 'package:vms_school/view/Admin/All_Settings/Account_And_Password.dart';
import 'package:vms_school/view/Admin/All_Settings/Add_Data_My_Account.dart';
import 'package:vms_school/view/Admin/All_Settings/Apperance.dart';
import 'package:vms_school/view/Admin/All_Settings/My_Illness.dart';
import 'package:vms_school/view/Admin/All_Settings/Personal_Section.dart';
import 'package:vms_school/view/Admin/All_Settings/Prof_Section.dart';
import 'package:vms_school/view/Teacher/Teacher_Home/My_Curr.dart';
import 'package:vms_school/widgets/VMSAlertDialog.dart';

class Teacherprofile extends StatefulWidget {
  const Teacherprofile({super.key});

  @override
  State<Teacherprofile> createState() => _TeacherprofileState();
}

class _TeacherprofileState extends State<Teacherprofile> {
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    var _isDarkMode = Get.isDarkMode.obs;
    return Directionality(
      textDirection:
          Get.find<LocalizationController>().currentLocale.value.languageCode ==
                  'ar'
              ? TextDirection.rtl
              : TextDirection.ltr,
      child: VMSProfileAlertDialog(
          action: [],
          contents: Container(
            width: screenWidth * 0.8,
            child: GetBuilder<Admin_Profile_Content>(builder: (controller) {
              return GetBuilder<Add_Data_controller>(
                  builder: (add_Data_Controller) {
                return Expanded(
                  child: Container(
                    margin: EdgeInsets.only(left: 15.0, top: 20.0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      color: Theme.of(context).primaryColorDark,
                    ),
                    child: Column(
                      crossAxisAlignment: Get.find<LocalizationController>()
                                  .currentLocale
                                  .value
                                  .languageCode ==
                              'ar'
                          ? CrossAxisAlignment.end
                          : CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          textDirection: Get.find<LocalizationController>()
                                      .currentLocale
                                      .value
                                      .languageCode ==
                                  'ar'
                              ? TextDirection.rtl
                              : TextDirection.ltr,
                          children: [
                            add_Data_Controller.hasData
                                ? Container(
                                    padding: EdgeInsets.only(
                                        left: 15, top: 15.0, right: 15.0),
                                    alignment: Alignment.centerRight,
                                    width: screenWidth < 768
                                        ? screenWidth - 180
                                        : screenWidth * 0.7,
                                    child: Expanded(
                                      child: Text(
                                        textAlign: TextAlign.end,
                                        maxLines: 2,
                                        overflow: TextOverflow.visible,
                                        "Application and Profile Settings".tr,
                                        style: TextStyle(
                                            fontSize:
                                                screenWidth >= 500 ? 20 : 16),
                                      ),
                                    ),
                                  )
                                : Container(
                                    padding: EdgeInsets.only(
                                        left: 15, top: 15.0, right: 15.0),
                                    alignment: Alignment.centerRight,
                                    width: screenWidth < 768
                                        ? screenWidth - 180
                                        : screenWidth * 0.7,
                                    child: Text(
                                      textAlign: TextAlign.end,
                                      maxLines: 2,
                                      overflow: TextOverflow.fade,
                                      "Complete the registration details before starting"
                                          .tr,
                                      style: TextStyle(
                                          fontSize:
                                              screenWidth >= 500 ? 20 : 16),
                                    ),
                                  ),
                            if (screenWidth < 900) // زر لفتح الدالوغ
                              IconButton(
                                  onPressed: () {
                                    Get.dialog(
                                        VMSAlertDialog(
                                            action: [],
                                            contents: SingleChildScrollView(
                                              child: Container(
                                                width: 260,
                                                child: Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          left: 10.0,
                                                          right: 10.0),
                                                  child: Column(
                                                    textDirection: Get.find<
                                                                    LocalizationController>()
                                                                .currentLocale
                                                                .value
                                                                .languageCode ==
                                                            'ar'
                                                        ? TextDirection.rtl
                                                        : TextDirection.ltr,
                                                    mainAxisSize:
                                                        MainAxisSize.min,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment.start,
                                                    spacing: 25.0,
                                                    children: [
                                                      add_Data_Controller
                                                              .hasData
                                                          ? Column(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .min,
                                                              spacing: 25.0,
                                                              textDirection: Get.find<
                                                                              LocalizationController>()
                                                                          .currentLocale
                                                                          .value
                                                                          .languageCode ==
                                                                      'ar'
                                                                  ? TextDirection
                                                                      .rtl
                                                                  : TextDirection
                                                                      .ltr,
                                                              children: [
                                                                GestureDetector(
                                                                  onTap: () {
                                                                    controller
                                                                        .ChangeCurruntValue(
                                                                            "Profile");
                                                                    Get.back();
                                                                  },
                                                                  child:
                                                                      Container(
                                                                    decoration: BoxDecoration(
                                                                        color: controller.curruntValue == "Profile"
                                                                            ? _isDarkMode.value
                                                                                ? Theme.of(context).indicatorColor
                                                                                : Color(0xffEBEBEB)
                                                                            : Colors.transparent,
                                                                        borderRadius: BorderRadius.all(Radius.circular(20))),
                                                                    padding:
                                                                        EdgeInsets.all(
                                                                            5.0),
                                                                    child: Row(
                                                                      textDirection: Get.find<LocalizationController>().currentLocale.value.languageCode ==
                                                                              'ar'
                                                                          ? TextDirection
                                                                              .rtl
                                                                          : TextDirection
                                                                              .ltr,
                                                                      children: [
                                                                        Icon(Icons
                                                                            .dataset_linked_outlined),
                                                                        Text("  " +
                                                                            "Profile".tr +
                                                                            "  ")
                                                                      ],
                                                                    ),
                                                                  ),
                                                                ),
                                                                GestureDetector(
                                                                  onTap: () {
                                                                    controller
                                                                        .ChangeCurruntValue(
                                                                            "Personal");
                                                                    Get.back();
                                                                  },
                                                                  child:
                                                                      Container(
                                                                    decoration: BoxDecoration(
                                                                        color: controller.curruntValue == "Personal"
                                                                            ? _isDarkMode.value
                                                                                ? Theme.of(context).indicatorColor
                                                                                : Color(0xffEBEBEB)
                                                                            : Colors.transparent,
                                                                        borderRadius: BorderRadius.all(Radius.circular(20))),
                                                                    padding:
                                                                        EdgeInsets.all(
                                                                            5.0),
                                                                    child: Row(
                                                                      textDirection: Get.find<LocalizationController>().currentLocale.value.languageCode ==
                                                                              'ar'
                                                                          ? TextDirection
                                                                              .rtl
                                                                          : TextDirection
                                                                              .ltr,
                                                                      children: [
                                                                        Icon(Icons
                                                                            .person_2_outlined),
                                                                        Text("  " +
                                                                            "Personal".tr +
                                                                            "  ")
                                                                      ],
                                                                    ),
                                                                  ),
                                                                ),
                                                                GestureDetector(
                                                                  onTap: () {
                                                                    controller
                                                                        .ChangeCurruntValue(
                                                                            "Password");
                                                                    Get.back();
                                                                  },
                                                                  child:
                                                                      Container(
                                                                    decoration: BoxDecoration(
                                                                        color: controller.curruntValue == "Password"
                                                                            ? _isDarkMode.value
                                                                                ? Theme.of(context).indicatorColor
                                                                                : Color(0xffEBEBEB)
                                                                            : Colors.transparent,
                                                                        borderRadius: BorderRadius.all(Radius.circular(20))),
                                                                    padding:
                                                                        EdgeInsets.all(
                                                                            5.0),
                                                                    child: Row(
                                                                      textDirection: Get.find<LocalizationController>().currentLocale.value.languageCode ==
                                                                              'ar'
                                                                          ? TextDirection
                                                                              .rtl
                                                                          : TextDirection
                                                                              .ltr,
                                                                      children: [
                                                                        Icon(Icons
                                                                            .password_outlined),
                                                                        Text("  " +
                                                                            "Account And Password".tr +
                                                                            "  ")
                                                                      ],
                                                                    ),
                                                                  ),
                                                                ),
                                                                GestureDetector(
                                                                  onTap: () {
                                                                    controller
                                                                        .ChangeCurruntValue(
                                                                            "My Illness");
                                                                    Get.back();
                                                                  },
                                                                  child:
                                                                      AnimatedContainer(
                                                                    duration: Duration(
                                                                        milliseconds:
                                                                            150),
                                                                    decoration: BoxDecoration(
                                                                        color: controller.curruntValue == "My Illness"
                                                                            ? _isDarkMode.value
                                                                                ? Theme.of(context).indicatorColor
                                                                                : Color(0xffEBEBEB)
                                                                            : Theme.of(context).cardColor,
                                                                        borderRadius: BorderRadius.all(Radius.circular(20))),
                                                                    padding:
                                                                        EdgeInsets.all(
                                                                            5.0),
                                                                    child: Row(
                                                                      textDirection: Get.find<LocalizationController>().currentLocale.value.languageCode ==
                                                                              'ar'
                                                                          ? TextDirection
                                                                              .rtl
                                                                          : TextDirection
                                                                              .ltr,
                                                                      children: [
                                                                        FaIcon(
                                                                          FontAwesomeIcons
                                                                              .shieldVirus,
                                                                        ),
                                                                        Text(
                                                                          "  " +
                                                                              "My Illness".tr +
                                                                              "  ",
                                                                          maxLines:
                                                                              2,
                                                                          textAlign:
                                                                              TextAlign.center,
                                                                          overflow:
                                                                              TextOverflow.ellipsis,
                                                                        )
                                                                      ],
                                                                    ),
                                                                  ),
                                                                ),
                                                                GestureDetector(
                                                                  onTap: () {
                                                                    if (add_Data_Controller
                                                                            .isLoading ==
                                                                        false) {
                                                                      controller
                                                                          .ChangeCurruntValue(
                                                                              "My curr");
                                                                      Get.back();
                                                                    }
                                                                  },
                                                                  child:
                                                                      AnimatedContainer(
                                                                    duration: Duration(
                                                                        milliseconds:
                                                                            150),
                                                                    decoration: BoxDecoration(
                                                                        color: controller.curruntValue == "My curr"
                                                                            ? _isDarkMode.value
                                                                                ? Theme.of(context).indicatorColor
                                                                                : Color(0xffEBEBEB)
                                                                            : Theme.of(context).cardColor,
                                                                        borderRadius: BorderRadius.all(Radius.circular(20))),
                                                                    padding:
                                                                        EdgeInsets.all(
                                                                            5.0),
                                                                    child: Row(
                                                                      textDirection: Get.find<LocalizationController>().currentLocale.value.languageCode ==
                                                                              'ar'
                                                                          ? TextDirection
                                                                              .rtl
                                                                          : TextDirection
                                                                              .ltr,
                                                                      children: [
                                                                        FaIcon(
                                                                          FontAwesomeIcons
                                                                              .fileAlt,
                                                                        ),
                                                                        Text(
                                                                          "  " +
                                                                              "My curr".tr +
                                                                              "  ",
                                                                          maxLines:
                                                                              2,
                                                                          textAlign:
                                                                              TextAlign.center,
                                                                          overflow:
                                                                              TextOverflow.ellipsis,
                                                                        )
                                                                      ],
                                                                    ),
                                                                  ),
                                                                ),
                                                              ],
                                                            )
                                                          : Column(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .min,
                                                              spacing: 25.0,
                                                              textDirection: Get.find<
                                                                              LocalizationController>()
                                                                          .currentLocale
                                                                          .value
                                                                          .languageCode ==
                                                                      'ar'
                                                                  ? TextDirection
                                                                      .rtl
                                                                  : TextDirection
                                                                      .ltr,
                                                              children: [
                                                                GestureDetector(
                                                                  onTap: () {
                                                                    controller
                                                                        .ChangeCurruntValue(
                                                                            "addData");
                                                                    Get.back();
                                                                  },
                                                                  child:
                                                                      Container(
                                                                    decoration: BoxDecoration(
                                                                        color: controller.curruntValue == "addData"
                                                                            ? _isDarkMode.value
                                                                                ? Theme.of(context).indicatorColor
                                                                                : Color(0xffEBEBEB)
                                                                            : Colors.transparent,
                                                                        borderRadius: BorderRadius.all(Radius.circular(20))),
                                                                    padding:
                                                                        EdgeInsets.all(
                                                                            5.0),
                                                                    child: Row(
                                                                      textDirection: Get.find<LocalizationController>().currentLocale.value.languageCode ==
                                                                              'ar'
                                                                          ? TextDirection
                                                                              .rtl
                                                                          : TextDirection
                                                                              .ltr,
                                                                      children: [
                                                                        Icon(Icons
                                                                            .account_circle_outlined),
                                                                        Text("  " +
                                                                            "My Account".tr +
                                                                            "  ")
                                                                      ],
                                                                    ),
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                      GestureDetector(
                                                        onTap: () {
                                                          controller
                                                              .ChangeCurruntValue(
                                                                  "Appearance");
                                                          Get.back();
                                                        },
                                                        child:
                                                            AnimatedContainer(
                                                          duration: Duration(
                                                              milliseconds:
                                                                  150),
                                                          decoration:
                                                              BoxDecoration(
                                                                  color: controller
                                                                              .curruntValue ==
                                                                          "Appearance"
                                                                      ? _isDarkMode
                                                                              .value
                                                                          ? Theme.of(context)
                                                                              .indicatorColor
                                                                          : Color(
                                                                              0xffEBEBEB)
                                                                      : Theme.of(
                                                                              context)
                                                                          .cardColor,
                                                                  borderRadius:
                                                                      BorderRadius.all(
                                                                          Radius.circular(
                                                                              20))),
                                                          padding:
                                                              EdgeInsets.all(
                                                                  5.0),
                                                          child: Row(
                                                            textDirection: Get.find<
                                                                            LocalizationController>()
                                                                        .currentLocale
                                                                        .value
                                                                        .languageCode ==
                                                                    'ar'
                                                                ? TextDirection
                                                                    .rtl
                                                                : TextDirection
                                                                    .ltr,
                                                            children: [
                                                              Icon(Icons
                                                                  .settings_applications_outlined),
                                                              Text(
                                                                "  " +
                                                                    "Appearance"
                                                                        .tr +
                                                                    "  ",
                                                                maxLines: 2,
                                                                textAlign:
                                                                    TextAlign
                                                                        .center,
                                                                overflow:
                                                                    TextOverflow
                                                                        .ellipsis,
                                                              )
                                                            ],
                                                          ),
                                                        ),
                                                      ),
                                                      GestureDetector(
                                                        onTap: () {},
                                                        child: PopupMenuButton<
                                                            int>(
                                                          tooltip: "",
                                                          onSelected:
                                                              (value) async {
                                                            if (value == 1) {
                                                              await Logoutapi(
                                                                      context)
                                                                  .Logout(
                                                                      Type:
                                                                          "now");
                                                            } else if (value ==
                                                                2) {
                                                              await Logoutapi(
                                                                      context)
                                                                  .Logout(
                                                                      Type:
                                                                          "all");
                                                            }
                                                          },
                                                          itemBuilder:
                                                              (context) => [
                                                            PopupMenuItem(
                                                              value: 1,
                                                              child: Row(
                                                                children: [
                                                                  Icon(
                                                                      Icons
                                                                          .logout,
                                                                      size: 18,
                                                                      color: _isDarkMode.value
                                                                          ? Colors
                                                                              .redAccent
                                                                          : Color(
                                                                              0xffB03D3D)),
                                                                  SizedBox(
                                                                      width: 8),
                                                                  Text(
                                                                      style: TextStyle(
                                                                          color: _isDarkMode.value
                                                                              ? Colors
                                                                                  .redAccent
                                                                              : Color(
                                                                                  0xffB03D3D)),
                                                                      "Logout from Current Session"
                                                                          .tr),
                                                                ],
                                                              ),
                                                            ),
                                                            PopupMenuItem(
                                                              value: 2,
                                                              child: Row(
                                                                children: [
                                                                  Icon(
                                                                      Icons
                                                                          .mobile_off,
                                                                      size: 18,
                                                                      color: _isDarkMode.value
                                                                          ? Colors
                                                                              .redAccent
                                                                          : Color(
                                                                              0xffB03D3D)),
                                                                  SizedBox(
                                                                      width: 8),
                                                                  Text(
                                                                      style: TextStyle(
                                                                          color: _isDarkMode.value
                                                                              ? Colors
                                                                                  .redAccent
                                                                              : Color(
                                                                                  0xffB03D3D)),
                                                                      "Logout from All Sessions"
                                                                          .tr),
                                                                ],
                                                              ),
                                                            ),
                                                          ],
                                                          child: Container(
                                                            decoration:
                                                                BoxDecoration(
                                                              color: Colors
                                                                  .transparent,
                                                              borderRadius: BorderRadius
                                                                  .all(Radius
                                                                      .circular(
                                                                          20)),
                                                            ),
                                                            padding:
                                                                EdgeInsets.all(
                                                                    5.0),
                                                            child: Row(
                                                              textDirection: Get.find<
                                                                              LocalizationController>()
                                                                          .currentLocale
                                                                          .value
                                                                          .languageCode ==
                                                                      'ar'
                                                                  ? TextDirection
                                                                      .rtl
                                                                  : TextDirection
                                                                      .ltr,
                                                              children: [
                                                                Icon(
                                                                  Icons
                                                                      .login_outlined,
                                                                  color: _isDarkMode
                                                                          .value
                                                                      ? Colors
                                                                          .redAccent
                                                                      : Color(
                                                                          0xffB03D3D),
                                                                ),
                                                                Text(
                                                                  "  " +
                                                                      "Logout"
                                                                          .tr +
                                                                      "  ",
                                                                  maxLines: 2,
                                                                  style:
                                                                      TextStyle(
                                                                    color: _isDarkMode.value
                                                                        ? Colors
                                                                            .redAccent
                                                                        : Color(
                                                                            0xffB03D3D),
                                                                  ),
                                                                  textAlign:
                                                                      TextAlign
                                                                          .center,
                                                                  overflow:
                                                                      TextOverflow
                                                                          .ellipsis,
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            ),
                                            apptitle: "Settings".tr,
                                            subtitle: "none"),
                                        barrierDismissible: false);
                                  },
                                  icon: Icon(Icons.drag_indicator)),
                          ],
                        ),
                        Expanded(
                          child: Container(
                            margin: EdgeInsets.only(top: 15.0),
                            decoration: BoxDecoration(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10)),
                                color: Theme.of(context).cardColor),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              textDirection: Get.find<LocalizationController>()
                                          .currentLocale
                                          .value
                                          .languageCode ==
                                      'ar'
                                  ? TextDirection.rtl
                                  : TextDirection.ltr,
                              children: [
                                if (screenWidth >= 900)
                                  SingleChildScrollView(
                                    child: Container(
                                      margin: EdgeInsets.only(
                                          left: 15.0, top: 20.0),
                                      width: 260,
                                      child: Padding(
                                        padding: const EdgeInsets.only(
                                            left: 10.0, right: 10.0),
                                        child: Column(
                                          textDirection:
                                              Get.find<LocalizationController>()
                                                          .currentLocale
                                                          .value
                                                          .languageCode ==
                                                      'ar'
                                                  ? TextDirection.rtl
                                                  : TextDirection.ltr,
                                          mainAxisSize: MainAxisSize.min,
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          spacing: 25.0,
                                          children: [
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  top: 5.0),
                                              child: Text(
                                                "  " + "Settings".tr,
                                                style: TextStyle(fontSize: 16),
                                              ),
                                            ),
                                            // if(add_Data_Controller.hasData)
                                            add_Data_Controller.hasData
                                                ? Column(
                                                    mainAxisSize:
                                                        MainAxisSize.min,
                                                    spacing: 25.0,
                                                    textDirection: Get.find<
                                                                    LocalizationController>()
                                                                .currentLocale
                                                                .value
                                                                .languageCode ==
                                                            'ar'
                                                        ? TextDirection.rtl
                                                        : TextDirection.ltr,
                                                    children: [
                                                      GestureDetector(
                                                        onTap: () {
                                                          controller
                                                              .ChangeCurruntValue(
                                                                  "Profile");
                                                        },
                                                        child: Container(
                                                          decoration:
                                                              BoxDecoration(
                                                                  color: controller
                                                                              .curruntValue ==
                                                                          "Profile"
                                                                      ? _isDarkMode
                                                                              .value
                                                                          ? Theme.of(context)
                                                                              .indicatorColor
                                                                          : Color(
                                                                              0xffEBEBEB)
                                                                      : Colors
                                                                          .transparent,
                                                                  borderRadius:
                                                                      BorderRadius.all(
                                                                          Radius.circular(
                                                                              20))),
                                                          padding:
                                                              EdgeInsets.all(
                                                                  5.0),
                                                          child: Row(
                                                            textDirection: Get.find<
                                                                            LocalizationController>()
                                                                        .currentLocale
                                                                        .value
                                                                        .languageCode ==
                                                                    'ar'
                                                                ? TextDirection
                                                                    .rtl
                                                                : TextDirection
                                                                    .ltr,
                                                            children: [
                                                              Icon(Icons
                                                                  .dataset_linked_outlined),
                                                              Text("  " +
                                                                  "Profile".tr +
                                                                  "  ")
                                                            ],
                                                          ),
                                                        ),
                                                      ),
                                                      GestureDetector(
                                                        onTap: () {
                                                          controller
                                                              .ChangeCurruntValue(
                                                                  "Personal");
                                                        },
                                                        child: Container(
                                                          decoration:
                                                              BoxDecoration(
                                                                  color: controller
                                                                              .curruntValue ==
                                                                          "Personal"
                                                                      ? _isDarkMode
                                                                              .value
                                                                          ? Theme.of(context)
                                                                              .indicatorColor
                                                                          : Color(
                                                                              0xffEBEBEB)
                                                                      : Colors
                                                                          .transparent,
                                                                  borderRadius:
                                                                      BorderRadius.all(
                                                                          Radius.circular(
                                                                              20))),
                                                          padding:
                                                              EdgeInsets.all(
                                                                  5.0),
                                                          child: Row(
                                                            textDirection: Get.find<
                                                                            LocalizationController>()
                                                                        .currentLocale
                                                                        .value
                                                                        .languageCode ==
                                                                    'ar'
                                                                ? TextDirection
                                                                    .rtl
                                                                : TextDirection
                                                                    .ltr,
                                                            children: [
                                                              Icon(Icons
                                                                  .person_2_outlined),
                                                              Text("  " +
                                                                  "Personal"
                                                                      .tr +
                                                                  "  ")
                                                            ],
                                                          ),
                                                        ),
                                                      ),
                                                      GestureDetector(
                                                        onTap: () {
                                                          controller
                                                              .ChangeCurruntValue(
                                                                  "Password");
                                                        },
                                                        child: Container(
                                                          decoration:
                                                              BoxDecoration(
                                                                  color: controller
                                                                              .curruntValue ==
                                                                          "Password"
                                                                      ? _isDarkMode
                                                                              .value
                                                                          ? Theme.of(context)
                                                                              .indicatorColor
                                                                          : Color(
                                                                              0xffEBEBEB)
                                                                      : Colors
                                                                          .transparent,
                                                                  borderRadius:
                                                                      BorderRadius.all(
                                                                          Radius.circular(
                                                                              20))),
                                                          padding:
                                                              EdgeInsets.all(
                                                                  5.0),
                                                          child: Row(
                                                            textDirection: Get.find<
                                                                            LocalizationController>()
                                                                        .currentLocale
                                                                        .value
                                                                        .languageCode ==
                                                                    'ar'
                                                                ? TextDirection
                                                                    .rtl
                                                                : TextDirection
                                                                    .ltr,
                                                            children: [
                                                              Icon(Icons
                                                                  .password_outlined),
                                                              Text("  " +
                                                                  "Account And Password"
                                                                      .tr +
                                                                  "  ")
                                                            ],
                                                          ),
                                                        ),
                                                      ),
                                                      GestureDetector(
                                                        onTap: () {
                                                          controller
                                                              .ChangeCurruntValue(
                                                                  "My Illness");
                                                        },
                                                        child:
                                                            AnimatedContainer(
                                                          duration: Duration(
                                                              milliseconds:
                                                                  150),
                                                          decoration:
                                                              BoxDecoration(
                                                                  color: controller
                                                                              .curruntValue ==
                                                                          "My Illness"
                                                                      ? _isDarkMode
                                                                              .value
                                                                          ? Theme.of(context)
                                                                              .indicatorColor
                                                                          : Color(
                                                                              0xffEBEBEB)
                                                                      : Theme.of(
                                                                              context)
                                                                          .cardColor,
                                                                  borderRadius:
                                                                      BorderRadius.all(
                                                                          Radius.circular(
                                                                              20))),
                                                          padding:
                                                              EdgeInsets.all(
                                                                  5.0),
                                                          child: Row(
                                                            textDirection: Get.find<
                                                                            LocalizationController>()
                                                                        .currentLocale
                                                                        .value
                                                                        .languageCode ==
                                                                    'ar'
                                                                ? TextDirection
                                                                    .rtl
                                                                : TextDirection
                                                                    .ltr,
                                                            children: [
                                                              FaIcon(
                                                                FontAwesomeIcons
                                                                    .shieldVirus,
                                                              ),
                                                              Text(
                                                                "  " +
                                                                    "My Illness"
                                                                        .tr +
                                                                    "  ",
                                                                maxLines: 2,
                                                                textAlign:
                                                                    TextAlign
                                                                        .center,
                                                                overflow:
                                                                    TextOverflow
                                                                        .ellipsis,
                                                              )
                                                            ],
                                                          ),
                                                        ),
                                                      ),
                                                      GestureDetector(
                                                        onTap: () {
                                                          if (add_Data_Controller
                                                                  .isLoading ==
                                                              false) {
                                                            controller
                                                                .ChangeCurruntValue(
                                                                    "My curr");
                                                          }
                                                        },
                                                        child:
                                                            AnimatedContainer(
                                                          duration: Duration(
                                                              milliseconds:
                                                                  150),
                                                          decoration:
                                                              BoxDecoration(
                                                                  color: controller
                                                                              .curruntValue ==
                                                                          "My curr"
                                                                      ? _isDarkMode
                                                                              .value
                                                                          ? Theme.of(context)
                                                                              .indicatorColor
                                                                          : Color(
                                                                              0xffEBEBEB)
                                                                      : Theme.of(
                                                                              context)
                                                                          .cardColor,
                                                                  borderRadius:
                                                                      BorderRadius.all(
                                                                          Radius.circular(
                                                                              20))),
                                                          padding:
                                                              EdgeInsets.all(
                                                                  5.0),
                                                          child: Row(
                                                            textDirection: Get.find<
                                                                            LocalizationController>()
                                                                        .currentLocale
                                                                        .value
                                                                        .languageCode ==
                                                                    'ar'
                                                                ? TextDirection
                                                                    .rtl
                                                                : TextDirection
                                                                    .ltr,
                                                            children: [
                                                              FaIcon(
                                                                FontAwesomeIcons
                                                                    .fileAlt,
                                                              ),
                                                              Text(
                                                                "  " +
                                                                    "My curr"
                                                                        .tr +
                                                                    "  ",
                                                                maxLines: 2,
                                                                textAlign:
                                                                    TextAlign
                                                                        .center,
                                                                overflow:
                                                                    TextOverflow
                                                                        .ellipsis,
                                                              )
                                                            ],
                                                          ),
                                                        ),
                                                      ),
                                                    ],
                                                  )
                                                : Column(
                                                    mainAxisSize:
                                                        MainAxisSize.min,
                                                    spacing: 25.0,
                                                    textDirection: Get.find<
                                                                    LocalizationController>()
                                                                .currentLocale
                                                                .value
                                                                .languageCode ==
                                                            'ar'
                                                        ? TextDirection.rtl
                                                        : TextDirection.ltr,
                                                    children: [
                                                      GestureDetector(
                                                        onTap: () {
                                                          controller
                                                              .ChangeCurruntValue(
                                                                  "addData");
                                                        },
                                                        child: Container(
                                                          decoration:
                                                              BoxDecoration(
                                                                  color: controller
                                                                              .curruntValue ==
                                                                          "addData"
                                                                      ? _isDarkMode
                                                                              .value
                                                                          ? Theme.of(context)
                                                                              .indicatorColor
                                                                          : Color(
                                                                              0xffEBEBEB)
                                                                      : Colors
                                                                          .transparent,
                                                                  borderRadius:
                                                                      BorderRadius.all(
                                                                          Radius.circular(
                                                                              20))),
                                                          padding:
                                                              EdgeInsets.all(
                                                                  5.0),
                                                          child: Row(
                                                            textDirection: Get.find<
                                                                            LocalizationController>()
                                                                        .currentLocale
                                                                        .value
                                                                        .languageCode ==
                                                                    'ar'
                                                                ? TextDirection
                                                                    .rtl
                                                                : TextDirection
                                                                    .ltr,
                                                            children: [
                                                              Icon(Icons
                                                                  .account_circle_outlined),
                                                              Text("  " +
                                                                  "My Account"
                                                                      .tr +
                                                                  "  ")
                                                            ],
                                                          ),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                            GestureDetector(
                                              onTap: () {
                                                controller.ChangeCurruntValue(
                                                    "Appearance");
                                              },
                                              child: AnimatedContainer(
                                                duration:
                                                    Duration(milliseconds: 150),
                                                decoration: BoxDecoration(
                                                    color: controller
                                                                .curruntValue ==
                                                            "Appearance"
                                                        ? _isDarkMode.value
                                                            ? Theme.of(context)
                                                                .indicatorColor
                                                            : Color(0xffEBEBEB)
                                                        : Theme.of(context)
                                                            .cardColor,
                                                    borderRadius:
                                                        BorderRadius.all(
                                                            Radius.circular(
                                                                20))),
                                                padding: EdgeInsets.all(5.0),
                                                child: Row(
                                                  textDirection:
                                                      Get.find<LocalizationController>()
                                                                  .currentLocale
                                                                  .value
                                                                  .languageCode ==
                                                              'ar'
                                                          ? TextDirection.rtl
                                                          : TextDirection.ltr,
                                                  children: [
                                                    Icon(Icons
                                                        .settings_applications_outlined),
                                                    Text(
                                                      "  " +
                                                          "Appearance".tr +
                                                          "  ",
                                                      maxLines: 2,
                                                      textAlign:
                                                          TextAlign.center,
                                                      overflow:
                                                          TextOverflow.ellipsis,
                                                    )
                                                  ],
                                                ),
                                              ),
                                            ),
                                            GestureDetector(
                                              onTap: () {},
                                              child: PopupMenuButton<int>(
                                                tooltip: "",
                                                onSelected: (value) async {
                                                  if (value == 1) {
                                                    await Logoutapi(context)
                                                        .Logout(Type: "now");
                                                  } else if (value == 2) {
                                                    await Logoutapi(context)
                                                        .Logout(Type: "all");
                                                  }
                                                },
                                                itemBuilder: (context) => [
                                                  PopupMenuItem(
                                                    value: 1,
                                                    child: Row(
                                                      children: [
                                                        Icon(Icons.logout,
                                                            size: 18,
                                                            color: _isDarkMode
                                                                    .value
                                                                ? Colors
                                                                    .redAccent
                                                                : Color(
                                                                    0xffB03D3D)),
                                                        SizedBox(width: 8),
                                                        Text(
                                                            style: TextStyle(
                                                                color: _isDarkMode
                                                                        .value
                                                                    ? Colors
                                                                        .redAccent
                                                                    : Color(
                                                                        0xffB03D3D)),
                                                            "Logout from Current Session"
                                                                .tr),
                                                      ],
                                                    ),
                                                  ),
                                                  PopupMenuItem(
                                                    value: 2,
                                                    child: Row(
                                                      children: [
                                                        Icon(Icons.mobile_off,
                                                            size: 18,
                                                            color: _isDarkMode
                                                                    .value
                                                                ? Colors
                                                                    .redAccent
                                                                : Color(
                                                                    0xffB03D3D)),
                                                        SizedBox(width: 8),
                                                        Text(
                                                            style: TextStyle(
                                                                color: _isDarkMode
                                                                        .value
                                                                    ? Colors
                                                                        .redAccent
                                                                    : Color(
                                                                        0xffB03D3D)),
                                                            "Logout from All Sessions"
                                                                .tr),
                                                      ],
                                                    ),
                                                  ),
                                                ],
                                                child: Container(
                                                  decoration: BoxDecoration(
                                                    color: Colors.transparent,
                                                    borderRadius:
                                                        BorderRadius.all(
                                                            Radius.circular(
                                                                20)),
                                                  ),
                                                  padding: EdgeInsets.all(5.0),
                                                  child: Row(
                                                    textDirection: Get.find<
                                                                    LocalizationController>()
                                                                .currentLocale
                                                                .value
                                                                .languageCode ==
                                                            'ar'
                                                        ? TextDirection.rtl
                                                        : TextDirection.ltr,
                                                    children: [
                                                      Icon(
                                                        Icons.login_outlined,
                                                        color: _isDarkMode.value
                                                            ? Colors.redAccent
                                                            : Color(0xffB03D3D),
                                                      ),
                                                      Text(
                                                        "  " +
                                                            "Logout".tr +
                                                            "  ",
                                                        maxLines: 2,
                                                        style: TextStyle(
                                                          color: _isDarkMode
                                                                  .value
                                                              ? Colors.redAccent
                                                              : Color(
                                                                  0xffB03D3D),
                                                        ),
                                                        textAlign:
                                                            TextAlign.center,
                                                        overflow: TextOverflow
                                                            .ellipsis,
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                VerticalDivider(
                                  width: 2,
                                  color: Color(0xffF6F6F6),
                                ),
                                Expanded(
                                    child: Padding(
                                  padding: const EdgeInsets.only(
                                      left: 15.0, right: 15.0),
                                  child: controller.curruntValue == "Appearance"
                                      ? Appearance()
                                      : controller.curruntValue == "Profile"
                                          ? add_Data_Controller.isLoading ==
                                                  true
                                              ? Column(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: [
                                                    Container(
                                                        width: 45,
                                                        height: 45,
                                                        child:
                                                            CircularProgressIndicator()),
                                                  ],
                                                )
                                              : Profile()
                                          : controller.curruntValue ==
                                                  "Personal"
                                              ? add_Data_Controller.isLoading ==
                                                      true
                                                  ? Column(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .center,
                                                      children: [
                                                        Container(
                                                            width: 45,
                                                            height: 45,
                                                            child:
                                                                CircularProgressIndicator()),
                                                      ],
                                                    )
                                                  : Personal()
                                              : controller.curruntValue ==
                                                      "addData"
                                                  ? Add_Data_account()
                                                  : controller.curruntValue ==
                                                          "My Illness"
                                                      ? My_Illness()
                                                      : controller.curruntValue ==
                                                              "My curr"
                                                          ? My_Curr(
                                                              id: add_Data_Controller
                                                                      .myData
                                                                      ?.id ??
                                                                  0,
                                                            )
                                                          : Account_And_Password(),
                                ))
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              });
            }),
          ),
          apptitle: 'My Profile'.tr,
          subtitle: ""),
    );
  }
}
