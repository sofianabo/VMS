// ignore_for_file: must_be_immutable, file_names

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx/widgets/ButtonsDialog.dart';
import 'package:getx/widgets/TextFieldDialog.dart';

class AllGuardianGrid extends StatelessWidget {
  List<String> items = [
    'Item 1',
    'Item 2',
    'Item 3',
    'Item 4',
    'Item 5',
    'Item 6'
  ];
  TextEditingController gUserName = TextEditingController();
  TextEditingController gNationalID = TextEditingController();
  TextEditingController gEmail = TextEditingController();
  AllGuardianGrid({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      padding: const EdgeInsets.only(top: 20, left: 40, right: 40),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          crossAxisSpacing: 20.0,
          mainAxisSpacing: 20.0,
          childAspectRatio: 1.6),
      itemCount: items.length,
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
                    Text(
                      "Laith Azzam",
                      style: Get.theme.primaryTextTheme.bodyMedium,
                    ),
                    IconButton(
                        onPressed: () {
                          Get.dialog(AlertDialog(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(5)),
                            backgroundColor: Colors.white,
                            surfaceTintColor: Colors.white,
                            title: Text(
                              "Edit Guardian Info",
                              style: Get.theme.primaryTextTheme.bodyLarge,
                            ),
                            content: SizedBox(
                                width: 600,
                                height: 160,
                                child: Column(
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              "Guardian UserName",
                                              style: Get.theme.primaryTextTheme
                                                  .labelSmall,
                                            ),
                                            TextFieldDialog(
                                                controller: gUserName,
                                                hinttext: "Guardian UserName")
                                          ],
                                        ),
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              "Guardian National ID",
                                              style: Get.theme.primaryTextTheme
                                                  .labelSmall,
                                            ),
                                            TextFieldDialog(
                                                controller: gNationalID,
                                                hinttext:
                                                    "Guardian National ID")
                                          ],
                                        )
                                      ],
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(top: 10.0),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                "Guardian Email",
                                                style: Get
                                                    .theme
                                                    .primaryTextTheme
                                                    .labelSmall,
                                              ),
                                              TextFieldDialog(
                                                  controller: gEmail,
                                                  hinttext: "Guardian Email")
                                            ],
                                          )
                                        ],
                                      ),
                                    )
                                  ],
                                )),
                            actions: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  ButtonDialog(
                                      width: 100,
                                      text: "Edit",
                                      onPressed: () {},
                                      color: Get.theme.colorScheme.primary)
                                ],
                              )
                            ],
                          ));
                        },
                        icon: const Icon(Icons.edit))
                  ],
                ),
                Text("E-mail:", style: Get.theme.primaryTextTheme.bodySmall),
                Text("Phone Number",
                    style: Get.theme.primaryTextTheme.bodySmall),
              ],
            ));
      },
    );
  }
}
