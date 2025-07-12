import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vms_school/Link/Controller/AdminController/School_Controllers/Subject_Controller.dart';
import 'package:vms_school/Link/Controller/WidgetController/DropDown_Controllers/DropDownCurriculumn_Controller.dart';
import 'package:vms_school/view/Both_Platform/widgets/VMSAlertDialog.dart';

class DropDownCurriMgmt extends StatelessWidget {
  final double width;
  final String title;
  final String type;
  final String? selectedValue;
  final Color? color;
  final bool? Isloading;
  final bool isError;

  const DropDownCurriMgmt({
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
    return GetBuilder<Curriculumn_Controller>(builder: (cont) {
      // معالجة خاصة لنوع Dialog_semester
      // if (type == 'Dialog_semester') {
      //   // return _buildMultiSelectSemester(cont, context);
      // } else {
      //   return _buildNormalDropdown(cont, context);
      // }
return _buildNormalDropdown(cont, context);
      
    });
  }

  // Widget _buildMultiSelectSemester(
  //     Curriculumn_Controller cont, BuildContext context) {
  //   return Column(
  //     crossAxisAlignment: CrossAxisAlignment.start,
  //     children: [
  //       InkWell(
  //         onTap: () => _showSemesterSelectionDialog(cont, context),
  //         child: Container(
  //           padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
  //           width: width,
  //           height: 40,
  //           decoration: BoxDecoration(
  //             borderRadius: BorderRadius.circular(5),
  //             border: isError
  //                 ? Border.all(color: Colors.red)
  //                 : Border.all(color: color ?? const Color(0xffD9D9D9)),
  //           ),
  //           child: Row(
  //             children: [
  //               Expanded(
  //                 child: Text(
  //                   cont.selectdialog_SemesterIndex.isEmpty
  //                       ? title.tr
  //                       : cont.selectdialog_SemesterIndex.tr,
  //                   style: Get.theme.textTheme.bodyMedium,
  //                 ),
  //               ),
  //               Icon(
  //                 Icons.arrow_drop_down,
  //                 color: Get.theme.secondaryHeaderColor,
  //               ),
  //             ],
  //           ),
  //         ),
  //       ),
  //       if (isError)
  //         Text(
  //           "Please select true value".tr,
  //           style: const TextStyle(color: Colors.red, fontSize: 12),
  //         ),
  //     ],
  //   );
  // }

  // void _showSemesterSelectionDialog(
  //     Curriculumn_Controller cont, BuildContext context) {
  //   final List<String> semesters = cont.list_Dialog_semester;
  //   List<String> selected = cont.selectdialog_SemesterIndex.isNotEmpty
  //       ? cont.selectdialog_SemesterIndex.split(', ')
  //       : [];

  //   showDialog(
  //     context: context,
  //     builder: (ctx) {
  //       return StatefulBuilder(
  //         builder: (context, setState) {
  //           return VMSAlertDialog(
  //               action: [
  //                 TextButton(
  //                   onPressed: () => Get.back(),
  //                   child: Text("Cancel".tr),
  //                 ),
  //                 TextButton(
  //                   onPressed: () {
  //                     cont.selectdialog_SemesterIndex = selected.join(', ');
  //                     if (selected.isNotEmpty) {
  //                       cont.updateFieldError("semester", false);
  //                       cont.selectedSemesterss = selected;
  //                       _updateSemesterIds(cont, selected);
  //                     } else {
  //                       cont.updateFieldError("semester", true);
  //                       cont.selectedSemesterss = [];
  //                     }

  //                     cont.update();
  //                     Get.back();
  //                   },
  //                   child: Text("Done".tr),
  //                 ),
  //               ],
  //               contents: SingleChildScrollView(
  //                 child: Column(
  //                   mainAxisSize: MainAxisSize.min,
  //                   children: semesters.map((semester) {
  //                     return CheckboxListTile(
  //                       title: Text(semester.tr),
  //                       value: selected.contains(semester),
  //                       onChanged: (isChecked) {
  //                         setState(() {
  //                           if (isChecked!) {
  //                             selected.add(semester);
  //                           } else {
  //                             selected.remove(semester);
  //                           }
  //                         });
  //                       },
  //                     );
  //                   }).toList(),
  //                 ),
  //               ),
  //               apptitle: "Select Semesters".tr,
  //               subtitle: "none");
  //         },
  //       );
  //     },
  //   );
  // }

  // void _updateSemesterIds(Curriculumn_Controller cont, List<String> selected) {
  //   cont.selectedSemesterIds = [];
  //   for (var semester in selected) {
  //     if (semester == "The First Semester" || semester == "الفصل الأول") {
  //       cont.selectedSemesterIds.add(1);
  //     } else if (semester == "The Second Semester" ||
  //         semester == "الفصل الثاني") {
  //       cont.selectedSemesterIds.add(2);
  //     } else if (semester == "The Third Semester" ||
  //         semester == "الفصل الثالث") {
  //       cont.selectedSemesterIds.add(3);
  //     }
  //   }
  // }

  Widget _buildNormalDropdown(
      Curriculumn_Controller cont, BuildContext context) {
    String currentValue = selectedValue ?? title;

    switch (type) {
      case 'Subject':
        currentValue = cont.selectsubjectIndex.isNotEmpty
            ? cont.selectsubjectIndex
            : title;
        break;
      // case 'semester':
      //   currentValue = cont.selectsemesterIndex.isNotEmpty
      //       ? cont.selectsemesterIndex
      //       : title;
      //   break;
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
                            WidgetsBinding.instance.addPostFrameCallback((_) {
                              if (type == "Dialog_Subject") {
                                cont.updateFieldError("subject", false);
                              }
                            });

                            if (type == "Dialog_Subject") {
                              cont.set_subjectIdx(Get.find<Subject_Controller>()
                                  .subject!
                                  .firstWhere((subg) =>
                                      subg.enName == newValue ||
                                      subg.name == newValue)
                                  .id);
                            }
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
      Curriculumn_Controller cont) {
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

      // case 'semester':
      //   items.addAll(cont.listSemester.map((String value) {
      //     return DropdownMenuItem<String>(
      //       value: value,
      //       child: Text(
      //         value.tr,
      //         style: Get.theme.textTheme.bodyMedium!.copyWith(fontSize: 14),
      //       ),
      //     );
      //   }).toList());
      //   break;

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

      // case 'Dialog_semester':
      //   items.addAll(cont.list_Dialog_semester.map((String value) {
      //     return DropdownMenuItem<String>(
      //       value: value,
      //       child: Text(
      //         value.tr,
      //         style: Get.theme.textTheme.bodyMedium!.copyWith(fontSize: 14),
      //       ),
      //     );
      //   }).toList());
      //   break;
    }

    return items;
  }
}
