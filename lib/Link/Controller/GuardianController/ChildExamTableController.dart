import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vms_school/Link/Model/AdminModel/School_Models/AllClassesModel.dart';
import 'package:vms_school/Link/Model/AdminModel/School_Models/AllSemesterModel.dart';
import 'package:vms_school/Link/Model/AdminModel/School_Models/DropDownCuriculmModel.dart';
import 'package:vms_school/Link/Model/AdminModel/School_Models/ExamTableModel.dart';
import 'package:vms_school/Link/Model/AdminModel/School_Models/ExamTypeModel.dart';
import 'package:vms_school/Translate/local_controller.dart';
import 'package:vms_school/main.dart';

class Childexamtablecontroller extends GetxController {
  bool isLoading = true;

  List<Quiz> quizList = [];
  void initialData() {
    quizList = [];
    update();
  }

  void setAllQuiz(ExamTableModel model) {
    quizList.clear();
    quizList = model.quiz!;
    setIsLoading(false);
  }

  setIsLoading(bool value) {
    isLoading = value;
    update();
  }
}
