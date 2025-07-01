import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vms_school/Link/Model/AdminModel/School_Models/AllSemesterModel.dart';
import 'package:vms_school/Link/Model/AdminModel/School_Models/Curriculum_Model.dart';
import 'package:vms_school/Link/Model/AdminModel/School_Models/ExamTypeModel.dart';
import 'package:vms_school/Link/Model/LMS_Model/AllQuizLmsModel.dart';

import 'package:vms_school/Link/Model/LMS_Model/PagesLmsModel.dart';
import 'package:vms_school/Translate/local_controller.dart';

class Allquizcontroller extends GetxController {
  List<QuizLms>? quizLMS;
  List<QuizLms> filtered_quizLMS = [];

  String currindex = "";
  String typeDialogIndex = "";
  String semesterDialogIndex = "";
  String dialog_currIndex = "";

  List<String> typeDialogList = [];

  List<String> semesterDialogList = [];
  List<String> currList = [];
  List<String> dialogCurrList = [];

  String? filterName = '';

  bool issemesterLoading = true;
  bool isTypeLoading = true;
  bool isClassLoading = true;
  void clearFilter() {
    searchByName("", currindex);
    update();
  }

  setIsClassLoading(bool value) {
    isClassLoading = value;
    update();
  }

  void initType() {
    typeDialogIndex = "";

    typeDialogList = [];
    update();
  }

  void initialData() {
    typeDialogIndex = "";
    dialog_currIndex = "";
    semesterDialogIndex = "";
    typeDialogList = [];
    dialogCurrList = [];
    dateindex.value = null;
    update();
  }

  void Add_Quiz(QuizLms cthc) {
    quizLMS!.insert(0, cthc);
    filtered_quizLMS = List.from(quizLMS!);

    if (filterName != null && filterName!.isNotEmpty) {
      searchByName(filterName.toString(), currindex);
    }

    update();
  }

  void Update_Quiz(QuizLms updatedQuiz, int index) {
    if (quizLMS == null || index < 0 || index >= quizLMS!.length) return;

    // تحديث العنصر في القائمة الأصلية
    quizLMS![index] = updatedQuiz;

    // تحديث القائمة المصفاة
    filtered_quizLMS = List.from(quizLMS!);

    // إذا كان هناك بحث فعال، قم بإعادة تطبيقه
    if (filterName != null && filterName!.isNotEmpty) {
      searchByName(filterName.toString(), currindex);
    }

    update(); // إشعار GetX بالتحديث
  }

  void Delete_Quiz(QuizLms cthc) {
    quizLMS!.remove(cthc);
    filtered_quizLMS = List.from(quizLMS!);
    if (filterName != null && filterName!.isNotEmpty) {
      searchByName(filterName.toString(), currindex);
    }
    update();
  }

  void searchByName(String? nameQuery, String? curiculumName) {
    filterName = nameQuery;
    List<QuizLms> tempFilteredList = List.from(quizLMS!);

    if (nameQuery != null && nameQuery.isNotEmpty) {
      tempFilteredList = tempFilteredList.where((cur) {
        final curName = cur.name?.toLowerCase() ?? '';
        return curName.contains(nameQuery.toLowerCase());
      }).toList();
    }

    if (curiculumName != null && curiculumName.isNotEmpty) {
      tempFilteredList = tempFilteredList.where((cur) {
        return cur.curriculumName! == curiculumName ||
            cur.curriculumEnName! == curiculumName;
      }).toList();
    }

    filtered_quizLMS = tempFilteredList;
    update();
  }

  bool isLoading = true;

  RxString fileName = "".obs;

  void selectIndex(String type, String? index) {
    switch (type) {
      case 'curriculum':
        currindex = index ?? "";
        break;
      case 'curiculmDialog':
        dialog_currIndex = index ?? "";
        break;
      case 'typeDialog':
        typeDialogIndex = index ?? "";
        break;
      case 'semesterDialog':
        semesterDialogIndex = index ?? "";
        break;
    }
    searchByName(
      filterName,
      currindex,
    );
    update();
  }

  bool isCuriculmLoading = false;
  bool isCuriculmDialogLoading = false;

  void setisCurriculmLoading(bool bool) {
    isCuriculmLoading = bool;
    update();
  }

  void setisCurriculmDialogLoading(bool bool) {
    isCuriculmDialogLoading = bool;
    update();
  }

  setisTypeLoading(bool value) {
    // semesterDialogIndex = "";
    // typeDialogIndex = "";
    isTypeLoading = value;
    update();
  }

  void setAllTypesDialog(AllExamTypeModel types) {
    typeDialogList.clear();
    for (int j = 0; j < types.type!.length; j++) {
      typeDialogList.add(types.type![j].name.toString());
    }
    update();
    updateList("typeDialog", typeDialogList);
  }

