import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:vms_school/Icons_File/v_m_s__icons_icons.dart';
import 'package:vms_school/Link/API/API.dart';
import 'package:vms_school/Link/API/AdminAPI/School/School_Screen_APIs/Grade_Screen/Delete_Grade_API.dart';
import 'package:vms_school/Link/API/AdminAPI/School/School_Screen_APIs/Grade_Screen/Edit_Grade_API.dart';
import 'package:vms_school/Link/API/AdminAPI/School/School_Screen_APIs/PenaltyAPI/DeletePenaltyAPI.dart';
import 'package:vms_school/Link/API/AdminAPI/School/School_Screen_APIs/PenaltyAPI/EditPenaltyAPI.dart';
import 'package:vms_school/Link/Controller/AdminController/School_Controllers/Grade_Controller.dart';
import 'package:vms_school/Link/Controller/AdminController/School_Controllers/PenaltyController.dart';
import 'package:vms_school/widgets/ButtonsDialog.dart';
import 'package:vms_school/widgets/TextFildWithUpper.dart';
import 'package:vms_school/widgets/VMSAlertDialog.dart';

class Penaltygrid extends StatelessWidget {
  Penaltygrid({super.key});

  TextEditingController name = TextEditingController();
  TextEditingController enName = TextEditingController();
  TextEditingController details = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return GetBuilder<Penaltycontroller>(
      builder: (controller) {
        return Container(
          margin: const EdgeInsets.only(top: 20),
          width: Get.width * 0.9,
          child: controller.isLoading == true
              ? LoadingAnimationWidget.inkDrop(
                  color: Theme.of(context).primaryColor,
                  size: 60,
                )
              : SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Table(
                        border: TableBorder.all(color: Get.theme.primaryColor),
                        children: [
                          TableRow(
                            decoration:
                                const BoxDecoration(color: Color(0xffD4DFE5)),
                            children: [
                              _tableHeader('Operation'),
                              _tableHeader('Details'),
                              _tableHeader('Penalty Name'),
                            ],
                          ),
                          for (var row in controller.Penalties.asMap().entries)
                            TableRow(
                              children: [
                                _operationColumn(
                                    row.value, controller, row.key, context),
                                _dataColumn(row.value['description']),
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

  Widget _operationColumn(
      Map row, Penaltycontroller controller, int index, BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 5.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          _iconButton(
            iconData: VMS_Icons.bin,
            color: const Color(0xffB03D3D),
            onPressed: () {
              Get.dialog(
                VMSAlertDialog(
                  action: [
                    ButtonDialog(
                        text: "Delete",
                        onPressed: () {
                          Deletepenaltyapi(context).Deletepenalty(
                            penaltyId: controller.Penalties[index]['id'],
                            index: index,
                          );
                        },
                        color: const Color(0xffB03D3D),
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
                      SizedBox(
                        width: 400,
                        child: Text(
                          "Do You Want To Delete (${row['enName']}) penalty",
                          style: const TextStyle(fontSize: 16),
                        ),
                      ),
                    ],
                  ),
                  apptitle: "Delete Penalty",
                  subtitle: "none",
                ),
              );
            },
          ),
          _iconButton(
            iconData: Icons.edit_note_outlined,
            color: Get.theme.primaryColor,
            onPressed: () {
              name.text = "${row['name']}";
              enName.text = "${row['enName']}";
              details.text = "${row['description']}";
              Get.dialog(
                VMSAlertDialog(
                    action: [
                      ButtonDialog(
                          text: "Edit",
                          onPressed: () {
                            Editpenaltyapi(context).Editpenalty(
                              penaltyid: controller.Penalties[index]['id'],
                              details: details.text,
                              enName: enName.text,
                              name: name.text,
                            );
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
                              padding: const EdgeInsets.only(
                                  left: 15.0, right: 15.0),
                              child: Textfildwithupper(
                                  controller: enName,
                                  Uptext: "Penalty En - Name",
                                  hinttext: "Penalty En - Name"),
                            ),
                            Textfildwithupper(
                                controller: name,
                                Uptext: "Penalty Ar - Name",
                                hinttext: "Penalty Ar - Name"),
                          ],
                        ),
                        Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(
                                  left: 15.0, right: 15.0, top: 15.0),
                              child: Textfildwithupper(
                                  controller: details,
                                  Uptext: "Details",
                                  hinttext: "Details"),
                            ),
                          ],
                        ),
                      ],
                    ),
                    apptitle: "Edit Penalty",
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
      margin: const EdgeInsets.symmetric(horizontal: 10.0),
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
          shape: const WidgetStatePropertyAll(RoundedRectangleBorder(
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
        style: const TextStyle(color: Colors.black),
      ),
    );
  }
}