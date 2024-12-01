import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:vms_school/Link/Model/AdminModel/AllSessionModel.dart';

class SessionController extends GetxController {


  var Sessionss = <Map<String, dynamic>>[
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


  List<Sessions>? sessions;



  bool isLoading = true;

  setData(AllSessionModel sessions) {
    sessions = sessions;
    Sessionss.clear();
    setIsLoading(false);
    for (var stu in sessions.sessions!) {
      Sessionss.add({
        'id': stu.id,
        'name': stu.year,
        'status': stu.status,
        'startDate': stu.startDate,
        'endDate': stu.endDate,
      });
    }
    update();
  }

  setIsLoading(bool isload) {
    isLoading = isload;
    update();
  }


  TextEditingController sessionController = TextEditingController();
  var borderColor = Color(0xffD9D9D9).obs; // Reactive border color


  void updateStatus(int index, String newStatus) {
    Sessionss[index]['status'] = newStatus;
    update();
  }
  
  var currentYear = 0.obs;

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
