// ignore_for_file: must_be_immutable, file_names

import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:get/get.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:vms_school/Icons_File/v_m_s__icons_icons.dart';
import 'package:vms_school/Link/API/API.dart';
import 'package:vms_school/Link/API/AdminAPI/Employees_APIs/EmployeeAttendenceByIdAPI.dart';
import 'package:vms_school/Link/API/AdminAPI/Employees_APIs/GetEmployeeAttendenceAPI.dart';
import 'package:vms_school/Link/Controller/AdminController/Employee_Controllers/EmployeeAttendenceController.dart';
import 'package:vms_school/Link/Controller/AdminController/Employee_Controllers/oneEmployeeAttendenceController.dart';
import 'package:vms_school/Link/Model/AdminModel/EmployeeModels/oneEmployeeAttendenceModel.dart';
import 'package:vms_school/Translate/local_controller.dart';
import 'package:vms_school/main.dart';
import 'package:vms_school/widgets/ButtonsDialog.dart';
import 'package:vms_school/widgets/Schema_Widget.dart';

import '../../../widgets/GridAnimation.dart';
import '../../../widgets/VMSAlertDialog.dart';

class EmpolyeeStatusGrid extends StatefulWidget {
  const EmpolyeeStatusGrid({super.key});

  @override
  State<EmpolyeeStatusGrid> createState() => _EmpolyeeStatusGridState();
}

class _EmpolyeeStatusGridState extends State<EmpolyeeStatusGrid> {
  TextEditingController serch = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    int getCrossAxisCount() {
      if (screenWidth >= 1800) return 5;
      if (screenWidth >= 1400) return 4;
      if (screenWidth >= 1000) return 3;
      if (screenWidth >= 700) return 2;
      return 1;
    }

    double getChildAspectRatio() {
      if (screenWidth >= 1800) return 1.0;
      if (screenWidth >= 1400) return 1.45;
      if (screenWidth >= 1260) return 1.75;
      if (screenWidth >= 1000) return 1.30;
      if (screenWidth >= 930) return 1.85;
      if (screenWidth >= 850) return 1.65;
      if (screenWidth >= 750) return 1.45;
      if (screenWidth >= 700) return 1.35;
      if (screenWidth >= 584) return 2.45;
      if (screenWidth >= 584) return 1.95;
      if (screenWidth >= 492) return 1.90;
      if (screenWidth >= 417) return 1.65;

      return 1.25;
    }

