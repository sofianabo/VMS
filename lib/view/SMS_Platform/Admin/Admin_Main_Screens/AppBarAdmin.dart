import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:vms_school/Link/API/API.dart';
import 'package:vms_school/Link/API/AdminAPI/Get_My_Profile.dart';
import 'package:vms_school/Link/Controller/AdminController/DrowerController.dart';
import 'package:vms_school/Link/Controller/AdminController/Employee_Controllers/Add_Data_controller.dart';
import 'package:vms_school/Link/Controller/AdminController/Main_Admin_Controller/AdminHomeContentController.dart';
import 'package:vms_school/main.dart';
import 'package:vms_school/view/SMS_Platform/Admin/Admin_Main_Screens/Search_Bar_widget.dart';
import 'package:vms_school/view/Both_Platform/widgets/Responsive.dart';

class AppbarAdmin extends StatefulWidget {
  AppbarAdmin({super.key});

  @override
  State<AppbarAdmin> createState() => _AppbarAdminState();
}

class _AppbarAdminState extends State<AppbarAdmin> {
  var controller = Get.find<Add_Data_controller>();
  TextEditingController serch = TextEditingController();

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
                                  style: Get.theme.textTheme.bodyMedium!
                                      .copyWith(fontSize: 12),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                  left: 5.0, right: 5.0, top: 3.0, bottom: 3.0),
                              child: CircleAvatar(
                                radius: 20,
                                backgroundColor:
                                    Theme.of(context).primaryColorLight,
                                child: prefs!.getString("imageId") != "null"
                                    ? CachedNetworkImage(
                                        imageUrl:
                                            "$getimage${prefs!.getString("imageId")}",
                                        imageBuilder:
                                            (context, imageProvider) =>
                                                CircleAvatar(
                                          radius: 20,
                                          backgroundColor:
                                              Theme.of(context).primaryColor,
                                          backgroundImage: imageProvider,
                                          child: prefs!.getString("imageId") ==
                                                  "null"
                                              ? Text(
                                                  '${prefs!.getString("userName")?.substring(0, 1).toUpperCase() ?? "?"}',
                                                  style: Get
                                                      .textTheme.titleLarge!
                                                      .copyWith(
                                                    fontSize: 14,
                                                    fontWeight: FontWeight.bold,
                                                    color: Colors.white,
                                                  ),
                                                )
                                              : null,
                                        ),
                                        placeholder: (context, url) =>
                                            CircleAvatar(
                                          radius: 20,
                                          backgroundColor:
                                              const Color(0xffC4C4C4),
                                          child: LoadingAnimationWidget.inkDrop(
                                            color:
                                                Theme.of(context).primaryColor,
                                            size: 10,
                                          ),
                                        ),
                                        errorWidget: (context, url, error) =>
                                            Text(
                                          prefs!
                                                  .getString("fullname")
                                                  ?.substring(0, 1)
                                                  .toUpperCase() ??
                                              '',
                                          style: Get.textTheme.titleLarge
                                              ?.copyWith(
                                            color: Colors.white,
                                            fontSize: 12,
                                          ),
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
                              style: Get.theme.textTheme.bodyMedium!
                                  .copyWith(fontSize: 12),
                            ),
                          ),
                        ),
                        Padding(
                            padding: const EdgeInsets.only(
                              left: 5.0,
                              right: 5.0,
                              top: 3.0,
                              bottom: 3.0,
                            ),
                            child: CircleAvatar(
                              radius: 20,
                              backgroundColor:
                                  Theme.of(context).primaryColorLight,
                              child: prefs!.getString("imageId") != "null"
                                  ? CachedNetworkImage(
                                      imageUrl:
                                          "$getimage${prefs!.getString("imageId")}",
                                      imageBuilder: (context, imageProvider) =>
                                          CircleAvatar(
                                        radius: 20,
                                        backgroundColor:
                                            Theme.of(context).primaryColor,
                                        backgroundImage: imageProvider,
                                        child: prefs!.getString("imageId") ==
                                                "null"
                                            ? Text(
                                                '${prefs!.getString("userName")?.substring(0, 1).toUpperCase() ?? "?"}',
                                                style: Get.textTheme.titleLarge!
                                                    .copyWith(
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.bold,
                                                  color: Colors.white,
                                                ),
                                              )
                                            : null,
                                      ),
                                      placeholder: (context, url) =>
                                          CircleAvatar(
                                        radius: 20,
                                        backgroundColor:
                                            const Color(0xffC4C4C4),
                                        child: LoadingAnimationWidget.inkDrop(
                                          color: Theme.of(context).primaryColor,
                                          size: 10,
                                        ),
                                      ),
                                      errorWidget: (context, url, error) =>
                                          Text(
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
                                    )
                                  : Text(
                                      prefs!
                                              .getString("fullname")
                                              ?.substring(0, 1)
                                              .toUpperCase() ??
                                          '',
                                      style: Get.textTheme.titleLarge?.copyWith(
                                        color: Colors.white,
                                        fontSize: 12,
                                      ),
                                    ),
                            ))
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
                          if (screenSize >= 769)
                            GestureDetector(
                              onTap: () {
                                if (Get.find<Add_Data_controller>()
                                    .isVerified) {
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
                                        padding:
                                            const EdgeInsets.only(left: 5.0),
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
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          left: 5.0,
                                          right: 5.0,
                                          top: 3.0,
                                          bottom: 3.0),
                                      child: CircleAvatar(
                                        radius: 20,
                                        backgroundColor:
                                            Theme.of(context).primaryColorLight,
                                        child: prefs!.getString("imageId") !=
                                                "null"
                                            ? CachedNetworkImage(
                                                imageUrl:
                                                    "$getimage${prefs!.getString("imageId")}",
                                                imageBuilder:
                                                    (context, imageProvider) =>
                                                        CircleAvatar(
                                                  radius: 20,
                                                  backgroundColor:
                                                      Theme.of(context)
                                                          .primaryColor,
                                                  backgroundImage:
                                                      imageProvider,
                                                  child: prefs!.getString(
                                                              "imageId") ==
                                                          "null"
                                                      ? Text(
                                                          '${prefs!.getString("userName")?.substring(0, 1).toUpperCase() ?? "?"}',
                                                          style: Get.textTheme
                                                              .titleLarge!
                                                              .copyWith(
                                                            fontSize: 14,
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            color: Colors.white,
                                                          ),
                                                        )
                                                      : null,
                                                ),
                                                placeholder: (context, url) =>
                                                    CircleAvatar(
                                                  radius: 20,
                                                  backgroundColor:
                                                      const Color(0xffC4C4C4),
                                                  child: LoadingAnimationWidget
                                                      .inkDrop(
                                                    color: Theme.of(context)
                                                        .primaryColor,
                                                    size: 10,
                                                  ),
                                                ),
                                                errorWidget:
                                                    (context, url, error) =>
                                                        Text(
                                                  prefs!
                                                          .getString("fullname")
                                                          ?.substring(0, 1)
                                                          .toUpperCase() ??
                                                      '',
                                                  style: Get
                                                      .textTheme.titleLarge
                                                      ?.copyWith(
                                                    color: Colors.white,
                                                    fontSize: 12,
                                                  ),
                                                ),
                                              )
                                            : Text(
                                                prefs!
                                                        .getString("fullname")
                                                        ?.substring(0, 1)
                                                        .toUpperCase() ??
                                                    '',
                                                style: Get.textTheme.titleLarge
                                                    ?.copyWith(
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
                          if (screenSize <= 769)
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
                                enabled: controller.hasData,
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
