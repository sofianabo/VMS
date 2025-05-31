import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TimePickerField extends StatelessWidget {
  final String label;
  final String hint;
  final double width;
  final bool enabled;
  final RxString timeValue;
  final TextEditingController controller;
  final Function(bool)? onErrorChanged;

  const TimePickerField({
    Key? key,
    required this.label,
    required this.hint,
    required this.width,
    required this.enabled,
    required this.timeValue,
    required this.controller,
    this.onErrorChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 73,
      width: width,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        spacing: 5,
        children: [
          Text(label),
          Obx(() {
            controller.text = timeValue.value;
            return Container(
              height: 40,
              child: TextFormField(
                style: TextStyle(fontSize: 14),
                onTap: enabled ? () => _selectTime(context) : null,
                controller: controller,
                decoration: InputDecoration(
                  hintStyle: const TextStyle(color: Colors.grey),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5),
                    borderSide: BorderSide(
                        color: Theme.of(context).canvasColor, width: 2),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5),
                    borderSide: BorderSide(color: const Color(0xffD9D9D9)),
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5),
                  ),
                ),
                readOnly: true,
              ),
            );
          }),
        ],
      ),
    );
  }

  Future<void> _selectTime(BuildContext context) async {
    final initialTime = _parseTime(timeValue.value);

    final picked = await showTimePicker(
      context: context,
      initialTime: initialTime,
    );

    if (picked != null) {
      final formattedTime = picked.format(context);
      timeValue.value = formattedTime;
      if (onErrorChanged != null) {
        onErrorChanged!(false);
      }
    }
  }

  TimeOfDay _parseTime(String timeStr) {
    try {
      final parts = timeStr.split(RegExp(r'[: ]'));
      int hour = int.parse(parts[0]);
      final minute = int.parse(parts[1]);

      if (parts.length > 2 && parts[2].toLowerCase() == 'pm' && hour < 12) {
        hour += 12;
      }

      return TimeOfDay(hour: hour, minute: minute);
    } catch (e) {
      return TimeOfDay.now();
    }
  }
}
