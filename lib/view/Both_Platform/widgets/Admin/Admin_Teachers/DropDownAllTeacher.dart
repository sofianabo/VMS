import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vms_school/Link/API/AdminAPI/School/School_DropDown/DropdownClassesAPI.dart';
import 'package:vms_school/Link/Controller/AdminController/Teacher_Controllers/AllTeachersController.dart';

// ignore: must_be_immutable
class Dropdownallteacher extends StatelessWidget {
  final double width;
  final String title;
  final String type;
  final Color? color;
  bool isDisabled;
  bool isLoading;
  bool isError;

  Dropdownallteacher({
    super.key,
    required this.title,
    this.color,
    required this.width,
    required this.type,
    this.isDisabled = false,
    this.isError = false,
    this.isLoading = false,
  });

  @override
  Widget build(BuildContext context) {
    return GetBuilder<Allteachercontroller>(builder: (cont) {
      String selectedValue = "";

      switch (type) {
        case 'Class':
          selectedValue = cont.selectedclassIndex.isNotEmpty
              ? cont.selectedclassIndex
              : title;
          break;
        case 'Curriculum':
          selectedValue = cont.selectedCurriculumIndex.isNotEmpty
              ? cont.selectedCurriculumIndex
              : title;
          break;
        case 'Subject':
          selectedValue = cont.selectedSubjectIndex.isNotEmpty
              ? cont.selectedSubjectIndex
              : title;
          break;
        case 'GenderDialog':
          selectedValue = cont.selectedGenderDialogIndex.isNotEmpty
              ? cont.selectedGenderDialogIndex.tr
              : title;
          break;
        case 'FamilyStatusDialog':
          selectedValue = cont.selectedFamilyStatusDialogIndex.isNotEmpty
              ? cont.selectedFamilyStatusDialogIndex.tr
              : title;
          break;
        case 'ContractTypeDialog':
          selectedValue = cont.selectedContarctTypeDialogIndex.isNotEmpty
              ? cont.selectedContarctTypeDialogIndex.tr
              : title;
          break;
      }

      return Container(
        height: 60,
        child: Column(
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
                  border: Border.all(
                    color: isError ? Colors.red : const Color(0xffD9D9D9),
                  ),
                ),
                child: isLoading == true
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
                              icon: selectedValue != title
                                  ? GestureDetector(
                                      onTap: isDisabled
                                          ? null
                                          : () {
                                              cont.selectIndex(type, "");
                                              cont.update();
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
                              style: Get.theme.textTheme.bodyMedium!
                                  .copyWith(fontSize: 14),
                              onChanged: isDisabled
                                  ? null
                                  : (newValue) {
                                      if (newValue!.isEmpty) return;
                                      cont.selectIndex(type, newValue);
                                    },
                              items: [
                                DropdownMenuItem<String>(
                                  value: title,
                                  enabled: false,
                                  child: Text(
                                    title.tr,
                                    style: Get.theme.textTheme.bodyMedium!
                                        .copyWith(
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
            ]),
      );
    });
  }

  List<DropdownMenuItem<String>> _getDropdownItems(Allteachercontroller cont) {
    List<DropdownMenuItem<String>> items = [];

    switch (type) {
      case 'Class':
        items.addAll(cont.classlist.map((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Text(
              value,
              style: Get.theme.textTheme.bodyMedium!.copyWith(fontSize: 14),
            ),
          );
        }).toList());
        break;
      case 'Curriculum':
        items.addAll(cont.Curriculumlist.map((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Text(
              value,
              style: Get.theme.textTheme.bodyMedium!.copyWith(fontSize: 14),
            ),
          );
        }).toList());
        break;
      case 'Subject':
        items.addAll(cont.Subjectlist.map((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Text(
              value,
              style: Get.theme.textTheme.bodyMedium!.copyWith(fontSize: 14),
            ),
          );
        }).toList());
        break;
      case 'GenderDialog':
        items.addAll(cont.genderDialogList.map((String value) {
          return DropdownMenuItem<String>(
            value: value.tr,
            child: Text(
              value.tr,
              style: Get.theme.textTheme.bodyMedium!.copyWith(fontSize: 14),
            ),
          );
        }).toList());
        break;
      case 'FamilyStatusDialog':
        items.addAll(cont.familyStatusDialogList.map((String value) {
          return DropdownMenuItem<String>(
            value: value.tr,
            child: Text(
              value.tr,
              style: Get.theme.textTheme.bodyMedium!.copyWith(fontSize: 14),
            ),
          );
        }).toList());
        break;
      case 'ContractTypeDialog':
        items.addAll(cont.contractTypeDialogList.map((String value) {
          return DropdownMenuItem<String>(
            value: value.tr,
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
