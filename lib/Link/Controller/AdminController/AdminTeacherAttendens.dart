import 'package:get/get.dart';

class TeacherAttendensController extends GetxController {
  var Teachers = [
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
      "name": "Faiez Shams Aldeen",
      "status": "Vacation",
    },
    {
      "name": "Laith Haitham Azzam",
      "status": "Holiday",
    },
  ].obs;

  var Employees = [
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
      "name": "Faiez Shams Aldeen",
      "status": "Vacation",
    },
    {
      "name": "Laith Haitham Azzam",
      "status": "Holiday",
    },
  ].obs;

  var allHolidayCheckede = false.obs; // حالة ال Checkbox

  void updateStatuse(int index, String newStatus) {
    Employees[index]['status'] = newStatus;
    Employees.refresh();
    checkAllHolidayStatuse();
  }

  void setAllAsHolidaye(bool checked) {
    allHolidayCheckede.value = checked;
    for (var item in Employees) {
      item['status'] = checked ? 'Holiday' : 'Present';
    }
    Employees.refresh();
  }

  void checkAllHolidayStatuse() {
    allHolidayChecked.value =
        Employees.every((item) => item['status'] == 'Holiday');
  }

  var allHolidayChecked = false.obs; // حالة ال Checkbox

  void updateStatus(int index, String newStatus) {
    Teachers[index]['status'] = newStatus;
    Teachers.refresh();
    checkAllHolidayStatus();
  }

  void setAllAsHoliday(bool checked) {
    allHolidayChecked.value = checked;
    for (var item in Teachers) {
      item['status'] = checked ? 'Holiday' : 'Present';
    }
    Teachers.refresh();
  }

  void checkAllHolidayStatus() {
    allHolidayChecked.value =
        Teachers.every((item) => item['status'] == 'Holiday');
  }
}
