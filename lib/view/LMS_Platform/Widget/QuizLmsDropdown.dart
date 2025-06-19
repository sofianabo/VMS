import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vms_school/Link/API/AdminAPI/School/School_Tables/DropDownTypeDialogAPI.dart';
import 'package:vms_school/Link/Controller/LMS_Controllers/Admin_LMS/Curr_LMS_Controller.dart';
import 'package:vms_school/Link/Controller/LMS_Controllers/Admin_LMS/Files_Controller.dart';
import 'package:vms_school/Link/Controller/LMS_Controllers/Admin_LMS/LinksLMS_Controller.dart';
import 'package:vms_school/Link/Controller/LMS_Controllers/Admin_LMS/QuizController/AllQuizController.dart';
import 'package:vms_school/Link/Model/AdminModel/School_Models/ExamTypeModel.dart';

class Quizlmsdropdown extends StatelessWidget {
  final double width;
  final String title;
  final String type;
  final String? selectedValue;
  final Color? color;
  final bool? isDisabled;
  final bool? Isloading;
  final bool isError;

  const Quizlmsdropdown({
    super.key,
    required this.title,
    this.color,
    this.isDisabled = false,
    required this.width,
    required this.type,
    this.selectedValue,
    this.Isloading,
    this.isError = false,
  });

  @override
  Widget build(BuildContext context) {
    return GetBuilder<Allquizcontroller>(builder: (cont) {
      return _buildNormalDropdown(cont, context);
    });
  }

