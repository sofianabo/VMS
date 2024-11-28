import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vms_school/Link/API/AdminAPI/DropdownDivisionAPI.dart';
import 'package:vms_school/Link/Controller/AdminController/RequestsController.dart';
import 'package:vms_school/Link/Model/AdminModel/AllDivisionModel.dart';

class  Dropdownrequestenroll 
 extends StatelessWidget {
  final double width;
  final String title;
  final String type;
  final Color? color;

  const  Dropdownrequestenroll 
({
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

      switch (type) {
        case 'status':
          selectedValue = cont.selectedStatusIndex.isNotEmpty
              ? cont.selectedStatusIndex
              : title;

          break;
      
        case 'class':
          selectedValue = cont.selectedClassIndex.isNotEmpty
              ? cont.selectedClassIndex
              : title;

          break;
        case 'division':
          selectedValue = cont.selectedDivisionIndex.isNotEmpty
              ? cont.selectedDivisionIndex
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
            ..._getDropdownItems(cont, context),
          ],
          borderRadius: BorderRadius.circular(3),
        ),
      );
    });
  }

  List<DropdownMenuItem<String>> _getDropdownItems(
      Requestscontroller cont, BuildContext context) {
    List<DropdownMenuItem<String>> items = [];
    String sessionSelected = "";
    String gradeSelected = "";
    String classSelected = "";
    String divisionSelected = "";

    switch (type) {
      case 'status':
        items.addAll(cont.statusList.map((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Text(
              value,
              style: Get.theme.primaryTextTheme.titleMedium!
                  .copyWith(fontSize: 14),
            ),
            onTap: () async {
              sessionSelected = value;
           
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
              style: Get.theme.primaryTextTheme.titleMedium!
                  .copyWith(fontSize: 14),
            ),
            onTap: () async {
              classSelected = value;
                    AllDivisionModel division = await Dropdowndivisionapi(context)
                  .Dropdowndivision(cont.classlist.indexOf(value));
                                cont.setAllDivisionDialog(division);

            
            },
          );
        }).toList());
        break;
      case 'division':
        items.addAll(cont.divisionlist.map((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Text(
              value,
              style: Get.theme.primaryTextTheme.titleMedium!
                  .copyWith(fontSize: 14),
            ),
            onTap: () async {
              divisionSelected = value;
             
            },
          );
        }).toList());
        break;
    }

    return items;
  }
}
