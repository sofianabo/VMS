import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vms_school/Link/Model/AdminModel/AllClassesModel.dart';
import 'package:vms_school/Link/Model/AdminModel/AllDivisionModel.dart';
import 'package:vms_school/Link/Model/AdminModel/AllSemesterModel.dart';
import 'package:vms_school/Link/Model/AdminModel/DropDownCuriculmModel.dart';
import 'package:vms_school/Link/Model/AdminModel/ExamTableModel.dart';
import 'package:vms_school/Link/Model/AdminModel/ExamTypeModel.dart';

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

  List<Quiz> quizList = [];
  List<Classes> Allclass = [];
  List<Semester> allSemester = [];

  void setAllQuiz(ExamTableModel model) {
    quizList.clear();
    quizList = model.quiz!;
        setIsLoading(false);

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
    update();
  }

  void setAllTypes(AllExamTypeModel types) {
    examType.clear();
    for (int j = 0; j < types.type!.length; j++) {
      examType.add(types.type![j].enName.toString());
    }
    update();
    updateList("type", examType);
  }

  void setAllSemesterDialog(AllSemesterModel sem) {
    semesterDialogList.clear();
    allSemester = sem.semester!;
    for (int j = 0; j < sem.semester!.length; j++) {
      semesterDialogList.add(sem.semester![j].enName.toString());
    }
    update();
    updateList("semesterDialog", semesterDialogList);
  }

  void setAllTypesDialog(AllExamTypeModel types) {
    typeDialogList.clear();
    for (int j = 0; j < types.type!.length; j++) {
      typeDialogList.add(types.type![j].enName.toString());
    }
    update();
    updateList("typeDialog", typeDialogList);
  }

  void setAllClasses(AllClassModel clas) {
    examClass.clear();
    for (int j = 0; j < clas.classes!.length; j++) {
      examClass.add(clas.classes![j].enName.toString());
    }
    update();
    updateList("class", examClass);
  }

  void setAllClassesDialog(AllClassModel clas) {
    classDialogList.clear();
    Allclass = clas.classes!;
    for (int j = 0; j < clas.classes!.length; j++) {
      classDialogList.add(clas.classes![j].enName.toString());
    }
    update();
    updateList("classDialog", classDialogList);
  }

  // setClassList(List<String> value) {
  //   classDialogIndex = "";
  //   classDialogList.clear();
  //   classDialogList = value;
  //   setCuriculmLoading(false);
  //   update();
  // }

  setCuriculmLoading(bool value) {
    isCuriculmLoading = value;
    update();
  }

  

  void setAllSeason(AllSemesterModel semster) {
    examSeason.clear();
    for (int l = 0; l < semster.semester!.length; l++) {
      examSeason.add(semster.semester![l].enName.toString());
    }
    update();
    updateList("season", examSeason);
  }

  void setAllCuriculm(DropDowmCuriculmModel model) {
    for (int l = 0; l < model.curriculum!.length; l++) {
      curiculmDialogList.add(model.curriculum![l].name.toString());
    }
    update();
    updateList("curiculmDialog", curiculmDialogList);
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
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
    );
    if (picked != null) {
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
}
