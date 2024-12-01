// ignore_for_file: must_be_immutable, file_names

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../widgets/GridAnimation.dart';
import '../../../widgets/VMSAlertDialog.dart';

class EmpolyeeStatusGrid extends StatelessWidget {
  List<Map<String, dynamic>> l = [
    {"name": "Laith Haitham Azzam", "status": "Present", "jopTitle": "Manager"},
    {
      "name": "Laith Haitham Azzam",
      "status": "Truant",
      "jopTitle": "Technical Support Manager"
    },
    {
      "name": "Laith Haitham Azzam",
      "status": "Late",
      "jopTitle": "Registration"
    },
    {
      "name": "Laith Haitham Azzam",
      "status": "Holiday",
      "jopTitle": "Secretariat"
    },
    {
      "name": "Laith Haitham Azzam",
      "status": "Vacation",
      "jopTitle": "Secretary"
    },
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

  TextEditingController serch = TextEditingController();

  EmpolyeeStatusGrid({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      padding: const EdgeInsets.only(top: 10, left: 40, right: 40),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 4,
          crossAxisSpacing: 20.0,
          mainAxisSpacing: 20.0,
          childAspectRatio: 1.4),
      itemCount: l.length, // عدد العناصر في الشبكة
      itemBuilder: (context, index) {
        return HoverScaleCard(
          child: GestureDetector(
            onTap: () {
              Get.dialog(VMSAlertDialog(
                  action: [Text("")],
                  contents: SizedBox(
                    width: 600,
                    height: Get.height,
                    child: Column(
                      children: [
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
                                    style:
                                    Get.theme.textTheme.bodyMedium!,
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
                                          style: Get
                                              .theme.primaryTextTheme.bodySmall,
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
                  apptitle: "${l[index]['status']} Teacher Laith Haitham Azzam",
                  subtitle: "none"));
            },
            child: Container(
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    border: Border.all(color: Colors.grey, width: 0.5),
                    color: Colors.white,
                    boxShadow: const [
                      BoxShadow(
                          color: Colors.black26,
                          offset: Offset(0, 2),
                          blurRadius: 1)
                    ]),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: Text("${l[index]['name']}",
                              style: Get.theme.textTheme.bodyMedium!
                                  .copyWith(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold)),
                        ),
                        Image.asset("../../images/Rectangle66.png",
                            height: 100, width: 100)
                      ],
                    ),
                    Text("${l[index]['status']}",
                        style: Get.theme.textTheme.bodyMedium!.copyWith(
                            fontSize: 16,
                            color: l[index]['status'] == "Present"
                                ? Color(0xff2F9742)
                                : l[index]['status'] == "Truant"
                                    ? Color(0xff972F2F)
                                    : l[index]['status'] == "Vacation"
                                        ? Color(0xffB27671)
                                        : l[index]['status'] == "Late"
                                            ? Color(0xff349393)
                                            : Color(0xff134B70))),
                    Text("${l[index]['jopTitle']}",
                        style: Get.theme.textTheme.bodyMedium!),
                  ],
                )),
          ),
        );
      },
    );
  }
}
