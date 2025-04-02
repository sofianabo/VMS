import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vms_school/Link/Controller/AdminController/Employee_Controllers/Add_Full_Employee_Controller.dart';
import 'package:vms_school/Link/Controller/AdminController/Employee_Controllers/AllEmpolyeeController.dart';
import 'package:vms_school/Link/Controller/AdminController/Teacher_Controllers/AllTeachersController.dart';

import '../../Link/Controller/AdminController/Employee_Controllers/All_Virtual_Employee_Controller.dart';

class Dropdownallemployee extends StatelessWidget {
  double width;
  String title; 
  String type;
  bool isError;
  bool Disabled;

  Dropdownallemployee({
    super.key,
    required this.title,
    required this.width,
    required this.type,
    this.isError = false,
    this.Disabled = false,
  });

  @override
  Widget build(BuildContext context) {
    return GetBuilder<Allempolyeecontroller>(builder: (cont) {
      String selectedValue = "";

      switch (type) {
        case 'jobTitle':
          selectedValue = cont.selectejobTitleIndex.isNotEmpty
              ? cont.selectejobTitleIndex
              : title;
          break;
        case 'roll':
          selectedValue =
              cont.selecterollIndex.isNotEmpty ? cont.selecterollIndex : title;
          break;
        case 'feroll':
          selectedValue = cont.selecteferollIndex.isNotEmpty
              ? cont.selecteferollIndex
              : title;
          break;
        case 'fejop':
          selectedValue = cont.selectefejopIndex.isNotEmpty
              ? cont.selectefejopIndex
              : title;
          break;
        case 'rolldialog':
          selectedValue = cont.selectedrolldialogIndex.isNotEmpty
              ? cont.selectedrolldialogIndex
              : title;
          break;
        case 'dialogjobTitle':
          selectedValue = cont.selecteddialogjobTitleIndex.isNotEmpty
              ? cont.selecteddialogjobTitleIndex
              : title;
          break;
        case 'Gender':
          selectedValue = cont.selecteGenderIndex.isNotEmpty
              ? cont.selecteGenderIndex
              : title;
          break;
        case 'Family_Status':
          selectedValue = cont.selecteFamily_StatusIndex.isNotEmpty
              ? cont.selecteFamily_StatusIndex
              : title;
          break;
        case 'Contract':
          selectedValue = cont.selecteContractTypeIndex.isNotEmpty
              ? cont.selecteContractTypeIndex
              : title;
          break;
      }

      return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Container(
          padding: const EdgeInsets.all(6.0),
          alignment: Alignment.centerLeft,
          width: width,
          height: 40,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            border: Border.all(
              color: isError ? Colors.red : const Color(0xffD9D9D9),
            ),
          ),
          child: Row(
            children: [
              Expanded(
                child: DropdownButton<String>(
                  icon: selectedValue != title
                      ? GestureDetector(
                          onTap: Disabled
                              ? null
                              : () {
                                  cont.selectIndex(type, "");
                                  final errorMap = {
                                    "Gender": ["gender"],
                                    "Contract": ["contract"],
                                    "feroll": ["roll"],
                                    "rolldialog": ["jop"],
                                    "fejop": ["jop"],
                                    "dialogjobTitle": ["jop"],
                                    "Family_Status": ["family"],
                                  };

                                  WidgetsBinding.instance
                                      .addPostFrameCallback((_) {
                                    errorMap[type]?.forEach((field) {
                                      if (type == "Gender") {
                                        Get.find<Allteachercontroller>()
                                            .updateFieldError(field, true);
                                        Get.find<AddFullEmployeeController>()
                                            .updateFieldError(field, true);
                                      } else if (type == "Contract") {
                                        Get.find<Allteachercontroller>()
                                            .updateFieldError(field, true);
                                      } else if (type == "rolldialog") {
                                        Get.find<
                                                All_Virtual_Employee_Controller>()
                                            .updateFieldError(field, true);
                                      } else if ([
                                        "dialogjobTitle",
                                        "Family_Status"
                                      ].contains(type)) {
                                        Get.find<AddFullEmployeeController>()
                                            .updateFieldError(field, true);
                                      }
                                      cont.updateFieldError(field, true);
                                    });
                                  });
                                },
                          child: Icon(
                            Icons.close,
                            color: Get.theme.secondaryHeaderColor,
                          ),
                        )
                      : Icon(Icons.arrow_drop_down_outlined,
                          color: Get.theme.secondaryHeaderColor),
                  dropdownColor: Get.theme.cardColor,
                  iconDisabledColor: Colors.grey,
                  iconEnabledColor: Get.theme.cardColor,
                  value: selectedValue,
                  isExpanded: true,
                  underline: const SizedBox(),
                  style: Get.theme.textTheme.bodyMedium!.copyWith(fontSize: 14),
                  onChanged: Disabled
                      ? null
                      : (newValue) {
                          if (newValue!.isEmpty) return;
                          cont.selectIndex(type, newValue);
                          if (type == "fejop") {
                            cont.SetRollDropDown(newValue);
                          }
                          final errorMap = {
                            "Gender": ["gender"],
                            "Contract": ["contract"],
                            "feroll": ["roll"],
                            "rolldialog": ["jop"],
                            "fejop": ["jop"],
                            "dialogjobTitle": ["jop"],
                            "Family_Status": ["family"],
                          };

                          WidgetsBinding.instance.addPostFrameCallback((_) {
                            errorMap[type]?.forEach((field) {
                              if (["Gender", "Contract"].contains(type)) {
                                Get.find<Allteachercontroller>()
                                    .updateFieldError(field, false);
                              }
                              if (["rolldialog"].contains(type)) {
                                Get.find<All_Virtual_Employee_Controller>()
                                    .updateFieldError(field, false);
                              }
                              if (["Gender", "dialogjobTitle", "Family_Status"]
                                  .contains(type)) {
                                Get.find<AddFullEmployeeController>()
                                    .updateFieldError(field, false);
                              }
                              cont.updateFieldError(field, false);
                            });
                          });
                        },
                  items: [
                    DropdownMenuItem<String>(
                      value: title,
                      enabled: false,
                      child: Text(
                        title.tr,
                        style: Get.theme.textTheme.bodyMedium!.copyWith(
                          fontSize: 14,
                        ),
                      ),
                    ),
                    ..._getDropdownItems(cont),
                  ],
                  borderRadius: BorderRadius.circular(3),
                ),
              ),
            ],
          ),
        ),
        if (isError)
          Text(
            "يرجى اختيار قيمة صحيحة",
            style: TextStyle(color: Colors.red, fontSize: 12),
          ),
      ]);
    });
  }

  List<DropdownMenuItem<String>> _getDropdownItems(Allempolyeecontroller cont) {
    List<DropdownMenuItem<String>> items = [];

    switch (type) {
      case 'jobTitle':
        items.addAll(cont.JobTitleList.map((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Text(
              value.tr,
              style: Get.theme.textTheme.bodyMedium!.copyWith(fontSize: 14),
            ),
          );
        }).toList());
        break;
      case 'feroll':
        items.addAll(cont.feRoll.map((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Text(
              value.tr,
              style: Get.theme.textTheme.bodyMedium!.copyWith(fontSize: 14),
            ),
          );
        }).toList());
        break;
      case 'fejop':
        items.addAll(cont.feJoptitle.map((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Text(
              value.tr,
              style: Get.theme.textTheme.bodyMedium!.copyWith(fontSize: 14),
            ),
          );
        }).toList());
        break;
      case 'roll':
        items.addAll(cont.rolllist.map((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Text(
              value.tr,
              style: Get.theme.textTheme.bodyMedium!.copyWith(fontSize: 14),
            ),
          );
        }).toList());
        break;
      case 'dialogjobTitle':
        items.addAll(cont.dialogjobTitleList.map((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Text(
              value.tr,
              style: Get.theme.textTheme.bodyMedium!.copyWith(fontSize: 14),
            ),
          );
        }).toList());
        break;
      case 'Gender':
        items.addAll(cont.GenderList.map((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Text(
              value.tr,
              style: Get.theme.textTheme.bodyMedium!.copyWith(fontSize: 14),
            ),
          );
        }).toList());
        break;
      case 'Family_Status':
        items.addAll(cont.Family_StatusList.map((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Text(
              value.tr,
              style: Get.theme.textTheme.bodyMedium!.copyWith(fontSize: 14),
            ),
          );
        }).toList());
        break;
      case 'rolldialog':
        items.addAll(cont.rolldialoglist.map((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Text(
              value.tr,
              style: Get.theme.textTheme.bodyMedium!.copyWith(fontSize: 14),
            ),
          );
        }).toList());
        break;
      case 'Contract':
        items.addAll(cont.contractList.map((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Text(
              value.tr,
              style: Get.theme.textTheme.bodyMedium!.copyWith(fontSize: 14),
            ),
          );
        }).toList());

        break;
    }

    return items;
  }
}
