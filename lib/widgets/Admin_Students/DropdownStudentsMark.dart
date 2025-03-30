import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vms_school/Link/API/AdminAPI/School/School_DropDown/DropdownDivisionAPI.dart';
import 'package:vms_school/Link/API/AdminAPI/School/School_Screen_APIs/Curriculm_API/Get_All_Curriculm.dart';
import 'package:vms_school/Link/API/AdminAPI/Students/Students_APIs/Get_Quiz_Marks.dart';
import 'package:vms_school/Link/Controller/AdminController/Location_controller.dart';
import 'package:vms_school/Link/Controller/AdminController/Students_Controllers/Students_Marks_Controller.dart';
import 'package:vms_school/Link/Controller/WidgetController/DropDown_Controllers/DropDownClassesController.dart';
import 'package:vms_school/Link/Controller/WidgetController/DropDown_Controllers/DropDownCurriculumn_Controller.dart';
import 'package:vms_school/Link/Controller/WidgetController/DropDown_Controllers/DropDownDivisionController.dart';

class DropdownStudentsMark extends StatelessWidget {
  final double width;
  final String title;
  final String type;
  final Color? color;
  final bool isLoading;
  final bool? isDisabled;

  const DropdownStudentsMark({
    super.key,
    required this.title,
    this.color,
    required this.width,
    required this.type,
    required this.isLoading,
    this.isDisabled = false,
  });

  @override
  Widget build(BuildContext context) {
    return GetBuilder<Students_Marks_Controller>(builder: (cont) {
      String? selectedValue;

      return Container(
        padding: const EdgeInsets.all(6.0),
        alignment: Alignment.centerLeft,
        width: width,
        height: 40,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          border: Border.all(color: color ?? const Color(0xffD9D9D9)),
        ),
        child: isDisabled == true
            ? Row(
                children: [
                  Text(
                    title.tr,
                    style: TextStyle(color: Colors.grey),
                  ),
                ],
              )
            : isLoading == true
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
                            if (newValue != null) {
                              cont.selectIndex(type, newValue);

                              if (type == 'Class') {
                                cont.resetinClass();
                                Dropdowndivisionapi(context).Dropdowndivision(
                                    cont.Classlist.indexOf(newValue), 0);
                              }
                              if (type == 'Division') {
                                Get_All_Curriculm_API(context)
                                    .Get_All_Curriculm(
                                  Semesterid: cont.semesterId,
                                  classId: Get.find<Dropdownclassescontroller>()
                                      .Allclass[cont.Classlist.indexOf(
                                          cont.ClassIndex)]
                                      .id
                                      .toString(),
                                );
                                cont.resetindivision();
                              }
                              if (type == 'Curriculum') {
                                Get_Quiz_Marks_API().Get_Quiz_Marks(
                                    SemsterId: cont.semesterId,
                                    ClassId:
                                        Get.find<Dropdownclassescontroller>()
                                            .Allclass[cont.Classlist.indexOf(
                                                cont.ClassIndex)]
                                            .id!,
                                    CurrId: Get.find<Curriculumn_Controller>()
                                        .curriculum![
                                            cont.Curriculumlist.indexOf(
                                                cont.CurriculumIndex)]
                                        .id!,
                                    DivisionId:
                                        Get.find<Dropdowndivisioncontroller>()
                                            .allDivision[
                                                cont.Divisionlist.indexOf(
                                                    cont.DivisionIndex)]
                                            .id!);
                              }
                              switch (type) {
                                case 'Semester':
                                  if (newValue == "The First Semester") {
                                    cont.set_semesteridx(1);
                                  }
                                  if (newValue == "The Second Semester") {
                                    cont.set_semesteridx(2);
                                  }
                                  if (newValue == "The Third Semester") {
                                    cont.set_semesteridx(3);
                                  }
                                  cont.resetinSemester();
                                  Get_All_Curriculm_API(context).Get_All_Curriculm(
                                      // Semesterid: cont.semesterId,
                                      // classId:
                                      //     Get.find<Dropdownclassescontroller>()
                                      //         .Allclass[cont.Classlist.indexOf(
                                      //             cont.ClassIndex)]
                                      //         .id
                                      //         .toString(),
                                      );
                                  break;
                              }
                            }
                          },
                          dropdownColor: Get.theme.cardColor,
                          iconDisabledColor: Colors.grey,
                          iconEnabledColor: Get.theme.cardColor,
                          value: selectedValue,
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
                              value: null,
                              child: Text(
                                title.tr, // يظهر العنوان عند عدم اختيار أي قيمة
                                style: Get.theme.textTheme.bodyMedium!
                                    .copyWith(fontSize: 14, color: Colors.grey),
                              ),
                            ),
                            ..._getDropdownItems(cont),
                          ],
                          borderRadius: BorderRadius.circular(3),
                        ),
                      ),
                    ],
                  ),
      );
    });
  }

  /// 🔹 دالة لإرجاع القائمة بناءً على النوع
  List<String> _getListByType(Students_Marks_Controller cont) {
    switch (type) {
      case 'Class':
        return cont.Classlist;
      case 'Division':
        return cont.Divisionlist;
      case 'Semester':
        return cont.Semesterlist;
      case 'Curriculum':
        return cont.Curriculumlist;
      default:
        return [];
    }
  }

  /// 🔹 دالة لإنشاء عناصر القائمة
  List<DropdownMenuItem<String>> _getDropdownItems(
      Students_Marks_Controller cont) {
    return _getListByType(cont).map((String value) {
      return DropdownMenuItem<String>(
        value: value,
        child: Text(
          value.tr,
          style: Get.theme.textTheme.bodyMedium!.copyWith(fontSize: 14),
        ),
      );
    }).toList();
  }
}
