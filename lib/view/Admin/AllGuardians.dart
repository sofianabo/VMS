// ignore_for_file: file_names, must_be_immutable

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx/view/Admin/AllGuardianGrid.dart';
import 'package:getx/widgets/ButtonsDialog.dart';
import 'package:getx/widgets/TextFieldDialog.dart';
import 'package:getx/widgets/TextFormSearch.dart';

import '../../Icons_File/v_m_s__icons_icons.dart';
import '../../widgets/DropDown.dart';
import '../../widgets/VMSAlertDialog.dart';

class AllGuardians extends StatelessWidget {
  AllGuardians({super.key});
  TextEditingController search = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController username = TextEditingController();
  TextEditingController pass = TextEditingController();
  TextEditingController cpass = TextEditingController();

  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
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
                      Padding(
                        padding: const EdgeInsets.only(left: 8.0),
                        child: TextFormSearch(
                          width: w * 0.7,
                          radius: 5,
                          controller: search,
                          suffixIcon: Icons.search,
                        ),
                      ),
                    ],
                  ),
                  Spacer(),
                  Row(
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
                            style: ButtonStyle(
                                shape: WidgetStatePropertyAll(
                                    RoundedRectangleBorder(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(5))))),
                            onPressed: () {
                              Get.dialog(VMSAlertDialog(
                                  contents: SizedBox(
                                      child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                right: 15.0),
                                            child: Column(
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
                                                TextFieldDialog(
                                                    controller: email,
                                                    hinttext: "Email")
                                              ],
                                            ),
                                          ),
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                "Guardian Username",
                                                style: Get
                                                    .theme
                                                    .primaryTextTheme
                                                    .labelSmall,
                                              ),
                                              TextFieldDialog(
                                                  controller: username,
                                                  hinttext: "Guardian Username")
                                            ],
                                          )
                                        ],
                                      ),
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(top: 20.0),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  right: 15.0),
                                              child: Column(
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
                                                  TextFieldDialog(
                                                      controller: email,
                                                      hinttext: "Password")
                                                ],
                                              ),
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
                                                TextFieldDialog(
                                                    controller: username,
                                                    hinttext:
                                                        "Confirm Password")
                                              ],
                                            )
                                          ],
                                        ),
                                      ),
                                    ],
                                  )),
                                  action: [
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        ButtonDialog(
                                            width: 150,
                                            text: "Add Guardian",
                                            onPressed: () {},
                                            color:
                                                Get.theme.colorScheme.primary)
                                      ],
                                    )
                                  ],
                                  apptitle: "Add Guardian",
                                  subtitle: "none"));
                            },
                            icon: Icon(Icons.add,
                                size: 18, color: Get.theme.primaryColor)),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 10.0),
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
                              icon: Icon(VMS_Icons.pdf,
                                  size: 18, color: Get.theme.primaryColor)),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 10.0, left: 10.0),
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
                              icon: Icon(VMS_Icons.xl,
                                  size: 18, color: Get.theme.primaryColor)),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ],
          ),
        ),
        Expanded(
            child: Padding(
          padding: const EdgeInsets.only(top: 15.0),
          child: AllGuardianGrid(),
        )),
      ],
    ));
  }
}
