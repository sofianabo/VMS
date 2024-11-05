import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx/Controller/WidgetController/DateControler.dart';
import 'package:intl/intl.dart';

class DatePicker extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final DatePickerController controller = Get.put(DatePickerController());
    return Center(
      child: Obx(
        () => Container(
          width: 280,
          height: 40,
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
              focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(
                      color: Get.theme.colorScheme.primary, width: 2)),
              enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: const BorderSide(color: Colors.grey)),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              suffixIcon: IconButton(
                icon: Icon(Icons.calendar_today),
                onPressed: () => controller.selectDate(context),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