  void setAllSeason(AllSemesterModel semster) {
    semesterDialogList.clear();

    for (int l = 0; l < semster.semester!.length; l++) {
      if (Get.find<LocalizationController>().currentLocale.value.languageCode ==
          'ar') {
        semesterDialogList.add(semster.semester![l].name.toString());
      } else {
        semesterDialogList.add(semster.semester![l].enName.toString());
      }
    }

    update();
    updateList("semesterDialog", semesterDialogList);
  }

  setCurriculum(Curriculum_Model curruculum) {
    currList.clear();
    for (int i = 0; i < curruculum.curriculum!.length; i++) {
      currList.add(
          Get.find<LocalizationController>().currentLocale.value.languageCode ==
                  'ar'
              ? curruculum.curriculum![i].name!
              : curruculum.curriculum![i].enName!);
    }
    updateList("curriculum", currList);
    setisCurriculmLoading(false);

    update();
  }

  setCurriculumialog(Curriculum_Model curruculum) {
    dialogCurrList.clear();
    for (int i = 0; i < curruculum.curriculum!.length; i++) {
      dialogCurrList.add(
          Get.find<LocalizationController>().currentLocale.value.languageCode ==
                  'ar'
              ? curruculum.curriculum![i].name!
              : curruculum.curriculum![i].enName!);
    }
    updateList("curiculmDialog", dialogCurrList);
    setisCurriculmDialogLoading(false);

    update();
  }

  void SetQuizLms(AllQuizLmsModel links) {
    quizLMS = links.quizLms;

    filtered_quizLMS = List.from(quizLMS!);

    if (filterName != null && filterName!.isNotEmpty) {
      searchByName(filterName.toString(), currindex);
    }

    if (currindex.isNotEmpty) {
      filtered_quizLMS = filtered_quizLMS.where((emp) {
        return emp.curriculumName! == currindex ||
            emp.curriculumEnName! == currindex;
      }).toList();
    }

    SetIsLoading(false);
    update();
  }

  void updateList(String type, List<String> options) {
    switch (type) {
      case 'curriculum':
        currList = options;
        break;
      case 'curiculmDialog':
        dialogCurrList = options;
        break;

      case 'typeDialog':
        typeDialogList = options;
        break;

      case 'semesterDialog':
        semesterDialogList = options;
        break;
    }
    update();
  }

  bool IsclassError = false;
  bool IscurrError = false;
  bool IssemesterError = false;
  bool IstypeError = false;
  bool ISmaxError = false;
  bool ISminError = false;
  bool ISperiodError = false;
  bool ISdateError = false;
  String get selectCurrIndex => currindex;

  String get selectdialog_CurrIndex => dialog_currIndex;

  void SetIsLoading(bool value) {
    isLoading = value;
    update();
  }

  Rx<DateTime?> dateindex = Rx<DateTime?>(null);
  void selectDateIndex(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: dateindex.value ?? DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime(DateTime.now().year + 2),
    );
    if (picked != null) {
      updateFieldError("date", false);
      dateindex.value = picked;
    }
  }

  String get selectedTypeDialog => typeDialogIndex;
  String get selectedSemesterDialog => semesterDialogIndex;
  Rx<DateTime?> get selectedexamDate => dateindex;

  void setisSemesterLoading(bool bool) {
    issemesterLoading = bool;
    update();
  }

  void setisClassLoading(bool bool) {
    isClassLoading = bool;
    update();
  }

  SetEditDatetime(String Date) {
    dateindex.value = DateTime.parse(Date);
    update();
  }

  bool IsAnameError = false;
  bool iscurrError = false;
  bool isPageError = false;

  void updateFieldError(String type, bool newValue) {
    switch (type) {
      case 'class':
        IsclassError = newValue;
        break;
      case 'name':
        IsAnameError = newValue;
        break;
      case 'curr':
        IscurrError = newValue;
        break;
      case 'semester':
        IssemesterError = newValue;
        break;
      case 'type':
        IstypeError = newValue;
        break;
      case 'max':
        ISmaxError = newValue;
        break;
      case 'min':
        ISminError = newValue;
        break;
      case 'per':
        ISperiodError = newValue;
        break;
      case 'date':
        ISdateError = newValue;
        break;

      default:
        print("Error: Invalid type");
    }
    update();
  }

  int Hidden = 0;
  updateHid(int value) {
    Hidden = value;
    update();
  }

  void reset() {
    Hidden = 0;
    dialog_currIndex = "";
    semesterDialogIndex = "";
    dateindex.value = null;

    update();
  }

  void resetError() {
    IsAnameError = false;
    iscurrError = false;
    isPageError = false;
    update();
  }
}
