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
      padding: const EdgeInsets.only(top: 20),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          crossAxisSpacing: 20.0,
          mainAxisSpacing: 20.0,
          childAspectRatio: 2.1),
      itemCount: items.length,
      itemBuilder: (context, index) {
        return GestureDetector(
          onTap: () {
            Get.dialog(AlertDialog(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5)),
              backgroundColor: Colors.white,
              surfaceTintColor: Colors.white,
              title: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Link Teacher to Curriculum",
                    style: Get.theme.primaryTextTheme.bodyLarge,
                  ),
                  IconButton(
                      onPressed: () {}, icon: Icon(Icons.highlight_remove))
                ],
              ),
              content: SizedBox(
                  width: 565,
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
                              width: 235,
                              options: [],
                            ),
                            DropDown(
                              title: "Curriculum",
                              width: 243,
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
                        width: 100,
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
                  border: Border.all(color: Colors.grey, width: 0.5),
                  color: Colors.white,
                  boxShadow: const [
                    BoxShadow(
                        color: Colors.grey, offset: Offset(0, 3), blurRadius: 3)
                  ]),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Text(
                            "Laith Haitham \n Azzam",
                            style: Get.theme.primaryTextTheme.bodyMedium,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 15.0),
                            child: Text(
                              "present",
                              style: Get.theme.primaryTextTheme.displaySmall,
                            ),
                          ),
                        ],
                      ),
                      Image.asset("../../images/Home-Background2.png",
                          height: 97, width: 97)
                    ],
                  ),
                  Text(
                    "Email: LaithAzzam@gmail.com",
                    style: Get.theme.primaryTextTheme.bodySmall,
                  ),
                ],
              )),
        );
      },
    );
  }
}
