import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vms_school/Link/Controller/LMS_Controllers/Admin_LMS/Curr_LMS_Controller.dart';

class DropDownLMSCurriMgmt extends StatelessWidget {
  final double width;
  final String title;
  final String type;
  final String? selectedValue;
  final Color? color;
  final bool? Isloading;
  final bool isError;

  const DropDownLMSCurriMgmt({
    super.key,
    required this.title,
    this.color,
    required this.width,
    required this.type,
    this.selectedValue,
    this.Isloading,
    this.isError = false,
  });

  @override
  Widget build(BuildContext context) {
    return GetBuilder<Curriculumn_LMS_Controller>(builder: (cont) {
      return _buildNormalDropdown(cont, context);
    });
  }

  Widget _buildNormalDropdown(
      Curriculumn_LMS_Controller cont, BuildContext context) {
    String currentValue = selectedValue ?? title;

    switch (type) {
      case 'Subject':
        currentValue = cont.selectsubjectIndex.isNotEmpty
            ? cont.selectsubjectIndex
            : title;
        break;
      case 'semester':
        currentValue = cont.selectsemesterIndex.isNotEmpty
            ? cont.selectsemesterIndex
            : title;
        break;
      case 'Dialog_Subject':
        currentValue = cont.selectdialog_SubjectIndex.isNotEmpty
            ? cont.selectdialog_SubjectIndex
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
          child: Isloading == true
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
                                  WidgetsBinding.instance
                                      .addPostFrameCallback((_) {
                                    if (type == "Dialog_Subject") {
                                      cont.updateFieldError("subject", true);
                                    }
                                  });
                                  cont.update();
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
            "Please select true value".tr,
            style: const TextStyle(color: Colors.red, fontSize: 12),
          ),
      ],
    );
  }

  List<DropdownMenuItem<String>> _getDropdownItems(
      Curriculumn_LMS_Controller cont) {
    List<DropdownMenuItem<String>> items = [];

    switch (type) {
      case 'Subject':
        items.addAll(cont.listsubject.map((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Text(
              value,
              style: Get.theme.textTheme.bodyMedium!.copyWith(fontSize: 14),
            ),
          );
        }).toList());
        break;

      case 'semester':
        items.addAll(cont.listSemester.map((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Text(
              value.tr,
              style: Get.theme.textTheme.bodyMedium!.copyWith(fontSize: 14),
            ),
          );
        }).toList());
        break;

      case 'Dialog_Subject':
        items.addAll(cont.list_Dialog_Subject.map((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Text(
              value,
              style: Get.theme.textTheme.bodyMedium!.copyWith(fontSize: 14),
            ),
          );
        }).toList());
        break;

      case 'Dialog_semester':
        items.addAll(cont.list_Dialog_semester.map((String value) {
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
