import 'package:get/get.dart';
import 'package:vms_school/Link/Model/AdminModel/IncreaseEmpolyeeAttendenceModel.dart';
import 'package:vms_school/Link/Model/AdminModel/IncreaseTeacherAttendenceModel.dart';


class EmployeeController extends GetxController {
  bool Isloading = true;
  bool Isuploaded = false;

  List<Employee>? employees;
  List<Teacher>? teachers;
  var Employees = <Map<String, dynamic>>[].obs;

  setData(IncreaseEmpolyeeAttendenceModel employee) {
    employees = employee.employee;
    Employees.clear();
    for (var emp in employees!) {
      Employees.add({
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

  setTeacherData(IncreaseTeacherAttendenceModel teach) {
    teachers = teach.teacher;
    Employees.clear();

    for (var t in teachers!) {
      try {
        Employees.add({
          'employeeId': t.id!,
          'status': 'Present',
          'cause': "null",
          'name': t.fullName!,
          'imgid': t.imageId!,
        });
      } catch (e) {
        print(t.id);
        print(t.fullName);
        print(t.imageId);
        print(e);
      }
    }
    print(Employee);
    setIsload(false);
    update();
  }

  // تعيين حالة التحميل
  setIsload(bool value) {
    Isloading = value;
    update();
  }

  setIsIsuploaded(bool value) {
    Isuploaded = value;
    update();
  }

  var allHolidayChecked = false.obs;


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

  // التحقق من حالة العطلة للجميع
  void checkAllHolidayStatus() {
    allHolidayChecked.value =
        Employees.every((item) => item['status'] == 'Holiday');
  }
}
