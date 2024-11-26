import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vms_school/Link/Model/AdminModel/AllSessionModel.dart';
import 'package:vms_school/Link/Model/AdminModel/All_Employee_Model.dart';

class Allempolyeecontroller extends GetxController {

  List<Employees> employee = [];

  String sessionIndex = "";
  String jobTitleIndex = "";
  String rollIndex = "";
  String rolldialogIndex = "";
  String dialogjobTitleIndex = "";
  String GenderListIndex = "";
  String Family_StatusIndex = "";

  void setEmployee(AllEmployeeModel model) {
    employee = model.employees!;
    update();
  }

  List<String> GenderList = ["Male", "Female"];
  List<String> Family_StatusList = ["Widow", "Single", "Married", "Divorced"];

  List<String> JobTitleList = [];
  List<String> dialogjobTitleList = ["Dustman", "Guard"];
  List<String> sessionlist = [];
  List<String> rolllist = ['Class', 'Observer'];
  List<String> rolldialoglist = ['Class', 'Observer'];

  void selectIndex(String type, String? index) {
    switch (type) {
      case 'session':
        sessionIndex = index ?? "";
        break;
      case 'jobTitle':
        jobTitleIndex = index ?? "";
        break;

      case 'roll':
        rollIndex = index ?? "";
        break;
      case 'rolldialog':
        rolldialogIndex = index ?? "";
        break;
      case 'dialogjobTitle':
        dialogjobTitleIndex = index ?? "";
        break;
      case 'Gender':
        GenderListIndex = index ?? "";
        break;
      case 'Family_Status':
        Family_StatusIndex = index ?? "";
        break;
    }
    update();
  }
  void setAllSession(AllSessionModel session) async {
    sessionlist.clear();
    for (int i = 0; i < session.sessions!.length; i++) {
      sessionlist.add(session.sessions![i].year.toString());
      print(session.sessions![i].year.toString());
    }
    update();
    updateList("session", sessionlist);
  }


  //   void setAllJobTitle(AllJobTitleModel job) async {
  //   JobTitleList.clear();
  //   for (int i = 0; i < job.sessions!.length; i++) {
  //     sessionlist.add(job.sessions![i].year.toString());
  //   }
  //   update();
  //   updateList("session", sessionlist);
  // }

  Rx<DateTime?> Birthdate = Rx<DateTime?>(null);
  Rx<DateTime?> Joindate = Rx<DateTime?>(null);


  void selectBirthDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: Birthdate.value ?? DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
    );
    if (picked != null) {
      Birthdate.value = picked;
    }
  }

  void selectJoinDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: Joindate.value ?? DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
    );
    if (picked != null) {
      Joindate.value = picked;
    }
  }

   void updateList(
    String type,
    List<String> options,
  ) {
    switch (type) {
      case 'session':
        sessionlist = options;
        break;
      case 'jobTitle':
        JobTitleList = options;
        break;
      case 'roll':
        rolllist = options;
        break;
      case 'rolldialog':
        rolldialoglist = options;
        break;
      case 'dialogjobTitle':
        dialogjobTitleList = options;
        break;
      case 'Gender':
        GenderList = options;
        break;
      case 'Family_Status':
        Family_StatusList = options;
        break;
    }
    update();
  }

  String get selectedsessionIndex => sessionIndex;

  String get selectedgradeIndex => jobTitleIndex;

  String get selecterollIndex => rollIndex;

  String get selecteGenderIndex => GenderListIndex;

  String get selecteFamily_StatusIndex => Family_StatusIndex;

  String get selectedrolldialogIndex => rolldialogIndex;

  String get selecteddialogjobTitleIndex => dialogjobTitleIndex;

  // void updateGuardian(
  //     String name, int index, String phone, String email, String nationalid) {
  //   guardian[index].name = name;
  //   guardian[index].phone = phone;
  //   guardian[index].email = email;
  //   guardian[index].nationalId = nationalid;
  //   update();
  // }
}
