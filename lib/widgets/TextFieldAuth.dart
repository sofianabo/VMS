// ignore_for_file: must_be_immutable, file_names

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class TextFieldAuth extends StatefulWidget {
  TextFieldAuth({
    super.key,
    required this.controller,
    required this.hinttext,
    required this.autofill,
    this.width,
    this.hight,
    this.Uptext,
    this.readOnly = false,
    this.icon,
    this.isRequired = false,
    this.onChanged,
    this.enabled = true,
    this.hidePassword = false,
    this.fieldType = "text",
    this.isError = false,
    this.IconButton,
    this.customErrorMessage,
    this.defaultErrorMessage,
  });

  final TextEditingController controller;
  final String hinttext;
  final Iterable<String> autofill;
  final String? Uptext;
  final Widget? IconButton;
  final double? width;
  final double? hight;
  final Widget? icon;
  final bool isRequired;
  final bool readOnly;
  final Function(String)? onChanged;
  final bool enabled;
  final bool hidePassword;
  final String fieldType;
  final bool isError;
  final String? customErrorMessage;
  final String? defaultErrorMessage;

  @override
  State<TextFieldAuth> createState() => _TextFieldAuthState();
}

class _TextFieldAuthState extends State<TextFieldAuth> {
  bool localError = false;
  late String errorMessage;

  @override
  void initState() {
    super.initState();
    errorMessage = widget.customErrorMessage ??
        widget.defaultErrorMessage ??
        "لا يسمح بترك الحقل فارغ";
  }

  void validateInput(String value) {
    bool isValid = true;
    String error = widget.customErrorMessage ??
        widget.defaultErrorMessage ??
        "لا يسمح بترك الحقل فارغ";

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
            "يجب أن لا تقل كلمة المرور عن 8 أحرف";
      }
    } else if (widget.fieldType == "phone") {
      RegExp phoneRegex = RegExp(r"^[0-9+]+$");
      isValid = phoneRegex.hasMatch(value);
      if (!isValid) {
        error = widget.customErrorMessage ??
            widget.defaultErrorMessage ??
            "يُسمح بإدخال أرقام وعلامة + فقط";
      }
    } else if (widget.fieldType == "number") {
      RegExp numberRegex = RegExp(r"^[0-9]+$");
      isValid = numberRegex.hasMatch(value);
      if (!isValid) {
        error = widget.customErrorMessage ??
            widget.defaultErrorMessage ??
            "يُسمح بإدخال الأرقام فقط";
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

    TextInputType keyboardType;
    List<TextInputFormatter>? inputFormatters;

    if (widget.fieldType == "email") {
      keyboardType = TextInputType.emailAddress;
    } else if (widget.fieldType == "phone") {
      keyboardType = TextInputType.phone;
      inputFormatters = [FilteringTextInputFormatter.allow(RegExp(r'[0-9+]'))];
    } else if (widget.fieldType == "number") {
      keyboardType = TextInputType.number;
      inputFormatters = [FilteringTextInputFormatter.digitsOnly];
    } else {
      keyboardType = TextInputType.text;
    }

    return Container(
      height: widget.Uptext != null ? 92 : (widget.hight ?? 60),
      margin: const EdgeInsets.only(top: 2.0),
      width: widget.width,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (widget.Uptext != null)
            Padding(
              padding: const EdgeInsets.only(bottom: 5.0),
              child: RichText(
                text: TextSpan(
                  text: widget.Uptext,
                  style: Theme.of(context)
                      .textTheme
                      .bodyMedium
                      ?.copyWith(fontSize: 14),
                  children: widget.isRequired
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
            height: widget.Uptext != null ? 50 : (widget.hight ?? 60),
            child: TextFormField(
              autofillHints: widget.autofill,
              obscureText: widget.hidePassword,
              style: Theme.of(context)
                  .textTheme
                  .bodyMedium
                  ?.copyWith(fontSize: 14),
              enabled: widget.enabled,
              readOnly: widget.readOnly,
              controller: widget.controller,
              keyboardType: keyboardType,
              inputFormatters: inputFormatters,
              onChanged: (value) {
                validateInput(value);
                if (widget.onChanged != null) {
                  widget.onChanged!(value);
                }
              },
              decoration: InputDecoration(
                prefixIcon: widget.IconButton,
                suffixIcon: widget.icon,
                hintText: widget.hinttext,
                hintStyle: const TextStyle(color: Colors.grey),
                filled: true,
                fillColor: Colors.white,
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(5),
                  borderSide: BorderSide(
                      color: showError
                          ? Colors.red
                          : Get.theme.colorScheme.primary,
                      width: 2),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(5),
                  borderSide: BorderSide(
                      color: showError ? Colors.red : const Color(0xffD9D9D9)),
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(5),
                ),
              ),
            ),
          ),
          if (showError)
            Text(
              errorMessage,
              style: const TextStyle(color: Colors.red, fontSize: 12),
            ),
        ],
      ),
    );
  }
}
