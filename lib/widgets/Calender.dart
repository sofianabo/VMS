import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx/Controller/WidgetController/DateControler.dart';
import 'package:getx/Icons_File/v_m_s__icons_icons.dart';
import 'package:intl/intl.dart';

class DatePicker extends StatelessWidget {
  double width;
  
DatePicker(
      {super.key,
      required this.width,
     });
  @override
  Widget build(BuildContext context) {

    final DatePickerController controller = Get.put(DatePickerController());
    return Center(
      child: Obx(
        () => Container(
          width:width,
          height: 40,
          alignment: Alignment.center,
          child: TextFormField(
            controller: TextEditingController(
              text: controller.selectedDate.value != null
                  ? DateFormat('yyyy-MM-dd')
                      .format(controller.selectedDate.value!)
                  : '',
            ),
            readOnly: true,
            onTap: () => controller.selectDate(context),
            decoration: InputDecoration(
              hintText: "Select Date",
              hintStyle: Get.theme.primaryTextTheme.titleMedium!.copyWith(
                fontSize: 14
              ),
              focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(5),
                  borderSide: BorderSide(
                      color: Get.theme.colorScheme.primary, width: 2)),
              enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(5),
                  borderSide: const BorderSide(color: Colors.grey)),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(5),
              ),
              suffixIcon: IconButton(
                icon: Icon(VMS_Icons.calender,color: Get.theme.primaryColor, size: 16,),
                onPressed: () => controller.selectDate(context),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
