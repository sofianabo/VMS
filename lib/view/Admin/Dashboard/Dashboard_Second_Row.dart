import 'package:dashed_circular_progress_bar/dashed_circular_progress_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:get/get.dart';
import 'package:vms_school/Link/Controller/AdminController/Main_Admin_Controller/Dashboard_Controller.dart';
import 'package:vms_school/view/Admin/Dashboard/Admin_Charts.dart';
import 'package:vms_school/widgets/GridAnimation.dart';

class DashboardSecondRow extends StatelessWidget {
  const DashboardSecondRow({super.key});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
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
                      child: Padding(
                        padding: const EdgeInsets.only(bottom: 15.0),
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
                      ),
                    )
                        .animate(onPlay: (controller) => controller.repeat())
                        .shimmer(
                            angle: 1,
                            color: Colors.grey.withOpacity(0.2),
                            duration: const Duration(seconds: 1),
                            delay: const Duration(seconds: 1)),
                    HoverScaleCard(
                      child: Padding(
                        padding: const EdgeInsets.only(bottom: 15.0),
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
                        child: Padding(
                          padding: const EdgeInsets.only(bottom: 15.0),
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
                        child: Padding(
                          padding: const EdgeInsets.only(bottom: 15.0),
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
                        ),
                      )
                          .animate(onPlay: (controller) => controller.repeat())
                          .shimmer(
                              angle: 1,
                              color: Colors.grey.withOpacity(0.2),
                              duration: const Duration(seconds: 1),
                              delay: const Duration(seconds: 1)),
                    ),
                  ],
                );
              }
            },
          );
        }

        return LayoutBuilder(
          builder: (context, constraints) {
            if (constraints.maxWidth < 850) {
              return Column(
                spacing: 20.0,
                children: [
                  HoverScaleCard(
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
                                blurRadius: 1)
                          ]),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            child: BarChartSample2(
                              headerText: "Presence this session students".tr,
                              data: convertNumberOfStudentsThisYearToWidgetData(
                                  controller.dsh!.numberOfStudentsThisYear),
                            ),
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
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            child: BarChartSample1(
                              headerText: "Presence of students".tr,
                              data: convertNumberOfStudentsPerYearToWidgetData(
                                  controller.dsh!.numberOfStudentsPerYear),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
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
                        decoration: BoxDecoration(
                            color: Theme.of(context).cardColor,
                            border: Border.all(color: Colors.grey, width: 0.2),
                            borderRadius:
                                const BorderRadius.all(Radius.circular(5)),
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
                                headerText: "Presence this session students".tr,
                                data:
                                    convertNumberOfStudentsThisYearToWidgetData(
                                        controller
                                            .dsh!.numberOfStudentsThisYear),
                              ),
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
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(
                              child: BarChartSample1(
                                headerText: "Presence of students".tr,
                                data:
                                    convertNumberOfStudentsPerYearToWidgetData(
                                        controller
                                            .dsh!.numberOfStudentsPerYear),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              );
            }
          },
        );
      },
    );
  }
}
