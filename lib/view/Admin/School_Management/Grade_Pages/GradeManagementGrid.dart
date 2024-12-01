import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vms_school/Icons_File/v_m_s__icons_icons.dart';
import 'package:vms_school/Link/Controller/AdminController/School_Controllers/Grade_Controller.dart';
import 'package:vms_school/widgets/ButtonsDialog.dart';
import 'package:vms_school/widgets/TextFildWithUpper.dart';
import 'package:vms_school/widgets/VMSAlertDialog.dart';

class GradeTable extends StatelessWidget {
  GradeTable({super.key});

  TextEditingController arName = TextEditingController();
  TextEditingController enName = TextEditingController();
  TextEditingController feeCount = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return GetBuilder<Grade_Controller>(
      builder: (controller) {
        return Container(
          margin: const EdgeInsets.only(top: 20),
          width: Get.width * 0.9,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Table(
                  border: TableBorder.all(color: Get.theme.primaryColor),
                  children: [
                    TableRow(
                      decoration: BoxDecoration(color: Color(0xffD4DFE5)),
                      children: [
                        _tableHeader('Operation'),
                        _tableHeader('Fee Count'),
                        _tableHeader('Grade Name'),
                      ],
                    ),
                    for (var row in controller.Grades.asMap().entries)
                      TableRow(
                        children: [
                          _operationColumn(row.value, controller, row.key),
                          _dataColumn(row.value['feeCount']),
                          _dataColumn(row.value['enName']),
                        ],
                      ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _tableHeader(String title) {
    return Container(
      height: 50,
      alignment: Alignment.center,
      child: Center(
        child: Text(
          title,
          style: Get.theme.textTheme.titleLarge!.copyWith(
            color: Get.theme.primaryColor,
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }

  Widget _operationColumn(Map row, Grade_Controller controller, int index) {
    return Padding(
      padding: const EdgeInsets.only(top: 5.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          _iconButton(
            iconData: VMS_Icons.bin,
            color: Color(0xffB03D3D),
            onPressed: () {
              Get.dialog(
                VMSAlertDialog(
                  action: [
                    ButtonDialog(
                        text: "Delete",
                        onPressed: () {
                          controller.DeleteGrade(index);
                          Get.back();
                        },
                        color: Color(0xffB03D3D),
                        width: 120),
                    ButtonDialog(
                        text: "Cancel",
                        onPressed: () {
                          Get.back();
                        },
                        color: Get.theme.primaryColor,
                        width: 120)
                  ],
                  contents: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Container(
                        width: 400,
                        child: Text(
                          "Do You Want To Delete (${row['enName']}) Grade",
                          style: TextStyle(fontSize: 16),
                        ),
                      ),
                    ],
                  ),
                  apptitle: "Delete Grade",
                  subtitle: "none",
                ),
              );
            },
          ),
          _iconButton(
            iconData: Icons.edit_note_outlined,
            color: Get.theme.primaryColor,
            onPressed: () {
              arName.text = "${row['arName']}";
              enName.text = "${row['enName']}";
              feeCount.text = "${row['feeCount']}";
              Get.dialog(
                VMSAlertDialog(
                    action: [
                      ButtonDialog(
                          text: "Edit",
                          onPressed: () {
                            controller.UpdateGrade(
                              index,
                              arName.text,
                              enName.text,
                              feeCount.text,
                            );
                            Get.back();
                          },
                          color: Get.theme.primaryColor,
                          width: 120),
                    ],
                    contents: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Row(
                          children: [
                            Padding(
                              padding: EdgeInsets.only(left: 15.0, right: 15.0),
                              child: Textfildwithupper(
                                  controller: enName,
                                  Uptext: "Grade En - Name",
                                  hinttext: "Grade En - Name"),
                            ),
                            Textfildwithupper(
                                controller: arName,
                                Uptext: "Grade Ar - Name",
                                hinttext: "Grade Ar - Name"),
                          ],
                        ),
                        Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: EdgeInsets.only(
                                  left: 15.0, right: 15.0, top: 15.0),
                              child: Textfildwithupper(
                                  controller: feeCount,
                                  Uptext: "Fee Count",
                                  hinttext: "Fee Count"),
                            ),
                          ],
                        ),
                      ],
                    ),
                    apptitle: "Edit Grade",
                    subtitle: "none"),
              );
            },
          ),
        ],
      ),
    );
  }

  Widget _iconButton(
      {required IconData iconData,
      required Color color,
      required VoidCallback onPressed}) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 10.0),
      width: 40,
      height: 40,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(5),
        boxShadow: const [
          BoxShadow(color: Colors.black12, offset: Offset(0, 2), blurRadius: 1),
        ],
      ),
      child: IconButton(
        style: ButtonStyle(
          backgroundColor: WidgetStatePropertyAll(color),
          shape: WidgetStatePropertyAll(RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(5)))),
        ),
        onPressed: onPressed,
        icon: Icon(iconData, size: 18, color: Colors.white),
      ),
    );
  }

  Widget _dataColumn(String? data) {
    return Container(
      alignment: Alignment.center,
      height: 50,
      child: Text(
        data ?? '',
        style: TextStyle(color: Colors.black),
      ),
    );
  }
}
