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
