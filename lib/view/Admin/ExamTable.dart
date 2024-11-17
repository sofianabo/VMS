// ignore_for_file: must_be_immutable, file_names

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx/Icons_File/v_m_s__icons_icons.dart';
import 'package:getx/Link/API/AdminAPI/GetAllClassAPI.dart';
import 'package:getx/Link/Controller/AdminController/AllClassesController.dart';
import 'package:getx/widgets/Admin_Table/DropDownTable.dart';
import 'package:getx/widgets/Calender.dart';
import 'package:getx/widgets/DropDown.dart';

class ExamTable extends StatelessWidget {
  ExamTable({super.key});

  List<String> tableData = [
    'Class',
    'Exam Name',
    'Curriculum Name',
    'Date',
    'Period',
    'Max Mark',
    'Passing Mark'
  ];

  @override
  Widget build(BuildContext context) {
    Getallclassapi(context).getAllClasses();
    return Padding(
      padding: const EdgeInsets.only(top: 38.0, right: 25.0, left: 25.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            width: Get.width * 0.9,
            child: Row(
              children: [
                DropDownTable(
                  title: "Type",
                    width: Get.width / 4,
                  type: 'type',
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                  child: DropDownTable(
                    type: 'class',
                    title: "Class",
                      width: Get.width / 4,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                  child: DropDownTable(
                    title: "Division",
                      width: Get.width / 4,
                    type: 'division',
                  ),
                ),
                Spacer(),
                Row(
                  children: [
                    Container(
                      width: 40,
                      height: 40,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(5),
                          boxShadow: const [
                            BoxShadow(
                                color: Colors.black12,
                                offset: Offset(0, 2),
                                blurRadius: 1)
                          ]),
                      child: IconButton(
                          style: ButtonStyle(
                              shape: WidgetStatePropertyAll(
                                  RoundedRectangleBorder(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(5))))),
                          onPressed: () {},
                          icon: Icon(VMS_Icons.xl,
                              size: 18, color: Get.theme.primaryColor)),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 10.0, left: 10.0),
                      child: Container(
                        width: 40,
                        height: 40,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(5),
                            boxShadow: const [
                              BoxShadow(
                                  color: Colors.black12,
                                  offset: Offset(0, 2),
                                  blurRadius: 1)
                            ]),
                        child: IconButton(
                            style: ButtonStyle(
                                shape: WidgetStatePropertyAll(
                                    RoundedRectangleBorder(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(5))))),
                            onPressed: () {},
                            icon: Icon(VMS_Icons.pdf,
                                size: 18, color: Get.theme.primaryColor)),
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
                width: Get.width * 0.9,
                margin: const EdgeInsets.only(top: 20),
                child: SingleChildScrollView(
                    child: GetBuilder<Allclassescontroller>(builder: (control) {
                  return DataTable(
                    headingRowColor:
                        const WidgetStatePropertyAll(Color(0xffd4dfe5)),
                    border: TableBorder.all(
                      color: Get.theme.primaryColor,
                      width: 1.0,
                    ),
                    columns: [
                      for (String key in tableData)
                        DataColumn(
                          label: Text(
                              textAlign: TextAlign.center,
                              key,
                              style: key == "Class"
                                  ? Get.theme.primaryTextTheme.labelMedium
                                  : Get.theme.primaryTextTheme.displayMedium),
                        ),
                    ],
                    rows: [
                      for (int i = 0; i < control.classes.length; i++)
                        DataRow(
                          cells: [
                            DataCell(
                              Text(
                                  textAlign: TextAlign.center,
                                  control.classes[i].enName!,
                                  style: Get.theme.primaryTextTheme.bodySmall),
                              onTap: () {},
                            ),
                            for (int j = 0; j < 6; j++)
                              DataCell(
                                Text(
                                    textAlign: TextAlign.center,
                                    "ss",
                                    style:
                                        Get.theme.primaryTextTheme.bodySmall),
                                onTap: () {},
                              ),
                          ],
                        ),
                    ],
                  );
                })),
              ),
            ],
          )
        ],
      ),
    );
  }
}
