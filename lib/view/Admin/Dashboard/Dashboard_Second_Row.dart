import 'package:dashed_circular_progress_bar/dashed_circular_progress_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:get/get.dart';
import 'package:vms_school/Link/Controller/AdminController/Dashboard_Controller.dart';
import 'package:vms_school/view/Admin/Dashboard/Admin_Charts.dart';
import 'package:vms_school/widgets/GridAnimation.dart';

class DashboardSecondRow extends StatelessWidget {
  const DashboardSecondRow({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<Dashboard_Controller>(
      builder: (controller) {
        if (controller.Isloading) {
          return Row(
            children: [
              HoverScaleCard(
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 15.0),
                  child: Container(
                    width: 375,
                    height: 170,
                    padding: EdgeInsets.all(13.0),
                    decoration: BoxDecoration(
                      color: Color(0xffFBFBFB),
                      border: Border.all(color: Colors.grey, width: 0.2),
                      borderRadius: BorderRadius.all(Radius.circular(5)),
                      boxShadow: const [
                        BoxShadow(
                          color: Colors.black12,
                          offset: Offset(0, 2),
                          blurRadius: 1,
                        ),
                      ],
                    ),
                  ),
                ),
              ).animate(onPlay: (controller) => controller.repeat()).shimmer(
                  angle: 1,
                  color: Colors.grey.withOpacity(0.2),
                  duration: Duration(seconds: 1),
                  delay: Duration(seconds: 1)),
              HoverScaleCard(
                  child: Container(
                width: 320,
                height: 170,
                padding: EdgeInsets.all(13.0),
                margin: EdgeInsets.only(left: 15.0, right: 15.0, bottom: 15.0),
                decoration: BoxDecoration(
                  color: Color(0xffF3F4F8),
                  border: Border.all(color: Colors.grey, width: 0.2),
                  borderRadius: BorderRadius.all(Radius.circular(5)),
                  boxShadow: const [
                    BoxShadow(
                      color: Colors.black12,
                      offset: Offset(0, 2),
                      blurRadius: 1,
                    ),
                  ],
                ),
              )).animate(onPlay: (controller) => controller.repeat()).shimmer(
                  angle: 1,
                  color: Colors.grey.withOpacity(0.2),
                  duration: Duration(seconds: 1),
                  delay: Duration(seconds: 1)),
              HoverScaleCard(
                  child: Container(
                width: 320,
                height: 170,
                padding: EdgeInsets.all(13.0),
                margin: EdgeInsets.only(bottom: 15.0),
                decoration: BoxDecoration(
                    color: Color(0xffF3F4F8),
                    border: Border.all(color: Colors.grey, width: 0.2),
                    borderRadius: BorderRadius.all(Radius.circular(5)),
                    boxShadow: const [
                      BoxShadow(
                          color: Colors.black12,
                          offset: Offset(0, 2),
                          blurRadius: 1)
                    ]),
              )).animate(onPlay: (controller) => controller.repeat()).shimmer(
                  angle: 1,
                  color: Colors.grey.withOpacity(0.2),
                  duration: Duration(seconds: 1),
                  delay: Duration(seconds: 1)),
            ],
          );
        }

        return Row(
          children: [
            HoverScaleCard(
              child: Padding(
                padding: const EdgeInsets.only(bottom: 15.0),
                child: Container(
                  padding: EdgeInsets.all(13.0),
                  decoration: BoxDecoration(
                    color: Color(0xffFBFBFB),
                    border: Border.all(color: Colors.grey, width: 0.2),
                    borderRadius: BorderRadius.all(Radius.circular(5)),
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
                        padding: const EdgeInsets.only(bottom: 10.0),
                        child: Text("Attendance Today"),
                      ),
                      Row(
                        children: [
                          DashedCircularProgressBar.square(
                            dimensions: 110,
                            progress:
                                controller.dsh!.percentageEmployeeAttendance ==
                                        null
                                    ? 0
                                    : double.tryParse(controller.dsh!
                                            .percentageEmployeeAttendance!) ??
                                        0,
                            maxProgress: 100,
                            startAngle: -27.5,
                            foregroundColor: Color(0xff006D77),
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
                                    "Employees\nAttendance",
                                    style: TextStyle(fontSize: 12),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(top: 5.0),
                                    child: Text(
                                      controller.dsh!
                                                  .percentageEmployeeAttendance ==
                                              null
                                          ? "0%"
                                          : "${controller.dsh!.percentageEmployeeAttendance}%",
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
                              progress: controller
                                          .dsh!.percentageStudentsAttendance ==
                                      null
                                  ? 0
                                  : double.tryParse(controller
                                          .dsh!.percentageStudentsAttendance
                                          .toString()) ??
                                      0,
                              maxProgress: 100,
                              startAngle: -27.5,
                              foregroundColor: Color(0xff94C9A9),
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
                                      "Students\nAttendance",
                                      style: TextStyle(fontSize: 12),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(top: 5.0),
                                      child: Text(
                                        controller.dsh!
                                                    .percentageStudentsAttendance ==
                                                null
                                            ? "0%"
                                            : "${controller.dsh!.percentageStudentsAttendance}%",
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          DashedCircularProgressBar.square(
                            dimensions: 110,
                            progress:
                                controller.dsh!.percentageTeachersAttendance ==
                                        null
                                    ? 0
                                    : double.tryParse(controller
                                            .dsh!.percentageTeachersAttendance
                                            .toString()) ??
                                        0,
                            maxProgress: 100,
                            startAngle: -27.5,
                            foregroundColor: Color(0xffB97375),
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
                                    "Teachers\nAttendance",
                                    style: TextStyle(fontSize: 12),
                                    textAlign: TextAlign.center,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(top: 5.0),
                                    child: Text(
                                      controller.dsh!
                                                  .percentageTeachersAttendance ==
                                              null
                                          ? "0%"
                                          : "${controller.dsh!.percentageTeachersAttendance}%",
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
            HoverScaleCard(
                child: Container(
              width: 320,
              height: 170,
              padding: EdgeInsets.all(13.0),
              margin: EdgeInsets.only(left: 15.0, right: 15.0, bottom: 15.0),
              decoration: BoxDecoration(
                color: Color(0xffF3F4F8),
                border: Border.all(color: Colors.grey, width: 0.2),
                borderRadius: BorderRadius.all(Radius.circular(5)),
                boxShadow: const [
                  BoxShadow(
                    color: Colors.black12,
                        offset: Offset(0, 2),
                    blurRadius: 1,
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: BarChartSample1(
                      headerText: "Presence of students",
                      data: convertNumberOfStudentsPerYearToWidgetData(
                          controller.dsh!.numberOfStudentsPerYear),
                    ),
                  ),
                ],
              ),
            )),
            HoverScaleCard(
                child: Container(
              width: 320,
              height: 170,
              padding: EdgeInsets.all(13.0),
              margin: EdgeInsets.only(bottom: 15.0),
              decoration: BoxDecoration(
                  color: Color(0xffF3F4F8),
                  border: Border.all(color: Colors.grey, width: 0.2),
                  borderRadius: BorderRadius.all(Radius.circular(5)),
                  boxShadow: const [
                    BoxShadow(
                        color: Colors.black12,
                        offset: Offset(0, 2),
                        blurRadius: 1)
                  ]),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: BarChartSample2(
                      headerText: "Presence 2024 students",
                      data: convertNumberOfStudentsPerYearToWidgetData(
                          controller.dsh!.numberOfStudentsThisYear),
                    ),
                  ),
                ],
              ),
            )),
          ],
        );
      },
    );
  }
}
