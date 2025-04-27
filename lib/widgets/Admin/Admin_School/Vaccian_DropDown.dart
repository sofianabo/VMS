import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vms_school/Link/Controller/AdminController/Location_controller.dart';
import 'package:vms_school/Link/Controller/AdminController/School_Controllers/Vaccines_Controller.dart';

class DropdownVaccian extends StatelessWidget {
  final double width;
  final String title;
  final String type;
  final Color? color;
  final bool isLoading;
  final bool isDisabled;
  final bool isError;

  const DropdownVaccian({
    super.key,
    required this.title,
    this.color,
    required this.width,
    required this.type,
    required this.isLoading,
    this.isDisabled = false,
    this.isError = false,
  });

  @override
  Widget build(BuildContext context) {
    return GetBuilder<Vaccines_Controller>(builder: (cont) {
      if (type == 'Location' && cont.LocationIndex == "Syria".tr) {
        WidgetsBinding.instance.addPostFrameCallback((_) {
          Get.find<Location_controller>()
              .setLocationsid(cont.Locationlist.indexOf(cont.LocationIndex));
        });
      }
      String? selectedValue;

      switch (type) {
        case 'Location':
          selectedValue =
              cont.LocationIndex.isEmpty ? null : cont.LocationIndex;
          break;
      }
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.all(6.0),
            alignment: Alignment.centerLeft,
            width: width,
            height: 40,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              border: Border.all(
                color: isError ? Colors.red : const Color(0xffD9D9D9),
              ),
            ),
            child: isDisabled == true
                ? Row(
                    children: [
                      Text(
                        title.tr,
                        style: TextStyle(color: Colors.grey),
                      ),
                    ],
                  )
                : isLoading == true
                    ? const Center(
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
                              icon: selectedValue != title
                                  ? GestureDetector(
                                      onTap: isDisabled
                                          ? null
                                          : () {
                                              cont.selectIndex(type, "");
                                              print("sss");
                                            },
                                      child: Icon(
                                        Icons.arrow_drop_down_outlined,
                                        color: Get.theme.secondaryHeaderColor,
                                      ),
                                    )
                                  : Icon(Icons.close,
                                      color: Get.theme.secondaryHeaderColor),
                              onChanged: (newValue) {
                                if (newValue != null) {
                                  cont.selectIndex(type, newValue);
                                  if (type == 'Location') {
                                    Get.find<Location_controller>()
                                        .setLocationsid(
                                            cont.Locationlist.indexOf(
                                                newValue));
                                  }
                                }
                              },
                              dropdownColor: Get.theme.cardColor,
                              iconDisabledColor: Colors.grey,
                              iconEnabledColor: Get.theme.cardColor,
                              value: selectedValue,
                              isExpanded: true,
                              underline: const SizedBox(),
                              style: Get.theme.textTheme.bodyMedium!
                                  .copyWith(fontSize: 14),
                              items: [
                                DropdownMenuItem<String>(
                                  value: null,
                                  child: Text(
                                    title
                                        .tr, // يظهر العنوان عند عدم اختيار أي قيمة
                                    style: Get.theme.textTheme.bodyMedium!
                                        .copyWith(
                                            fontSize: 14, color: Colors.grey),
                                  ),
                                ),
                                ..._getDropdownItems(cont),
                              ],
                              borderRadius: BorderRadius.circular(3),
                            ),
                          ),
                        ],
                      ),
          ),
          if (isError)
            Text(
              "يرجى اختيار قيمة صحيحة",
              style: TextStyle(color: Colors.red, fontSize: 12),
            ),
        ],
      );
    });
  }

  List<DropdownMenuItem<String>> _getDropdownItems(Vaccines_Controller cont) {
    List<DropdownMenuItem<String>> items = [];

    switch (type) {
      case 'Location':
        items.addAll(cont.Locationlist.map((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Text(
              value.tr,
              style: Get.theme.textTheme.bodyMedium!.copyWith(fontSize: 14),
            ),
          );
        }).toList());

        break;
    }

    return items;
  }
}
