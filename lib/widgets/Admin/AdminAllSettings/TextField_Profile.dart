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
    this.fieldType = "text",
    this.isError = false,
    this.customErrorMessage, // رسالة الخطأ المخصصة
    this.defaultErrorMessage, // رسالة الخطأ الافتراضية لنوع الحقل
    this.textDirection, // اتجاه النص (اختياري)
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
  final String? customErrorMessage;
  final String? defaultErrorMessage;
  final TextDirection? textDirection;

  @override
  _TextField_ProfileState createState() => _TextField_ProfileState();
}

class _TextField_ProfileState extends State<TextField_Profile> {
  bool localError = false;
  late String errorMessage;

  @override
  void initState() {
    super.initState();
    errorMessage =
        widget.customErrorMessage ?? widget.defaultErrorMessage ?? "";
  }

  void validateInput(String value) {
    bool isValid = true;
    String error =
        widget.customErrorMessage ?? widget.defaultErrorMessage ?? "";

    if (widget.fieldType == "email") {
      RegExp emailRegex =
          RegExp(r"^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$");
      isValid = emailRegex.hasMatch(value);
      if (!isValid) {
        error = widget.customErrorMessage ??
            widget.defaultErrorMessage ??
            "عذرا البريد الإلكتروني غير صالح";
      }
    } else if (widget.fieldType == "password") {
      RegExp passwordRegex = RegExp(r"^[a-zA-Z0-9]{8,}$");
      isValid = passwordRegex.hasMatch(value);
      if (!isValid) {
        error = widget.customErrorMessage ??
            widget.defaultErrorMessage ??
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

  TextDirection _getTextDirection() {
    return widget.textDirection ??
        (Get.find<LocalizationController>().currentLocale.value.languageCode ==
                'ar'
            ? TextDirection.rtl
            : TextDirection.ltr);
  }

  TextAlign _getTextAlign() {
    return Get.find<LocalizationController>()
                .currentLocale
                .value
                .languageCode ==
            'ar'
        ? TextAlign.right
        : TextAlign.left;
  }

  @override
  Widget build(BuildContext context) {
    bool showError = widget.isError || localError;
    final textDirection = _getTextDirection();
    final textAlign = _getTextAlign();

    return Container(
      margin: const EdgeInsets.only(top: 2.0),
      width: widget.width ?? 220,
      child: Column(
        textDirection: textDirection,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.only(bottom: widget.enabled ? 8.0 : 0),
            child: Row(
              textDirection: textDirection,
              children: [
                if (widget.upicon != null)
                  Padding(
                    padding: EdgeInsets.only(
                      right: textDirection == TextDirection.rtl ? 0 : 8.0,
                      left: textDirection == TextDirection.rtl ? 8.0 : 0,
                    ),
                    child: widget.upicon!,
                  ),
                Text(
                  widget.Uptext,
                  style: Theme.of(context).textTheme.bodySmall,
                ),
              ],
            ),
          ),
          SizedBox(
            height: 40,
            child: TextFormField(
              textAlign: textAlign,
              textDirection: textDirection,
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
                errorBorder: const UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.redAccent),
                ),
                prefix: widget.IconButton,
                hintText: widget.Uptext,
                hintStyle: const TextStyle(color: Colors.grey),
                focusedBorder: showError
                    ? const UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.red),
                      )
                    : null,
                enabledBorder: showError
                    ? const UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.red),
                      )
                    : InputBorder.none,
                border: InputBorder.none,
                suffixIcon: widget.icon,
              ),
            ),
          ),
          if (showError && errorMessage.isNotEmpty)
            Padding(
              padding: const EdgeInsets.only(top: 4.0),
              child: Text(
                errorMessage,
                style: const TextStyle(
                  color: Colors.red,
                  fontSize: 12,
                ),
              ),
            ),
        ],
      ),
    );
  }
}
