import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart' as intl;
import 'package:vms_school/Link/Controller/AdminController/Employee_Controllers/Add_Data_controller.dart';
import 'package:vms_school/Link/Controller/AdminController/Employee_Controllers/AllEmpolyeeController.dart';
import 'package:vms_school/Translate/local_controller.dart';

class Profile_BirthDate extends StatelessWidget {
  final double width;
  final String Uptext;
  final double? height;
  final bool enabled;
  final Widget? upicon;

  Profile_BirthDate({
    super.key,
    required this.width,
    required this.Uptext,
    required this.enabled,
    this.upicon,
    this.height,
  });

  @override
  Widget build(BuildContext context) {
    final Add_Data_controller controller = Get.put(Add_Data_controller());
    return Obx(
      () => Container(
        width: width,
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.only(bottom: 5.0),
              child: Row(
                textDirection: Get.find<LocalizationController>()
                            .currentLocale
                            .value
                            .languageCode ==
                        'ar'
                    ? TextDirection.rtl
                    : TextDirection.ltr,
                spacing: 8.0,
                children: [
                  if (upicon != null) upicon!,
                  Text("$Uptext", style: Theme.of(context).textTheme.bodySmall),
                ],
              ),
            ),
            SizedBox(
              height: height ?? 40,
              child: TextFormField(
                enabled: enabled,
                style: Theme.of(context)
                    .textTheme
                    .bodyMedium
                    ?.copyWith(fontSize: 14, fontWeight: FontWeight.bold),
                textAlign: Get.find<LocalizationController>()
                            .currentLocale
                            .value
                            .languageCode ==
                        'ar'
                    ? TextAlign.right
                    : TextAlign.left,
                controller: TextEditingController(
                  text: controller.Birthdate.value != null
                      ? intl.DateFormat('yyyy-MM-dd')
                          .format(controller.Birthdate.value!)
                      : '',
                ),
                readOnly: true,
                onTap: () {
                  if (enabled) {
                    controller.selectBirthDate(context);
                  }
                },
                decoration: InputDecoration(
                  hintText: "yyyy-MM-dd",
                  hintStyle: TextStyle(
                    color: Colors.grey,
                  ),
                  focusedBorder: UnderlineInputBorder(),
                  enabledBorder: InputBorder.none,
                  border: InputBorder.none,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class Profile_JoinDate extends StatelessWidget {
  final double width;
  final String Uptext;
  final double? height;
  final bool enabled;
  final Widget? upicon;

  Profile_JoinDate({
    super.key,
    required this.width,
    required this.Uptext,
    required this.enabled,
    this.height,
    this.upicon,
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
              padding: EdgeInsets.only(bottom: 5.0),
              child: Row(
                textDirection: Get.find<LocalizationController>()
                            .currentLocale
                            .value
                            .languageCode ==
                        'ar'
                    ? TextDirection.rtl
                    : TextDirection.ltr,
                spacing: 8.0,
                children: [
                  if (upicon != null) upicon!,
                  Text("$Uptext", style: Theme.of(context).textTheme.bodySmall),
                ],
              ),
            ),
            SizedBox(
              height: height ?? 40,
              child: TextFormField(
                enabled: enabled,
                style: Theme.of(context)
                    .textTheme
                    .bodyMedium
                    ?.copyWith(fontSize: 14, fontWeight: FontWeight.bold),
                textAlign: Get.find<LocalizationController>()
                            .currentLocale
                            .value
                            .languageCode ==
                        'ar'
                    ? TextAlign.right
                    : TextAlign.left,
                controller: TextEditingController(
                  text: controller.Joindate.value != null
                      ? intl.DateFormat('yyyy-MM-dd')
                          .format(controller.Joindate.value!)
                      : '',
                ),
                readOnly: true,
                onTap: () {
                  if (enabled) {
                    controller.selectJoinDate(context);
                  }
                },
                decoration: InputDecoration(
                  hintText: "yyyy-MM-dd",
                  hintStyle: TextStyle(
                    color: Colors.grey,
                  ),
                  focusedBorder: UnderlineInputBorder(),
                  enabledBorder: InputBorder.none,
                  border: InputBorder.none,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
