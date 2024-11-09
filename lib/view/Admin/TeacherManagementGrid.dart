// ignore_for_file: must_be_immutable, file_names

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx/view/Admin/EditTeacherInfo.dart';
import 'package:getx/widgets/ButtonsDialog.dart';

class TeacherManagementGrid extends StatelessWidget {
  List<String> items = [
    'Item 1',
    'Item 2',
    'Item 3',
    'Item 4',
    'Item 5',
    'Item 6'
  ];

  TeacherManagementGrid({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          crossAxisSpacing: 20.0,
          mainAxisSpacing: 20.0,
          childAspectRatio: 4 / 3.5),
      itemCount: items.length, // عدد العناصر في الشبكة
      itemBuilder: (context, index) {
        return Container(
            padding:
                const EdgeInsets.only(top: 10, left: 15, right: 15, bottom: 10),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                border: Border.all(color: Colors.grey, width: 0.5),
                color: Colors.white,
                boxShadow: const [
                  BoxShadow(
                      color: Colors.grey, offset: Offset(0, 3), blurRadius: 3)
                ]),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          color: const Color(0xffb03d3d)),
                      child: Center(
                          child: IconButton(
                        onPressed: () {
                          Get.dialog(AlertDialog(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(5)),
                            backgroundColor: Colors.white,
                            surfaceTintColor: Colors.white,
                            title: Text(
                              "Delete Teacher",
                              style: Get.theme.primaryTextTheme.bodyLarge,
                            ),
                            content: SizedBox(
                                width: 400,
                                height: 40,
                                child: Text(
                                  "Do you want to delete Laith Azzam",
                                  style: Get.theme.primaryTextTheme.bodySmall,
                                )),
                            actions: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  ButtonDialog(
                                      text: "Delete",
                                      width: 100,
                                      onPressed: () {},
                                      color: Color(0xffb03d3d)),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  ButtonDialog(
                                      width: 100,
                                      text: "Cancel",
                                      onPressed: () {},
                                      color: Get.theme.colorScheme.primary),
                                ],
                              )
                            ],
                          ));
                        },
                        icon: const Icon(
                          Icons.delete,
                          size: 30,
                        ),
                        color: Colors.white,
                      )),
                    ),
                    Image.asset("../../images/Rectangle66.png",
                        height: 90, width: 90),
                    Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          color: const Color(0xff19478d)),
                      child: Center(
                          child: IconButton(
                        onPressed: () {
                          EditTeacherDialog();
                        },
                        icon: const Icon(
                          Icons.edit,
                          size: 30,
                        ),
                        color: Colors.white,
                      )),
                    ),
                  ],
                ),
                Text(
                  "Laith Haitham Azzam",
                  style: Get.theme.primaryTextTheme.bodyMedium,
                ),
                Text(
                  "Full Time",
                  style: Get.theme.primaryTextTheme.displaySmall,
                ),
                Text(
                  "Male",
                  style: Get.theme.primaryTextTheme.displayMedium,
                ),
                Text(
                  "Mobile: 0932477659",
                  style: Get.theme.primaryTextTheme.bodySmall,
                ),
                Text(
                  "E-mail:LaithAzzam@gmail.com",
                  style: Get.theme.primaryTextTheme.bodySmall,
                ),
              ],
            ));
      },
    );
  }
}
