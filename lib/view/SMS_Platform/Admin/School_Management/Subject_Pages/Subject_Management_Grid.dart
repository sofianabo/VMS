import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:vms_school/Icons_File/v_m_s__icons_icons.dart';
import 'package:vms_school/Link/API/AdminAPI/School/School_Screen_APIs/Subject_Screen/Delete_Subject_API.dart';
import 'package:vms_school/Link/API/AdminAPI/School/School_Screen_APIs/Subject_Screen/Edit_Subject_API.dart';
import 'package:vms_school/Link/Controller/AdminController/Employee_Controllers/Add_Data_controller.dart';
import 'package:vms_school/Link/Controller/AdminController/School_Controllers/Subject_Controller.dart';
import 'package:vms_school/Translate/local_controller.dart';
import 'package:vms_school/main.dart';
import 'package:vms_school/view/Both_Platform/widgets/ButtonsDialog.dart';
import 'package:vms_school/view/Both_Platform/widgets/TextFildWithUpper.dart';
import 'package:vms_school/view/Both_Platform/widgets/VMSAlertDialog.dart';

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
              : controller.subject!.isEmpty
                  ? Center(
                      child: Text("No Subjects".tr,
                          style: Theme.of(context)
                              .textTheme
                              .titleLarge!
                              .copyWith(
                                  fontSize: 22, fontWeight: FontWeight.normal)))
                  : Get.width >= 600
                      ? SingleChildScrollView(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Table(
                                border: TableBorder.all(
                                    color: Theme.of(context).primaryColor),
                                children: [
                                  TableRow(
                                    decoration: BoxDecoration(
                                        color: Get.theme.indicatorColor),
                                    children: [
                                      if (Get.find<Add_Data_controller>()
                                              .roll !=
                                          "observer")
                                        _tableHeader('Operation'.tr, context),
                                      _tableHeader('Subject Name'.tr, context),
                                    ],
                                  ),
                                  for (var row
                                      in controller.Subjects.asMap().entries)
                                    TableRow(
                                      children: [
                                        if (Get.find<Add_Data_controller>()
                                                .roll !=
                                            "observer")
                                          _operationColumn(row.value,
                                              controller, row.key, context),
                                        _dataColumn(
                                            Get.find<LocalizationController>()
                                                        .currentLocale
                                                        .value
                                                        .languageCode ==
                                                    'ar'
                                                ? row.value['name']
                                                : row.value['enName']),
                                      ],
                                    ),
                                ],
                              ),
                            ],
                          ),
                        )
                      : SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: SingleChildScrollView(
                            scrollDirection: Axis.vertical,
                            child: Container(
                              width: 600,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Table(
                                    border: TableBorder.all(
                                        color: Theme.of(context).primaryColor),
                                    children: [
                                      TableRow(
                                        decoration: BoxDecoration(
                                            color: Get.theme.indicatorColor),
                                        children: [
                                          if (Get.find<Add_Data_controller>()
                                                  .roll !=
                                              "observer")
                                            _tableHeader(
                                                'Operation'.tr, context),
                                          _tableHeader(
                                              'Subject Name'.tr, context),
                                        ],
                                      ),
                                      for (var row
                                          in controller.Subjects.asMap()
                                              .entries)
                                        TableRow(
                                          children: [
                                            if (Get.find<Add_Data_controller>()
                                                    .roll !=
                                                "observer")
                                              _operationColumn(row.value,
                                                  controller, row.key, context),
                                            _dataColumn(
                                                Get.find<LocalizationController>()
                                                            .currentLocale
                                                            .value
                                                            .languageCode ==
                                                        'ar'
                                                    ? row.value['name']
                                                    : row.value['enName']),
                                          ],
                                        ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
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
        child: Text(title, style: Theme.of(context).textTheme.headlineLarge),
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
                                "Do You Want To Deletesub".tr +
                                    " (${Get.find<LocalizationController>().currentLocale.value.languageCode == 'ar' ? row['name'] : row['enName']}) " +
                                    "Subjectt".tr,
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
                  color: Theme.of(context).disabledColor,
                  onPressed: () {
                    Get.dialog(
                      VMSAlertDialog(
                        action: [],
                        contents: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            SizedBox(
                              width: 400,
                              child: Text(
                                "This Subjact has Curriculums".tr,
                                style: const TextStyle(fontSize: 16),
                              ),
                            ),
                          ],
                        ),
                        apptitle: "You Can`t Delete This Subject".tr,
                        subtitle: "none",
                      ),
                    );
                  },
                ),
          _iconButton(
            iconData: Icons.edit_note_outlined,
            color: Theme.of(context).primaryColor,
            onPressed: () {
              controller.updateFieldError("arname", false);
              controller.updateFieldError("enname", false);
              name.text = "${row['name']}";
              enName.text = "${row['enName']}";
              Get.dialog(
                barrierDismissible: false,
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
                              }
                            },
                            color: Theme.of(context).primaryColor,
                            width: 120),
                      ],
                      contents: Container(
                        width: 320,
                        child: SingleChildScrollView(
                          child: Column(
                            spacing: 10,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Textfildwithupper(
                                  isRequired: true,
                                  width: 280,
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
                              Textfildwithupper(
                                  width: 280,
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
                        ),
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
        style: Get.theme.textTheme.bodyMedium,
      ),
    );
  }
}
