import 'package:get/get.dart';
import 'package:vms_school/Link/Model/AdminModel/AllClassesModel.dart';
import 'package:vms_school/Link/Model/AdminModel/School_Models/Division_Model.dart';

class DropdownDivisions_Controller extends GetxController {
  List<Map<String, dynamic>> Divisions= [];

  AllClassModel? Classmodel;
  List<Division>? division;

  String ClassIndex = "";
  String ClassDiagIndex = "";

  var dropclasses;
  var dropDiagClasses;
  SetClassIdx(vale){
    dropclasses = vale;
    update();
  }

  SetClassDiagIdx(vale){
    dropDiagClasses = vale;
    update();
  }
  addclassList(List<String> values){
    listClass = values;
    listClassDiag = values;
    update();
  }
  setDivision(){

  }
  void setClass(AllClassModel cls) {
    Classmodel = cls;
    List<String> classess = [];
    if (cls.classes != null) {
      for (var g in cls.classes!) {
        classess.add(g.enName.toString());
      }
    }
    addclassList(classess);
    SetIsloading(false);
    update();
  }
  List<String> listClass = [];

  List<String> listClassDiag = [];


  deleteDivision(int index) {
    Divisions.removeAt(index);
    update();
  }

  void selectIndex(String type, String? index) {
    switch (type) {
      case 'class':
        ClassIndex = index ?? "";
        break;
      case 'classDiag':
        ClassDiagIndex = index ?? "";
        break;
    }
    update();
  }

  void updateList(String type, List<String> options) {
    switch (type) {
      case 'class':
        listClass = options;
        break;
      case 'classDiag':
        listClassDiag = options;
        break;
    }
    update();
  }

  String get selectClassIndex => ClassIndex;

  String get selectClassDiagIndex => ClassDiagIndex;
bool isLoading = true;

bool Isapiloading = true;
  void SetIsloading(bool value) {
    isLoading = value;
    update();
  }
  void SetIsapiloading(bool value) {
    Isapiloading = value;
    update();
  }

   setDivisions(Division_Model allDivisionModel) {
    Divisions.clear();
    division = allDivisionModel.division;
    for (var div in division!) {
      Divisions.add({
        'arName': div.name.toString(),
        'enName': div.enName.toString(),
        'classname': div.classes!.name.toString(),
        'classenname': div.classes!.enName.toString(),
        'meet': div.meetUrl.toString(),
        // 'hasStudent': stu.hasStudent==1 ? true :  false,
      });
    }
    SetIsapiloading(false);
    update();
   }

}
