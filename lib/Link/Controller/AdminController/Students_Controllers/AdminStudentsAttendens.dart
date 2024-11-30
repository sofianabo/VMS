import 'package:get/get.dart';

class Studentattcontroller extends GetxController {
  var Students = [
    {
      "name": "Laith Haitham Azzam",
      "status": "Present",
    },
    {
      "name": "Sofian Abo Shdeed",
      "status": "Truant",
    },
    {
      "name": "Fadi Alsopot",
      "status": "Late",
    },
    {
      "name": "Laith Haitham Azzam",
      "status": "Holiday",
    },
  ].obs;

  var allHolidayChecked = false.obs; // حالة ال Checkbox

  String gradeIndex = "";
  String classIndex = "";
  String divisionIndex = "";

  List<String> gradelist = ["first", "tow", "three"];
  List<String> classlist = ["one"];
  List<String> divisionlist = ["one"];

  void selectIndex(String type, String? index) {
    switch (type) {
      case 'grade':
        gradeIndex = index ?? "";
        break;
      case 'class':
        classIndex = index ?? "";
        break;
      case 'division':
        divisionIndex = index ?? "";
        break;
    }
    update();
  }

  void updateList(String type, List<String> options) {
    switch (type) {
      case 'grade':
        gradelist = options;
        break;
      case 'class':
        classlist = options;
        break;
      case 'division':
        divisionlist = options;
        break;
    }
    update();
  }

  String get selectedgradeIndex => gradeIndex;

  String get selectedclassIndex => classIndex;

  String get selecteddivisionIndex => divisionIndex;

  void updateStatus(int index, String newStatus) {
    Students[index]['status'] = newStatus;
    Students.refresh();
    checkAllHolidayStatus();
  }

  void setAllAsHoliday(bool checked) {
    allHolidayChecked.value = checked;
    for (var item in Students) {
      item['status'] = checked ? 'Holiday' : 'Present';
    }
    Students.refresh();
  }

  void checkAllHolidayStatus() {
    allHolidayChecked.value =
        Students.every((item) => item['status'] == 'Holiday');
  }
}
