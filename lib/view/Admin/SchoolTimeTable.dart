// ignore_for_file: must_be_immutable, file_names

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx/Icons_File/v_m_s__icons_icons.dart';
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
    double w = MediaQuery.of(context).size.width*0.9;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Container(
          alignment: Alignment.center,
          width: MediaQuery.of(context).size.width*0.9,
          child: Row(
            children: [
              DropDown(
                  title: "Class", width: Get.width/4, options: ['adfbfdb', 'gfngfb']),
              Padding(
                padding: const EdgeInsets.only(left: 10.0 , right: 10.0),
                child: DropDown(
                    title: "Division",
                    width: Get.width/4,
                    options: ['adssd', 'bngngfn']),
              ),
              Spacer(),
              Container(
                width: Get.width/4,
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(right: 10.0),
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
                               VMS_Icons.xl
                                ,
                                size: 18,
                                color:Get.theme.primaryColor
                            )),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 10.0),
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
                ),
              )
            ],
          ),
        ),
        Container(
          width: MediaQuery.of(context).size.width*0.8,
          child: Container(
            margin: const EdgeInsets.only(top: 20),
            width: w,
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
        ),
      ],
    );
  }
}
