import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vms_school/Icons_File/v_m_s__icons_icons.dart';
import 'package:vms_school/Link/API/AdminAPI/Employees_APIs/GetEmployeeAttendenceAPI.dart';
import 'package:vms_school/Link/API/AdminAPI/Employees_APIs/IncreaseEmployeAttendenceAPI.dart';
import 'package:vms_school/Link/API/AdminAPI/Students/Students_APIs/IncreaseAttendanceAPI.dart';
import 'package:vms_school/Link/API/AdminAPI/Students/Students_APIs/StudentAttendenceAPI.dart';
import 'package:vms_school/Link/API/AdminAPI/Teacher_APIS/GetTeacherAttendenceAPI.dart';
import 'package:vms_school/Link/API/AdminAPI/Teacher_APIS/IncreaseTeacherAttendenceAPI.dart';
import 'package:vms_school/Link/Controller/AdminController/Employee_Controllers/Add_Data_controller.dart';
import 'package:vms_school/Link/Controller/AdminController/Employee_Controllers/AllEmpolyeeController.dart';
import 'package:vms_school/Link/Controller/AdminController/Employee_Controllers/EmployeeAttendenceController.dart';
import 'package:vms_school/Link/Controller/AdminController/School_Controllers/ExamTableController.dart';
import 'package:vms_school/Link/Controller/AdminController/School_Controllers/Session_Controller.dart';
import 'package:vms_school/Link/Controller/AdminController/School_Controllers/Transaction_Controller.dart';
import 'package:vms_school/Link/Controller/AdminController/Students_Controllers/AdminStudentsAttendens.dart';
import 'package:vms_school/Link/Controller/AdminController/Employee_Controllers/Employeeecontroller.dart';
import 'package:vms_school/Link/Controller/AdminController/Students_Controllers/RequestsController.dart';
import 'package:vms_school/Link/Controller/AdminController/Students_Controllers/Student_Attendenc_Controller.dart';
import 'package:vms_school/Link/Controller/AdminController/Students_Controllers/StudyYearStudentsController.dart';
import 'package:vms_school/Link/Controller/AdminController/Teacher_Controllers/AllTeacherAtendenceController.dart';
import 'package:vms_school/Link/Controller/AdminController/Teacher_Controllers/AllTeachersController.dart';
import 'package:intl/intl.dart';
import 'package:vms_school/Link/Controller/LMS_Controllers/Admin_LMS/HomeworkController.dart';
import 'package:vms_school/Link/Controller/LMS_Controllers/Admin_LMS/QuizController/AllQuizController.dart';
import 'package:vms_school/Link/Controller/WidgetController/DropDown_Controllers/Sessions_DropDown_Controller.dart';
import 'package:vms_school/Link/Controller/WidgetController/OtherWidget/DateControler.dart';

class DatePicker extends StatelessWidget {
  final double width;
  final double? height;
  final bool isRequired;

  const DatePicker({
    super.key,
    required this.width,
    this.height,
    this.isRequired = false,
  });

  @override
  Widget build(BuildContext context) {
    final DatePickerController controller = Get.put(DatePickerController());
    return Obx(
      () => Container(
        width: width,
        height: height ?? 40,
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (isRequired)
              Padding(
                padding: const EdgeInsets.only(bottom: 5.0),
                child: RichText(
                  text: const TextSpan(
                    text: "Select Date",
                    style: TextStyle(color: Colors.black, fontSize: 14),
                    children: [
                      TextSpan(
                        text: " *",
                        style: TextStyle(color: Colors.red, fontSize: 14),
                      ),
                    ],
                  ),
                ),
              ),
            SizedBox(
              height: height ?? 40,
              child: TextFormField(
                style: const TextStyle(fontSize: 14),
                controller: TextEditingController(
                  text: controller.selectedDate.value != null
                      ? DateFormat('yyyy-MM-dd')
                          .format(controller.selectedDate.value!)
                      : '',
                ),
                readOnly: true,
                onTap: () => controller.selectDate(context),
                decoration: InputDecoration(
                  hintText: "Select Date",
                  hintStyle: Theme.of(context)
                      .textTheme
                      .bodyMedium!
                      .copyWith(fontSize: 14),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5),
                    borderSide: BorderSide(
                        color: Theme.of(context).primaryColor, width: 2),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5),
                    borderSide: const BorderSide(color: Colors.grey),
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5),
                  ),
                  suffixIcon: IconButton(
                    icon: Icon(
                      VMS_Icons.calender,
                      color: Theme.of(context).primaryColor,
                      size: 16,
                    ),
                    onPressed: () => controller.selectDate(context),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class BirthDate extends StatelessWidget {
  final double width;
  final String Uptext;
  final double? height;
  final bool isRequired; // متغير لتحديد إذا كان الحقل مطلوبًا.
  final bool isError; // ✅ إضافة متغير للتحقق من الخطأ

  const BirthDate({
    super.key,
    required this.width,
    required this.Uptext,
    this.height,
    this.isError = false, // ✅ افتراضي لا يوجد خطأ

    this.isRequired = false, // افتراضي الحقل غير مطلوب.
  });

  @override
  Widget build(BuildContext context) {
    final Allempolyeecontroller controller = Get.put(Allempolyeecontroller());
    return Obx(
      () => Container(
        height: 80,
        width: width,
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 3.0),
              child: RichText(
                text: TextSpan(
                  text: Uptext,
                  style: Theme.of(context).textTheme.bodyMedium,
                  children: isRequired
                      ? [
                          const TextSpan(
                            text: " *",
                            style: TextStyle(color: Colors.red, fontSize: 14),
                          ),
                        ]
                      : [],
                ),
              ),
            ),

            SizedBox(
              height: height ?? 40,
              child: TextFormField(
                style: const TextStyle(fontSize: 14),
                controller: TextEditingController(
                  text: controller.Birthdate.value != null
                      ? DateFormat('yyyy-MM-dd')
                          .format(controller.Birthdate.value!)
                      : '',
                ),
                readOnly: true,
                onTap: () {
                  if (Get.find<Add_Data_controller>().roll != "observer" &&
                      Get.find<Add_Data_controller>().roll != "supervisor" &&
                      Get.find<Add_Data_controller>().roll != "subAdmin") {
                    controller.selectBirthDate(context);
                  }
                },
                decoration: InputDecoration(
                  hintText: "yyyy-MM-dd",
                  hintStyle: Theme.of(context)
                      .textTheme
                      .bodyMedium!
                      .copyWith(fontSize: 14, color: const Color(0xffD9D9D9)),

                  // ✅ تغيير لون الحدود بناءً على قيمة isError
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5),
                    borderSide: BorderSide(
                      color: isError ? Colors.red : const Color(0xffD9D9D9),
                      width: 2,
                    ),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5),
                    borderSide: BorderSide(
                      color: isError ? Colors.red : const Color(0xffD9D9D9),
                    ),
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5),
                    borderSide: BorderSide(
                      color: isError ? Colors.red : Colors.grey,
                    ),
                  ),
                  suffixIcon: IconButton(
                    icon: Icon(
                      VMS_Icons.calender,
                      color: Theme.of(context).primaryColor,
                      size: 16,
                    ),
                    onPressed: () {
                      if (Get.find<Add_Data_controller>().roll != "observer" &&
                          Get.find<Add_Data_controller>().roll !=
                              "supervisor" &&
                          Get.find<Add_Data_controller>().roll != "subAdmin") {
                        controller.selectBirthDate(context);
                      }
                    },
                  ),
                ),
              ),
            ),
            // ✅ عرض رسالة خطأ إذا كان هناك خطأ
            if (isError)
              Text(
                "يجب إدخال تاريخ صحيح",
                style: TextStyle(color: Colors.red, fontSize: 12),
              ),
          ],
        ),
      ),
    );
  }
}

