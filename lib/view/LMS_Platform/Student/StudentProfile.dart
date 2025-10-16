import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:vms_school/Link/API/AuthAPI/LogoutAPI.dart';
import 'package:vms_school/Link/Controller/AdminController/Employee_Controllers/Add_Data_controller.dart';
import 'package:vms_school/Link/Controller/AdminController/Main_Admin_Controller/Admin_Profile_Content.dart';
import 'package:vms_school/Translate/local_controller.dart';
import 'package:vms_school/main.dart';
import 'package:vms_school/view/Both_Platform/widgets/VMSAlertDialog.dart';
import 'package:vms_school/view/SMS_Platform/Admin/All_Settings/Account_And_Password.dart';
import 'package:vms_school/view/SMS_Platform/Admin/All_Settings/Add_Data_My_Account.dart';
import 'package:vms_school/view/SMS_Platform/Admin/All_Settings/Apperance.dart';
import 'package:vms_school/view/SMS_Platform/Admin/All_Settings/My_Illness.dart';
import 'package:vms_school/view/SMS_Platform/Admin/All_Settings/Personal_Section.dart';
import 'package:vms_school/view/SMS_Platform/Admin/All_Settings/Prof_Section.dart';
import 'package:vms_school/view/SMS_Platform/Teacher/Teacher_Home/My_Curr.dart';

class Studentprofile extends StatefulWidget {
  const Studentprofile({super.key});

  @override
  State<Studentprofile> createState() => _StudentprofileState();
}

class _StudentprofileState extends State<Studentprofile> {
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
      child:  Container(
            width: screenWidth * 0.8,
            child: GetBuilder<Admin_Profile_Content>(builder: (controller) {
              return Container(
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
                        Container(
                                padding: EdgeInsets.only(
                                    left: 15, top: 15.0, right: 15.0),
                                alignment: Alignment.centerRight,
                                width: screenWidth < 768
                                    ? screenWidth - 180
                                    : screenWidth * 0.7,
                                child: Text(
                                  textAlign: TextAlign.end,
                                  maxLines: 2,
                                  overflow: TextOverflow.visible,
                                  "Application and Profile Settings".tr,
                                  style: TextStyle(
                                      fontSize: screenWidth >= 500 ? 20 : 16),
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
                                                mainAxisSize:
                                                    MainAxisSize.min,
                                                mainAxisAlignment:
                                                    MainAxisAlignment.start,
                                                spacing: 25.0,
                                                children: [
                                                  Column(
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
                                                                    EdgeInsets
                                                                        .all(
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
                                                                        "Profile"
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
                                                      controller
                                                          .ChangeCurruntValue(
                                                              "Appearance");
                                                      Get.back();
                                                    },
                                                    child: AnimatedContainer(
                                                      duration: Duration(
                                                          milliseconds: 150),
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
                                                              borderRadius: BorderRadius
                                                                  .all(Radius
                                                                      .circular(
                                                                          20))),
                                                      padding:
                                                          EdgeInsets.all(5.0),
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
                                  margin:
                                      EdgeInsets.only(left: 15.0, top: 20.0),
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
                                          padding:
                                              const EdgeInsets.only(top: 5.0),
                                          child: Text(
                                            "  " + "Settings".tr,
                                            style: TextStyle(fontSize: 16),
                                          ),
                                        ),
                                       Column(
                                                mainAxisSize:
                                                    MainAxisSize.min,
                                                spacing: 25.0,
                                                textDirection:
                                                    Get.find<LocalizationController>()
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
                                                              borderRadius: BorderRadius
                                                                  .all(Radius
                                                                      .circular(
                                                                          20))),
                                                      padding:
                                                          EdgeInsets.all(5.0),
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
                                                        Radius.circular(20))),
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
                                                  textAlign: TextAlign.center,
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                )
                                              ],
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
                                  :
                                           Profile(),
                                      
                            ))
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              );
            }),
          ),
        
    );
  }
}
