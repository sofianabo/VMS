// ignore_for_file: must_be_immutable, file_names

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vms_school/Link/API/AdminAPI/StudentAttendenceByIdAPI.dart';
import 'package:vms_school/Link/Controller/AdminController/Student_Attendenc_Controller.dart';
import 'package:vms_school/Link/Controller/AdminController/oneStudentAttendenceController.dart';
import 'package:vms_school/Link/Model/AdminModel/OneStudentAttendenceModel.dart';
import 'package:vms_school/widgets/VMSAlertDialog.dart';
import '../../widgets/GridAnimation.dart';

class StudentStatusGrid extends StatefulWidget {
  StudentStatusGrid({super.key});

  @override
  State<StudentStatusGrid> createState() => _StudentStatusGridState();
}

class _StudentStatusGridState extends State<StudentStatusGrid> {
  TextEditingController reason = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return GetBuilder<StudentAttendencController>(
      builder: (control) {
        return GridView.builder(
          padding: const EdgeInsets.only(top: 10, left: 40, right: 40),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 4,
              crossAxisSpacing: 20.0,
              mainAxisSpacing: 20.0,
              childAspectRatio: 1.5),
          itemCount: control.stud.length, // عدد العناصر في الشبكة
          itemBuilder: (context, index) {
            return HoverScaleCard(
              child: GestureDetector(
                onTap: () async {
                  OneStudentAttendenceModel attendanceModel =
                      await Studentattendencebyidapi(context)
                          .Studentattendencebyid(
                              control.stud[index].studentId!);

                  // قم بفتح الحوار مع البيانات المستردة
                  Get.dialog(GetBuilder<Onestudentattendencecontroller>(
                    builder: (oneControl) {
                      return VMSAlertDialog(
                        action: [Text("")],
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
                                      color: Get.theme.primaryColor,
                                      width: 1.0,
                                    ),
                                    columns: [
                                      DataColumn(
                                        label: Text(
                                          'Date',
                                          style: Get.theme.primaryTextTheme
                                              .bodyMedium,
                                        ),
                                      ),
                                      DataColumn(
                                        label: Text(
                                          'Cause',
                                          style: Get.theme.primaryTextTheme
                                              .bodyMedium,
                                        ),
                                      ),
                                    ],
                                    rows: [
                                      // هنا نقوم بملئ الصفوف ببيانات الطالب
                                      for (var studentAttendance
                                          in attendanceModel.studentAt ?? [])
                                        DataRow(
                                          cells: [
                                            DataCell(
                                              Text(
                                                studentAttendance.date ?? 'N/A',
                                                style: Get.theme
                                                    .primaryTextTheme.bodySmall,
                                              ),
                                            ),
                                            DataCell(
                                              Text(
                                                studentAttendance.cause ??
                                                    'N/A',
                                                style: Get.theme
                                                    .primaryTextTheme.bodySmall,
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
                        apptitle: "Student Laith Haitham Azzam",
                        subtitle: "none",
                      );
                    },
                  ));
                },
                child: Container(
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      border: Border.all(color: Colors.grey, width: 0.5),
                      color: Colors.white,
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
                            child: Text(
                              "${control.stud[index].fullName}",
                              style: Get.theme.primaryTextTheme.bodyMedium!
                                  .copyWith(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold),
                            ),
                          ),
                          Image.asset("../../images/Rectangle66.png",
                              height: 100, width: 100)
                        ],
                      ),
                      Text(
                        "${control.stud[index].status}",
                        style: Get.theme.primaryTextTheme.bodySmall!.copyWith(
                            fontSize: 16,
                            color: control.stud[index].status == "Present"
                                ? Color(0xff2F9742)
                                : control.stud[index].status == "Truant"
                                    ? Color(0xff972F2F)
                                    : control.stud[index].status == "Late"
                                        ? Color(0xff349393)
                                        : Color(0xff134B70)),
                      ),
                      Text("Grade Level: ${control.stud[index].date}",
                          style: Get.theme.primaryTextTheme.bodySmall),
                    ],
                  ),
                ),
              ),
            );
          },
        );
      },
    );
  }
}
