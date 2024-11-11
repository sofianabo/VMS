// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/get_core.dart';
import 'package:getx/Link/Controller/AdminController/AdminHomeContentController.dart';
import 'package:getx/Icons_File/v_m_s__icons_icons.dart';
import 'package:getx/Link/Controller/UserController.dart';

class AppbarAdmin extends StatelessWidget {
  const AppbarAdmin({super.key});

  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Container(
        height: 77,
        margin: const EdgeInsets.only(right: 60, left: 30, top: 29),
        width: w,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            GetBuilder<AdminHomeContentController>(builder: (cont) {
              return Row(
                children: [
                  Container(
                      alignment: Alignment.center,
                      width: 40,
                      height: 40,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(5),
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
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(5))))),
                          onPressed: () {},
                          icon: Icon(
                            Icons.logout_rounded,
                            size: 18,
                            color: Get.theme.primaryColor,
                          ))),
                  Padding(
                    padding: const EdgeInsets.only(right: 5.0),
                    child: Container(
                      width: 40,
                      height: 40,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(5),
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
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(5))))),
                          onPressed: () {},
                          icon: Icon(VMS_Icons.moon,
                              size: 18, color: Get.theme.primaryColor)),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 5.0),
                    child: Container(
                      width: 40,
                      height: 40,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(5),
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
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(5))))),
                          onPressed: () {},
                          icon: Icon(Icons.notifications_none_outlined,
                              size: 18, color: Get.theme.primaryColor)),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 5.0),
                    child: Container(
                      height: 40,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(5),
                          boxShadow: const [
                            BoxShadow(
                                color: Colors.black12,
                                offset: Offset(0, 2),
                                blurRadius: 1)
                          ]),
                      width: 200,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Image.asset(
                            "../../images/Home-Background2.png",
                            height: 50,
                            width: 50,
                          ),
                          GetBuilder<UserController>(builder: (control) {
                            return Text(
                              "${control.roll}",
                              style: Get.theme.primaryTextTheme.bodySmall,
                            );
                          })
                        ],
                      ),
                    ),
                  )
                ],
              );
            }),
            GetBuilder<AdminHomeContentController>(builder: (cont) {
              return Text(
                  cont.content == "enroll requests"
                      ? "Enroll Requests"
                      : cont.content == "Exam Table"
                          ? "Exam Table"
                          : cont.content == "School Time Table"
                              ? "School Time Table"
                              : cont.content == "All Students"
                                  ? "All Students"
                                  : cont.content == "Study Year Students"
                                      ? "Study Year Students"
                                      : cont.content == "All Guardians"
                                          ? "All Guardians"
                                          : cont.content == "Student Status"
                                              ? "Students Attendance"
                                              : cont.content == "All Employee"
                                                  ? "All Employees"
                                                  : cont.content ==
                                                          "Teacher Management"
                                                      ? "Teachers Management"
                                                      : cont.content ==
                                                              "Teacher Status"
                                                          ? "Teachers Attendance"
                                                          : cont.content ==
                                                                  "Employee Status"
                                                              ? "Employees Attendance"
                                                              : cont.content ==
                                                                      "Teacher Quorum"
                                                                  ? "Teacher Quorum"
                                                                  : "data",
                  style: Get.theme.primaryTextTheme.titleLarge);
            }),
            SizedBox(
              height: 400,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Image.asset(
                    "../../images/Logo.png",
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
