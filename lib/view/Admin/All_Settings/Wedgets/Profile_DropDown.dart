import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vms_school/Link/Controller/AdminController/Main_Admin_Controller/Admin_DropDown_Profile_Controller.dart';
import 'package:vms_school/Translate/local_controller.dart';

class Profile_DropDown extends StatefulWidget {
  final double width;
  final String title;
  final String type;
  final Color? color;
  final Widget? upicon;
  final bool enabled;
  final String labelText; // النص الذي يظهر فوق الـ DropdownButton

  const Profile_DropDown({
    super.key,
    required this.title,
    this.color,
    this.upicon,
    required this.width,
    required this.type,
    required this.enabled,
    this.labelText = "", // نص افتراضي فارغ
  });

  @override
  State<Profile_DropDown> createState() => _Profile_DropDownState();
}

class _Profile_DropDownState extends State<Profile_DropDown> {
  final FocusNode _focusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    _focusNode.addListener(() {
      setState(() {});
    });
  }

  @override
  void dispose() {
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<Profile_DropDown_Controller>(builder: (cont) {
      String selectedValue = "";

      switch (widget.type) {
        case 'Gender':
          selectedValue = cont.selecteGenderIndex.isNotEmpty
              ? cont.selecteGenderIndex
              : widget.title;
          break;
        case 'Family_Status':
          selectedValue = cont.selecteFamily_StatusIndex.isNotEmpty
              ? cont.selecteFamily_StatusIndex
              : widget.title;
          break;
      }

      return GestureDetector(
        onTap: () {
          if (widget.enabled) {
            _focusNode.requestFocus();
          }
        },
        child: Focus(
          focusNode: _focusNode,
          child: Column(
            textDirection: Get.find<LocalizationController>()
                        .currentLocale
                        .value
                        .languageCode ==
                    'ar'
                ? TextDirection.rtl
                : TextDirection.ltr,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if (widget.labelText.isNotEmpty)
                Padding(
                  padding: const EdgeInsets.only(left: 6.0, bottom: 4.0),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    spacing: 8.0,
                    textDirection: Get.find<LocalizationController>()
                                .currentLocale
                                .value
                                .languageCode ==
                            'ar'
                        ? TextDirection.rtl
                        : TextDirection.ltr,
                    children: [
                      if (widget.upicon != null) widget.upicon!,
                      Text(
                        widget.labelText,
                        style: Theme.of(context).textTheme.bodySmall,
                      ),
                    ],
                  ),
                ),
              Container(
                padding: const EdgeInsets.all(6.0),
                alignment: Alignment.centerLeft,
                width: widget.width,
                height: 40,
                decoration: BoxDecoration(
                  border: Border(
                    top: BorderSide.none,
                    left: BorderSide.none,
                    right: BorderSide.none,
                    bottom: _focusNode.hasFocus && widget.enabled
                        ? BorderSide(
                            color: widget.color ?? Colors.black,
                            width: 2,
                          )
                        : BorderSide.none,
                  ),
                ),
                child: Row(
                  children: [
                    Expanded(
                      child: DropdownButton<String>(
                        icon: Icon(
                          Icons.arrow_drop_down_outlined,
                          color: widget.enabled
                              ? Get.theme.secondaryHeaderColor
                              : Colors.grey,
                        ),
                        dropdownColor: Get.theme.cardColor,
                        iconDisabledColor: Colors.grey,
                        iconEnabledColor: Get.theme.cardColor,
                        value: selectedValue,
                        isExpanded: true,
                        underline: const SizedBox(),
                        style: Get.theme.textTheme.bodyMedium!
                            .copyWith(fontSize: 14),
                        onChanged: widget.enabled
                            ? (newValue) {
                                if (newValue != null) {
                                  cont.selectIndex(widget.type, newValue);
                                }
                              }
                            : null,
                        items: [
                          DropdownMenuItem<String>(
                            value: widget.title,
                            enabled: false,
                            child: Text(
                              widget.title,
                              style: Get.theme.textTheme.bodyMedium!.copyWith(
                                fontSize: 14,
                                color: widget.enabled ? null : Colors.grey,
                              ),
                            ),
                          ),
                          ..._getDropdownItems(cont, widget.enabled),
                        ],
                        borderRadius: BorderRadius.circular(3),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      );
    });
  }

  List<DropdownMenuItem<String>> _getDropdownItems(
      Profile_DropDown_Controller cont, bool enabled) {
    List<DropdownMenuItem<String>> items = [];

    switch (widget.type) {
      case 'Gender':
        items.addAll(cont.GenderList.map((String value) {
          return DropdownMenuItem<String>(
            value: value,
            enabled: enabled,
            child: Text(
              value,
              style: Get.theme.textTheme.bodyMedium!.copyWith(
                fontSize: 14,
                color: enabled ? null : Colors.grey,
              ),
            ),
          );
        }).toList());
        break;
      case 'Family_Status':
        items.addAll(cont.Family_StatusList.map((String value) {
          return DropdownMenuItem<String>(
            value: value,
            enabled: enabled,
            child: Text(
              value,
              style: Get.theme.textTheme.bodyMedium!.copyWith(
                fontSize: 14,
                color: enabled ? null : Colors.grey,
              ),
            ),
          );
        }).toList());
        break;
    }

    return items;
  }
}
