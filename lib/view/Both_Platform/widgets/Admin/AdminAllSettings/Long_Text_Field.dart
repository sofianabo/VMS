import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vms_school/Translate/local_controller.dart';
import 'package:vms_school/main.dart';

class Long_TextField_Profile extends StatefulWidget {
  const Long_TextField_Profile({
    super.key,
    required this.controller,
    required this.Uptext,
    this.width,
    this.readOnly = false,
    this.icon,
    this.upicon,
    this.enabled = true,
    this.onChanged,
    this.isError = false,
    this.isRequired = false,
  });

  final TextEditingController controller;
  final String Uptext;
  final double? width;
  final Widget? icon;
  final bool readOnly;
  final bool enabled;
  final Widget? upicon;

  //ksadjlkdasjlkjdsa
  final bool isRequired;

  final Function(String)? onChanged;

  final bool isError;

  @override
  State<Long_TextField_Profile> createState() => _Long_TextField_ProfileState();
}

class _Long_TextField_ProfileState extends State<Long_TextField_Profile> {
  TextDirection _getTextDirection() {
    return (Get.find<LocalizationController>()
                .currentLocale
                .value
                .languageCode ==
            'ar'
        ? TextDirection.rtl
        : TextDirection.ltr);
  }

  @override
  Widget build(BuildContext context) {
    final textDirection = _getTextDirection();

    return Container(
      margin: const EdgeInsets.only(top: 2.0),
      width: widget.width ?? 220,
      child: Column(
          mainAxisSize: MainAxisSize.min,
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
              padding: EdgeInsets.all(15.0),
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
                  if (widget.upicon != null) widget.upicon!,
                  Row(
                    spacing: 5.0,
                    textDirection: textDirection,
                    children: [
                      Text(
                        widget.Uptext,
                        style: Theme.of(context)
                            .textTheme
                            .bodySmall
                            ?.copyWith(fontSize: 14),
                      ),
                      if (widget.isRequired)
                        Text(
                          ' *',
                          style: TextStyle(
                            color: Colors.red,
                            fontSize: 14,
                          ),
                        )
                    ],
                  )
                ],
              ),
            ),
            SizedBox(
              height: 250,
              child: TextFormField(
                onChanged: (value) {
                  if (widget.onChanged != null) {
                    widget.onChanged!(widget.controller.text);
                  }
                },
                maxLines: 20,
                textDirection: Get.find<LocalizationController>()
                            .currentLocale
                            .value
                            .languageCode ==
                        'ar'
                    ? TextDirection.rtl
                    : TextDirection.ltr,
                enabled: widget.enabled,
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
                readOnly: widget.readOnly,
                controller: widget.controller,
                decoration: InputDecoration(
                  errorBorder: const UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.redAccent),
                  ),
                  hintStyle: const TextStyle(color: Colors.grey),
                  focusedBorder: widget.isError
                      ? const UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.red),
                        )
                      : OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5),
                          borderSide:
                              BorderSide(color: Colors.grey.shade300, width: 2),
                        ),
                  enabledBorder: widget.isError
                      ? const UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.red),
                        )
                      : OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5),
                          borderSide:
                              BorderSide(color: Colors.grey.shade300, width: 2),
                        ),
                  border: widget.isError
                      ? const UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.red),
                        )
                      : OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5),
                          borderSide:
                              BorderSide(color: Colors.grey.shade300, width: 2),
                        ),
                  suffixIcon: widget.icon,
                ),
              ),
            ),
            if (widget.isError)
              Text(
                "يجب إدخال تاريخ صحيح",
                style: TextStyle(color: Colors.red, fontSize: 12),
              ),
          ]),
    );
  }
}
