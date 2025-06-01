import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vms_school/Link/API/AdminAPI/School/School_DropDown/DropdownDivisionAPI.dart';
import 'package:vms_school/Link/API/Guardians_API/Get_My_Children_API.dart';
import 'package:vms_school/Link/Controller/AdminController/Location_controller.dart';
import 'package:vms_school/Link/Controller/GuardianController/AddGurdianChildController.dart';
import 'package:vms_school/Link/Controller/GuardianController/MyChildren_Controller.dart';

class Dropdowngurdiansession extends StatelessWidget {
  final double width;
  final String title;
  final String type;
  final Color? color;
  final bool isLoading;

  const Dropdowngurdiansession({
    super.key,
    required this.title,
    this.color,
    required this.width,
    required this.type,
    required this.isLoading,
  });

  @override
  Widget build(BuildContext context) {
    return GetBuilder<MyChildren_Controller>(builder: (cont) {
      List<String> itemList = _getListByType(cont);

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
                  color: const Color(0xffD9D9D9),
                ),
              ),
              child: isLoading == true
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
                                    onTap: () {
                                      cont.selectIndex(type, "");
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
                                cont.setsessionid(cont.sessions!.sessions!
                                    .firstWhere(
                                        (session) => session.year == newValue)
                                    .id);
                                Get_My_Children_API()
                                    .Get_My_Children(id: cont.sessionId);
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
          ],
        ),
      );
    });
  }

  /// 🔹 دالة لإرجاع القائمة بناءً على النوع
  List<String> _getListByType(MyChildren_Controller cont) {
    switch (type) {
      case "session":
        return cont.SessionList;
      default:
        return [];
    }
  }

  /// 🔹 دالة لإنشاء عناصر القائمة
  List<DropdownMenuItem<String>> _getDropdownItems(MyChildren_Controller cont) {
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
