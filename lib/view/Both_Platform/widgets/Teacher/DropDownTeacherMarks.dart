import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vms_school/Link/API/AdminAPI/School/School_DropDown/DropdownDivisionAPI.dart';
import 'package:vms_school/Link/API/AdminAPI/School/School_Screen_APIs/Curriculm_API/Get_All_Curriculm.dart';
import 'package:vms_school/Link/API/AdminAPI/Students/Students_APIs/Get_Quiz_Marks.dart';
import 'package:vms_school/Link/API/Teacher_API/GetCurriculumTeacherAPI.dart';
import 'package:vms_school/Link/API/Teacher_API/GetStudentMarks_TeacherAPI.dart';
import 'package:vms_school/Link/API/Teacher_API/GetTeacherDivisionMarksAPI.dart';
import 'package:vms_school/Link/Controller/AdminController/Location_controller.dart';
import 'package:vms_school/Link/Controller/AdminController/Students_Controllers/Students_Marks_Controller.dart';
import 'package:vms_school/Link/Controller/Teacher_Controller/StudentMarks_TeacherController.dart';
import 'package:vms_school/Link/Controller/WidgetController/DropDown_Controllers/DropDownClassesController.dart';
import 'package:vms_school/Link/Controller/WidgetController/DropDown_Controllers/DropDownCurriculumn_Controller.dart';
import 'package:vms_school/Link/Controller/WidgetController/DropDown_Controllers/DropDownDivisionController.dart';

class Dropdownteachermarks extends StatelessWidget {
  final double width;
  final String title;
  final String type;
  final Color? color;
  final bool isLoading;
  final bool? isDisabled;

  const Dropdownteachermarks({
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
    return GetBuilder<StudentmarksTeachercontroller>(builder: (cont) {
      String? selectedValue;

      switch (type) {
        case 'Class':
          if (cont.Classlist.contains(cont.ClassIndex)) {
            selectedValue = cont.ClassIndex;
          }
          break;
        case 'Division':
          if (cont.Divisionlist.contains(cont.DivisionIndex)) {
            selectedValue = cont.DivisionIndex;
          }
          break;
        case 'Semester':
          if (cont.Semesterlist.contains(cont.SemesterIndex)) {
            selectedValue = cont.SemesterIndex;
          }
          break;
        case 'Curriculum':
          if (cont.Curriculumlist.contains(cont.CurriculumIndex)) {
            selectedValue = cont.CurriculumIndex;
          }
          break;
      }

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
                                Getteacherdivisionmarksapi(context)
                                    .Getteacherdivisionmarks(
                                        cont.Classlist.indexOf(newValue), 0);
                              }
                              if (type == 'Division') {
                                Getcurriculumteacherapi(context)
                                    .Getcurriculumteacher(
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
                                GetstudentmarksTeacherapi().GetstudentmarksTeacher(
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
                                    DivisionId: Get.find<
                                            StudentmarksTeachercontroller>()
                                        .alldivision[cont.Divisionlist.indexOf(
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
                                  Getcurriculumteacherapi(context)
                                      .Getcurriculumteacher(
                                    Semesterid: cont.semesterId,
                                    classId:
                                        Get.find<Dropdownclassescontroller>()
                                            .Allclass[cont.Classlist.indexOf(
                                                cont.ClassIndex)]
                                            .id
                                            .toString(),
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

  List<String> _getListByType(StudentmarksTeachercontroller cont) {
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

  List<DropdownMenuItem<String>> _getDropdownItems(
      StudentmarksTeachercontroller cont) {
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
