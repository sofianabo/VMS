import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vms_school/Link/Model/AdminModel/AllClassesModel.dart';
import 'package:vms_school/Link/Model/AdminModel/School_Models/QuizType_Model.dart';
import 'package:vms_school/Link/Model/AdminModel/School_Models/Quiz_Type_For_Operation_Model.dart'
    as qtf;
import 'package:vms_school/Translate/local_controller.dart';
import 'package:vms_school/main.dart';

class TeachernoteAndGradeReco extends GetxController {
  AllClassModel? Classmodel;
  AllClassModel? NoneClassmodel;

  bool isQuizTypeLoading = true;
  bool isQuizTypeOpirationLoading = true;
  QuizType_Model? Qt_Model;
  String ClassIndex = "";
  String OperationIndex = "";

  String SemesterIndex = "The First Semester";
  int SemesterSendIndex = 1;
  var columnWidths = [].obs;

  List<String> ClassList = [];
  List<String> SemesterList = [
    "The First Semester",
    "The Second Semester",
    "The Third Semester",
  ];

  List<String> OperationList = [
    "Sum",
    "Average",
  ];

  bool isClassLoading = true;
  bool isClassDialogLoading = true;

  var groups = <Map<String, dynamic>>[].obs;
  var items = [].obs;

  var currentPage = 0.obs;
  PageController pageController = PageController();

  void goToPage(int page) {
    if (page == 0) {
      resetSelections();
    }
    currentPage.value = page;
    pageController.animateToPage(
      page,
      duration: Duration(milliseconds: 500),
      curve: Curves.easeInOut,
    );
  }

  SetIsQuizType(bool value) {
    isQuizTypeLoading = value;
    update();
  }

  SetIsQuizType_For_Opiration(bool value) {
    isQuizTypeOpirationLoading = value;
    update();
  }

  SetisClassDialogLoading(bool value) {
    isClassDialogLoading = value;
    update();
  }

  void updateGroup(QuizType_Model quizTypeModel) {
    groups.clear();
    columnWidths.clear();

    if (quizTypeModel.type != null) {
      for (var type in quizTypeModel.type!) {
        var groupIndex = groups.indexWhere((group) => group['id'] == type.id);
        var typeMap = {
          'id': type.id,
          'name': type.name,
          'ratio': type.ratio,
          'size': type.size,
          'items': type.items
              ?.map((item) => {
                    'id': item.id,
                    'name': item.name,
                    'ratio': item.ratio,
                    'isQuizable': item.isQuizable == 0 ? false : true,
                  })
              .toList(),
        };

        if (groupIndex != -1) {
          groups[groupIndex] = typeMap;
        } else {
          groups.add(typeMap);
        }
        columnWidths.add(type.size ?? 100);
      }
      Qt_Model = quizTypeModel;
    }

    isQuizTypeLoading = false;
    update();
  }

  void updateItemName(int idx, String newName) {
    items[idx]['name'] = newName;
    update();
  }

  void updateItemRatio(int idx, double newRatio) {
    items[idx]['ratio'] = newRatio;
    update();
  }

  void SetItems(item) {
    items.clear();
    items.addAll(item);
    update();
  }

  void UpdateGroupItems({
    required int idx,
    int? id,
    required double size,
    required String groupName,
    required double ratioValue,
    required List<Map<String, dynamic>> items,
  }) {
    groups[idx] = {
      'id': id,
      'name': groupName,
      'ratio': ratioValue,
      'items': items,
      'size': size,
    };
    update();
  }

  Add_Items(
      {required String name, required String ratio, required bool IsQuizable}) {
    double? ratioValue = double.tryParse(ratio);
    if (ratioValue != null) {
      items.add({
        'id': null,
        "name": name,
        "ratio": ratioValue,
        "isQuizable": IsQuizable,
      });
      update();
    } else {
      Get.snackbar("خطأ", "قيمة النسبة غير صالحة");
    }
  }

  void updateGroups(List<Map<String, dynamic>> updatedGroups) {
    groups.assignAll(updatedGroups);
    update();
  }

  RemoveItem(int idx) {
    items.removeAt(idx);
    update();
  }

