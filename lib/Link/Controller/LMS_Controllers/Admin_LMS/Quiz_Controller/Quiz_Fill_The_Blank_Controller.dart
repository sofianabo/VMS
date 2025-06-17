import 'package:get/get.dart';
import 'package:vms_school/Link/Model/LMS_Model/Questions_Models/Fill_The_Blank_Model.dart';

class Quiz_Fill_The_Blank_Controller extends GetxController {
  String? filterName = '';
  List<Question>? questions;
  List<Question>? filterdQuestions;

  void clearFilter() {
    searchByName("");
    update();
  }

  // تنظيف البيانات بعد الإضافة
  void clearData() {
    IsAnameError = false;
  }

  void searchByName(String? nameQuery) {
    filterName = nameQuery;
    List<Question> tempFilteredList = List.from(questions!);

    if (nameQuery != null && nameQuery.isNotEmpty) {
      tempFilteredList = tempFilteredList.where((cur) {
        final curName = cur.description?.toLowerCase() ?? '';
        return curName.contains(nameQuery.toLowerCase());
      }).toList();
    }

    filterdQuestions = tempFilteredList;
    update();
  }

  bool isLoading = true;

  void Set_Question(Fill_The_Blank_Model cthc) {
    questions = cthc.question;

    filterdQuestions = List.from(questions!);

    if (filterName != null && filterName!.isNotEmpty) {
      searchByName(filterName.toString());
    }

    SetIsLoading(false);
    update();
  }

  void Add_Question(Question cthc) {
    questions!.insert(0, cthc);
    filterdQuestions = List.from(questions!);

    if (filterName != null && filterName!.isNotEmpty) {
      searchByName(filterName.toString());
    }
    clearData();
    update();
  }

  void Delete_Question(Question cthc) {
    questions!.remove(cthc);
    filterdQuestions = List.from(questions!);
    if (filterName != null && filterName!.isNotEmpty) {
      searchByName(filterName.toString());
    }
    update();
  }

  void SetIsLoading(bool value) {
    isLoading = value;
    update();
  }

  bool IsAnameError = false;
  bool iscurrError = false;
  bool isLinkError = false;

  void updateFieldError(String type, bool newValue) {
    switch (type) {
      case 'aname':
        IsAnameError = newValue;
        break;
      case 'linkurl':
        isLinkError = newValue;
        break;
      case 'curr':
        iscurrError = newValue;
        break;

      default:
        print("Error: Invalid type");
    }
    update();
  }

  void resetError() {
    IsAnameError = false;
    iscurrError = false;
    isLinkError = false;
    update();
  }
}
