import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vms_school/Link/Controller/AdminController/Students_Controllers/Jalaa_For_Students/Jalaa_Controller.dart';
import 'package:vms_school/view/SMS_Platform/Admin/Students_Manager/Export_Jalaa_Pages/First_Table/First_Table_Widgets.dart';


class FinalTableTaqderat extends StatelessWidget {
  const FinalTableTaqderat({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<Jalaa_Controller>(builder: (controller) {
      return Column(
        children: [
          Table(
            border: TableBorder(
              right: BorderSide(width: 2),
              left:  BorderSide(width: 2),
              bottom:  BorderSide(width: 2),
              top:  BorderSide(width: 2),
            ),
            defaultVerticalAlignment: TableCellVerticalAlignment.middle,
            columnWidths: {
              0: FixedColumnWidth(110), // المواد الدراسية
              1: FixedColumnWidth(285), // الدرجة العظمى
            },
            children: [
              TableRow(
                children: [
                  Container(
                      height: 120,
                      decoration: BoxDecoration(
                          border: Border(
                              left: BorderSide(color: Colors.black , width: 1)
                          )
                      ),
                      child: dawams('النتيجة النهائية' , isdarage: true)),
                  Container(
                    decoration: BoxDecoration(
                        border: Border(
                          right: BorderSide(color: Colors.black , width: 1),
                        )
                    ),
                    child: Column(
                      children: [
                        buildSplitText(data:[
                          {
                            "text": "نجاح الى الصف",
                            "width": 80,
                          },
                          {
                            "text": "",
                            "width": 59,
                          },
                        ]),
                        buildSplitText(data:[
                          {
                            "text": "نقل الى الصف",
                            "width": 80,
                          },
                          {
                            "text": "",
                            "width": 100,
                          },

                          {
                            "text": "لأنه",
                            "width": 59,
                          },
                        ]),
                        buildSplitText(data:[
                          {
                            "text": "رسوب في الصف",
                            "width": 80,
                          },
                          {
                            "text": "",
                            "width": 59,
                          },
                        ]),

                      ],
                    ),
                  ),
                ],
              ),

            ],
          ),
          Table(
            border: TableBorder(
              right: BorderSide(width: 2),
              left:  BorderSide(width: 2),

              bottom:  BorderSide(width: 2),
            ),
            defaultVerticalAlignment: TableCellVerticalAlignment.middle,
            columnWidths: {
              0: FixedColumnWidth(110), // المواد الدراسية
              1: FixedColumnWidth(285), // الدرجة العظمى
            },
            children: [
              TableRow(
                children: [
                  Container(
                      decoration: BoxDecoration(
                          border: Border(
                              left: BorderSide(color: Colors.black , width: 1)
                          )
                      ),
                      child: dawams('ترتيب النجاح' , isdarage: true)),
                  Container(
                    decoration: BoxDecoration(
                        border: Border(
                            right: BorderSide(color: Colors.black , width: 1)
                        )
                    ),
                    child: dawams(""),
                  ),
                ],
              ),

            ],
          ),
          Table(
            border: TableBorder(
              right: BorderSide(width: 2),
              left:  BorderSide(width: 2),

              bottom:  BorderSide(width: 2),
            ),
            defaultVerticalAlignment: TableCellVerticalAlignment.middle,
            columnWidths: {
              0: FixedColumnWidth(110), // المواد الدراسية
              1: FixedColumnWidth(285 ), // الدرجة العظمى
            },
            children: [
              TableRow(
                children: [
                  Container(
                      decoration: BoxDecoration(
                          border: Border(
                              left: BorderSide(color: Colors.black , width: 1)
                          )
                      ),
                      child: dawams('اسم الموجه و توقيعه' , isdarage: true)),
                  Container(
                    decoration: BoxDecoration(
                        border: Border(
                            right: BorderSide(color: Colors.black , width: 1)
                        )
                    ),
                    child: dawams(""),
                  ),
                ],
              ),

            ],
          ),
        ],
      );
    });
  }
}
