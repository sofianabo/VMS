import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vms_school/Link/Model/AdminModel/School_Models/AllClassesModel.dart';
import 'package:vms_school/Link/Model/AdminModel/School_Models/AllSemesterModel.dart';
import 'package:vms_school/Link/Model/AdminModel/School_Models/DropDownCuriculmModel.dart';
import 'package:vms_school/Link/Model/AdminModel/School_Models/ExamTableModel.dart';
import 'package:vms_school/Link/Model/AdminModel/School_Models/ExamTypeModel.dart';
import 'package:vms_school/Translate/local_controller.dart';
import 'package:vms_school/main.dart';

class ExamTableController extends GetxController {
  String examTypeIndex = "";
  String examClassIndex = "";
  String examSeasonIndex = "";
  String typeDialogIndex = "";
  String curiculmDialogIndex = "";
  String classDialogIndex = "";
  String semesterDialogIndex = "";

  List<String> examType = [];
  List<String> examClass = [];
  List<String> examSeason = [];
  List<String> typeDialogList = [];
  List<String> curiculmDialogList = [];
  List<String> classDialogList = [];
  List<String> semesterDialogList = [];

  bool isCuriculmLoading = true;
  bool isLoading = true;
  bool issemesterLoading = true;
  bool isTypeLoading = true;
  bool isClassLoading = true;

  setClassIndex() {
    examClassIndex = '';
    update();
  }

  setisTypeLoading(bool value) {
    examTypeIndex = "";
    typeDialogIndex = "";
    isTypeLoading = value;
    update();
  }

  setSemesterIndex() {
    examSeasonIndex = '';
    examTypeIndex = '';
    examType = [];
    update();
  }

  setIsClassLoading(bool value) {
    isClassLoading = value;
    update();
  }

  List<Quiz> quizList = [];
  List<Classes> Allclass = [];
  List<Semester> allSemester = [];
  List<Quiz>? filteredquiz;

  void initType() {
    typeDialogIndex = "";

    typeDialogList = [];
    update();
  }

  void initialData() {
    typeDialogIndex = "";
    curiculmDialogIndex = "";
    classDialogIndex = "";
    semesterDialogIndex = "";
    typeDialogList = [];
    curiculmDialogList = [];
    dateindex.value = null;
    update();
  }

  void setAllQuiz(ExamTableModel model) {
    quizList.clear();
    quizList = model.quiz!;
    filteredquiz = model.quiz!;
    setIsLoading(false);
    if (examSeasonIndex.isNotEmpty) {
      filteredquiz = filteredquiz!.where((emp) {
        return emp.semester!.name == examSeasonIndex ||
            emp.semester!.enName == examSeasonIndex;
      }).toList();
    }
    if (examTypeIndex.isNotEmpty) {
      filteredquiz = filteredquiz!.where((emp) {
        return emp.type! == examTypeIndex;
      }).toList();
    }
    if (examClassIndex.isNotEmpty) {
      filteredquiz = filteredquiz!.where((emp) {
        return emp.classese!.name == examClassIndex ||
            emp.type! == examClassIndex;
      }).toList();
    }

    update();
  }

  void clearFilter() {
    searchRequestByName(examSeasonIndex, examTypeIndex, examClassIndex);
    update();
  }

  void searchRequestByName(String semseter, String type, String classes) {
    List<Quiz> tempFilteredList = List.from(quizList);

    if (semseter.isNotEmpty) {
      tempFilteredList = tempFilteredList.where((emp) {
        return emp.semester!.enName!.toLowerCase() == semseter.toLowerCase() ||
            emp.semester!.name!.toLowerCase() == semseter.toLowerCase();
      }).toList();
    }
    if (type.isNotEmpty) {
      tempFilteredList = tempFilteredList.where((emp) {
        return emp.type!.toLowerCase() == type.toLowerCase();
      }).toList();
    }
    if (classes.isNotEmpty) {
      tempFilteredList = tempFilteredList.where((emp) {
        return emp.classese!.enName!.toLowerCase() == classes.toLowerCase() ||
            emp.classese!.name!.toLowerCase() == classes.toLowerCase();
      }).toList();
    }

    filteredquiz = tempFilteredList;
    update();
  }

  setIsLoading(bool value) {
    isLoading = value;
    update();
  }