class JoinDate extends StatelessWidget {
  final double width;
  final String Uptext;
  final double? height;
  final bool isRequired; // متغير لتحديد إذا كان الحقل مطلوبًا.
  final bool isError; // ✅ إضافة متغير للتحقق من الخطأ
  final bool enabled; // ✅ إضافة متغير للتحقق من الخطأ

  const JoinDate({
    super.key,
    required this.width,
    required this.Uptext,
    this.height,
    this.isRequired = false, // افتراضي الحقل غير مطلوب.
    this.isError = false,
    this.enabled = true, // ✅ افتراضي لا يوجد خطأ
  });

  @override
  Widget build(BuildContext context) {
    final Allempolyeecontroller controller = Get.put(Allempolyeecontroller());

    return Obx(
      () => Container(
        width: width,
        height: 80,
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 3.0),
              child: RichText(
                text: TextSpan(
                  text: Uptext,
                  style: Theme.of(context)
                      .textTheme
                      .bodyMedium!
                      .copyWith(fontSize: 14),
                  children: isRequired
                      ? [
                          const TextSpan(
                            text: " *",
                            style: TextStyle(color: Colors.red, fontSize: 14),
                          ),
                        ]
                      : [],
                ),
              ),
            ),
            SizedBox(
              height: height ?? 40,
              child: TextFormField(
                style: const TextStyle(fontSize: 14),
                controller: TextEditingController(
                  text: controller.Joindate.value != null
                      ? DateFormat('yyyy-MM-dd')
                          .format(controller.Joindate.value!)
                      : '',
                ),
                readOnly: true,
                onTap: () {
                  if (Get.find<Add_Data_controller>().roll != "observer" &&
                      Get.find<Add_Data_controller>().roll != "supervisor" &&
                      Get.find<Add_Data_controller>().roll != "subAdmin") {
                    controller.selectJoinDate(context);
                  }
                },
                decoration: InputDecoration(
                  hintText: "yyyy-MM-dd",
                  hintStyle: Theme.of(context)
                      .textTheme
                      .bodyMedium!
                      .copyWith(fontSize: 14, color: const Color(0xffD9D9D9)),

                  // ✅ تغيير لون الحدود بناءً على قيمة isError
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5),
                    borderSide: BorderSide(
                      color: isError ? Colors.red : const Color(0xffD9D9D9),
                      width: 2,
                    ),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5),
                    borderSide: BorderSide(
                      color: isError ? Colors.red : const Color(0xffD9D9D9),
                    ),
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5),
                    borderSide: BorderSide(
                      color: isError ? Colors.red : Colors.grey,
                    ),
                  ),
                  suffixIcon: IconButton(
                    icon: Icon(
                      VMS_Icons.calender,
                      color: Theme.of(context).primaryColor,
                      size: 16,
                    ),
                    onPressed: () {
                      if (Get.find<Add_Data_controller>().roll != "observer" &&
                          Get.find<Add_Data_controller>().roll !=
                              "supervisor" &&
                          Get.find<Add_Data_controller>().roll != "subAdmin") {
                        controller.selectJoinDate(context);
                      }
                    },
                  ),
                ),
              ),
            ),
            if (isError)
              Text(
                "يجب إدخال تاريخ صحيح",
                style: TextStyle(color: Colors.red, fontSize: 12),
              ),
          ],
        ),
      ),
    );
  }
}

class selectDateRequest extends StatelessWidget {
  final double width;
  final double? height;
  final bool isRequired; // متغير لتحديد إذا كان الحقل مطلوبًا.

  const selectDateRequest({
    super.key,
    required this.width,
    this.height,
    this.isRequired = false, // افتراضي الحقل غير مطلوب.
  });

