import 'package:dashed_circular_progress_bar/dashed_circular_progress_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:get/get.dart';
import 'package:getx/Link/Controller/AdminController/Dashboard_Controller.dart';
import 'package:getx/widgets/GridAnimation.dart';

class DashboardSecondSide extends StatelessWidget {
  const DashboardSecondSide({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<Dashboard_Controller>(
      builder: (controller) {
        if (controller.Isloading) {
          return HoverScaleCard(
            child: Container(
                child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 15.0, bottom: 15.0),
                  child: Container(
                    width: 500,
                    height: 500,
                    padding: EdgeInsets.all(15.0),
                    decoration: BoxDecoration(
                        color: Color(0xffFBFBFB),
                        border: Border.all(color: Colors.grey, width: 0.2),
                        borderRadius: BorderRadius.all(Radius.circular(5)),
                        boxShadow: const [
                          BoxShadow(
                              color: Colors.black12,
                              offset: Offset(0, 2),
                              blurRadius: 1)
                        ]),
                  ),
                ),
              ],
            )),
          ).animate(onPlay: (controller) => controller.repeat()).shimmer(
              angle: 1,
              color: Colors.grey.withOpacity(0.2),
              duration: Duration(seconds: 1),
              delay: Duration(seconds: 1));
        }

        return HoverScaleCard(
          child: Container(
              margin: EdgeInsets.only(left: 15.0),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 15.0, bottom: 15.0),
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
                                  blurRadius: 1)
                            ]),
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(bottom: 25.0),
                              child: Text("Total 2024"),
                            ),
                            Column(
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
                                          "Percentage\nStudents",
                                          style: TextStyle(fontSize: 12),
                                          textAlign: TextAlign.center,
                                        ),
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(top: 5.0),
                                          child: Text(controller.dsh!
                                                      .percentageStudents ==
                                                  null
                                              ? "0%"
                                              : "${controller.dsh!.percentageStudents}%"),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding:
                                      EdgeInsets.only(top: 15.0, bottom: 15.0),
                                  child: DashedCircularProgressBar.square(
                                    dimensions: 130,
                                    progress:
                                        controller.dsh!.percentageTeachers ==
                                                null
                                            ? 0
                                            : double.tryParse(controller
                                                    .dsh!.percentageTeachers
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
                                            textAlign: TextAlign.center,
                                            "Percentage\nTeacher",
                                            style: TextStyle(fontSize: 12),
                                          ),
                                          Padding(
                                            padding:
                                                const EdgeInsets.only(top: 5.0),
                                            child: Text(controller.dsh!
                                                        .percentageTeachers ==
                                                    null
                                                ? "0%"
                                                : "${controller.dsh!.percentageTeachers}%"),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                                DashedCircularProgressBar.square(
                                  dimensions: 130,
                                  progress:
                                      controller.dsh!.percentageEmployees ==
                                              null
                                          ? 0
                                          : double.tryParse(controller
                                                  .dsh!.percentageEmployees
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
                                          "Percentage\nEmployee",
                                          style: TextStyle(fontSize: 12),
                                          textAlign: TextAlign.center,
                                        ),
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(top: 5.0),
                                          child: Text(controller.dsh!
                                                      .percentageEmployees ==
                                                  null
                                              ? "0%"
                                              : "${controller.dsh!.percentageEmployees}%"),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            )
                          ],
                        )),
                  ),
                ],
              )),
        );
      },
    );
  }
}