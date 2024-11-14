import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../Link/Controller/AdminController/AdminStudentsAttendens.dart';

class StudentsAttendanceManagmentGrid extends StatelessWidget {
  StudentsAttendanceManagmentGrid({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<StudentsAttendensController>(builder: (controller) {
      return Padding(
        padding: const EdgeInsets.only(top: 10, left: 40, right: 40),
        child: Obx(() => ListView.builder(
              itemCount: controller.Students.length,
              itemBuilder: (context, index) {
                return Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          width: Get.width / 3.5,
                          child: Row(
                            children: [
                              Image.asset("../../images/Rectangle66.png",
                                  height: 50, width: 50),
                              Padding(
                                padding: const EdgeInsets.only(
                                    left: 8.0, right: 8.0),
                                child: Text(
                                    "${controller.Students[index]['name']}"),
                              ),
                            ],
                          ),
                        ),
                        ...['Present', 'Truant', 'Late', 'Holiday']
                            .map((status) => Row(
                                  children: [
                                    Radio(
                                      value: status,
                                      groupValue: controller.Students[index]
                                          ['status'],
                                      activeColor: Color(0xff134B70),
                                      onChanged: (value) {
                                        controller.updateStatus(index, value!);
                                      },
                                    ),
                                    Text(
                                      status,
                                      style: TextStyle(
                                        color: status == 'Present'
                                            ? Color(0xff2F9742)
                                            : status == 'Truant'
                                                ? Color(0xff972F2F)
                                                : status == 'Late'
                                                    ? Color(0xff349393)
                                                    : Color(0xff134B70),
                                      ),
                                    ),
                                  ],
                                ))
                            .toList(),
                      ],
                    ),
                    Divider(
                      color: Get.theme.primaryColor,
                    ),
                  ],
                );
              },
            )),
      );
    });
  }
}
