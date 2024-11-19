import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:getx/Link/Model/AdminModel/AllSessionModel.dart';

class SessionController extends GetxController {
  var Sessions = [
    {
      "name": "2025-2024",
      "status": "Opening",
      "startDate": "13/1/2003",
      "endDate": "13/1/2003",
    },
    {
      "name": "2024-2023",
      "status": "Closed",
      "startDate": "13/1/2003",
      "endDate": "13/1/2003",
    },
  ].obs;




  TextEditingController sessionController = TextEditingController();
  var borderColor = Color(0xffD9D9D9).obs; // Reactive border color



  

  SessionController() {
    // Add listener to sessionController to update border color
    sessionController.addListener(() {
      updateBorderColor();
    });
  }

  void updateStatus(int index, String newStatus) {
    Sessions[index]['status'] = newStatus;
    update();
  }

  void updateBorderColor() {
    int? year = int.tryParse(sessionController.text);
    if (year == null || year < 2024 || year >= 2099) {
      borderColor.value = Colors.red; // Set border color to red
    } else {
      borderColor.value = Color(0xffD9D9D9); // Reset to default
    }
  }

  var currentYear = 0.obs; // متغير ملاحظ لحفظ السنة

  void updateYear(String year) {
    int? parsedYear = int.tryParse(year);
    if (parsedYear != null &&
        year.length == 4 &&
        parsedYear >= 2024 &&
        parsedYear < 2099) {
      currentYear.value = parsedYear + 1;
    }
  }
}
