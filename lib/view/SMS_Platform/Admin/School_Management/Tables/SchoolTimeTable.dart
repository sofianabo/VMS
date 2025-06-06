import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:vms_school/Icons_File/v_m_s__icons_icons.dart';
import 'package:vms_school/Link/API/AdminAPI/School/School_DropDown/DropdownClassesAPI.dart';
import 'package:vms_school/Link/API/AdminAPI/School/School_Tables/AddLessonAPI.dart';
import 'package:vms_school/Link/API/AdminAPI/School/School_Tables/DeleteStudyShareAPI.dart';
import 'package:vms_school/Link/API/AdminAPI/School/School_Tables/EditStudyShareAPI.dart';
import 'package:vms_school/Link/API/AdminAPI/Teacher_APIS/GetAllTeachersAPI.dart';
import 'package:vms_school/Link/Controller/AdminController/Employee_Controllers/Add_Data_controller.dart';
import 'package:vms_school/Link/Controller/AdminController/School_Controllers/Admin_School_Time.dart';
import 'package:vms_school/Link/Functions/Export_Exle_Function.dart';
import 'package:vms_school/Link/Functions/Export_PDF_Function.dart';
import 'package:vms_school/Link/Model/AdminModel/School_Models/SchoolTimeModel.dart';
import 'package:vms_school/Translate/local_controller.dart';
import 'package:vms_school/view/Both_Platform/widgets/Admin/Admin_Table/DropDownSchoolTime.dart';
import 'package:vms_school/view/Both_Platform/widgets/ButtonsDialog.dart';
import 'package:vms_school/view/Both_Platform/widgets/VMSAlertDialog.dart';

class SchoolTimeTable extends StatefulWidget {
  const SchoolTimeTable({super.key});

  @override
  State<SchoolTimeTable> createState() => _SchoolTimeTableState();
}

Map<String, int> days = {
  "Sunday": 0,
  "Monday": 1,
  "Tuesday": 2,
  "Wednesday": 3,
  "Thursday": 4
};
Map<int, String> lessions = {
  1: 'First\n Lesson',
  2: 'second\n Lesson',
  3: 'Third\n Lesson',
  4: 'Forth\n Lesson',
  5: 'Fifth\n Lesson',
  6: 'Sixth\n Lesson',
  7: 'Seventh\n Lesson',
};
List<Map<String, String>> tableData = [
  {
    'Day': 'Sunday',
    'First\n Lesson': 'No Lesson',
    'second\n Lesson': 'No Lesson ',
    'Third\n Lesson': 'No Lesson  ',
    'Forth\n Lesson': 'No Lesson   ',
    'Fifth\n Lesson': 'No Lesson    ',
    'Sixth\n Lesson': 'No Lesson     ',
    'Seventh\n Lesson': 'No Lesson    ',
  },
  {
    'Day': 'Monday',
    'First\n Lesson': 'No Lesson',
    'second\n Lesson': 'No Lesson ',
    'Third\n Lesson': 'No Lesson  ',
    'Forth\n Lesson': 'No Lesson   ',
    'Fifth\n Lesson': 'No Lesson    ',
    'Sixth\n Lesson': 'No Lesson     ',
    'Seventh\n Lesson': 'No Lesson    ',
  },
  {
    'Day': 'Tuesday',
    'First\n Lesson': 'No Lesson',
    'second\n Lesson': 'No Lesson ',
    'Third\n Lesson': 'No Lesson  ',
    'Forth\n Lesson': 'No Lesson   ',
    'Fifth\n Lesson': 'No Lesson    ',
    'Sixth\n Lesson': 'No Lesson     ',
    'Seventh\n Lesson': 'No Lesson    ',
  },
  {
    'Day': 'Wednesday',
    'First\n Lesson': 'No Lesson',
    'second\n Lesson': 'No Lesson ',
    'Third\n Lesson': 'No Lesson  ',
    'Forth\n Lesson': 'No Lesson   ',
    'Fifth\n Lesson': 'No Lesson    ',
    'Sixth\n Lesson': 'No Lesson     ',
    'Seventh\n Lesson': 'No Lesson    ',
  },
  {
    'Day': 'Thursday',
    'First\n Lesson': 'No Lesson',
    'second\n Lesson': 'No Lesson ',
    'Third\n Lesson': 'No Lesson  ',
    'Forth\n Lesson': 'No Lesson   ',
    'Fifth\n Lesson': 'No Lesson    ',
    'Sixth\n Lesson': 'No Lesson     ',
    'Seventh\n Lesson': 'No Lesson    ',
  },
];

