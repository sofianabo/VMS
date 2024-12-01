import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vms_school/widgets/GridAnimation.dart';
import 'package:vms_school/widgets/VMSAlertDialog.dart';

class StudentStatusGrid extends StatelessWidget {
  List<Map<String, dynamic>> l = [
    {
      "name": "Laith Haitham Azzam",
      "status": "Present",
      "level": "Twelveth scientific grade"
    },
    {
      "name": "Laith Haitham Azzam",
      "status": "Truant",
      "level": "Twelveth scientific grade"
    },
    {
      "name": "Laith Haitham Azzam",
      "status": "Late",
      "level": "Twelveth scientific grade"
    },
    {
      "name": "Laith Haitham Azzam",
      "status": "Holiday",
      "level": "Twelveth scientific grade"
    },
    {
      "name": "Laith Haitham Azzam",
      "status": "Late",
      "level": "Twelveth scientific grade"
    },
    {
      "name": "Laith Haitham Azzam",
      "status": "Holiday",
      "level": "Twelveth scientific grade"
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

  TextEditingController reason = TextEditingController();

  StudentStatusGrid({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      padding: const EdgeInsets.only(top: 10, left: 40, right: 40),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 4,
          crossAxisSpacing: 20.0,
          mainAxisSpacing: 20.0,
          childAspectRatio: 1.5),
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
                                        Get.theme.primaryTextTheme.bodyMedium,
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
                  apptitle: "${l[index]['status']} Student Laith Haitham Azzam",
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
                              style: Get.theme.primaryTextTheme.bodyMedium!
                                  .copyWith(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold)),
                        ),
                        Image.asset("../../images/Rectangle66.png",
                            height: 100, width: 100)
                      ],
                    ),
                    Text("${l[index]['status']}",
                        style: Get.theme.primaryTextTheme.bodySmall!.copyWith(
                            fontSize: 16,
                            color: l[index]['status'] == "Present"
                                ? Color(0xff2F9742)
                                : l[index]['status'] == "Truant"
                                    ? Color(0xff972F2F)
                                    : l[index]['status'] == "Late"
                                        ? Color(0xff349393)
                                        : Color(0xff134B70))),
                    Text("Grade Level: ${l[index]['level']}",
                        style: Get.theme.primaryTextTheme.bodySmall),
                  ],
                )),
          ),
        );
      },
    );
  }
}
