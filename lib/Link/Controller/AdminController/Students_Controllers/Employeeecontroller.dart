import 'package:get/get.dart';
import 'package:vms_school/Link/Model/AdminModel/IncreaseEmpolyeeAttendenceModel.dart';
import 'package:vms_school/Link/Model/AdminModel/IncreaseTeacherAttendenceModel.dart';


class EmployeeController extends GetxController {
  bool Isloading = true;
  bool Isuploaded = false;

  List<Employeee>? employees;
  List<Teacher>? teachers;
  var Employee = <Map<String, dynamic>>[].obs;

  setData(IncreaseEmpolyeeAttendenceModel employee) {
    employees = employee.employee;
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

  setTeacherData(IncreaseTeacherAttendenceModel teach) {
    teachers = teach.teacher;
    Employee.clear();

    for (var t in teachers!) {
      try {
        Employee.add({
          'employeeId': t.id!,
          'status': 'Present',
          'cause': "null",
          'name': t.fullName!,
          // 'imgid': t.imageId!,
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
    Employee[index]['status'] = newStatus;
    Employee.refresh();
    checkAllHolidayStatus();
  }


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
