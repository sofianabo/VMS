import 'package:dashed_circular_progress_bar/dashed_circular_progress_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx/widgets/GridAnimation.dart';

class DashboardSecondRow extends StatelessWidget {
  const DashboardSecondRow({super.key});

  @override
  Widget build(BuildContext context) {
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
                          blurRadius: 1)
                    ]),
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
                          progress: 75,
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
                                  child: Text("75%"),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Padding(
                          padding:
                              const EdgeInsets.only(left: 10.0, right: 10.0),
                          child: DashedCircularProgressBar.square(
                            dimensions: 110,
                            progress: 75,
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
                                    child: Text("75%"),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        DashedCircularProgressBar.square(
                          dimensions: 110,
                          progress: 75,
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
                                  child: Text("75%"),
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
                        blurRadius: 1)
                  ]),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 10.0, bottom: 10.0),
                    child: Text("Attendance Today"),
                  ),
                ],
              )),
        ),
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
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 10.0, bottom: 10.0),
                    child: Text("Attendance Today"),
                  ),
                ],
              )),
        ),
      ],
    );
  }
}
