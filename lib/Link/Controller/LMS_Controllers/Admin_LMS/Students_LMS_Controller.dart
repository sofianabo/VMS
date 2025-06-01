import 'package:get/get.dart';
import 'package:vms_school/Link/Model/LMS_Model/Students_LMS_Model.dart';

class Students_LMS_Controller extends GetxController {
  List<LmsStudents>? stud;
  List<LmsStudents>? filteredStudents;
  bool isLoading = true;

  void clearFilter() {
    searchByName("");
    update();
  }

  void searchByName(String? nameQuery) {
    List<LmsStudents> tempFilteredList = List.from(stud!);
    if (nameQuery != null && nameQuery.isNotEmpty) {
      tempFilteredList = tempFilteredList.where((cur) {
        final name = cur.fullName?.toLowerCase() ?? '';

        return name.contains(nameQuery.toLowerCase());
      }).toList();
    }
    filteredStudents = tempFilteredList;
    update();
  }

  setIsLoading(bool value) {
    isLoading = value;
    update();
  }

  void setAllStudents(Students_LMS_Model students_lms_model) {
    stud = students_lms_model.lmsStudents!;
    filteredStudents = List.from(stud!);
    setIsLoading(false);
    update();
  }
}
