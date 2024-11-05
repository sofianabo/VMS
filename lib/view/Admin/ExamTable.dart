// ignore_for_file: must_be_immutable, file_names

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx/widgets/Calender.dart';
import 'package:getx/widgets/DropDown.dart';

class ExamTable extends StatelessWidget {
  ExamTable({super.key});
  List<Map<String, String>> tableData = [
    {
      'Class': 'Value 1',
      'Exam Name': 'Value 2',
      'Curriculum Name': 'Value 3',
      'Date': 'Value 4',
      'Period': 'Value 5',
      'Max Mark': 'Value 6',
      'Passing Mark': 'Value 7',
    },
    {
      'Class': 'Value 1',
      'Exam Name': 'Value 2',
      'Curriculum Name': 'Value 3',
      'Date': 'Value 4',
      'Period': 'Value 5',
      'Max Mark': 'Value 6',
      'Passing Mark': 'Value 7',
    },
    // يمكنك إضافة المزيد من الصفوف هنا
  ];
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
                DropDown(title: "Type", width: 200, options: ['advv', 'bnhn']),
                DatePicker(),
                DropDown(
                    title: "Class", width: 200, options: ['adsds', 'bhgnhn']),
                DropDown(
                    title: "Curriculum Name",
                    width: 200,
                    options: ['dsva', 'gfnb']),
              ],
            ),
            Container(
              margin: const EdgeInsets.only(right: 20, left: 20, top: 20),
              width: MediaQuery.of(context).size.width * 6,
              height: MediaQuery.of(context).size.height * 0.63,
              child: Container(
                margin: const EdgeInsets.only(top: 20, left: 40),
                width: Get.width,
                child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: DataTable(
                      border: TableBorder.all(
                        color: Get.theme.primaryColor,
                        width: 1.0,
                      ),
                      columns: [
                        for (String key in tableData.first.keys)
                          DataColumn(
                            label: Text(key,
                                style: Get.theme.primaryTextTheme.bodyMedium),
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
                                  onTap: () {},
                                ),
                            ],
                          ),
                      ],
                    )),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
