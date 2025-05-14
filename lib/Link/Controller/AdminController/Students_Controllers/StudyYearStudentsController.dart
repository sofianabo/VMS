import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vms_school/Link/API/Error_API.dart';
import 'package:vms_school/Link/Model/AdminModel/School_Models/AllDivisionModel.dart';
import 'package:vms_school/Link/Model/AdminModel/Students_Models/AllStudyYearModel.dart';
import 'package:vms_school/Translate/local_controller.dart';
import 'package:vms_school/main.dart';

class StudyYearStudentsController extends GetxController {
  String penaltyIndex = "";
  List<String> penaltyList = [];
  bool isLoading = true;

  List<Students>? stud;
  List<Students>? filteredStudents;
  String sessionIndex = "";
  String gradeIndex = "";
  String classIndex = "";
  String divisionIndex = "";

  String? filterName = '';

  List<String> gradelist = [];
  bool isGradeLoading = true;
  List<String> classlist = [];
  bool isClassLoading = true;
  List<String> divisionlist = [];
  bool isDivisionLoading = true;
  List<String> sessionlist = [];

  initialStateDiag() {
    penaltyIndex = "";
    startdate.value = null;
    enddate.value = null;
    update();
  }

  void clearFilter() {
    searchByName("", gradeIndex, classIndex, divisionIndex);
    update();
  }

  void searchByName(
      String? nameQuery, String? grade, String? classs, String? division) {
    List<Students> tempFilteredList = List.from(stud!);
    filterName = nameQuery;
    if (nameQuery != null && nameQuery.isNotEmpty) {
      tempFilteredList = tempFilteredList.where((cur) {
        final email = cur.email?.toLowerCase() ?? '';
        final name = cur.fullName?.toLowerCase() ?? '';
        final gname = cur.guardians!.name?.toLowerCase() ?? '';
        final guname = cur.guardians!.userName?.toLowerCase() ?? '';
        final gemail = cur.guardians!.email?.toLowerCase() ?? '';
        final gnationalid = cur.guardians!.nationalId?.toLowerCase() ?? '';
        return email.contains(nameQuery.toLowerCase()) ||
            name.contains(nameQuery.toLowerCase()) ||
            gname.contains(nameQuery.toLowerCase()) ||
            guname.contains(nameQuery.toLowerCase()) ||
            gemail.contains(nameQuery.toLowerCase()) ||
            gnationalid.contains(nameQuery.toLowerCase());
      }).toList();
    }

    if (grade != null && grade.isNotEmpty) {
      tempFilteredList = tempFilteredList.where((cur) {
        return cur.grade!.name == grade || cur.grade!.enName == grade;
      }).toList();
    }

    if (classs != null && classs.isNotEmpty) {
      tempFilteredList = tempFilteredList.where((cur) {
        return cur.classes!.enName == classs || cur.classes!.name == classs;
      }).toList();
    }
    if (division != null && division.isNotEmpty) {
      tempFilteredList = tempFilteredList.where((cur) {
        return cur.division!.enName == division ||
            cur.division!.name == division;
      }).toList();
    }

    filteredStudents = tempFilteredList;
    update();
  }

  setGradeList(List<String> value) {
    gradeIndex = "";
    gradelist.clear();
    gradelist = value;
    setGradeLoading(false);
    update();
  }

  setClassList(List<String> value) {
    classIndex = "";
    classlist.clear();
    classlist = value;
    setClassLoading(false);
    update();
  }

  setDivisionList(List<String> value) {
    setDivisionLoading(false);
    divisionlist.clear();
    divisionIndex = "";
    divisionlist = value;
    update();
  }

  setGradeLoading(bool value) {
    isGradeLoading = value;
    update();
  }

  setClassLoading(bool value) {
    isClassLoading = value;
    classIndex = "";
    update();
  }

  setDivisionLoading(bool value) {
    isDivisionLoading = value;
    update();
  }

  resetOnSessionChange() {
    gradeIndex = "";
    classIndex = "";
    setGradeLoading(true);
    divisionIndex = "";
    update();
  }

  resetOnGradeChange() {
    classIndex = "";
    divisionIndex = "";
    print("lkdssdf");
    update();
  }

  resetOnclassChange() {
    divisionIndex = "";
    update();
  }

