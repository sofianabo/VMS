import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vms_school/Link/API/AdminAPI/School/School_Screen_APIs/Quiz_Type/Get_Quiz_Type.dart';
import 'package:vms_school/Link/Controller/AdminController/School_Controllers/Teachernote_and_GradeReco.dart';
import 'package:vms_school/Link/Controller/LMS_Controllers/Admin_LMS/Selected_Screen.dart';

class QuizType_DropDown extends StatelessWidget {
  final double width;
  final String title;
  final String type;
  final String? selectedValue;
  final Color? color;
  final bool? Isloading;
  final bool? IsEnabled;

  const QuizType_DropDown({
    super.key,
    required this.title,
    this.color,
    required this.width,
    required this.type,
    this.selectedValue,
    this.Isloading,
    this.IsEnabled,
  });

  @override
  Widget build(BuildContext context) {
    return GetBuilder<TeachernoteAndGradeReco>(builder: (cont) {
      String currentValue = selectedValue ?? title;
      switch (type) {
        case 'semester':
          currentValue =
              cont.selectedSemester.isNotEmpty ? cont.selectedSemester : title;
          break;
      }

      return Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.all(6.0),
            alignment: Alignment.centerLeft,
            width: width,
            height: 40,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              border: Border.all(color: color ?? const Color(0xffD9D9D9)),
            ),
            child: Isloading == true
                ? const Center(
                    child: SizedBox(
                      width: 20,
                      height: 20,
                      child: CircularProgressIndicator(strokeWidth: 3),
                    ),
                  )
                : IsEnabled == true
                    ? Row(
                        children: [
                          Expanded(
                            child: DropdownButton<String>(
                              onChanged: (newValue) {
                                if (newValue != null && newValue != title) {
                                  cont.selectIndex(type, newValue);
                                  switch (type) {
                                    case 'semester':
                                      var selectedClassItem = cont
                                          .Classmodel?.classes
                                          ?.firstWhereOrNull(
                                        (element) =>
                                            element.name == cont.ClassIndex ||
                                            element.enName == cont.ClassIndex,
                                      );
                                      if (newValue == "The First Semester") {
                                        Get_Quiz_Type_API().Get_Quiz_Type(
                                            SemsterId: cont.SemesterSendIndex,
                                            ClassId: Get.find<
                                                    Selected_Class_Controller>()
                                                .classid
                                                .toString());
                                      }
                                      if (newValue == "The Second Semester") {
                                        cont.set_semesteridx(2);
                                        Get_Quiz_Type_API().Get_Quiz_Type(
                                            SemsterId: cont.SemesterSendIndex,
                                            ClassId: Get.find<
                                                    Selected_Class_Controller>()
                                                .classid
                                                .toString());
                                      }
                                      if (newValue == "The Third Semester") {
                                        cont.set_semesteridx(3);
                                        Get_Quiz_Type_API().Get_Quiz_Type(
                                            SemsterId: cont.SemesterSendIndex,
                                            ClassId: Get.find<
                                                    Selected_Class_Controller>()
                                                .classid
                                                .toString());
                                      }
                                      break;
                                  }
                                }
                              },
                              dropdownColor: Get.theme.cardColor,
                              iconDisabledColor: Colors.grey,
                              iconEnabledColor: Get.theme.cardColor,
                              value: currentValue,
                              isExpanded: true,
                              underline: const SizedBox(),
                              icon: Icon(
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
                      )
                    : Center(
                        child: Text(
                          title.tr,
                          style: Get.theme.textTheme.bodyMedium!.copyWith(
                              fontSize: 14,
                              color: Theme.of(context).disabledColor),
                        ),
                      ),
          ),
        ],
      );
    });
  }

  List<DropdownMenuItem<String>> _getDropdownItems(
      TeachernoteAndGradeReco cont) {
    List<DropdownMenuItem<String>> items = [];

    switch (type) {
      case 'semester':
        items.addAll(cont.SemesterList.map((String value) {
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
