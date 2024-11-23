import 'package:d_chart/d_chart.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:dashed_circular_progress_bar/dashed_circular_progress_bar.dart';

class AdminDashboard extends StatelessWidget {
  AdminDashboard({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 25.0, left: 25.0),
      child: Expanded(
        child: Center(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [
                  Container(
                    padding: EdgeInsets.only(
                        top: 20.0, left: 32.0, right: 32.0, bottom: 20),
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
                    child: Row(
                      children: [
                        CircleAvatar(
                          maxRadius: 60,
                          foregroundImage:
                              AssetImage("../../images/Rectangle66.png"),
                        ),
                        Column(
                          children: [
                            Text("Welcome Laith Haitham Azzam"),
                            Text("Have A Nice Day At Work"),
                            Padding(
                              padding: const EdgeInsets.only(top: 20.0),
                              child: Row(
                                children: [
                                  Container(
                                      alignment: Alignment.center,
                                      width: 40,
                                      height: 40,
                                      decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius:
                                              BorderRadius.circular(5),
                                          boxShadow: const [
                                            BoxShadow(
                                                color: Colors.black12,
                                                offset: Offset(0, 2),
                                                blurRadius: 1)
                                          ]),
                                      child: IconButton(
                                          style: ButtonStyle(
                                              shape: WidgetStatePropertyAll(
                                                  RoundedRectangleBorder(
                                                      borderRadius:
                                                          BorderRadius.all(
                                                              Radius.circular(
                                                                  5))))),
                                          onPressed: () async {},
                                          icon: Icon(
                                            Icons.notifications_none_outlined,
                                            size: 18,
                                            color: Get.theme.primaryColor,
                                          ))),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        left: 8.0, right: 8.0),
                                    child: Container(
                                        alignment: Alignment.center,
                                        width: 40,
                                        height: 40,
                                        decoration: BoxDecoration(
                                            color: Colors.white,
                                            borderRadius:
                                                BorderRadius.circular(5),
                                            boxShadow: const [
                                              BoxShadow(
                                                  color: Colors.black12,
                                                  offset: Offset(0, 2),
                                                  blurRadius: 1)
                                            ]),
                                        child: IconButton(
                                            style: ButtonStyle(
                                                shape: WidgetStatePropertyAll(
                                                    RoundedRectangleBorder(
                                                        borderRadius:
                                                            BorderRadius.all(
                                                                Radius.circular(
                                                                    5))))),
                                            onPressed: () async {},
                                            icon: Icon(
                                              Icons.dark_mode_outlined,
                                              size: 18,
                                              color: Get.theme.primaryColor,
                                            ))),
                                  ),
                                  Container(
                                      alignment: Alignment.center,
                                      width: 40,
                                      height: 40,
                                      decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius:
                                              BorderRadius.circular(5),
                                          boxShadow: const [
                                            BoxShadow(
                                                color: Colors.black12,
                                                offset: Offset(0, 2),
                                                blurRadius: 1)
                                          ]),
                                      child: IconButton(
                                          style: ButtonStyle(
                                              shape: WidgetStatePropertyAll(
                                                  RoundedRectangleBorder(
                                                      borderRadius:
                                                          BorderRadius.all(
                                                              Radius.circular(
                                                                  5))))),
                                          onPressed: () async {},
                                          icon: Icon(
                                            Icons.edit_note_sharp,
                                            size: 18,
                                            color: Get.theme.primaryColor,
                                          ))),
                                ],
                              ),
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 15.0, bottom: 15.0),
                    child: Container(
                        padding: EdgeInsets.all(13.0),
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
                                  foregroundColor: Get.theme.primaryColor,
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
                                          padding:
                                              const EdgeInsets.only(top: 5.0),
                                          child: Text("75%"),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                      left: 10.0, right: 10.0),
                                  child: DashedCircularProgressBar.square(
                                    dimensions: 110,
                                    progress: 75,
                                    maxProgress: 100,
                                    startAngle: -27.5,
                                    foregroundColor: Get.theme.primaryColor,
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
                                            padding:
                                                const EdgeInsets.only(top: 5.0),
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
                                  foregroundColor: Get.theme.primaryColor,
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
                                          padding:
                                              const EdgeInsets.only(top: 5.0),
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
                  Container(
                    width: 375,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                            width: 180,
                            height: 160,
                            padding: EdgeInsets.all(13.0),
                            decoration: BoxDecoration(
                                color: Color(0xffF3F4F8),
                                border:
                                    Border.all(color: Colors.grey, width: 0.2),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(5)),
                                boxShadow: const [
                                  BoxShadow(
                                      color: Colors.black12,
                                      offset: Offset(0, 2),
                                      blurRadius: 1)
                                ]),
                            child: Column(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(
                                      top: 10.0, bottom: 10.0),
                                  child: Text("Attendance Today"),
                                ),
                              ],
                            )),
                        Container(
                            width: 180,
                            height: 160,
                            padding: EdgeInsets.all(13.0),
                            decoration: BoxDecoration(
                                color: Color(0xffF3F4F8),
                                border:
                                    Border.all(color: Colors.grey, width: 0.2),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(5)),
                                boxShadow: const [
                                  BoxShadow(
                                      color: Colors.black12,
                                      offset: Offset(0, 2),
                                      blurRadius: 1)
                                ]),
                            child: Column(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(
                                      top: 10.0, bottom: 10.0),
                                  child: Text("Attendance Today"),
                                ),
                              ],
                            )),
                      ],
                    ),
                  ),
                ],
              ),
              Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(bottom: 15.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 15.0),
                          child: Container(
                              width: 170,
                              height: 160,
                              padding: EdgeInsets.all(13.0),
                              decoration: BoxDecoration(
                                  color: Color(0xffF3F4F8),
                                  border: Border.all(
                                      color: Colors.grey, width: 0.2),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(5)),
                                  boxShadow: const [
                                    BoxShadow(
                                        color: Colors.black12,
                                        offset: Offset(0, 2),
                                        blurRadius: 1)
                                  ]),
                              child: Column(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        top: 10.0, bottom: 10.0),
                                    child: Text("Attendance Today"),
                                  ),
                                ],
                              )),
                        ),
                        Padding(
                          padding:
                              const EdgeInsets.only(left: 15.0, right: 15.0),
                          child: Container(
                              width: 180,
                              height: 160,
                              padding: EdgeInsets.all(13.0),
                              decoration: BoxDecoration(
                                  color: Color(0xffF3F4F8),
                                  border: Border.all(
                                      color: Colors.grey, width: 0.2),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(5)),
                                  boxShadow: const [
                                    BoxShadow(
                                        color: Colors.black12,
                                        offset: Offset(0, 2),
                                        blurRadius: 1)
                                  ]),
                              child: Column(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        top: 10.0, bottom: 10.0),
                                    child: Text("Attendance Today"),
                                  ),
                                ],
                              )),
                        ),
                        Container(
                            width: 170,
                            height: 160,
                            padding: EdgeInsets.all(13.0),
                            decoration: BoxDecoration(
                                color: Color(0xffF3F4F8),
                                border:
                                    Border.all(color: Colors.grey, width: 0.2),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(5)),
                                boxShadow: const [
                                  BoxShadow(
                                      color: Colors.black12,
                                      offset: Offset(0, 2),
                                      blurRadius: 1)
                                ]),
                            child: Column(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(
                                      top: 10.0, bottom: 10.0),
                                  child: Text("Attendance Today"),
                                ),
                              ],
                            )),
                      ],
                    ),
                  ),
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 15.0),
                        child: Container(
                            width: 270,
                            height: 170,
                            padding: EdgeInsets.all(13.0),
                            decoration: BoxDecoration(
                                color: Color(0xffF3F4F8),
                                border:
                                    Border.all(color: Colors.grey, width: 0.2),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(5)),
                                boxShadow: const [
                                  BoxShadow(
                                      color: Colors.black12,
                                      offset: Offset(0, 2),
                                      blurRadius: 1)
                                ]),
                            child: Column(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(
                                      top: 10.0, bottom: 10.0),
                                  child: Text("Attendance Today"),
                                ),
                              ],
                            )),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 15.0),
                        child: Container(
                            width: 270,
                            height: 170,
                            padding: EdgeInsets.all(13.0),
                            decoration: BoxDecoration(
                                color: Color(0xffF3F4F8),
                                border:
                                    Border.all(color: Colors.grey, width: 0.2),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(5)),
                                boxShadow: const [
                                  BoxShadow(
                                      color: Colors.black12,
                                      offset: Offset(0, 2),
                                      blurRadius: 1)
                                ]),
                            child: Column(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(
                                      top: 10.0, bottom: 10.0),
                                  child: Text("Attendance Today"),
                                ),
                              ],
                            )),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 15.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 15.0),
                          child: Container(
                              width: 170,
                              height: 160,
                              padding: EdgeInsets.all(13.0),
                              decoration: BoxDecoration(
                                  color: Color(0xffF3F4F8),
                                  border: Border.all(
                                      color: Colors.grey, width: 0.2),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(5)),
                                  boxShadow: const [
                                    BoxShadow(
                                        color: Colors.black12,
                                        offset: Offset(0, 2),
                                        blurRadius: 1)
                                  ]),
                              child: Column(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        top: 10.0, bottom: 10.0),
                                    child: Text("Attendance Today"),
                                  ),
                                ],
                              )),
                        ),
                        Padding(
                          padding:
                              const EdgeInsets.only(left: 15.0, right: 15.0),
                          child: Container(
                              width: 180,
                              height: 160,
                              padding: EdgeInsets.all(13.0),
                              decoration: BoxDecoration(
                                  color: Color(0xffF3F4F8),
                                  border: Border.all(
                                      color: Colors.grey, width: 0.2),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(5)),
                                  boxShadow: const [
                                    BoxShadow(
                                        color: Colors.black12,
                                        offset: Offset(0, 2),
                                        blurRadius: 1)
                                  ]),
                              child: Column(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        top: 10.0, bottom: 10.0),
                                    child: Text("Attendance Today"),
                                  ),
                                ],
                              )),
                        ),
                        Container(
                            width: 170,
                            height: 160,
                            padding: EdgeInsets.all(13.0),
                            decoration: BoxDecoration(
                                color: Color(0xffF3F4F8),
                                border:
                                    Border.all(color: Colors.grey, width: 0.2),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(5)),
                                boxShadow: const [
                                  BoxShadow(
                                      color: Colors.black12,
                                      offset: Offset(0, 2),
                                      blurRadius: 1)
                                ]),
                            child: Column(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(
                                      top: 10.0, bottom: 10.0),
                                  child: Text("Attendance Today"),
                                ),
                              ],
                            )),
                      ],
                    ),
                  ),
                ],
              ),
              Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(bottom: 15.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 15.0),
                          child: Container(
                              width: 170,
                              height: 160,
                              padding: EdgeInsets.all(13.0),
                              decoration: BoxDecoration(
                                  color: Color(0xffF3F4F8),
                                  border: Border.all(
                                      color: Colors.grey, width: 0.2),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(5)),
                                  boxShadow: const [
                                    BoxShadow(
                                        color: Colors.black12,
                                        offset: Offset(0, 2),
                                        blurRadius: 1)
                                  ]),
                              child: Column(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        top: 10.0, bottom: 10.0),
                                    child: Text("Attendance Today"),
                                  ),
                                ],
                              )),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 15.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                            width: 170,
                            height: 160,
                            padding: EdgeInsets.all(13.0),
                            decoration: BoxDecoration(
                                color: Color(0xffF3F4F8),
                                border:
                                    Border.all(color: Colors.grey, width: 0.2),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(5)),
                                boxShadow: const [
                                  BoxShadow(
                                      color: Colors.black12,
                                      offset: Offset(0, 2),
                                      blurRadius: 1)
                                ]),
                            child: Column(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(
                                      top: 10.0, bottom: 10.0),
                                  child: Text("Attendance Today"),
                                ),
                              ],
                            )),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 15.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                            width: 170,
                            height: 160,
                            padding: EdgeInsets.all(13.0),
                            decoration: BoxDecoration(
                                color: Color(0xffF3F4F8),
                                border:
                                    Border.all(color: Colors.grey, width: 0.2),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(5)),
                                boxShadow: const [
                                  BoxShadow(
                                      color: Colors.black12,
                                      offset: Offset(0, 2),
                                      blurRadius: 1)
                                ]),
                            child: Column(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(
                                      top: 10.0, bottom: 10.0),
                                  child: Text("Attendance Today"),
                                ),
                              ],
                            )),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
