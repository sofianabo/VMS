import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vms_school/Translate/local_controller.dart';

class Button_Has_IconText extends StatelessWidget {
  Button_Has_IconText({
    super.key,
    required this.text,
    required this.icon,
    required this.onPressed,
  });
  final VoidCallback onPressed;
  String text;
  Icon icon;
  @override
  Widget build(BuildContext context) {
    return TextButton(
        style: ButtonStyle(
            foregroundColor: WidgetStatePropertyAll(Colors.black),
            shape: WidgetStatePropertyAll(RoundedRectangleBorder(
                side: BorderSide(color: Color(0xffECECEC), width: 1.4),
                borderRadius: BorderRadius.all(Radius.circular(60))))),
        onPressed: onPressed,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            textDirection: Get.find<LocalizationController>()
                        .currentLocale
                        .value
                        .languageCode ==
                    'ar'
                ? TextDirection.rtl
                : TextDirection.ltr,
            spacing: 10.0,
            children: [Text(text), icon],
          ),
        ));
  }
}
