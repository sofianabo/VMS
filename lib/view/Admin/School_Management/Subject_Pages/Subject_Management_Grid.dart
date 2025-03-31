import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:vms_school/Icons_File/v_m_s__icons_icons.dart';
import 'package:vms_school/Link/API/AdminAPI/School/School_Screen_APIs/Subject_Screen/Delete_Subject_API.dart';
import 'package:vms_school/Link/API/AdminAPI/School/School_Screen_APIs/Subject_Screen/Edit_Subject_API.dart';
import 'package:vms_school/Link/Controller/AdminController/School_Controllers/Subject_Controller.dart';
import 'package:vms_school/Translate/local_controller.dart';
import 'package:vms_school/main.dart';
import 'package:vms_school/widgets/ButtonsDialog.dart';
import 'package:vms_school/widgets/GridAnimation.dart';
import 'package:vms_school/widgets/TextFildWithUpper.dart';
import 'package:vms_school/widgets/VMSAlertDialog.dart';

class Subject_Management_Grid extends StatelessWidget {
  Subject_Management_Grid({super.key});

  TextEditingController name = TextEditingController();
  TextEditingController enName = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return GetBuilder<Subject_Controller>(
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
                        border: TableBorder.all(
                            color: Theme.of(context).primaryColor),
                        children: [
                          TableRow(
                            decoration:
                                const BoxDecoration(color: Color(0xffD4DFE5)),
                            children: [
                              _tableHeader('Operation'.tr, context),
                              _tableHeader('Subject Name'.tr, context),
                            ],
                          ),
                          for (var row in controller.Subjects.asMap().entries)
                            TableRow(
                              children: [
                                _operationColumn(
                                    row.value, controller, row.key, context),
                                _dataColumn(prefs!.getString(languageKey)=='ar'? row.value['name']:row.value['enName']),
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

  Widget _tableHeader(String title, BuildContext context) {
    return Container(
      height: 50,
      alignment: Alignment.center,
      child: Center(
        child: Text(
          title,
          style: Theme.of(context).textTheme.titleLarge!.copyWith(
                color: Theme.of(context).primaryColor,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
        ),
      ),
    );
  }

  Widget _operationColumn(
      Map row, Subject_Controller controller, int index, BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 5.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          controller.Subjects[index]['hasCurriculum'] == false
              ? _iconButton(
                  iconData: VMS_Icons.bin,
                  color: const Color(0xffB03D3D),
                  onPressed: () {
                    Get.dialog(
                      VMSAlertDialog(
                        action: [
                          ButtonDialog(
                              text: "Delete".tr,
                              onPressed: () {
                                Delete_Subject_API(context).Delete_Subject(
                                  id: controller.Subjects[index]['id'],
                                  index: index,
                                );
                              },
                              color: const Color(0xffB03D3D),
                              width: 120),
                          ButtonDialog(
                              text: "Cancel".tr,
                              onPressed: () {
                                Get.back();
                              },
                              color: Theme.of(context).primaryColor,
                              width: 120)
                        ],
                        contents: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            SizedBox(
                              width: 400,
                              child: Text(
                                "Do You Want To Deletesub".tr+" (${prefs!.getString(languageKey)=='ar'? row['name']:row['enName']}) "+"Subjectt".tr,
                                style: const TextStyle(fontSize: 16),
                              ),
                            ),
                          ],
                        ),
                        apptitle: "Delete Subject".tr,
                        subtitle: "none",
                      ),
                    );
                  },
                )
              : _iconButton(
                  iconData: VMS_Icons.bin,
                  color: Color(0xffB03D3D),
                  onPressed: () {},
                ),
          _iconButton(
            iconData: Icons.edit_note_outlined,
            color: Theme.of(context).primaryColor,
            onPressed: () {
              name.text = "${row['name']}";
              enName.text = "${row['enName']}";
              Get.dialog(
                GetBuilder<Subject_Controller>(builder: (controller) {
                  return VMSAlertDialog(
                      action: [
                        ButtonDialog(
                            text: "Edit".tr,
                            onPressed: () async {
                              bool isArNameEmpty = name.text.isEmpty;
                              bool isEnNameEmpty = enName.text.isEmpty;

                              controller.updateFieldError(
                                  "arname", isArNameEmpty);
                              controller.updateFieldError(
                                  "enname", isEnNameEmpty);

                              if (!(isArNameEmpty || isEnNameEmpty)) {
                                await Edit_Subject_API(context).Edit_Subject(
                                  SubjectId: controller.Subjects[index]['id'],
                                  enName: enName.text,
                                  name: name.text,
                                );

                                name.clear();
                                enName.clear();
                              }
                            },
                            color: Theme.of(context).primaryColor,
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
                                    isRequired: true,
                                    isError: controller.IsEnnameError,
                                    onChanged: (value) {
                                      if (value.isNotEmpty) {
                                        controller.updateFieldError(
                                            "enname", false);
                                      }
                                    },
                                    controller: enName,
                                    Uptext: "Subject En - Name".tr,
                                    hinttext: "Subject En - Name".tr),
                              ),
                              Textfildwithupper(
                                  isRequired: true,
                                  isError: controller.IsArnameError,
                                  onChanged: (value) {
                                    if (value.isNotEmpty) {
                                      controller.updateFieldError(
                                          "arname", false);
                                    }
                                  },
                                  controller: name,
                                  Uptext: "Subject Ar - Name".tr,
                                  hinttext: "Subject Ar - Name".tr),
                            ],
                          ),
                        ],
                      ),
                      apptitle: "Edit Subject".tr,
                      subtitle: "none");
                }),
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
