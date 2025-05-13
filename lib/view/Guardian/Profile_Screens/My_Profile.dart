import 'package:get/get.dart';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:vms_school/Link/API/AuthAPI/LogoutAPI.dart';
import 'package:vms_school/Link/Controller/GuardianController/Guardian_My_Data_Controller.dart';
import 'package:vms_school/view/Admin/All_Settings/Apperance.dart';

import 'MyAccount.dart';
import 'Personal.dart';

class ProfileDialog extends StatefulWidget {
  const ProfileDialog({super.key});

  @override
  State<ProfileDialog> createState() => _ProfileDialogState();
}

class _ProfileDialogState extends State<ProfileDialog> {
  @override
  Widget build(BuildContext context) {
    return BackdropFilter(
      filter: ImageFilter.blur(sigmaX: 2, sigmaY: 2),
      child: GetBuilder<Guardian_My_Data_Controller>(builder: (controller) {
        return AlertDialog(
          backgroundColor: Theme.of(context).dialogTheme.backgroundColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5),
          ),
          surfaceTintColor: Colors.transparent,
          insetPadding: const EdgeInsets.only(top: 20, bottom: 20.0),
          titlePadding: EdgeInsets.zero,
          contentPadding: const EdgeInsets.only(
              top: 0, left: 35.0, right: 35.0, bottom: 20.0),
          actionsPadding: const EdgeInsets.all(15.0),
          content: SizedBox(
            width: 600,
            child: DefaultTabController(
              length: 3,
              child: Column(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      border: Border(
                        bottom:
                            BorderSide(color: Colors.grey.shade300, width: 1.0),
                      ),
                    ),
                    child: TabBar(
                      labelColor:
                          Theme.of(context).textTheme.titleMedium!.color,
                      unselectedLabelColor: Colors.grey,
                      indicatorColor:
                          Theme.of(context).textTheme.titleMedium!.color,
                      tabs: [
                        Tab(
                          icon: Icon(Icons.generating_tokens_outlined),
                          text: "General".tr,
                        ),
                        Tab(
                          icon: Icon(Icons.person_2_outlined),
                          text: "Personal".tr,
                        ),
                        Tab(
                          icon: Icon(Icons.contact_mail_outlined),
                          text: "Account".tr,
                        ),
                      ],
                    ),
                  ),

                  // محتوى التبويبات
                  Expanded(
                    child: TabBarView(
                      children: [
                        // المحتوى الأول
                        SingleChildScrollView(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            mainAxisSize: MainAxisSize.min,
                            spacing: 10.0,
                            children: [
                              Appearance(),
                              Padding(
                                padding: const EdgeInsets.only(
                                    left: 35.0, right: 15.0, top: 15.0),
                                child: Divider(
                                  height: 1,
                                  color: Color(0xffD9D9D9),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(
                                    top: 10.0, bottom: 10.0),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Logout".tr,
                                      style: TextStyle(
                                        color: Get
                                            .theme.textTheme.bodyMedium!.color,
                                        fontSize: 16,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Column(
                                children: [
                                  TextButton(
                                    onPressed: () async {
                                      await Logoutapi(context)
                                          .Logout(Type: "now");
                                    },
                                    child: Row(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        Icon(Icons.logout,
                                            size: 18, color: Color(0xffB03D3D)),
                                        SizedBox(width: 8),
                                        Text(
                                            style: TextStyle(
                                                color: Color(0xffB03D3D)),
                                            "Logout from Current Session".tr),
                                      ],
                                    ),
                                  ),
                                  TextButton(
                                    onPressed: () async {
                                      await Logoutapi(context)
                                          .Logout(Type: "all");
                                    },
                                    child: Row(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        Icon(Icons.mobile_off,
                                            size: 18, color: Color(0xffB03D3D)),
                                        SizedBox(width: 8),
                                        Text(
                                            style: TextStyle(
                                                color: Color(0xffB03D3D)),
                                            "Logout from All Sessions".tr),
                                      ],
                                    ),
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),

                        // المحتوى الثاني
                        Center(
                            child: controller.isLoading
                                ? LoadingAnimationWidget.inkDrop(
                                    color: Theme.of(context).primaryColor,
                                    size: 30,
                                  )
                                : Personal()),

                        Padding(
                          padding: const EdgeInsets.only(top: 25.0),
                          child: controller.isLoading
                              ? LoadingAnimationWidget.inkDrop(
                                  color: Theme.of(context).primaryColor,
                                  size: 30,
                                )
                              : MyAccount(),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding:
                    const EdgeInsets.only(right: 35.0, left: 35.0, top: 20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      "Settings".tr,
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(5.0),
                child: IconButton(
                  color: Colors.transparent,
                  focusColor: Colors.transparent,
                  hoverColor: Colors.transparent,
                  splashColor: Colors.transparent,
                  onPressed: () {
                    Get.back();
                  },
                  icon: Icon(Icons.close_rounded,
                      color: Theme.of(context).textTheme.titleMedium!.color),
                ),
              ),
            ],
          ),
        );
      }),
    );
  }
}
