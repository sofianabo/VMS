import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx/Link/Controller/WidgetController/DateControler.dart';
import 'package:getx/Icons_File/v_m_s__icons_icons.dart';
import 'package:intl/intl.dart';

class DatePicker extends StatelessWidget {
  double width;
  double? height;

DatePicker(
      {super.key,
      required this.width,
       this.height,
     });
  @override
  Widget build(BuildContext context) {

    final DatePickerController controller = Get.put(DatePickerController());
    return Obx(
      () => Container(
        width: width,
        height: height != null ? height : 40,
        alignment: Alignment.center,
        child: TextFormField(
          style: TextStyle(fontSize: 14),
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
            hintStyle:
                Get.theme.primaryTextTheme.titleMedium!.copyWith(fontSize: 14),
            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(5),
                borderSide:
                    BorderSide(color: Get.theme.colorScheme.primary, width: 2)),
            enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(5),
                borderSide: const BorderSide(color: Colors.grey)),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(5),
            ),
            suffixIcon: IconButton(
              icon: Icon(
                VMS_Icons.calender,
                color: Get.theme.primaryColor,
                size: 16,
              ),
              onPressed: () => controller.selectDate(context),
            ),
          ),
        ),
      ),
    );
  }
}

class DatePickerupper extends StatelessWidget {
  double width;
  String Uptext;
  double? height;

  DatePickerupper({
    super.key,
    required this.width,
    required this.Uptext,
    this.height,
  });

  @override
  Widget build(BuildContext context) {
    final DatePickerController controller = Get.put(DatePickerController());
    return Obx(
      () => Container(
        width: width,
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 5.0),
              child: Text("$Uptext"),
            ),
            SizedBox(
              height: height != null ? height : 40,
              child: TextFormField(
                style: TextStyle(fontSize: 14),
                controller: TextEditingController(
                  text: controller.selectedDate.value != null
                      ? DateFormat('yyyy-MM-dd')
                          .format(controller.selectedDate.value!)
                      : '',
                ),
                readOnly: true,
                onTap: () => controller.selectDate(context),
                decoration: InputDecoration(
                  hintText: "yyyy-MM-dd",
                  hintStyle: Get.theme.primaryTextTheme.titleMedium!
                      .copyWith(fontSize: 14, color: Color(0xffD9D9D9)),
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5),
                      borderSide:
                          BorderSide(color: Color(0xffD9D9D9), width: 2)),
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5),
                      borderSide: const BorderSide(color: Color(0xffD9D9D9))),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5),
                  ),
                  suffixIcon: IconButton(
                    icon: Icon(
                      VMS_Icons.calender,
                      color: Get.theme.primaryColor,
                      size: 16,
                    ),
                    onPressed: () => controller.selectDate(context),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
