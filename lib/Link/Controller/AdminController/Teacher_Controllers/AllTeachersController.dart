import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:vms_school/Link/Model/AdminModel/AllClassesModel.dart';
import 'package:vms_school/Link/Model/AdminModel/AllSessionModel.dart';
import 'package:vms_school/Link/Model/AdminModel/AllTeacherModel.dart';
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




  SetSubject(List<String> subjects){
    Subjectlist = subjects;
    setSubjectLoading(false);
    update();
  }
  SetClass(List<String> classes){
    classlist = classes;
    setClassLoading(false);
    update();
  }
  SetCurriculum(List<String> Curriculums){
    Curriculumlist = Curriculums;
    setCurriculumLoading(false);
    update();
  }


  bool isSubjectLoading = true;
  bool isClassLoading = true;
  bool isCurriculumLoading = true;

  setSubjectLoading(bool value){
    isSubjectLoading = value;
    update();
  }
  setClassLoading(bool value){
    isClassLoading = value;
    update();
  }
  setCurriculumLoading(bool value){
    isCurriculumLoading = value;
    update();
  }

  resetOnClassChange(){
    SubjectIndex = "";
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
    }
    update();
  }

  late BuildContext context;

  setIsLoading(bool value){
    isLoading = value;
    update();
  }

  void setAllTeacher(AllTeacherModel model) {
    teachers = model.teachers!;
    setIsLoading(false);
    searchRequestByName(filteredName , classIndex , SubjectIndex);
    update();
  }
  void searchRequestByName(String query, String classes , String subjects) {
    List<Teachers> tempFilteredList = List.from(teachers);
    if (query != null && query.isNotEmpty) {
      tempFilteredList = tempFilteredList.where((emp) {
        final empName = emp.fullName?.toLowerCase() ?? '';
        final phone = emp.phone?.toLowerCase() ?? '';
        final email = emp.email?.toLowerCase() ?? '';
        return empName.contains(query.toLowerCase()) || phone.contains(query.toLowerCase()) || email.contains(query.toLowerCase());
      }).toList();
    }
    filteredName = query;
    // if (classes.isNotEmpty) {
    //   tempFilteredList = tempFilteredList.where((emp) {
    //     return emp.!.toLowerCase() == jobindexed.toLowerCase();
    //   }).toList();
    // }
    // if (classes.isNotEmpty) {
    //   tempFilteredList = tempFilteredList.where((emp) {
    //     return emp.!.toLowerCase() == jobindexed.toLowerCase();
    //   }).toList();
    // }

    filteredTeacher = tempFilteredList;
    update();
  }


  void clearFilter() {
    searchRequestByName("" , classIndex , SubjectIndex);
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
    }
    update();
  }


  String get selectedclassIndex => classIndex;
  String get selectedSubjectIndex => SubjectIndex;
  String get selectedCurriculumIndex => CurriculumIndex;
}
