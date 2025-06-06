import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:get/get.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:vms_school/Icons_File/v_m_s__icons_icons.dart';
import 'package:vms_school/Link/API/API.dart';
import 'package:vms_school/Link/API/AdminAPI/Students/Students_APIs/DeleteStudentAttendenceAPI.dart';
import 'package:vms_school/Link/API/AdminAPI/Students/Students_APIs/StudentAttendenceByIdAPI.dart';
import 'package:vms_school/Link/Controller/AdminController/Students_Controllers/Student_Attendenc_Controller.dart';
import 'package:vms_school/Link/Controller/AdminController/Students_Controllers/oneStudentAttendenceController.dart';
import 'package:vms_school/Link/Model/AdminModel/Students_Models/OneStudentAttendenceModel.dart';
import 'package:vms_school/Translate/local_controller.dart';
import 'package:vms_school/view/Both_Platform/widgets/ButtonsDialog.dart';
import 'package:vms_school/view/Both_Platform/widgets/GridAnimation.dart';
import 'package:vms_school/view/Both_Platform/widgets/Schema_Widget.dart';
import 'package:vms_school/view/Both_Platform/widgets/VMSAlertDialog.dart';

class StudentStatusGrid extends StatefulWidget {
  const StudentStatusGrid({super.key});

  @override
  State<StudentStatusGrid> createState() => _StudentStatusGridState();
}

class _StudentStatusGridState extends State<StudentStatusGrid> {
  TextEditingController reason = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    int getCrossAxisCount() {
      if (screenWidth >= 1800) return 5;
      if (screenWidth >= 1400) return 4;
      if (screenWidth >= 1022) return 3;
      if (screenWidth >= 700) return 2;
      return 1;
    }

    double getChildAspectRatio() {
      if (screenWidth >= 1800) return 1.0;
      if (screenWidth >= 1498) return 1.45;
      if (screenWidth >= 1400) return 1.27;
      if (screenWidth >= 1376) return 1.60;
      if (screenWidth >= 1295) return 1.40;
      if (screenWidth >= 1245) return 1.30;
      if (screenWidth >= 1150) return 1.35;
      if (screenWidth >= 1108) return 1.30;
      if (screenWidth >= 1022) return 1.15;
      if (screenWidth >= 930) return 1.65;
      if (screenWidth >= 850) return 1.45;
      if (screenWidth >= 750) return 1.25;
      if (screenWidth >= 700) return 1.15;
      if (screenWidth >= 584) return 2.25;
      if (screenWidth >= 584) return 1.75;
      if (screenWidth >= 492) return 1.70;
      if (screenWidth >= 430) return 1.45;

      return 1.05;
    }