  void selectIndex(String type, String? index) {
    switch (type) {
      case 'session':
        sessionIndex = index ?? "";
        break;
      case 'grade':
        gradeIndex = index ?? "";
        break;
      case 'class':
        classIndex = index ?? "";
        break;
      case 'division':
        divisionIndex = index ?? "";
        break;
      case 'penalty':
        penaltyIndex = index ?? "";
        break;
    }
    searchByName(filterName, gradeIndex, classIndex, divisionIndex);
    update();
  }

  void setAllStudents(AllStudyYearModel model) {
    stud = model.students!;
    filteredStudents = List.from(stud!);
    searchByName(filterName, gradeIndex, classIndex, divisionIndex);
    setIsLoading(false);
    update();
  }

  setIsLoading(bool value) {
    isLoading = value;
    update();
  }

  void setAllDivision(AllDivisionModel division) {
    divisionlist.clear();
    print(division.division!.length);
    for (int k = 0; k < division.division!.length; k++) {
      if ( Get.find<LocalizationController>().currentLocale.value.languageCode ==
                  'ar')
        divisionlist.add(division.division![k].name.toString());
      else
        divisionlist.add(division.division![k].enName.toString());
    }
    update();
    updateList("division", divisionlist);
  }

  setAllPenalty(List<String> value) {
    penaltyList.clear();
    penaltyList = value;
    update();
  }

  void updateList(String type, List<String> options) {
    switch (type) {
      case 'session':
        sessionlist = options;
        break;
      case 'grade':
        gradelist = options;
        break;
      case 'class':
        classlist = options;
        break;
      case 'division':
        divisionlist = options;
        break;
      case 'penalty':
        penaltyList = options;
        break;
    }
    update();
  }

// الحد الأدنى المسموح (2023)
  final DateTime minAllowedDate = DateTime(2023);
// الحد الأقصى المسموح (السنة الحالية + 4 سنوات)
  final DateTime maxAllowedDate = DateTime(DateTime.now().year + 4, 12, 31);

  Rx<DateTime?> startdate = Rx<DateTime?>(null);
  Rx<DateTime?> enddate = Rx<DateTime?>(null);

  void selectStartDatePenalty(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: startdate.value ?? DateTime.now(),
      firstDate: minAllowedDate,
      lastDate: enddate.value ?? maxAllowedDate,
    );

    if (picked != null) {
      if (enddate.value != null && picked.isAfter(enddate.value!)) {
        // إعادة تعيين التواريخ وعرض خطأ
        startdate.value = null;
        enddate.value = null;

        ErrorMessage("لا يمكن أن يكون تاريخ البداية بعد تاريخ النهاية");
      } else {
        startdate.value = picked;
      }
    }
    update();
  }

  void selectEndDatePenalty(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: enddate.value ?? startdate.value ?? DateTime.now(),
      firstDate: startdate.value ?? minAllowedDate,
      lastDate: maxAllowedDate,
    );

    if (picked != null) {
      if (startdate.value != null && picked.isBefore(startdate.value!)) {
        enddate.value = null;
        Get.snackbar(
          'خطأ',
          'لا يمكن أن يكون تاريخ النهاية قبل تاريخ البداية',
          snackPosition: SnackPosition.BOTTOM,
          duration: Duration(seconds: 3),
        );
      } else if (picked.isBefore(minAllowedDate)) {
        enddate.value = null;

        ErrorMessage("يجب أن يكون التاريخ بعد عام 2023");
      } else if (picked.isAfter(maxAllowedDate)) {
        enddate.value = null;
        Get.snackbar(
          'خطأ',
          'لا يمكن اختيار تاريخ بعد ${maxAllowedDate.year}',
          snackPosition: SnackPosition.BOTTOM,
          duration: Duration(seconds: 3),
        );
      } else {
        enddate.value = picked;
      }
    }
    update();
  }

  String get selectedsessionIndex => sessionIndex;

  String get selectedgradeIndex => gradeIndex;

  String get selectedclassIndex => classIndex;

  String get selecteddivisionIndex => divisionIndex;

  String get selectedPenaltyIndex => penaltyIndex;

  void initialData() {
    isGradeLoading = true;
    gradeIndex = "";
    classIndex = "";
    divisionIndex = "";
    update();
  }
}
