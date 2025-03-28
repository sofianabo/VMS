import 'package:get/get.dart';
import 'package:vms_school/Link/Model/AdminModel/AllClassesModel.dart';
import 'package:vms_school/Link/Model/AdminModel/School_Models/QuizType_Model.dart';
import 'package:vms_school/Translate/local_controller.dart';
import 'package:vms_school/main.dart';

class TeachernoteAndGradeReco extends GetxController {
  AllClassModel? Classmodel;
  AllClassModel? NoneClassmodel;

  bool isQuizTypeLoading = true;
  QuizType_Model? Qt_Model;
  String ClassIndex = "";

  String SemesterIndex = "The First Semester";
  int SemesterSendIndex = 1;
  var columnWidths = [].obs;
  List<String> ClassList = [];
  List<String> SemesterList = [
    "The First Semester",
    "The Second Semester",
    "The Third Semester",
  ];
  bool isClassLoading = true;
  bool isClassDialogLoading = true;

  var groups = <Map<String, dynamic>>[].obs;
  var items = [].obs;
  var selectedItemsForSum = <String>[].obs;

  void updateSelectedItems(List<String> selected) {
    selectedItemsForSum.assignAll(selected);
    update();
  }

  // لتخزين العناصر المختارة لكل Group
  var selectedItemsMap = <int, List<String>>{}.obs;

  // في الـ Controller، تأكد أن لديك تعريف واحد فقط لكل دالة:

// دالة واحدة فقط بهذا الاسم
  String getGroupName(dynamic itemId) {
    for (var group in groups) {
      if (group['items'] != null) {
        for (var item in group['items']) {
          if (item['id'] == itemId) {
            return group['name'] ?? 'Unknown Group';
          }
        }
      }
    }
    return 'Unknown Group';
  }

// دالة واحدة فقط بهذا الاسم
  List<Map<String, dynamic>> getAllItems() {
    List<Map<String, dynamic>> allItems = [];
    for (var group in groups) {
      print(group['items']);
      print(group['name']);
      if (group['items'] != null && (group['items'] as List).isNotEmpty) {
        allItems.addAll(List<Map<String, dynamic>>.from(group['items']));
      } else {
        allItems.add({
          'name': group['name'] ?? 'Unnamed Group',
        });
      }
    }
    return allItems;
  }

// 3. دالة لتحديد العناصر
  void toggleItemSelection(String itemName, bool isSelected) {
    if (isSelected) {
      if (!selectedItemsForSum.contains(itemName)) {
        selectedItemsForSum.add(itemName);
      }
    } else {
      selectedItemsForSum.remove(itemName);
    }
    update();
  }

  SetIsQuizType(bool value) {
    isQuizTypeLoading = value;
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

          // 'selectedForSum': type.selectedForSum
          //     ?.map((item) => {
          //
          //           'id': item.id,
          //           'name': item.name,
          //         })
          //     .toList(),
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
      "selectedForSum": List.from(selectedItemsForSum),
    });

    selectedItemsMap[newGroupIndex] = List.from(selectedItemsForSum);

    columnWidths.add(100.0);
    selectedItemsForSum.clear();
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
    }
    update();
  }

  String get selectedClass => ClassIndex;
  String get selectedSemester => SemesterIndex;

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
}
