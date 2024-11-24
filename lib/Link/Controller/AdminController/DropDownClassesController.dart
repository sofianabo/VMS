import 'package:get/get.dart';
import 'package:getx/Link/Model/AdminModel/AllClassesModel.dart';

class Dropdownclassescontroller extends GetxController {
  List<String> classes = [];
  List<Class> Allclass = [];
  void setClasses(AllClassesModel clas) {
    Allclass = clas.classes;
    classes.clear();
    for (int i = 0; i < clas.classes.length; i++) {
      classes.add(clas.classes[i].enName.toString());
    }
    update();
  }
}
