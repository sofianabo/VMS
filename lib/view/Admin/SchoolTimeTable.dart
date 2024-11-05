// ignore_for_file: must_be_immutable, file_names

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx/widgets/DropDown.dart';

class SchoolTimeTable extends StatelessWidget {
  SchoolTimeTable({super.key});
  List<Map<String, String>> tableData = [
    {
      'Day': 'Sunday',
      'First\n Semester': 'Value 2',
      'second\n Semester': 'Value 3',
      'Third\n Semester': 'Value 4',
      'Forth\n Semester': 'Value 5',
      'Fifth\n Semester': 'Value 6',
      'Sixth\n Semester': 'Value 7',
      'Seventh\n Semester': 'Value 7',
    },
    {
      'Day': 'Monday',
      'First\n Semester': 'Value 2',
      'second\n Semester': 'Value 3',
      'Third\n Semester': 'Value 4',
      'Forth\n Semester': 'Value 5',
      'Fifth\n Semester': 'Value 6',
      'Sixth\n Semester': 'Value 7',
      'Seventh\n Semester': 'Value 7',
    },
    // يمكنك إضافة المزيد من الصفوف هنا
  ];
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        margin: const EdgeInsets.only(right: 100),
        width: MediaQuery.of(context).size.width * 0.8,
        child: Container(
          margin: const EdgeInsets.only(top: 10),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  DropDown(
                      title: "Class",
                      width: 280,
                      options: ['adfbfdb', 'gfngfb']),
                  DropDown(
                      title: "Division",
                      width: 280,
                      options: ['adssd', 'bngngfn']),
                  IconButton(
                      onPressed: () {}, icon: Icon(Icons.picture_as_pdf)),
                  IconButton(onPressed: () {}, icon: Icon(Icons.picture_as_pdf))
                ],
              ),
              Container(
                margin: const EdgeInsets.only(right: 20, left: 20, top: 20),
                width: MediaQuery.of(context).size.width * 6,
                height: MediaQuery.of(context).size.height * 0.63,
                decoration: const BoxDecoration(),
                child: Container(
                  margin: const EdgeInsets.only(top: 20, left: 40),
                  child: DataTable(
                    border: TableBorder.all(
                      color: Get.theme.primaryColor,
                      width: 1.0,
                    ),
                    columns: [
                      for (String key in tableData.first.keys)
                        DataColumn(
                          label: Text(key,
                              textAlign: TextAlign.center,
                              style: key == "Day"
                                  ? Get.theme.primaryTextTheme.bodyLarge
                                  : Get.theme.primaryTextTheme.bodySmall),
                        ),
                    ],
                    rows: [
                      for (Map<String, String> row in tableData)
                        DataRow(
                          cells: [
                            for (String value in row.values)
                              DataCell(
                                Text(value,
                                    style:
                                        Get.theme.primaryTextTheme.bodySmall),
                                onTap: () {
                                  // إضافة منطق النقر على الخلية هنا
                                },
                              ),
                          ],
                        ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