  void selectIndex(String type, String? index) {
    switch (type) {
      case 'type':
        examTypeIndex = index ?? "";
        break;
      case 'class':
        examClassIndex = index ?? "";
        break;
      case 'season':
        examSeasonIndex = index ?? "";
        break;
      case 'typeDialog':
        typeDialogIndex = index ?? "";
        break;
      case 'curiculmDialog':
        curiculmDialogIndex = index ?? "";
        break;
      case 'classDialog':
        classDialogIndex = index ?? "";
        break;
      case 'semesterDialog':
        semesterDialogIndex = index ?? "";
        break;
    }
    searchRequestByName(examSeasonIndex, examTypeIndex, examClassIndex);

    update();
  }

  void setAllTypes(AllExamTypeModel types) {
    examType.clear();
    for (int j = 0; j < types.type!.length; j++) {
      examType.add(types.type![j].name.toString());
    }
    update();
    updateList("type", examType);
  }

  void setAllTypesDialog(AllExamTypeModel types) {
    typeDialogList.clear();
    for (int j = 0; j < types.type!.length; j++) {
      typeDialogList.add(types.type![j].name.toString());
    }
    update();
    updateList("typeDialog", typeDialogList);
  }

  void setAllClasses(AllClassModel clas) {
    examClass.clear();
    for (int j = 0; j < clas.classes!.length; j++) {
      if (Get.find<LocalizationController>().currentLocale.value.languageCode ==
          'ar')
        examClass.add(clas.classes![j].name.toString());
      else
        examClass.add(clas.classes![j].enName.toString());
    }
    update();
    updateList("class", examClass);
  }

  void setAllClassesDialog(AllClassModel clas) {
    classDialogList.clear();
    Allclass = clas.classes!;
    for (int j = 0; j < clas.classes!.length; j++) {
      if (Get.find<LocalizationController>().currentLocale.value.languageCode ==
          'ar')
        classDialogList.add(clas.classes![j].name.toString());
      else
        classDialogList.add(clas.classes![j].enName.toString());
    }
    update();
    updateList("classDialog", classDialogList);
  }

  setCuriculmLoading(bool value) {
    isCuriculmLoading = value;
    update();
  }

  void setAllSeason(AllSemesterModel semster) {
    examSeason.clear();
    semesterDialogList.clear();
    allSemester = semster.semester!;
    for (int l = 0; l < semster.semester!.length; l++) {
      if (Get.find<LocalizationController>().currentLocale.value.languageCode ==
          'ar') {
        semesterDialogList.add(semster.semester![l].name.toString());
        examSeason.add(semster.semester![l].name.toString());
      } else {
        semesterDialogList.add(semster.semester![l].enName.toString());
        examSeason.add(semster.semester![l].enName.toString());
      }
    }

    update();
    updateList("season", examSeason);
    updateList("semesterDialog", semesterDialogList);
  }

  void setAllCuriculm(DropDowmCuriculmModel model) {
    curiculmDialogList.clear();
    for (int l = 0; l < model.curriculum!.length; l++) {
      if (Get.find<LocalizationController>().currentLocale.value.languageCode ==
          'ar')
        curiculmDialogList.add(model.curriculum![l].name.toString());
      else
        curiculmDialogList.add(model.curriculum![l].enName.toString());
    }
    update();
    updateList("curiculmDialog", curiculmDialogList);
  }

  bool IsclassError = false;
  bool IscurrError = false;
  bool IssemesterError = false;
  bool IstypeError = false;
  bool ISmaxError = false;
  bool ISminError = false;
  bool ISperiodError = false;
  bool ISdateError = false;
  void updateFieldError(String type, bool newValue) {
    switch (type) {
      case 'class':
        IsclassError = newValue;
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
    }
    update();
  }

  void updateList(String type, List<String> options) {
    switch (type) {
      case 'type':
        examType = options;
        break;
      case 'class':
        examClass = options;
        break;
      case 'season':
        examSeason = options;
        break;
      case 'typeDialog':
        typeDialogList = options;
        break;
      case 'curiculmDialog':
        curiculmDialogList = options;
        break;
      case 'classDialog':
        classDialogList = options;
        break;
      case 'semesterDialog':
        semesterDialogList = options;
        break;
    }
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

  String get selectedExamType => examTypeIndex;

  String get selectedExamClass => examClassIndex;

  String get selectedExamSeason => examSeasonIndex;
  String get selectedTypeDialog => typeDialogIndex;
  String get selectedClassDailog => classDialogIndex;
  String get selectedCuriculmDialog => curiculmDialogIndex;
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

  void setisCurriculmLoading(bool bool) {
    curiculmDialogIndex = "";
    isCuriculmLoading = bool;
    update();
  }
}
