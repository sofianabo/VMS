import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vms_school/Link/Model/AdminModel/AllSessionModel.dart';
import 'package:vms_school/Link/Model/AdminModel/All_Employee_Model.dart';
import 'package:vms_school/Link/Model/AdminModel/One_Employee_Model.dart';

class Allempolyeecontroller extends GetxController {

  List<Employees> employees = [];
  List<Employees> filteredreemployees = [];


  bool isUploaded = false;

  Employee? employee;
  String? Value;
  bool isLoading = true;

  String sessionIndex = "";
  String jobTitleIndex = "";
  String rollIndex = "";
  String rolldialogIndex = "";
  String dialogjobTitleIndex = "";
  String GenderListIndex = "";
  String Family_StatusIndex = "";

  SetDefualtValue(){
    GenderListIndex="";
    Family_StatusIndex="";
    update();
  }

  void clearFilter() {
    searchRequestByName("",jobTitleIndex);
    update();
  }

  void setEmployee(AllEmployeeModel model) {
    employees = model.employees!;
    filteredreemployees = List.from(employees);
    if (Value != null && Value!.isNotEmpty) {
      searchRequestByName(Value.toString(), jobTitleIndex);
    }

    if (jobTitleIndex.isNotEmpty) {
      filteredreemployees = filteredreemployees.where((emp) {
        return emp.jobTitle == jobTitleIndex;
      }).toList();
    }

    setIsLoading(false);
    update();
  }

   setIsUploaded (bool isupload){
    isUploaded = isupload ;
    update();
  }

setIsLoading(bool value){
  isLoading = value;
  update();
}


  void searchRequestByName(String query, String jobindexed) {
    List<Employees> tempFilteredList = List.from(employees);
    if (query != null && query.isNotEmpty) {
      tempFilteredList = tempFilteredList.where((emp) {
        final empName = emp.userName?.toLowerCase() ?? '';
        final empFullName = emp.fullName?.toLowerCase() ?? '';
        return empName.contains(query.toLowerCase()) ||
            empFullName.contains(query.toLowerCase());
      }).toList();
    }
    Value = query;
    if (jobindexed.isNotEmpty) {
      tempFilteredList = tempFilteredList.where((emp) {
        return emp.jobTitle == jobindexed;
      }).toList();
    }

    filteredreemployees = tempFilteredList;
    update();
  }

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
    if(type == "jobTitle" && Value!=null){
      searchRequestByName(Value.toString(),jobTitleIndex);
    }else if(type == "jobTitle" && Value ==null) {
      searchRequestByName("",jobTitleIndex);
    }
    update();
  }


  void setOneEmployee(One_Employee_Model onEmployee) {
    employee = onEmployee.employee;
    GenderListIndex = employee?.gender ?? "";
    Family_StatusIndex = employee?.familystatus ?? "";
    update();
  }

  List<String> GenderList = ["Male", "Female"];
  List<String> Family_StatusList = ["Widow", "Single", "Married", "Divorced"];

  List<String> JobTitleList = ["Manager","Dustman", "Guard","Registration","Secretariat","Secretary","Supervisor","Accountant","Technical Support", "Technical Support Manager",];
  List<String> dialogjobTitleList = ["Dustman", "Guard"];
  List<String> sessionlist = [];
  List<String> rolllist = ['Class', 'Observer'];
  List<String> rolldialoglist = ['Class', 'Observer'];



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

  String get selectejobTitleIndex => jobTitleIndex;

  String get selecterollIndex => rollIndex;

  String get selecteGenderIndex => GenderListIndex;

  String get selecteFamily_StatusIndex => Family_StatusIndex;

  String get selectedrolldialogIndex => rolldialogIndex;

  String get selecteddialogjobTitleIndex => dialogjobTitleIndex;

}
