import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vms_school/Link/Controller/AdminController/AllEmpolyeeController.dart';
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
                  hintStyle: Get.theme.primaryTextTheme.titleMedium!
                      .copyWith(fontSize: 14),
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