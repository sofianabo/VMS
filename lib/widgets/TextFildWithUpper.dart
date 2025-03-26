import 'package:flutter/material.dart';
import 'package:flutter/services.dart'; // لاستيراد inputFormatters
import 'package:get/get.dart';
import 'package:vms_school/Translate/local_controller.dart';
import 'package:vms_school/main.dart';

class Textfildwithupper extends StatefulWidget {
  const Textfildwithupper({
    super.key,
    required this.controller,
    required this.Uptext,
    required this.hinttext,
    this.width,
    this.readOnly = false,
    this.icon,
    this.isRequired = false,
    this.onChanged,
    this.enabled = true,
    this.hidePassword = false,
    this.fieldType =
        "text", // القيم الممكنة: "email" أو "password" أو "text" أو "phone" أو "number"
    this.isError = false,
    this.IconButton,
  });

  final TextEditingController controller;
  final String Uptext;
  final String hinttext;
  final Widget? IconButton;
  final double? width;
  final Widget? icon;
  final bool isRequired;
  final bool readOnly;
  final Function(String)? onChanged;
  final bool enabled;
  final bool hidePassword;
  final String fieldType;
  final bool isError;

  @override
  State<Textfildwithupper> createState() => _TextfildwithupperState();
}

class _TextfildwithupperState extends State<Textfildwithupper> {
  bool localError = false;
  String errorMessage = "لا يسمح بترك الحقل فارغ";

  void validateInput(String value) {
    bool isValid = true;
    String error = "لا يسمح بترك الحقل فارغ";

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
        error = "يجب أن لا تقل كلمة المرور عن 8 أحرف";
      }
    } else if (widget.fieldType == "phone") {
      RegExp phoneRegex = RegExp(r"^[0-9+]+$"); // ✅ يسمح فقط بالأرقام وعلامة +
      isValid = phoneRegex.hasMatch(value);
      if (!isValid) {
        error = "يُسمح بإدخال أرقام  وعلامة + فقط";
      }
    } else if (widget.fieldType == "number") {
      RegExp numberRegex = RegExp(r"^[0-9]+$"); // ✅ يسمح فقط بالأرقام بدون "+"
      isValid = numberRegex.hasMatch(value);
      if (!isValid) {
        error = "يُسمح بإدخال الأرقام فقط";
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

    // ✅ تحديد نوع لوحة المفاتيح بناءً على نوع الحقل
    TextInputType keyboardType;
    List<TextInputFormatter>? inputFormatters;

    if (widget.fieldType == "email") {
      keyboardType = TextInputType.emailAddress;
    } else if (widget.fieldType == "phone") {
      keyboardType = TextInputType.phone;
      inputFormatters = [
        FilteringTextInputFormatter.allow(
            RegExp(r'[0-9+]')), // ✅ يسمح بالأرقام وعلامة +
      ];
    } else if (widget.fieldType == "number") {
      keyboardType = TextInputType.number;
      inputFormatters = [
        FilteringTextInputFormatter.digitsOnly, // ✅ يسمح فقط بالأرقام
      ];
    } else {
      keyboardType = TextInputType.text;
    }

    return Container(
      margin: const EdgeInsets.only(top: 2.0),
      width: widget.width ?? 250,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
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
            height: 40,
            child: TextFormField(
              obscureText: widget.hidePassword,
              style: Theme.of(context)
                  .textTheme
                  .bodyMedium
                  ?.copyWith(fontSize: 14),
              textAlign: prefs!.getString(languageKey) == 'ar'
                  ? TextAlign.right
                  : TextAlign.left,
              enabled: widget.enabled,
              readOnly: widget.readOnly,
              controller: widget.controller,
              keyboardType: keyboardType, // ✅ تحديد نوع الكيبورد
              inputFormatters:
                  inputFormatters, // ✅ تحديد الفورمات لحقل الهاتف أو الرقم
              onChanged: (value) {
                validateInput(value);
                if (widget.Uptext == 'Username') {
                  final cursorPosition = widget.controller.selection.baseOffset;
                  String updatedValue = value.replaceAll(' ', '').toLowerCase();

                  widget.controller.value = TextEditingValue(
                    text: updatedValue,
                    selection: TextSelection.collapsed(
                      offset: cursorPosition > updatedValue.length
                          ? updatedValue.length
                          : cursorPosition,
                    ),
                  );
                }
                if (widget.onChanged != null) {
                  widget.onChanged!(widget.controller.text);
                }
              },
              decoration: InputDecoration(
                prefixIcon: widget.IconButton,
                suffixIcon: widget.icon,
                hintText: widget.hinttext,
                hintStyle: const TextStyle(color: Colors.grey),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(5),
                  borderSide: BorderSide(
                      color: showError
                          ? Colors.red
                          : Theme.of(context).canvasColor,
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
