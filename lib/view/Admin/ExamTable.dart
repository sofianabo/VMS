// ignore_for_file: must_be_immutable, file_names

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx/Icons_File/v_m_s__icons_icons.dart';
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
  ];
  @override
  Widget build(BuildContext context) {

    return Padding(
      padding: const EdgeInsets.only(top: 38.0 , right: 25.0 , left: 25.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            width: Get.width*0.9,
            child: Row(
              children: [
                DropDown(
                    title: "Type", width: Get.width/4, options: ['adfbfdb', 'gfngfb']),
                Padding(
                  padding: const EdgeInsets.only(left: 10.0 , right: 10.0),
                  child: DropDown(
                      title: "Class",
                      width: Get.width/4,
                      options: ['adssd', 'bngngfn']),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 10.0 , right: 10.0),
                  child: DropDown(
                      title: "Division",
                      width: Get.width/4,
                      options: ['adssd', 'bngngfn']),
                ),
                Spacer(),
                Row(
                  children: [
                    Container(
                      width: 40,
                      height: 40,
                      decoration: BoxDecoration(
                          color:  Colors.white,
                          borderRadius: BorderRadius.circular(5),
                          boxShadow: const [
                            BoxShadow(
                                color: Colors.black12,
                                offset:  Offset(0, 2),
                                blurRadius: 1)
                          ]),
                      child: IconButton(
                          style: ButtonStyle(
                              shape: WidgetStatePropertyAll(RoundedRectangleBorder(
                                  borderRadius: BorderRadius.all(Radius.circular(5))
                              ))
                          ),
                          onPressed: () {},
                          icon:  Icon(
                              VMS_Icons.xl
                              ,
                              size: 18,
                              color:Get.theme.primaryColor
                          )),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 10.0,left: 10.0),
                      child: Container(
                        width: 40,
                        height: 40,
                        decoration: BoxDecoration(
                            color:  Colors.white,
                            borderRadius: BorderRadius.circular(5),
                            boxShadow: const [
                              BoxShadow(
                                  color: Colors.black12,
                                  offset:  Offset(0, 2),
                                  blurRadius: 1)
                            ]),
                        child: IconButton(
                            style: ButtonStyle(

                                shape: WidgetStatePropertyAll(RoundedRectangleBorder(
                                    borderRadius: BorderRadius.all(Radius.circular(5))
                                ))
                            ),
                            onPressed: () {},
                            icon:  Icon(
                                VMS_Icons.pdf
                                ,
                                size: 18,
                                color:Get.theme.primaryColor
                            )),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
          Column(
            children: [
              Container(
                width: Get.width*0.9,
                margin: const EdgeInsets.only(top: 20),
                child: SingleChildScrollView(
                    child: DataTable(
                      headingRowColor:
                      const WidgetStatePropertyAll(Color(0xffd4dfe5)),
                      border: TableBorder.all(
                        color: Get.theme.primaryColor,
                        width: 1.0,
                      ),
                      columns: [
                        for (String key in tableData.first.keys)
                          DataColumn(
                            label: Text(
                                textAlign: TextAlign.center,
                                key,
                                style: key == "Class"
                                    ? Get.theme.primaryTextTheme.labelMedium
                                    : Get.theme.primaryTextTheme.displayMedium ),
                          ),
                      ],
                      rows: [
                        for (Map<String, String> row in tableData)
                          DataRow(
                            cells: [
                              for (String value in row.values)
                                DataCell(
                                  Text(
                                      textAlign: TextAlign.center,
                                      value,
                                      style: Get.theme.primaryTextTheme.bodySmall),
                                  onTap: () {},
                                ),
                            ],
                          ),
                      ],
                    )),
              ),
            ],
          )

        ],
      ),
    );
  }
}