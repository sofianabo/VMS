import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vms_school/Theme/themeController.dart';

class Textfildwithupper extends StatelessWidget {
  Textfildwithupper({
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
  });

  final TextEditingController controller;
  final String Uptext;
  final String hinttext;
  final double? width;
  final Widget? icon;
  final bool isRequired;
  final bool readOnly;
  final Function(String)? onChanged;
  final bool enabled;

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
        init: Themecontroller(),
        builder: (thcont) {
          return Container(
            margin: const EdgeInsets.only(top: 2.0),
            width: width ?? 250,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(bottom: 5.0),
                  child: RichText(
                    text: TextSpan(
                      text: Uptext,
                      style: thcont.th!.textTheme.bodyMedium,
                      children: isRequired
                          ? [
                              const TextSpan(
                                text: " *",
                                style:
                                    TextStyle(color: Colors.red, fontSize: 14),
                              ),
                            ]
                          : [],
                    ),
                  ),
                ),
                SizedBox(
                  height: 40,
                  child: TextFormField(
                    enabled: enabled,
                    readOnly: readOnly,
                    controller: controller,
                    onChanged: (value) {
                      if (Uptext == 'Username') {
                        // حفظ موقع المؤشر الحالي
                        final cursorPosition = controller.selection.baseOffset;

                        // إزالة المسافات وتحويل النص إلى حروف صغيرة
                        String updatedValue =
                            value.replaceAll(' ', '').toLowerCase();

                        // تعيين النص الجديد مع تعديل موقع المؤشر
                        controller.value = TextEditingValue(
                          text: updatedValue,
                          selection: TextSelection.collapsed(
                            offset: cursorPosition > updatedValue.length
                                ? updatedValue.length
                                : cursorPosition,
                          ),
                        );
                      }

                      // استدعاء الدالة إذا كانت غير null
                      if (onChanged != null) {
                        onChanged!(controller.text);
                      }
                    },
                    decoration: InputDecoration(
                      suffixIcon: icon ?? const Text(""),
                      hintText: hinttext,
                      hintStyle: TextStyle(
                        color: Colors.grey,
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5),
                        borderSide:
                            BorderSide(color: thcont.th!.canvasColor, width: 2),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5),
                        borderSide: const BorderSide(color: Color(0xffD9D9D9)),
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          );
        });
  }
}
