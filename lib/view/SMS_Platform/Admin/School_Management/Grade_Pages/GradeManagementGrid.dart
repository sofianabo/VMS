import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:vms_school/Icons_File/v_m_s__icons_icons.dart';
import 'package:vms_school/Link/API/AdminAPI/School/School_Screen_APIs/Grade_Screen/Delete_Grade_API.dart';
import 'package:vms_school/Link/API/AdminAPI/School/School_Screen_APIs/Grade_Screen/Edit_Grade_API.dart';
import 'package:vms_school/Link/Controller/AdminController/Employee_Controllers/Add_Data_controller.dart';
import 'package:vms_school/Link/Controller/AdminController/School_Controllers/Grade_Controller.dart';
import 'package:vms_school/Translate/local_controller.dart';
import 'package:vms_school/view/Both_Platform/widgets/ButtonsDialog.dart';
import 'package:vms_school/view/Both_Platform/widgets/TextFildWithUpper.dart';
import 'package:vms_school/view/Both_Platform/widgets/VMSAlertDialog.dart';

class GradeTable extends StatelessWidget {
  GradeTable({super.key});

  TextEditingController name = TextEditingController();
  TextEditingController enName = TextEditingController();
  TextEditingController feeCount = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection:
          Get.find<LocalizationController>().currentLocale.value.languageCode ==
                  'ar'
              ? TextDirection.rtl
              : TextDirection.ltr,
      child: GetBuilder<Grade_Controller>(
        builder: (controller) {
          return Container(
              margin: const EdgeInsets.only(top: 20),
              width: Get.width * 0.9,
              child: controller.isLoading == true
                  ? LoadingAnimationWidget.inkDrop(
                      color: Theme.of(context).primaryColor,
                      size: 60,
                    )
                  : Get.width >= 769
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
                                        color:
                                            Theme.of(context).indicatorColor),
                                    children: [
                                      if (Get.find<Add_Data_controller>()
                                              .roll !=
                                          "observer")
                                        _tableHeader('Operation'.tr, context),
                                      _tableHeader('Fee Count'.tr, context),
                                      _tableHeader('Grade Name'.tr, context),
                                    ],
                                  ),
                                  for (var row
                                      in controller.Grades.asMap().entries)
                                    TableRow(
                                      children: [
                                        if (Get.find<Add_Data_controller>()
                                                .roll !=
                                            "observer")
                                          _operationColumn(row.value,
                                              controller, row.key, context),
                                        _dataColumn(
                                            row.value['feeCount'], context),
                                        _dataColumn(
                                            Get.find<LocalizationController>()
                                                        .currentLocale
                                                        .value
                                                        .languageCode ==
                                                    'ar'
                                                ? row.value['name']
                                                : row.value['enName'],
                                            context),
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
                              width: 769,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Table(
                                    border: TableBorder.all(
                                        color: Theme.of(context).primaryColor),
                                    children: [
                                      TableRow(
                                        decoration: BoxDecoration(
                                            color: Theme.of(context)
                                                .indicatorColor),
                                        children: [
                                          if (Get.find<Add_Data_controller>()
                                                  .roll !=
                                              "observer")
                                            _tableHeader(
                                                'Operation'.tr, context),
                                          _tableHeader('Fee Count'.tr, context),
                                          _tableHeader(
                                              'Grade Name'.tr, context),
                                        ],
                                      ),
                                      for (var row
                                          in controller.Grades.asMap().entries)
                                        TableRow(
                                          children: [
                                            if (Get.find<Add_Data_controller>()
                                                    .roll !=
                                                "observer")
                                              _operationColumn(row.value,
                                                  controller, row.key, context),
                                            _dataColumn(
                                                row.value['feeCount'], context),
                                            _dataColumn(
                                                Get.find<LocalizationController>()
                                                            .currentLocale
                                                            .value
                                                            .languageCode ==
                                                        'ar'
                                                    ? row.value['name']
                                                    : row.value['enName'],
                                                context),
                                          ],
                                        ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ));
        },
      ),
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
      Map row, Grade_Controller controller, int index, BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 5.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          _iconButton(
            iconData: VMS_Icons.bin,
            color: controller.grades![index].hasStudent == 0
                ? Color(0xffB03D3D)
                : Get.theme.disabledColor,
            onPressed: () {
              if (controller.grades![index].hasStudent == 0) {
                Get.dialog(
                  VMSAlertDialog(
                    action: [
                      ButtonDialog(
                          text: "Delete".tr,
                          onPressed: () {
                            Delete_Grade_API(context).Delete_Grade(
                              gradeId: controller.Grades[index]['id'],
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
                            "Do You Want To Deletegarde".tr +
                                " ( ${Get.find<LocalizationController>().currentLocale.value.languageCode == 'ar' ? "${row['name']}" : "${row['enName']}"} ) " +
                                "Gradee".tr,
                            style: const TextStyle(fontSize: 16),
                          ),
                        ),
                      ],
                    ),
                    apptitle: "Delete Grade".tr,
                    subtitle: "none",
                  ),
                );
              }
            },
          ),
          _iconButton(
            iconData: Icons.edit_note_outlined,
            color: Theme.of(context).primaryColor,
            onPressed: () {
              name.text = "${row['name']}";
              enName.text = "${row['enName']}";
              feeCount.text = "${row['feeCount']}";
              Get.dialog(
                barrierDismissible: false,
                GetBuilder<Grade_Controller>(builder: (G_Controller) {
                  return VMSAlertDialog(
                      action: [
                        ButtonDialog(
                            text: "Edit".tr,
                            onPressed: () {
                              {
                                bool isArNameEmpty = name.text.isEmpty;

                                bool isEnNameEmpty = enName.text.isEmpty;

                                bool isFeeEmpty = feeCount.text.isEmpty;

                                G_Controller.updateFieldError(
                                    "arname", isArNameEmpty);
                                G_Controller.updateFieldError(
                                    "enname", isEnNameEmpty);
                                G_Controller.updateFieldError(
                                    "fee", isFeeEmpty);

                                if (!(isArNameEmpty ||
                                    isEnNameEmpty ||
                                    isFeeEmpty)) {
                                  Edit_Grade_API(context).Edit_Grade(
                                    gradeId: G_Controller.Grades[index]['id'],
                                    feeCount: feeCount.text,
                                    enName: enName.text,
                                    name: name.text,
                                  );
                                }
                              }
                            },
                            color: Theme.of(context).primaryColor,
                            width: 120),
                      ],
                      contents: Container(
                        width: 320,
                        child: SingleChildScrollView(
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Textfildwithupper(
                                  width: 280,
                                  isRequired: true,
                                  isError: G_Controller.IsennameError,
                                  onChanged: (value) {
                                    if (value.isNotEmpty) {
                                      G_Controller.updateFieldError(
                                          "enname", false);
                                    }
                                  },
                                  controller: enName,
                                  Uptext: "Grade En - Name".tr,
                                  hinttext: "Grade En - Name".tr),
                              Textfildwithupper(
                                  width: 280,
                                  isRequired: true,
                                  isError: G_Controller.IsarnameError,
                                  onChanged: (value) {
                                    if (value.isNotEmpty) {
                                      G_Controller.updateFieldError(
                                          "arname", false);
                                    }
                                  },
                                  controller: name,
                                  Uptext: "Grade Ar - Name".tr,
                                  hinttext: "Grade Ar - Name".tr),
                              Textfildwithupper(
                                  width: 280,
                                  isRequired: true,
                                  isError: G_Controller.IsfeeError,
                                  onChanged: (value) {
                                    if (value.isNotEmpty) {
                                      G_Controller.updateFieldError(
                                          "fee", false);
                                    }
                                  },
                                  fieldType: "number",
                                  controller: feeCount,
                                  Uptext: "Fee Count".tr,
                                  hinttext: "Fee Count".tr),
                            ],
                          ),
                        ),
                      ),
                      apptitle: "Edit Grade".tr,
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

  Widget _dataColumn(String? data, BuildContext context) {
    return Container(
      alignment: Alignment.center,
      height: 50,
      child: Text(
        data ?? '',
        style: Theme.of(context).textTheme.bodyMedium,
      ),
    );
  }
}
