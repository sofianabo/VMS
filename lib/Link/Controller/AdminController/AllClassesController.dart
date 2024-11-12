import 'package:get/get.dart';
import 'package:getx/Link/Model/AdminModel/AllClassesModel.dart';


class Allclassescontroller extends GetxController {
  List<Class> classes=[];

  void getAllClasses(AllClassesModel cl) {
    classes = cl.classes;
       update();
  }
}
