import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:vms_school/Link/API/LMS_APIs/Admin/Gat_ClassLMS.dart';
import 'package:vms_school/Link/API/OpenURLs.dart';
import 'package:vms_school/Link/Controller/AdminController/Employee_Controllers/Add_Data_controller.dart';
import 'package:vms_school/Link/Controller/LMS_Controllers/Admin_LMS/Home_Controller.dart';
import 'package:vms_school/Link/Controller/LMS_Controllers/Admin_LMS/Selected_Screen.dart';
import 'package:vms_school/Translate/local_controller.dart';
import 'package:vms_school/view/Both_Platform/widgets/ButtonsDialog.dart';
import 'package:vms_school/view/Both_Platform/widgets/GridAnimation.dart';
import 'package:vms_school/view/Both_Platform/widgets/Schema_Widget.dart';
import 'package:vms_school/view/LMS_Platform/Admin/Admin_Main_Screens/Appbar_Admin_LMS.dart';
import 'package:vms_school/view/LMS_Platform/Admin/LMS_Main_Selection.dart';

class Admin_Home_LMS extends StatefulWidget {
  const Admin_Home_LMS({super.key});

  @override
  State<Admin_Home_LMS> createState() => _Admin_Home_LMSState();
}

class _Admin_Home_LMSState extends State<Admin_Home_LMS> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Get_Classes_LMS_API().Get_Classes_LMS();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    int getCrossAxisCount() {
      if (screenWidth >= 1278) return 5;
      if (screenWidth >= 1070) return 4;
      if (screenWidth >= 950) return 3;
      if (screenWidth >= 769) return 2;
      return 1;
    }

    double getChildAspectRatio() {
      if (screenWidth >= 1070) return 1.1;
      if (screenWidth >= 950) return 1.1;
      if (screenWidth >= 838) return 1.6;
      if (screenWidth >= 769) return 1.5;
      if (screenWidth >= 613) return 2.2;
      if (screenWidth >= 486) return 1.7;
      return 1.2;
    }

    return Scaffold(
      body: GetBuilder<Add_Data_controller>(builder: (conts) {
        if (!conts.isVerified) {
          return Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
              spacing: 10.0,
              children: [
                Text("You have not confirmed your account yet.".tr),
                ButtonDialog(
                    text: "Verified Now".tr,
                    onPressed: () async {
                      if (!conts.isVerified) {
                        if (!Get.isDialogOpen!) {
                          await conts.showVerificationDialog();
                        }
                      }
                    },
                    color: Theme.of(context).primaryColor,
                    width: 250),
              ],
            ),
          );
        } else {
          return Column(
            spacing: 15.0,
            children: [
              AppbarAdmin_LMS(
                name: "All Classes".tr,
              ),
              Expanded(
                child: Directionality(
                  textDirection: Get.find<LocalizationController>()
                              .currentLocale
                              .value
                              .languageCode ==
                          'ar'
                      ? TextDirection.rtl
                      : TextDirection.ltr,
                  child: GetBuilder<Home_Controller_LMS>(builder: (control) {
                    return control.isLoading == true
                        ? GridView.builder(
                            padding: const EdgeInsets.only(
                                top: 10, left: 40, right: 40),
                            gridDelegate:
                                SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: getCrossAxisCount(),
                                    crossAxisSpacing: 20.0,
                                    mainAxisSpacing: 20.0,
                                    childAspectRatio: getChildAspectRatio()),
                            itemCount: 10,
                            itemBuilder: (context, index) {
                              return HoverScaleCard(
                                child: Container(
                                    padding: const EdgeInsets.all(20),
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(5),
                                        border: Border.all(
                                            color: Colors.grey, width: 0.5),
                                        color: Theme.of(context).cardColor,
                                        boxShadow: const [
                                          BoxShadow(
                                              color: Colors.black26,
                                              offset: Offset(0, 2),
                                              blurRadius: 1)
                                        ]),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        SchemaWidget(width: 35, height: 35),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            SchemaWidget(width: 20, height: 15),
                                          ],
                                        ),
                                        SchemaWidget(width: 25, height: 15),
                                        SchemaWidget(width: 25, height: 15),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            SchemaWidget(width: 25, height: 15),
                                            SchemaWidget(width: 20, height: 20),
                                          ],
                                        )
                                      ],
                                    )),
                              )
                                  .animate(
                                      onPlay: (controller) =>
                                          controller.repeat())
                                  .shimmer(
                                      angle: 1,
                                      color: Colors.grey.withOpacity(0.2),
                                      duration: const Duration(seconds: 1),
                                      delay: const Duration(seconds: 1));
                            },
                          )
                        : control.filteredreclasses!.isNotEmpty
                            ? GridView.builder(
                                padding: const EdgeInsets.only(
                                    top: 10, left: 40, right: 40),
                                gridDelegate:
                                    SliverGridDelegateWithFixedCrossAxisCount(
                                        crossAxisCount: getCrossAxisCount(),
                                        crossAxisSpacing: 20.0,
                                        mainAxisSpacing: 20.0,
                                        childAspectRatio:
                                            getChildAspectRatio()),
                                itemCount: control.filteredreclasses!.length,
                                itemBuilder: (context, index) {
                                  return HoverScaleCard(
                                    child: GestureDetector(
                                      onTap: () {
                                        Get.find<Selected_Class_Controller>()
                                            .initialinClass(
                                                control
                                                    .filteredreclasses![index]
                                                    .name!,
                                                control
                                                    .filteredreclasses![index]
                                                    .id!);
                                        Get.to(Selected_Class_Screen());
                                      },
                                      child: Container(
                                          padding: const EdgeInsets.all(20),
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(5),
                                              border: Border.all(
                                                  color: Theme.of(context)
                                                      .textTheme
                                                      .titleMedium!
                                                      .color!,
                                                  width: 0.5),
                                              color:
                                                  Theme.of(context).cardColor,
                                              boxShadow: const [
                                                BoxShadow(
                                                    color: Colors.black26,
                                                    offset: Offset(0, 2),
                                                    blurRadius: 1)
                                              ]),
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              SizedBox(
                                                height: 10,
                                              ),
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.center,
                                                children: [
                                                  Container(
                                                    alignment: Alignment.center,
                                                    width: 180,
                                                    child: Text(
                                                        Get.find<LocalizationController>()
                                                                    .currentLocale
                                                                    .value
                                                                    .languageCode ==
                                                                'ar'
                                                            ? "${control.filteredreclasses![index].name}"
                                                            : "${control.filteredreclasses![index].enName}",
                                                        style: Theme.of(context)
                                                            .textTheme
                                                            .titleMedium!
                                                            .copyWith(
                                                              fontSize: 20,
                                                            )),
                                                  ),
                                                ],
                                              ),
                                              SizedBox(
                                                height: 25,
                                              ),
                                              Text(
                                                  Get.find<LocalizationController>()
                                                              .currentLocale
                                                              .value
                                                              .languageCode ==
                                                          'ar'
                                                      ? "${control.filteredreclasses![index].grade!.name}"
                                                      : "${control.filteredreclasses![index].grade!.enName}",
                                                  style: Theme.of(context)
                                                      .textTheme
                                                      .titleMedium!
                                                      .copyWith(
                                                          fontWeight:
                                                              FontWeight.normal,
                                                          fontSize: 18)),
                                              SizedBox(
                                                height: 15,
                                              ),
                                              Text(
                                                  "${control.filteredreclasses![index].session!.year}",
                                                  style: Theme.of(context)
                                                      .textTheme
                                                      .titleMedium!
                                                      .copyWith(
                                                          fontWeight:
                                                              FontWeight.normal,
                                                          fontSize: 18)),
                                              Expanded(
                                                child: Column(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.end,
                                                  children: [
                                                    TextButton(
                                                        style: ButtonStyle(
                                                            backgroundColor:
                                                                WidgetStatePropertyAll(
                                                                    Colors
                                                                        .transparent),
                                                            shape: WidgetStatePropertyAll(
                                                                RoundedRectangleBorder(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .all(Radius
                                                                          .circular(
                                                                              3)),
                                                              side: BorderSide(
                                                                  color: Get
                                                                      .theme
                                                                      .textTheme
                                                                      .titleMedium!
                                                                      .color!),
                                                            ))),
                                                        onPressed: () async {
                                                          if (control
                                                                      .filteredreclasses![
                                                                          index]
                                                                      .driveUrl !=
                                                                  null &&
                                                              control
                                                                  .filteredreclasses![
                                                                      index]
                                                                  .driveUrl!
                                                                  .isNotEmpty) {
                                                            launchLink(
                                                              url:
                                                                  "${control.filteredreclasses![index].driveUrl!}",
                                                              type: LinkType
                                                                  .website,
                                                              context: context,
                                                            );
                                                          }
                                                        },
                                                        child: Row(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .spaceBetween,
                                                          spacing: 10.0,
                                                          children: [
                                                            Padding(
                                                              padding:
                                                                  const EdgeInsets
                                                                      .only(
                                                                      left: 5.0,
                                                                      right:
                                                                          5.0),
                                                              child: Text(
                                                                'Drive URL'.tr,
                                                                style: Get
                                                                    .theme
                                                                    .textTheme
                                                                    .headlineMedium!
                                                                    .copyWith(
                                                                        color: Color.fromARGB(
                                                                            255,
                                                                            44,
                                                                            128,
                                                                            184)),
                                                              ),
                                                            ),
                                                            SvgPicture.asset(
                                                              "assets/images/drive.svg",
                                                              width: 20,
                                                            )
                                                          ],
                                                        )),
                                                  ],
                                                ),
                                              )
                                            ],
                                          )),
                                    ),
                                  );
                                },
                              )
                            : Center(
                                child: Text("No Classes".tr,
                                    style: Theme.of(context)
                                        .textTheme
                                        .titleMedium!
                                        .copyWith(
                                            fontSize: 22,
                                            fontWeight: FontWeight.normal)));
                  }),
                ),
              ),
            ],
          );
        }
      }),
    );
  }
}
