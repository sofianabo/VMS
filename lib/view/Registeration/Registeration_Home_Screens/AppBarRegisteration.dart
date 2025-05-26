import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:vms_school/Link/API/API.dart';
import 'package:vms_school/Link/API/AdminAPI/Get_My_Profile.dart';
import 'package:vms_school/Link/Controller/AdminController/Employee_Controllers/Add_Data_controller.dart';
import 'package:vms_school/Link/Controller/AdminController/Main_Admin_Controller/AdminHomeContentController.dart';
import 'package:vms_school/main.dart';
import 'package:vms_school/widgets/Responsive.dart';

class AppbarRegisteration extends StatefulWidget {
  AppbarRegisteration({super.key});

  @override
  State<AppbarRegisteration> createState() => _AppbarRegisterationState();
}

class _AppbarRegisterationState extends State<AppbarRegisteration> {
  var controller = Get.find<Add_Data_controller>();

  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: GetBuilder<AdminHomeContentController>(builder: (cont) {
        return ResponsiveUI(
          desktopScreen: Container(
            margin: const EdgeInsets.only(
                right: 60, left: 30, top: 15, bottom: 0.0),
            height: 77,
            child: Row(
              children: [
                Row(
                  spacing: 10.0,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    GestureDetector(
                      onTap: () {
                        if (Get.find<Add_Data_controller>().isVerified) {
                          if (cont.content != "My Profile") {
                            Get_My_Profile.Get_My_Profile_Data();
                          }
                        }
                        cont.updateContent("My Profile");
                      },
                      child: Container(
                        height: 40,
                        width: 200,
                        decoration: BoxDecoration(
                          color: controller.hasData
                              ? Theme.of(context).cardColor
                              : Theme.of(context).disabledColor,
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
                                  style: TextStyle(
                                      fontSize: 12, color: Colors.black),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                  left: 5.0, right: 5.0, top: 3.0, bottom: 3.0),
                              child: CircleAvatar(
                                radius: 20,
                                backgroundColor: Theme.of(context).primaryColor,
                                child: prefs!.getString("imageId") != "null"
                                    ? CircleAvatar(
                                        radius: 20,
                                        backgroundColor:
                                            Theme.of(context).primaryColor,
                                        backgroundImage: NetworkImage(
                                          headers: {
                                            "ngrok-skip-browser-warning":
                                                "true",
                                            'User-Agent': 'Custom User-Agent',
                                            'accept': 'application/json',
                                            'authorization':
                                                'Bearer ${prefs!.getString("token")}',
                                          },
                                          "$getimage${prefs!.getString("imageId")}",
                                        ),
                                      )
                                    : Text(
                                        prefs!
                                                .getString("fullname")
                                                ?.substring(0, 1)
                                                .toUpperCase() ??
                                            '',
                                        style:
                                            Get.textTheme.titleLarge?.copyWith(
                                          color: Colors.white,
                                          fontSize: 12,
                                        ),
                                      ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Container(
                      width: 40,
                      height: 40,
                      decoration: BoxDecoration(
                          color: Theme.of(context).cardColor,
                          borderRadius: BorderRadius.circular(5),
                          boxShadow: const [
                            BoxShadow(
                                color: Colors.black12,
                                offset: Offset(0, 2),
                                blurRadius: 1)
                          ]),
                      child: IconButton(
                          style: const ButtonStyle(
                              shape: WidgetStatePropertyAll(
                                  RoundedRectangleBorder(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(5))))),
                          onPressed: () {
                            cont.updateContent("Enroll Requests");
                          },
                          icon: Icon(
                            size: 16.0,
                            Icons.backup_table_sharp,
                            color:
                                Theme.of(context).textTheme.titleMedium!.color!,
                          )),
                    ),
                  ],
                ),
                Expanded(
                  child: Center(
                    child: Text(
                      cont.content.tr,
                      style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color:
                              Theme.of(context).textTheme.titleMedium!.color!),
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
            margin: const EdgeInsets.only(right: 60, left: 30, top: 29),
            height: 77,
            child: Row(
              children: [
                Row(
                  spacing: 10.0,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    GestureDetector(
                      onTap: () {
                        if (Get.find<Add_Data_controller>().isVerified) {
                          if (cont.content != "My Profile") {
                            Get_My_Profile.Get_My_Profile_Data();
                          }
                        }
                        cont.updateContent("My Profile");
                      },
                      child: Container(
                        height: 40,
                        width: 200,
                        decoration: BoxDecoration(
                          color: controller.hasData
                              ? Theme.of(context).cardColor
                              : Theme.of(context).disabledColor,
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
                                  style: TextStyle(
                                      fontSize: 12, color: Colors.black),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                  left: 5.0, right: 5.0, top: 3.0, bottom: 3.0),
                              child: CircleAvatar(
                                radius: 20,
                                backgroundColor: Theme.of(context).primaryColor,
                                child: prefs!.getString("imageId") != "null"
                                    ? CircleAvatar(
                                        radius: 20,
                                        backgroundColor:
                                            Theme.of(context).primaryColor,
                                        backgroundImage: NetworkImage(
                                          headers: {
                                            "ngrok-skip-browser-warning":
                                                "true",
                                            'User-Agent': 'Custom User-Agent',
                                            'accept': 'application/json',
                                            'authorization':
                                                'Bearer ${prefs!.getString("token")}',
                                          },
                                          "$getimage${prefs!.getString("imageId")}",
                                        ),
                                      )
                                    : Text(
                                        prefs!
                                                .getString("fullname")
                                                ?.substring(0, 1)
                                                .toUpperCase() ??
                                            '',
                                        style:
                                            Get.textTheme.titleLarge?.copyWith(
                                          color: Colors.white,
                                          fontSize: 12,
                                        ),
                                      ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Container(
                      width: 40,
                      height: 40,
                      decoration: BoxDecoration(
                          color: Theme.of(context).cardColor,
                          borderRadius: BorderRadius.circular(5),
                          boxShadow: const [
                            BoxShadow(
                                color: Colors.black12,
                                offset: Offset(0, 2),
                                blurRadius: 1)
                          ]),
                      child: IconButton(
                          style: const ButtonStyle(
                              shape: WidgetStatePropertyAll(
                                  RoundedRectangleBorder(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(5))))),
                          onPressed: () {
                            cont.updateContent("Enroll Requests");
                          },
                          icon: Icon(
                            size: 16.0,
                            Icons.backup_table_sharp,
                            color:
                                Theme.of(context).textTheme.titleMedium!.color!,
                          )),
                    ),
                  ],
                ),
                Expanded(
                  child: Center(
                    child: Text(
                      cont.content.tr,
                      style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color:
                              Theme.of(context).textTheme.titleMedium!.color!),
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
                      width: 180,
                    )
                  ],
                )
              ],
            ),
          ),
          mobileScreen: Container(
            height: 110,
            margin: const EdgeInsets.only(right: 20, left: 20, top: 29),
            child: Column(
              spacing: 10.0,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row(
                  spacing: 10.0,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    GestureDetector(
                      onTap: () {
                        if (Get.find<Add_Data_controller>().isVerified) {
                          if (cont.content != "My Profile") {
                            Get_My_Profile.Get_My_Profile_Data();
                          }
                        }
                        cont.updateContent("My Profile");
                      },
                      child: Container(
                        height: 40,
                        width: 200,
                        decoration: BoxDecoration(
                          color: controller.hasData
                              ? Theme.of(context).cardColor
                              : Theme.of(context).disabledColor,
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
                                  style: TextStyle(
                                      fontSize: 12, color: Colors.black),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                  left: 5.0, right: 5.0, top: 3.0, bottom: 3.0),
                              child: CircleAvatar(
                                radius: 20,
                                backgroundColor: Theme.of(context).primaryColor,
                                child: prefs!.getString("imageId") != "null"
                                    ? CircleAvatar(
                                        radius: 20,
                                        backgroundColor:
                                            Theme.of(context).primaryColor,
                                        backgroundImage: NetworkImage(
                                          headers: {
                                            "ngrok-skip-browser-warning":
                                                "true",
                                            'User-Agent': 'Custom User-Agent',
                                            'accept': 'application/json',
                                            'authorization':
                                                'Bearer ${prefs!.getString("token")}',
                                          },
                                          "$getimage${prefs!.getString("imageId")}",
                                        ),
                                      )
                                    : Text(
                                        prefs!
                                                .getString("fullname")
                                                ?.substring(0, 1)
                                                .toUpperCase() ??
                                            '',
                                        style:
                                            Get.textTheme.titleLarge?.copyWith(
                                          color: Colors.white,
                                          fontSize: 12,
                                        ),
                                      ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Container(
                      width: 40,
                      height: 40,
                      decoration: BoxDecoration(
                          color: Theme.of(context).cardColor,
                          borderRadius: BorderRadius.circular(5),
                          boxShadow: const [
                            BoxShadow(
                                color: Colors.black12,
                                offset: Offset(0, 2),
                                blurRadius: 1)
                          ]),
                      child: IconButton(
                          style: const ButtonStyle(
                              shape: WidgetStatePropertyAll(
                                  RoundedRectangleBorder(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(5))))),
                          onPressed: () {
                            cont.updateContent("Enroll Requests");
                          },
                          icon: Icon(
                            size: 16.0,
                            Icons.backup_table_sharp,
                            color:
                                Theme.of(context).textTheme.titleMedium!.color!,
                          )),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 20.0),
                  child: Center(
                    child: Text(
                      cont.content.tr,
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color:
                              Theme.of(context).textTheme.titleMedium!.color!),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      }),
    );
  }
}
