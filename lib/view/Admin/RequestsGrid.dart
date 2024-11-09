// ignore_for_file: must_be_immutable, file_names

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx/widgets/ButtonsDialog.dart';
import 'package:getx/widgets/ButtonsGrid.dart';
import 'package:getx/widgets/DropDown.dart';

class RequestsGrid extends StatelessWidget {
  List<String> items = [
    'Item 1',
    'Item 2',
    'Item 3',
    'Item 4',
    'Item 5',
    'Item 6'
  ];

  RequestsGrid({super.key});

  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;
    return GridView.builder(
      padding: EdgeInsets.only(top: h / 34.2, left: w / 32, right: w / 32),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          crossAxisSpacing: w / 64,
          mainAxisSpacing: w / 64,
          childAspectRatio: (h > 782 && w > 1033)
              ? (w / 20) / (h / 12.5)
              : (w / 20) / (h / 10)),
      itemCount: items.length, // عدد العناصر في الشبكة
      itemBuilder: (context, index) {
        return Container(
            padding: EdgeInsets.all(w / 100),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                border: Border.all(color: Colors.grey, width: 2),
                color: Colors.white,
                boxShadow: const [
                  BoxShadow(
                      color: Colors.grey, offset: Offset(0, 3), blurRadius: 3)
                ]),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Guardian Info :",
                        style: Get.theme.primaryTextTheme.titleSmall),
                    Text("2024-10-16",
                        style: Get.theme.primaryTextTheme.bodySmall)
                  ],
                ),
                Padding(
                  padding: EdgeInsets.only(top: h / 136.8),
                  child: Text("Name: Haitham Azzam",
                      style: Get.theme.primaryTextTheme.bodySmall),
                ),
                Padding(
                  padding: EdgeInsets.only(top: h / 136.8),
                  child: Text("Mobile: 0964213477",
                      style: Get.theme.primaryTextTheme.bodySmall),
                ),
                Padding(
                  padding: EdgeInsets.only(top: h / 136.8),
                  child: Text("E-mail: laithazzam@gmail.com",
                      style: Get.theme.primaryTextTheme.bodySmall),
                ),
                Padding(
                  padding: EdgeInsets.only(top: h / 136.8),
                  child: Text("National ID: 8746291876234",
                      style: Get.theme.primaryTextTheme.bodySmall),
                ),
                Padding(
                  padding: EdgeInsets.only(top: h / 136.8),
                  child: Text("Student Info:",
                      style: Get.theme.primaryTextTheme.titleSmall),
                ),
                Padding(
                  padding: EdgeInsets.only(top: h / 136.8),
                  child: Text("Name: Laith Azzam",
                      style: Get.theme.primaryTextTheme.bodySmall),
                ),
                Padding(
                  padding: EdgeInsets.only(top: h / 136.8),
                  child: Text("Grade Level: Twelveth scientific grade",
                      style: Get.theme.primaryTextTheme.bodySmall),
                ),
                Padding(
                  padding: EdgeInsets.only(top: h / 85.5),
                  child: Row(
                    children: [
                      ButtonsGrid(
                          text: "Manage",
                          width: w / 7.5,
                          height: h / 18,
                          onPressed: () {
                            Get.dialog(AlertDialog(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(5)),
                              backgroundColor: Colors.white,
                              surfaceTintColor: Colors.white,
                              content: SizedBox(
                                  width: w / 2.2,
                                  height: h / 3,
                                  child: Padding(
                                    padding: EdgeInsets.only(
                                        left: w / 85.333, right: w / 85.333),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                              "Manage Student",
                                              style: Get.theme.primaryTextTheme
                                                  .bodyLarge,
                                            ),
                                            IconButton(
                                                onPressed: () {
                                                  Get.back();
                                                },
                                                icon: const Icon(Icons
                                                    .disabled_by_default_rounded))
                                          ],
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
                                            Text(
                                              "Manage Laith Azzam Student",
                                              style: Get.theme.primaryTextTheme
                                                  .bodyMedium,
                                            ),
                                          ],
                                        ),
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(top: 50.0),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              DropDown(
                                                title: "Class",
                                                width: w / 5.12,
                                                options: [],
                                              ),
                                              DropDown(
                                                title: "Division",
                                                width: w / 5.12,
                                                options: [],
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  )),
                              actions: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    ButtonDialog(
                                      width: 100,
                                        text: "Reject",
                                        onPressed: () {},
                                        color: Color(0xffb03d3d)),
                                    Padding(
                                        padding:
                                            EdgeInsets.only(right: w / 64)),
                                    ButtonDialog(
                                      width: 100,
                                        text: "Approve",
                                        onPressed: () {},
                                        color: Get.theme.colorScheme.primary)
                                  ],
                                )
                              ],
                            ));
                          },
                          color: Get.theme.colorScheme.primary),
                      Padding(
                        padding: EdgeInsets.only(left: w / 128),
                        child: Text("Pending",
                            style: TextStyle(
                                color: Get.theme.colorScheme.secondary)),
                      )
                    ],
                  ),
                )
              ],
            ));
      },
    );
  }
}
