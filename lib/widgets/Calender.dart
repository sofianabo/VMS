import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vms_school/Link/Controller/AdminController/Employee_Controllers/AllEmpolyeeController.dart';
import 'package:vms_school/Link/Controller/AdminController/School_Controllers/Session_Controller.dart';
import 'package:vms_school/Link/Controller/AdminController/Students_Controllers/ExamTableController.dart';
import 'package:vms_school/Link/Controller/AdminController/Students_Controllers/RequestsController.dart';
import 'package:vms_school/Link/Controller/AdminController/Students_Controllers/Student_Attendenc_Controller.dart';
import 'package:vms_school/Link/Controller/AdminController/Students_Controllers/StudyYearStudentsController.dart';
import 'package:vms_school/Link/Controller/WidgetController/DateControler.dart';
import 'package:vms_school/Icons_File/v_m_s__icons_icons.dart';
import 'package:intl/intl.dart';

class DatePicker extends StatelessWidget {
  final double width;
  final double? height;
  final bool isRequired;

  DatePicker({
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
                  text: TextSpan(
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
                style: TextStyle(fontSize: 14),
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
                  hintStyle:
                      Get.theme.textTheme.bodyMedium!.copyWith(fontSize: 14),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5),
                    borderSide: BorderSide(
                        color: Get.theme.colorScheme.primary, width: 2),
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
                      color: Get.theme.primaryColor,
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

  BirthDate({
    super.key,
    required this.width,
    required this.Uptext,
    this.height,
    this.isRequired = false, // افتراضي الحقل غير مطلوب.
  });

  @override
  Widget build(BuildContext context) {
    final Allempolyeecontroller controller = Get.put(Allempolyeecontroller());
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
                  style: TextStyle(color: Colors.black, fontSize: 14),
                  children: isRequired
                      ? [
                          TextSpan(
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
                style: TextStyle(fontSize: 14),
                controller: TextEditingController(
                  text: controller.Birthdate.value != null
                      ? DateFormat('yyyy-MM-dd')
                          .format(controller.Birthdate.value!)
                      : '',
                ),
                readOnly: true,
                onTap: () => controller.selectBirthDate(context),
                decoration: InputDecoration(
                  hintText: "yyyy-MM-dd",
                  hintStyle: Get.theme.textTheme.bodyMedium!
                      .copyWith(fontSize: 14, color: Color(0xffD9D9D9)),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5),
                    borderSide: BorderSide(color: Color(0xffD9D9D9), width: 2),
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
                      color: Get.theme.primaryColor,
                      size: 16,
                    ),
                    onPressed: () => controller.selectBirthDate(context),
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

class JoinDate extends StatelessWidget {
  final double width;
  final String Uptext;
  final double? height;
  final bool isRequired; // متغير لتحديد إذا كان الحقل مطلوبًا.

  JoinDate({
    super.key,
    required this.width,
    required this.Uptext,
    this.height,
    this.isRequired = false, // افتراضي الحقل غير مطلوب.
  });

  @override
  Widget build(BuildContext context) {
    final Allempolyeecontroller controller = Get.put(Allempolyeecontroller());
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
                  style: TextStyle(color: Colors.black, fontSize: 14),
                  children: isRequired
                      ? [
                          TextSpan(
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
                style: TextStyle(fontSize: 14),
                controller: TextEditingController(
                  text: controller.Joindate.value != null
                      ? DateFormat('yyyy-MM-dd')
                          .format(controller.Joindate.value!)
                      : '',
                ),
                readOnly: true,
                onTap: () => controller.selectJoinDate(context),
                decoration: InputDecoration(
                  hintText: "yyyy-MM-dd",
                  hintStyle: Get.theme.textTheme.bodyMedium!
                      .copyWith(fontSize: 14, color: Color(0xffD9D9D9)),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5),
                    borderSide: BorderSide(color: Color(0xffD9D9D9), width: 2),
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
                      color: Get.theme.primaryColor,
                      size: 16,
                    ),
                    onPressed: () => controller.selectJoinDate(context),
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

class selectDateRequest extends StatelessWidget {
  final double width;
  final double? height;
  final bool isRequired; // متغير لتحديد إذا كان الحقل مطلوبًا.

  selectDateRequest({
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
                style: TextStyle(fontSize: 14),
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
                    hintStyle: Get.theme.textTheme.bodyMedium!
                        .copyWith(fontSize: 14, color: Color(0xffD9D9D9)),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5),
                      borderSide:
                          BorderSide(color: Color(0xffD9D9D9), width: 2),
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
                              color: Get.theme.primaryColor,
                              size: 16,
                            ),
                            onPressed: () => controller.selectDate(context),
                          )
                        : IconButton(
                            icon: Icon(
                              Icons.close,
                              color: Get.theme.primaryColor,
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

class selectDateAttendence extends StatelessWidget {
  final double width;
  final double? height;
  final bool isRequired; // متغير لتحديد إذا كان الحقل مطلوبًا.

  selectDateAttendence({
    super.key,
    required this.width,
    this.height,
    this.isRequired = false, // افتراضي الحقل غير مطلوب.
  });

  @override
  Widget build(BuildContext context) {
    final StudentAttendencController controller =
        Get.put(StudentAttendencController());
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
                style: TextStyle(fontSize: 14),
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
                  hintStyle: Get.theme.primaryTextTheme.titleMedium!
                      .copyWith(fontSize: 14, color: Color(0xffD9D9D9)),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5),
                    borderSide: BorderSide(color: Color(0xffD9D9D9), width: 2),
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
                      color: Get.theme.primaryColor,
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

class selectstart extends StatelessWidget {
  final double width;
  final double? height;
  final bool isRequired;

  selectstart({
    super.key,
    required this.width,
    this.height,
    this.isRequired = false,
  });

  @override
  Widget build(BuildContext context) {
    final SessionController controller = Get.put(SessionController());
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
                style: TextStyle(fontSize: 14),
                controller: TextEditingController(
                  text: controller.startDate.value != null
                      ? DateFormat('yyyy-MM-dd')
                          .format(controller.startDate.value!)
                      : '',
                ),
                readOnly: true,
                onTap: () => controller.SelectStartDate(context),
                decoration: InputDecoration(
                  hintText: "yyyy-MM-dd",
                  hintStyle: Get.theme.primaryTextTheme.titleMedium!
                      .copyWith(fontSize: 14, color: Color(0xffD9D9D9)),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5),
                    borderSide: BorderSide(color: Color(0xffD9D9D9), width: 2),
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
                      color: Get.theme.primaryColor,
                      size: 16,
                    ),
                    onPressed: () => controller.SelectStartDate(context),
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

class selectend extends StatelessWidget {
  final double width;
  final double? height;
  final bool isRequired; // متغير لتحديد إذا كان الحقل مطلوبًا.

  selectend({
    super.key,
    required this.width,
    this.height,
    this.isRequired = false, // افتراضي الحقل غير مطلوب.
  });

  @override
  Widget build(BuildContext context) {
    final SessionController controller = Get.put(SessionController());
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
                style: TextStyle(fontSize: 14),
                controller: TextEditingController(
                  text: controller.endDate.value != null
                      ? DateFormat('yyyy-MM-dd')
                          .format(controller.endDate.value!)
                      : '',
                ),
                readOnly: true,
                onTap: () => controller.SelectEndDate(context),
                decoration: InputDecoration(
                  hintText: "yyyy-MM-dd",
                  hintStyle: Get.theme.primaryTextTheme.titleMedium!
                      .copyWith(fontSize: 14, color: Color(0xffD9D9D9)),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5),
                    borderSide: BorderSide(color: Color(0xffD9D9D9), width: 2),
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
                      color: Get.theme.primaryColor,
                      size: 16,
                    ),
                    onPressed: () => controller.SelectEndDate(context),
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

class penaltyStartDate extends StatelessWidget {
  final double width;
  final double? height;
  final bool isRequired;

  penaltyStartDate({
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
                style: TextStyle(fontSize: 14),
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
                  hintStyle: Get.theme.primaryTextTheme.titleMedium!
                      .copyWith(fontSize: 14, color: Color(0xffD9D9D9)),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5),
                    borderSide: BorderSide(color: Color(0xffD9D9D9), width: 2),
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
                      color: Get.theme.primaryColor,
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

  PenaltyEndDate({
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
                style: TextStyle(fontSize: 14),
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
                  hintStyle: Get.theme.primaryTextTheme.titleMedium!
                      .copyWith(fontSize: 14, color: Color(0xffD9D9D9)),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5),
                    borderSide: BorderSide(color: Color(0xffD9D9D9), width: 2),
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
                      color: Get.theme.primaryColor,
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

  examDate({
    super.key,
    required this.width,
    this.height,
    this.isRequired = false, // افتراضي الحقل غير مطلوب.
  });

  @override
  Widget build(BuildContext context) {
    final ExamTableController controller =
        Get.put(ExamTableController());
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
                style: TextStyle(fontSize: 14),
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
                  hintStyle: Get.theme.primaryTextTheme.titleMedium!
                      .copyWith(fontSize: 14, color: Color(0xffD9D9D9)),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5),
                    borderSide: BorderSide(color: Color(0xffD9D9D9), width: 2),
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
                      color: Get.theme.primaryColor,
                      size: 16,
                    ),
                    onPressed: () => controller.selectDateIndex(context),
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