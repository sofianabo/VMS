// ignore_for_file: must_be_immutable, file_names

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx/widgets/ButtonsDialog.dart';

class StudyYearStudentGrid extends StatelessWidget {
  List<String> items = [
    'Item 1',
    'Item 2',
    'Item 3',
    'Item 4',
    'Item 5',
    'Item 6'
  ];
  TextEditingController reason = TextEditingController();

  StudyYearStudentGrid({super.key});

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
                    Image.asset("../../images/Home-Background2.png",
                        height: 70, width: 70)
                  ],
                ),
                Text(
                  "Successful",
                  style: Get.theme.primaryTextTheme.displaySmall,
                ),
                Text(
                  "Grade Level:",
                  style: Get.theme.primaryTextTheme.bodySmall,
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        width: 120,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            border: Border.all(color: Get.theme.primaryColor),
                            color: Get.theme.primaryColor),
                        child: Center(
                            child: MaterialButton(
                          onPressed: () {},
                          child: Text(
                            "First Season",
                            style: Get.theme.primaryTextTheme.headlineSmall,
                          ),
                        )),
                      ),
                      Container(
                        width: 120,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            border: Border.all(color: Get.theme.primaryColor),
                            color: Get.theme.primaryColor),
                        child: Center(
                            child: MaterialButton(
                          onPressed: () {
                            Get.dialog(AlertDialog(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(5)),
                              backgroundColor: Colors.white,
                              surfaceTintColor: Colors.white,
                              title: Text(
                                "Suspend Student",
                                style: Get.theme.primaryTextTheme.bodyMedium,
                              ),
                              content: SizedBox(
                                  width: 400,
                                  height: 60,
                                  child: Column(
                                    children: [
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          Text(
                                            "The Reason",
                                            style: Get.theme.primaryTextTheme
                                                .bodySmall,
                                          ),
                                        ],
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          SizedBox(
                                            width: 400,
                                            height: 40,
                                            child: TextFormField(
                                              controller: reason,
                                              decoration: InputDecoration(
                                                border: OutlineInputBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(10),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  )),
                              actions: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    ButtonDialog(
                                      width: 100,
                                      text: "Send", onPressed: (){}, color: Get.theme.colorScheme.primary)
                                  ],
                                )
                              ],
                            ));
                          },
                          child: Text(
                            "Suspend",
                            style: Get.theme.primaryTextTheme.headlineSmall,
                          ),
                        )),
                      ),
                    ],
                  ),
                )
              ],
            ));
      },
    );
  }
}
