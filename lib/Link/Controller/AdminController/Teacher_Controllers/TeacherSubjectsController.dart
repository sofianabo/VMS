import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:vms_school/Link/Model/AdminModel/TeacherModels/TeacherSubjectModel.dart';
import 'package:vms_school/Link/Model/AdminModel/EmployeeModels/oneEmployeeAttendenceModel.dart';

class Teachersubjectscontroller extends GetxController {
  late BuildContext context;
  List<TeacherSubject> teacherSub = [];
  bool isLoading = true;

  void setTeacherSubject(TeacherSubjectModel model) {
    teacherSub = model.teacherSubject!;
    setIsLoading(false);
    update();
  }

  setIsLoading(bool value) {
    isLoading = value;
    update();
  }
}
 