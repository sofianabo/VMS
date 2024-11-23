import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Textfildwithupper extends StatelessWidget {
  Textfildwithupper({
    super.key,
    required this.controller,
    required this.Uptext,
    required this.hinttext,
    this.width,
    this.icon,
    this.isRequired = false, // إضافة متغير لتحديد ما إذا كان الحقل مطلوبًا.
  });

  final TextEditingController controller;
  final String Uptext;
  final String hinttext;
  final double? width;
  final Widget? icon;
  final bool isRequired; // متغير لتحديد إذا كان الحقل مطلوبًا.

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 2.0),
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
                children: isRequired
                    ? [
                        TextSpan(
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
              controller: controller,
              decoration: InputDecoration(
                suffixIcon: icon ?? Text(""),
                hintText: hinttext,
                hintStyle: Get.theme.primaryTextTheme.titleMedium!
                    .copyWith(fontSize: 14, color: Color(0xffB3B3B3)),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(5),
                  borderSide: BorderSide(
                      color: Get.theme.colorScheme.primary, width: 2),
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
  }
}
