import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vms_school/Link/Controller/AdminController/Students_Controllers/Jalaa_For_Students/Jalaa_Controller.dart';
import 'package:vms_school/view/SMS_Platform/Admin/Students_Manager/Export_Jalaa_Pages/First_Table/First_Table_Widgets.dart';



class Tawjihat_Table extends StatelessWidget {
  bool isTaqderat;
   Tawjihat_Table({super.key , required this.isTaqderat});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<Jalaa_Controller>(builder: (controller) {

      return Column(
        children: [
          Table(
            border: TableBorder.all(width: 2),
            defaultVerticalAlignment: TableCellVerticalAlignment.middle,
            columnWidths: {
              0: FixedColumnWidth(isTaqderat ? 285 :265), // المواد الدراسية
            },
            children: [
              TableRow(
                children: [
                  isTaqderat == true?

                  dawams('التوجيهات التربوية للمدرسة' , isdarage: true):
                  dawams('التوجيهات التربوية للمدرس' , isdarage: true)
                ],
              ),
              TableRow(
                children: [
                  Container(

                    alignment: Alignment.center,
                    padding: EdgeInsets.all(4),
                    height: 80,
                    child: Text(
                      textAlign: TextAlign.center,

                      isTaqderat == true?
      "${controller.rebortCard!.rebort!.molahdat!.manager}"
                          :
                      "${controller.rebortCard!.rebort!.molahdat!.firstSemester}\n${controller.rebortCard!.rebort!.molahdat!.firstSemester}",
                      style: TextStyle(
                          fontSize: 12, fontFamily: "tnr", fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
              TableRow(
                children: [
                  dawams('توقيع ولي الأمر' , isdarage: true),
                ],
              ),
              TableRow(
                children: [
                  dawams('' ),
                ],
              ),

            ],
          ),
        ],
      );
    });
  }
}