import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter/services.dart';

class Textfildwithupper_num extends StatefulWidget {
  final TextEditingController sessionController;
  final String Uptext;
  final String hinttext;
  final Rx<Color> borderColor;
  final bool isRequired;
  final bool isError;
  final bool enabled;
  final Function(String)? onChanged;

  const Textfildwithupper_num({
    super.key,
    required this.Uptext,
    required this.hinttext,
    required this.sessionController,
    required this.borderColor,
    this.isRequired = false,
    this.isError = false,
    this.enabled = true,
    this.onChanged,
  });

  @override
  State<Textfildwithupper_num> createState() => _Textfildwithupper_numState();
}

class _Textfildwithupper_numState extends State<Textfildwithupper_num> {
  bool localError = false;
  String errorMessage = "يجب إدخال سنة بين 2024 و 2099";

  void validateInput(String value) {
    if (value.isNotEmpty && value.length == 4) {
      int? year = int.tryParse(value);

      if (year != null) {
        if (year < 2024) {
          // ❌ أقل من 2024 → حذف آخر رقم
          String newValue = value.substring(0, value.length - 1);
          widget.sessionController.text = newValue;
          widget.sessionController.selection = TextSelection.fromPosition(
            TextPosition(offset: newValue.length),
          );
          return;
        } else if (year > 2098) {
          widget.sessionController.selection = TextSelection(
            baseOffset: 0,
            extentOffset: widget.sessionController.text.length,
          );
          return;
        } else {
          setState(() {
            localError = false;
          });
        }
      }
    } else {
      setState(() {
        localError = widget.isRequired && value.isEmpty;
      });
    }

    if (widget.onChanged != null) {
      widget.onChanged!(widget.sessionController.text);
    }
  }

  @override
  Widget build(BuildContext context) {
    bool showError = widget.isError || localError;

    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
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
          child: Obx(() => TextFormField(
                enabled: widget.enabled,
                controller: widget.sessionController,
                keyboardType: TextInputType.number,
                inputFormatters: [
                  FilteringTextInputFormatter.digitsOnly,
                  LengthLimitingTextInputFormatter(4),
                ],
                onChanged: validateInput,
                decoration: InputDecoration(
                  hintText: widget.hinttext,
                  hintStyle: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        fontSize: 14,
                        color: const Color(0xffB3B3B3),
                      ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5),
                    borderSide: BorderSide(
                        color:
                            showError ? Colors.red : widget.borderColor.value,
                        width: 2),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5),
                    borderSide: BorderSide(
                        color:
                            showError ? Colors.red : widget.borderColor.value),
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5),
                  ),
                ),
              )),
        ),
        if (showError)
          Text(
            errorMessage,
            style: const TextStyle(color: Colors.red, fontSize: 12),
          ),
      ],
    );
  }
}
