// ignore_for_file: must_be_immutable, file_names
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx/view/Admin/AllEmployeeGrid.dart';
import 'package:getx/widgets/ButtonsDialog.dart';
import 'package:getx/widgets/DropDown.dart';
import 'package:getx/widgets/TextFormSearch.dart';
import 'package:getx/widgets/TextFieldDialog.dart';

class AllEmployee extends StatelessWidget {
  AllEmployee({super.key});

  TextEditingController search = TextEditingController();
  TextEditingController username = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
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
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SizedBox(
                    width: 750,
                    height: 40,
                    child: TextFormSearch(
                      radius: 20,
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
                          "Add Empolyee",
                          style: Get.theme.primaryTextTheme.bodyLarge,
                        ),
                        content: SizedBox(
                            width: 600,
                            height: 240,
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
                                        Text("UserName",
                                            style: Get.theme.primaryTextTheme
                                                .labelSmall),
                                        TextFieldDialog(
                                          controller: username,
                                          hinttext: "User Name",
                                        )
                                      ],
                                    ),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text("Email",
                                            style: Get.theme.primaryTextTheme
                                                .labelSmall),
                                        TextFieldDialog(
                                          controller: email,
                                          hinttext: "Email",
                                        )
                                      ],
                                    ),
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
                                          Text("Password",
                                              style: Get.theme.primaryTextTheme
                                                  .labelSmall),
                                          TextFieldDialog(
                                            controller: password,
                                            hinttext: "Password",
                                          )
                                        ],
                                      )
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(top: 25),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      DropDown(
                                        title: "Status",
                                        width: 115,
                                        options: ['a', 'b'],
                                      ),
                                      DropDown(
                                          title: "Class",
                                          width: 115,
                                          options: ['acc', 'b']),
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
                                  width: 100,
                                  text: "Add",
                                  color: Get.theme.colorScheme.primary,
                                  onPressed: () {})
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
            SizedBox(
              width: MediaQuery.of(context).size.width * 6,
              height: MediaQuery.of(context).size.height * 0.63,
              child: AllEmployeeGrid(),
            ),
          ],
        ),
      ),
    );
  }
}
