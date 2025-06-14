import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:vms_school/Link/Model/AdminModel/School_Models/Curriculum_Model.dart';
import 'package:vms_school/Link/Model/LMS_Model/Files_Model.dart';
import 'package:vms_school/Link/Model/LMS_Model/LinksLMSModel.dart';
import 'package:vms_school/Link/Model/LMS_Model/Questions_Models/TrueOrFalseModel.dart';
import 'package:vms_school/Translate/local_controller.dart';

class Trueorfalsecontroller extends GetxController {
  bool? selectedOption = true;
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

  void Add_Question(Question cthc) {
    questions!.insert(0, cthc);
    filtered_questions = List.from(questions!);

    if (filterName != null && filterName!.isNotEmpty) {
      searchByName(filterName.toString());
    }

    update();
  }

  void Delete_Question(Question cthc) {
    questions!.remove(cthc);
    filtered_questions = List.from(questions!);
    if (filterName != null && filterName!.isNotEmpty) {
      searchByName(filterName.toString());
    }
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

  bool Hidden = false;
  updateHid(bool value) {
    Hidden = value;
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
    Hidden = false;
    chooseTrue = "صح";
    chooseFalse = "خطأ";
    update();
  }

  void resetError() {
    IsQuestionError = false;
    update();
  }
}
