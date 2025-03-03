import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:vms_school/Link/API/AuthAPI/LogoutAPI.dart';
import 'package:vms_school/Icons_File/v_m_s__icons_icons.dart';
import 'package:vms_school/Link/Controller/AdminController/Main_Admin_Controller/AdminHomeContentController.dart';
import 'package:vms_school/Link/Controller/AuthController/UserController.dart';
import 'package:vms_school/Theme/ThemeData.dart';
import 'package:vms_school/Theme/themeController.dart';
import 'package:vms_school/main.dart';
import 'package:vms_school/widgets/Admin_Profile_Settings.dart';
import 'package:vms_school/widgets/Switcher.dart';
import 'package:vms_school/widgets/TextFormSearch.dart';

class AppbarAdmin extends StatefulWidget {
  AppbarAdmin({super.key});

  @override
  State<AppbarAdmin> createState() => _AppbarAdminState();
}

class _AppbarAdminState extends State<AppbarAdmin> {
  final _isDarkMode = Get.isDarkMode.obs;
  TextEditingController serch = TextEditingController();
  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Container(
        height: 77,
        margin: const EdgeInsets.only(right: 60, left: 30, top: 29),
        width: w,
        child: Row(
          children: [
            GetBuilder<AdminHomeContentController>(builder: (cont) {
              return Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  // Container(
                  //     alignment: Alignment.center,
                  //     width: 40,
                  //     height: 40,
                  //     decoration: BoxDecoration(
                  //         color: Colors.white,
                  //         borderRadius: BorderRadius.circular(5),
                  //         boxShadow: const [
                  //           BoxShadow(
                  //               color: Colors.black12,
                  //               offset: Offset(0, 2),
                  //               blurRadius: 1)
                  //         ]),
                  //     child: IconButton(
                  //         style: const ButtonStyle(
                  //             shape: WidgetStatePropertyAll(
                  //                 RoundedRectangleBorder(
                  //                     borderRadius: BorderRadius.all(
                  //                         Radius.circular(5))))),
                  //         onPressed: () async {
                  //           await Logoutapi(context).Logout();
                  //         },
                  //         icon: Icon(
                  //           Icons.logout_rounded,
                  //           size: 18,
                  //           color: Get.theme.primaryColor,
                  //         ))),
                  // Padding(
                  //   padding: const EdgeInsets.only(right: 5.0),
                  //   child: LanguageSwitcher(
                  //     onLanguageToggle: (bool) {
                  //       print(bool);
                  //     },
                  //   ),
                  // ),
                  // Padding(
                  //     padding: const EdgeInsets.only(right: 5.0),
                  //     child: Container(
                  //         width: 40,
                  //         height: 40,
                  //         decoration: BoxDecoration(
                  //             color: Colors.white,
                  //             borderRadius: BorderRadius.circular(5),
                  //             boxShadow: const [
                  //               BoxShadow(
                  //                   color: Colors.black12,
                  //                   offset: Offset(0, 2),
                  //                   blurRadius: 1)
                  //             ]),
                  //         child: IconButton(
                  //             style: const ButtonStyle(
                  //                 shape: WidgetStatePropertyAll(
                  //                     RoundedRectangleBorder(
                  //                         borderRadius: BorderRadius.all(
                  //                             Radius.circular(5))))),
                  //             onPressed: () {
                  //               Get.changeThemeMode(_isDarkMode.value
                  //                   ? ThemeMode.light
                  //                   : ThemeMode.dark);
                  //               _isDarkMode.value = !_isDarkMode.value;
                  //               Themecontroller.isDarkMode = _isDarkMode.value;
                  //               print(_isDarkMode.value);
                  //             },
                  //             icon: Icon(VMS_Icons.moon,
                  //                 size: 18, color: Get.theme.primaryColor)))),
                  // Padding(
                  //   padding: const EdgeInsets.only(right: 5.0),
                  //   child: Container(
                  //     width: 40,
                  //     height: 40,
                  //     decoration: BoxDecoration(
                  //         color: Colors.white,
                  //         borderRadius: BorderRadius.circular(5),
                  //         boxShadow: const [
                  //           BoxShadow(
                  //               color: Colors.black12,
                  //               offset: Offset(0, 2),
                  //               blurRadius: 1)
                  //         ]),
                  //     child: IconButton(
                  //         style: const ButtonStyle(
                  //             shape: WidgetStatePropertyAll(
                  //                 RoundedRectangleBorder(
                  //                     borderRadius: BorderRadius.all(
                  //                         Radius.circular(5))))),
                  //         onPressed: () {},
                  //         icon: Icon(Icons.notifications_none_outlined,
                  //             size: 18, color: Get.theme.primaryColor)),
                  //   ),
                  // ),
                  GestureDetector(
                    onTap: () {
                      Get.dialog(ProfileDialog());
                    },
                    child: Container(
                      height: 40,
                      width: 200,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(color: Color(0xffDAD0D0)),
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: Row(
                        children: [
                          Icon(
                            Icons.arrow_drop_down,
                            color: Colors.black,
                          ),
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.only(left: 5.0),
                              child: Text(
                                textDirection: TextDirection.ltr,
                                textAlign: TextAlign.start,
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                "Laith Haitham Azzam",
                                style: TextStyle(
                                    fontSize: 12, color: Colors.black),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                                left: 5.0, right: 5.0, top: 3.0, bottom: 3.0),
                            child: Image.asset(
                              "../../images/Rectangle66.png",
                              height: 40,
                              width: 40,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 5.0, right: 5.0),
                    child: TextpageSearch(
                      click: () {},
                      onchange: (value) {},
                      width: 250,
                      radius: 5,
                      controller: serch,
                      suffixIcon: serch.text != "" ? Icons.clear : Icons.search,
                    ),
                  ),
                ],
              );
            }),
            Expanded(
              child: GetBuilder<AdminHomeContentController>(builder: (cont) {
                return Center(
                  child: Text(
                    cont.content.tr,
                    style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Theme.of(context).highlightColor),
                  ),
                );
              }),
            ),
            Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                SvgPicture.asset(
                  Theme.of(context) == theme.Dark_Theme
                      ? "../../images/logodark.svg"
                      : "../../images/logolight.svg",
                  width: 250,
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
