import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vms_school/Link/Controller/AdminController/Students_Controllers/Students_Marks_Controller.dart';
import 'package:vms_school/widgets/ButtonsDialog.dart';
import 'package:vms_school/widgets/VMSAlertDialog.dart';

void showAddMarkForAllDialog() {
  final Students_Marks_Controller marksController =
      Get.find<Students_Marks_Controller>();
  final TextEditingController markController = TextEditingController();
  String? selectedType;

  final allMarkTypes = <String>{};

  for (var student in marksController.studentsMarksModel?.student ?? []) {
    for (var mark in student.mark ?? []) {
      if (mark.type != null && mark.type!.isNotEmpty) {
        allMarkTypes.add(mark.type!);
      }
    }
  }

  Get.dialog(
    VMSAlertDialog(
      apptitle: "إضافة علامة للكل",
      subtitle: "none",
      contents: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          DropdownButtonFormField<String>(
            decoration: InputDecoration(
              labelText: 'نوع العلامة',
              border: const OutlineInputBorder(),
              labelStyle: TextStyle(
                color: Colors.black.withOpacity(0.6),
                fontSize: 14,
              ),
            ),
            dropdownColor: Colors.white,
            style: const TextStyle(
              color: Colors.black,
              fontSize: 14,
            ),
            value: selectedType,
            items: allMarkTypes.map((String type) {
              return DropdownMenuItem<String>(
                value: type,
                child: Text(
                  type,
                  style: Get.theme.textTheme.bodyMedium!.copyWith(fontSize: 14),
                ),
              );
            }).toList(),
            onChanged: (String? newValue) {
              selectedType = newValue;
            },
          ),
          const SizedBox(height: 16),
          TextFormField(
            controller: markController,
            keyboardType: TextInputType.number,
            maxLength: 4,
            style: const TextStyle(fontSize: 14),
            decoration: InputDecoration(
              labelText: 'العلامة',
              border: const OutlineInputBorder(),
              counterText: '',
              labelStyle: TextStyle(
                color: Colors.black.withOpacity(0.6),
                fontSize: 14,
              ),
            ),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'الرجاء إدخال العلامة';
              }
              if (int.tryParse(value) == null) {
                return 'الرجاء إدخال رقم صحيح';
              }
              return null;
            },
          ),
        ],
      ),
      action: [
        ButtonDialog(
            text: "Done".tr,
            onPressed: () {
              if (selectedType == null) {
                Get.snackbar('خطأ', 'الرجاء اختيار نوع العلامة');
                return;
              }

              final markValue = double.tryParse(markController.text);
              if (markValue == null) {
                Get.snackbar('خطأ', 'الرجاء إدخال علامة صحيحة');
                return;
              }

              marksController.addMarkForAllStudents(
                mark: markValue,
                type: selectedType!,
              );
              Get.back();
            },
            color: Get.theme.primaryColor,
            width: 120),
      ],
    ),
    barrierDismissible: false,
  );
}
