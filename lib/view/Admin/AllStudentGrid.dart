// ignore_for_file: must_be_immutable, file_names

import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx/Icons_File/v_m_s__icons_icons.dart';
import 'package:getx/view/Admin/EditStudentInfo.dart';
import 'package:getx/widgets/ButtonsDialog.dart';

class AllStudentGrid extends StatelessWidget {
  List<String> items = [
    'Item 1',
    'Item 2',
    'Item 3',
    'Item 4',
    'Item 5',
    'Item 6'
  ];

  AllStudentGrid({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      padding: const EdgeInsets.only(top: 10, left: 40, right: 40),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 4,
          crossAxisSpacing: 20.0,
          mainAxisSpacing: 20.0,
          childAspectRatio: 0.95),
      itemCount: items.length, // عدد العناصر في الشبكة
      itemBuilder: (context, index) {
        return Container(
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                border: Border.all(color: Colors.grey, width: 0.5),
                color: Colors.white,
                boxShadow: const [
                  BoxShadow(
                      color: Colors.black26, offset: Offset(0, 2), blurRadius: 1)
                ]),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Text("Laith Haitham Azzam",
                          style: Get.theme.primaryTextTheme.bodyMedium!.copyWith(
                            fontSize: 20,
                            fontWeight: FontWeight.bold
                          )),
                    ),
                    Image.asset("../../images/Rectangle66.png",
                        height: 100, width: 100)
                  ],
                ),
                Text("Mobile: 0936119623", style: Get.theme.primaryTextTheme.bodySmall),
                Text("Email: baraamarwan2005@gmail.com", style: Get.theme.primaryTextTheme.bodySmall),
                Text("Grade Level: Twelveth scientific grade",
                    style: Get.theme.primaryTextTheme.bodySmall),
                Padding(
                  padding: const EdgeInsets.only(top: 8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton(
                        style: ButtonStyle(
                          maximumSize:WidgetStatePropertyAll(Size(35,35)) ,
                          minimumSize: WidgetStatePropertyAll(Size(35,35)),
                          iconSize: WidgetStatePropertyAll(14),
                          shape: WidgetStatePropertyAll(RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5),
                          )),
                          backgroundColor: WidgetStatePropertyAll(Color(0xffB03D3D))
                        ),

                                              onPressed: () {
                      Get.dialog(
                          BackdropFilter(
                            filter: ImageFilter.blur(sigmaX: 2, sigmaY: 2),
                            child: AlertDialog(
                            shape: RoundedRectangleBorder(
                                                  borderRadius: BorderRadius.circular(5)),
                                              backgroundColor: Colors.white,
                                              surfaceTintColor: Colors.white,
                                                    title: Text(
                            "Delete Student",
                            style: Get.theme.primaryTextTheme.bodyLarge,
                                                    ),
                                                    content: SizedBox(
                              width: 400,
                              height: 40,
                              child: Text(
                                "Do you want to delete Laith Azzam",
                                style:
                                    Get.theme.primaryTextTheme.bodyMedium,
                              )),
                                                    actions: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                ButtonDialog(
                                  width: 100,
                                    text: "Delete",
                                    onPressed: () {},
                                    color: Colors.red),
                                const SizedBox(
                                  width: 10,
                                ),
                                ButtonDialog(
                                  width: 100,
                                    text: "Cancel",
                                    onPressed: () {
                                      Get.back();
                                    },
                                    color: Get.theme.colorScheme.primary)
                              ],
                            )
                                                    ],
                                                  ),
                          ));
                                              },
                                              icon: const Icon(
                       VMS_Icons.bin
                                              ),
                                              color: Colors.white,
                                            ),
                      IconButton(
                        style: ButtonStyle(
                            maximumSize:WidgetStatePropertyAll(Size(35,35)) ,
                            minimumSize: WidgetStatePropertyAll(Size(35,35)),
                            iconSize: WidgetStatePropertyAll(14),
                            shape: WidgetStatePropertyAll(RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5),
                            )),
                            backgroundColor: WidgetStatePropertyAll(Get.theme.primaryColor)
                        ),
                                              onPressed: () {},
                                              icon: const Icon(
                        VMS_Icons.vir
                                              ),
                                              color: Colors.white,
                                            ),
                      IconButton(
                        style: ButtonStyle(
                            maximumSize:WidgetStatePropertyAll(Size(35,35)) ,
                            minimumSize: WidgetStatePropertyAll(Size(35,35)),
                            iconSize: WidgetStatePropertyAll(14),
                            shape: WidgetStatePropertyAll(RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5),
                            )),
                            backgroundColor: WidgetStatePropertyAll(Get.theme.primaryColor)
                        ),
                                              onPressed: () {},
                                              icon: const Icon(
                        VMS_Icons.dose
                                              ),
                                              color: Colors.white,
                                            ),
                      IconButton(
                        style: ButtonStyle(
                            maximumSize:WidgetStatePropertyAll(Size(35,35)) ,
                            minimumSize: WidgetStatePropertyAll(Size(35,35)),
                            iconSize: WidgetStatePropertyAll(14),
                            shape: WidgetStatePropertyAll(RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5),
                            )),
                            backgroundColor: WidgetStatePropertyAll(Get.theme.primaryColor)
                        ),
                                              onPressed: () {
                      EditStudentDialog();
                                              },
                                              icon: const Icon(
                        VMS_Icons.vcard
                                              ),
                                              color: Colors.white,
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
