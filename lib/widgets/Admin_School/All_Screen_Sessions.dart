import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vms_school/Link/Controller/WidgetController/Sessions_DropDown_Controller.dart';


class DropDownAllSessions extends StatelessWidget {
  final double width;
  final String title;
  final String type;
  final Color? color;

  const DropDownAllSessions({
    Key? key,
    required this.title,
    this.color,
    required this.width,
    required this.type,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<All_Screen_Sessions_Controller>(builder: (cont) {
      String selectedValue = "";

      switch (type) {
        case 'session':
          selectedValue = cont.selectedsessionIndex.isNotEmpty
              ? cont.selectedsessionIndex
              : title;
          break;
      }

      return Container(
        padding: EdgeInsets.all(6.0),
        alignment: Alignment.centerLeft,
        width: width,
        height: 40,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          border: Border.all(color: color ?? Color(0xffD9D9D9)),
        ),
        child: DropdownButton<String>(
          focusColor: Colors.white,
          dropdownColor: Colors.white,
          iconDisabledColor: Colors.grey,
          iconEnabledColor: Colors.black,
          value: selectedValue,
          isExpanded: true,
          underline: const SizedBox(),
          // تأكيد عدم وجود خط تحت الـ Dropdown
          icon: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              const Icon(Icons.arrow_drop_down),
            ],
          ),
          style: Get.theme.primaryTextTheme.titleMedium!.copyWith(fontSize: 14),
          onChanged: (newValue) {
            if (newValue != null) {
              cont.selectIndex(type, newValue);
            }
          },
          items: [
            DropdownMenuItem<String>(
              value: title,
              enabled: false,
              child: Text(
                title,
                style: Get.theme.primaryTextTheme.titleMedium!.copyWith(
                  fontSize: 14,
                  color: Colors.black, // لون العنوان
                ),
              ),
            ),
            ..._getDropdownItems(cont),
          ],
          borderRadius: BorderRadius.circular(3),
        ),
      );
    });
  }

  List<DropdownMenuItem<String>> _getDropdownItems(All_Screen_Sessions_Controller cont) {
    List<DropdownMenuItem<String>> items = [];

    switch (type) {
      case 'session':
        items.addAll(cont.sessionlist.map((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Text(
              value,
              style: Get.theme.primaryTextTheme.titleMedium!
                  .copyWith(fontSize: 14),
            ),
          );
        }).toList());
        break;
    }

    return items;
  }
}
