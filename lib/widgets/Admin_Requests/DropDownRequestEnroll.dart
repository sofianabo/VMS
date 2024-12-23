import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vms_school/Link/API/AdminAPI/School/School_DropDown/DropdownDivisionAPI.dart';
import 'package:vms_school/Link/Controller/AdminController/Students_Controllers/RequestsController.dart';
import 'package:vms_school/Link/Controller/WidgetController/DropDown_Controllers/DropDownDivisionController.dart';
import 'package:vms_school/Link/Model/AdminModel/AllDivisionModel.dart';

class Dropdownrequestenroll extends StatelessWidget {
  final double width;
  final String title;
  final String type;
  final Color? color;
  final bool isLoading;
  final bool? isDisabled;

  Dropdownrequestenroll({
    Key? key,
    required this.title,
    this.color,
    required this.width,
    required this.type,
    required this.isLoading, 
     this.isDisabled = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<Requestscontroller>(builder: (cont) {
      String selectedValue = title;

      switch (type) {
        case 'status':
          if (cont.statusList.contains(cont.selectedStatusIndex)) {
            selectedValue = cont.selectedStatusIndex;
          }
          break;
        case 'class':
          if (cont.classlist.contains(cont.selectedClassIndex)) {
            selectedValue = cont.selectedClassIndex;
          }
          break;
        case 'division':
          if (cont.divisionlist.contains(cont.selectedDivisionIndex)) {
            selectedValue = cont.selectedDivisionIndex;
          }
          break;
      }

      return Container(
        padding: EdgeInsets.all(6.0),
        alignment: Alignment.centerLeft,
        width: width,
        height: 40,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          border: Border.all(color: color ?? const Color(0xffD9D9D9)),
        ),
        child: isDisabled == true?
        Row(
          children: [
            Text("Division" , style: TextStyle(color: Colors.grey),),
          ],
        ):
        isLoading == true
            ? Center(
          child: SizedBox(
            width: 20,
            height: 20,
            child: CircularProgressIndicator(strokeWidth: 3),
          ),
        )
            : Row(
          children: [
            Expanded(
              child: DropdownButton<String>(
                onChanged: (newValue) {
                  if (newValue != null && newValue != title) {
                    cont.selectIndex(type, newValue);
                    cont.selectIndex(type, newValue);
                  }
                },
                dropdownColor: Get.theme.cardColor,
                iconDisabledColor: Colors.grey,
                iconEnabledColor: Get.theme.cardColor,
                value: selectedValue,
                isExpanded: true,
                underline: const SizedBox(),
                icon:  selectedValue.isNotEmpty && selectedValue != title
                    ? GestureDetector(
                  onTap: () {
                    cont.selectIndex(type, "");
                    cont.update();
                  },
                  child: Icon(
                    Icons.close,
                    color: Get.theme.secondaryHeaderColor,
                  ),
                )
                    : Icon(
                  Icons.arrow_drop_down,
                  color: Get.theme.secondaryHeaderColor,
                ),
                style: Get.theme.textTheme.bodyMedium!.copyWith(fontSize: 14),
                items: [
                  DropdownMenuItem<String>(
                    value: title,
                    child: Text(
                      title,
                      style: Get.theme.textTheme.bodyMedium!.copyWith(
                        fontSize: 14,
                      ),
                    ),
                  ),
                  ..._getDropdownItems(cont,context),
                ],
                borderRadius: BorderRadius.circular(3),
              ),
            ),
          ],
        ),
      );

    });
  }

  List<DropdownMenuItem<String>> _getDropdownItems(
      Requestscontroller cont, BuildContext context) {
    List<DropdownMenuItem<String>> items = [];

    switch (type) {
      case 'division':
        items.addAll(cont.divisionlist.map((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Text(
              value,
              style: Get.theme.textTheme.bodyMedium!.copyWith(fontSize: 14),
            ),
            onTap: () async {
              cont.selectIndex(type, value);
            },
          );
        }).toList());
        break;
      case 'class':
        items.addAll(cont.classlist.map((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Text(
              value,
              style: Get.theme.textTheme.bodyMedium!.copyWith(fontSize: 14),
            ),
            onTap: () async {
              AllDivisionModel division =
              await Dropdowndivisionapi(context).Dropdowndivision(
                cont.classlist.indexOf(value),
              );
              print(cont.classlist.indexOf(value));
              cont.setAllDivisionDialog(division);
            },
          );
        }).toList());
        break;
      case 'status':
        items.addAll(cont.statusList.map((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Text(
              value,
              style: Get.theme.textTheme.bodyMedium!.copyWith(fontSize: 14),
            ),
            onTap: () async {
              cont.selectIndex(type, value);
            },
          );
        }).toList());
        break;
    }

    return items;
  }
}
