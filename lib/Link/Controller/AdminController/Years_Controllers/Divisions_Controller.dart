import 'package:get/get.dart';
import 'package:vms_school/Link/Model/AdminModel/AllClassesModel.dart';

class DropdownDivisions_Controller extends GetxController {
  List<Map<String, dynamic>> Division = [
    {
      "arName": "الفصل الأول",
      "enName": "First Division",
      "class": "Twelfth Scientific Grade",
      "meet": "https://192.168.1.1",
    },
  ];

  AllClassModel? Classmodel;

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

  addData(String arName, String enName, String drive) {
    Division.addAll([
      {
        "arName": "$arName",
        "enName": "$enName",
        "class": "$selectClassDiagIndex",
        "meet": "$drive",
      }
    ]);
    ClassDiagIndex = "";
    update();
  }

  updatedata(int idx, String arName, String enName, String drive) {
    Division[idx] = {
      "arName": "$arName",
      "enName": "$enName",
      "class": "$selectClassDiagIndex",
      "meet": "$drive",
    };
    ClassDiagIndex = "";
    update();
  }

  deleteDivision(int index) {
    Division.removeAt(index);
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
  void SetIsloading(bool value) {
    isLoading = value;
    update();
  }
}
