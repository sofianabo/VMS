import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:vms_school/Link/Controller/GuardianController/MyChildren_Controller.dart';
import 'package:vms_school/Link/Controller/WidgetController/DropDown_Controllers/Sessions_DropDown_Controller.dart';
import 'package:vms_school/Link/Model/AdminModel/School_Models/AllSessionModel.dart';
import 'package:vms_school/view/Both_Platform/widgets/VMSAlertDialog.dart';

class SessionController extends GetxController {
  var Sessionss = <Map<String, dynamic>>[].obs;

  List<Sessions>? sessionsss;
  List<String> seassionList = [];
  bool isLoading = true;

  setData(AllSessionModel sessions) {
    selectedDropdownValue.value = "";
    seassionList.clear();
    Sessionss.clear();
    sessionsss = sessions.sessions;
    setIsLoading(false);
    for (var stu in sessions.sessions!) {
      seassionList.add("${stu.year}");
      Sessionss.add({
        'id': stu.id,
        'name': stu.year,
        'status': stu.status,
        'startDate': stu.startDate,
        'endDate': stu.endDate,
        'hasStudents': stu.hasStudent == 1 ? true : false,
      });
    }
    Get.find<MyChildren_Controller>().setAllSession(sessions);
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
  Rx<DateTime?> firstsemesterStartDate = Rx<DateTime?>(null);
  Rx<DateTime?> firstsemesterendDate = Rx<DateTime?>(null);
  Rx<DateTime?> secondsemesterStartDate = Rx<DateTime?>(null);
  Rx<DateTime?> secondsemesterendDate = Rx<DateTime?>(null);

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

  void selectEndDate(BuildContext context) async {
    if (startDate.value == null) {
      return;
    }

    final DateTime minEndDate = startDate.value!
        .add(Duration(days: 1)); // بعد البدء بيوم واحد على الأقل
    final DateTime maxEndDate = DateTime(
      startDate.value!.year + 2, // نفس اليوم والشهر بعد سنتين
      startDate.value!.month,
      startDate.value!.day,
    ); // حتى سنتين بعد السنة الحالية

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

  void selectFirstSemsterStartDate(BuildContext context) async {
    final DateTime now = DateTime.now();
    final DateTime minDate = DateTime(now.year - 1); // سنة قبل الحالية
    final DateTime maxDate = DateTime(now.year + 2); // سنتان بعد الحالية

    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: firstsemesterStartDate.value ?? now,
      firstDate: minDate,
      lastDate: maxDate,
    );

    if (picked != null) {
      firstsemesterStartDate.value = picked;
      updateFieldError("firstStart", false);
      if (firstsemesterendDate.value != null &&
          firstsemesterendDate.value!.isBefore(picked.add(Duration(days: 1)))) {
        firstsemesterendDate.value = null;
      }
    }
  }

  void selectFirstSemesterEndDate(BuildContext context) async {
    if (firstsemesterStartDate.value == null) {
      return;
    }

    final DateTime minEndDate = firstsemesterStartDate.value!
        .add(Duration(days: 1)); // بعد البدء بيوم واحد على الأقل
    final DateTime maxEndDate = DateTime(
      firstsemesterStartDate.value!.year + 2, // نفس اليوم والشهر بعد سنتين
      firstsemesterStartDate.value!.month,
      firstsemesterStartDate.value!.day,
    ); // حتى سنتين بعد السنة الحالية

    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: firstsemesterendDate.value ?? minEndDate,
      firstDate: minEndDate,
      lastDate: maxEndDate,
    );

    if (picked != null) {
      firstsemesterendDate.value = picked;
      updateFieldError("firstEnd", false);
    }
  }

  void selectSecondSemsterStartDate(BuildContext context) async {
    final DateTime now = DateTime.now();
    final DateTime minDate = DateTime(now.year - 1); // سنة قبل الحالية
    final DateTime maxDate = DateTime(now.year + 2); // سنتان بعد الحالية

    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: secondsemesterStartDate.value ?? now,
      firstDate: minDate,
      lastDate: maxDate,
    );

