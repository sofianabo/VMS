// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/get_core.dart';
import 'package:getx/Controller/AdminController/AdminHomeContentController.dart';

class AppbarAdmin extends StatelessWidget {
  const AppbarAdmin({super.key});

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Container(
        height: 100,
        margin: const EdgeInsets.only(right: 60, left: 30),
        width: MediaQuery.of(context).size.width,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            GetBuilder<AdminHomeContentController>(builder: (cont) {
              return Row(
                children: [
                  IconButton(onPressed: () {}, icon: const Icon(Icons.logout)),
                  IconButton(
                      onPressed: () {},
                      icon: const Icon(Icons.mode_night_outlined)),
                  IconButton(
                      onPressed: () {}, icon: const Icon(Icons.chat_bubble)),
                  Container(
                    width: 150,
                    decoration: BoxDecoration(
                        color: Colors.grey[200],
                        borderRadius: BorderRadius.circular(10)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Image.asset(
                          "../../images/Home-Background2.png",
                          height: 50,
                          width: 50,
                        ),
                        Text(
                          "Sofian",
                          style: Get.theme.primaryTextTheme.bodySmall,
                        )
                      ],
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
                                              ? "Students Status"
                                              : cont.content == "All Employee"
                                                  ? "All Employees"
                                                  : cont.content ==
                                                          "Teacher Management"
                                                      ? "Teachers Management"
                                                      : cont.content ==
                                                              "Teacher Status"
                                                          ? "Teachers Status"
                                                          : cont.content ==
                                                                  "Employee Status"
                                                              ? "Employees Status"
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