  @override
  Widget build(BuildContext context) {
    final Requestscontroller controller = Get.put(Requestscontroller());
    return Obx(
      () => Container(
        width: width,
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: height ?? 40,
              child: TextFormField(
                style: const TextStyle(fontSize: 14),
                controller: TextEditingController(
                  text: controller.requestDate.value != null
                      ? DateFormat('yyyy-MM-dd')
                          .format(controller.requestDate.value!)
                      : '',
                ),
                readOnly: true,
                onTap: () => controller.selectDate(context),
                decoration: InputDecoration(
                    hintText: "yyyy-MM-dd",
                    hintStyle: Theme.of(context)
                        .textTheme
                        .bodyMedium!
                        .copyWith(fontSize: 14, color: const Color(0xffD9D9D9)),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5),
                      borderSide:
                          const BorderSide(color: Color(0xffD9D9D9), width: 2),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5),
                      borderSide: const BorderSide(color: Color(0xffD9D9D9)),
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5),
                    ),
                    suffixIcon: controller.requestDate.value == null
                        ? IconButton(
                            icon: Icon(
                              VMS_Icons.calender,
                              color: Theme.of(context).primaryColor,
                              size: 16,
                            ),
                            onPressed: () => controller.selectDate(context),
                          )
                        : IconButton(
                            icon: Icon(
                              Icons.close,
                              color: Theme.of(context).primaryColor,
                              size: 16,
                            ),
                            onPressed: () => controller.removeDate(),
                          )),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class selectTeacherDateAttendence extends StatelessWidget {
  final double width;
  final double? height;
  final bool isRequired;

  const selectTeacherDateAttendence({
    super.key,
    required this.width,
    this.height,
    this.isRequired = false,
  });

  @override
  Widget build(BuildContext context) {
    return GetBuilder<Allteacheratendencecontroller>(builder: (controller) {
      return Obx(
        () => Container(
          width: width,
          alignment: Alignment.center,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: height ?? 40,
                child: TextFormField(
                  style: const TextStyle(fontSize: 14),
                  controller: TextEditingController(
                    text: controller.AttendencetDate.value != null
                        ? DateFormat('yyyy-MM-dd')
                            .format(controller.AttendencetDate.value!)
                        : '',
                  ),
                  readOnly: true,
                  onTap: () => controller.selectDate(context),
                  decoration: InputDecoration(
                      hintText: "yyyy-MM-dd",
                      hintStyle: Theme.of(context)
                          .textTheme
                          .titleMedium!
                          .copyWith(
                              fontSize: 14, color: const Color(0xffD9D9D9)),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5),
                        borderSide: const BorderSide(
                            color: Color(0xffD9D9D9), width: 2),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5),
                        borderSide: const BorderSide(color: Color(0xffD9D9D9)),
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5),
                      ),
                      suffixIcon: controller.selectDateindex.value == null
                          ? IconButton(
                              icon: Icon(
                                VMS_Icons.calender,
                                color: Theme.of(context).primaryColor,
                                size: 16,
                              ),
                              onPressed: () => controller.selectDate(context),
                            )
                          : IconButton(
                              icon: Icon(
                                Icons.clear,
                                color: Theme.of(context).primaryColor,
                                size: 16,
                              ),
                              onPressed: () {
                                if (controller.AttendencetDate.value!.day !=
                                    DateTime.now().day) {
                                  controller.removeAttendence();
                                  Getteacherattendenceapi().Getteacherattendence(
                                      sessionID: Get.find<
                                              All_Screen_Sessions_Controller>()
                                          .sessionId);
                                }
                                controller.removeAttendence();
                              },
                            )),
                ),
              ),
            ],
          ),
        ),
      );
    });
  }
}

class selectEmployeeDateAttendence extends StatelessWidget {
  final double width;
  final double? height;
  final bool isRequired;

  const selectEmployeeDateAttendence({
    super.key,
    required this.width,
    this.height,
    this.isRequired = false,
  });

  @override
  Widget build(BuildContext context) {
    return GetBuilder<Employeeattendencecontroller>(builder: (controller) {
      return Obx(
        () => Container(
          width: width,
          alignment: Alignment.center,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: height ?? 40,
                child: TextFormField(
                  style: const TextStyle(fontSize: 14),
                  controller: TextEditingController(
                    text: controller.AttendencetDate.value != null
                        ? DateFormat('yyyy-MM-dd')
                            .format(controller.AttendencetDate.value!)
                        : '',
                  ),
                  readOnly: true,
                  onTap: () => controller.selectDate(context: context),
                  decoration: InputDecoration(
                      hintText: "yyyy-MM-dd",
                      hintStyle: Theme.of(context)
                          .textTheme
                          .titleMedium!
                          .copyWith(
                              fontSize: 14, color: const Color(0xffD9D9D9)),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5),
                        borderSide: const BorderSide(
                            color: Color(0xffD9D9D9), width: 2),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5),
                        borderSide: const BorderSide(color: Color(0xffD9D9D9)),
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5),
                      ),
                      suffixIcon: controller.AttendencetDate.value == null
                          ? IconButton(
                              icon: Icon(
                                VMS_Icons.calender,
                                color: Theme.of(context).primaryColor,
                                size: 16,
                              ),
                              onPressed: () =>
                                  controller.selectDate(context: context),
                            )
                          : IconButton(
                              icon: Icon(
                                Icons.clear,
                                color: Theme.of(context).primaryColor,
                                size: 16,
                              ),
                              onPressed: () {
                                if (controller.AttendencetDate.value!.day !=
                                    DateTime.now().day) {
                                  controller.removeAttendence();
                                  Getemployeeattendenceapi()
                                      .Getemployeeattendence();
                                }
                                controller.removeAttendence();
                              })),
                ),
              ),
            ],
          ),
        ),
      );
    });
  }
}

class selectStudentsDateAttendence extends StatelessWidget {
  final double width;
  final double? height;
  final bool isRequired;

  const selectStudentsDateAttendence({
    super.key,
    required this.width,
    this.height,
    this.isRequired = false,
  });

