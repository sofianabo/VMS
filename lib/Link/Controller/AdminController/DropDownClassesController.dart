import 'package:get/get.dart';
import 'package:getx/Link/Model/AdminModel/AllClassesModel.dart';
import 'package:getx/Link/Model/AdminModel/AllGradeModel.dart';
import 'package:getx/Link/Model/AdminModel/AllSessionModel.dart';

class Dropdownclassescontroller extends GetxController {
  List<String> classes = [];

  void setClasses(AllClassesModel clas) {
    classes.clear();
    for (int i = 0; i < clas.classes.length; i++) {
      classes.add(clas.classes[i].enName.toString());
    }
    update();
  }
}
