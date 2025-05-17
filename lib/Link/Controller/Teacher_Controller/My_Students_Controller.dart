import 'package:get/get.dart';
import 'package:vms_school/Link/Model/AdminModel/School_Models/AllDivisionModel.dart';
import 'package:vms_school/Translate/local_controller.dart';
import '../../Model/Teacher_Model/My_Students_Model.dart';

class My_Students_Controller extends GetxController {
  List<Students>? students;
  List<Students> filteredStudents = [];

  String classIndex = "";
  String divisionIndex = "";
  String? filterName = '';
  String? filterClass = '';
  String? filterDivision = '';

  List<String> classlist = [];
  bool isClassLoading = true;
  List<String> divisionlist = [];
  bool isDivisionLoading = true;

  bool IsLoading = true;

  setIsloading(bool value) {
    IsLoading = value;
    update();
  }

  String? guaName;

  void Setname(String value) {
    guaName = value;
    update();
  }

  void setAllStudents(My_Students_Model model) {
    students = model.students!;
    filteredStudents = List.from(students!);
    if (filterName != null && filterName!.isNotEmpty) {
      searchByName(filterName.toString(), classIndex, divisionIndex);
    }

    if (classIndex.isNotEmpty) {
      filteredStudents = filteredStudents.where((emp) {
        return emp.classes!.enName == classIndex ||
            emp.classes!.name == classIndex;
      }).toList();
    }
    if (divisionIndex.isNotEmpty) {
      filteredStudents = filteredStudents.where((emp) {
        return emp.division!.enName == divisionIndex ||
            emp.division!.name == divisionIndex;
      }).toList();
    }
    setIsloading(false);
    update();
  }

  void searchByName(String? nameQuery, String? classs, String? division) {
    List<Students> tempFilteredList = List.from(students!);
    filterName = nameQuery;
    if (nameQuery != null && nameQuery.isNotEmpty) {
      tempFilteredList = tempFilteredList.where((cur) {
        final email = cur.email?.toLowerCase() ?? '';
        final username = cur.userName?.toLowerCase() ?? '';
        final name = cur.fullName?.toLowerCase() ?? '';
        final gname = cur.guardians!.name?.toLowerCase() ?? '';
        final gemail = cur.guardians!.email?.toLowerCase() ?? '';
        return email.contains(nameQuery.toLowerCase()) ||
            name.contains(nameQuery.toLowerCase()) ||
            gname.contains(nameQuery.toLowerCase()) ||
            gemail.contains(nameQuery.toLowerCase()) ||
            username.contains(nameQuery.toLowerCase());
      }).toList();
    }

    if (classs != null && classs.isNotEmpty) {
      tempFilteredList = tempFilteredList.where((cur) {
        return cur.classes!.enName == classs || cur.classes!.name == classs;
      }).toList();
    }
    if (division != null && division.isNotEmpty) {
      tempFilteredList = tempFilteredList.where((cur) {
        return cur.division!.enName == division ||
            cur.division!.name == division;
      }).toList();
    }

    filteredStudents = tempFilteredList;
    update();
  }

  setClassList(List<String> value) {
    classIndex = "";
    classlist.clear();
    classlist = value;
    setClassLoading(false);
    update();
  }

  void clearFilter() {
    searchByName("", classIndex, divisionIndex);
    update();
  }

  setDivisionList(List<String> value) {
    setDivisionLoading(false);
    divisionlist.clear();
    divisionIndex = "";
    divisionlist = value;
    update();
  }

  setClassLoading(bool value) {
    isClassLoading = value;
    classIndex = "";
    divisionIndex = "";
    update();
  }

  setDivisionLoading(bool value) {
    isDivisionLoading = value;
    update();
  }

  void updateList(
    String type,
    List<String> options,
  ) {
    switch (type) {
      case 'class':
        classlist = options;
        break;
      case 'division':
        divisionlist = options;
        break;
    }
    update();
  }

  void setAllDivision(AllDivisionModel division) {
    divisionlist.clear();
    for (int k = 0; k < division.division!.length; k++) {
      if (Get.find<LocalizationController>().currentLocale.value.languageCode ==
          'ar')
        divisionlist.add(division.division![k].name.toString());
      else
        divisionlist.add(division.division![k].enName.toString());
    }
    update();
    updateList("division", divisionlist);
  }

  String get selectedclassIndex => classIndex;

  String get selecteddivisionIndex => divisionIndex;

  void initialData() {
    classIndex = "";
    divisionIndex = "";
    update();
  }
}