  @override
  Widget build(BuildContext context) {
    return GetBuilder<StudentAttendencController>(builder: (controller) {
      return Obx(
        () => Container(
          width: width,
          alignment: Alignment.center,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: height ?? 40,
                child: TextFormField(
                  style: const TextStyle(fontSize: 14),
                  controller: TextEditingController(
                    text: controller.AttendencetDate.value != null
                        ? DateFormat('yyyy-MM-dd')
                            .format(controller.AttendencetDate.value!)
                        : '',
                  ),
                  readOnly: true,
                  onTap: () => controller.selectDate(context: context),
                  decoration: InputDecoration(
                      hintText: "yyyy-MM-dd",
                      hintStyle: Theme.of(context)
                          .textTheme
                          .titleMedium!
                          .copyWith(
                              fontSize: 14, color: const Color(0xffD9D9D9)),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5),
                        borderSide: const BorderSide(
                            color: Color(0xffD9D9D9), width: 2),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5),
                        borderSide: const BorderSide(color: Color(0xffD9D9D9)),
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5),
                      ),
                      suffixIcon: controller.AttendencetDate.value == null
                          ? IconButton(
                              icon: Icon(
                                VMS_Icons.calender,
                                color: Theme.of(context).primaryColor,
                                size: 16,
                              ),
                              onPressed: () =>
                                  controller.selectDate(context: context),
                            )
                          : IconButton(
                              icon: Icon(
                                Icons.clear,
                                color: Theme.of(context).primaryColor,
                                size: 16,
                              ),
                              onPressed: () {
                                if (controller.AttendencetDate.value!.day !=
                                    DateTime.now().day) {
                                  controller.removeAttendence();
                                  Studentattendenceapi().Studentattendence();
                                }
                                controller.removeAttendence();
                              })),
                ),
              ),
            ],
          ),
        ),
      );
    });
  }
}

class selectTransactionDate extends StatelessWidget {
  final double width;
  final double? height;
  final bool isRequired;

  const selectTransactionDate({
    super.key,
    required this.width,
    this.height,
    this.isRequired = false,
  });

  @override
  Widget build(BuildContext context) {
    return GetBuilder<Transaction_Controller>(builder: (controller) {
      return Obx(
        () => Container(
          width: width,
          alignment: Alignment.center,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: height ?? 40,
                child: TextFormField(
                  style: const TextStyle(fontSize: 14),
                  controller: TextEditingController(
                    text: controller.AttendencetDate.value != null
                        ? DateFormat('yyyy-MM-dd')
                            .format(controller.AttendencetDate.value!)
                        : '',
                  ),
                  readOnly: true,
                  onTap: () => controller.selectDate(context: context),
                  decoration: InputDecoration(
                      hintText: "yyyy-MM-dd",
                      hintStyle: Theme.of(context)
                          .textTheme
                          .titleMedium!
                          .copyWith(
                              fontSize: 14, color: const Color(0xffD9D9D9)),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5),
                        borderSide: const BorderSide(
                            color: Color(0xffD9D9D9), width: 2),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5),
                        borderSide: const BorderSide(color: Color(0xffD9D9D9)),
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5),
                      ),
                      suffixIcon: controller.AttendencetDate.value == null
                          ? IconButton(
                              icon: Icon(
                                VMS_Icons.calender,
                                color: Theme.of(context).primaryColor,
                                size: 16,
                              ),
                              onPressed: () =>
                                  controller.selectDate(context: context),
                            )
                          : IconButton(
                              icon: Icon(
                                Icons.clear,
                                color: Theme.of(context).primaryColor,
                                size: 16,
                              ),
                              onPressed: () {
                                controller.removeAttendence();
                              })),
                ),
              ),
            ],
          ),
        ),
      );
    });
  }
}

class DateSelector extends StatelessWidget {
  final double width;
  final String label;
  final double? height;
  final bool isRequired;
  final bool isError;
  final bool enabled;
  final Rx<DateTime?> dateValue;
  final Function(BuildContext) onSelectDate;

  const DateSelector({
    super.key,
    required this.width,
    required this.label,
    required this.dateValue,
    required this.onSelectDate,
    this.height,
    this.isRequired = false,
    this.isError = false,
    this.enabled = true,
  });

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Container(
        width: width,
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 5.0),
              child: RichText(
                text: TextSpan(
                  text: label,
                  style: Theme.of(context)
                      .textTheme
                      .bodyMedium!
                      .copyWith(fontSize: 14),
                  children: isRequired
                      ? [
                          const TextSpan(
                            text: " *",
                            style: TextStyle(color: Colors.red, fontSize: 14),
                          ),
                        ]
                      : [],
                ),
              ),
            ),
            SizedBox(
              height: height ?? 40,
              child: TextFormField(
                enabled: enabled,
                style: const TextStyle(fontSize: 14),
                controller: TextEditingController(
                  text: dateValue.value != null
                      ? DateFormat('yyyy-MM-dd').format(dateValue.value!)
                      : '',
                ),
                readOnly: true,
                onTap: () => onSelectDate(context),
                decoration: InputDecoration(
                  hintText: "yyyy-MM-dd",
                  hintStyle: Theme.of(context)
                      .textTheme
                      .bodyMedium!
                      .copyWith(fontSize: 14, color: const Color(0xffD9D9D9)),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5),
                    borderSide: BorderSide(
                      color: isError ? Colors.red : const Color(0xffD9D9D9),
                      width: 2,
                    ),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5),
                    borderSide: BorderSide(
                      color: isError ? Colors.red : const Color(0xffD9D9D9),
                    ),
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5),
                    borderSide: BorderSide(
                      color: isError ? Colors.red : Colors.grey,
                    ),
                  ),
                  suffixIcon: IconButton(
                    icon: Icon(
                      Icons.calendar_today,
                      color: Theme.of(context).primaryColor,
                      size: 16,
                    ),
                    onPressed: () => onSelectDate(context),
                  ),
                ),
              ),
            ),
            if (isError)
              const Padding(
                padding: EdgeInsets.only(top: 5.0),
                child: Text(
                  "يجب إدخال تاريخ صحيح",
                  style: TextStyle(color: Colors.red, fontSize: 12),
                ),
              ),
          ],
        ),
      ),
    );
  }
}