  Widget _buildNormalDropdown(Allquizcontroller cont, BuildContext context) {
    String currentValue = selectedValue ?? title;

    switch (type) {
      case 'curriculum':
        currentValue =
            cont.selectCurrIndex.isNotEmpty ? cont.selectCurrIndex : title;
        break;
      case 'curiculmDialog':
        currentValue = cont.selectdialog_CurrIndex.isNotEmpty
            ? cont.selectdialog_CurrIndex
            : title;
        break;
      case 'typeDialog':
        currentValue = cont.selectedTypeDialog.isNotEmpty
            ? cont.selectedTypeDialog
            : title;
        break;
      case 'semesterDialog':
        currentValue = cont.selectedSemesterDialog.isNotEmpty
            ? cont.selectedSemesterDialog
            : title;
        break;
    }

    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: const EdgeInsets.all(6.0),
          alignment: Alignment.centerLeft,
          width: width,
          height: 40,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            border: isError
                ? Border.all(color: Colors.red)
                : Border.all(color: color ?? const Color(0xffD9D9D9)),
          ),
          child: isDisabled == true
              ? Row(
                  children: [
                    Text(
                      title,
                      style: const TextStyle(color: Colors.grey),
                    ),
                  ],
                )
              : Isloading == true
                  ? const Center(
                      child: SizedBox(
                        width: 20,
                        height: 20,
                        child: CircularProgressIndicator(strokeWidth: 3),
                      ),
                    )
                  : Row(
                      children: [
                        Expanded(
                          child: DropdownButton<String>(
                            onChanged: (newValue) {
                              if (newValue != null && newValue != title) {
                                cont.selectIndex(type, newValue);
                                if (type == "curiculmDialog") {
                                  WidgetsBinding.instance
                                      .addPostFrameCallback((_) {
                                    cont.updateFieldError("curr", false);
                                  });
                                }
                                if (type == "semesterDialog") {
                                  WidgetsBinding.instance
                                      .addPostFrameCallback((_) {
                                    cont.updateFieldError("semester", false);
                                  });
                                }
                                if (type == "typeDialog") {
                                  WidgetsBinding.instance
                                      .addPostFrameCallback((_) {
                                    cont.updateFieldError("type", false);
                                  });
                                }
                                final errorMap = {
                                  "curiculmDialog": ["curr"],
                                };

                                WidgetsBinding.instance
                                    .addPostFrameCallback((_) {
                                  errorMap[type]?.forEach((field) {
                                    if ([
                                      "curiculmDialog",
                                    ].contains(type)) {
                                      Get.find<Allquizcontroller>()
                                          .updateFieldError(field, false);
                                    }

                                    cont.updateFieldError(field, false);
                                  });
                                });
                              }
                            },
                            dropdownColor: Get.theme.cardColor,
                            iconDisabledColor: Colors.grey,
                            iconEnabledColor: Get.theme.cardColor,
                            value: currentValue,
                            isExpanded: true,
                            underline: const SizedBox(),
                            icon: currentValue != title
                                ? GestureDetector(
                                    onTap: () {
                                      cont.selectIndex(type, "");
                                    
                                      if (type == "semesterDialog") {
                                        WidgetsBinding.instance
                                            .addPostFrameCallback((_) {
                                          cont.updateFieldError(
                                              "semester", true);
                                        });
                                      }
                                     

                                       if (type == "curiculmDialog") {
                                    WidgetsBinding.instance
                                        .addPostFrameCallback((_) {
                                      cont.updateFieldError("curr", true);
                                    });
                                  }
                                  if (type == "semesterDialog") {
                                    WidgetsBinding.instance
                                        .addPostFrameCallback((_) {
                                      cont.updateFieldError("semester", true);
                                    });
                                  }
                                  if (type == "typeDialog") {
                                    WidgetsBinding.instance
                                        .addPostFrameCallback((_) {
                                      cont.updateFieldError("type", true);
                                    });
                                  }
                                      // cont.update();
                                    },
                                    child: Icon(
                                      Icons.close,
                                      color: Get.theme.secondaryHeaderColor,
                                    ),
                                  )
                                : Icon(
                                    Icons.arrow_drop_down,
                                    color: Get.theme.secondaryHeaderColor,
                                  ),
                            style: Get.theme.textTheme.bodyMedium!
                                .copyWith(fontSize: 14),
                            items: [
                              DropdownMenuItem<String>(
                                value: title,
                                enabled: false,
                                child: Text(
                                  title.tr,
                                  style:
                                      Get.theme.textTheme.bodyMedium!.copyWith(
                                    fontSize: 14,
                                  ),
                                ),
                              ),
                              ..._getDropdownItems(cont, context),
                            ],
                            borderRadius: BorderRadius.circular(3),
                          ),
                        ),
                      ],
                    ),
        ),
        if (isError)
          Text(
            "Please select true value".tr,
            style: const TextStyle(color: Colors.red, fontSize: 12),
          ),
        if (!isError)
          SizedBox(
            height: 17,
          )
      ],
    );
  }

  List<DropdownMenuItem<String>> _getDropdownItems(
      Allquizcontroller cont, BuildContext context) {
    List<DropdownMenuItem<String>> items = [];
    String seasonindex;

    switch (type) {
      case 'curriculum':
        items.addAll(cont.currList.map((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Text(
              value.tr,
              style: Get.theme.textTheme.bodyMedium!.copyWith(fontSize: 14),
            ),
          );
        }).toList());
        break;

      case 'curiculmDialog':
        items.addAll(cont.dialogCurrList.map((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Text(
              value.tr,
              style: Get.theme.textTheme.bodyMedium!.copyWith(fontSize: 14),
            ),
          );
        }).toList());
        break;
      case 'typeDialog':
        items.addAll(cont.typeDialogList.map((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Text(
              value.tr,
              style: Get.theme.textTheme.bodyMedium!.copyWith(fontSize: 14),
            ),
          );
        }).toList());
        break;
      case 'semesterDialog':
        items.addAll(cont.semesterDialogList.map((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Text(
              value.tr,
              style: Get.theme.textTheme.bodyMedium!.copyWith(fontSize: 14),
            ),
            onTap: () async {
              seasonindex = value;
              cont.initType();
              AllExamTypeModel types = await Dropdowntypedialogapi(context)
                  .Dropdowntypedialog(
                      cont.semesterDialogList.indexOf(seasonindex));
              cont.setAllTypesDialog(types);
            },
          );
        }).toList());
        break;
    }

    return items;
  }
}
