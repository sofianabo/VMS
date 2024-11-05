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
      padding: const EdgeInsets.only(top: 20, left: 40, right: 40),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          crossAxisSpacing: 20.0,
          mainAxisSpacing: 20.0,
          childAspectRatio: 1.1),
      itemCount: items.length, // عدد العناصر في الشبكة
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
                  "Full Time",
                  style: Get.theme.primaryTextTheme.displaySmall,
                ),
                Text(
                  "Male",
                  style: Get.theme.primaryTextTheme.displayMedium,
                ),
                Text(
                  "Mobile:",
                  style: Get.theme.primaryTextTheme.bodySmall,
                ),
                Text(
                  "E-mail:",
                  style: Get.theme.primaryTextTheme.bodySmall,
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            color: Colors.red[700]),
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
                                   ButtonDialog(text: "Delete", onPressed: (){}, color: Colors.red),
                                    const SizedBox(
                                      width: 10,
                                    ),
                                   ButtonDialog(text: "Cancel", onPressed: (){}, color: Get.theme.colorScheme.primary),
                                  ],
                                )
                              ],
                            ));
                          },
                          icon: const Icon(Icons.delete),
                          color: Colors.white,
                        )),
                      ),
                      Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            color: const Color(0xff19478d)),
                        child: Center(
                            child: IconButton(
                          onPressed: () {},
                          icon: const Icon(Icons.heart_broken),
                          color: Colors.white,
                        )),
                      ),
                      Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            color: const Color(0xff19478d)),
                        child: Center(
                            child: IconButton(
                          onPressed: () {},
                          icon: const Icon(Icons.personal_injury_rounded),
                          color: Colors.white,
                        )),
                      ),
                      Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            color: const Color(0xff19478d)),
                        child: Center(
                            child: IconButton(
                          onPressed: () {
                            EditTeacherDialog();
                          },
                          icon: const Icon(Icons.edit),
                          color: Colors.white,
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
