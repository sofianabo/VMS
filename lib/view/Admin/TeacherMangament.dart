// ignore_for_file: must_be_immutable, file_names

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx/Icons_File/v_m_s__icons_icons.dart';
import 'package:getx/view/Admin/TeacherManagementGrid.dart';
import 'package:getx/widgets/ButtonsDialog.dart';
import 'package:getx/widgets/DropDown.dart';
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
    return Expanded(
      child: Column(
        children: [
          Container(
              margin: EdgeInsets.only(left: 30.0, right: 30.0, top: 30.0),
              alignment: Alignment.center,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Row(
                        children: [
                          DropDown(width: 165, title: "session", options: []),
                          Padding(
                            padding:
                                const EdgeInsets.only(left: 20.0, right: 20.0),
                            child: DropDown(
                                width: 165, title: "class", options: []),
                          ),
                          Padding(
                            padding:
                                const EdgeInsets.only(left: 20.0, right: 20.0),
                            child: DropDown(
                                width: 165, title: "Curriculum", options: []),
                          ),
                          TextFormSearch(
                            radius: 5,
                            controller: search,
                            suffixIcon: Icons.search,
                          ),
                        ],
                      ),
                      Spacer(),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Container(
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
                                style: const ButtonStyle(
                                    shape: WidgetStatePropertyAll(
                                        RoundedRectangleBorder(
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(5))))),
                                onPressed: () {
                                  Get.dialog(AlertDialog(
                                    title: Padding(
                                      padding: const EdgeInsets.only(
                                          left: 20.0, right: 20),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            "Add Teacher",
                                            style: Get.theme.primaryTextTheme
                                                .bodyLarge,
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
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Text(
                                                      "UserName",
                                                      style: Get
                                                          .theme
                                                          .primaryTextTheme
                                                          .labelSmall,
                                                    ),
                                                    Padding(
                                                      padding:
                                                          const EdgeInsets.only(
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
                                                      style: Get
                                                          .theme
                                                          .primaryTextTheme
                                                          .labelSmall,
                                                    ),
                                                    Padding(
                                                      padding:
                                                          const EdgeInsets.only(
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
                                              padding: const EdgeInsets.only(
                                                  top: 20.0),
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Text(
                                                        "Password",
                                                        style: Get
                                                            .theme
                                                            .primaryTextTheme
                                                            .labelSmall,
                                                      ),
                                                      Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                .only(top: 5.0),
                                                        child: TextFieldDialog(
                                                            controller:
                                                                password,
                                                            hinttext:
                                                                "Password"),
                                                      )
                                                    ],
                                                  ),
                                                  Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Text(
                                                        "Confirm Password",
                                                        style: Get
                                                            .theme
                                                            .primaryTextTheme
                                                            .labelSmall,
                                                      ),
                                                      Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                .only(top: 5.0),
                                                        child: TextFieldDialog(
                                                            controller:
                                                                cPassword,
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
                                        mainAxisAlignment:
                                            MainAxisAlignment.end,
                                        children: [
                                          ButtonDialog(
                                              width: 120,
                                              text: "Add Teacher",
                                              onPressed: () {},
                                              color:
                                                  Get.theme.colorScheme.primary)
                                        ],
                                      )
                                    ],
                                  ));
                                },
                                icon: Icon(
                                  Icons.add,
                                  size: 18,
                                  color: Get.theme.primaryColor,
                                )),
                          ),
                          Padding(
                            padding:
                                const EdgeInsets.only(right: 10.0, left: 10.0),
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
                                  style: const ButtonStyle(
                                      shape: WidgetStatePropertyAll(
                                          RoundedRectangleBorder(
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(5))))),
                                  onPressed: () {},
                                  icon: Icon(VMS_Icons.xl,
                                      size: 18, color: Get.theme.primaryColor)),
                            ),
                          ),
                          Container(
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
                                style: const ButtonStyle(
                                    shape: WidgetStatePropertyAll(
                                        RoundedRectangleBorder(
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(5))))),
                                onPressed: () {},
                                icon: Icon(VMS_Icons.pdf,
                                    size: 18, color: Get.theme.primaryColor)),
                          ),
                        ],
                      )
                    ],
                  )
                ],
              )),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(top: 15),
              child: TeacherManagementGrid(),
            ),
          ),
        ],
      ),
    );
  }
}