  void EditItem(
      {required int idx,
      required String name,
      required String ratio,
      required bool IsQuizable}) {
    double? ratioValue = double.tryParse(ratio);
    if (ratioValue != null) {
      items[idx] = {
        'id': items[idx]['id'],
        "name": name,
        "ratio": ratioValue,
        "isQuizable": IsQuizable,
      };
      update();
    } else {
      Get.snackbar("خطأ", "قيمة النسبة غير صالحة");
    }
  }

  RemoveGroup(int idx) {
    groups.removeAt(idx);
    update();
  }

  Add_Groub(String name, String ratio, List<Map<String, dynamic>> newItems) {
    int newGroupIndex = groups.length;

    groups.add({
      'id': null,
      "name": name,
      "ratio": double.parse(ratio),
      "size": 100.0,
      "items": List.from(newItems),
    });

    columnWidths.add(100.0);
    update();
  }

  void updateGroupSizes() {
    for (int i = 0; i < groups.length; i++) {
      groups[i]["size"] = double.parse(columnWidths[i].toStringAsFixed(2));
    }
  }

  void resizeColumn(int index, double delta) {
    if (columnWidths[index] + delta >= 80.0 &&
        columnWidths[index] + delta <= 800.0) {
      columnWidths[index] += delta;
      updateGroupSizes();
    }
  }

  pri() {
    print(groups);
  }

  SetClass(AllClassModel ClassModel) {
    List<String> classess = [];
    if (ClassModel.classes != null) {
      for (var g in ClassModel.classes!) {
        if (prefs!.getString(languageKey) == 'ar')
          classess.add(g.name.toString());
        else
          classess.add(g.enName.toString());
      }
    }

    Classmodel = ClassModel;
    ClassList = classess;
    isClassLoading = false;
    update();
  }

  SetNoneClass(AllClassModel ClassModel) {
    NoneClassmodel = ClassModel;

    selectedClasses.clear();
    var classItem = ClassModel.classes?.firstWhereOrNull(
      (element) => element.name == ClassIndex || element.enName == ClassIndex,
    );

    if (classItem != null) {
      selectedClasses.add(classItem.id.toString());
    }

    isClassDialogLoading = false;
    update();
  }

  setIsClassLoading(bool value) {
    isClassLoading = value;
    update();
  }

  void selectIndex(String type, String? index) {
    switch (type) {
      case 'semester':
        SemesterIndex = index ?? "";
        break;
      case 'class':
        ClassIndex = index ?? "";
        break;
      case 'operation':
        OperationIndex = index ?? "";
        break;
    }

    update();
  }

  void updateList(String type, List<String> options) {
    switch (type) {
      case 'semester':
        ClassList = options;
        break;
      case 'class':
        SemesterList = options;
        break;
      case 'operation':
        OperationList = options;
        break;
    }
    update();
  }

  String get selectedClass => ClassIndex;
  String get selectedSemester => SemesterIndex;
  String get selectedOperationIndex => OperationIndex;

  void set_semesteridx(int i) {
    SemesterSendIndex = i;
    update();
  }

  List<String> selectedClasses = [];

  void toggleClassSelection(String classId) {
    var selectedClassItem = NoneClassmodel?.classes?.firstWhereOrNull(
      (element) => element.name == ClassIndex || element.enName == ClassIndex,
    );

    if (selectedClassItem == null ||
        selectedClassItem.id.toString() == classId) {
      return;
    }

    if (selectedClasses.contains(classId)) {
      selectedClasses.remove(classId);
    } else {
      selectedClasses.add(classId);
    }

    update();
  }

  qtf.Type? selectedType;
  List<int> selectedTypeIds = [];
  void resetSelections() {
    selectedType = null;
    selectedTypeIds.clear();
    update();
  }

  void selectType(qtf.Type type) {
    OperationIndex = type.operationType ?? "";
    selectedTypeIds.clear();
    selectedType = type;

    if (type.quizTypes != null && type.quizTypes!.isNotEmpty) {
      for (var quizType in type.quizTypes!) {
        if (!selectedTypeIds.contains(quizType.id)) {
          selectedTypeIds.add(quizType.id!);
        }
      }
    }
    update();
  }

  qtf.Quiz_Type_For_Operation_Model? qtfModel;

  void SetIsQuizType_For_OpirationData(
      qtf.Quiz_Type_For_Operation_Model quiz_type_for_operation_model) {
    qtfModel = quiz_type_for_operation_model;
    isQuizTypeOpirationLoading = false;
    update();
  }

 
}
