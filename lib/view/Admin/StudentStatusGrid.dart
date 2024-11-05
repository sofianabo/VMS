// ignore_for_file: must_be_immutable, file_names

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class StudentStatusGrid extends StatelessWidget {
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

  StudentStatusGrid({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      padding:const EdgeInsets.only(top: 20, left: 40, right: 40),
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
              content: SizedBox(
                width: 600,
                height: Get.height,
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Student Status",
                          style: Get.theme.primaryTextTheme.bodyLarge,
                        ),
                        Row(
                          children: [
                            IconButton(
                                onPressed: () {},
                                icon:const Icon(Icons.picture_as_pdf)),
                            IconButton(
                                onPressed: () {},
                                icon:const Icon(Icons.picture_as_pdf))
                          ],
                        ),
                      ],
                    ),
                    SizedBox(
                      width: Get.width,
                      child: SingleChildScrollView(
                          child: DataTable(
                        border: TableBorder.all(
                          color: Get.theme.primaryColor,
                          width: 1.0,
                        ),
                        columns: [
                          for (String key in tableData.first.keys)
                            DataColumn(
                              label: Text(
                                key,
                                style: Get.theme.primaryTextTheme.bodyMedium,
                              ),
                            ),
                        ],
                        rows: [
                          for (Map<String, String> row in tableData)
                            DataRow(
                              cells: [
                                for (String value in row.values)
                                  DataCell(
                                    Text(
                                      value,
                                      style:
                                          Get.theme.primaryTextTheme.bodySmall,
                                    ),
                                  ),
                              ],
                            ),
                        ],
                      )),
                    ),
                  ],
                ),
              ),
            ));
          },
          child: Container(
              padding:const EdgeInsets.all(20),
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
                        style: Get.theme.primaryTextTheme.bodySmall,
                      ),
                      Image.asset("../../images/Home-Background2.png",
                          height: 70, width: 70)
                    ],
                  ),
                  Text(
                    "present",
                    style: Get.theme.primaryTextTheme.displaySmall,
                  ),
                  Text(
                    "Grade Level:",
                    style: Get.theme.primaryTextTheme.bodySmall,
                  ),
                ],
              )),
        );
      },
    );
  }
}
