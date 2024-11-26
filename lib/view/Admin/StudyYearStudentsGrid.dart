import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vms_school/widgets/DropDown.dart';
import 'package:vms_school/widgets/TextFieldDialog.dart';
import 'package:vms_school/widgets/VMSAlertDialog.dart';
import '../../Icons_File/v_m_s__icons_icons.dart';
import '../../widgets/ButtonsDialog.dart';
import '../../widgets/Calender.dart';
import '../../widgets/GridAnimation.dart';

class StudyYearStudentGrid extends StatelessWidget {
  TextEditingController reason = TextEditingController();

  StudyYearStudentGrid({super.key});

  List<Map<String, dynamic>> l = [
    {
      "name": "Laith Haitham Azzam",
      "result": "Successful",
      "level": "Twelveth scientific grade"
    },
    {
      "name": "Laith Haitham Azzam",
      "result": "Passing",
      "level": "Twelveth scientific grade"
    },
    {
      "name": "Laith Haitham Azzam",
      "result": "No Result",
      "level": "Twelveth scientific grade"
    },
    {
      "name": "Laith Haitham Azzam",
      "result": "Successful",
      "level": "Twelveth scientific grade"
    },
  ];

  TextEditingController phoneNumber = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      padding: const EdgeInsets.only(top: 10, left: 40, right: 40),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 4,
          crossAxisSpacing: 20.0,
          mainAxisSpacing: 20.0,
          childAspectRatio: 1.2),
      itemCount: l.length,
      itemBuilder: (context, index) {
        return HoverScaleCard(
          child: Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  border: Border.all(color: Colors.grey, width: 0.5),
                  color: Colors.white,
                  boxShadow: const [
                    BoxShadow(
                        color: Colors.black26,
                        offset: Offset(0, 2),
                        blurRadius: 1)
                  ]),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Text("${l[index]['name']}",
                            style: Get.theme.primaryTextTheme.bodyMedium!
                                .copyWith(
                                    fontSize: 20, fontWeight: FontWeight.bold)),
                      ),
                      Image.asset("../../images/Rectangle66.png",
                          height: 100, width: 100)
                    ],
                  ),
                  Text("${l[index]['result']}",
                      style: Get.theme.primaryTextTheme.bodySmall!.copyWith(
                          fontSize: 16,
                          color: l[index]['result'] == "Successful"
                              ? Color(0xff2F9742)
                              : l[index]['result'] == "Passing"
                                  ? Color(0xff972F2F)
                                  : Color(0xff134B70))),
                  Text("Grade Level: ${l[index]['level']}",
                      style: Get.theme.primaryTextTheme.bodySmall),
                  Padding(
                    padding: const EdgeInsets.only(top: 8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        TextButton(
                            style: ButtonStyle(
                                backgroundColor:
                                    WidgetStatePropertyAll(Colors.transparent),
                                shape: WidgetStatePropertyAll(
                                    RoundedRectangleBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(3)),
                                  side:
                                      BorderSide(color: Get.theme.primaryColor),
                                ))),
                            onPressed: () {},
                            child: Row(
                              children: [
                                Icon(
                                  VMS_Icons.vcard,
                                  size: 14,
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                      left: 5.0, right: 5.0),
                                  child: Text("First Season"),
                                ),
                              ],
                            )),
                        TextButton(
                            style: ButtonStyle(
                                backgroundColor:
                                    WidgetStatePropertyAll(Colors.transparent),
                                shape: WidgetStatePropertyAll(
                                    RoundedRectangleBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(3)),
                                  side:
                                      BorderSide(color: Get.theme.primaryColor),
                                ))),
                            onPressed: () {
                              Get.dialog(VMSAlertDialog(
                                  action: [
                                    ButtonDialog(
                                      width: 90,
                                      onPressed: () {},
                                      color: Get.theme.primaryColor,
                                      text: "Send",
                                    )
                                  ],
                                  contents: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      SizedBox(
                                        width: 350,
                                      ),
                                      DropDown(
                                        width: 350,
                                        title: "Penalty Name",
                                        options: ["s"],
                                      ),
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(top: 15.0),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text("The Reason",
                                                style: Get
                                                    .theme
                                                    .primaryTextTheme
                                                    .labelSmall),
                                            TextFieldDialog(
                                                width: 350,
                                                controller: phoneNumber,
                                                hinttext: "The Reason"),
                                          ],
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            top: 15.0, bottom: 15.0),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text("Start Date",
                                                style: Get
                                                    .theme
                                                    .primaryTextTheme
                                                    .labelSmall),
                                            DatePicker(
                                              width: 350,
                                              height: 40,
                                            )
                                          ],
                                        ),
                                      ),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          Text("End Date",
                                              style: Get.theme.primaryTextTheme
                                                  .labelSmall),
                                          DatePicker(
                                            width: 350,
                                            height: 40,
                                          )
                                        ],
                                      ),
                                    ],
                                  ),
                                  apptitle: "Punishing Student",
                                  subtitle: ""));
                            },
                            child: Row(
                              children: [
                                Icon(Icons.person_remove_outlined, size: 14),
                                Padding(
                                  padding: const EdgeInsets.only(
                                      left: 5.0, right: 5.0),
                                  child: Text("Punishing"),
                                ),
                              ],
                            )),
                      ],
                    ),
                  )
                ],
              )),
        );
      },
    );
  }
}
