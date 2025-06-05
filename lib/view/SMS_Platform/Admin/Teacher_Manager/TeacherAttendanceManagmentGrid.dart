import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:vms_school/Link/API/API.dart';
import 'package:vms_school/Link/Controller/AdminController/Employee_Controllers/Employeeecontroller.dart';
import 'package:vms_school/view/Both_Platform/widgets/ButtonsDialog.dart';
import 'package:vms_school/view/Both_Platform/widgets/Schema_Widget.dart';
import 'package:vms_school/view/Both_Platform/widgets/TextFildWithUpper.dart';
import 'package:vms_school/view/Both_Platform/widgets/VMSAlertDialog.dart';

class TeacherAttendanceManagmentGrid extends StatefulWidget {
  const TeacherAttendanceManagmentGrid({super.key});

  @override
  State<TeacherAttendanceManagmentGrid> createState() =>
      _TeacherAttendanceManagmentGridState();
}

class _TeacherAttendanceManagmentGridState
    extends State<TeacherAttendanceManagmentGrid> {
  TextEditingController cuse = TextEditingController();
  @override
  Widget build(BuildContext context) {
    double widthScreen = MediaQuery.of(context).size.width;

    return Container(
      width: widthScreen <= 769 ? 768 : widthScreen,
      child: GetBuilder<EmployeeController>(builder: (controller) {
        return controller.Isloading == false
            ? controller.teachers!.isEmpty
                ? Center(
                    child: Text("Attendance Today Has Been Uploaded".tr,
                        style: Get.theme.textTheme.titleLarge!.copyWith(
                            fontSize: 16, fontWeight: FontWeight.normal)))
                : (widthScreen > 769)
                    ? Obx(() {
                        return Column(
                          children: [
                            Expanded(
                              child: Padding(
                                  padding: const EdgeInsets.only(
                                      top: 10, left: 40, right: 40),
                                  child: ListView.builder(
                                    itemCount: controller.Employees.length,
                                    itemBuilder: (context, index) {
                                      return Column(
                                        children: [
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              SizedBox(
                                                width: 200,
                                                child: Row(
                                                  children: [
                                                    controller.Employees[index]
                                                                ["imgid"] !=
                                                            ""
                                                        ? CachedNetworkImage(
                                                            imageUrl:
                                                                "$getimage${controller.Employees[index]["imgid"]}",
                                                            imageBuilder: (context,
                                                                    imageProvider) =>
                                                                CircleAvatar(
                                                              maxRadius: 25,
                                                              backgroundColor:
                                                                  const Color(
                                                                      0xffC4C4C4),
                                                              backgroundImage:
                                                                  imageProvider,
                                                            ),
                                                            placeholder:
                                                                (context,
                                                                        url) =>
                                                                    CircleAvatar(
                                                              maxRadius: 25,
                                                              backgroundColor:
                                                                  const Color(
                                                                      0xffC4C4C4),
                                                              child:
                                                                  LoadingAnimationWidget
                                                                      .inkDrop(
                                                                color: Theme.of(
                                                                        context)
                                                                    .primaryColor,
                                                                size: 15,
                                                              ),
                                                            ),
                                                            errorWidget: (context,
                                                                    url,
                                                                    error) =>
                                                                _buildEmployeeInitial(
                                                                    controller.Employees[
                                                                            index]
                                                                        [
                                                                        "name"]),
                                                          )
                                                        : _buildEmployeeInitial(
                                                            controller
                                                                    .Employees[
                                                                index]["name"]),
                                                    Padding(
                                                      padding:
                                                          const EdgeInsets.only(
                                                              left: 8.0,
                                                              right: 8.0),
                                                      child: Container(
                                                        width: 130,
                                                        child: Text(
                                                            maxLines: 1,
                                                            overflow:
                                                                TextOverflow
                                                                    .ellipsis,
                                                            "${controller.Employees[index]['name']}"),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              ...[
                                                'Present',
                                                'Truant',
                                                'Late',
                                                'Vacation',
                                                'Holiday'
                                              ].map((status) => Row(
                                                    children: [
                                                      Radio(
                                                        value: status,
                                                        groupValue: controller
                                                                .Employees[
                                                            index]['status'],
                                                        activeColor:
                                                            const Color(
                                                                0xff134B70),
                                                        onChanged: (value) {
                                                          if (value ==
                                                              "Holiday") {
                                                          } else {
                                                            if (value ==
                                                                    "Truant" ||
                                                                value ==
                                                                    "Late" ||
                                                                value ==
                                                                    "Vacation") {
                                                              Get.dialog(
                                                                  VMSAlertDialog(
                                                                      action: [
                                                                    ButtonDialog(
                                                                        text: "Done"
                                                                            .tr,
                                                                        onPressed:
                                                                            () {
                                                                          controller.updateStatus(
                                                                              index,
                                                                              value.toString(),
                                                                              cuse.text);
                                                                          Get.back();
                                                                        },
                                                                        color: Get
                                                                            .theme
                                                                            .primaryColor,
                                                                        width:
                                                                            65)
                                                                  ],
                                                                      contents:
                                                                          SizedBox(
                                                                        width:
                                                                            500,
                                                                        child:
                                                                            Column(
                                                                          mainAxisSize:
                                                                              MainAxisSize.min,
                                                                          children: [
                                                                            Textfildwithupper(
                                                                                width: 250,
                                                                                controller: cuse,
                                                                                Uptext: "Cause".tr,
                                                                                hinttext: "Cause".tr)
                                                                          ],
                                                                        ),
                                                                      ),
                                                                      apptitle:
                                                                          "Enter The Reason For Absence"
                                                                              .tr,
                                                                      subtitle:
                                                                          "The reason for the absence of the student".tr +
                                                                              "${controller.Employees[index]['name']}"));
                                                            } else {
                                                              controller
                                                                  .updateStatus(
                                                                      index,
                                                                      value
                                                                          .toString(),
                                                                      null);
                                                            }
                                                          }
                                                        },
                                                      ),
                                                      Text(
                                                        status.tr,
                                                        style: TextStyle(
                                                          color: status ==
                                                                  'Present'
                                                              ? const Color(
                                                                  0xff2F9742)
                                                              : status ==
                                                                      'Truant'
                                                                  ? const Color(
                                                                      0xff972F2F)
                                                                  : status ==
                                                                          'Late'
                                                                      ? const Color(
                                                                          0xff349393)
                                                                      : status ==
                                                                              'Vacation'
                                                                          ? const Color(
                                                                              0xffB27671)
                                                                          : const Color(
                                                                              0xff134B70),
                                                        ),
                                                      ),
                                                    ],
                                                  )),
                                            ],
                                          ),
                                          Divider(
                                            color: Get.theme.primaryColor,
                                          ),
                                        ],
                                      );
                                    },
                                  )),
                            ),
                          ],
                        );
                      })
                    : Obx(() {
                        return Column(
                          children: [
                            Expanded(
                              child: SingleChildScrollView(
                                scrollDirection: Axis.horizontal,
                                child: Container(
                                  width: 769,
                                  height:
                                      MediaQuery.of(context).size.height - 225,
                                  child: Padding(
                                      padding: const EdgeInsets.only(
                                          top: 10, left: 40, right: 40),
                                      child: ListView.builder(
                                        itemCount: controller.Employees.length,
                                        itemBuilder: (context, index) {
                                          return Column(
                                            children: [
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  SizedBox(
                                                    width: 200,
                                                    child: Row(
                                                      children: [
                                                        controller.Employees[
                                                                        index]
                                                                    ["imgid"] !=
                                                                ""
                                                            ? CachedNetworkImage(
                                                                imageUrl:
                                                                    "$getimage${controller.Employees[index]["imgid"]}",
                                                                imageBuilder: (context,
                                                                        imageProvider) =>
                                                                    CircleAvatar(
                                                                  maxRadius: 25,
                                                                  backgroundColor:
                                                                      const Color(
                                                                          0xffC4C4C4),
                                                                  backgroundImage:
                                                                      imageProvider,
                                                                ),
                                                                placeholder: (context,
                                                                        url) =>
                                                                    CircleAvatar(
                                                                  maxRadius: 25,
                                                                  backgroundColor:
                                                                      const Color(
                                                                          0xffC4C4C4),
                                                                  child: LoadingAnimationWidget
                                                                      .inkDrop(
                                                                    color: Theme.of(
                                                                            context)
                                                                        .primaryColor,
                                                                    size: 15,
                                                                  ),
                                                                ),
                                                                errorWidget: (context,
                                                                        url,
                                                                        error) =>
                                                                    _buildEmployeeInitial(
                                                                        controller.Employees[index]
                                                                            [
                                                                            "name"]),
                                                              )
                                                            : _buildEmployeeInitial(
                                                                controller.Employees[
                                                                        index]
                                                                    ["name"]),
                                                        Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                  .only(
                                                                  left: 8.0,
                                                                  right: 8.0),
                                                          child: Container(
                                                            width: 130,
                                                            child: Text(
                                                                maxLines: 1,
                                                                overflow:
                                                                    TextOverflow
                                                                        .ellipsis,
                                                                "${controller.Employees[index]['name']}"),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                  ...[
                                                    'Present',
                                                    'Truant',
                                                    'Late',
                                                    'Vacation',
                                                    'Holiday'
                                                  ].map((status) => Row(
                                                        children: [
                                                          Radio(
                                                            value: status,
                                                            groupValue: controller
                                                                    .Employees[
                                                                index]['status'],
                                                            activeColor:
                                                                const Color(
                                                                    0xff134B70),
                                                            onChanged: (value) {
                                                              if (value ==
                                                                  "Holiday") {
                                                              } else {
                                                                if (value == "Truant" ||
                                                                    value ==
                                                                        "Late" ||
                                                                    value ==
                                                                        "Vacation") {
                                                                  Get.dialog(VMSAlertDialog(
                                                                      action: [
                                                                        ButtonDialog(
                                                                            text: "Done"
                                                                                .tr,
                                                                            onPressed:
                                                                                () {
                                                                              controller.updateStatus(index, value.toString(), cuse.text);
                                                                              Get.back();
                                                                            },
                                                                            color:
                                                                                Get.theme.primaryColor,
                                                                            width: 65)
                                                                      ],
                                                                      contents: SizedBox(
                                                                        width:
                                                                            500,
                                                                        child:
                                                                            Column(
                                                                          mainAxisSize:
                                                                              MainAxisSize.min,
                                                                          children: [
                                                                            Textfildwithupper(
                                                                                width: 250,
                                                                                controller: cuse,
                                                                                Uptext: "Cause".tr,
                                                                                hinttext: "Cause".tr)
                                                                          ],
                                                                        ),
                                                                      ),
                                                                      apptitle: "Enter The Reason For Absence".tr,
                                                                      subtitle: "The reason for the absence of the student".tr + "${controller.Employees[index]['name']}"));
                                                                } else {
                                                                  controller
                                                                      .updateStatus(
                                                                          index,
                                                                          value
                                                                              .toString(),
                                                                          null);
                                                                }
                                                              }
                                                            },
                                                          ),
                                                          Text(
                                                            status.tr,
                                                            style: TextStyle(
                                                              color: status ==
                                                                      'Present'
                                                                  ? const Color(
                                                                      0xff2F9742)
                                                                  : status ==
                                                                          'Truant'
                                                                      ? const Color(
                                                                          0xff972F2F)
                                                                      : status ==
                                                                              'Late'
                                                                          ? const Color(
                                                                              0xff349393)
                                                                          : status == 'Vacation'
                                                                              ? const Color(0xffB27671)
                                                                              : const Color(0xff134B70),
                                                            ),
                                                          ),
                                                        ],
                                                      )),
                                                ],
                                              ),
                                              Divider(
                                                color: Get.theme.primaryColor,
                                              ),
                                            ],
                                          );
                                        },
                                      )),
                                ),
                              ),
                            ),
                          ],
                        );
                      })
            : Column(
                children: [
                  Expanded(
                    child: Padding(
                      padding:
                          const EdgeInsets.only(top: 10, left: 40, right: 40),
                      child: ListView.builder(
                        itemCount: 10,
                        itemBuilder: (context, index) {
                          return SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Column(
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    SizedBox(
                                      width: 200,
                                      child: Row(
                                        children: [
                                          SchemaWidget(
                                            width: 50,
                                            height: 50,
                                            radius: 50,
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                left: 8.0, right: 8.0),
                                            child: SchemaWidget(
                                                width: 70, height: 15),
                                          ),
                                        ],
                                      ),
                                    ),
                                    ...[
                                      'Present',
                                      'Truant',
                                      'Late',
                                      'Vacation',
                                      'Holiday'
                                    ].map((status) => Row(
                                          children: [
                                            SchemaWidget(
                                              width: 15,
                                              height: 15,
                                              radius: 50,
                                            ),
                                            SchemaWidget(width: 50, height: 15),
                                          ],
                                        )),
                                  ],
                                ),
                                Divider(
                                  color: Theme.of(context).primaryColor,
                                ),
                              ],
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                ],
              );
      }),
    );
  }
}

CircleAvatar _buildEmployeeInitial(String name) {
  return CircleAvatar(
    maxRadius: 25,
    backgroundColor: const Color(0xffC4C4C4),
    child: Text(
      name.isNotEmpty ? name.substring(0, 1).toUpperCase() : '?',
      style: Get.textTheme.titleLarge!.copyWith(
        fontSize: 14,
        fontWeight: FontWeight.bold,
        color: Get.theme.primaryColor,
      ),
    ),
  );
}
