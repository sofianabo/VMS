import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx/Controller/WidgetController/PasswordHintController.dart';

class TextFormPassword extends StatelessWidget {
  PasswordHintController pass = Get.find();

  TextEditingController controller;
  int maxlength;
  String labeltext;
  Color activeLabel;
  Color colorlabel;
  IconData prifexIcon;
  Color prifexColor;
  Color focasBorder;
  TextFormPassword(
      {super.key,
      required this.controller,
      required this.maxlength,
      required this.labeltext,
      required this.activeLabel,
      required this.colorlabel,
      required this.prifexIcon,
      required this.prifexColor,
      required this.focasBorder});

  @override
  Widget build(BuildContext context) {
    return Form(child: GetBuilder<PasswordHintController>(builder: (password) {
      return TextFormField(
        controller: controller,
        obscureText: pass.isVisible,
        decoration: InputDecoration(
          label: Text(
            labeltext,
          ),
          suffixIcon: IconButton(
            onPressed: () {
              pass.isVisible ? pass.notHint() : pass.hint();
            },
            icon:
                Icon(pass.isVisible ? Icons.visibility : Icons.visibility_off),
          ),
          floatingLabelStyle: TextStyle(color: activeLabel),
          labelStyle: TextStyle(color: colorlabel),
          prefixIcon: Icon(
            prifexIcon,
            color: prifexColor,
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(60),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: focasBorder),
            borderRadius: BorderRadius.circular(60),
          ),
        ),
      );
    }));
  }
}
