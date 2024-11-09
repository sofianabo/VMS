// ignore_for_file: must_be_immutable, file_names

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx/view/Admin/TeacherManagementGrid.dart';
import 'package:getx/widgets/ButtonsDialog.dart';
import 'package:getx/widgets/TextFieldDialog.dart';
import 'package:getx/widgets/TextFormSearch.dart';

class TeacherManagement extends StatelessWidget {
  TeacherManagement({super.key});

  TextEditingController search = TextEditingController();
  TextEditingController username = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController cPassword = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(right: 100),
      width: MediaQuery.of(context).size.width * 0.8,
      child: Container(
        margin: const EdgeInsets.only(top: 10),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  width: 900,
                  child: TextFormSearch(
                    radius: 20,
                    controller: search,
                    suffixIcon: Icons.search,
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    IconButton(
                        onPressed: () {
                          Get.dialog(AlertDialog(
                            title: Padding(
                              padding:
                                  const EdgeInsets.only(left: 20.0, right: 20),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "Add Teacher",
                                    style: Get.theme.primaryTextTheme.bodyLarge,
                                  ),
                                  const Icon(
                                    Icons.highlight_remove_sharp,
                                  ),
                                ],
                              ),
                            ),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(5)),
                            backgroundColor: Colors.white,
                            surfaceTintColor: Colors.white,
                            content: Container(
                                margin: const EdgeInsets.only(
                                    left: 20, right: 20, top: 10),
                                width: 500,
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
                                              "UserName",
                                              style: Get.theme.primaryTextTheme
                                                  .labelSmall,
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  top: 5.0),
                                              child: TextFieldDialog(
                                                  controller: username,
                                                  hinttext: "UserName"),
                                            )
                                          ],
                                        ),
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              "Email",
                                              style: Get.theme.primaryTextTheme
                                                  .labelSmall,
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  top: 5.0),
                                              child: TextFieldDialog(
                                                  controller: email,
                                                  hinttext: "Email"),
                                            )
                                          ],
                                        ),
                                      ],
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(top: 20.0),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                "Password",
                                                style: Get
                                                    .theme
                                                    .primaryTextTheme
                                                    .labelSmall,
                                              ),
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                    top: 5.0),
                                                child: TextFieldDialog(
                                                    controller: password,
                                                    hinttext: "Password"),
                                              )
                                            ],
                                          ),
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                "Confirm Password",
                                                style: Get
                                                    .theme
                                                    .primaryTextTheme
                                                    .labelSmall,
                                              ),
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                    top: 5.0),
                                                child: TextFieldDialog(
                                                    controller: cPassword,
                                                    hinttext:
                                                        "Confirm Password"),
                                              )
                                            ],
                                          )
                                        ],
                                      ),
                                    ),
                                  ],
                                )),
                            actions: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  ButtonDialog(
                                      width: 120,
                                      text: "Add Teacher",
                                      onPressed: () {},
                                      color: Get.theme.colorScheme.primary)
                                ],
                              )
                            ],
                          ));
                        },
                        icon: const Icon(
                          Icons.add,
                          size: 30,
                        )),
                    IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          Icons.picture_as_pdf,
                          size: 30,
                        )),
                    IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          Icons.picture_as_pdf,
                          size: 30,
                        )),
                  ],
                )
              ],
            ),
            Container(
              margin: const EdgeInsets.only(top: 20),
              width: MediaQuery.of(context).size.width * 8,
              height: MediaQuery.of(context).size.height * 0.63,
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20)),
                color: Colors.white,
              ),
              child: TeacherManagementGrid(),
            ),
          ],
        ),
      ),
    );
  }
}
