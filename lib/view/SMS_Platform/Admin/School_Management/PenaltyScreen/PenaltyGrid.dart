import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:vms_school/Icons_File/v_m_s__icons_icons.dart';
import 'package:vms_school/Link/API/AdminAPI/School/School_Screen_APIs/PenaltyAPI/DeletePenaltyAPI.dart';
import 'package:vms_school/Link/API/AdminAPI/School/School_Screen_APIs/PenaltyAPI/EditPenaltyAPI.dart';
import 'package:vms_school/Link/Controller/AdminController/Employee_Controllers/Add_Data_controller.dart';
import 'package:vms_school/Link/Controller/AdminController/School_Controllers/PenaltyController.dart';
import 'package:vms_school/Translate/local_controller.dart';
import 'package:vms_school/view/Both_Platform/widgets/ButtonsDialog.dart';
import 'package:vms_school/view/Both_Platform/widgets/TextFildWithUpper.dart';
import 'package:vms_school/view/Both_Platform/widgets/VMSAlertDialog.dart';

class Penaltygrid extends StatefulWidget {
  Penaltygrid({super.key});

  @override
  State<Penaltygrid> createState() => _PenaltygridState();
}

class _PenaltygridState extends State<Penaltygrid> {
  TextEditingController name = TextEditingController();

  TextEditingController enName = TextEditingController();

  TextEditingController details = TextEditingController();
  TextEditingController editName = TextEditingController();

  TextEditingController editenName = TextEditingController();

  TextEditingController editDetails = TextEditingController();

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
              : controller.penalt!.isEmpty
                  ? Center(
                      child: Text("No Penalties".tr,
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
                                        color:
                                            Theme.of(context).indicatorColor),
                                    children: [
                                      _tableHeader('Penalty Name'.tr),
                                      _tableHeader('Details'.tr),
                                      if (Get.find<Add_Data_controller>()
                                              .roll !=
                                          "observer")
                                        _tableHeader('Operation'.tr),
                                    ],
                                  ),
                                  for (var row
                                      in controller.Penalties.asMap().entries)
                                    TableRow(
                                      children: [
                                        _dataColumn(
                                            Get.find<LocalizationController>()
                                                        .currentLocale
                                                        .value
                                                        .languageCode ==
                                                    'ar'
                                                ? row.value['name']
                                                : row.value['enName']),
                                        _dataColumn(row.value['description']),
                                        if (Get.find<Add_Data_controller>()
                                                .roll !=
                                            "observer")
                                          _operationColumn(row.value,
                                              controller, row.key, context),
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
                                            color: Theme.of(context)
                                                .indicatorColor),
                                        children: [
                                          _tableHeader('Penalty Name'.tr),
                                          _tableHeader('Details'.tr),
                                          if (Get.find<Add_Data_controller>()
                                                  .roll !=
                                              "observer")
                                            _tableHeader('Operation'.tr),
                                        ],
                                      ),
                                      for (var row
                                          in controller.Penalties.asMap()
                                              .entries)
                                        TableRow(
                                          children: [
                                            _dataColumn(
                                                Get.find<LocalizationController>()
                                                            .currentLocale
                                                            .value
                                                            .languageCode ==
                                                        'ar'
                                                    ? row.value['name']
                                                    : row.value['enName']),
                                            _dataColumn(
                                                row.value['description']),
                                            if (Get.find<Add_Data_controller>()
                                                    .roll !=
                                                "observer")
                                              _operationColumn(row.value,
                                                  controller, row.key, context),
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

  Widget _tableHeader(String title) {
    return Container(
      height: 50,
      alignment: Alignment.center,
      child: Center(
        child: Text(title, style: Theme.of(context).textTheme.headlineLarge),
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
                        text: "Delete".tr,
                        onPressed: () {
                          Deletepenaltyapi(context).Deletepenalty(
                            penaltyId: controller.Penalties[index]['id'],
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
                          "Do You Want To Delete".tr +
                              " (${Get.find<LocalizationController>().currentLocale.value.languageCode == 'ar' ? row['name'] : row['enName']})" +
                              "penalty".tr,
                          style: const TextStyle(fontSize: 16),
                        ),
                      ),
                    ],
                  ),
                  apptitle: "Delete Penalty".tr,
                  subtitle: "none",
                ),
              );
            },
          ),
          _iconButton(
            iconData: Icons.edit_note_outlined,
            color: Get.theme.primaryColor,
            onPressed: () {
              editName.text = "${row['name']}";
              editenName.text = "${row['enName']}";
              editDetails.text = "${row['description']}";
              Get.dialog(
                GetBuilder<Penaltycontroller>(builder: (controller) {
                  return VMSAlertDialog(
                      action: [
                        ButtonDialog(
                            text: "Edit".tr,
                            onPressed: () async {
                              bool isArNameEmpty = editName.text.isEmpty;
                              bool isEnNameEmpty = editenName.text.isEmpty;
                              bool isdetEmpty = editDetails.text.isEmpty;

                              controller.updateFieldError(
                                  "editarname", isArNameEmpty);
                              controller.updateFieldError(
                                  "editenname", isEnNameEmpty);
                              controller.updateFieldError(
                                  "editdetail", isdetEmpty);

                              if (!(isArNameEmpty ||
                                  isEnNameEmpty ||
                                  isdetEmpty)) {
                                await Editpenaltyapi(context).Editpenalty(
                                  penaltyid: controller.Penalties[index]['id'],
                                  details: editDetails.text,
                                  enName: editenName.text,
                                  name: editName.text,
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
                                  isError: controller.IsEnnameErrorEdit,
                                  onChanged: (value) {
                                    if (value.isNotEmpty) {
                                      controller.updateFieldError(
                                          "editenname", false);
                                    }
                                  },
                                  controller: editenName,
                                  Uptext: "Penalty En - Name".tr,
                                  hinttext: "Penalty En - Name".tr),
                              Textfildwithupper(
                                  width: 280,
                                  isRequired: true,
                                  isError: controller.IsArnameErrorEdit,
                                  onChanged: (value) {
                                    if (value.isNotEmpty) {
                                      controller.updateFieldError(
                                          "editarname", false);
                                    }
                                  },
                                  controller: editName,
                                  Uptext: "Penalty Ar - Name".tr,
                                  hinttext: "Penalty Ar - Name".tr),
                              Textfildwithupper(
                                  isRequired: true,
                                  width: 280,
                                  isError: controller.IsdeErrorEdit,
                                  onChanged: (value) {
                                    if (value.isNotEmpty) {
                                      controller.updateFieldError(
                                          "editdetail", false);
                                    }
                                  },
                                  controller: editDetails,
                                  Uptext: "Details".tr,
                                  hinttext: "Details".tr),
                            ],
                          ),
                        ),
                      ),
                      apptitle: "Edit Penalty".tr,
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
        style: Theme.of(context).textTheme.bodyMedium,
      ),
    );
  }
}
