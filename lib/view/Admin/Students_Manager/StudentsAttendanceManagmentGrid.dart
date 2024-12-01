import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:vms_school/Link/API/API.dart';
import 'package:vms_school/Link/Controller/AdminController/Students_Controllers/AdminStudentsAttendens.dart';
import 'package:vms_school/widgets/Schema_Widget.dart';

class StudentsAttendanceManagmentGrid extends StatelessWidget {
  StudentsAttendanceManagmentGrid({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<Student_attendence_controller>(builder: (controller) {
      return Padding(
        padding: const EdgeInsets.only(top: 10, left: 40, right: 40),
        child: controller.isLoading == false ?
        Obx(() => ListView.builder(
              itemCount: controller.students.length,
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
                              FutureBuilder(
                                future: precacheImage(NetworkImage("$getimage${controller.students[index]["imgid"]}"), context),
                                builder: (context, snapshot) {
                                  if (snapshot.connectionState == ConnectionState.done) {
                                    return  CircleAvatar(
                                      maxRadius: 25,
                                      backgroundColor: const Color(0xffC4C4C4),
                                      backgroundImage:
                                      controller.students[index]["imgid"] != null
                                          ? NetworkImage("$getimage${controller.students[index]["imgid"]}") :
                                      null,

                                      child: controller.students[index]["imgid"] == null
                                          ? const Icon(
                                        Icons.image_outlined,
                                        color: Colors.white,
                                        size: 15,
                                      )
                                          : null,
                                    );
                                  } else {
                                    return CircleAvatar(
                                      maxRadius: 25,
                                      backgroundColor: const Color(0xffC4C4C4),
                                      child: LoadingAnimationWidget.inkDrop(
                                        color: Theme.of(context).primaryColor,
                                        size: 15,
                                      ),
                                    );
                                  }
                                },
                              ),

                              Padding(
                                padding: const EdgeInsets.only(
                                    left: 8.0, right: 8.0),
                                child: Text(
                                    "${controller.students[index]['name']}"),
                              ),
                            ],
                          ),
                        ),
                        ...['Present', 'Truant', 'Late', 'Holiday']
                            .map((status) => Row(
                                  children: [
                                    Radio(
                                      value: status,
                                      groupValue: controller.students[index]
                                          ['status'],
                                      activeColor: Color(0xff134B70),
                                      onChanged: (value) {
                                        controller.updateStatus(index, value.toString());
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
            )):
        Column(
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(top: 10, left: 40, right: 40),
                child: ListView.builder(
                  itemCount: 10,
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
                                  SchemaWidget(width: 50, height: 50,radius: 50,),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        left: 8.0, right: 8.0),
                                    child:  SchemaWidget(width: 70, height: 15),
                                  ),
                                ],
                              ),
                            ),
                            ...['Present', 'Truant', 'Late', 'Vacation', 'Holiday']
                                .map((status) => Row(
                              children: [
                                SchemaWidget(width: 15, height: 15 , radius: 50,),
                                SchemaWidget(width: 50, height: 15),

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
                ),
              ),
            ),
          ],
        )
      );
    });
  }
}
