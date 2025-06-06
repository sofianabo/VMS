import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:vms_school/Link/API/AdminAPI/School/School_Screen_APIs/Sessions/SessionAPI.dart';
import 'package:vms_school/Link/Controller/AdminController/DrowerController.dart';
import 'package:vms_school/Link/Controller/AdminController/Employee_Controllers/Add_Data_controller.dart';
import 'package:vms_school/Link/Controller/AdminController/Main_Admin_Controller/AdminHomeContentController.dart';
import 'package:vms_school/main.dart';
import 'package:vms_school/view/SMS_Platform/Admin/Admin_Main_Screens/Search_Bar_widget.dart';
import 'package:vms_school/view/SMS_Platform/Guardian/Profile_Screens/My_Profile.dart';
import 'package:vms_school/view/Both_Platform/widgets/Responsive.dart';

class AppbarObserver extends StatefulWidget {
  AppbarObserver({super.key});

  @override
  State<AppbarObserver> createState() => _AppbarAdminState();
}

class _AppbarAdminState extends State<AppbarObserver> {
  @override
  void initState() {
    Get_Session_Screen_API().Getsession();
    super.initState();
  }

  var controller = Get.find<Add_Data_controller>();

  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size.width;
    return Directionality(
      textDirection: TextDirection.rtl,
      child: GetBuilder<AdminHomeContentController>(builder: (cont) {
        return ResponsiveUI(
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
                        Get.dialog(ProfileDialog());
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
                          ],
                        ),
                      ),
                    ),
                    Padding(
                        padding: const EdgeInsets.only(left: 5.0, right: 5.0),
                        child: SearchWithSuggestions(
                          enabled: controller.hasData,
                          onItemSelected: (value) {
                            cont.updateContent(value);
                          },
                        )),
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
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Padding(
                        padding: const EdgeInsets.only(left: 5.0, right: 5.0),
                        child: SearchWithSuggestions(
                          enabled: controller.hasData,
                          onItemSelected: (value) {
                            cont.updateContent(value);
                          },
                        )),
                  ],
                ),
                Expanded(
                    child: Center(
                  child: Text(
                    maxLines: 2,
                    textAlign: TextAlign.center,
                    cont.content.tr,
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Theme.of(context).textTheme.titleMedium!.color!),
                  ),
                )),
                GestureDetector(
                  onTap: () {
                    Get.dialog(ProfileDialog());
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
          ),
          mobileScreen: Container(
            height: 110,
            margin: const EdgeInsets.only(right: 20, left: 20, top: 29),
            child: Stack(
              children: [
                Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(50))),
                  child: Column(
                    spacing: 15.0,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(bottom: 8.0),
                            child: Center(
                              child: Text(
                                cont.content.tr,
                                style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                    color: Theme.of(context)
                                        .textTheme
                                        .titleMedium!
                                        .color!),
                              ),
                            ),
                          ),
                          if (screenSize <= 768)
                            GetBuilder<DraweController>(builder: (cont) {
                              return IconButton(
                                  onPressed: () {
                                    if (cont.isopen == false) {
                                      cont.opendrawer(true);
                                    } else if (cont.isopen == true) {
                                      cont.opendrawer(false);
                                    }
                                  },
                                  style: ButtonStyle(
                                      minimumSize: MaterialStatePropertyAll(
                                          Size(40, 40)),
                                      iconColor: MaterialStatePropertyAll(
                                          Colors.black),
                                      shape: MaterialStatePropertyAll(
                                          RoundedRectangleBorder(
                                              side: BorderSide(
                                                  color: Color(0xffEDEDED),
                                                  width: 1.5),
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(6))))),
                                  icon: Icon(
                                    cont.isopen
                                        ? Icons.arrow_left_sharp
                                        : Icons.more_horiz_rounded,
                                  ));
                            })
                        ],
                      ),
                      LayoutBuilder(
                        builder: (context, constraints) {
                          return Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              SearchWithSuggestions(
                                size: constraints.maxWidth,
                                isFull: true,
                                enabled: true,
                                onItemSelected: (value) {
                                  cont.updateContent(value);
                                },
                              ),
                            ],
                          );
                        },
                      )
                    ],
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
