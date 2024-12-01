import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:vms_school/Link/API/AuthAPI/LogoutAPI.dart';
import 'package:vms_school/Icons_File/v_m_s__icons_icons.dart';
import 'package:vms_school/Link/Controller/AdminController/Main_Admin_Controller/AdminHomeContentController.dart';
import 'package:vms_school/Link/Controller/AuthController/UserController.dart';
import 'package:vms_school/Theme/themeController.dart';
import 'package:vms_school/main.dart';

class AppbarAdmin extends StatelessWidget {
  const AppbarAdmin({super.key});

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
                  Container(
                      alignment: Alignment.center,
                      width: 40,
                      height: 40,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(5),
                          boxShadow: const [
                            BoxShadow(
                                color: Colors.black12,
                                offset: Offset(0, 2),
                                blurRadius: 1)
                          ]),
                      child: IconButton(
                          style: ButtonStyle(
                              shape: WidgetStatePropertyAll(
                                  RoundedRectangleBorder(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(5))))),
                          onPressed: () async {
                            await Logoutapi(context).Logout();
                          },
                          icon: Icon(
                            Icons.logout_rounded,
                            size: 18,
                            color: Get.theme.primaryColor,
                          ))),
                  Padding(
                    padding: const EdgeInsets.only(right: 5.0),
                    child: Container(
                      width: 40,
                      height: 40,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(5),
                          boxShadow: const [
                            BoxShadow(
                                color: Colors.black12,
                                offset: Offset(0, 2),
                                blurRadius: 1)
                          ]),
                      child: GetBuilder<ThemeController>(builder: (controller) {
                        return IconButton(
                            style: ButtonStyle(
                                shape: WidgetStatePropertyAll(
                                    RoundedRectangleBorder(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(5))))),
                            onPressed: () {
                              controller.toggleTheme();
                            },
                            icon: Icon(VMS_Icons.moon,
                                size: 18, color: Get.theme.primaryColor));
                      }),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 5.0),
                    child: Container(
                      width: 40,
                      height: 40,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(5),
                          boxShadow: const [
                            BoxShadow(
                                color: Colors.black12,
                                offset: Offset(0, 2),
                                blurRadius: 1)
                          ]),
                      child: IconButton(
                          style: ButtonStyle(
                              shape: WidgetStatePropertyAll(
                                  RoundedRectangleBorder(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(5))))),
                          onPressed: () {},
                          icon: Icon(Icons.notifications_none_outlined,
                              size: 18, color: Get.theme.primaryColor)),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 5.0),
                    child: Container(
                      height: 40,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(5),
                          boxShadow: const [
                            BoxShadow(
                                color: Colors.black12,
                                offset: Offset(0, 2),
                                blurRadius: 1)
                          ]),
                      width: 200,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Image.asset(
                            "../../images/Home-Background2.png",
                            height: 50,
                            width: 50,
                          ),
                          GetBuilder<UserController>(builder: (control) {
                            return Text(
                              "${prefs!.getString("username")}",
                              style: Get.theme.textTheme.bodyMedium!,
                            );
                          })
                        ],
                      ),
                    ),
                  )
                ],
              );
            }),
            Expanded(
              child: GetBuilder<AdminHomeContentController>(builder: (cont) {
                return Center(
                  child: Text(
                    cont.content,
                    style: Get.theme.textTheme.titleLarge!.copyWith(
                      fontSize: 24,
                      fontWeight: FontWeight.bold
                    ),
                  ),
                );
              }),
            ),
            Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                GetBuilder<ThemeController>(builder: (controller) {
                  return Obx(() => SvgPicture.asset(
                        controller.isDarkMode.value
                            ? "../../images/logodark.svg"
                            : "../../images/logolight.svg",
                        width: 250,
                      ));
                })
              ],
            )
          ],
        ),
      ),
    );
  }
}