    return Directionality(
      textDirection:
          Get.find<LocalizationController>().currentLocale.value.languageCode ==
                  'ar'
              ? TextDirection.rtl
              : TextDirection.ltr,
      child: GetBuilder<StudentAttendencController>(
        builder: (control) {
          return control.isLoading == true
              ? GridView.builder(
                  padding: const EdgeInsets.only(top: 10, left: 40, right: 40),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: getCrossAxisCount(),
                      crossAxisSpacing: 20.0,
                      mainAxisSpacing: 20.0,
                      childAspectRatio: getChildAspectRatio()),
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
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Expanded(
                                      child:
                                          SchemaWidget(width: 20, height: 15)),
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
              : control.filteredStudents.isNotEmpty
                  ? GridView.builder(
                      padding:
                          const EdgeInsets.only(top: 10, left: 40, right: 40),
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: getCrossAxisCount(),
                          crossAxisSpacing: 20.0,
                          mainAxisSpacing: 20.0,
                          childAspectRatio: getChildAspectRatio()),
                      itemCount: control.filteredStudents.length,
                      itemBuilder: (context, index) {
                        return HoverScaleCard(
                          child: GestureDetector(
                            onTap: () async {
                              OneStudentAttendenceModel attendanceModel =
                                  await Studentattendencebyidapi(context)
                                      .Studentattendencebyid(control
                                          .filteredStudents[index].studentId!);
                              Get.dialog(
                                  GetBuilder<Onestudentattendencecontroller>(
                                builder: (oneControl) {
                                  return VMSAlertDialog(
                                    action: [],
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
                                                  for (var studentAttendance
                                                      in attendanceModel
                                                              .studentAt ??
                                                          [])
                                                    DataRow(
                                                      cells: [
                                                        DataCell(
                                                          Text(
                                                            studentAttendance
                                                                    .date ??
                                                                'N/A',
                                                            style: Theme.of(
                                                                    context)
                                                                .textTheme
                                                                .bodyMedium,
                                                          ),
                                                        ),
                                                        //status
                                                        DataCell(
                                                          Text(
                                                            studentAttendance
                                                                    .status
                                                                    .toString()
                                                                    .tr ??
                                                                'N/A',
                                                            style: Theme.of(
                                                                    context)
                                                                .textTheme
                                                                .bodyMedium,
                                                          ),
                                                        ),
                                                        DataCell(
                                                          Text(
                                                            studentAttendance
                                                                    .cause ??
                                                                'N/A',
                                                            style: Theme.of(
                                                                    context)
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
                                        " ${control.filteredStudents[index].fullName}" +
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
                                                "${control.filteredStudents[index].fullName}",
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .bodyMedium!
                                                    .copyWith(
                                                        fontSize: 20,
                                                        fontWeight:
                                                            FontWeight.bold))),
                                        control.filteredStudents[index]
                                                    .fileId !=
                                                null
                                            ? CachedNetworkImage(
                                                imageUrl:
                                                    "$getimage${control.filteredStudents[index].fileId}",
                                                imageBuilder:
                                                    (context, imageProvider) =>
                                                        CircleAvatar(
                                                  maxRadius: 55,
                                                  backgroundColor:
                                                      const Color(0xffC4C4C4),
                                                  backgroundImage:
                                                      imageProvider,
                                                ),
                                                placeholder: (context, url) =>
                                                    CircleAvatar(
                                                  maxRadius: 55,
                                                  backgroundColor:
                                                      const Color(0xffC4C4C4),
                                                  child: LoadingAnimationWidget
                                                      .inkDrop(
                                                    color: Theme.of(context)
                                                        .primaryColor,
                                                    size: 30,
                                                  ),
                                                ),
                                                errorWidget:
                                                    (context, url, error) =>
                                                        CircleAvatar(
                                                  maxRadius: 55,
                                                  backgroundColor:
                                                      const Color(0xffC4C4C4),
                                                  child: Text(
                                                    control
                                                        .filteredStudents[index]
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
                                                  ),
                                                ),
                                              )
                                            : CircleAvatar(
                                                maxRadius: 55,
                                                backgroundColor:
                                                    const Color(0xffC4C4C4),
                                                child: Text(
                                                  control
                                                      .filteredStudents[index]
                                                      .fullName!
                                                      .substring(0, 1)
                                                      .toUpperCase(),
                                                  style: Get
                                                      .textTheme.titleLarge!
                                                      .copyWith(
                                                    fontSize: 26,
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                ),
                                              )
                                      ]),
                                  Text(
                                      "${control.filteredStudents[index].status}"
                                          .tr,
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyMedium!
                                          .copyWith(
                                              fontSize: 16,
                                              color: control
                                                          .filteredStudents[
                                                              index]
                                                          .status ==
                                                      "Present"
                                                  ? const Color(0xff2F9742)
                                                  : control
                                                              .filteredStudents[
                                                                  index]
                                                              .status ==
                                                          "Truant"
                                                      ? const Color(0xff972F2F)
                                                      : control
                                                                  .filteredStudents[
                                                                      index]
                                                                  .status ==
                                                              "Vacation"
                                                          ? const Color(
                                                              0xffB27671)
                                                          : control
                                                                      .filteredStudents[
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
                                      Expanded(
                                        child: Text(
                                            "Grade Level:".tr +
                                                "${Get.find<LocalizationController>().currentLocale.value.languageCode == 'ar' ? control.filteredStudents[index].grade!.name : control.filteredStudents[index].grade!.enName}",
                                            style: Theme.of(context)
                                                .textTheme
                                                .bodyMedium!
                                                .copyWith(
                                                  fontSize: 14,
                                                )),
                                      ),
                                      control.CheckAttendence() == true
                                          ? IconButton(
                                              style: ButtonStyle(
                                                  maximumSize:
                                                      WidgetStateProperty.all(
                                                          const Size(35, 35)),
                                                  minimumSize:
                                                      WidgetStateProperty.all(
                                                          const Size(35, 35)),
                                                  iconSize:
                                                      WidgetStateProperty.all(
                                                          14),
                                                  shape: WidgetStateProperty.all(
                                                      RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            5),
                                                  )),
                                                  backgroundColor:
                                                      WidgetStateProperty.all(
                                                          const Color(
                                                              0xffB03D3D))),
                                              onPressed: () {
                                                Get.dialog(VMSAlertDialog(
                                                    action: [
                                                      ButtonDialog(
                                                        width: 100,
                                                        text: "Delete".tr,
                                                        onPressed: () async {
                                                          await Deletestudentattendenceapi
                                                              .Deletestudentattendence(
                                                                  ID: control
                                                                      .filteredStudents[
                                                                          index]
                                                                      .id
                                                                      .toString(),
                                                                  date: control
                                                                      .AttendencetDate
                                                                      .value
                                                                      .toString());
                                                        },
                                                        color: const Color(
                                                            0xffB03D3D),
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
                                                          color:
                                                              Theme.of(context)
                                                                  .primaryColor)
                                                    ],
                                                    contents: Container(
                                                      width: 300,
                                                      child: Text(
                                                          style: TextStyle(
                                                              color:
                                                                  Colors.black),
                                                          maxLines: 3,
                                                          "Do You Want To DeleteeAtt"
                                                                  .tr +
                                                              " ${control.filteredStudents[index].fullName}" +
                                                              "Attendenceatt"
                                                                  .tr),
                                                    ),
                                                    apptitle:
                                                        "Delete Attendence".tr,
                                                    subtitle: "none"));
                                              },
                                              icon: const Icon(VMS_Icons.bin),
                                              color: Colors.white,
                                            )
                                          : Text("")
                                    ],
                                  )
                                ],
                              ),
                            ),
                          ),
                        );
                      },
                    )
                  : Center(
                      child: Text("No Attendance".tr,
                          style: Theme.of(context)
                              .textTheme
                              .titleLarge!
                              .copyWith(
                                  fontSize: 22,
                                  fontWeight: FontWeight.normal)));
        },
      ),
    );
  }
}
