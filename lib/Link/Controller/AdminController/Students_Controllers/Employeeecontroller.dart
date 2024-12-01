import 'package:get/get.dart';
import 'package:vms_school/Link/Model/AdminModel/All_Employee_Model.dart';

class EmployeeController extends GetxController {
  bool Isloading = true;


  List<Employees>? employees;

  var Employee = <Map<String, dynamic>>[].obs;

  setData(AllEmployeeModel employee) {
    employees = employee.employees;
    Employee.clear();

    for (var emp in employees!) {
      Employee.add({
        'employeeId': emp.id!,
        'status': 'Present',
        'cause': null,
        'name': emp.fullName!,
        'imgid': emp.imageId!,
      });

    }

    setIsload(false);
    update();
  }

  // تعيين حالة التحميل
  setIsload(bool value) {
    Isloading = value;
    update();
  }

  var allHolidayChecked = false.obs;

  // تحديث الحالة
  void updateStatus(int index, String newStatus) {
    Employee[index]['status'] = newStatus;
    Employee.refresh();
    checkAllHolidayStatus();
  }

  // تعيين الجميع كعطلة
  void setAllAsHoliday(bool checked) {
    allHolidayChecked.value = checked;
    for (var item in Employee) {
      item['status'] = checked ? 'Holiday' : 'Present';
    }

    Employee.refresh();
  }

  // التحقق من حالة العطلة للجميع
  void checkAllHolidayStatus() {
    allHolidayChecked.value =
        Employee.every((item) => item['status'] == 'Holiday');
  }
}
