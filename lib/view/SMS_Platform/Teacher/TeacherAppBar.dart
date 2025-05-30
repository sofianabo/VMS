import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:vms_school/Link/API/AdminAPI/Get_My_Profile.dart';
import 'package:vms_school/Link/API/Teacher_API/GetMyAttendenceAPI.dart';
import 'package:vms_school/Link/API/Teacher_API/GetMyQuizAPI.dart';
import 'package:vms_school/Link/API/Teacher_API/StudyShareTeacherAPI.dart';
import 'package:vms_school/Link/Controller/AdminController/Employee_Controllers/oneEmployeeAttendenceController.dart';
import 'package:vms_school/Link/Controller/Teacher_Controller/My_Students_Controller.dart';
import 'package:vms_school/Link/Controller/Teacher_Controller/QuizTableTeacherController.dart';
import 'package:vms_school/Link/Model/AdminModel/EmployeeModels/oneEmployeeAttendenceModel.dart';
import 'package:vms_school/Translate/local_controller.dart';
import 'package:vms_school/main.dart';
import 'package:vms_school/view/Both_Platform/widgets/Responsive.dart';
import 'package:vms_school/view/SMS_Platform/Teacher/Functions/StudyshareTeacher.dart';
import 'package:vms_school/view/SMS_Platform/Teacher/Teacher_Home/TeacherProfile.dart';
import 'package:vms_school/view/Both_Platform/widgets/VMSAlertDialog.dart';

class Teacherappbar extends StatefulWidget {
  Teacherappbar({super.key});

  @override
  State<Teacherappbar> createState() => _TeacherappbarState();
}

