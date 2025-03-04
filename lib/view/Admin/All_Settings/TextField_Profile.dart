import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vms_school/Translate/local_controller.dart';
import 'package:vms_school/main.dart';

class TextField_Profile extends StatelessWidget {
  const TextField_Profile({
    super.key,
    required this.controller,
    required this.Uptext,
    this.width,
    this.readOnly = false,
    this.icon,
    this.upicon,
    this.enabled = true,
  });

  final TextEditingController controller;
  final String Uptext;
  final double? width;
  final Widget? icon;
  final bool readOnly;
  final bool enabled;
  final Widget? upicon;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 2.0),
      width: width ?? 220,
      child: Column(
          textDirection: Get.find<LocalizationController>()
                      .currentLocale
                      .value
                      .languageCode ==
                  'ar'
              ? TextDirection.rtl
              : TextDirection.ltr,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.only(bottom: enabled ? 8.0 : 0),
              child: Row(
                spacing: 8.0,
                textDirection: Get.find<LocalizationController>()
                            .currentLocale
                            .value
                            .languageCode ==
                        'ar'
                    ? TextDirection.rtl
                    : TextDirection.ltr,
                children: [
                  if (upicon != null) upicon!,
                  Text("$Uptext", style: Theme.of(context).textTheme.bodySmall),
                ],
              ),
            ),
            SizedBox(
              height: 40,
              child: TextFormField(
                textDirection: Get.find<LocalizationController>()
                            .currentLocale
                            .value
                            .languageCode ==
                        'ar'
                    ? TextDirection.rtl
                    : TextDirection.ltr,
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
                readOnly: readOnly,
                controller: controller,
                decoration: InputDecoration(
                  hintText: Uptext,
                  hintStyle: TextStyle(
                    color: Colors.grey,
                  ),
                  focusedBorder: UnderlineInputBorder(),
                  enabledBorder: InputBorder.none,
                  border: InputBorder.none,
                ),
              ),
            ),
          ]),
    );
  }
}
