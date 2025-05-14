import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:vms_school/Link/Controller/WidgetController/OtherWidget/PasswordHintController.dart';

class TextFormPassword extends StatefulWidget {
  TextFormPassword({
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
    this.isError = false,
    this.customErrorMessage,
    this.defaultErrorMessage,
  });

  final TextEditingController controller;
  final String hinttext;
  final Iterable<String> autofill;
  final String? Uptext;
  final double? width;
  final double? hight;
  final Widget? icon;
  final bool isRequired;
  final bool readOnly;
  final Function(String)? onChanged;
  final bool enabled;
  final bool isError;
  final String? customErrorMessage;
  final String? defaultErrorMessage;

  @override
  State<TextFormPassword> createState() => _TextFormPasswordState();
}

class _TextFormPasswordState extends State<TextFormPassword> {
  PasswordHintController pass = Get.find();
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
                      ?.copyWith(fontSize: 14, color: Colors.black),
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
            child: GetBuilder<PasswordHintController>(builder: (password) {
              return TextFormField(
                style: Theme.of(context)
                    .textTheme
                    .bodyMedium
                    ?.copyWith(fontSize: 14, color: Colors.black),
                autofillHints: widget.autofill,
                controller: widget.controller,
                obscureText: pass.isVisible,
                enabled: widget.enabled,
                readOnly: widget.readOnly,
                onChanged: (value) {
                  validateInput(value);
                  if (widget.onChanged != null) {
                    widget.onChanged!(value);
                  }
                },
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  hintText: widget.hinttext,
                  hintStyle: const TextStyle(color: Colors.grey),
                  suffixIcon: Padding(
                    padding: EdgeInsets.only(
                        left: widget.width == null ? 12.0 : 0,
                        right: widget.width == null ? 12.0 : 0),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        if (widget.icon != null) widget.icon!,
                        IconButton(
                          onPressed: () {
                            pass.isVisible ? pass.hint() : pass.notHint();
                          },
                          icon: pass.isVisible
                              ? Icon(
                                  size: widget.width != null ? 14 : null,
                                  Icons.visibility_off,
                                  color: Colors.grey,
                                )
                              : Icon(
                                  size: widget.width != null ? 14 : null,
                                  Icons.visibility,
                                  color: Colors.grey,
                                ),
                        ),
                      ],
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5),
                    borderSide: BorderSide(
                        color: showError ? Colors.red : Color(0xff19478d),
                        width: 2),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5),
                    borderSide: BorderSide(
                        color:
                            showError ? Colors.red : const Color(0xffD9D9D9)),
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5),
                  ),
                ),
              );
            }),
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
