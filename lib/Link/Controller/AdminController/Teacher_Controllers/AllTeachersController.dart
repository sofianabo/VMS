import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:vms_school/Link/Model/AdminModel/School_Models/AllClassesModel.dart';
import 'package:vms_school/Link/Model/AdminModel/School_Models/AllSessionModel.dart';
import 'package:vms_school/Link/Model/AdminModel/TeacherModels/AllTeacherModel.dart';
import 'package:vms_school/Link/Model/AdminModel/TeacherModels/OneTeacherModel.dart';
import 'package:vms_school/Link/Model/AdminModel/School_Models/AllGradeModel.dart';

class Allteachercontroller extends GetxController {
  List<Teachers> teachers = [];
  bool isLoading = true;
  List<Teachers>? filteredTeacher;
  String filteredName = "";
  String classIndex = "";
  String SubjectIndex = "";
  String CurriculumIndex = "";
  List<String> classlist = [];
  List<String> Curriculumlist = [];
  List<String> Subjectlist = [];
  Teacher? oTeacher;
  String genderDialogIndex = "";
  String familyStatusDialogIndex = "";
  String contractTypeDialogIndex = "";

  List<String> genderDialogList = ["Male", "Female"];
  List<String> familyStatusDialogList = [
    "Widow",
    "Single",
    "Married",
    "Divorced"
  ];
  List<String> contractTypeDialogList = ['Full Time', 'hours'];

  SetSubject(List<String> subjects) {
    Subjectlist = subjects;
    setSubjectLoading(false);
    update();
  }

  SetClass(List<String> classes) {
    classlist = classes;
    setClassLoading(false);
    update();
  }

  SetCurriculum(List<String> Curriculums) {
    Curriculumlist = Curriculums;
    setCurriculumLoading(false);
    update();
  }

  SetDefualtValue() {
    genderDialogIndex = "";
    familyStatusDialogIndex = "";
    contractTypeDialogIndex = "";
    update();
  }

  bool isSubjectLoading = true;
  bool isClassLoading = true;
  bool isCurriculumLoading = true;

  setSubjectLoading(bool value) {
    isSubjectLoading = value;

    update();
  }

  setClassLoading(bool value) {
    isClassLoading = value;
    classIndex = "";
    update();
  }

  setCurriculumLoading(bool value) {
    isCurriculumLoading = value;
    update();
  }

  void selectIndex(String type, String? index) {
    switch (type) {
      case 'Class':
        classIndex = index ?? "";
        break;
      case 'Curriculum':
        CurriculumIndex = index ?? "";
        break;
      case 'Subject':
        SubjectIndex = index ?? "";
        break;
      case 'GenderDialog':
        genderDialogIndex = index ?? "";
        break;
      case 'FamilyStatusDialog':
        familyStatusDialogIndex = index ?? "";
        break;
      case 'ContractTypeDialog':
        contractTypeDialogIndex = index ?? "";
        break;
    }
    searchRequestByName(filteredName, classIndex, SubjectIndex);
    update();
  }

  setIsLoading(bool value) {
    isLoading = value;
    update();
  }

  void setAllTeacher(AllTeacherModel model) {
    teachers = model.teachers!;
    setIsLoading(false);
    searchRequestByName(filteredName, classIndex, SubjectIndex);
    update();
  }

  void searchRequestByName(String query, String classes, String subjects) {
    List<Teachers> tempFilteredList = List.from(teachers ?? []);

    if (query.isNotEmpty) {
      tempFilteredList = tempFilteredList.where((teacher) {
        final empName = teacher.fullName?.toLowerCase() ?? '';
        final phone = teacher.phone?.toLowerCase() ?? '';
        final email = teacher.email?.toLowerCase() ?? '';
        return empName.contains(query.toLowerCase()) ||
            phone.contains(query.toLowerCase()) ||
            email.contains(query.toLowerCase());
      }).toList();
    }

    if (classes.isNotEmpty) {
      tempFilteredList = tempFilteredList.where((teacher) {
        return teacher.classes?.any((cls) =>
                cls.name?.toLowerCase() == classes.toLowerCase() ||
                cls.enName?.toLowerCase() == classes.toLowerCase()) ??
            false;
      }).toList();
    }

    if (subjects.isNotEmpty) {
      tempFilteredList = tempFilteredList.where((teacher) {
        return teacher.subject?.any((subj) =>
                subj.name?.toLowerCase() == subjects.toLowerCase() ||
                subj.enName?.toLowerCase() == subjects.toLowerCase()) ??
            false;
      }).toList();
    }

    filteredName = query;
    filteredTeacher = tempFilteredList;
    update();
  }

