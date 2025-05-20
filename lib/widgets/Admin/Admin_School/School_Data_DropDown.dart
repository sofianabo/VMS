import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vms_school/Link/Controller/AdminController/School_Controllers/School_Info_Controller.dart';

class School_Data_DropDown extends StatelessWidget {
  final double width;
  final String title;
  final String type;
  final Color? color;
  final bool isLoading;
  final bool isRequired;
  final bool isDisabled;
  final bool isError;

  const School_Data_DropDown({
    super.key,
    required this.title,
    this.color,
    required this.width,
    required this.type,
    required this.isLoading,
    this.isRequired = false,
    this.isDisabled = false,
    this.isError = false,
  });

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SchoolInfoController>(builder: (cont) {
      List<String> itemList = _getListByType(cont);
      String? selectedValue;

      if (itemList.isNotEmpty) {
        selectedValue = cont.getSelectedIndex(type).isNotEmpty
            ? cont.getSelectedIndex(type)
            : null;
      }

      return Container(
        height: 82,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 5.0),
              child: RichText(
                text: TextSpan(
                  text: title,
                  style: Theme.of(context)
                      .textTheme
                      .bodyMedium
                      ?.copyWith(fontSize: 14),
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
                                icon: GestureDetector(
                                  onTap: isDisabled
                                      ? null
                                      : () {
                                          cont.selectIndex(type, "");
                                          WidgetsBinding.instance
                                              .addPostFrameCallback((_) {
                                            cont.updateFieldError(
                                                "Country", true);
                                          });
                                        },
                                  child: Icon(
                                    Icons.arrow_drop_down_outlined,
                                    color: Get.theme.secondaryHeaderColor,
                                  ),
                                ),
                                onChanged: (newValue) {
                                  if (newValue != null) {
                                    cont.selectIndex(type, newValue);
                                    cont.SelectCountryId(cont.countryData!
                                        .firstWhere(
                                          (country) =>
                                              country.enName == newValue ||
                                              country.name == newValue,
                                        )
                                        .id!);
                                    print(cont.countruId);
                                  }

                                  WidgetsBinding.instance
                                      .addPostFrameCallback((_) {
                                    cont.updateFieldError("Country", false);
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
                                      title.tr,
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

  List<String> _getListByType(SchoolInfoController cont) {
    switch (type) {
      case 'Country':
        return cont.CountryList;
      default:
        return [];
    }
  }

  List<DropdownMenuItem<String>> _getDropdownItems(SchoolInfoController cont) {
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
