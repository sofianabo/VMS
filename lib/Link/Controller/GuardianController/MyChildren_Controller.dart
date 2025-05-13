import 'package:get/get.dart';
import 'package:vms_school/Link/Model/Guardian_Model/MyChildren.dart';

class MyChildren_Controller extends GetxController {
  List<Students>? students;
  List<Students> filteredStudents = [];

  bool IsLoading = true;

  setIsloading(bool value) {
    IsLoading = value;
    update();
  }

  setMyChildren(MyChildren allstudents) {
    students = allstudents.students;
    filteredStudents = List.from(students!);
    if (filterName != null && filterName!.isNotEmpty) {
      searchByName(filterName.toString());
    }

    IsLoading = false;
    update();
  }

  String? filterName = '';

  String? guaName;

  void clearFilter() {
    searchByName("");
    update();
  }

  void Setname(String value) {
    guaName = value;
    update();
  }

  void searchByName(String? nameQuery) {
    List<Students> tempFilteredList = List.from(students!);
    filterName = nameQuery;
    if (nameQuery != null && nameQuery.isNotEmpty) {
      tempFilteredList = tempFilteredList.where((cur) {
        final name = cur.fullName?.toLowerCase() ?? '';

        return name.contains(nameQuery.toLowerCase());
      }).toList();
    }

    filteredStudents = tempFilteredList;
    update();
  }
}
