import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vms_school/Link/Controller/AdminController/Employee_Controllers/Add_Full_Employee_Controller.dart';
import 'package:vms_school/Link/Controller/AdminController/Employee_Controllers/All_Virtual_Employee_Controller.dart';
import 'package:vms_school/Link/Controller/AdminController/Teacher_Controllers/AllTeachersController.dart';
import 'package:vms_school/Link/Model/AdminModel/EmployeeModels/All_Employee_Model.dart';
import 'package:vms_school/Link/Model/AdminModel/EmployeeModels/One_Employee_Model.dart';

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
  String ferollIndex = "";
  String fejopIndex = "";
  String rolldialogIndex = "";
  String dialogjobTitleIndex = "";
  String GenderListIndex = "";
  String Family_StatusIndex = "";
  String ContractTypeIndex = "";
  List<String> GenderList = ["Male", "Female"];
  List<String> Family_StatusList = ["Widow", "Single", "Married", "Divorced"];
  List<String> JobTitleList = [
    "Manager",
    "Dustman",
    "Guard",
    "Registration",
    "Secretariat",
    "Secretary",
    "Supervisor",
    "Accountant",
    "Media",
    "Technical Support",
    "Technical Support Manager",
  ];
  List<String> dialogjobTitleList = [
    "Dustman",
    "Guard",
    "Media",
    "Secretary",
  ];
  List<String> rolllist = ['Class', 'Observer'];
  List<String> rolldialoglist = ['Class', 'Observer'];
  List<String> contractList = ['Full Time', 'Hours'];
  List<String> feRoll = [];
  List<String> feJoptitle = [
    "Manager",
    "Registration",
    "Secretariat",
    "Supervisor",
    "Accountant",
    "Technical Support",
    "Technical Support Manager",
  ];

  void SetRollDropDown(String newValue) {
    ferollIndex = "";
    if (newValue == "Manager") {
      feRoll = [
        'Admin',
      ];
    }
    if (newValue == "Registration") {
      feRoll = [
        'Registration',
      ];
    }
    if (newValue == "Secretariat") {
      feRoll = [
        'Supervisor',
      ];
    }
    if (newValue == "Supervisor") {
      feRoll = [
        'Supervisor',
      ];
    }
    if (newValue == "Accountant") {
      feRoll = ['Accountant'];
    }
    if (newValue == "Technical Support") {
      feRoll = [
        'Sub Admin',
      ];
    }
    if (newValue == "Technical Support Manager") {
      feRoll = [
        'Admin',
      ];
    }
  }

  Rx<DateTime?> Birthdate = Rx<DateTime?>(null);
  Rx<DateTime?> Joindate = Rx<DateTime?>(null);

  SetDefualtValue() {
    GenderListIndex = "";
    Family_StatusIndex = "";
    update();
  }

  setIsUploaded(bool isupload) {
    isUploaded = isupload;
    update();
  }

  setIsLoading(bool value) {
    isLoading = value;
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

  void clearFilter() {
    searchRequestByName("", jobTitleIndex);
    update();
  }

  void searchRequestByName(String query, String jobindexed) {
    List<Employees> tempFilteredList = List.from(employees);
    if (query.isNotEmpty) {
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
      case 'feroll':
        ferollIndex = index ?? "";
        break;
      case 'fejop':
        fejopIndex = index ?? "";
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
      case 'Contract':
        ContractTypeIndex = index ?? "";
        break;
    }
    if (type == "jobTitle" && Value != null) {
      searchRequestByName(Value.toString(), jobTitleIndex);
    } else if (type == "jobTitle" && Value == null) {
      searchRequestByName("", jobTitleIndex);
    }
    if (type == "roll") {
      Get.find<All_Virtual_Employee_Controller>().searchRequestByName(
          Get.find<All_Virtual_Employee_Controller>().filteredName, rollIndex);
    }

    update();
  }

  void updateList(
    String type,
    List<String> options,
  ) {
    switch (type) {
      case 'jobTitle':
        JobTitleList = options;
        break;
      case 'roll':
        rolllist = options;
        break;
      case 'feroll':
        feRoll = options;
        break;
      case 'fejop':
        feJoptitle = options;
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
      case 'Contract':
        contractList = options;
        break;
    }
    update();
  }

  void setOneEmployee(One_Employee_Model onEmployee) {
    employee = onEmployee.employee;
    GenderListIndex = employee?.gender ?? "";
    Family_StatusIndex = employee?.familystatus ?? "";
    isPendAccount.value = onEmployee.employee?.ispend != null
        ? onEmployee.employee!.ispend == 0
            ? false
            : true
        : false;
    update();
  }

  void selectBirthDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: Birthdate.value ?? DateTime.now(),
      firstDate: DateTime(1950),
      lastDate: DateTime.now(),
    );
    if (picked != null) {
      Birthdate.value = picked;
      Get.find<AddFullEmployeeController>().updateFieldError("birth", false);
    }
  }

  void selectJoinDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: Joindate.value ?? DateTime.now(),
      firstDate: DateTime(2020),
      lastDate: DateTime(DateTime.now().year + 1),
    );
    if (picked != null) {
      Joindate.value = picked;
      Get.find<Allteachercontroller>().updateFieldError("join", false);
      Get.find<AddFullEmployeeController>().updateFieldError("join", false);
      updateFieldError("join", false);
    }
  }

  String get selectedsessionIndex => sessionIndex;

  String get selectejobTitleIndex => jobTitleIndex;

  String get selecterollIndex => rollIndex;
  String get selecteferollIndex => ferollIndex;
  String get selectefejopIndex => fejopIndex;

  String get selecteGenderIndex => GenderListIndex;

  String get selecteContractTypeIndex => ContractTypeIndex;

  String get selecteFamily_StatusIndex => Family_StatusIndex;

  String get selectedrolldialogIndex => rolldialogIndex;

  String get selecteddialogjobTitleIndex => dialogjobTitleIndex;

  bool ShowConfirmPassword = true;
  bool ShowPassword = true;

  bool IsJoinError = false;
  bool ISusernameError = false;
  bool ISemailError = false;
  bool ISfirstNameError = false;
  bool ISlastNameError = false;
  bool ISphoneError = false;
  bool ISpasswordError = false;
  bool IScPasswordError = false;
  bool IsGenderError = false;
  bool IsContractError = false;
  bool IsRollError = false;
  bool IsJopError = false;

  var isPendAccount = false.obs;

  void togglePindTeacher(bool value) {
    isPendAccount.value = value;
  }

  void updateFieldError(String type, bool newValue) {
    switch (type) {
      case 'join':
        IsJoinError = newValue;
        break;
      case 'username':
        ISusernameError = newValue;
        break;
      case 'email':
        ISemailError = newValue;
        break;
      case 'first':
        ISfirstNameError = newValue;
        break;
      case 'last':
        ISlastNameError = newValue;
        break;
      case 'phone':
        ISphoneError = newValue;
        break;
      case 'password':
        ISpasswordError = newValue;
        break;
      case 'cpassword':
        IScPasswordError = newValue;
        break;
      case 'gender':
        IsGenderError = newValue;
        break;
      case 'contract':
        IsContractError = newValue;
        break;
      case 'roll':
        IsRollError = newValue;
        break;
      case 'jop':
        IsJopError = newValue;
        break;

      default:
    }
    update();
  }

  ChangeShowConfirmPassword(bool value) {
    ShowConfirmPassword = value;
    update();
  }

  ChangeShowPassword(bool value) {
    ShowPassword = value;
    update();
  }

  void reset() {
    ferollIndex = "";
    fejopIndex = "";
    rolldialogIndex = "";
    dialogjobTitleIndex = "";
    GenderListIndex = "";
    Family_StatusIndex = "";
    ContractTypeIndex = "";
    Birthdate.value = null;
    Joindate.value = null;
    update();
  }

  void resertError() {
    ShowConfirmPassword = true;
    ShowPassword = true;
    IsJoinError = false;
    ISusernameError = false;
    ISemailError = false;
    ISfirstNameError = false;
    ISlastNameError = false;
    ISphoneError = false;
    ISpasswordError = false;
    IScPasswordError = false;
    IsGenderError = false;
    IsContractError = false;
    IsRollError = false;
    IsJopError = false;
    update();
  }
}
