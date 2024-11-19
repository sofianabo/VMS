import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter/services.dart';
import 'package:getx/Link/Controller/AdminController/Session_Controller.dart';

class Textfildwithupper_num extends StatelessWidget {
  final TextEditingController sessionController;
  final String Uptext;
  final String hinttext;
  final Rx<Color> borderColor;

  Textfildwithupper_num({
    Key? key,
    required this.Uptext,
    required this.hinttext,
    required this.sessionController,
    required this.borderColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(bottom: 5.0),
          child: Text(Uptext),
        ),
        SizedBox(
          height: 40,
          child: Obx(() => TextFormField(
                controller: sessionController,
                keyboardType: TextInputType.number,
                inputFormatters: [
                  FilteringTextInputFormatter.digitsOnly,
                  LengthLimitingTextInputFormatter(4),
                ],
                onChanged: (value) {
                  // تحديث السنة عند تغيير النص
                  final controller = Get.find<SessionController>();
                  controller.updateYear(value);
                },
                decoration: InputDecoration(
                  hintText: hinttext,
                  hintStyle: Get.theme.primaryTextTheme.titleMedium?.copyWith(
                    fontSize: 14,
                    color: Color(0xffB3B3B3),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5),
                    borderSide: BorderSide(color: borderColor.value, width: 2),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5),
                    borderSide: BorderSide(color: borderColor.value),
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5),
                  ),
                ),
              )),
        ),
      ],
    );
  }
}