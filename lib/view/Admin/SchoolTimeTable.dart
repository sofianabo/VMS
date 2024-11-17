// ignore_for_file: must_be_immutable, file_names

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx/Icons_File/v_m_s__icons_icons.dart';
import 'package:getx/widgets/Admin_Table/DropDownSchoolTime.dart';

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
    {
      'Day': 'Tuesday',
      'First\n Semester': 'Value 2',
      'second\n Semester': 'Value 3',
      'Third\n Semester': 'Value 4',
      'Forth\n Semester': 'Value 5',
      'Fifth\n Semester': 'Value 6',
      'Sixth\n Semester': 'Value 7',
      'Seventh\n Semester': 'Value 7',
    },
    {
      'Day': 'Wednesday',
      'First\n Semester': 'Value 2',
      'second\n Semester': 'Value 3',
      'Third\n Semester': 'Value 4',
      'Forth\n Semester': 'Value 5',
      'Fifth\n Semester': 'Value 6',
      'Sixth\n Semester': 'Value 7',
      'Seventh\n Semester': 'Value 7',
    },
    {
      'Day': 'Thursday',
      'First\n Semester': 'Value 2',
      'second\n Semester': 'Value 3',
      'Third\n Semester': 'Value 4',
      'Forth\n Semester': 'Value 5',
      'Fifth\n Semester': 'Value 6',
      'Sixth\n Semester': 'Value 7',
      'Seventh\n Semester': 'Value 7',
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
                DropDownSchoolTime(
                  type: "class",
                  title: "Class",
                  width: Get.width / 4,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 10.0 , right: 10.0),
                  child: DropDownSchoolTime(
                    type: "division",
                    title: "Division",
                      width: Get.width/4,
                  ),
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
          Container(
            margin: const EdgeInsets.only(top: 20),
            width: Get.width*0.9,
            child: SingleChildScrollView(
                child:   Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Table(
                      border: TableBorder.all(color: Get.theme.primaryColor),
                      children: [
                        TableRow(
                          children: [
                            Container(
                              height: 50,
                              alignment: Alignment.center,
                              color: Color(0xffD4DFE5),
                              child: Center(
                                child: Text(
                                  'Day',
                                  style: Get.theme.textTheme.titleLarge!.copyWith(
                                    color: Get.theme.primaryColor,
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                            ...tableData[0].keys
                                .where((key) => key != 'Day')
                                .map((key) => Container(
                              height: 50,
                              alignment: Alignment.center,
                              color: Color(0xffD4DFE5),
                              child: Center(
                                child: Text(
                                  textAlign: TextAlign.center,
                                  key,
                                  style: Get.theme.textTheme.titleLarge!.copyWith(
                                    fontSize: 14,
                                    color: Get.theme.primaryColor,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ))
                                .toList(),
                          ],
                        ),

                        for (var row in tableData)
                          TableRow(
                            children: [
                              Container(
                                alignment: Alignment.center,
                                height: 50,
                                color: Color(0xffD4DFE5),
                                child: Center(
                                  child: Text(
                                    row['Day'] ?? '',
                                    style:  Get.theme.textTheme.titleLarge!.copyWith(
                                      fontSize: 14,
                                      color: Get.theme.primaryColor,
                                      fontWeight: FontWeight.bold,
                                    )
                                  ),
                                ),
                              ),
                              ...row.entries
                                  .where((entry) => entry.key != 'Day')
                                  .map((entry) => Container(
                                alignment: Alignment.center,
                                height: 50,
                                    child: Text(
                                      textAlign: TextAlign.center,
                                      entry.value,
                                      style: TextStyle(color: Colors.black),
                                    ),
                                  ))
                                  .toList(),
                            ],
                          ),
                      ],
                    ),
                  ],
                )
                  ],
                )
            ),
          ),
        ],
      ),
    );
  }
}
