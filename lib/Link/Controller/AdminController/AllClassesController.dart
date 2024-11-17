import 'package:get/get.dart';
import 'package:getx/Link/Model/AdminModel/AllClassesModel.dart';

class Allclassescontroller extends GetxController {
  List<Class> classes = [];

  String examTypeIndex = "";
  String examClassIndex = "";
  String examDivisionIndex = "";

  List<String> examType = ["Quiz", "Exam", "Exam"];
  List<String> examClass = [];
  List<String> examDivision = [];

  void selectIndex(String type, String? index) {
    switch (type) {
      case 'type':
        examTypeIndex = index ?? "";
        break;
      case 'class':
        examClassIndex = index ?? "";
        break;
      case 'division':
        examDivisionIndex = index ?? "";
        break;
    }
    update();
  }

  void updateList(String type, List<String> options) {
    switch (type) {
      case 'type':
        examType = options;
        break;
      case 'class':
        examClass = options;
        break;
      case 'division':
        examDivision = options;
        break;
    }
    update();
  }

  void setAllClasses(AllClassesModel cl) {
    classes = cl.classes;
    update();
  }
}