class Pair<F, S> {
  late final F first;
  late final S second;
  Pair(this.first, this.second);
  F getKey() {
    return first;
  }

  S getVal() {
    return second;
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! Pair<F, S>) return false;
    return first == other.first && other.second == second;
  }

  @override
  String toString() {
    return 'pair($first,$second)';
  }

  @override
  int get hashCode => first.hashCode ^ second.hashCode;
}

Map<Pair<int, int>, int> indexes = {};

SchoolTimeModel? m;

class _SchoolTimeTableState extends State<SchoolTimeTable> {
  @override
  void initState() {
    Getallclassapi.getAllClasses();
    Getallteachersapi.Getallteachers();
    Get.find<AdminSchoolTimeController>().setClassIndex();
    Get.find<AdminSchoolTimeController>().setTimeLessonIndex();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Container(
          width: Get.width,
          margin: const EdgeInsets.only(left: 30.0, right: 15.0, top: 15.0),
          child: GetBuilder<AdminSchoolTimeController>(builder: (controller) {
            return Wrap(
              alignment: WrapAlignment.spaceBetween,
              crossAxisAlignment: WrapCrossAlignment.center,
              runAlignment: WrapAlignment.spaceBetween,
              spacing: 8.0,
              runSpacing: 8.0,
              children: [
                Wrap(
                  spacing: 8.0,
                  runSpacing: 8.0,
                  children: [
                    DropDownSchoolTime(
                      type: "time",
                      title: "Time".tr,
                      width: 220,
                    ),
                    DropDownSchoolTime(
                      isDisabled: false,
                      isLoading: controller.isLoadingClass,
                      type: "class",
                      title: "Class".tr,
                      width: 220,
                    ),
                    DropDownSchoolTime(
                      isLoading: controller.isLoadingDivision,
                      isDisabled:
                          controller.examClassIndex == "" ? true : false,
                      type: "division",
                      title: "Division".tr,
                      width: 220,
                    ),
                  ],
                ),
                if (Get.find<Add_Data_controller>().roll != "observer")
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    spacing: 8.0,
                    children: [
                      Container(
                        width: 40,
                        height: 40,
                        decoration: BoxDecoration(
                            color: Theme.of(context).cardColor,
                            borderRadius: BorderRadius.circular(5),
                            boxShadow: const [
                              BoxShadow(
                                  color: Colors.black12,
                                  offset: Offset(0, 2),
                                  blurRadius: 1)
                            ]),
                        child: IconButton(
                            style: ButtonStyle(
                                backgroundColor: WidgetStatePropertyAll(
                                    Theme.of(context).cardColor),
                                shape: WidgetStatePropertyAll(
                                    RoundedRectangleBorder(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(5))))),
                            onPressed: () {
                              exportTableToPdf(
                                classes: controller.examClassIndex,
                                division: controller.examDivisionIndex,
                                type: controller.timeLessonIndex.tr,
                                tableData: controller.studyshare,
                                fileName:
                                    "${controller.examClassIndex}_${controller.examDivisionIndex}_${controller.timeLessonIndex.tr}",
                              );
                            },
                            icon: Icon(VMS_Icons.pdf,
                                size: 18,
                                color: Theme.of(context)
                                    .textTheme
                                    .titleMedium!
                                    .color!)),
                      ),
                      Container(
                        width: 40,
                        height: 40,
                        decoration: BoxDecoration(
                            color: Theme.of(context).cardColor,
                            borderRadius: BorderRadius.circular(5),
                            boxShadow: const [
                              BoxShadow(
                                  color: Colors.black12,
                                  offset: Offset(0, 2),
                                  blurRadius: 1)
                            ]),
                        child: IconButton(
                            style: ButtonStyle(
                                backgroundColor: WidgetStatePropertyAll(
                                    Theme.of(context).cardColor),
                                shape: WidgetStatePropertyAll(
                                    RoundedRectangleBorder(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(5))))),
                            onPressed: () {
                              exportTableToExcel(
                                classes: controller.examClassIndex,
                                division: controller.examDivisionIndex,
                                type: controller.timeLessonIndex.tr,
                                tableData: controller.studyshare,
                                fileName:
                                    "${controller.examClassIndex}_${controller.examDivisionIndex}_${controller.timeLessonIndex.tr}",
                              );
                            },
                            icon: Icon(VMS_Icons.xl,
                                size: 18,
                                color: Theme.of(context)
                                    .textTheme
                                    .titleMedium!
                                    .color!)),
                      ),
                    ],
                  )
              ],
            );
          }),
        ),
        GetBuilder<AdminSchoolTimeController>(builder: (controller) {
          return Expanded(
              child: Padding(
            padding: const EdgeInsets.only(top: 15.0),
            child: controller.examClassIndex == ""
                ? Center(
                    child: Text(
                    "Select Class First".tr,
                    style: Get.textTheme.titleLarge!.copyWith(fontSize: 22),
                  ))
                : controller.examDivisionIndex == ""
                    ? Center(
                        child: Text(
                        "Select Division First".tr,
                        style: Get.textTheme.titleLarge!.copyWith(fontSize: 22),
                      ))
                    : controller.isLoading
                        ? Center(
                            child: LoadingAnimationWidget.inkDrop(
                              color: Theme.of(context).primaryColor,
                              size: 60,
                            ),
                          )
                        : Padding(
                            padding:
                                const EdgeInsets.only(left: 30.0, right: 30.0),
                            child: SingleChildScrollView(
                              scrollDirection: Axis.vertical,
                              child: SingleChildScrollView(
                                  scrollDirection: Axis.horizontal,
                                  child: Table(
                                    defaultColumnWidth: FixedColumnWidth(
                                        160), // عرض ثابت لكل خلية
                                    border: TableBorder.all(
                                        color: Get.theme.primaryColor),
                                    children: [
                                      TableRow(
                                        children: [
                                          Container(
                                            width: 160,
                                            height: 50,
                                            alignment: Alignment.center,
                                            color: Theme.of(context)
                                                .indicatorColor,
                                            child: Center(
                                              child: Text('Day'.tr,
                                                  style: Theme.of(context)
                                                      .textTheme
                                                      .titleMedium!
                                                      .copyWith(fontSize: 18)),
                                            ),
                                          ),
                                          ...tableData[0]
                                              .keys
                                              .where((key) => key != 'Day')
                                              .map((key) => Container(
                                                    width: 160,
                                                    height: 50,
                                                    alignment: Alignment.center,
                                                    color: Theme.of(context)
                                                        .indicatorColor,
                                                    child: Center(
                                                      child: Text(
                                                          textAlign:
                                                              TextAlign.center,
                                                          key.tr,
                                                          style:
                                                              Theme.of(context)
                                                                  .textTheme
                                                                  .titleMedium!
                                                                  .copyWith(
                                                                      fontSize:
                                                                          13)),
                                                    ),
                                                  )),
                                        ],
                                      ),
                                      for (var row in tableData)
                                        TableRow(
                                          children: [
                                            Container(
                                              width: 160,
                                              alignment: Alignment.center,
                                              height: 70,
                                              color: Theme.of(context)
                                                  .indicatorColor,
                                              child: Center(
                                                child: Text(
                                                    row['Day']?.tr ?? '',
                                                    style: Theme.of(context)
                                                        .textTheme
                                                        .titleMedium!
                                                        .copyWith(
                                                            fontSize: 16)),
                                              ),
                                            ),
                                            ...row.entries
                                                .where((entry) =>
                                                    entry.key != 'Day')
                                                .map((entry) => GestureDetector(
                                                      onTap: () async {
                                                        if (Get.find<
                                                                    Add_Data_controller>()
                                                                .roll !=
                                                            "observer") {
                                                          if (m!.studyShare!
                                                                  .isEmpty &&
                                                              controller
                                                                  .examDivision
                                                                  .isEmpty) {
                                                          } else {
                                                            if (entry.value
                                                                .contains(
                                                                    "No Lesson")) {
                                                              controller
                                                                  .subjectDialogIndex = "";
                                                              controller
                                                                  .teacherDialogIndex = "";
                                                            }

                                                            controller
                                                                .updateFieldError(
                                                                    "teach",
                                                                    false);
                                                            controller
                                                                .updateFieldError(
                                                                    "sub",
                                                                    false);

                                                            Get.dialog(
                                                                barrierDismissible:
                                                                    false,
                                                                VMSAlertDialog(
                                                                    action: [
                                                                      entry.value
                                                                              .contains("No Lesson")
                                                                          ? ButtonDialog(
                                                                              text: "Add".tr,
                                                                              onPressed: () async {
                                                                                bool IsteachError = controller.teacherDialogIndex.isEmpty || controller.teacherDialogIndex == "";
                                                                                bool IssubError = controller.subjectDialogIndex.isEmpty || controller.subjectDialogIndex == "";

                                                                                controller.updateFieldError("teach", IsteachError);
                                                                                controller.updateFieldError("sub", IssubError);

                                                                                final entryIndex = row.entries
                                                                                    .toList() // تحويل الكائنات إلى قائمة
                                                                                    .indexWhere((e) => e.value == entry.value); // البحث عن الفهرس
                                                                                if (!(IsteachError || IssubError)) {
                                                                                  await Addlessonapi(context).Addlesson(controller.subjectDialogList.indexOf(controller.selectedSubjectDialog), controller.examDivision.indexOf(controller.selectedExamDivision), controller.timeLessonIndex, controller.teacherDialogList.indexOf(controller.selectedTeacherDialog), entryIndex, row['Day'].toString());
                                                                                }
                                                                              },
                                                                              color: Get.theme.primaryColor,
                                                                              width: 120)
                                                                          : ButtonDialog(
                                                                              text: "Edit".tr,
                                                                              onPressed: () async {
                                                                                // احصل على مفتاح العمود مباشرة
                                                                                final columnKey = entry.key; // مثل 'First\n Lesson'

                                                                                // احصل على يوم الصف
                                                                                final day = row['Day'].toString();

                                                                                // استخدم lessions للعثور على رقم الدرس المقابل للعمود
                                                                                final lessonNumber = lessions.entries.firstWhere((e) => e.value == columnKey, orElse: () => throw "Column not found").key;

                                                                                // أنشئ الـ Pair باستخدام يوم ورقم الدرس
                                                                                Pair<int, int> key = Pair(days[day]!, lessonNumber);

                                                                                // احصل على الـ ID الفريد من الـ indexes
                                                                                int selectedId = indexes[key]!;

                                                                                bool IsteachError = controller.teacherDialogIndex.isEmpty || controller.teacherDialogIndex == "";
                                                                                bool IssubError = controller.subjectDialogIndex.isEmpty || controller.subjectDialogIndex == "";

                                                                                controller.updateFieldError("teach", IsteachError);
                                                                                controller.updateFieldError("sub", IssubError);

                                                                                if (!(IsteachError || IssubError)) {
                                                                                  await Editstudyshareapi(context).EditLesson(
                                                                                    controller.subjectDialogList.indexOf(controller.selectedSubjectDialog),
                                                                                    controller.teacherDialogList.indexOf(controller.selectedTeacherDialog),
                                                                                    selectedId,
                                                                                  );
                                                                                  Get.back();
                                                                                }
                                                                              },
                                                                              color: Get.theme.primaryColor,
                                                                              width: 120,
                                                                            ),
                                                                      entry.value
                                                                              .contains("No Lesson")
                                                                          ? Container()
                                                                          : ButtonDialog(
                                                                              text: "Delete".tr,
                                                                              onPressed: () async {
                                                                                // احصل على الفهرس الصحيح للعمود مباشرة من المفتاح
                                                                                final columnKey = entry.key; // هذا هو مفتاح العمود (مثل 'First\n Lesson')

                                                                                // احصل على يوم الصف
                                                                                final day = row['Day'].toString();

                                                                                // استخدم Pair مع يوم ورقم العمود (بدلاً من البحث بالقيمة)
                                                                                final lessonNumber = lessions.entries.firstWhere((e) => e.value == columnKey, orElse: () => throw "Column not found").key;

                                                                                Pair<int, int> key = Pair(days[day]!, lessonNumber);

                                                                                int selectedId = indexes[key]!;
                                                                                await Deletestudyshareapi(context).Deletestudyshare(selectedId);
                                                                                Get.back();
                                                                              },
                                                                              color: Color(0xffB03D3D),
                                                                              width: 120),
                                                                    ],
                                                                    contents:
                                                                        Container(
                                                                      width:
                                                                          Get.width /
                                                                              3,
                                                                      child: GetBuilder<
                                                                              AdminSchoolTimeController>(
                                                                          id:
                                                                              'dialog_data',
                                                                          builder:
                                                                              (SchoolController) {
                                                                            // تخزين العنصر الختار ضمن مصفوفة و فصل عناصؤه
                                                                            List<String>
                                                                                s =
                                                                                entry.value.split(' \n');
                                                                            // التحقق من أن المصفوفة تحتوي على القيم الأساسية
                                                                            if (s.length >=
                                                                                2) {
                                                                              //تخزين كل عنصر على حدا في متحول خاص به
                                                                              int subjectIndex = SchoolController.subjectDialogList.indexOf(s[0]);

                                                                              int teacherIndex = SchoolController.teacherDialogList.indexOf(s[1]);
                                                                              String teach = SchoolController.allteacherDialogList!.elementAt(teacherIndex).fullName.toString();
                                                                              String sub = Get.find<LocalizationController>().currentLocale.value.languageCode == 'ar' ? SchoolController.allsubjectDialogList!.elementAt(subjectIndex).name.toString() : SchoolController.allsubjectDialogList!.elementAt(subjectIndex).enName.toString();
                                                                              // التحقق من أن العناصر موجودة في المصفوفات الخاصة بها
                                                                              if (subjectIndex >= 0 && teacherIndex >= 0) {
                                                                                SchoolController.set_Edite_Data(teach, sub);
                                                                              }
                                                                            }
                                                                            return Column(
                                                                              mainAxisSize: MainAxisSize.min,
                                                                              children: [
                                                                                Padding(
                                                                                  padding: const EdgeInsets.only(top: 15.0),
                                                                                  child: Wrap(
                                                                                    spacing: 8.0,
                                                                                    runSpacing: 8.0,
                                                                                    children: [
                                                                                      DropDownSchoolTime(isError: controller.ISsubError, isLoading: SchoolController.isLoadingCurr, title: "Curriculum".tr, width: 220, type: "subjectDialog"),
                                                                                      DropDownSchoolTime(isError: controller.IteacherError, isLoading: SchoolController.isLoadingTeacher, title: "Teacher".tr, width: 220, type: "teacherDialog"),
                                                                                    ],
                                                                                  ),
                                                                                ),
                                                                              ],
                                                                            );
                                                                          }),
                                                                    ),
                                                                    apptitle:
                                                                        "Operation of Lessons"
                                                                            .tr,
                                                                    subtitle:
                                                                        ""));
                                                          }
                                                        }
                                                      },
                                                      child: Container(
                                                          width: 160,
                                                          alignment:
                                                              Alignment.center,
                                                          height: 70,
                                                          child: m!.studyShare!
                                                                      .isEmpty &&
                                                                  controller
                                                                      .examDivision
                                                                      .isEmpty
                                                              ? Text("")
                                                              : entry.value
                                                                      .contains(
                                                                          "No Lesson")!
                                                                  ? (Get.find<Add_Data_controller>()
                                                                              .roll !=
                                                                          "observer")
                                                                      ? Icon(
                                                                          Icons
                                                                              .add_circle_outline,
                                                                          color: Get
                                                                              .theme
                                                                              .primaryColor,
                                                                        )
                                                                      : Text(
                                                                          "No Lesson"
                                                                              .tr,
                                                                          style: Theme.of(context)
                                                                              .textTheme
                                                                              .headlineMedium,
                                                                        )
                                                                  : Text(
                                                                      textAlign:
                                                                          TextAlign
                                                                              .center,
                                                                      entry
                                                                          .value,
                                                                      style: Theme.of(
                                                                              context)
                                                                          .textTheme
                                                                          .bodyMedium)),
                                                    )),
                                          ],
                                        ),
                                    ],
                                  )),
                            ),
                          ),
          ));
        }),
      ],
    ));
  }
}
