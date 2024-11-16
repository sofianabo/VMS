import 'package:get/get.dart';

class EmployeesAttendensMAnagments extends GetxController {
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

  var allHolidayChecked = false.obs; // حالة ال Checkbox

  void updateStatus(int index, String newStatus) {
    Employees[index]['status'] = newStatus;
    Employees.refresh();
    checkAllHolidayStatus();
  }

  void setAllAsHoliday(bool checked) {
    allHolidayChecked.value = checked;
    for (var item in Employees) {
      item['status'] = checked ? 'Holiday' : 'Present';
    }
    Employees.refresh();
  }

  void checkAllHolidayStatus() {
    allHolidayChecked.value =
        Employees.every((item) => item['status'] == 'Holiday');
  }
}
