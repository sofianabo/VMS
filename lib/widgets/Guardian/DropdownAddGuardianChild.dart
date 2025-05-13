import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vms_school/Link/API/AdminAPI/School/School_DropDown/DropdownDivisionAPI.dart';
import 'package:vms_school/Link/Controller/AdminController/Location_controller.dart';
import 'package:vms_school/Link/Controller/GuardianController/AddGurdianChildController.dart';

class AddguardianchildDropdown extends StatelessWidget {
  final double width;
  final String title;
  final String type;
  final Color? color;
  final bool isLoading;
  final bool isDisabled;
  final bool isError;

  const AddguardianchildDropdown({
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
    return GetBuilder<Addgurdianchildcontroller>(builder: (cont) {
      List<String> itemList = _getListByType(cont);
      if (type == 'Location' && cont.LocationIndex == "Syria".tr) {
        WidgetsBinding.instance.addPostFrameCallback((_) {
          Get.find<Location_controller>()
              .setLocationsid(cont.Locationlist.indexOf(cont.LocationIndex));
        });
      }
      String? selectedValue;

      // ✅ تحديد القيمة المختارة بعد تعبئة القائمة
      if (itemList.isNotEmpty) {
        selectedValue = cont.getSelectedIndex(type).isNotEmpty
            ? cont.getSelectedIndex(type)
            : null;
      }

      return Container(
        height: 60,
        child: Column(
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
                                                final errorMap = {
                                                  "Gender": ["gender"],
                                                  "Realagon": ["religion"],
                                                  "BloodType": ["blood"],
                                                  "Location": ["country"],
                                                  "Class": ["class"],
                                                  "Division": ["division"],
                                                };

                                                WidgetsBinding.instance
                                                    .addPostFrameCallback((_) {
                                                  errorMap[type]
                                                      ?.forEach((field) {
                                                    if (type == "Gender") {
                                                      Get.find<
                                                              Addgurdianchildcontroller>()
                                                          .updateFieldError(
                                                              field, true);
                                                    } else if (type ==
                                                        "Realagon") {
                                                      Get.find<
                                                              Addgurdianchildcontroller>()
                                                          .updateFieldError(
                                                              field, true);
                                                    } else if (type ==
                                                        "BloodType") {
                                                      Get.find<
                                                              Addgurdianchildcontroller>()
                                                          .updateFieldError(
                                                              field, true);
                                                    }
                                                    cont.updateFieldError(
                                                        field, true);
                                                  });
                                                });
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

                                    if (type == 'Class') {
                                      Dropdowndivisionapi(context)
                                          .Dropdowndivision(
                                              cont.Classlist.indexOf(newValue),
                                              0);
                                    }

                                    if (type == 'Location') {
                                      Get.find<Location_controller>()
                                          .setLocationsid(
                                              cont.Locationlist.indexOf(
                                                  newValue));
                                      print(Get.find<Location_controller>()
                                          .Locationsid);
                                    }
                                  }
                                  final errorMap = {
                                    "Gender": ["gender"],
                                    "Realagon": ["religion"],
                                    "BloodType": ["blood"],
                                    "Location": ["country"],
                                    "Class": ["class"],
                                    "Division": ["division"],
                                  };

                                  WidgetsBinding.instance
                                      .addPostFrameCallback((_) {
                                    errorMap[type]?.forEach((field) {
                                      if ([
                                        "Gender",
                                        "Realagon",
                                        "BloodType",
                                        "Location",
                                        "Class",
                                        "Division"
                                      ].contains(type)) {
                                        Get.find<Addgurdianchildcontroller>()
                                            .updateFieldError(field, false);
                                      }

                                      cont.updateFieldError(field, false);
                                    });
                                  });
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
        ),
      );
    });
  }

  /// 🔹 دالة لإرجاع القائمة بناءً على النوع
  List<String> _getListByType(Addgurdianchildcontroller cont) {
    switch (type) {
      case 'Gender':
        return cont.Genderlist;
      case 'Realagon':
        return cont.Realagonlist;
      case 'BloodType':
        return cont.BloodTypelist;
      case 'Location':
        return cont.Locationlist;
      case 'FamilyState':
        return cont.FamilyStatelist;
      case 'Class':
        return cont.Classlist;
      case 'Division':
        return cont.Divisionlist;
      default:
        return [];
    }
  }

  /// 🔹 دالة لإنشاء عناصر القائمة
  List<DropdownMenuItem<String>> _getDropdownItems(
      Addgurdianchildcontroller cont) {
    return _getListByType(cont).map((String value) {
      return DropdownMenuItem<String>(
        value: value,
        child: Text(
          value.tr,
          style: Get.theme.textTheme.bodyMedium!.copyWith(fontSize: 14),
        ),
      );
    }).toList();
  }
}
