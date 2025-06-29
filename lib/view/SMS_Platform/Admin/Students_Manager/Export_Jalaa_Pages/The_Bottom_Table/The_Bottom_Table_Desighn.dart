import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vms_school/Link/Controller/AdminController/Students_Controllers/Jalaa_For_Students/Jalaa_Controller.dart';
import 'package:vms_school/view/SMS_Platform/Admin/Students_Manager/Export_Jalaa_Pages/Convert_Functions_For_All.dart';
import 'package:vms_school/view/SMS_Platform/Admin/Students_Manager/Export_Jalaa_Pages/The_Bottom_Table/The_Bottom_Table_Widgets.dart';

class The_Bottom_Table_Design extends StatelessWidget {
  const The_Bottom_Table_Design({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<Jalaa_Controller>(builder: (controller) {
      return Table(
        columnWidths: {
          0: FixedColumnWidth(158), // المواد الدراسية
          1: FixedColumnWidth(642), // الدرجة العظمى
          2: FixedColumnWidth(60), // الدرجة العظمى
          3: FixedColumnWidth(555), // الدرجة العظمى
        },
        children: [
          // Main Table Header
          TableRow(
            children: [
              Column(
                children: [
                  BottombuildCell('ملاحظات مدير المدرسة',
                      isRight: true, isBold: true),
                  BottombuildCell('ملاحظات ولي التلميذ',
                      isRight: true, isBold: true),
                ],
              ),
              Column(
                children: [
                  BottombuildCell(
                      fontsize: 12,
                      "${controller.rebortCard!.rebort!.molahdat!.manager ?? " "}",
                      isRight: true),
                  BottombuildCell(fontsize: 12, " ", isRight: true),
                ],
              ),
              Container(
                height: 120,
                decoration: BoxDecoration(
                    border: Border(
                  bottom: BorderSide(color: Colors.black, width: 2),
                  left: BorderSide(color: Colors.black, width: 2),
                  right: BorderSide(color: Colors.black, width: 2),
                )),
              ),
              Container(
                alignment: Alignment.center,
                height: 120,
                decoration: BoxDecoration(
                    border: Border(
                  bottom: BorderSide(color: Colors.black, width: 2),
                  left: BorderSide(color: Colors.black, width: 2),
                )),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text(
                          "اسم المدير: ${controller.rebortCard!.rebort!.molahdat!.schoolmanager ?? ""}",
                          style: TextStyle(
                              fontFamily: "tnr",
                              fontSize: 16,
                              fontWeight: FontWeight.bold),
                        ),
                        Text(
                          "التوقيع",
                          style: TextStyle(
                              fontSize: 14,
                              fontFamily: "tnr",
                              fontWeight: FontWeight.bold),
                        ),
                        Text(
                          "الخنم",
                          style: TextStyle(
                              fontSize: 14,
                              fontFamily: "tnr",
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 10.0),
                      child: Text(
                        convertToArabicNumbers("التاريخ: 13/1/2003"),
                        style: TextStyle(
                            fontSize: 14,
                            fontFamily: "tnr",
                            fontWeight: FontWeight.bold),
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ],
      );
    });
  }
}
