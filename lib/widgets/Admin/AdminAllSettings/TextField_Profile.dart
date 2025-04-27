import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vms_school/Translate/local_controller.dart';

class TextField_Profile extends StatefulWidget {
  const TextField_Profile({
    super.key,
    required this.controller,
    required this.Uptext,
    this.width,
    this.readOnly = false,
    this.icon,
    this.IconButton,
    this.upicon,
    this.enabled = true,
    this.hidePassword = false,
    this.onChanged,
    this.fieldType = "text", // القيم الممكنة: "email" أو "password" أو "text"
    this.isError =
        false, // ✅ إرجاع isError مرة أخرى مع القدرة على التحكم به خارجياً
  });

  final TextEditingController controller;
  final String Uptext;
  final double? width;
  final Widget? icon;
  final Widget? IconButton;
  final bool readOnly;
  final bool enabled;
  final bool hidePassword;
  final Widget? upicon;
  final Function(String)? onChanged;
  final String fieldType;
  final bool isError;
  @override
  _TextField_ProfileState createState() => _TextField_ProfileState();
}

class _TextField_ProfileState extends State<TextField_Profile> {
  bool localError = false;
  String errorMessage = "";

  void validateInput(String value) {
    bool isValid = true;
    String error = "";

    if (widget.fieldType == "email") {
      RegExp emailRegex =
          RegExp(r"^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$");
      isValid = emailRegex.hasMatch(value);
      if (!isValid) {
        error = "عذرا البريد الإلكتروني غير صالح";
      }
    } else if (widget.fieldType == "password") {
      RegExp passwordRegex = RegExp(r"^[a-zA-Z0-9]{8,}$");

      isValid = passwordRegex.hasMatch(value);
      if (!isValid) {
        error =
            "يجب أن تحتوي كلمة المرور على 8 أحرف على الأقل، وأن تكون باللغة الإنجليزية فقط.";
      }
    }

    setState(() {
      localError = !isValid;
      errorMessage = error;
    });

    if (widget.onChanged != null) {
      widget.onChanged!(value);
    }
  }

  @override
  Widget build(BuildContext context) {
    bool showError = widget.isError || localError;

    return Container(
      margin: const EdgeInsets.only(top: 2.0),
      width: widget.width ?? 220,
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
              padding: EdgeInsets.only(bottom: widget.enabled ? 8.0 : 0),
              child: Row(
                textDirection: Get.find<LocalizationController>()
                            .currentLocale
                            .value
                            .languageCode ==
                        'ar'
                    ? TextDirection.rtl
                    : TextDirection.ltr,
                children: [
                  if (widget.upicon != null)
                    Padding(
                      padding: EdgeInsets.only(right: 8.0),
                      child: widget.upicon!,
                    ),
                  Text(widget.Uptext,
                      style: Theme.of(context).textTheme.bodySmall),
                ],
              ),
            ),
            SizedBox(
              height: 40,
              child: TextFormField(
                textAlign: Get.find<LocalizationController>()
                            .currentLocale
                            .value
                            .languageCode ==
                        'ar'
                    ? TextAlign.right
                    : TextAlign.left,
                textDirection: Get.find<LocalizationController>()
                            .currentLocale
                            .value
                            .languageCode ==
                        'ar'
                    ? TextDirection.rtl
                    : TextDirection.ltr,
                obscureText: widget.hidePassword,
                enabled: widget.enabled,
                style: Theme.of(context)
                    .textTheme
                    .bodyMedium
                    ?.copyWith(fontSize: 14, fontWeight: FontWeight.bold),
                readOnly: widget.readOnly,
                controller: widget.controller,
                onChanged: validateInput,
                decoration: InputDecoration(
                  errorBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.redAccent)),
                  prefix: widget.IconButton,
                  hintText: widget.Uptext,
                  hintStyle: const TextStyle(
                    color: Colors.grey,
                  ),
                  focusedBorder: showError
                      ? UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.red),
                        )
                      : UnderlineInputBorder(),
                  enabledBorder: showError
                      ? UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.red),
                        )
                      : InputBorder.none,
                  border: InputBorder.none,
                ),
              ),
            ),
            if (showError)
              Padding(
                padding: const EdgeInsets.only(top: 4.0),
                child: Text(
                  errorMessage,
                  style: TextStyle(
                    color: Colors.red,
                    fontSize: 12,
                  ),
                ),
              ),
          ]),
    );
  }
}
