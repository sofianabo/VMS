import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vms_school/Link/Controller/AdminController/School_Controllers/Session_Controller.dart';
import 'package:vms_school/widgets/ButtonsDialog.dart';
import 'package:vms_school/widgets/GridAnimation.dart';
import 'package:vms_school/widgets/VMSAlertDialog.dart';

class SessionManagementGrid extends StatelessWidget {
  SessionManagementGrid({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SessionController>(builder: (control) {
      return GridView.builder(
        padding: const EdgeInsets.only(top: 10, left: 40, right: 40),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 5,
            crossAxisSpacing: 20.0,
            mainAxisSpacing: 20.0,
            childAspectRatio: 1.1),
        itemCount: control.Sessions.length,
        itemBuilder: (context, index) {
          return HoverScaleCard(
            child: GestureDetector(
              onTap: () {
                if (control.Sessions[index]['status'] != "Closed") {
                  Get.dialog(VMSAlertDialog(
                      action: [
                        ButtonDialog(
                            text: "Yes Close",
                            onPressed: () {
                              control.updateStatus(index, "Closed");
                              Get.back();
                            },
                            color: Color(0xff134B70),
                            width: 120),
                        ButtonDialog(
                            text: "Cansel",
                            onPressed: () {
                              Get.back();
                            },
                            color: Color(0xffB03D3D),
                            width: 120),
                      ],
                      contents: Container(
                          width: 400,
                          child: Text(
                            "Close ${control.Sessions[index]['name']}",
                            style: TextStyle(fontSize: 16),
                          )),
                      apptitle: "Close Session",
                      subtitle: "none"));
                }
              },
              child: Container(
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      border: Border.all(color: Colors.grey, width: 0.5),
                      color: Colors.white,
                      boxShadow: const [
                        BoxShadow(
                            color: Colors.black26,
                            offset: Offset(0, 2),
                            blurRadius: 1)
                      ]),
                  child: Stack(
                    fit: StackFit.passthrough,
                    children: [
                      Center(
                        child: Text(
                          "${control.Sessions[index]['name']!.replaceRange(4, 9, "").replaceRange(0, 2, "20\n")}",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: Color(0xff134B70).withOpacity(0.2),
                              fontWeight: FontWeight.bold,
                              fontSize: 60),
                        ),
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text("${control.Sessions[index]['name']}",
                              style: Get.theme.primaryTextTheme.titleLarge!
                                  .copyWith(fontSize: 20, color: Colors.black)),
                          Text("${control.Sessions[index]['status']}",
                              style: Get.theme.primaryTextTheme.titleLarge!
                                  .copyWith(
                                color: control.Sessions[index]['status'] ==
                                        "Closed"
                                    ? Color(0xffB03D3D)
                                    : Color(0xff2F9742),
                              )),
                          Row(
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Text(
                                      "Start Date : ${control.Sessions[index]['startDate']}",
                                      style: Get
                                          .theme.primaryTextTheme.titleLarge!
                                          .copyWith(
                                              fontSize: 16,
                                              fontWeight: FontWeight.normal,
                                              color: Colors.black)),
                                  Text(
                                      "End Date : ${control.Sessions[index]['endDate']}",
                                      style: Get
                                          .theme.primaryTextTheme.titleLarge!
                                          .copyWith(
                                              fontSize: 16,
                                              fontWeight: FontWeight.normal,
                                              color: Colors.black)),
                                ],
                              )
                            ],
                          )
                        ],
                      ),
                    ],
                  )),
            ),
          );
        },
      );
    });
  }
}
