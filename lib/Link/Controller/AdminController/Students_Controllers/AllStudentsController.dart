import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:vms_school/Link/Model/AdminModel/AllClassesModel.dart';
import 'package:vms_school/Link/Model/AdminModel/AllDivisionModel.dart';
import 'package:vms_school/Link/Model/AdminModel/AllSessionModel.dart';
import 'package:vms_school/Link/Model/AdminModel/AllStudentModel.dart';
import 'package:vms_school/Link/Model/AdminModel/School_Models/AllGradeModel.dart';


class Allstudentscontroller extends GetxController {

  late BuildContext context;
  List<Students> stud = [];
  List<Students> filteredStudents = [];
  String sessionIndex = "";
  String gradeIndex = "";
  String classIndex = "";
  String divisionIndex = "";
  bool isLoading = true;

  String? filterName = '';
  String? filterGrade = '';
  String? filterClass = '';
  String? filterDivision = '';

  List<String> gradelist = [];
  bool isGradeLoading = true;
  List<String> classlist = [];
  bool isClassLoading = true;
  List<String> divisionlist = [];
  bool isDivisionLoading = true;
  List<String> sessionlist = [];



  void clearFilter() {
    searchByName("",gradeIndex , classIndex,divisionIndex);
    update();
  }

  void searchByName(String? nameQuery, String? grade, String? classs, String? division) {
    List<Students> tempFilteredList = List.from(stud);
    filterName=nameQuery;
    if (nameQuery != null && nameQuery.isNotEmpty) {
      tempFilteredList = tempFilteredList.where((cur) {
        final mobile = cur.mobileNumber?.toLowerCase() ?? '';
        final email = cur.email?.toLowerCase() ?? '';
        final name = cur.fullName?.toLowerCase() ?? '';
        final gname = cur.guardians!.name?.toLowerCase() ?? '';
        final guname = cur.guardians!.userName?.toLowerCase() ?? '';
        final gemail = cur.guardians!.email?.toLowerCase() ?? '';
        final gnationalid = cur.guardians!.nationalId?.toLowerCase() ?? '';
        return mobile.contains(nameQuery.toLowerCase())|| email.contains(nameQuery.toLowerCase())||name.contains(nameQuery.toLowerCase())||gname.contains(nameQuery.toLowerCase())||guname.contains(nameQuery.toLowerCase())||gemail.contains(nameQuery.toLowerCase())||gnationalid.contains(nameQuery.toLowerCase());
      }).toList();
    }

    if (grade != null && grade.isNotEmpty) {
      tempFilteredList = tempFilteredList.where((cur) {
        return cur.grade!.enName == grade || cur.grade!.enName == grade;
      }).toList();
    }


    if (classs != null && classs.isNotEmpty) {
      tempFilteredList = tempFilteredList.where((cur) {
        return cur.classes!.enName == classs || cur.classes!.name == classs;
      }).toList();
    }
    if (division != null && division.isNotEmpty) {
      tempFilteredList = tempFilteredList.where((cur) {
        return cur.division!.enName == division || cur.division!.name == division;
      }).toList();
    }

    filteredStudents = tempFilteredList;
    update();
  }









  setGradeList(List<String> value){
    gradeIndex="";
    gradelist.clear();
    gradelist = value;
    setGradeLoading(false);
    update();
  }
  setClassList(List<String> value){
    classIndex="";
    classlist.clear();
    classlist = value;
    setClassLoading(false);
    update();
  }
  setDivisionList(List<String> value){
    setDivisionLoading(false);
    divisionlist.clear();
    divisionIndex="";
    divisionlist = value;
    update();
  }



  setGradeLoading(bool value){
    isGradeLoading = value;
    update();
  }
  setClassLoading(bool value){
    isClassLoading = value;
    classIndex = "";
    update();
  }
  setDivisionLoading(bool value){
    isDivisionLoading = value;
    update();
  }

  resetOnSessionChange(){
    gradeIndex = "";
    classIndex = "";
    divisionIndex = "";
    update();
  }

  resetOnGradeChange(){
    classIndex = "";
    divisionIndex = "";
    print("lkdssdf");
    update();
  }


  void selectIndex(String type, String? index) {

    switch (type) {
      case 'session':
        sessionIndex = index ?? "";
        break;
      case 'grade':
        gradeIndex = index ?? "";
        break;
      case 'class':
        classIndex = index ?? "";

        break;
      case 'division':
        divisionIndex = index ?? "";

        break;
    }

    searchByName(filterName, gradeIndex, classIndex,divisionIndex);

    update();
  }

  void setAllStudents(AllStudentModel model) {
    stud = model.students!;
    filteredStudents = List.from(stud);
    if (filterName != null && filterName!.isNotEmpty) {
      searchByName(filterName.toString(), gradeIndex,classIndex,divisionIndex);
    }

    if (gradeIndex.isNotEmpty) {
      filteredStudents = filteredStudents.where((emp) {
        return emp.grade!.name == gradeIndex ||emp.grade!.enName == gradeIndex ;
      }).toList();
    }
    if (classIndex.isNotEmpty) {
      filteredStudents = filteredStudents.where((emp) {
        return emp.classes!.enName == classIndex||emp.classes!.name == classIndex;
      }).toList();
    }
    if (divisionIndex.isNotEmpty) {
      filteredStudents = filteredStudents.where((emp) {
        return emp.division!.enName == divisionIndex||emp.division!.name == divisionIndex;
      }).toList();
    }

    setIsLoading(false);
    update();
  }

  setIsLoading(bool value){
    isLoading = value;
    update();
  }


 
  void setAllClasses(AllClassModel clas) {
    classlist.clear();
    for (int j = 0; j < clas.classes!.length; j++) {
      classlist.add(clas.classes![j].enName.toString());
    }
    update();
    updateList("class", classlist);
  }

  void setAllGrades(AllGradesModel grade) {
    gradelist.clear();
    for (int k = 0; k < grade.grades!.length; k++) {
      gradelist.add(grade.grades![k].enName.toString());
    }
    update();
    updateList("grade", gradelist);
  }

  void setAllDivision(AllDivisionModel division) {
    divisionlist.clear();
    for (int k = 0; k < division.division!.length; k++) {
      divisionlist.add(division.division![k].enName.toString());
    }
    update();
    updateList("division", divisionlist);
  }

  void updateList(
    String type,
    List<String> options,
  ) {
    switch (type) {
      case 'session':
        sessionlist = options;
        break;
      case 'grade':
        gradelist = options;
        break;
      case 'class':
        classlist = options;
        break;
      case 'division':
        divisionlist = options;
        break;
    }
    update();
  }

  String get selectedsessionIndex => sessionIndex;

  String get selectedgradeIndex => gradeIndex;

  String get selectedclassIndex => classIndex;

  String get selecteddivisionIndex => divisionIndex;
}
