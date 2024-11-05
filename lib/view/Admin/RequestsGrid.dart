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
    return GridView.builder(
      padding: const EdgeInsets.only(top: 20, left: 40, right: 40),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          crossAxisSpacing: 20.0,
          mainAxisSpacing: 20.0,
          childAspectRatio: 1.3),
      itemCount: items.length, // عدد العناصر في الشبكة
      itemBuilder: (context, index) {
        return Container(
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                border: Border.all(color: Colors.grey, width: 2),
                color: Colors.white,
                boxShadow: const [
                  BoxShadow(
                      color: Colors.grey, offset: Offset(0, 10), blurRadius: 10)
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
                Text("Name:", style: Get.theme.primaryTextTheme.bodySmall),
                Text("Mobile:", style: Get.theme.primaryTextTheme.bodySmall),
                Text("E-mail:", style: Get.theme.primaryTextTheme.bodySmall),
                Text("National ID:",
                    style: Get.theme.primaryTextTheme.bodySmall),
                Text("Student Info:",
                    style: Get.theme.primaryTextTheme.titleSmall),
                Text("Name:", style: Get.theme.primaryTextTheme.bodySmall),
                Text("Grade Level:",
                    style: Get.theme.primaryTextTheme.bodySmall),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ButtonsGrid(
                        text: "Manage",
                        onPressed: () {
                          Get.dialog(AlertDialog(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(5)),
                            backgroundColor: Colors.white,
                            surfaceTintColor: Colors.white,
                            title: Text(
                              "Manage Student",
                              style: Get.theme.primaryTextTheme.bodyLarge,
                            ),
                            content: SizedBox(
                                width: 600,
                                height: 120,
                                child: Padding(
                                  padding: const EdgeInsets.only(
                                      left: 15.0, right: 15),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          DropDown(
                                            title: "Class",
                                            width: 250,
                                            options: [],
                                          ),
                                          DropDown(
                                            title: "Division",
                                            width: 250,
                                            options: [],
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                )),
                            actions: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  ButtonDialog(
                                      text: "Reject",
                                      onPressed: () {},
                                      color: Colors.red),
                                  Padding(padding: EdgeInsets.only(right: 20)),
                                  ButtonDialog(
                                      text: "Approve",
                                      onPressed: () {},
                                      color: Get.theme.colorScheme.primary)
                                ],
                              )
                            ],
                          ));
                        },
                        color: Get.theme.colorScheme.primary),
                    Text("Pending",
                        style:
                            TextStyle(color: Get.theme.colorScheme.secondary))
                  ],
                )
              ],
            ));
      },
    );
  }
}
