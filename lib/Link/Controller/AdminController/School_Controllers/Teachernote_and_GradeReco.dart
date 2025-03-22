import 'package:get/get.dart';
import 'package:vms_school/Link/Model/AdminModel/AllClassesModel.dart';
import 'package:vms_school/Translate/local_controller.dart';
import 'package:vms_school/main.dart';

class TeachernoteAndGradeReco extends GetxController {
  AllClassModel? Classmodel;

  var groups = <Map<String, dynamic>>[
    {"name": "تقديرات الفصل الأول", "ratio": 0, "size": 100.0, "items": []},
    {
      "name": "مجموع درجات الفصل الأول",
      "ratio": 100,
      "size": 100.0,
      "items": []
    },
    {
      "name": "درجة اختبار الفصل الأول",
      "ratio": 40,
      "size": 100.0,
      "items": []
    },
    {
      "name": "درجة أعمال الفصل الأول",
      "ratio": 60,
      "size": 100.0,
      "items": [
        {"name": "شفوية", "ratio": 20, "quizable": true},
        {"name": "وظائف و أوراق عمل", "ratio": 20, "quizable": true},
        {"name": "نشاطات و مبادرات", "ratio": 10, "quizable": true},
        {"name": "المذاكرة", "ratio": 10, "quizable": true},
      ]
    },
    {"name": "الدرجة العظمى", "ratio": 0, "size": 100.0, "items": []},
    {"name": "المواد الدراسية", "ratio": 0, "size": 100.0, "items": []}
  ].obs;
  var items = [].obs;

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

  void UpdateGroupItems(int idx, String groupName, double ratioValue,
      List<Map<String, dynamic>> items) {
    groups[idx] = {
      'name': groupName,
      'ratio': ratioValue,
      'items': items,
    };
    update();
  }

  Add_Items(
      {required String name, required String ratio, required bool IsQuizable}) {
    double? ratioValue = double.tryParse(ratio);
    if (ratioValue != null) {
      items.add({
        "name": name,
        "ratio": ratioValue,
        "quizable": IsQuizable,
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
        "name": name,
        "ratio": ratioValue,
        "quizable": IsQuizable,
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
    groups.add(
      {
        "name": name,
        "ratio": double.parse(ratio),
        "size": 100.0,
        "items": List.from(newItems)
      },
    );
    columnWidths.add(100.0);
    update(); // تحديث الحالة لإعادة بناء الواجهة
  }

  var columnWidths = [100.0, 100.0, 100.0, 100.0, 100.0, 100.0, 100.0].obs;

  void updateGroupSizes() {
    for (int i = 0; i < groups.length; i++) {
      groups[i]["size"] = double.parse(columnWidths[i].toStringAsFixed(2));
    }
  }

  // تغيير عرض العمود عند السحب
  void resizeColumn(int index, double delta) {
    if (columnWidths[index] + delta >= 80.0 &&
        columnWidths[index] + delta <= 800.0) {
      columnWidths[index] += delta;
      updateGroupSizes(); // تحديث الحجم في groups بعد تغيير العرض
    }
  }

  pri() {
    print(groups);
  }

  String ClassIndex = "";
  String SemesterIndex = "The First Semester";
  int SemesterSendIndex = 1;

  List<String> ClassList = [];
  List<String> SemesterList = [
    "The First Semester",
    "The Second Semester",
    "The Third Semester",
  ];
  bool isClassLoading = true;

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
    if (selectedClasses.contains(classId)) {
      selectedClasses.remove(classId);
    } else {
      selectedClasses.add(classId);
    }
    update();
  }
}