class penaltyStartDate extends StatelessWidget {
  final double width;
  final double? height;
  final bool isRequired;

  const penaltyStartDate({
    super.key,
    required this.width,
    this.height,
    this.isRequired = false,
  });

  @override
  Widget build(BuildContext context) {
    final StudyYearStudentsController controller =
        Get.put(StudyYearStudentsController());
    return Obx(
      () => Container(
        width: width,
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: height ?? 40,
              child: TextFormField(
                style: const TextStyle(fontSize: 14),
                controller: TextEditingController(
                  text: controller.startdate.value != null
                      ? DateFormat('yyyy-MM-dd')
                          .format(controller.startdate.value!)
                      : '',
                ),
                readOnly: true,
                onTap: () => controller.selectStartDatePenalty(context),
                decoration: InputDecoration(
                  hintText: "yyyy-MM-dd",
                  hintStyle: Theme.of(context)
                      .textTheme
                      .titleMedium!
                      .copyWith(fontSize: 14, color: const Color(0xffD9D9D9)),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5),
                    borderSide:
                        const BorderSide(color: Color(0xffD9D9D9), width: 2),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5),
                    borderSide: const BorderSide(color: Color(0xffD9D9D9)),
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5),
                  ),
                  suffixIcon: IconButton(
                    icon: Icon(
                      VMS_Icons.calender,
                      color: Theme.of(context).primaryColor,
                      size: 16,
                    ),
                    onPressed: () => controller.selectStartDatePenalty(context),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class PenaltyEndDate extends StatelessWidget {
  final double width;
  final double? height;
  final bool isRequired; // متغير لتحديد إذا كان الحقل مطلوبًا.

  const PenaltyEndDate({
    super.key,
    required this.width,
    this.height,
    this.isRequired = false, // افتراضي الحقل غير مطلوب.
  });

  @override
  Widget build(BuildContext context) {
    final StudyYearStudentsController controller =
        Get.put(StudyYearStudentsController());
    return Obx(
      () => Container(
        width: width,
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: height ?? 40,
              child: TextFormField(
                style: const TextStyle(fontSize: 14),
                controller: TextEditingController(
                  text: controller.enddate.value != null
                      ? DateFormat('yyyy-MM-dd')
                          .format(controller.enddate.value!)
                      : '',
                ),
                readOnly: true,
                onTap: () => controller.selectEndDatePenalty(context),
                decoration: InputDecoration(
                  hintText: "yyyy-MM-dd",
                  hintStyle: Theme.of(context)
                      .textTheme
                      .titleMedium!
                      .copyWith(fontSize: 14, color: const Color(0xffD9D9D9)),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5),
                    borderSide:
                        const BorderSide(color: Color(0xffD9D9D9), width: 2),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5),
                    borderSide: const BorderSide(color: Color(0xffD9D9D9)),
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5),
                  ),
                  suffixIcon: IconButton(
                    icon: Icon(
                      VMS_Icons.calender,
                      color: Theme.of(context).primaryColor,
                      size: 16,
                    ),
                    onPressed: () => controller.selectEndDatePenalty(context),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class examDate extends StatelessWidget {
  final double width;
  final double? height;
  final bool isRequired; // متغير لتحديد إذا كان الحقل مطلوبًا.
  final bool isError; // متغير لتحديد إذا كان الحقل مطلوبًا.

  const examDate({
    super.key,
    required this.width,
    this.height,
    this.isRequired = false, // افتراضي الحقل غير مطلوب.
    this.isError = false, // افتراضي الحقل غير مطلوب.
  });

  @override
  Widget build(BuildContext context) {
    final ExamTableController controller = Get.put(ExamTableController());
    return Obx(
      () => Container(
        width: width,
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: height ?? 40,
              child: TextFormField(
                style: const TextStyle(fontSize: 14),
                controller: TextEditingController(
                  text: controller.dateindex.value != null
                      ? DateFormat('yyyy-MM-dd')
                          .format(controller.dateindex.value!)
                      : '',
                ),
                readOnly: true,
                onTap: () => controller.selectDateIndex(context),
                decoration: InputDecoration(
                  hintText: "yyyy-MM-dd",
                  hintStyle: Theme.of(context)
                      .textTheme
                      .titleMedium!
                      .copyWith(fontSize: 14, color: const Color(0xffD9D9D9)),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5),
                    borderSide: BorderSide(
                      color: isError ? Colors.red : const Color(0xffD9D9D9),
                      width: 2,
                    ),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5),
                    borderSide: BorderSide(
                      color: isError ? Colors.red : const Color(0xffD9D9D9),
                    ),
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5),
                    borderSide: BorderSide(
                      color: isError ? Colors.red : Colors.grey,
                    ),
                  ),
                  suffixIcon: IconButton(
                    icon: Icon(
                      VMS_Icons.calender,
                      color: Theme.of(context).primaryColor,
                      size: 16,
                    ),
                    onPressed: () => controller.selectDateIndex(context),
                  ),
                ),
              ),
            ),
            if (isError)
              const Padding(
                padding: EdgeInsets.only(top: 5.0),
                child: Text(
                  "يجب إدخال تاريخ صحيح",
                  style: TextStyle(color: Colors.red, fontSize: 12),
                ),
              ),
          ],
        ),
      ),
    );
  }
}

class EditJoinDateTeacher extends StatelessWidget {
  final double width;
  final String Uptext;
  final double? height;
  final bool isRequired; // متغير لتحديد إذا كان الحقل مطلوبًا.