class _TeacherappbarState extends State<Teacherappbar> {
  TextEditingController serch = TextEditingController();

  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size.width;
    return GetBuilder<My_Students_Controller>(builder: (controller) {
      return Directionality(
          textDirection: TextDirection.rtl,
          child: ResponsiveUI(
            desktopScreen: Container(
              margin: const EdgeInsets.only(
                  right: 60, left: 30, top: 15, bottom: 15.0),
              height: 77,
              child: Row(
                children: [
                  Row(
                    spacing: 10,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      GestureDetector(
                        onTap: () {
                          Get_My_Profile.Get_My_Profile_Data();
                          Get.dialog(Teacherprofile(),
                              barrierDismissible: false);
                        },
                        child: Container(
                          height: 40,
                          width: 200,
                          decoration: BoxDecoration(
                            color: Theme.of(context).cardColor,
                            border: Border.all(color: Color(0xffDAD0D0)),
                            borderRadius: BorderRadius.circular(5),
                          ),
                          child: Row(
                            children: [
                              Expanded(
                                child: Padding(
                                  padding: const EdgeInsets.only(left: 5.0),
                                  child: Text(
                                    textDirection: TextDirection.ltr,
                                    textAlign: TextAlign.center,
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                    "${prefs!.getString("fullname")}",
                                    style: Get.theme.textTheme.bodyMedium!
                                        .copyWith(fontSize: 12),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Builder(builder: (context) {
                        return IconButton(
                          style: ButtonStyle(
                            maximumSize:
                                WidgetStateProperty.all(const Size(35, 35)),
                            minimumSize:
                                WidgetStateProperty.all(const Size(35, 35)),
                            iconSize: WidgetStateProperty.all(14),
                            shape: WidgetStateProperty.all(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(5),
                              ),
                            ),
                            backgroundColor: WidgetStateProperty.all(
                              Theme.of(context).primaryColor,
                            ),
                          ),
                          icon: Icon(
                            Icons.table_view_outlined,
                            color: Colors.white,
                          ),
                          color: Colors.white,
                          onPressed: () async {
                            final RenderBox button =
                                context.findRenderObject() as RenderBox;
                            final RenderBox overlay = Overlay.of(context)
                                .context
                                .findRenderObject() as RenderBox;
                            final Offset position = button
                                .localToGlobal(Offset.zero, ancestor: overlay);

                            final selected = await showMenu<String>(
                              context: context,
                              position: RelativeRect.fromLTRB(
                                position.dx,
                                position.dy + button.size.height,
                                overlay.size.width - position.dx,
                                0,
                              ),
                              color: Get.theme.cardColor,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(5)),
                              items: [
                                PopupMenuItem<String>(
                                  value: 'ExamTable',
                                  child: Text('Exam Table'.tr,
                                      style: Get.theme.textTheme.bodyMedium),
                                ),
                                PopupMenuItem<String>(
                                  value: 'StudyShareTable',
                                  child: Text('StudyShare Table'.tr,
                                      style: Get.theme.textTheme.bodyMedium),
                                ),
                                PopupMenuItem<String>(
                                  value: 'Attendence',
                                  child: Text('Attendences'.tr,
                                      style: Get.theme.textTheme.bodyMedium),
                                ),
                              ],
                            );

                            if (selected == 'StudyShareTable') {
                              modTeacher = await Studyshareteacherapi(context)
                                  .Studyshareteacher();
                              if (modTeacher != null)
                                Get.dialog(VMSAlertDialog(
                                    action: [],
                                    contents: Studyshareteacher(),
                                    apptitle: "StudyShare table".tr,
                                    subtitle: ""));
                            } else if (selected == 'ExamTable') {
                              Get.find<Quiztableteachercontroller>()
                                  .initialData();
                              Getmyquizapi(context).Getmyquiz();
                            } else if (selected == 'Attendence') {
                              oneEmployeeAttendenceModel attendanceModel =
                                  await Getmyattendenceapi(context)
                                      .Getmyattendence();
                              Get.dialog(
                                  GetBuilder<Oneemployeeattendencecontroller>(
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
                                                              .employeeAttendance ??
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
                                    apptitle: "Attendences".tr,
                                    subtitle: "none",
                                  );
                                },
                              ));
                            }
                          },
                        );
                      }),
                    ],
                  ),
                  Expanded(
                    child: Center(
                      child: Text(
                        "Main Page".tr,
                        style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            color: Theme.of(context)
                                .textTheme
                                .titleMedium!
                                .color!),
                      ),
                    ),
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      SvgPicture.asset(
                        Theme.of(context).brightness == Brightness.dark
                            ? "assets/images/logodark.svg"
                            : "assets/images/logolight.svg",
                        width: 250,
                      )
                    ],
                  )
                ],
              ),
            ),
            tabletScreen: Container(
              margin: const EdgeInsets.only(
                  right: 60, left: 30, top: 20, bottom: 5.0),
              height: 77,
              child: Row(
                children: [
                  Row(
                    spacing: 10,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      GestureDetector(
                        onTap: () {
                          Get_My_Profile.Get_My_Profile_Data();
                          Get.dialog(Teacherprofile(),
                              barrierDismissible: false);
                        },
                        child: Container(
                          height: 40,
                          width: 200,
                          decoration: BoxDecoration(
                            color: Theme.of(context).cardColor,
                            border: Border.all(color: Color(0xffDAD0D0)),
                            borderRadius: BorderRadius.circular(5),
                          ),
                          child: Row(
                            spacing: 10,
                            children: [
                              Expanded(
                                child: Padding(
                                  padding: const EdgeInsets.only(left: 5.0),
                                  child: Text(
                                    textDirection: TextDirection.ltr,
                                    textAlign: TextAlign.center,
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                    "${prefs!.getString("fullname")}",
                                    style: Get.theme.textTheme.bodyMedium!
                                        .copyWith(fontSize: 12),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Builder(builder: (context) {
                        return IconButton(
                          style: ButtonStyle(
                            maximumSize:
                                WidgetStateProperty.all(const Size(35, 35)),
                            minimumSize:
                                WidgetStateProperty.all(const Size(35, 35)),
                            iconSize: WidgetStateProperty.all(14),
                            shape: WidgetStateProperty.all(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(5),
                              ),
                            ),
                            backgroundColor: WidgetStateProperty.all(
                              Theme.of(context).primaryColor,
                            ),
                          ),
                          icon: Icon(
                            Icons.table_view_outlined,
                            color: Colors.white,
                          ),
                          color: Colors.white,
                          onPressed: () async {
                            final RenderBox button =
                                context.findRenderObject() as RenderBox;
                            final RenderBox overlay = Overlay.of(context)
                                .context
                                .findRenderObject() as RenderBox;
                            final Offset position = button
                                .localToGlobal(Offset.zero, ancestor: overlay);

                            final selected = await showMenu<String>(
                              context: context,
                              position: RelativeRect.fromLTRB(
                                position.dx,
                                position.dy + button.size.height,
                                overlay.size.width - position.dx,
                                0,
                              ),
                              color: Get.theme.cardColor,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(5)),
                              items: [
                                PopupMenuItem<String>(
                                  value: 'ExamTable',
                                  child: Text('Exam Table'.tr,
                                      style: Get.theme.textTheme.bodyMedium),
                                ),
                                PopupMenuItem<String>(
                                  value: 'StudyShareTable',
                                  child: Text('StudyShare Table'.tr,
                                      style: Get.theme.textTheme.bodyMedium),
                                ),
                                PopupMenuItem<String>(
                                  value: 'Attendence',
                                  child: Text('Attendences'.tr,
                                      style: Get.theme.textTheme.bodyMedium),
                                ),
                              ],
                            );

                            if (selected == 'StudyShareTable') {
                              modTeacher = await Studyshareteacherapi(context)
                                  .Studyshareteacher();
                              if (modTeacher != null)
                                Get.dialog(VMSAlertDialog(
                                    action: [],
                                    contents: Studyshareteacher(),
                                    apptitle: "StudyShare table".tr,
                                    subtitle: ""));
                            } else if (selected == 'ExamTable') {
                              Get.find<Quiztableteachercontroller>()
                                  .initialData();
                              Getmyquizapi(context).Getmyquiz();
                            } else if (selected == 'Attendence') {
                              oneEmployeeAttendenceModel attendanceModel =
                                  await Getmyattendenceapi(context)
                                      .Getmyattendence();
                              Get.dialog(
                                  GetBuilder<Oneemployeeattendencecontroller>(
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
                                                              .employeeAttendance ??
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
                                    apptitle: "Attendences".tr,
                                    subtitle: "none",
                                  );
                                },
                              ));
                            }
                          },
                        );
                      })
                    ],
                  ),
                  Expanded(
                    child: Center(
                      child: Text(
                        "Main Page".tr,
                        style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            color: Theme.of(context)
                                .textTheme
                                .titleMedium!
                                .color!),
                      ),
                    ),
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      SvgPicture.asset(
                        Theme.of(context).brightness == Brightness.dark
                            ? "assets/images/logodark.svg"
                            : "assets/images/logolight.svg",
                        width: 250,
                      )
                    ],
                  )
                ],
              ),
            ),
            mobileScreen: Directionality(
              textDirection: Get.find<LocalizationController>()
                          .currentLocale
                          .value
                          .languageCode ==
                      'ar'
                  ? TextDirection.rtl
                  : TextDirection.ltr,
              child: Container(
                width: screenSize,
                margin: const EdgeInsets.only(right: 30, left: 30, top: 29),
                height: 150,
                child: Column(
                  spacing: 20,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SvgPicture.asset(
                          Theme.of(context).brightness == Brightness.dark
                              ? "assets/images/logodark.svg"
                              : "assets/images/logolight.svg",
                          width: 150,
                        ),
                        GestureDetector(
                          onTap: () {
                            Get_My_Profile.Get_My_Profile_Data();
                            Get.dialog(Teacherprofile(),
                                barrierDismissible: false);
                          },
                          child: Container(
                            height: 40,
                            width: 120,
                            decoration: BoxDecoration(
                              color: Theme.of(context).cardColor,
                              border: Border.all(color: Color(0xffDAD0D0)),
                              borderRadius: BorderRadius.circular(5),
                            ),
                            child: Row(
                              spacing: 10,
                              children: [
                                Expanded(
                                  child: Padding(
                                    padding: const EdgeInsets.only(left: 5.0),
                                    child: Text(
                                      textDirection: TextDirection.ltr,
                                      textAlign: TextAlign.center,
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                      "${prefs!.getString("fullname")}",
                                      style: Get.theme.textTheme.bodyMedium!
                                          .copyWith(fontSize: 12),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          maxLines: 2,
                          textAlign: TextAlign.center,
                          "Main Page".tr,
                          style: TextStyle(
                              fontSize: 30,
                              fontWeight: FontWeight.bold,
                              color: Theme.of(context)
                                  .textTheme
                                  .titleMedium!
                                  .color!),
                        ),
                        Builder(builder: (context) {
                          return IconButton(
                            style: ButtonStyle(
                              maximumSize:
                                  WidgetStateProperty.all(const Size(35, 35)),
                              minimumSize:
                                  WidgetStateProperty.all(const Size(35, 35)),
                              iconSize: WidgetStateProperty.all(14),
                              shape: WidgetStateProperty.all(
                                RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(5),
                                ),
                              ),
                              backgroundColor: WidgetStateProperty.all(
                                Theme.of(context).primaryColor,
                              ),
                            ),
                            icon: Icon(
                              Icons.table_view_outlined,
                              color: Colors.white,
                            ),
                            color: Colors.white,
                            onPressed: () async {
                              final RenderBox button =
                                  context.findRenderObject() as RenderBox;
                              final RenderBox overlay = Overlay.of(context)
                                  .context
                                  .findRenderObject() as RenderBox;
                              final Offset position = button.localToGlobal(
                                  Offset.zero,
                                  ancestor: overlay);

                              final selected = await showMenu<String>(
                                context: context,
                                position: RelativeRect.fromLTRB(
                                  position.dx,
                                  position.dy + button.size.height,
                                  overlay.size.width - position.dx,
                                  0,
                                ),
                                color: Get.theme.cardColor,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(5)),
                                items: [
                                  PopupMenuItem<String>(
                                    value: 'ExamTable',
                                    child: Text('Exam Table'.tr,
                                        style: Get.theme.textTheme.bodyMedium),
                                  ),
                                  PopupMenuItem<String>(
                                    value: 'StudyShareTable',
                                    child: Text('StudyShare Table'.tr,
                                        style: Get.theme.textTheme.bodyMedium),
                                  ),
                                  PopupMenuItem<String>(
                                    value: 'Attendence',
                                    child: Text('Attendences'.tr,
                                        style: Get.theme.textTheme.bodyMedium),
                                  ),
                                ],
                              );

                              if (selected == 'StudyShareTable') {
                                modTeacher = await Studyshareteacherapi(context)
                                    .Studyshareteacher();
                                if (modTeacher != null)
                                  Get.dialog(VMSAlertDialog(
                                      action: [],
                                      contents: Studyshareteacher(),
                                      apptitle: "StudyShare table".tr,
                                      subtitle: ""));
                              } else if (selected == 'ExamTable') {
                                Get.find<Quiztableteachercontroller>()
                                    .initialData();
                                Getmyquizapi(context).Getmyquiz();
                              } else if (selected == 'Attendence') {
                                oneEmployeeAttendenceModel attendanceModel =
                                    await Getmyattendenceapi(context)
                                        .Getmyattendence();
                                Get.dialog(
                                    GetBuilder<Oneemployeeattendencecontroller>(
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
                                                        style: Get
                                                            .theme
                                                            .textTheme
                                                            .bodyMedium,
                                                      ),
                                                    ),
                                                    DataColumn(
                                                      label: Text(
                                                        'Status'.tr,
                                                        style: Get
                                                            .theme
                                                            .textTheme
                                                            .bodyMedium,
                                                      ),
                                                    ),
                                                    DataColumn(
                                                      label: Text(
                                                        'Cause'.tr,
                                                        style: Get
                                                            .theme
                                                            .textTheme
                                                            .bodyMedium,
                                                      ),
                                                    ),
                                                  ],
                                                  rows: [
                                                    for (var studentAttendance
                                                        in attendanceModel
                                                                .employeeAttendance ??
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
                                      apptitle: "Attendences".tr,
                                      subtitle: "none",
                                    );
                                  },
                                ));
                              }
                            },
                          );
                        })
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ));
    });
  }
}
