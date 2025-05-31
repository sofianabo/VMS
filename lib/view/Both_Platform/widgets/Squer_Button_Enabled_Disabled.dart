import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Squer_Button_Enabled_Disabled extends StatefulWidget {
  Squer_Button_Enabled_Disabled(
      {required this.validate,
      required this.icon,
      required this.onTap,
      super.key});
  bool validate;
  IconData icon;
  VoidCallback onTap;
  @override
  State<Squer_Button_Enabled_Disabled> createState() =>
      _Squer_Button_Enabled_DisabledState();
}

class _Squer_Button_Enabled_DisabledState
    extends State<Squer_Button_Enabled_Disabled> {
  @override
  Widget build(BuildContext context) {
    return Container(
        width: 40,
        height: 40,
        decoration: BoxDecoration(
            color: widget.validate
                ? Get.theme.disabledColor
                : Theme.of(context).cardColor,
            borderRadius: BorderRadius.circular(5),
            boxShadow: const [
              BoxShadow(
                  color: Colors.black12, offset: Offset(0, 2), blurRadius: 1)
            ]),
        child: IconButton(
            splashColor: widget.validate
                ? Get.theme.disabledColor
                : Theme.of(context).cardColor,
            style: ButtonStyle(
                backgroundColor: WidgetStatePropertyAll(widget.validate
                    ? Get.theme.disabledColor
                    : Theme.of(context).cardColor),
                shape: const WidgetStatePropertyAll(RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(5))))),
            onPressed: !widget.validate ? widget.onTap : () {},
            icon: Icon(widget.icon,
                size: 18,
                color: widget.validate
                    ? Colors.white
                    : Theme.of(context).textTheme.titleMedium!.color!)));
  }
}
