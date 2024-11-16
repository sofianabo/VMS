// ignore_for_file: file_names

import 'package:get/get.dart';
import 'package:getx/Link/Model/AdminModel/AllTeacherModel.dart';

class Allteachercontroller extends GetxController {
  List<Teachers> teachers = [];
  void setAllTeacher(AllTeacherModel model) {
    teachers = model.teachers!;
    update();
  }
}
