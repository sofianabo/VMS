import 'package:get/get.dart';
import 'package:vms_school/Link/Model/LMS_Model/Questions_Models/TrueOrFalseModel.dart';

class Quiz_True_Or_False_Controller extends GetxController {
  bool selectedOption = true;
  String? chooseTrue = "صح";
  String? chooseFalse = "خطأ";

  void selectOption(bool option) {
    selectedOption = option;
    update();
  }

  List<Question>? questions;
  List<Question> filtered_questions = [];

  String? filterName = '';

  void clearFilter() {
    searchByName(
      "",
    );
    update();
  }

  void searchByName(
    String? nameQuery,
  ) {
    filterName = nameQuery;
    List<Question> tempFilteredList = List.from(questions!);

    if (nameQuery != null && nameQuery.isNotEmpty) {
      tempFilteredList = tempFilteredList.where((cur) {
        final curName = cur.description?.toLowerCase() ?? '';
        return curName.contains(nameQuery.toLowerCase());
      }).toList();
    }

    filtered_questions = tempFilteredList;
    update();
  }

  bool isLoading = true;

  RxString fileName = "".obs;

  void SetQuestion(TrueOrFalseModel ques) {
    questions = ques.question;

    filtered_questions = List.from(questions!);

    if (filterName != null && filterName!.isNotEmpty) {
      searchByName(filterName.toString());
    }

    SetIsLoading(false);
    update();
  }

  void SetIsLoading(bool value) {
    isLoading = value;
    update();
  }

  bool IsQuestionError = false;

  void updateFieldError(String type, bool newValue) {
    switch (type) {
      case 'question':
        IsQuestionError = newValue;
        break;
      default:
        print("Error: Invalid type");
    }
    update();
  }

  bool IsEnglish = false;
  updateHid(bool value) {
    IsEnglish = value;
    if (value == true) {
      chooseTrue = "True";
      chooseFalse = "False";
    } else {
      chooseTrue = "صح";
      chooseFalse = "خطأ";
    }
    update();
  }

  void reset() {
    IsQuestionError = false;
    IsEnglish = false;
    chooseTrue = "صح";
    chooseFalse = "خطأ";
    update();
  }
}
