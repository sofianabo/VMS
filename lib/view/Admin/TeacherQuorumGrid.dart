// ignore_for_file: must_be_immutable, file_names

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx/widgets/ButtonsDialog.dart';
import 'package:getx/widgets/DropDown.dart';

class TeacherQuorumGrid extends StatelessWidget {
  List<String> items = [
    'Item 1',
    'Item 2',
    'Item 3',
    'Item 4',
    'Item 5',
    'Item 6'
  ];

  List<Map<String, String>> tableData = [
    {
      'Date': 'Value 1',
      'Report': 'Value 2',
    },
    {
      'Date': 'Value 1',
      'Report': 'Value 2',
    },
  ];

  TextEditingController reason = TextEditingController();

  TeacherQuorumGrid({super.key});

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
        return GestureDetector(
          onTap: () {
            Get.dialog(AlertDialog(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5)),
              backgroundColor: Colors.white,
              surfaceTintColor: Colors.white,
              title: Text(
                "Link Teacher to Curriculum",
                style: Get.theme.primaryTextTheme.bodyLarge,
              ),
              content: SizedBox(
                  width: 600,
                  height: 120,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 15.0, right: 15),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            DropDown(
                              title: "Class",
                              width: 250,
                              options: [],
                            ),
                            DropDown(
                              title: "Curriculum",
                              width: 250,
                              options: [],
                            ),
                          ],
                        ),
                      ],
                    ),
                  )),
              actions: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    ButtonDialog(
                        text: "Save",
                        onPressed: () {},
                        color: Get.theme.colorScheme.primary)
                  ],
                )
              ],
            ));
          },
          child: Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  border: Border.all(color: Colors.grey, width: 2),
                  color: Colors.white,
                  boxShadow: const [
                    BoxShadow(
                        color: Colors.grey,
                        offset: Offset(0, 10),
                        blurRadius: 10)
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
                    "present",
                    style: Get.theme.primaryTextTheme.displaySmall,
                  ),
                ],
              )),
        );
      },
    );
  }
}
