import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vms_school/Link/API/AdminAPI/Get_My_Profile.dart';
import 'package:vms_school/Link/API/AuthAPI/LogoutAPI.dart';
import 'package:vms_school/Link/Controller/AdminController/Employee_Controllers/Add_Data_controller.dart';
import 'package:vms_school/Link/Controller/AdminController/Main_Admin_Controller/Admin_Profile_Content.dart';
import 'package:vms_school/Translate/local_controller.dart';
import 'package:vms_school/view/Admin/All_Settings/Account_And_Password.dart';
import 'package:vms_school/view/Admin/All_Settings/Add_Data_My_Account.dart';
import 'package:vms_school/view/Admin/All_Settings/Apperance.dart';
import 'package:vms_school/view/Admin/All_Settings/Prof_Section.dart';
import 'package:vms_school/view/Admin/All_Settings/Personal_Section.dart';

class ProfileSettings extends StatefulWidget {
  ProfileSettings({super.key});

  @override
  State<ProfileSettings> createState() => _ProfileSettingsState();
}

class _ProfileSettingsState extends State<ProfileSettings> {
  @override
  void initState() {
    Get_My_Profile.Get_My_Profile_Data();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var _isDarkMode = Get.isDarkMode.obs;
    return GetBuilder<Admin_Profile_Content>(builder: (controller) {
      return GetBuilder<Add_Data_controller>(builder: (add_Data_Controller) {
        return Expanded(
          child: Container(
            margin: EdgeInsets.only(left: 15.0, top: 20.0),
            padding: EdgeInsets.all(25.0),
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
                add_Data_Controller.hasData
                    ? Text(
                        "Application and Profile Settings".tr,
                        style: TextStyle(fontSize: 20),
                      )
                    : Text(
                        "Complete the registration details before starting".tr,
                        style: TextStyle(fontSize: 20),
                      ),
                Expanded(
                  child: Container(
                    margin: EdgeInsets.only(top: 15.0),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        color: Theme.of(context).cardColor),
                    child: Row(
                      textDirection: Get.find<LocalizationController>()
                                  .currentLocale
                                  .value
                                  .languageCode ==
                              'ar'
                          ? TextDirection.rtl
                          : TextDirection.ltr,
                      children: [
                        Container(
                          margin: EdgeInsets.only(left: 15.0, top: 20.0),
                          width: 260,
                          child: Padding(
                            padding:
                                const EdgeInsets.only(left: 10.0, right: 10.0),
                            child: Column(
                              textDirection: Get.find<LocalizationController>()
                                          .currentLocale
                                          .value
                                          .languageCode ==
                                      'ar'
                                  ? TextDirection.rtl
                                  : TextDirection.ltr,
                              mainAxisSize: MainAxisSize.max,
                              spacing: 25.0,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(top: 5.0),
                                  child: Text(
                                    "  " + "Settings".tr,
                                    style: TextStyle(fontSize: 16),
                                  ),
                                ),
                                // if(add_Data_Controller.hasData)
                                add_Data_Controller.hasData
                                    ? Column(
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
                                              controller.ChangeCurruntValue(
                                                  "Profile");
                                            },
                                            child: Container(
                                              decoration: BoxDecoration(
                                                  color: controller
                                                              .curruntValue ==
                                                          "Profile"
                                                      ? _isDarkMode.value
                                                          ? Theme.of(context)
                                                              .indicatorColor
                                                          : Color(0xffEBEBEB)
                                                      : Colors.transparent,
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
                                              controller.ChangeCurruntValue(
                                                  "Personal");
                                            },
                                            child: Container(
                                              decoration: BoxDecoration(
                                                  color: controller
                                                              .curruntValue ==
                                                          "Personal"
                                                      ? _isDarkMode.value
                                                          ? Theme.of(context)
                                                              .indicatorColor
                                                          : Color(0xffEBEBEB)
                                                      : Colors.transparent,
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
                                                  Icon(Icons.person_2_outlined),
                                                  Text("  " +
                                                      "Personal".tr +
                                                      "  ")
                                                ],
                                              ),
                                            ),
                                          ),
                                          GestureDetector(
                                            onTap: () {
                                              controller.ChangeCurruntValue(
                                                  "Password");
                                            },
                                            child: Container(
                                              decoration: BoxDecoration(
                                                  color: controller
                                                              .curruntValue ==
                                                          "Password"
                                                      ? _isDarkMode.value
                                                          ? Theme.of(context)
                                                              .indicatorColor
                                                          : Color(0xffEBEBEB)
                                                      : Colors.transparent,
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
                                                  Icon(Icons.password_outlined),
                                                  Text("  " +
                                                      "Account And Password"
                                                          .tr +
                                                      "  ")
                                                ],
                                              ),
                                            ),
                                          ),
                                        ],
                                      )
                                    : Column(
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
                                              controller.ChangeCurruntValue(
                                                  "addData");
                                            },
                                            child: Container(
                                              decoration: BoxDecoration(
                                                  color: controller
                                                              .curruntValue ==
                                                          "addData"
                                                      ? _isDarkMode.value
                                                          ? Theme.of(context)
                                                              .indicatorColor
                                                          : Color(0xffEBEBEB)
                                                      : Colors.transparent,
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
                                    controller.ChangeCurruntValue("Appearance");
                                  },
                                  child: AnimatedContainer(
                                    duration: Duration(milliseconds: 150),
                                    decoration: BoxDecoration(
                                        color: controller.curruntValue ==
                                                "Appearance"
                                            ? _isDarkMode.value
                                                ? Theme.of(context)
                                                    .indicatorColor
                                                : Color(0xffEBEBEB)
                                            : Theme.of(context).cardColor,
                                        borderRadius: BorderRadius.all(
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
                                          "  " + "Appearance".tr + "  ",
                                          maxLines: 2,
                                          textAlign: TextAlign.center,
                                          overflow: TextOverflow.ellipsis,
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
                                                color: _isDarkMode.value
                                                    ? Colors.redAccent
                                                    : Color(0xffB03D3D)),
                                            SizedBox(width: 8),
                                            Text(
                                                style: TextStyle(
                                                    color: _isDarkMode.value
                                                        ? Colors.redAccent
                                                        : Color(0xffB03D3D)),
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
                                                color: _isDarkMode.value
                                                    ? Colors.redAccent
                                                    : Color(0xffB03D3D)),
                                            SizedBox(width: 8),
                                            Text(
                                                style: TextStyle(
                                                    color: _isDarkMode.value
                                                        ? Colors.redAccent
                                                        : Color(0xffB03D3D)),
                                                "Logout from All Sessions".tr),
                                          ],
                                        ),
                                      ),
                                    ],
                                    child: Container(
                                      decoration: BoxDecoration(
                                        color: Colors.transparent,
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(20)),
                                      ),
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
                                          Icon(
                                            Icons.login_outlined,
                                            color: _isDarkMode.value
                                                ? Colors.redAccent
                                                : Color(0xffB03D3D),
                                          ),
                                          Text(
                                            "  " + "Logout".tr + "  ",
                                            maxLines: 2,
                                            style: TextStyle(
                                              color: _isDarkMode.value
                                                  ? Colors.redAccent
                                                  : Color(0xffB03D3D),
                                            ),
                                            textAlign: TextAlign.center,
                                            overflow: TextOverflow.ellipsis,
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
                        VerticalDivider(
                          width: 2,
                          color: Color(0xffF6F6F6),
                        ),
                        Expanded(
                            child: Padding(
                          padding:
                              const EdgeInsets.only(left: 15.0, right: 15.0),
                          child: controller.curruntValue == "Appearance"
                              ? Appearance()
                              : controller.curruntValue == "Profile"
                                  ? add_Data_Controller.isLoading == true
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
                                  : controller.curruntValue == "Personal"
                                      ? add_Data_Controller.isLoading == true
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
                                          : Personal()
                                      : controller.curruntValue == "addData"
                                          ? Add_Data_account()
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
    });
  }
}
