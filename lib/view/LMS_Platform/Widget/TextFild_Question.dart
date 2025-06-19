import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:vms_school/Translate/local_controller.dart';
import 'package:vms_school/main.dart';

class Textfild_Question extends StatefulWidget {
  Textfild_Question({
    super.key,
    required this.controller,
    required this.hinttext,
    required this.isSelected,
    this.width,
    this.onChanged,
  });

  final TextEditingController controller;
  final String hinttext;
  final double? width;
  bool isSelected;
  final Function(String)? onChanged;

  @override
  State<Textfild_Question> createState() => _Textfild_QuestionState();
}

class _Textfild_QuestionState extends State<Textfild_Question> {
  @override
  Widget build(BuildContext context) {
    TextInputType keyboardType;
    List<TextInputFormatter>? inputFormatters;

    keyboardType = TextInputType.text;

    return Container(
      margin: const EdgeInsets.only(top: 2.0),
      width: widget.width ?? 250,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              color: widget.isSelected ? Color(0xff498160) : Colors.transparent,
            ),
            height: 40,
            child: TextFormField(
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  fontSize: 14,
                  color: widget.isSelected
                      ? Colors.white
                      : Theme.of(context).textTheme.titleMedium!.color!),
              textAlign: Get.find<LocalizationController>()
                          .currentLocale
                          .value
                          .languageCode ==
                      'ar'
                  ? TextAlign.right
                  : TextAlign.left,
              controller: widget.controller,
              keyboardType: keyboardType,
              inputFormatters: inputFormatters,
              onChanged: (value) {
                if (widget.onChanged != null) {
                  widget.onChanged!(widget.controller.text);
                }
              },
              decoration: InputDecoration(
                hintText: widget.hinttext,
                hintStyle: TextStyle(
                    color: widget.isSelected
                        ? Colors.white
                        : Theme.of(context).textTheme.titleMedium!.color!),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(5),
                  borderSide: BorderSide(
                      color: widget.isSelected
                          ? Color(0xff498160)
                          : Theme.of(context).textTheme.titleMedium!.color!,
                      width: 2),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(5),
                  borderSide: BorderSide(
                      color: widget.isSelected
                          ? Color(0xff498160)
                          : Theme.of(context).textTheme.titleMedium!.color!),
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

class Text_Fild_Question_Add extends StatefulWidget {
  Text_Fild_Question_Add({
    super.key,
    required this.controller,
    required this.hinttext,
    this.width,
    required this.maxwidth,
    this.onChanged,
    this.fontSize,
  });

  final TextEditingController controller;
  final String hinttext;
  final double? width;
  final double maxwidth;
  final double? fontSize;
  final Function(String)? onChanged;

  @override
  State<Text_Fild_Question_Add> createState() => _Text_Fild_Question_AddState();
}

class _Text_Fild_Question_AddState extends State<Text_Fild_Question_Add> {
  @override
  Widget build(BuildContext context) {
    TextInputType keyboardType;
    List<TextInputFormatter>? inputFormatters;

    keyboardType = TextInputType.text;

    return SizedBox(
      width: widget.maxwidth >= 1150
          ? widget.maxwidth * 0.6 - 100
          : widget.maxwidth >= 850
              ? widget.maxwidth * 0.6 - 186
              : widget.maxwidth >= 461
                  ? widget.maxwidth * 0.6
                  : widget.maxwidth * 0.6 - 50,
      child: IntrinsicHeight(
        child: TextFormField(
          textDirection: Get.find<LocalizationController>()
                      .currentLocale
                      .value
                      .languageCode ==
                  'ar'
              ? TextDirection.rtl
              : TextDirection.ltr,
          style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                fontWeight: FontWeight.bold,
                fontSize: widget.fontSize ?? 14,
              ),
          textAlign: Get.find<LocalizationController>()
                      .currentLocale
                      .value
                      .languageCode ==
                  'ar'
              ? TextAlign.right
              : TextAlign.left,
          controller: widget.controller,
          keyboardType: keyboardType,
          inputFormatters: inputFormatters,
          maxLines: null, // يسمح بزيادة الأسطر
          minLines: 1, // يبدأ بسطر واحد
          onChanged: (value) {
            if (widget.onChanged != null) {
              widget.onChanged!(widget.controller.text);
            }
          },
          decoration: InputDecoration(
            hintText: widget.hinttext,
            hintStyle: TextStyle(color: Colors.grey, fontSize: widget.fontSize),
            isDense: true, // يقلل المسافات الداخلية
            contentPadding: EdgeInsets.symmetric(
              horizontal: 4.5,
              vertical: 4.5, // تعديل لتحسين المظهر
            ),
            focusedBorder: OutlineInputBorder(borderSide: BorderSide.none),
            enabledBorder: OutlineInputBorder(borderSide: BorderSide.none),
            border: OutlineInputBorder(borderSide: BorderSide.none),
          ),
        ),
      ),
    );
  }
}
