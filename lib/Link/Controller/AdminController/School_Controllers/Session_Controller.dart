import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:vms_school/Link/Controller/WidgetController/Sessions_DropDown_Controller.dart';
import 'package:vms_school/Link/Model/AdminModel/AllSessionModel.dart';

class SessionController extends GetxController {
  var Sessionss = <Map<String, dynamic>>[].obs;

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
        'hasStudents': stu.hasStudent == 1 ? true : false,
      });
    }
    final sessionCont = Get.find<All_Screen_Sessions_Controller>();
    sessionCont.setAllSession(sessions);
    update();
  }

  setIsLoading(bool isload) {
    isLoading = isload;
    update();
  }

  TextEditingController sessionController = TextEditingController();
  var borderColor = const Color(0xffD9D9D9).obs; // Reactive border color

  void updateStatus(int index, String newStatus) {
    Sessionss[index]['status'] = newStatus;
    update();
  }

  var currentYear = 0.obs;

  void updateYear(String year) {
    if (year.isNotEmpty && year.trim() != "") {
      updateFieldError("name", false);
    } else {
      updateFieldError("name", false);
    }
    int? parsedYear = int.tryParse(year);
    if (parsedYear != null &&
        year.length == 4 &&
        parsedYear >= 2024 &&
        parsedYear < 2099) {
      currentYear.value = parsedYear + 1;
    }
  }

  Rx<DateTime?> startDate = Rx<DateTime?>(null);
  Rx<DateTime?> endDate = Rx<DateTime?>(null);

  void selectStartDate(BuildContext context) async {
    final DateTime now = DateTime.now();
    final DateTime minDate = DateTime(now.year - 1); // سنة قبل الحالية
    final DateTime maxDate = DateTime(now.year + 2); // سنتان بعد الحالية

    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: startDate.value ?? now,
      firstDate: minDate,
      lastDate: maxDate,
    );

    if (picked != null) {
      startDate.value = picked;
      updateFieldError("start", false);
      if (endDate.value != null &&
          endDate.value!.isBefore(picked.add(Duration(days: 1)))) {
        endDate.value = null;
      }
    }
  }

  bool IsnameError = false;
  bool IsstartError = false;
  bool IsEndError = false;

  void updateFieldError(String type, bool newValue) {
    switch (type) {
      case 'name':
        IsnameError = newValue;
        break;
      case 'start':
        IsstartError = newValue;
        break;
      case 'end':
        IsEndError = newValue;
        break;

      default:
        print("Error: Invalid type");
    }
    update();
  }

  void selectEndDate(BuildContext context) async {
    if (startDate.value == null) {
      return;
    }

    final DateTime minEndDate = startDate.value!
        .add(Duration(days: 1)); // بعد البدء بيوم واحد على الأقل
    final DateTime maxEndDate =
        DateTime(DateTime.now().year + 2); // حتى سنتين بعد السنة الحالية

    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: endDate.value ?? minEndDate,
      firstDate: minEndDate,
      lastDate: maxEndDate,
    );

    if (picked != null) {
      endDate.value = picked;
      updateFieldError("end", false);
    }
  }

  Rx<DateTime?> get selectStartDateindex => startDate;
  Rx<DateTime?> get selectEndDateindex => endDate;
}
