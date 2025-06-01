import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Selected_Class_Controller extends GetxController {
  List<String> moveMenu = [];
  int? classid;
  int? divisionid;
  initialinClass(String value, int id) {
    moveMenu = [];
    moveMenu.add(value);
    classid = id;
    update();
  }

  void addToPath(String value) {
    final existingIndex = moveMenu.indexOf(value);
    if (existingIndex != -1) {
      moveMenu = moveMenu.sublist(0, existingIndex + 1);
    } else {
      moveMenu.add(value);
    }
    update();
  }

  // عند الضغط على عنصر: نمسح كل ما بعده
  void onItemTap(int index) {
    moveMenu = moveMenu.sublist(0, index + 1);
    update();
    print('المسار الحالي: ${moveMenu.join(" / ")}');
  }

  List<Map<String, dynamic>> dataList = [
    {
      "name": "Curriculum".tr,
      "icon": Icons.menu_book,
    },
    {
      "name": "Divisions".tr,
      "icon": Icons.class_outlined,
    },
    {
      "name": "Files".tr,
      "icon": Icons.file_copy_outlined,
    },
    {
      "name": "Links".tr,
      "icon": Icons.link,
    },
    {
      "name": "Pages".tr,
      "icon": Icons.web,
    },
    {
      "name": "Quiz".tr,
      "icon": Icons.question_mark_rounded,
    },
    {
      "name": "Question Bank".tr,
      "icon": Icons.comment_bank_outlined,
    },
    {
      "name": "Trivia".tr,
      "icon": Icons.workspaces_sharp,
    },
  ];

  bool isLoading = false;
}