  final bool isError; // متغير لتحديد إذا كان الحقل مطلوبًا.

  const EditJoinDateTeacher({
    super.key,
    required this.width,
    required this.Uptext,
    this.height,
    this.isError = false, // افتراضي الحقل غير مطلوب.

    this.isRequired = false, // افتراضي الحقل غير مطلوب.
  });

  @override
  Widget build(BuildContext context) {
    final Allteachercontroller controller = Get.put(Allteachercontroller());
    return Obx(
      () => Container(
        width: width,
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 5.0),
              child: RichText(
                text: TextSpan(
                  text: Uptext,
                  style: Theme.of(context).textTheme.bodyMedium,
                  children: isRequired
                      ? [
                          const TextSpan(
                            text: " *",
                            style: TextStyle(color: Colors.red, fontSize: 14),
                          ),
                        ]
                      : [],
                ),
              ),
            ),
            SizedBox(
              height: height ?? 40,
              child: TextFormField(
                style: const TextStyle(fontSize: 14),
                controller: TextEditingController(
                  text: controller.Joindate.value != null
                      ? DateFormat('yyyy-MM-dd')
                          .format(controller.Joindate.value!)
                      : '',
                ),
                readOnly: true,
                onTap: () {
                  if (Get.find<Add_Data_controller>().roll != "observer" &&
                      Get.find<Add_Data_controller>().roll != "supervisor" &&
                      Get.find<Add_Data_controller>().roll != "subAdmin") {
                    controller.selectJoinDate(context);
                  }
                },
                decoration: InputDecoration(
                  hintText: "yyyy-MM-dd",
                  hintStyle: Theme.of(context)
                      .textTheme
                      .titleMedium!
                      .copyWith(fontSize: 14, color: const Color(0xffD9D9D9)),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5),
                    borderSide: BorderSide(
                      color: isError ? Colors.red : const Color(0xffD9D9D9),
                      width: 2,
                    ),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5),
                    borderSide: BorderSide(
                      color: isError ? Colors.red : const Color(0xffD9D9D9),
                    ),
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5),
                    borderSide: BorderSide(
                      color: isError ? Colors.red : Colors.grey,
                    ),
                  ),
                  suffixIcon: IconButton(
                    icon: Icon(
                      VMS_Icons.calender,
                      color: Theme.of(context).primaryColor,
                      size: 16,
                    ),
                    onPressed: () {
                      if (Get.find<Add_Data_controller>().roll != "observer" &&
                          Get.find<Add_Data_controller>().roll !=
                              "supervisor" &&
                          Get.find<Add_Data_controller>().roll != "subAdmin") {
                        controller.selectJoinDate(context);
                      }
                    },
                  ),
                ),
              ),
            ),
            if (isError)
              const Padding(
                padding: EdgeInsets.only(top: 5.0),
                child: Text(
                  "يجب إدخال تاريخ صحيح",
                  style: TextStyle(color: Colors.red, fontSize: 12),
                ),
              ),
          ],
        ),
      ),
    );
  }
}

class EditBirthDateTeacher extends StatelessWidget {
  final double width;
  final String Uptext;
  final double? height;

  final bool isError; // متغير لتحديد إذا كان الحقل مطلوبًا.

  final bool isRequired; // متغير لتحديد إذا كان الحقل مطلوبًا.

  const EditBirthDateTeacher({
    super.key,
    required this.width,
    required this.Uptext,
    this.isError = false, // افتراضي الحقل غير مطلوب.

    this.height,
    this.isRequired = false, // افتراضي الحقل غير مطلوب.
  });

  @override
  Widget build(BuildContext context) {
    final Allteachercontroller controller = Get.put(Allteachercontroller());
    return Obx(
      () => Container(
        width: width,
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 5.0),
              child: RichText(
                text: TextSpan(
                  text: Uptext,
                  style: Theme.of(context).textTheme.bodyMedium,
                  children: isRequired
                      ? [
                          const TextSpan(
                            text: " *",
                            style: TextStyle(color: Colors.red, fontSize: 14),
                          ),
                        ]
                      : [],
                ),
              ),
            ),
            SizedBox(
              height: height ?? 40,
              child: TextFormField(
                style: const TextStyle(fontSize: 14),
                controller: TextEditingController(
                  text: controller.Birthdate.value != null
                      ? DateFormat('yyyy-MM-dd')
                          .format(controller.Birthdate.value!)
                      : '',
                ),
                readOnly: true,
                onTap: () {
                  if (Get.find<Add_Data_controller>().roll != "observer" &&
                      Get.find<Add_Data_controller>().roll != "supervisor" &&
                      Get.find<Add_Data_controller>().roll != "subAdmin") {
                    controller.selectBirthDate(context);
                  }
                },
                decoration: InputDecoration(
                  hintText: "yyyy-MM-dd",
                  hintStyle: Theme.of(context)
                      .textTheme
                      .titleMedium!
                      .copyWith(fontSize: 14, color: const Color(0xffD9D9D9)),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5),
                    borderSide: BorderSide(
                      color: isError ? Colors.red : const Color(0xffD9D9D9),
                      width: 2,
                    ),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5),
                    borderSide: BorderSide(
                      color: isError ? Colors.red : const Color(0xffD9D9D9),
                    ),
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5),
                    borderSide: BorderSide(
                      color: isError ? Colors.red : Colors.grey,
                    ),
                  ),
                  suffixIcon: IconButton(
                    icon: Icon(
                      VMS_Icons.calender,
                      color: Theme.of(context).primaryColor,
                      size: 16,
                    ),
                    onPressed: () {
                      if (Get.find<Add_Data_controller>().roll != "observer" &&
                          Get.find<Add_Data_controller>().roll !=
                              "supervisor" &&
                          Get.find<Add_Data_controller>().roll != "subAdmin") {
                        controller.selectBirthDate(context);
                      }
                    },
                  ),
                ),
              ),
            ),
            if (isError)
              const Padding(
                padding: EdgeInsets.only(top: 5.0),
                child: Text(
                  "يجب إدخال تاريخ صحيح",
                  style: TextStyle(color: Colors.red, fontSize: 12),
                ),
              ),
          ],
        ),
      ),
    );
  }
}

