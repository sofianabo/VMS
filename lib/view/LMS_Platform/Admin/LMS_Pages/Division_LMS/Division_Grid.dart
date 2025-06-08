import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:get/get.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:vms_school/Link/API/LMS_APIs/Admin/GetHomework_LMSAPI.dart';
import 'package:vms_school/Link/API/LMS_APIs/Admin/Get_All_Curr_LMS.dart';
import 'package:vms_school/Link/API/LMS_APIs/Admin/Get_LMS_Division.dart';
import 'package:vms_school/Link/API/OpenURLs.dart';
import 'package:vms_school/Link/Controller/LMS_Controllers/Admin_LMS/LMS_Divisions_Controller.dart';
import 'package:vms_school/Link/Controller/LMS_Controllers/Admin_LMS/Selected_Screen.dart';
import 'package:vms_school/Translate/local_controller.dart';
import 'package:vms_school/view/Both_Platform/widgets/GridAnimation.dart';
import 'package:vms_school/view/Both_Platform/widgets/Schema_Widget.dart';

class DivisionGrid extends StatefulWidget {
  DivisionGrid({super.key});

  @override
  State<DivisionGrid> createState() => _DivisionGridState();
}

class _DivisionGridState extends State<DivisionGrid> {
  @override
  void initState() {
    Get_LMS_Division_API(context).Get_LMS_Division();
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

    return Directionality(
      textDirection:
          Get.find<LocalizationController>().currentLocale.value.languageCode ==
                  'ar'
              ? TextDirection.rtl
              : TextDirection.ltr,
      child: GetBuilder<LMS_Divisions_Controller>(builder: (control) {
        return control.isLoading == true
            ? GridView.builder(
                padding: const EdgeInsets.only(top: 10, left: 40, right: 40),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
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
                                color: Theme.of(context)
                                    .textTheme
                                    .titleMedium!
                                    .color!,
                                width: 0.5),
                            color: Theme.of(context).cardColor,
                            boxShadow: const [
                              BoxShadow(
                                  color: Colors.black26,
                                  offset: Offset(0, 2),
                                  blurRadius: 1)
                            ]),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  SchemaWidget(width: 120, height: 15)
                                ],
                              ),
                            ),
                            Column(
                              spacing: 10.0,
                              children: [
                                SchemaWidget(
                                  width: 300,
                                  height: 25,
                                  radius: 5,
                                ),
                                SchemaWidget(
                                  width: 300,
                                  height: 25,
                                  radius: 5,
                                ),
                                SchemaWidget(
                                  width: 300,
                                  height: 25,
                                  radius: 5,
                                ),
                              ],
                            )
                          ],
                        )),
                  )
                      .animate(onPlay: (controller) => controller.repeat())
                      .shimmer(
                          angle: 1,
                          color: Colors.grey.withOpacity(0.2),
                          duration: const Duration(seconds: 1),
                          delay: const Duration(seconds: 1));
                },
              )
            : control.division!.isNotEmpty
                ? GridView.builder(
                    padding:
                        const EdgeInsets.only(top: 10, left: 40, right: 40),
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: getCrossAxisCount(),
                        crossAxisSpacing: 20.0,
                        mainAxisSpacing: 20.0,
                        childAspectRatio: getChildAspectRatio()),
                    itemCount: control.division!.length,
                    itemBuilder: (context, index) {
                      return HoverScaleCard(
                        child: GestureDetector(
                          onTap: () {},
                          child: Stack(
                            children: [
                              Container(
                                  padding: const EdgeInsets.all(20),
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(5),
                                      border: Border.all(
                                          color: Theme.of(context)
                                              .textTheme
                                              .titleMedium!
                                              .color!,
                                          width: 0.5),
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
                                      Expanded(
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            Expanded(
                                              child: Text(
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                  "${Get.find<LocalizationController>().currentLocale.value.languageCode == 'ar' ? control.division![index].name : control.division![index].enName}",
                                                  style: Theme.of(context)
                                                      .textTheme
                                                      .titleMedium!
                                                      .copyWith(
                                                        fontSize: 20,
                                                      )),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Column(
                                        spacing: 10.0,
                                        children: [
                                          TextButton(
                                              style: ButtonStyle(
                                                  backgroundColor:
                                                      WidgetStatePropertyAll(
                                                          Colors.transparent),
                                                  shape: WidgetStatePropertyAll(
                                                      RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.all(
                                                            Radius.circular(3)),
                                                    side: BorderSide(
                                                        color: Get
                                                            .theme
                                                            .textTheme
                                                            .titleMedium!
                                                            .color!),
                                                  ))),
                                              onPressed: () {
                                                Get.find<Selected_Class_Controller>()
                                                        .divisionid =
                                                    control.division![index].id;
                                                Get.find<
                                                        Selected_Class_Controller>()
                                                    .addToPath(
                                                        "All Students".tr);
                                              },
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                spacing: 10.0,
                                                children: [
                                                  Padding(
                                                    padding:
                                                        const EdgeInsets.only(
                                                            left: 5.0,
                                                            right: 5.0),
                                                    child: Text(
                                                      'All Students'.tr,
                                                      style: Get.theme.textTheme
                                                          .headlineMedium!
                                                          .copyWith(
                                                              color: Color
                                                                  .fromARGB(
                                                                      255,
                                                                      44,
                                                                      128,
                                                                      184)),
                                                    ),
                                                  ),
                                                  Icon(
                                                    Icons.person,
                                                    size: 14.0,
                                                  ),
                                                ],
                                              )),
                                          TextButton(
                                              style: ButtonStyle(
                                                  backgroundColor:
                                                      WidgetStatePropertyAll(
                                                          Colors.transparent),
                                                  shape: WidgetStatePropertyAll(
                                                      RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.all(
                                                            Radius.circular(3)),
                                                    side: BorderSide(
                                                        color: Get
                                                            .theme
                                                            .textTheme
                                                            .titleMedium!
                                                            .color!),
                                                  ))),
                                              onPressed: () async {
                                                Get.find<Selected_Class_Controller>()
                                                        .divisionid =
                                                    control.division![index].id;
                                                Get.find<
                                                        Selected_Class_Controller>()
                                                    .addToPath("Homework".tr);
                                                GethomeworkLmsapi()
                                                    .GethomeworkLms(
                                                        id: control
                                                            .division![index]
                                                            .id);
                                              },
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                spacing: 10.0,
                                                children: [
                                                  Padding(
                                                    padding:
                                                        const EdgeInsets.only(
                                                            left: 5.0,
                                                            right: 5.0),
                                                    child: Text(
                                                      'Homeworks'.tr,
                                                      style: Get.theme.textTheme
                                                          .headlineMedium!
                                                          .copyWith(
                                                              color: Color
                                                                  .fromARGB(
                                                                      255,
                                                                      44,
                                                                      128,
                                                                      184)),
                                                    ),
                                                  ),
                                                  Icon(
                                                    Icons
                                                        .insert_page_break_rounded,
                                                    size: 14.0,
                                                  ),
                                                ],
                                              )),
                                          TextButton(
                                              style: ButtonStyle(
                                                  backgroundColor:
                                                      WidgetStatePropertyAll(
                                                          Colors.transparent),
                                                  shape: WidgetStatePropertyAll(
                                                      RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.all(
                                                            Radius.circular(3)),
                                                    side: BorderSide(
                                                        color: Get
                                                            .theme
                                                            .textTheme
                                                            .titleMedium!
                                                            .color!),
                                                  ))),
                                              onPressed: () async {
                                                if (control.division![index]
                                                            .meetUrl !=
                                                        null &&
                                                    control.division![index]
                                                        .meetUrl!.isNotEmpty) {
                                                  launchLink(
                                                    url:
                                                        "${control.division![index].meetUrl!}",
                                                    type: LinkType.website,
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
                                                        const EdgeInsets.only(
                                                            left: 5.0,
                                                            right: 5.0),
                                                    child: Text(
                                                      'Meet URL'.tr,
                                                      style: Get.theme.textTheme
                                                          .headlineMedium!
                                                          .copyWith(
                                                              color: Color
                                                                  .fromARGB(
                                                                      255,
                                                                      44,
                                                                      128,
                                                                      184)),
                                                    ),
                                                  ),
                                                  SvgPicture.asset(
                                                    "assets/images/meet.svg",
                                                    width: 14,
                                                  ),
                                                ],
                                              )),
                                        ],
                                      )
                                    ],
                                  )),
                              if (control.division![index].meetUrl != null &&
                                  control.division![index].meetUrl!.isNotEmpty)
                                Padding(
                                  padding: const EdgeInsets.all(15.0),
                                  child: Container(
                                    width: 15,
                                    height: 15,
                                    decoration: BoxDecoration(
                                        border: Border.all(
                                            color: Get.theme.textTheme
                                                .titleMedium!.color!),
                                        color: Colors.green,
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(50))),
                                  ),
                                ),
                            ],
                          ),
                        ),
                      );
                    },
                  )
                : Center(
                    child: Text("No Divisions".tr,
                        style: Theme.of(context).textTheme.titleLarge!.copyWith(
                            fontSize: 22, fontWeight: FontWeight.normal)));
      }),
    );
  }
}
