import 'package:get/get.dart';
import 'package:getx/Link/Controller/AdminController/AllStudentsController.dart';
import 'package:getx/Link/Controller/AdminController/DropDownDivisionController.dart';
import 'package:getx/Link/Model/AdminModel/AllClassesModel.dart';
import 'package:getx/Link/Model/AdminModel/AllDivisionModel.dart';
import 'package:getx/Link/Model/AdminModel/AllGradeModel.dart';
import 'package:getx/Link/Model/AdminModel/AllSessionModel.dart';

class Dropdownclassescontroller extends GetxController {
  List<String> classes = [];
  List<Class> Allclass = [];
  AllDivisionModel? division;
  Allstudentscontroller studentcontroller = Get.find<Allstudentscontroller>();
  void setClasses(AllClassesModel clas) {
    Allclass = clas.classes;
    classes.clear();
    for (int i = 0; i < clas.classes.length; i++) {
      classes.add(clas.classes[i].enName.toString());
    }
    update();
  }


}
