import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../Link/Controller/AdminController/AdminTeacherAttendens.dart';

class TeacherAttendanceManagmentGrid extends StatelessWidget {
  TeacherAttendanceManagmentGrid({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<TeacherAttendensController>(builder: (controller) {
      return Padding(
        padding: const EdgeInsets.only(top: 10, left: 40, right: 40),
        child: Obx(() => ListView.builder(
              itemCount: controller.Teachers.length,
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
                                    "${controller.Teachers[index]['name']}"),
                              ),
                            ],
                          ),
                        ),
                        ...['Present', 'Truant', 'Late', 'Vacation', 'Holiday']
                            .map((status) => Row(
                                  children: [
                                    Radio(
                                      value: status,
                                      groupValue: controller.Teachers[index]
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
                                                    : status == 'Vacation'
                                                        ? Color(0xffB27671)
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