    return Directionality(
      textDirection:
          Get.find<LocalizationController>().currentLocale.value.languageCode ==
                  'ar'
              ? TextDirection.rtl
              : TextDirection.ltr,
      child: GetBuilder<Employeeattendencecontroller>(builder: (controller) {
        return controller.isLoading == false
            ? controller.filteredreemployees.isNotEmpty
                ? GridView.builder(
                    padding:
                        const EdgeInsets.only(top: 10, left: 40, right: 40),
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: getCrossAxisCount(),
                        crossAxisSpacing: 20.0,
                        mainAxisSpacing: 20.0,
                        childAspectRatio: getChildAspectRatio()),
                    itemCount: controller.filteredreemployees.length,
                    itemBuilder: (context, index) {
                      return HoverScaleCard(
                        child: GestureDetector(
                          onTap: () async {
                            oneEmployeeAttendenceModel empModel =
                                await Employeeattendencebyidapi(context)
                                    .Employeeattendencebyid(controller
                                        .filteredreemployees[index].id!);

                            Get.dialog(
                                GetBuilder<Oneemployeeattendencecontroller>(
                              builder: (oneControl) {
                                return VMSAlertDialog(
                                  action: [const Text("")],
                                  contents: SizedBox(
                                    width: 600,
                                    height: Get.height,
                                    child: Column(
                                      children: [
                                        SizedBox(
                                          width: Get.width,
                                          child: SingleChildScrollView(
                                            child: DataTable(
                                              border: TableBorder.all(
                                                color: Theme.of(context)
                                                    .primaryColor,
                                                width: 1.0,
                                              ),
                                              columns: [
                                                DataColumn(
                                                  label: Text(
                                                    'Date'.tr,
                                                    style: Theme.of(context)
                                                        .textTheme
                                                        .bodyMedium,
                                                  ),
                                                ),
                                                DataColumn(
                                                  label: Text(
                                                    'Status'.tr,
                                                    style: Theme.of(context)
                                                        .textTheme
                                                        .bodyMedium,
                                                  ),
                                                ),
                                                DataColumn(
                                                  label: Text(
                                                    'Cause'.tr,
                                                    style: Theme.of(context)
                                                        .textTheme
                                                        .bodyMedium,
                                                  ),
                                                ),
                                              ],
                                              rows: [
                                                // هنا نقوم بملئ الصفوف ببيانات الطالب
                                                for (var emp in empModel
                                                        .employeeAttendance ??
                                                    [])
                                                  DataRow(
                                                    cells: [
                                                      DataCell(
                                                        Text(
                                                          emp.date ?? 'N/A',
                                                          style: Get
                                                              .theme
                                                              .textTheme
                                                              .bodyMedium,
                                                        ),
                                                      ),
                                                      //status
                                                      DataCell(
                                                        Text(
                                                          emp.status
                                                                  .toString()
                                                                  .tr ??
                                                              'N/A',
                                                          style: Get
                                                              .theme
                                                              .textTheme
                                                              .bodyMedium,
                                                        ),
                                                      ),
                                                      DataCell(
                                                        Text(
                                                          emp.cause ?? 'N/A',
                                                          style: Get
                                                              .theme
                                                              .textTheme
                                                              .bodyMedium,
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  apptitle: "att".tr +
                                      " ${controller.filteredreemployees[index].fullName} " +
                                      "Attendence".tr,
                                  subtitle: "none",
                                );
                              },
                            ));
                          },
                          child: Container(
                              padding: const EdgeInsets.all(20),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5),
                                  border: Border.all(
                                      color: Colors.grey, width: 0.5),
                                  color: Theme.of(context).cardColor,
                                  boxShadow: const [
                                    BoxShadow(
                                        color: Colors.black26,
                                        offset: Offset(0, 2),
                                        blurRadius: 1)
                                  ]),
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Expanded(
                                        child: Text(
                                            "${controller.filteredreemployees[index].fullName}",
                                            style: Theme.of(context)
                                                .textTheme
                                                .bodyMedium!
                                                .copyWith(
                                                    fontSize: 20,
                                                    fontWeight:
                                                        FontWeight.bold)),
                                      ),
                                      FutureBuilder(
                                        future: precacheImage(
                                            NetworkImage(
                                                "$getimage${controller.employee[index].imageId}"),
                                            context),
                                        builder: (context, snapshot) {
                                          if (snapshot.connectionState ==
                                              ConnectionState.done) {
                                            return CircleAvatar(
                                              maxRadius: 60,
                                              backgroundColor:
                                                  const Color(0xffC4C4C4),
                                              backgroundImage: controller
                                                          .employee[index]
                                                          .imageId !=
                                                      null
                                                  ? NetworkImage(
                                                      "$getimage${controller.employee[index].imageId}")
                                                  : null,
                                              child: controller.employee[index]
                                                          .imageId ==
                                                      null
                                                  ? Text(
                                                      controller.employee[index]
                                                          .fullName!
                                                          .substring(0, 1)
                                                          .toUpperCase(),
                                                      style: Get
                                                          .textTheme.titleLarge!
                                                          .copyWith(
                                                        fontSize: 26,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                      ),
                                                    )
                                                  : null,
                                            );
                                          } else {
                                            return CircleAvatar(
                                              maxRadius: 60,
                                              backgroundColor:
                                                  const Color(0xffC4C4C4),
                                              child: LoadingAnimationWidget
                                                  .inkDrop(
                                                color: Theme.of(context)
                                                    .primaryColor,
                                                size: 15,
                                              ),
                                            );
                                          }
                                        },
                                      ),
                                    ],
                                  ),
                                  Text(
                                      "${controller.filteredreemployees[index].status}"
                                          .tr,
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyMedium!
                                          .copyWith(
                                              fontSize: 16,
                                              color: controller
                                                          .filteredreemployees[
                                                              index]
                                                          .status ==
                                                      "Present"
                                                  ? const Color(0xff2F9742)
                                                  : controller
                                                              .filteredreemployees[
                                                                  index]
                                                              .status ==
                                                          "Truant"
                                                      ? const Color(0xff972F2F)
                                                      : controller
                                                                  .filteredreemployees[
                                                                      index]
                                                                  .status ==
                                                              "Vacation"
                                                          ? const Color(
                                                              0xffB27671)
                                                          : controller
                                                                      .filteredreemployees[
                                                                          index]
                                                                      .status ==
                                                                  "Late"
                                                              ? const Color(
                                                                  0xff349393)
                                                              : const Color(
                                                                  0xff134B70))),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                          "${controller.filteredreemployees[index].jobTitle}"
                                              .tr,
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodyMedium!),
                                      IconButton(
                                        style: ButtonStyle(
                                            maximumSize:
                                                WidgetStateProperty.all(
                                                    const Size(35, 35)),
                                            minimumSize:
                                                WidgetStateProperty.all(
                                                    const Size(35, 35)),
                                            iconSize:
                                                WidgetStateProperty.all(14),
                                            shape: WidgetStateProperty.all(
                                                RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(5),
                                            )),
                                            backgroundColor:
                                                WidgetStateProperty.all(
                                                    const Color(0xffB03D3D))),
                                        onPressed: () {
                                          Get.dialog(VMSAlertDialog(
                                              action: [
                                                ButtonDialog(
                                                  width: 100,
                                                  text: "Delete".tr,
                                                  onPressed: () async {
                                                    // await Delete_Student_API(
                                                    //         context)
                                                    //     .Delete_Student(
                                                    //         id: control
                                                    //             .filteredStudents[
                                                    //                 index]
                                                    //             .id
                                                    //             .toString());
                                                  },
                                                  color:
                                                      const Color(0xffB03D3D),
                                                ),
                                                const SizedBox(
                                                  width: 10,
                                                ),
                                                ButtonDialog(
                                                    width: 100,
                                                    text: "Cancel".tr,
                                                    onPressed: () {
                                                      Get.back();
                                                    },
                                                    color: Theme.of(context)
                                                        .primaryColor)
                                              ],
                                              contents: Container(
                                                width: 300,
                                                child: Text(
                                                    style: const TextStyle(
                                                        color: Colors.black),
                                                    maxLines: 3,
                                                    "Do You Want To DeleteeAtt"
                                                            .tr +
                                                        " ${controller.filteredreemployees![index].fullName}" +
                                                        "Attendenceatt".tr),
                                              ),
                                              apptitle: "Delete Attendence".tr,
                                              subtitle: "none"));
                                        },
                                        icon: const Icon(VMS_Icons.bin),
                                        color: Colors.white,
                                      ),
                                    ],
                                  ),
                                ],
                              )),
                        ),
                      );
                    },
                  )
                : Center(
                    child: Text("No Attendance".tr,
                        style: Theme.of(context).textTheme.titleLarge!.copyWith(
                            fontSize: 16, fontWeight: FontWeight.normal)))
            : GridView.builder(
                padding: const EdgeInsets.only(top: 10, left: 40, right: 40),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: getCrossAxisCount(),
                    crossAxisSpacing: 20.0,
                    mainAxisSpacing: 20.0,
                    childAspectRatio: getChildAspectRatio()),
                itemCount: 12,
                itemBuilder: (context, index) {
                  return HoverScaleCard(
                    child: Container(
                        padding: const EdgeInsets.all(20),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            border: Border.all(color: Colors.grey, width: 0.5),
                            color: Theme.of(context).cardColor,
                            boxShadow: const [
                              BoxShadow(
                                  color: Colors.black26,
                                  offset: Offset(0, 2),
                                  blurRadius: 1)
                            ]),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Expanded(
                                  child: SchemaWidget(width: 60, height: 10),
                                ),
                                SchemaWidget(
                                  width: 100,
                                  height: 100,
                                  radius: 100,
                                ),
                              ],
                            ),
                            SchemaWidget(width: 60, height: 10),
                            SchemaWidget(width: 60, height: 10),
                          ],
                        )),
                  );
                },
              ).animate(onPlay: (controller) => controller.repeat()).shimmer(
                angle: 1,
                color: Colors.grey.withOpacity(0.2),
                duration: const Duration(seconds: 1),
                delay: const Duration(seconds: 1));
      }),
    );
  }
}
