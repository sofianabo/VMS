import 'package:get/get.dart';
import 'package:vms_school/Link/Model/AdminModel/Students_Models/Stu_Attendence.dart';

class Student_attendence_controller extends GetxController {

 var students = <Map<String, dynamic>>[].obs;
 List<Students>? AllStudents;
  bool isLoading = true;

 setData(StuAttendence stud) {

   AllStudents = stud.students;
   students.clear();
   setIsLoading(false);
   for (var stu in AllStudents!) {
     students.add({
       'stuid': stu.studentId ?? 0,
       'status': 'Present',
       'cause': null,
       'name': stu.fullName,
       'imgid': stu.fileId,
     });
   }
   update();
 }

  setIsLoading(bool isload) {
    isLoading = isload;
    update();
  }






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
    students[index]['status'] = newStatus;
    students.refresh();
    checkAllHolidayStatus();
  }

  void setAllAsHoliday(bool checked) {
    allHolidayChecked.value = checked;
    for (var item in students) {
      item['status'] = checked ? 'Holiday' : 'Present';
    }
    students.refresh();
  }

  void checkAllHolidayStatus() {
    allHolidayChecked.value =
        students.every((item) => item['status'] == 'Holiday');
  }
}