class SetStudentsDateAttendence extends StatelessWidget {
  final double width;
  final double? height;
  final List<String> allowedDates; // تعديل: استقبال قائمة التواريخ
  final bool isRequired;
  final bool enable;

  const SetStudentsDateAttendence({
    super.key,
    required this.width,
    required this.allowedDates, // تعديل: تمرير قائمة التواريخ
    required this.enable,
    this.height,
    this.isRequired = false,
  });

  @override
  Widget build(BuildContext context) {
    return GetBuilder<Student_attendence_controller>(
      builder: (student_attendence_controller) {
        return Obx(
          () => Container(
            width: width,
            alignment: Alignment.center,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: height ?? 40,
                  child: TextFormField(
                    enabled: enable,
                    style: const TextStyle(fontSize: 14),
                    controller: TextEditingController(
                      text:
                          student_attendence_controller.AttendencetDate.value !=
                                  null
                              ? DateFormat('yyyy-MM-dd').format(
                                  student_attendence_controller
                                      .AttendencetDate.value!)
                              : '',
                    ),
                    readOnly: true,
                    onTap: () {
                      if (enable && allowedDates.isNotEmpty) {
                        student_attendence_controller.selectDate(
                          context: context,
                          allowedDates:
                              allowedDates, // تمرير قائمة التواريخ هنا
                        );
                      }
                    },
                    decoration: InputDecoration(
                      hintText: "yyyy-MM-dd",
                      hintStyle: Theme.of(context)
                          .textTheme
                          .titleMedium!
                          .copyWith(
                              fontSize: 14, color: const Color(0xffD9D9D9)),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5),
                        borderSide: const BorderSide(
                            color: Color(0xffD9D9D9), width: 2),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5),
                        borderSide: const BorderSide(color: Color(0xffD9D9D9)),
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5),
                      ),
                      suffixIcon:
                          student_attendence_controller.AttendencetDate.value ==
                                  null
                              ? IconButton(
                                  icon: Icon(
                                    VMS_Icons.calender,
                                    color: Theme.of(context).primaryColor,
                                    size: 16,
                                  ),
                                  onPressed: () {
                                    if (enable && allowedDates.isNotEmpty) {
                                      student_attendence_controller.selectDate(
                                        context: context,
                                        allowedDates: allowedDates,
                                      );
                                    }
                                  },
                                )
                              : IconButton(
                                  icon: Icon(
                                    Icons.clear,
                                    color: Theme.of(context).primaryColor,
                                    size: 16,
                                  ),
                                  onPressed: () {
                                    if (student_attendence_controller
                                            .AttendencetDate.value!.day !=
                                        DateTime.now().day) {
                                      student_attendence_controller
                                          .removeAttendence();
                                      IncreaseAttendanceAPI(context)
                                          .GetIncreaseAttendance(
                                        DateTime: Get.find<
                                                Student_attendence_controller>()
                                            .AttendencetDate
                                            .value
                                            .toString(),
                                      );
                                    }
                                    student_attendence_controller
                                        .removeAttendence();
                                  },
                                ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

class SetTeacherDateAttendence extends StatelessWidget {
  final double width;
  final double? height;
  final List<String> allowedDates; // تعديل: استقبال قائمة التواريخ
  final bool isRequired;
  final bool enable;
  final String type;

  const SetTeacherDateAttendence({
    super.key,
    required this.width,
    required this.allowedDates, // تعديل: تمرير قائمة التواريخ
    required this.enable,
    this.height,
    required this.type,
    this.isRequired = false,
  });

  @override
  Widget build(BuildContext context) {
    return GetBuilder<EmployeeController>(
      builder: (Employee_attendence_controller) {
        return Obx(
          () => Container(
            width: width,
            alignment: Alignment.center,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: height ?? 40,
                  child: TextFormField(
                    enabled: enable,
                    style: const TextStyle(fontSize: 14),
                    controller: TextEditingController(
                      text: Employee_attendence_controller
                                  .AttendencetDate.value !=
                              null
                          ? DateFormat('yyyy-MM-dd').format(
                              Employee_attendence_controller
                                  .AttendencetDate.value!)
                          : '',
                    ),
                    readOnly: true,
                    onTap: () {
                      if (enable && allowedDates.isNotEmpty) {
                        Employee_attendence_controller.selectDate(
                          type: type,
                          context: context,
                          allowedDates:
                              allowedDates, // تمرير قائمة التواريخ هنا
                        );
                      }
                    },
                    decoration: InputDecoration(
                      hintText: "yyyy-MM-dd",
                      hintStyle: Theme.of(context)
                          .textTheme
                          .titleMedium!
                          .copyWith(
                              fontSize: 14, color: const Color(0xffD9D9D9)),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5),
                        borderSide: const BorderSide(
                            color: Color(0xffD9D9D9), width: 2),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5),
                        borderSide: const BorderSide(color: Color(0xffD9D9D9)),
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5),
                      ),
                      suffixIcon: Employee_attendence_controller
                                  .AttendencetDate.value ==
                              null
                          ? IconButton(
                              icon: Icon(
                                VMS_Icons.calender,
                                color: Theme.of(context).primaryColor,
                                size: 16,
                              ),
                              onPressed: () {
                                if (enable && allowedDates.isNotEmpty) {
                                  Employee_attendence_controller.selectDate(
                                    type: type,
                                    context: context,
                                    allowedDates: allowedDates,
                                  );
                                }
                              },
                            )
                          : IconButton(
                              icon: Icon(
                                Icons.clear,
                                color: Theme.of(context).primaryColor,
                                size: 16,
                              ),
                              onPressed: () {
                                if (Employee_attendence_controller
                                        .AttendencetDate.value!.day !=
                                    DateTime.now().day) {
                                  Employee_attendence_controller
                                      .removeAttendence();

                                  if (type == "teacher") {
                                    Increaseteacherattendenceapi
                                        .Increaseteacherattendence(
                                            DateTime:
                                                Get.find<EmployeeController>()
                                                    .AttendencetDate
                                                    .value
                                                    .toString());
                                  } else {
                                    Increaseemployeattendenceapi
                                        .Increaseemployeattendence(
                                            DateTime:
                                                Get.find<EmployeeController>()
                                                    .AttendencetDate
                                                    .value
                                                    .toString());
                                  }
                                }
                                Employee_attendence_controller
                                    .removeAttendence();
                              },
                            ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

class HomeWorkSubmissionDate extends StatelessWidget {
  final double width;
  final String Uptext;
  final double? height;
  final bool isRequired; // متغير لتحديد إذا كان الحقل مطلوبًا.
  final bool isError; // ✅ إضافة متغير للتحقق من الخطأ

  const HomeWorkSubmissionDate({
    super.key,
    required this.width,
    required this.Uptext,
    this.height,
    this.isError = false, // ✅ افتراضي لا يوجد خطأ

    this.isRequired = false, // افتراضي الحقل غير مطلوب.
  });

  @override
  Widget build(BuildContext context) {
    final Homeworkcontroller controller = Get.put(Homeworkcontroller());
    return Obx(
      () => Container(
        height: 80,
        width: width,
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 3.0),
              child: RichText(
                text: TextSpan(
                  text: Uptext,
                  style: Theme.of(context).textTheme.bodyMedium,
                  children: isRequired
                      ? [
                          const TextSpan(
                            text: " *",
                            style: TextStyle(color: Colors.red, fontSize: 14),
                          ),
                        ]
                      : [],
                ),
              ),
            ),
            SizedBox(
              height: height ?? 40,
              child: TextFormField(
                style: const TextStyle(fontSize: 14),
                controller: TextEditingController(
                  text: controller.homeworkDate.value != null
                      ? DateFormat('yyyy-MM-dd')
                          .format(controller.homeworkDate.value!)
                      : '',
                ),
                readOnly: true,
                onTap: () {
                  controller.selectBirthDate(context);
                },
                decoration: InputDecoration(
                  hintText: "yyyy-MM-dd",
                  hintStyle: Theme.of(context)
                      .textTheme
                      .bodyMedium!
                      .copyWith(fontSize: 14, color: const Color(0xffD9D9D9)),

                  // ✅ تغيير لون الحدود بناءً على قيمة isError
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5),
                    borderSide: BorderSide(
                      color: isError ? Colors.red : const Color(0xffD9D9D9),
                      width: 2,
                    ),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5),
                    borderSide: BorderSide(
                      color: isError ? Colors.red : const Color(0xffD9D9D9),
                    ),
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5),
                    borderSide: BorderSide(
                      color: isError ? Colors.red : Colors.grey,
                    ),
                  ),
                  suffixIcon: IconButton(
                    icon: Icon(
                      VMS_Icons.calender,
                      color: Theme.of(context).primaryColor,
                      size: 16,
                    ),
                    onPressed: () {
                      controller.selectBirthDate(context);
                    },
                  ),
                ),
              ),
            ),
            if (isError)
              Text(
                "Please select true value".tr,
                style: const TextStyle(color: Colors.red, fontSize: 12),
              ),
            if (!isError)
              SizedBox(
                height: 17,
              )
          ],
        ),
      ),
    );
  }
}

class examDateLMS extends StatelessWidget {
  final double width;
  final double? height;
  final bool isRequired; // متغير لتحديد إذا كان الحقل مطلوبًا.
  final bool isError; // متغير لتحديد إذا كان الحقل مطلوبًا.

  const examDateLMS({
    super.key,
    required this.width,
    this.height,
    this.isRequired = false, // افتراضي الحقل غير مطلوب.
    this.isError = false, // افتراضي الحقل غير مطلوب.
  });

  @override
  Widget build(BuildContext context) {
    final Allquizcontroller controller = Get.put(Allquizcontroller());
    return Obx(
      () => Container(
        width: width,
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: height ?? 40,
              child: TextFormField(
                style: const TextStyle(fontSize: 14),
                controller: TextEditingController(
                  text: controller.dateindex.value != null
                      ? DateFormat('yyyy-MM-dd')
                          .format(controller.dateindex.value!)
                      : '',
                ),
                readOnly: true,
                onTap: () => controller.selectDateIndex(context),
                decoration: InputDecoration(
                  hintText: "yyyy-MM-dd",
                  hintStyle: Theme.of(context)
                      .textTheme
                      .titleMedium!
                      .copyWith(fontSize: 14, color: const Color(0xffD9D9D9)),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5),
                    borderSide: BorderSide(
                      color: isError ? Colors.red : const Color(0xffD9D9D9),
                      width: 2,
                    ),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5),
                    borderSide: BorderSide(
                      color: isError ? Colors.red : const Color(0xffD9D9D9),
                    ),
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5),
                    borderSide: BorderSide(
                      color: isError ? Colors.red : Colors.grey,
                    ),
                  ),
                  suffixIcon: IconButton(
                    icon: Icon(
                      VMS_Icons.calender,
                      color: Theme.of(context).primaryColor,
                      size: 16,
                    ),
                    onPressed: () => controller.selectDateIndex(context),
                  ),
                ),
              ),
            ),
            if (isError)
              const Padding(
                padding: EdgeInsets.only(top: 5.0),
                child: Text(
                  "يجب إدخال تاريخ صحيح",
                  style: TextStyle(color: Colors.red, fontSize: 12),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