  void clearFilter() {
    searchRequestByName("", classIndex, SubjectIndex);
    update();
  }

  void updateList(
    String type,
    List<String> options,
  ) {
    switch (type) {
      case 'Class':
        classlist = options;
        break;
      case 'Curriculum':
        Curriculumlist = options;
        break;
      case 'Subject':
        Subjectlist = options;
        break;
      case 'GenderDialog':
        genderDialogList = options;
        break;
      case 'FamilyStatusDialog':
        familyStatusDialogList = options;
        break;
      case 'ContractTypeDailog':
        contractTypeDialogList = options;
        break;
    }
    update();
  }

  Rx<DateTime?> Birthdate = Rx<DateTime?>(null);
  Rx<DateTime?> Joindate = Rx<DateTime?>(null);

  void selectBirthDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: Birthdate.value ?? DateTime.now(),
      firstDate: DateTime(1950),
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
      firstDate: DateTime(2020),
      lastDate: DateTime(2100),
    );
    if (picked != null) {
      Joindate.value = picked;
    }
  }

  void setOneTeacher(Oneteachermodel oneteacher) {
    oTeacher = oneteacher.teacher;
    genderDialogIndex = oTeacher?.gender ?? "";
    familyStatusDialogIndex = oTeacher?.familystatus ?? "";
    contractTypeDialogIndex = oTeacher?.contractType ?? "";
    isPendAccount.value = oTeacher?.ispend != null
        ? oTeacher?.ispend == 0
            ? false
            : true
        : false;
    update();
  }

  String get selectedclassIndex => classIndex;
  String get selectedSubjectIndex => SubjectIndex;
  String get selectedCurriculumIndex => CurriculumIndex;
  String get selectedGenderDialogIndex => genderDialogIndex;
  String get selectedFamilyStatusDialogIndex => familyStatusDialogIndex;
  String get selectedContarctTypeDialogIndex => contractTypeDialogIndex;

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

  bool IsFatherError = false;
  bool IsMotherError = false;
  bool IsbirthdateError = false;
  bool IsEmergencyError = false;
  bool IsAddressError = false;
  bool IsCurrentAddressError = false;
  bool IsFamilyStateError = false;
  bool IsQualificationError = false;
  bool IsExperinceError = false;

  void updateFieldError(String type, bool newValue) {
    switch (type) {
      case 'qualification':
        IsQualificationError = newValue;
        break;
      case 'exp':
        IsExperinceError = newValue;
        break;
      case 'father':
        IsFatherError = newValue;
        break;
      case 'mother':
        IsMotherError = newValue;
        break;
      case 'birth':
        IsbirthdateError = newValue;
        break;
      case 'emgn':
        IsEmergencyError = newValue;
        break;
      case 'address':
        IsAddressError = newValue;
        break;
      case 'caddress':
        IsCurrentAddressError = newValue;
        break;
      case 'family':
        IsFamilyStateError = newValue;
        break;
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

      default:
        print("Error: Invalid type");
    }
    update();
  }

  ChangeShowConfirmPassword(bool value) {
    ShowConfirmPassword = value;
    print(value);
    update();
  }

  ChangeShowPassword(bool value) {
    ShowPassword = value;
    print(value);
    update();
  }

  void initialData() {
    classIndex = "";
    SubjectIndex = "";
    CurriculumIndex = "";
    update();
  }

  void resetError() {
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
    IsFatherError = false;
    IsMotherError = false;
    IsbirthdateError = false;
    IsEmergencyError = false;
    IsAddressError = false;
    IsCurrentAddressError = false;
    IsFamilyStateError = false;
    IsQualificationError = false;
    IsExperinceError = false;

    update();
  }

  var isPendAccount = false.obs;

  void togglePindTeacher(bool value) {
    isPendAccount.value = value;
  }
}