    if (picked != null) {
      secondsemesterStartDate.value = picked;
      updateFieldError("secondStart", false);
      if (secondsemesterendDate.value != null &&
          secondsemesterendDate.value!
              .isBefore(picked.add(Duration(days: 1)))) {
        secondsemesterendDate.value = null;
      }
    }
  }

  void selectSecondSemesterEndDate(BuildContext context) async {
    if (secondsemesterStartDate.value == null) {
      return;
    }

    final DateTime minEndDate = secondsemesterStartDate.value!
        .add(Duration(days: 1)); // بعد البدء بيوم واحد على الأقل
    final DateTime maxEndDate = DateTime(
      secondsemesterStartDate.value!.year + 2, // نفس اليوم والشهر بعد سنتين
      secondsemesterStartDate.value!.month,
      secondsemesterStartDate.value!.day,
    ); // حتى سنتين بعد السنة الحالية

    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: secondsemesterendDate.value ?? minEndDate,
      firstDate: minEndDate,
      lastDate: maxEndDate,
    );

    if (picked != null) {
      secondsemesterendDate.value = picked;
      updateFieldError("secondEnd", false);
    }
  }

  bool IsnameError = false;
  bool IsstartError = false;
  bool IsEndError = false;
  bool IsFirstStartError = false;
  bool IsFirstEndError = false;
  bool IsSecondStartError = false;
  bool IsSecondEndError = false;
  bool IsFirstDaysError = false;
  bool IsSecondDaysError = false;

  void updateFieldError(String type, bool newValue) {
    switch (type) {
      case 'name':
        IsnameError = newValue;
        break;
        case 'firstDays':
        IsFirstDaysError = newValue;
        break;
        case 'secondDays':
        IsSecondDaysError = newValue;
        break;
      case 'start':
        IsstartError = newValue;
        break;
      case 'end':
        IsEndError = newValue;
        break;
      case 'firstStart':
        IsFirstStartError = newValue;
        break;
      case 'firstEnd':
        IsFirstEndError = newValue;
        break;
      case 'secondStart':
        IsSecondStartError = newValue;
        break;
      case 'secondEnd':
        IsSecondEndError = newValue;
        break;

      default:
        print("Error: Invalid type");
    }
    update();
  }

  Rx<DateTime?> get selectStartDateindex => startDate;
  Rx<DateTime?> get selectEndDateindex => endDate;
  Rx<DateTime?> get selectFirstStartindex => firstsemesterStartDate;
  Rx<DateTime?> get selectFirstEndindex => firstsemesterendDate;
  Rx<DateTime?> get selectSecondStartindex => secondsemesterStartDate;
  Rx<DateTime?> get selectSecondEndindex => secondsemesterendDate;

  void initialData() {
    startDate.value = null;
    endDate.value = null;
    firstsemesterStartDate.value = null;
    firstsemesterendDate.value = null;
    secondsemesterStartDate.value = null;
    secondsemesterendDate.value = null;
    checkbox1.value = false;
    checkbox2.value = false;
    checkbox3.value = false;
    checkbox4.value = false;
    selectedDropdownValue.value = "";
    IsnameError = false;
    IsstartError = false;
    IsEndError = false;
    currentYear = 0.obs;
    update();
  }

  // حالة القائمة المنسدلة
  RxString selectedDropdownValue = "".obs;

  // حالات خانات الاختيار
  var checkbox1 = false.obs;
  var checkbox2 = false.obs;
  var checkbox3 = false.obs;
  var checkbox4 = false.obs;

  // دالة لتغيير حالة الخانة الأولى
  void toggleCheckbox1(bool value) {
    checkbox1.value = value;
    if (!value) {
      checkbox2.value = false;
      checkbox3.value = false;
      checkbox4.value = false;
    }
  }

  // دالة للحصول على النص المعروض على الزر
  String get buttonText {
    List<String> selected = [];
    if (checkbox1.value) selected.add("Classes".tr);
    if (checkbox2.value) selected.add("Divisions".tr);
    if (checkbox3.value) selected.add("Quiz Types".tr);
    if (checkbox4.value) selected.add("Report Card Settings".tr);

    return selected.isEmpty ? "Move".tr : selected.join("، ");
  }

  void showDialog() {
    Get.dialog(VMSAlertDialog(
        action: [],
        contents: SingleChildScrollView(
          child: Obx(() => Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  // القائمة المنسدلة
                  DropdownButton<String>(
                    dropdownColor: Get.theme.cardColor,
                    iconDisabledColor: Colors.grey,
                    borderRadius: BorderRadius.all(Radius.circular(3)),
                    isExpanded: true,
                    style:
                        Get.theme.textTheme.bodyMedium!.copyWith(fontSize: 14),
                    value: selectedDropdownValue.value.isEmpty
                        ? null
                        : selectedDropdownValue.value,
                    hint: Text("Select Session".tr),
                    items: seassionList.map((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(
                          value,
                          style: Get.theme.textTheme.bodyMedium!
                              .copyWith(fontSize: 14),
                        ),
                      );
                    }).toList(),
                    onChanged: (newValue) {
                      selectedDropdownValue.value = newValue ?? '';
                    },
                  ),
                  SizedBox(height: 20),

                  CheckboxListTile(
                    title: Text("Classes".tr),
                    value: checkbox1.value,
                    onChanged: selectedDropdownValue.value != ""
                        ? (bool? value) {
                            toggleCheckbox1(value ?? false);
                          }
                        : null,
                  ),
                  CheckboxListTile(
                    title: Text("Divisions".tr),
                    value: checkbox2.value,
                    onChanged: checkbox1.value
                        ? (bool? value) {
                            checkbox2.value = value ?? false;
                          }
                        : null,
                  ),
                  CheckboxListTile(
                    title: Text("Quiz Types".tr),
                    value: checkbox3.value,
                    onChanged: checkbox1.value
                        ? (bool? value) {
                            checkbox3.value = value ?? false;
                          }
                        : null,
                  ),
                  CheckboxListTile(
                    title: Text("Report Card Settings".tr),
                    value: checkbox4.value,
                    onChanged: checkbox1.value
                        ? (bool? value) {
                            checkbox4.value = value ?? false;
                          }
                        : null,
                  ),
                ],
              )),
        ),
        apptitle: "Move From Session".tr,
        subtitle: "none"));
  }
}
