import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vms_school/Link/API/Error_API.dart';
import 'package:vms_school/Link/Controller/AdminController/Students_Controllers/Students_Marks_Controller.dart';
import 'package:vms_school/Link/Controller/Teacher_Controller/StudentMarks_TeacherController.dart';
import 'package:vms_school/widgets/ButtonsDialog.dart';
import 'package:vms_school/widgets/VMSAlertDialog.dart';

void showAddMarkForAllDialog_Teacher() {
  final StudentmarksTeachercontroller marksController =
      Get.find<StudentmarksTeachercontroller>();
  final TextEditingController markController = TextEditingController();
  String? selectedType;
  double maxMark = 100.0;
  double passingMark = 50.0;
  Color markColor = Colors.black;

  final allMarkTypes = <String>{};

  // جمع أنواع العلامات مع استبعاد المجموعات التي تحتوي على items
  for (var quizType in marksController.studentsMarksModel?.quizType ?? []) {
    // نتخطى تمامًا المجموعات التي تحتوي على items
    if (quizType.items != null && quizType.items!.isNotEmpty) {
      // نضيف العناصر الفردية فقط
      for (var item in quizType.items!) {
        if (item.name != null && item.name!.isNotEmpty) {
          allMarkTypes.add(item.name!);
        }
      }
    }
    // نضيف العناصر التي ليس لها items ولا operationType
    else if ((quizType.operationType == null ||
            quizType.operationType!.isEmpty) &&
        quizType.name != null &&
        quizType.name!.isNotEmpty) {
      allMarkTypes.add(quizType.name!);
    }
  }

  Get.dialog(
    VMSAlertDialog(
      apptitle: "Add Marks For All".tr,
      subtitle: "none",
      contents: StatefulBuilder(
        builder: (BuildContext context, StateSetter setState) {
          return Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              DropdownButtonFormField<String>(
                decoration: InputDecoration(
                    labelText: 'نوع العلامة',
                    border: const OutlineInputBorder(),
                    labelStyle: Get.theme.textTheme.bodyMedium),
                dropdownColor: Get.theme.cardColor,
                style: Get.theme.textTheme.bodyMedium,
                value: selectedType,
                items: allMarkTypes.map((String type) {
                  return DropdownMenuItem<String>(
                    value: type,
                    child: Text(
                      type,
                      style: Get.theme.textTheme.bodyMedium!
                          .copyWith(fontSize: 14),
                    ),
                  );
                }).toList(),
                onChanged: (String? newValue) {
                  setState(() {
                    selectedType = newValue;
                    if (newValue != null) {
                      bool found = false;
                      for (var quizType
                          in marksController.studentsMarksModel?.quizType ??
                              []) {
                        // البحث في العناصر الفرعية فقط
                        for (var item in quizType.items ?? []) {
                          if (item.name == newValue) {
                            maxMark = item.maxMark?.toDouble() ?? 100.0;
                            passingMark = item.passingMark?.toDouble() ?? 50.0;
                            found = true;
                            break;
                          }
                        }
                        if (found) break;

                        // البحث في العناصر الرئيسية التي ليس لها items
                        if (quizType.items == null || quizType.items!.isEmpty) {
                          if (quizType.name == newValue) {
                            maxMark = quizType.maxMark?.toDouble() ?? 100.0;
                            passingMark =
                                quizType.passingMark?.toDouble() ?? 50.0;
                            found = true;
                            break;
                          }
                        }
                      }
                      final currentValue =
                          double.tryParse(markController.text) ?? 0;
                      markColor = currentValue < passingMark
                          ? Colors.red
                          : Colors.black;
                    }
                  });
                },
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: markController,
                keyboardType: TextInputType.number,
                maxLength: 4,
                enabled: selectedType != null,
                style: TextStyle(
                  fontSize: 14,
                  color: markColor,
                ),
                decoration: InputDecoration(
                  labelText: 'العلامة',
                  border: const OutlineInputBorder(),
                  counterText: '',
                  labelStyle: Get.theme.textTheme.bodyMedium,
                  suffixText: selectedType != null ? '/ $maxMark' : null,
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'الرجاء إدخال العلامة';
                  }
                  if (double.tryParse(value) == null) {
                    return 'الرجاء إدخال رقم صحيح';
                  }
                  final markValue = double.parse(value);
                  if (markValue > maxMark) {
                    return 'العلامة يجب أن تكون أقل من أو تساوي $maxMark';
                  }
                  return null;
                },
                onChanged: (value) {
                  setState(() {
                    final markValue = double.tryParse(value) ?? 0;
                    if (markValue > maxMark) {
                      markController.text = maxMark.toString();
                      markController.selection = TextSelection.fromPosition(
                        TextPosition(offset: markController.text.length),
                      );
                    }
                    markColor =
                        markValue < passingMark ? Colors.red : Colors.black;
                  });
                },
              ),
              if (selectedType != null) ...[
                const SizedBox(height: 8),
                Text(
                  'الحد الأقصى: $maxMark | النجاح: $passingMark',
                  style: TextStyle(
                    color: Colors.grey[600],
                    fontSize: 12,
                  ),
                ),
              ],
            ],
          );
        },
      ),
      action: [
        ButtonDialog(
          text: "Done".tr,
          onPressed: () {
            if (selectedType == null) {
              ErrorMessage('الرجاء اختيار نوع العلامة');
              return;
            }

            final markValue = double.tryParse(markController.text);
            if (markValue == null) {
              ErrorMessage('الرجاء إدخال علامة صحيحة');
              return;
            }

            if (markValue > maxMark) {
              ErrorMessage('العلامة المدخلة أكبر من الحد الأقصى ($maxMark)');
              return;
            }

            marksController.addMarkForAllStudents(
              mark: markValue,
              type: selectedType!,
            );
            Get.back();
          },
          color: Get.theme.primaryColor,
          width: 120,
        ),
      ],
    ),
    barrierDismissible: false,
  );
}
