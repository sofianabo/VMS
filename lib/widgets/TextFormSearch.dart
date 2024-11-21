import 'package:flutter/material.dart';
import 'package:get/get.dart';

// ignore: must_be_immutable
class TextFormSearch extends StatelessWidget {
  final TextEditingController controller;
  final IconData suffixIcon;
  final double radius;
  final double? width;
  final ValueChanged<String>? onchange; // تعديل النوع هنا لتلقي النص

  TextFormSearch({
    super.key,
    required this.controller,
    required this.suffixIcon,
    required this.radius,
    this.width,
    this.onchange,
  });

  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    return Container(
      alignment: Alignment.center,
      width: width ?? w / 4.4137,
      height: 40,
      child: TextFormField(
        onChanged: onchange, // تمرير القيمة إلى الدالة هنا
        style: const TextStyle(fontSize: 14),
        controller: controller,
        decoration: InputDecoration(
          hintText: "Search By Name",
          hintStyle: Get.theme.primaryTextTheme.titleMedium!
              .copyWith(fontSize: 12, color: const Color(0xffB3B3B3)),
          suffixIcon: Icon(
            suffixIcon,
            color: const Color(0xffB3B3B3),
            size: 16,
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(radius),
            borderSide: BorderSide(
              color: Get.theme.colorScheme.primary,
              width: 1,
            ),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(radius),
            borderSide: const BorderSide(color: Color(0xffB3B3B3)),
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(radius),
          ),
        ),
      ),
    );
  }
}
