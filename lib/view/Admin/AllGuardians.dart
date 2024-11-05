// ignore_for_file: file_names, must_be_immutable

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx/view/Admin/AllGuardianGrid.dart';
import 'package:getx/widgets/ButtonsDialog.dart';
import 'package:getx/widgets/TextFieldDialog.dart';
import 'package:getx/widgets/TextFormSearch.dart';

class AllGuardians extends StatelessWidget {
  AllGuardians({super.key});
  TextEditingController search = TextEditingController();
  TextEditingController gUserName = TextEditingController();
  TextEditingController gNationalID = TextEditingController();
  TextEditingController gEmail = TextEditingController();
  TextEditingController password = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(right: 100),
      width: MediaQuery.of(context).size.width * 0.8,
      child: Container(
        margin: const EdgeInsets.only(top: 5),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SizedBox(
                    width: 700,
                    height: 40,
                    child: TextFormSearch(
                      controller: search,
                      suffixIcon: Icons.search,
                    )),
                IconButton(
                    onPressed: () {
                      Get.dialog(AlertDialog(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5)),
                        backgroundColor: Colors.white,
                        surfaceTintColor: Colors.white,
                        title: Text(
                          "Add Guardian",
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
                                          "UserName",
                                          style: Get.theme.primaryTextTheme
                                              .labelSmall,
                                        ),
                                        TextFieldDialog(
                                            controller: gUserName,
                                            hinttext: "User Name")
                                      ],
                                    ),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          "National ID",
                                          style: Get.theme.primaryTextTheme
                                              .labelSmall,
                                        ),
                                        TextFieldDialog(
                                            controller: gNationalID,
                                            hinttext: "National ID")
                                      ],
                                    )
                                  ],
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(top: 15.0),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            "Email",
                                            style: Get.theme.primaryTextTheme
                                                .labelSmall,
                                          ),
                                          TextFieldDialog(
                                              controller: gEmail,
                                              hinttext: "Email")
                                        ],
                                      ),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            "Password",
                                            style: Get.theme.primaryTextTheme
                                                .labelSmall,
                                          ),
                                          TextFieldDialog(
                                              controller: password,
                                              hinttext: "Password")
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
                                  text: "Add",
                                  onPressed: () {},
                                  color: Get.theme.colorScheme.primary)
                            ],
                          )
                        ],
                      ));
                    },
                    icon: const Icon(Icons.add)),
                IconButton(
                    onPressed: () {}, icon: const Icon(Icons.picture_as_pdf)),
                IconButton(
                    onPressed: () {}, icon: const Icon(Icons.picture_as_pdf)),
              ],
            ),
            Container(
              margin: const EdgeInsets.only(right: 20, left: 20, top: 20),
              width: MediaQuery.of(context).size.width * 6,
              height: MediaQuery.of(context).size.height * 0.63,
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20)),
                color: Colors.white,
              ),
              child: AllGuardianGrid(),
            ),
          ],
        ),
      ),
    );
  }
}
