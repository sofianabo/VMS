import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vms_school/Link/API/AdminAPI/School/School_DropDown/DropdownClassesAPI.dart';
import 'package:vms_school/Link/API/AdminAPI/School/School_DropDown/DropdownDivisionAPI.dart';
import 'package:vms_school/Link/Controller/AdminController/Students_Controllers/AllStudentsController.dart';
import 'package:vms_school/Link/Controller/WidgetController/DropDown_Controllers/DropDownGradeController.dart.dart';
import 'package:vms_school/Link/Controller/WidgetController/DropDown_Controllers/Sessions_DropDown_Controller.dart';
import 'package:vms_school/Link/Model/AdminModel/School_Models/AllDivisionModel.dart';

class DropDownAllStudents extends StatelessWidget {
  final double width;
  final String title;
  final String type;
  final Color? color;
  bool isDisabled;
  bool isLoading;
  DropDownAllStudents({
    super.key,
    required this.title,
    this.color,
    this.isDisabled = false,
    this.isLoading = false,
    required this.width,
    required this.type,
  });

  @override
  Widget build(BuildContext context) {
    return GetBuilder<Allstudentscontroller>(builder: (cont) {
      String selectedValue = "";

      switch (type) {
        case 'session':
          selectedValue = cont.selectedsessionIndex.isNotEmpty
              ? cont.selectedsessionIndex
              : title;

          break;
        case 'grade':
          selectedValue = cont.selectedgradeIndex.isNotEmpty
              ? cont.selectedgradeIndex
              : title;
          break;
        case 'class':
          selectedValue = cont.selectedclassIndex.isNotEmpty
              ? cont.selectedclassIndex
              : title;

          break;
        case 'division':
          selectedValue = cont.selecteddivisionIndex.isNotEmpty
              ? cont.selecteddivisionIndex
              : title;
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
                    title,
                    style: const TextStyle(color: Colors.grey),
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
                            if (newValue != null && newValue != title) {
                              cont.selectIndex(type, newValue);
                              if (type == 'grade') {
                                if (newValue != title) {
                                  cont.resetOnGradeChange();
                                  Getallclassapi.getAllClasses(
                                    sessionID: Get.find<
                                            All_Screen_Sessions_Controller>()
                                        .sessionId,
                                    Gradeid: Get.find<Dropdowngradecontroller>()
                                        .gradess!
                                        .grades!
                                        .firstWhere((grad) =>
                                            grad.enName == newValue ||
                                            grad.name == newValue)
                                        .id,
                                  );
                                }
                              }
                              if (type == 'class') {
                                if (newValue != title) {
                                  AllDivisionModel division =
                                      Dropdowndivisionapi(context)
                                          .Dropdowndivision(
                                              cont.classlist.indexOf(newValue),
                                              0);
                                  cont.setAllDivision(division);
                                }
                              }
                            }
                          },
                          dropdownColor: Theme.of(context).cardColor,
                          iconDisabledColor: Colors.grey,
                          iconEnabledColor: Theme.of(context).cardColor,
                          value: selectedValue,
                          isExpanded: true,
                          underline: const SizedBox(),
                          icon: selectedValue.isNotEmpty &&
                                  selectedValue != title
                              ? GestureDetector(
                                  onTap: () {
                                    cont.selectIndex(type, "");
                                    if (type == "grade") {
                                      cont.resetOnGradeChange();
                                    }
                                    cont.searchByName(
                                        cont.filterName,
                                        cont.gradeIndex,
                                        cont.classIndex,
                                        cont.divisionIndex);
                                    cont.update();
                                  },
                                  child: Icon(
                                    Icons.close,
                                    color:
                                        Theme.of(context).secondaryHeaderColor,
                                  ),
                                )
                              : Icon(
                                  Icons.arrow_drop_down,
                                  color: Theme.of(context).secondaryHeaderColor,
                                ),
                          style: Theme.of(context)
                              .textTheme
                              .bodyMedium!
                              .copyWith(fontSize: 14),
                          items: [
                            DropdownMenuItem<String>(
                              value: title,
                              child: Text(
                                title.tr,
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyMedium!
                                    .copyWith(
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
      );
    });
  }

  List<DropdownMenuItem<String>> _getDropdownItems(
      Allstudentscontroller cont, BuildContext context) {
    List<DropdownMenuItem<String>> items = [];
    String sessionSelected = "";
    String gradeSelected = "";
    String classSelected = "";
    String divisionSelected = "";

    switch (type) {
      case 'grade':
        items.addAll(cont.gradelist.map((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Text(
              value,
              style: Theme.of(context)
                  .textTheme
                  .bodyMedium!
                  .copyWith(fontSize: 14),
            ),
          );
        }).toList());
        break;
      case 'class':
        items.addAll(cont.classlist.map((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Text(
              value,
              style: Theme.of(context)
                  .textTheme
                  .bodyMedium!
                  .copyWith(fontSize: 14),
            ),
            onTap: () async {
              classSelected = value;
            },
          );
        }).toList());
        break;
      case 'division':
        items.addAll(cont.divisionlist.map((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Text(
              value,
              style: Theme.of(context)
                  .textTheme
                  .bodyMedium!
                  .copyWith(fontSize: 14),
            ),
            onTap: () async {
              divisionSelected = value;
            },
          );
        }).toList());
        break;
    }

    return items;
  }
}
