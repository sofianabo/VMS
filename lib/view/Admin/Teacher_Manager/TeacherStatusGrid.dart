// ignore_for_file: must_be_immutable, file_names

import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:get/get.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:vms_school/Link/API/API.dart';
import 'package:vms_school/Link/API/AdminAPI/Employees_APIs/EmployeeAttendenceByIdAPI.dart';
import 'package:vms_school/Link/Controller/AdminController/Employee_Controllers/oneEmployeeAttendenceController.dart';
import 'package:vms_school/Link/Controller/AdminController/Teacher_Controllers/AllTeacherAtendenceController.dart';
import 'package:vms_school/Link/Model/AdminModel/oneEmployeeAttendenceModel.dart';
import 'package:vms_school/Translate/local_controller.dart';
import 'package:vms_school/main.dart';
import 'package:vms_school/widgets/Schema_Widget.dart';

import '../../../widgets/GridAnimation.dart';
import '../../../widgets/VMSAlertDialog.dart';

class TeacherStatusGrid extends StatefulWidget {
  const TeacherStatusGrid({super.key});

  @override
  State<TeacherStatusGrid> createState() => _TeacherStatusGridState();
}

class _TeacherStatusGridState extends State<TeacherStatusGrid> {
  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: prefs!.getString(languageKey) == "ar"
          ? TextDirection.rtl
          : TextDirection.ltr,
      child: GetBuilder<Allteacheratendencecontroller>(builder: (controller) {
        return controller.isLoading == true
            ? GridView.builder(
                padding: const EdgeInsets.only(top: 10, left: 40, right: 40),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 4,
                    crossAxisSpacing: 20.0,
                    mainAxisSpacing: 20.0,
                    childAspectRatio: 1.5),
                itemCount: 8,
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
                                    child: SchemaWidget(width: 20, height: 15)),
                              ]),
                          SchemaWidget(width: 20, height: 15),
                        ],
                      ),
                    ),
                  );
                },
              ).animate(onPlay: (controller) => controller.repeat()).shimmer(
                angle: 1,
                color: Colors.grey.withOpacity(0.2),
                duration: const Duration(seconds: 1),
                delay: const Duration(seconds: 1))
            : controller.filteredTeacher!.isNotEmpty
                ? GridView.builder(
                    padding:
                        const EdgeInsets.only(top: 10, left: 40, right: 40),
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 4,
                            crossAxisSpacing: 20.0,
                            mainAxisSpacing: 20.0,
                            childAspectRatio: 1.4),
                    itemCount: controller
                        .filteredTeacher!.length, // عدد العناصر في الشبكة
                    itemBuilder: (context, index) {
                      return HoverScaleCard(
                        child: GestureDetector(
                          onTap: () async {
                            oneEmployeeAttendenceModel empModel =
                                await Employeeattendencebyidapi(context)
                                    .Employeeattendencebyid(
                                        controller.filteredTeacher![index].id!);
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
                                                    style: Get.theme.textTheme
                                                        .bodyMedium,
                                                  ),
                                                ),
                                                DataColumn(
                                                  label: Text(
                                                    'Status'.tr,
                                                    style: Get.theme.textTheme
                                                        .bodyMedium,
                                                  ),
                                                ),
                                                DataColumn(
                                                  label: Text(
                                                    'Cause'.tr,
                                                    style: Get.theme.textTheme
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
                                                          style:
                                                              Theme.of(context)
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
                                                          style:
                                                              Theme.of(context)
                                                                  .textTheme
                                                                  .bodyMedium,
                                                        ),
                                                      ),
                                                      DataCell(
                                                        Text(
                                                          emp.cause ?? 'N/A',
                                                          style:
                                                              Theme.of(context)
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
                                      " ${controller.filteredTeacher![index].fullName} " +
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
                                            "${controller.filteredTeacher![index].fullName}",
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
                                                "$getimage${controller.teacher[index].imageId}"),
                                            context),
                                        builder: (context, snapshot) {
                                          if (snapshot.connectionState ==
                                              ConnectionState.done) {
                                            return CircleAvatar(
                                              maxRadius: 60,
                                              backgroundColor:
                                                  const Color(0xffC4C4C4),
                                              backgroundImage: controller
                                                          .teacher[index]
                                                          .imageId !=
                                                      null
                                                  ? NetworkImage(
                                                      "$getimage${controller.teacher[index].imageId}")
                                                  : null,
                                              child: controller.teacher[index]
                                                          .imageId ==
                                                      null
                                                  ? Text(
                                                      controller.teacher[index]
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
                                      "${controller.filteredTeacher![index].status}"
                                          .tr,
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyMedium!
                                          .copyWith(
                                              fontSize: 16,
                                              color: controller
                                                          .filteredTeacher![
                                                              index]
                                                          .status ==
                                                      "Present"
                                                  ? const Color(0xff2F9742)
                                                  : controller
                                                              .filteredTeacher![
                                                                  index]
                                                              .status ==
                                                          "Truant"
                                                      ? const Color(0xff972F2F)
                                                      : controller
                                                                  .filteredTeacher![
                                                                      index]
                                                                  .status ==
                                                              "Vacation"
                                                          ? const Color(
                                                              0xffB27671)
                                                          : controller
                                                                      .filteredTeacher![
                                                                          index]
                                                                      .status ==
                                                                  "Late"
                                                              ? const Color(
                                                                  0xff349393)
                                                              : const Color(
                                                                  0xff134B70))),
                                  Text(
                                      "Email: ".tr +
                                          " ${controller.filteredTeacher![index].email}",
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyMedium!),
                                ],
                              )),
                        ),
                      );
                    },
                  )
                : Center(
                    child: Text("No Attendance".tr,
                        style: Theme.of(context).textTheme.titleLarge!.copyWith(
                            fontSize: 22, fontWeight: FontWeight.normal)));
        ;
      }),
    );
  }
}
