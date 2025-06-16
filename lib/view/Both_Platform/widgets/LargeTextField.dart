import 'package:flutter/material.dart';

class LargeTextField extends StatelessWidget {
  const LargeTextField({
    super.key,
    required this.controller,
    this.width,
    required this.hinttext,
    this.isRequired = false, // إضافة متغير لتحديد ما إذا كان الحقل مطلوبًا.
    this.readOnly = false, // إضافة متغير لتحديد ما إذا كان الحقل مطلوبًا.
    this.isError = false, // خاصية لتحديد إذا كان هناك خطأ
    this.onChanged,
    this.focusNode,
    this.TextDirections, // خاصية لاستدعاء دالة عند تغيير النص
  });

  final TextEditingController controller;
  final String hinttext;
  final double? width;
  final FocusNode? focusNode;
  final TextDirection? TextDirections;
  final bool isRequired; // متغير لتحديد إذا كان الحقل مطلوبًا.
  final bool readOnly; // متغير لتحديد إذا كان الحقل مطلوبًا.
  final bool isError; // متغير للتحكم في ظهور الخطأ
  final Function(String)? onChanged; // دالة تستدعى عند تغيير النص

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width ?? 515,
      height: 300,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 5.0),
            child: RichText(
              text: TextSpan(
                text: hinttext,
                style: Theme.of(context).textTheme.bodyMedium,
                children: isRequired
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
          Container(
            height: 240,
            child: TextFormField(
              textDirection: TextDirections,
              focusNode: focusNode,
              readOnly: readOnly,
              maxLines: 10,
              controller: controller,
              onChanged: onChanged, // إضافة onChanged
              decoration: InputDecoration(
                hintText: hinttext,
                hintStyle: const TextStyle(color: Color(0xffD9D9D9)),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(
                    color: isError ? Colors.red : const Color(0xffD9D9D9),
                    width: 1,
                  ),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(
                    color: isError ? Colors.red : const Color(0xffD9D9D9),
                  ),
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
          ),
          if (isError)
            const Padding(
              padding: EdgeInsets.only(top: 5),
              child: Text(
                "لا يسمح بوضع قيمة فارغة",
                style: TextStyle(color: Colors.red, fontSize: 12),
              ),
            ),
        ],
      ),
    );
  }
}

class Large_Quiz_Field extends StatelessWidget {
  const Large_Quiz_Field({
    super.key,
    required this.controller,
    required this.width,
    this.Hight,
    required this.hinttext,
    this.isRequired = false, // إضافة متغير لتحديد ما إذا كان الحقل مطلوبًا.
    this.readOnly = false, // إضافة متغير لتحديد ما إذا كان الحقل مطلوبًا.
    this.isError = false, // خاصية لتحديد إذا كان هناك خطأ
    this.onChanged,
    this.focusNode,
    this.TextDirections, // خاصية لاستدعاء دالة عند تغيير النص
  });

  final TextEditingController controller;
  final String hinttext;
  final double width;
  final double? Hight;
  final FocusNode? focusNode;
  final TextDirection? TextDirections;
  final bool isRequired; // متغير لتحديد إذا كان الحقل مطلوبًا.
  final bool readOnly; // متغير لتحديد إذا كان الحقل مطلوبًا.
  final bool isError; // متغير للتحكم في ظهور الخطأ
  final Function(String)? onChanged; // دالة تستدعى عند تغيير النص

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: Hight != null ? Hight! + 10 : 250,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: Hight ?? 240,
            child: TextFormField(
              textDirection: TextDirections,
              focusNode: focusNode,
              readOnly: readOnly,
              maxLines: 10,
              controller: controller,
              onChanged: onChanged, // إضافة onChanged
              decoration: InputDecoration(
                hintText: hinttext,
                hintStyle: TextStyle(
                    color: Color(0xffD9D9D9),
                    fontSize: width >= 600 ? 14.0 : 10.0),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(
                    color: isError ? Colors.red : const Color(0xffD9D9D9),
                    width: 1,
                  ),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(
                    color: isError ? Colors.red : const Color(0xffD9D9D9),
                  ),
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
          ),
          if (isError)
            const Padding(
              padding: EdgeInsets.only(top: 5),
              child: Text(
                "لا يسمح بوضع قيمة فارغة",
                style: TextStyle(color: Colors.red, fontSize: 12),
              ),
            ),
        ],
      ),
    );
  }
}
