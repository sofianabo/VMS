import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:get/get.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:vms_school/Link/API/API.dart';
import 'package:vms_school/Link/Controller/LMS_Controllers/Admin_LMS/Students_LMS_Controller.dart';
import 'package:vms_school/Translate/local_controller.dart';
import 'package:vms_school/view/Both_Platform/widgets/GridAnimation.dart';
import 'package:vms_school/view/Both_Platform/widgets/Schema_Widget.dart';

class LMS_StudentsGrid extends StatefulWidget {
  const LMS_StudentsGrid({super.key});

  @override
  State<LMS_StudentsGrid> createState() => _LmsStudentsgridState();
}

class _LmsStudentsgridState extends State<LMS_StudentsGrid> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    int getCrossAxisCount(double screenWidth) {
      if (screenWidth >= 1341) return 4;
      if (screenWidth >= 1100) return 3;
      if (screenWidth >= 675) return 2;
      return 1;
    }

    double getChildAspectRatio(double screenWidth) {
      if (screenWidth >= 1341) return 1.7;
      if (screenWidth >= 1100) return 1.9;
      if (screenWidth >= 888) return 2.4;
      if (screenWidth >= 734) return 1.7;
      if (screenWidth >= 675) return 1.2;
      if (screenWidth >= 436) return 2.2;

      return 1.7;
    }

    return Directionality(
      textDirection:
          Get.find<LocalizationController>().currentLocale.value.languageCode ==
                  'ar'
              ? TextDirection.rtl
              : TextDirection.ltr,
      child: GetBuilder<Students_LMS_Controller>(builder: (controller) {
        return controller.isLoading == true
            ? GridView.builder(
                padding: const EdgeInsets.only(top: 10, left: 40, right: 40),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: getCrossAxisCount(width),
                    crossAxisSpacing: 20.0,
                    mainAxisSpacing: 20.0,
                    childAspectRatio: getChildAspectRatio(width)),
                itemCount: 8,
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
                            color: Get.theme.cardColor,
                            boxShadow: const [
                              BoxShadow(
                                  color: Colors.black26,
                                  offset: Offset(0, 2),
                                  blurRadius: 1)
                            ]),
                        child: Column(
                          spacing: 15.0,
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            if (width > 734 || width < 675)
                              Row(
                                spacing: 10.0,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  SchemaWidget(
                                    width: 60,
                                    height: 60,
                                    radius: 60,
                                  ),
                                  Expanded(
                                    child: Container(
                                      alignment: Alignment.center,
                                      child:
                                          SchemaWidget(width: 100, height: 15),
                                    ),
                                  ),
                                ],
                              ),
                            if (width <= 734 && width > 675)
                              Column(
                                spacing: 10.0,
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  SchemaWidget(
                                    width: 60,
                                    height: 60,
                                    radius: 60,
                                  ),
                                  SchemaWidget(width: 100, height: 15),
                                ],
                              ),
                          ],
                        )),
                  )
                      .animate(onPlay: (controller) => controller.repeat())
                      .shimmer(
                          duration: const Duration(seconds: 2),
                          color: Get.theme.primaryColor.withOpacity(0.1));
                },
              )
            : controller.filteredStudents!.isEmpty
                ? Center(
                    child: Text("No Students".tr,
                        style: Theme.of(context).textTheme.titleLarge!.copyWith(
                            fontSize: 22, fontWeight: FontWeight.normal)))
                : GridView.builder(
                    padding:
                        const EdgeInsets.only(top: 10, left: 40, right: 40),
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: getCrossAxisCount(width),
                        crossAxisSpacing: 20.0,
                        mainAxisSpacing: 20.0,
                        childAspectRatio: getChildAspectRatio(width)),
                    itemCount: controller.filteredStudents!.length,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () {},
                        child: HoverScaleCard(
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
                                  color: Get.theme.cardColor,
                                  boxShadow: const [
                                    BoxShadow(
                                        color: Colors.black26,
                                        offset: Offset(0, 2),
                                        blurRadius: 1)
                                  ]),
                              child: Column(
                                spacing: 15.0,
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  if (width > 734 || width < 675)
                                    Row(
                                      spacing: 10.0,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        FutureBuilder(
                                          future: precacheImage(
                                              NetworkImage(
                                                  "$getimage${controller.filteredStudents![index].fileId}"),
                                              context),
                                          builder: (context, snapshot) {
                                            if (snapshot.connectionState ==
                                                ConnectionState.done) {
                                              return CircleAvatar(
                                                maxRadius: 60,
                                                backgroundColor:
                                                    const Color(0xffC4C4C4),
                                                backgroundImage: controller
                                                            .filteredStudents![
                                                                index]
                                                            .fileId !=
                                                        null
                                                    ? NetworkImage(
                                                        "$getimage${controller.filteredStudents![index].fileId}")
                                                    : null,
                                                child: controller
                                                            .filteredStudents![
                                                                index]
                                                            .fileId ==
                                                        null
                                                    ? Text(
                                                        controller
                                                            .filteredStudents![
                                                                index]
                                                            .fullName!
                                                            .substring(0, 1)
                                                            .toUpperCase(),
                                                        style: Get.textTheme
                                                            .titleMedium!
                                                            .copyWith(
                                                                fontSize: 26,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold),
                                                      )
                                                    : null,
                                              );
                                            } else {
                                              return CircleAvatar(
                                                maxRadius: 60,
                                                backgroundColor:
                                                    const Color(0xffC4C4C4),
                                                child: LoadingAnimationWidget
                                                    .inkDrop(
                                                  color: Theme.of(context)
                                                      .primaryColor,
                                                  size: 30,
                                                ),
                                              );
                                            }
                                          },
                                        ),
                                        Expanded(
                                          child: Container(
                                            alignment: Alignment.center,
                                            child: Text(
                                                "${controller.filteredStudents![index].fullName}",
                                                style: Get.theme.textTheme
                                                    .titleMedium!
                                                    .copyWith(
                                                        fontSize: 20,
                                                        fontWeight:
                                                            FontWeight.bold)),
                                          ),
                                        ),
                                      ],
                                    ),
                                  if (width <= 734 && width > 675)
                                    Column(
                                      spacing: 10.0,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        FutureBuilder(
                                          future: precacheImage(
                                              NetworkImage(
                                                  "$getimage${controller.filteredStudents![index].fileId}"),
                                              context),
                                          builder: (context, snapshot) {
                                            if (snapshot.connectionState ==
                                                ConnectionState.done) {
                                              return CircleAvatar(
                                                maxRadius: 60,
                                                backgroundColor:
                                                    const Color(0xffC4C4C4),
                                                backgroundImage: controller
                                                            .filteredStudents![
                                                                index]
                                                            .fileId !=
                                                        null
                                                    ? NetworkImage(
                                                        "$getimage${controller.filteredStudents![index].fileId}")
                                                    : null,
                                                child: controller
                                                            .filteredStudents![
                                                                index]
                                                            .fileId ==
                                                        null
                                                    ? Text(
                                                        controller
                                                            .filteredStudents![
                                                                index]
                                                            .fullName!
                                                            .substring(0, 1)
                                                            .toUpperCase(),
                                                        style: Get.textTheme
                                                            .titleMedium!
                                                            .copyWith(
                                                                fontSize: 26,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold),
                                                      )
                                                    : null,
                                              );
                                            } else {
                                              return CircleAvatar(
                                                maxRadius: 60,
                                                backgroundColor:
                                                    const Color(0xffC4C4C4),
                                                child: LoadingAnimationWidget
                                                    .inkDrop(
                                                  color: Theme.of(context)
                                                      .primaryColor,
                                                  size: 30,
                                                ),
                                              );
                                            }
                                          },
                                        ),
                                        Container(
                                          alignment: Alignment.center,
                                          child: Text(
                                              "${controller.filteredStudents![index].fullName}",
                                              style: Get
                                                  .theme.textTheme.titleMedium!
                                                  .copyWith(
                                                      fontSize: 20,
                                                      fontWeight:
                                                          FontWeight.bold)),
                                        ),
                                      ],
                                    ),
                                ],
                              )),
                        ),
                      );
                    },
                  );
      }),
    );
  }
}
