import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vms_school/Link/Controller/WidgetController/PasswordHintController.dart';

class TextFormPassword extends StatelessWidget {
  PasswordHintController pass = Get.find();

  TextEditingController controller;
  String hinttext;
  Iterable<String> autofill;
  double? width;
  double? hight;
  TextFormPassword({
    super.key,
    required this.controller,
    this.width,
    this.hight,
    required this.hinttext,
    required this.autofill,
  });

  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;
    return Container(
      color: Colors.white,
      margin: EdgeInsets.only(top: 5),
      width: width ?? w / 2.56,
      height: hight ?? 50,
      child: GetBuilder<PasswordHintController>(builder: (password) {
        return TextFormField(
          style: TextStyle(color: Colors.black),
          autofillHints: autofill,
          controller: controller,
          obscureText: pass.isVisible,
          decoration: InputDecoration(
            hintText: hinttext,
            hintStyle: const TextStyle(fontSize: 12, color: Colors.grey),
            suffixIcon: Padding(
              padding: EdgeInsets.only(
                  left: width == null ? 12.0 : 0,
                  right: width == null ? 12.0 : 0),
              child: IconButton(
                onPressed: () {
                  pass.isVisible ? pass.hint() : pass.notHint();
                },
                icon: pass.isVisible
                    ? Icon(
                        size: width != null ? 14 : null,
                        Icons.visibility_off,
                        color: Colors.grey,
                      )
                    : Icon(
                        size: width != null ? 14 : null,
                        Icons.visibility,
                        color: Colors.grey,
                      ),
              ),
            ),
            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(5),
                borderSide:
                    BorderSide(color: Get.theme.colorScheme.primary, width: 2)),
            enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(5),
                borderSide: const BorderSide(color: Colors.grey)),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(5),
            ),
          ),
        );
      }),
    );
  }
}
