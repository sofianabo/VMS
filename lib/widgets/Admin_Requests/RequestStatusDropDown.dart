import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vms_school/Link/Controller/AdminController/DropDownStatusController.dart';
import 'package:vms_school/Link/Controller/AdminController/RequestsController.dart';
import 'package:vms_school/Link/Controller/AdminController/Student_Attendenc_Controller.dart';

class Requeststatusdropdown extends StatelessWidget {
  final double width;
  final String title;
  final String type;
  final Color? color;

  const Requeststatusdropdown({
    Key? key,
    required this.title,
    this.color,
    required this.width,
    required this.type,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<Requestscontroller>(builder: (cont) {
      String selectedValue = "";

      selectedValue = cont.selectedstatusIndex.isNotEmpty
          ? cont.selectedstatusIndex
          : title;

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

  List<DropdownMenuItem<String>> _getDropdownItems(Requestscontroller cont) {
    List<DropdownMenuItem<String>> items = [];

    items.addAll(cont.statusList.map((String value) {
      return DropdownMenuItem<String>(
        value: value,
        child: Text(
          value,
          style: Get.theme.primaryTextTheme.titleMedium!.copyWith(fontSize: 14),
        ),
      );
    }).toList());

    return items;
  }
}
