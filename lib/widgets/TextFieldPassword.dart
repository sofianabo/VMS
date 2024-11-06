import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx/Controller/WidgetController/PasswordHintController.dart';

class TextFormPassword extends StatelessWidget {
  PasswordHintController pass = Get.find();

  TextEditingController controller;
  String hinttext;

  TextFormPassword({
    super.key,
    required this.controller,
    required this.hinttext,
  });

  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;
    return Container(
      color: Colors.white,
      margin:  EdgeInsets.only(top: h/136.8),
      width: w / 2.56,
      height: h / 13.68,
      child: GetBuilder<PasswordHintController>(builder: (password) {
        return TextFormField(
          controller: controller,
          obscureText: pass.isVisible,
          decoration: InputDecoration(
            hintText: hinttext,
            suffixIcon: IconButton(
              onPressed: () {
                pass.isVisible ? pass.hint() : pass.notHint();
              },
              icon: Icon(
                  pass.isVisible ? Icons.visibility : Icons.visibility_off),
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
