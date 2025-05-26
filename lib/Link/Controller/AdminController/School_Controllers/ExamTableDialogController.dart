import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vms_school/Link/Model/AdminModel/School_Models/AllClassesModel.dart';
import 'package:vms_school/Link/Model/AdminModel/School_Models/AllSemesterModel.dart';
import 'package:vms_school/Link/Model/AdminModel/School_Models/DropDownCuriculmModel.dart';
import 'package:vms_school/Link/Model/AdminModel/School_Models/ExamTableModel.dart';
import 'package:vms_school/Link/Model/AdminModel/School_Models/ExamTypeModel.dart';
import 'package:vms_school/Translate/local_controller.dart';
import 'package:vms_school/main.dart';

class Examtabledialogcontroller extends GetxController {
  String typeDialogIndex = "";

  List<String> typeDialogList = [];

  bool isTypeLoading = true;

  setisTypeLoading(bool value) {
    typeDialogIndex = "";
    isTypeLoading = value;
    update();
  }

  void initialData() {
    typeDialogIndex = "";

    typeDialogList = [];

    update();
  }

  void selectIndex(String type, String? index) {
    switch (type) {
      case 'typeDialog':
        typeDialogIndex = index ?? "";
        break;
    }

    update();
  }

  void setAllTypesDialog(AllExamTypeModel types) {
    setisTypeLoading(false);
    typeDialogList.clear();
    for (int j = 0; j < types.type!.length; j++) {
      typeDialogList.add(types.type![j].name.toString());
    }
    update();
    updateList("typeDialog", typeDialogList);
  }

  void updateList(String type, List<String> options) {
    switch (type) {
      case 'typeDialog':
        typeDialogList = options;
        break;
    }
    update();
  }
}
