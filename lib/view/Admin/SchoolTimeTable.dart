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
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;
    return Container(
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
                    title: "Class", width: 280, options: ['adfbfdb', 'gfngfb']),
                DropDown(
                    title: "Division",
                    width: 280,
                    options: ['adssd', 'bngngfn']),
                IconButton(onPressed: () {}, icon: Icon(Icons.picture_as_pdf)),
                IconButton(onPressed: () {}, icon: Icon(Icons.picture_as_pdf))
              ],
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height * 0.63,
              child: Container(
                margin: const EdgeInsets.only(top: 20),
                width: w,
                child: SingleChildScrollView(
                    child: DataTable(
                  dataRowColor: const WidgetStatePropertyAll(
                      Color.fromARGB(255, 235, 224, 223)),
                  headingRowColor:
                      const WidgetStatePropertyAll(Color(0xffd4dfe5)),
                  border: TableBorder.all(
                    color: Get.theme.primaryColor,
                    width: 1.0,
                  ),
                  columns: [
                    for (String key in tableData.first.keys)
                      DataColumn(
                        label: Text(key,
                            style: key == "Day"
                                ? Get.theme.primaryTextTheme.labelMedium
                                : Get.theme.primaryTextTheme.displayMedium),
                      ),
                  ],
                  rows: [
                    for (Map<String, String> row in tableData)
                      DataRow(
                        // color: WidgetStatePropertyAll(
                        //   row['Class'] == 'Value 1' ? Colors.blue : Colors.red,
                        // ),
                        cells: [
                          for (String value in row.values)
                            DataCell(
                              Text(value,
                                  style: Get.theme.primaryTextTheme.bodySmall),
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
