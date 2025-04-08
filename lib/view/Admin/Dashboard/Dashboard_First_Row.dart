import 'package:dashed_circular_progress_bar/dashed_circular_progress_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:get/get.dart';
import 'package:vms_school/Link/Controller/AdminController/Main_Admin_Controller/Dashboard_Controller.dart';
import 'package:vms_school/widgets/GridAnimation.dart';
import 'package:vms_school/widgets/Responsive.dart';

class DashboardFirstRow extends StatefulWidget {
  const DashboardFirstRow({super.key});

  @override
  State<DashboardFirstRow> createState() => _DashboardFirstRowState();
}

class _DashboardFirstRowState extends State<DashboardFirstRow> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<Dashboard_Controller>(
      builder: (controller) {
        if (controller.Isloading) {
          return LayoutBuilder(
            builder: (context, constraints) {
              if (constraints.maxWidth < 850) {
                return Column(
                  spacing: 20.0,
                  children: [
                    HoverScaleCard(
                      child: Container(
                        height: 200,
                        padding: const EdgeInsets.all(13.0),
                        decoration: BoxDecoration(
                          color: const Color(0xffFBFBFB),
                          border: Border.all(color: Colors.grey, width: 0.2),
                          borderRadius:
                              const BorderRadius.all(Radius.circular(5)),
                          boxShadow: const [
                            BoxShadow(
                              color: Colors.black12,
                              offset: Offset(0, 2),
                              blurRadius: 1,
                            ),
                          ],
                        ),
                      ),
                    )
                        .animate(onPlay: (controller) => controller.repeat())
                        .shimmer(
                            angle: 1,
                            color: Colors.grey.withOpacity(0.2),
                            duration: const Duration(seconds: 1),
                            delay: const Duration(seconds: 1)),
                    HoverScaleCard(
                      child: Container(
                        height: 200,
                        padding: const EdgeInsets.all(13.0),
                        decoration: BoxDecoration(
                          color: const Color(0xffFBFBFB),
                          border: Border.all(color: Colors.grey, width: 0.2),
                          borderRadius:
                              const BorderRadius.all(Radius.circular(5)),
                          boxShadow: const [
                            BoxShadow(
                              color: Colors.black12,
                              offset: Offset(0, 2),
                              blurRadius: 1,
                            ),
                          ],
                        ),
                      ),
                    )
                        .animate(onPlay: (controller) => controller.repeat())
                        .shimmer(
                            angle: 1,
                            color: Colors.grey.withOpacity(0.2),
                            duration: const Duration(seconds: 1),
                            delay: const Duration(seconds: 1)),
                  ],
                );
              } else {
                return Row(
                  spacing: 20.0,
                  children: [
                    Expanded(
                      child: HoverScaleCard(
                        child: Container(
                          height: 200,
                          padding: const EdgeInsets.all(13.0),
                          decoration: BoxDecoration(
                            color: const Color(0xffFBFBFB),
                            border: Border.all(color: Colors.grey, width: 0.2),
                            borderRadius:
                                const BorderRadius.all(Radius.circular(5)),
                            boxShadow: const [
                              BoxShadow(
                                color: Colors.black12,
                                offset: Offset(0, 2),
                                blurRadius: 1,
                              ),
                            ],
                          ),
                        ),
                      )
                          .animate(onPlay: (controller) => controller.repeat())
                          .shimmer(
                              angle: 1,
                              color: Colors.grey.withOpacity(0.2),
                              duration: const Duration(seconds: 1),
                              delay: const Duration(seconds: 1)),
                    ),
                    Expanded(
                      child: HoverScaleCard(
                        child: HoverScaleCard(
                          child: Container(
                            height: 200,
                            padding: const EdgeInsets.all(13.0),
                            decoration: BoxDecoration(
                              color: const Color(0xffFBFBFB),
                              border:
                                  Border.all(color: Colors.grey, width: 0.2),
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(5)),
                              boxShadow: const [
                                BoxShadow(
                                  color: Colors.black12,
                                  offset: Offset(0, 2),
                                  blurRadius: 1,
                                ),
                              ],
                            ),
                          ),
                        )
                            .animate(
                                onPlay: (controller) => controller.repeat())
                            .shimmer(
                                angle: 1,
                                color: Colors.grey.withOpacity(0.2),
                                duration: const Duration(seconds: 1),
                                delay: const Duration(seconds: 1)),
                      ),
                    ),
                  ],
                );
              }
            },
          );
        }
        return ResponsiveUI(
            desktopScreen: Row(
              spacing: 20.0,
              children: [
                Expanded(
                  child: HoverScaleCard(
                    child: Container(
                      height: 200,
                      decoration: BoxDecoration(
                        color: Theme.of(context).cardColor,
                        border: Border.all(color: Colors.grey, width: 0.2),
                        borderRadius:
                            const BorderRadius.all(Radius.circular(5)),
                        boxShadow: const [
                          BoxShadow(
                            color: Colors.black12,
                            offset: Offset(0, 2),
                            blurRadius: 1,
                          ),
                        ],
                      ),
                      child: Column(
                        children: [
                          Padding(
                            padding: EdgeInsets.only(top: 10.0, bottom: 10.0),
                            child: Text(
                              "Total this year".tr,
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              DashedCircularProgressBar.square(
                                dimensions: 130,
                                progress:
                                    controller.dsh!.percentageStudents == null
                                        ? 0
                                        : double.tryParse(controller
                                                .dsh!.percentageStudents
                                                .toString()) ??
                                            0,
                                maxProgress: 100,
                                startAngle: -27.5,
                                foregroundColor: const Color(0xff006D77),
                                backgroundColor: const Color(0xffE8DEF8),
                                foregroundStrokeWidth: 10,
                                backgroundStrokeWidth: 10,
                                foregroundGapSize: 4,
                                backgroundGapSize: 4,
                                backgroundDashSize: 10,
                                animation: true,
                                child: Center(
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Text(
                                        "Percentage\nStudents".tr,
                                        style: TextStyle(fontSize: 12),
                                        textAlign: TextAlign.center,
                                      ),
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(top: 5.0),
                                        child: Text(controller
                                                    .dsh!.percentageStudents ==
                                                null
                                            ? "0%"
                                            : "${controller.dsh!.percentageStudents}%"),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              DashedCircularProgressBar.square(
                                dimensions: 130,
                                progress:
                                    controller.dsh!.percentageTeachers == null
                                        ? 0
                                        : double.tryParse(controller
                                                .dsh!.percentageTeachers
                                                .toString()) ??
                                            0,
                                maxProgress: 100,
                                startAngle: -27.5,
                                foregroundColor: const Color(0xff94C9A9),
                                backgroundColor: const Color(0xffE8DEF8),
                                foregroundStrokeWidth: 10,
                                backgroundStrokeWidth: 10,
                                foregroundGapSize: 4,
                                backgroundGapSize: 4,
                                backgroundDashSize: 10,
                                animation: true,
                                child: Center(
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Text(
                                        textAlign: TextAlign.center,
                                        "Percentage\nTeacher".tr,
                                        style: TextStyle(fontSize: 12),
                                      ),
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(top: 5.0),
                                        child: Text(controller
                                                    .dsh!.percentageTeachers ==
                                                null
                                            ? "0%"
                                            : "${controller.dsh!.percentageTeachers}%"),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              DashedCircularProgressBar.square(
                                dimensions: 130,
                                progress:
                                    controller.dsh!.percentageEmployees == null
                                        ? 0
                                        : double.tryParse(controller
                                                .dsh!.percentageEmployees
                                                .toString()) ??
                                            0,
                                maxProgress: 100,
                                startAngle: -27.5,
                                foregroundColor: const Color(0xffB97375),
                                backgroundColor: const Color(0xffE8DEF8),
                                foregroundStrokeWidth: 10,
                                backgroundStrokeWidth: 10,
                                foregroundGapSize: 4,
                                backgroundGapSize: 4,
                                backgroundDashSize: 10,
                                animation: true,
                                child: Center(
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Text(
                                        "Percentage\nEmployee".tr,
                                        style: TextStyle(fontSize: 12),
                                        textAlign: TextAlign.center,
                                      ),
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(top: 5.0),
                                        child: Text(controller
                                                    .dsh!.percentageEmployees ==
                                                null
                                            ? "0%"
                                            : "${controller.dsh!.percentageEmployees}%"),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: HoverScaleCard(
                    child: Container(
                      height: 200,
                      decoration: BoxDecoration(
                        color: Theme.of(context).cardColor,
                        border: Border.all(color: Colors.grey, width: 0.2),
                        borderRadius:
                            const BorderRadius.all(Radius.circular(5)),
                        boxShadow: const [
                          BoxShadow(
                            color: Colors.black12,
                            offset: Offset(0, 2),
                            blurRadius: 1,
                          ),
                        ],
                      ),
                      child: Column(
                        children: [
                          Padding(
                            padding: EdgeInsets.only(top: 10.0, bottom: 10.0),
                            child: Text(
                              "Attendance Today".tr,
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              DashedCircularProgressBar.square(
                                dimensions: 130,
                                progress: controller.dsh!
                                            .percentageEmployeeAttendance ==
                                        null
                                    ? 0
                                    : double.tryParse(controller.dsh!
                                            .percentageEmployeeAttendance!) ??
                                        0,
                                maxProgress: 100,
                                startAngle: -27.5,
                                foregroundColor: const Color(0xff006D77),
                                backgroundColor: const Color(0xffE8DEF8),
                                foregroundStrokeWidth: 10,
                                backgroundStrokeWidth: 10,
                                foregroundGapSize: 4,
                                backgroundGapSize: 4,
                                backgroundDashSize: 10,
                                animation: true,
                                child: Center(
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Container(
                                        width: 80,
                                        child: Text(
                                          textAlign: TextAlign.center,
                                          maxLines: 2,
                                          "Employees\nAttendance".tr,
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodyMedium,
                                        ),
                                      ),
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(top: 5.0),
                                        child: Text(
                                          controller.dsh!
                                                      .percentageEmployeeAttendance ==
                                                  null
                                              ? "0%"
                                              : "${controller.dsh!.percentageEmployeeAttendance}%",
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodyMedium,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 10.0),
                                child: DashedCircularProgressBar.square(
                                  dimensions: 130,
                                  progress: controller.dsh!
                                              .percentageStudentsAttendance ==
                                          null
                                      ? 0
                                      : double.tryParse(controller
                                              .dsh!.percentageStudentsAttendance
                                              .toString()) ??
                                          0,
                                  maxProgress: 100,
                                  startAngle: -27.5,
                                  foregroundColor: const Color(0xff94C9A9),
                                  backgroundColor: const Color(0xffE8DEF8),
                                  foregroundStrokeWidth: 10,
                                  backgroundStrokeWidth: 10,
                                  foregroundGapSize: 4,
                                  backgroundGapSize: 4,
                                  backgroundDashSize: 10,
                                  animation: true,
                                  child: Center(
                                    child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        Container(
                                          width: 75,
                                          child: Text(
                                            textAlign: TextAlign.center,
                                            maxLines: 2,
                                            "Students\nAttendance".tr,
                                            style: Theme.of(context)
                                                .textTheme
                                                .bodyMedium,
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(top: 5.0),
                                          child: Text(
                                            controller.dsh!
                                                        .percentageStudentsAttendance ==
                                                    null
                                                ? "0%"
                                                : "${controller.dsh!.percentageStudentsAttendance}%",
                                            style: Theme.of(context)
                                                .textTheme
                                                .bodyMedium,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              DashedCircularProgressBar.square(
                                dimensions: 130,
                                progress: controller.dsh!
                                            .percentageTeachersAttendance ==
                                        null
                                    ? 0
                                    : double.tryParse(controller
                                            .dsh!.percentageTeachersAttendance
                                            .toString()) ??
                                        0,
                                maxProgress: 100,
                                startAngle: -27.5,
                                foregroundColor: const Color(0xffB97375),
                                backgroundColor: const Color(0xffE8DEF8),
                                foregroundStrokeWidth: 10,
                                backgroundStrokeWidth: 10,
                                foregroundGapSize: 4,
                                backgroundGapSize: 4,
                                backgroundDashSize: 10,
                                animation: true,
                                child: Center(
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Container(
                                        width: 80,
                                        child: Text(
                                          textAlign: TextAlign.center,
                                          maxLines: 2,
                                          "Teachers\nAttendance".tr,
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodyMedium,
                                        ),
                                      ),
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(top: 5.0),
                                        child: Text(
                                          controller.dsh!
                                                      .percentageTeachersAttendance ==
                                                  null
                                              ? "0%"
                                              : "${controller.dsh!.percentageTeachersAttendance}%",
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodyMedium,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
            tabletScreen: Column(
              spacing: 20.0,
              children: [
                HoverScaleCard(
                  child: Container(
                    height: 200,
                    decoration: BoxDecoration(
                      color: Theme.of(context).cardColor,
                      border: Border.all(color: Colors.grey, width: 0.2),
                      borderRadius: const BorderRadius.all(Radius.circular(5)),
                      boxShadow: const [
                        BoxShadow(
                          color: Colors.black12,
                          offset: Offset(0, 2),
                          blurRadius: 1,
                        ),
                      ],
                    ),
                    child: Column(
                      children: [
                        Padding(
                          padding: EdgeInsets.only(top: 10.0, bottom: 10.0),
                          child: Text(
                            "Total this year".tr,
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            DashedCircularProgressBar.square(
                              dimensions: 120,
                              progress:
                                  controller.dsh!.percentageStudents == null
                                      ? 0
                                      : double.tryParse(controller
                                              .dsh!.percentageStudents
                                              .toString()) ??
                                          0,
                              maxProgress: 100,
                              startAngle: -27.5,
                              foregroundColor: const Color(0xff006D77),
                              backgroundColor: const Color(0xffE8DEF8),
                              foregroundStrokeWidth: 10,
                              backgroundStrokeWidth: 10,
                              foregroundGapSize: 4,
                              backgroundGapSize: 4,
                              backgroundDashSize: 10,
                              animation: true,
                              child: Center(
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Text(
                                      "Percentage\nStudents".tr,
                                      style: TextStyle(fontSize: 12),
                                      textAlign: TextAlign.center,
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(top: 5.0),
                                      child: Text(controller
                                                  .dsh!.percentageStudents ==
                                              null
                                          ? "0%"
                                          : "${controller.dsh!.percentageStudents}%"),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            DashedCircularProgressBar.square(
                              dimensions: 120,
                              progress:
                                  controller.dsh!.percentageTeachers == null
                                      ? 0
                                      : double.tryParse(controller
                                              .dsh!.percentageTeachers
                                              .toString()) ??
                                          0,
                              maxProgress: 100,
                              startAngle: -27.5,
                              foregroundColor: const Color(0xff94C9A9),
                              backgroundColor: const Color(0xffE8DEF8),
                              foregroundStrokeWidth: 10,
                              backgroundStrokeWidth: 10,
                              foregroundGapSize: 4,
                              backgroundGapSize: 4,
                              backgroundDashSize: 10,
                              animation: true,
                              child: Center(
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Text(
                                      textAlign: TextAlign.center,
                                      "Percentage\nTeacher".tr,
                                      style: TextStyle(fontSize: 12),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(top: 5.0),
                                      child: Text(controller
                                                  .dsh!.percentageTeachers ==
                                              null
                                          ? "0%"
                                          : "${controller.dsh!.percentageTeachers}%"),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            DashedCircularProgressBar.square(
                              dimensions: 120,
                              progress:
                                  controller.dsh!.percentageEmployees == null
                                      ? 0
                                      : double.tryParse(controller
                                              .dsh!.percentageEmployees
                                              .toString()) ??
                                          0,
                              maxProgress: 100,
                              startAngle: -27.5,
                              foregroundColor: const Color(0xffB97375),
                              backgroundColor: const Color(0xffE8DEF8),
                              foregroundStrokeWidth: 10,
                              backgroundStrokeWidth: 10,
                              foregroundGapSize: 4,
                              backgroundGapSize: 4,
                              backgroundDashSize: 10,
                              animation: true,
                              child: Center(
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Text(
                                      "Percentage\nEmployee".tr,
                                      style: TextStyle(fontSize: 12),
                                      textAlign: TextAlign.center,
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(top: 5.0),
                                      child: Text(controller
                                                  .dsh!.percentageEmployees ==
                                              null
                                          ? "0%"
                                          : "${controller.dsh!.percentageEmployees}%"),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                HoverScaleCard(
                  child: Container(
                    height: 200,
                    decoration: BoxDecoration(
                      color: Theme.of(context).cardColor,
                      border: Border.all(color: Colors.grey, width: 0.2),
                      borderRadius: const BorderRadius.all(Radius.circular(5)),
                      boxShadow: const [
                        BoxShadow(
                          color: Colors.black12,
                          offset: Offset(0, 2),
                          blurRadius: 1,
                        ),
                      ],
                    ),
                    child: Column(
                      children: [
                        Padding(
                          padding: EdgeInsets.only(top: 10.0, bottom: 10.0),
                          child: Text(
                            "Attendance Today".tr,
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            DashedCircularProgressBar.square(
                              dimensions: 120,
                              progress: controller
                                          .dsh!.percentageEmployeeAttendance ==
                                      null
                                  ? 0
                                  : double.tryParse(controller.dsh!
                                          .percentageEmployeeAttendance!) ??
                                      0,
                              maxProgress: 100,
                              startAngle: -27.5,
                              foregroundColor: const Color(0xff006D77),
                              backgroundColor: const Color(0xffE8DEF8),
                              foregroundStrokeWidth: 10,
                              backgroundStrokeWidth: 10,
                              foregroundGapSize: 4,
                              backgroundGapSize: 4,
                              backgroundDashSize: 10,
                              animation: true,
                              child: Center(
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Container(
                                      width: 80,
                                      child: Text(
                                        textAlign: TextAlign.center,
                                        maxLines: 2,
                                        "Employees\nAttendance".tr,
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyMedium,
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(top: 5.0),
                                      child: Text(
                                        controller.dsh!
                                                    .percentageEmployeeAttendance ==
                                                null
                                            ? "0%"
                                            : "${controller.dsh!.percentageEmployeeAttendance}%",
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyMedium,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 10.0),
                              child: DashedCircularProgressBar.square(
                                dimensions: 120,
                                progress: controller.dsh!
                                            .percentageStudentsAttendance ==
                                        null
                                    ? 0
                                    : double.tryParse(controller
                                            .dsh!.percentageStudentsAttendance
                                            .toString()) ??
                                        0,
                                maxProgress: 100,
                                startAngle: -27.5,
                                foregroundColor: const Color(0xff94C9A9),
                                backgroundColor: const Color(0xffE8DEF8),
                                foregroundStrokeWidth: 10,
                                backgroundStrokeWidth: 10,
                                foregroundGapSize: 4,
                                backgroundGapSize: 4,
                                backgroundDashSize: 10,
                                animation: true,
                                child: Center(
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Container(
                                        width: 75,
                                        child: Text(
                                          textAlign: TextAlign.center,
                                          maxLines: 2,
                                          "Students\nAttendance".tr,
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodyMedium,
                                        ),
                                      ),
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(top: 5.0),
                                        child: Text(
                                          controller.dsh!
                                                      .percentageStudentsAttendance ==
                                                  null
                                              ? "0%"
                                              : "${controller.dsh!.percentageStudentsAttendance}%",
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodyMedium,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            DashedCircularProgressBar.square(
                              dimensions: 120,
                              progress: controller
                                          .dsh!.percentageTeachersAttendance ==
                                      null
                                  ? 0
                                  : double.tryParse(controller
                                          .dsh!.percentageTeachersAttendance
                                          .toString()) ??
                                      0,
                              maxProgress: 100,
                              startAngle: -27.5,
                              foregroundColor: const Color(0xffB97375),
                              backgroundColor: const Color(0xffE8DEF8),
                              foregroundStrokeWidth: 10,
                              backgroundStrokeWidth: 10,
                              foregroundGapSize: 4,
                              backgroundGapSize: 4,
                              backgroundDashSize: 10,
                              animation: true,
                              child: Center(
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Container(
                                      width: 80,
                                      child: Text(
                                        textAlign: TextAlign.center,
                                        maxLines: 2,
                                        "Teachers\nAttendance".tr,
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyMedium,
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(top: 5.0),
                                      child: Text(
                                        controller.dsh!
                                                    .percentageTeachersAttendance ==
                                                null
                                            ? "0%"
                                            : "${controller.dsh!.percentageTeachersAttendance}%",
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyMedium,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            mobileScreen: Column(
              spacing: 20.0,
              children: [
                HoverScaleCard(
                  child: Container(
                    height: 200,
                    decoration: BoxDecoration(
                      color: Theme.of(context).cardColor,
                      border: Border.all(color: Colors.grey, width: 0.2),
                      borderRadius: const BorderRadius.all(Radius.circular(5)),
                      boxShadow: const [
                        BoxShadow(
                          color: Colors.black12,
                          offset: Offset(0, 2),
                          blurRadius: 1,
                        ),
                      ],
                    ),
                    child: Column(
                      children: [
                        Padding(
                          padding: EdgeInsets.only(top: 10.0, bottom: 10.0),
                          child: Text(
                            "Total this year".tr,
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            DashedCircularProgressBar.square(
                              dimensions: 110,
                              progress:
                                  controller.dsh!.percentageStudents == null
                                      ? 0
                                      : double.tryParse(controller
                                              .dsh!.percentageStudents
                                              .toString()) ??
                                          0,
                              maxProgress: 100,
                              startAngle: -27.5,
                              foregroundColor: const Color(0xff006D77),
                              backgroundColor: const Color(0xffE8DEF8),
                              foregroundStrokeWidth: 10,
                              backgroundStrokeWidth: 10,
                              foregroundGapSize: 4,
                              backgroundGapSize: 4,
                              backgroundDashSize: 10,
                              animation: true,
                              child: Center(
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Text(
                                      "Percentage\nStudents".tr,
                                      style: TextStyle(fontSize: 12),
                                      textAlign: TextAlign.center,
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(top: 5.0),
                                      child: Text(controller
                                                  .dsh!.percentageStudents ==
                                              null
                                          ? "0%"
                                          : "${controller.dsh!.percentageStudents}%"),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            DashedCircularProgressBar.square(
                              dimensions: 110,
                              progress:
                                  controller.dsh!.percentageTeachers == null
                                      ? 0
                                      : double.tryParse(controller
                                              .dsh!.percentageTeachers
                                              .toString()) ??
                                          0,
                              maxProgress: 100,
                              startAngle: -27.5,
                              foregroundColor: const Color(0xff94C9A9),
                              backgroundColor: const Color(0xffE8DEF8),
                              foregroundStrokeWidth: 10,
                              backgroundStrokeWidth: 10,
                              foregroundGapSize: 4,
                              backgroundGapSize: 4,
                              backgroundDashSize: 10,
                              animation: true,
                              child: Center(
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Text(
                                      textAlign: TextAlign.center,
                                      "Percentage\nTeacher".tr,
                                      style: TextStyle(fontSize: 12),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(top: 5.0),
                                      child: Text(controller
                                                  .dsh!.percentageTeachers ==
                                              null
                                          ? "0%"
                                          : "${controller.dsh!.percentageTeachers}%"),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            DashedCircularProgressBar.square(
                              dimensions: 110,
                              progress:
                                  controller.dsh!.percentageEmployees == null
                                      ? 0
                                      : double.tryParse(controller
                                              .dsh!.percentageEmployees
                                              .toString()) ??
                                          0,
                              maxProgress: 100,
                              startAngle: -27.5,
                              foregroundColor: const Color(0xffB97375),
                              backgroundColor: const Color(0xffE8DEF8),
                              foregroundStrokeWidth: 10,
                              backgroundStrokeWidth: 10,
                              foregroundGapSize: 4,
                              backgroundGapSize: 4,
                              backgroundDashSize: 10,
                              animation: true,
                              child: Center(
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Text(
                                      "Percentage\nEmployee".tr,
                                      style: TextStyle(fontSize: 12),
                                      textAlign: TextAlign.center,
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(top: 5.0),
                                      child: Text(controller
                                                  .dsh!.percentageEmployees ==
                                              null
                                          ? "0%"
                                          : "${controller.dsh!.percentageEmployees}%"),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                HoverScaleCard(
                  child: Container(
                    height: 200,
                    decoration: BoxDecoration(
                      color: Theme.of(context).cardColor,
                      border: Border.all(color: Colors.grey, width: 0.2),
                      borderRadius: const BorderRadius.all(Radius.circular(5)),
                      boxShadow: const [
                        BoxShadow(
                          color: Colors.black12,
                          offset: Offset(0, 2),
                          blurRadius: 1,
                        ),
                      ],
                    ),
                    child: Column(
                      children: [
                        Padding(
                          padding: EdgeInsets.only(top: 10.0, bottom: 10.0),
                          child: Text(
                            "Attendance Today".tr,
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            DashedCircularProgressBar.square(
                              dimensions: 110,
                              progress: controller
                                          .dsh!.percentageEmployeeAttendance ==
                                      null
                                  ? 0
                                  : double.tryParse(controller.dsh!
                                          .percentageEmployeeAttendance!) ??
                                      0,
                              maxProgress: 100,
                              startAngle: -27.5,
                              foregroundColor: const Color(0xff006D77),
                              backgroundColor: const Color(0xffE8DEF8),
                              foregroundStrokeWidth: 10,
                              backgroundStrokeWidth: 10,
                              foregroundGapSize: 4,
                              backgroundGapSize: 4,
                              backgroundDashSize: 10,
                              animation: true,
                              child: Center(
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Container(
                                      width: 80,
                                      child: Text(
                                        textAlign: TextAlign.center,
                                        maxLines: 2,
                                        "Employees\nAttendance".tr,
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyMedium,
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(top: 5.0),
                                      child: Text(
                                        controller.dsh!
                                                    .percentageEmployeeAttendance ==
                                                null
                                            ? "0%"
                                            : "${controller.dsh!.percentageEmployeeAttendance}%",
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyMedium,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 10.0),
                              child: DashedCircularProgressBar.square(
                                dimensions: 110,
                                progress: controller.dsh!
                                            .percentageStudentsAttendance ==
                                        null
                                    ? 0
                                    : double.tryParse(controller
                                            .dsh!.percentageStudentsAttendance
                                            .toString()) ??
                                        0,
                                maxProgress: 100,
                                startAngle: -27.5,
                                foregroundColor: const Color(0xff94C9A9),
                                backgroundColor: const Color(0xffE8DEF8),
                                foregroundStrokeWidth: 10,
                                backgroundStrokeWidth: 10,
                                foregroundGapSize: 4,
                                backgroundGapSize: 4,
                                backgroundDashSize: 10,
                                animation: true,
                                child: Center(
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Container(
                                        width: 75,
                                        child: Text(
                                          textAlign: TextAlign.center,
                                          maxLines: 2,
                                          "Students\nAttendance".tr,
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodyMedium,
                                        ),
                                      ),
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(top: 5.0),
                                        child: Text(
                                          controller.dsh!
                                                      .percentageStudentsAttendance ==
                                                  null
                                              ? "0%"
                                              : "${controller.dsh!.percentageStudentsAttendance}%",
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodyMedium,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            DashedCircularProgressBar.square(
                              dimensions: 110,
                              progress: controller
                                          .dsh!.percentageTeachersAttendance ==
                                      null
                                  ? 0
                                  : double.tryParse(controller
                                          .dsh!.percentageTeachersAttendance
                                          .toString()) ??
                                      0,
                              maxProgress: 100,
                              startAngle: -27.5,
                              foregroundColor: const Color(0xffB97375),
                              backgroundColor: const Color(0xffE8DEF8),
                              foregroundStrokeWidth: 10,
                              backgroundStrokeWidth: 10,
                              foregroundGapSize: 4,
                              backgroundGapSize: 4,
                              backgroundDashSize: 10,
                              animation: true,
                              child: Center(
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Container(
                                      width: 80,
                                      child: Text(
                                        textAlign: TextAlign.center,
                                        maxLines: 2,
                                        "Teachers\nAttendance".tr,
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyMedium,
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(top: 5.0),
                                      child: Text(
                                        controller.dsh!
                                                    .percentageTeachersAttendance ==
                                                null
                                            ? "0%"
                                            : "${controller.dsh!.percentageTeachersAttendance}%",
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyMedium,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ));
      },
    );
  }
}
