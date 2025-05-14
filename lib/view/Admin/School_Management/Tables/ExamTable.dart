// ignore_for_file: must_be_immutable, file_names

import 'package:dio/dio.dart';
import 'package:duration_picker/duration_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:get/get.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:vms_school/Icons_File/v_m_s__icons_icons.dart';
import 'package:vms_school/Link/API/API.dart';
import 'package:vms_school/Link/API/AdminAPI/School/School_DropDown/DropdownClassesAPI.dart';
import 'package:vms_school/Link/API/AdminAPI/School/School_Tables/AddQuizAPI.dart';
import 'package:vms_school/Link/API/AdminAPI/School/School_Tables/DeleteQuiz.dart';
import 'package:vms_school/Link/API/AdminAPI/School/School_Tables/DropDownSemsesterAPI.dart';
import 'package:vms_school/Link/API/AdminAPI/School/School_Tables/EditQuizAPI.dart';
import 'package:vms_school/Link/API/AdminAPI/School/School_Tables/ExamTableAPI.dart';
import 'package:vms_school/Link/Controller/AdminController/Employee_Controllers/Add_Data_controller.dart';
import 'package:vms_school/Link/Controller/AdminController/School_Controllers/ExamTableController.dart';
import 'package:vms_school/Link/Model/AdminModel/School_Models/AllClassesModel.dart';
import 'package:vms_school/Link/Model/AdminModel/School_Models/AllSemesterModel.dart';
import 'package:vms_school/Theme/themeController.dart';
import 'package:vms_school/Translate/local_controller.dart';
import 'package:vms_school/main.dart';
import 'package:vms_school/widgets/Admin/Admin_Table/DropDownExamTable.dart';
import 'package:vms_school/widgets/ButtonsDialog.dart';
import 'package:vms_school/widgets/Calender.dart';
import 'package:vms_school/widgets/GridAnimation.dart';
import 'package:vms_school/widgets/Loading_Dialog.dart';
import 'package:vms_school/widgets/Responsive.dart';
import 'package:vms_school/widgets/TextFildWithUpper.dart';
import 'package:vms_school/widgets/VMSAlertDialog.dart';

class ExamTable extends StatefulWidget {
  const ExamTable({super.key});

  @override
  State<ExamTable> createState() => _ExamTableState();
}

class _ExamTableState extends State<ExamTable> {
  final ExamTableController c = Get.find<ExamTableController>();

  @override
  void initState() {
    Examtableapi(context).Examtable();
    Dropdownsemsesterapi(context).Dropdownsemsester();
    Getallclassapi.getAllClasses();
    Get.find<ExamTableController>().setClassIndex();
    Get.find<ExamTableController>().setSemesterIndex();
    Get.find<ExamTableController>().initialData();
    super.initState();
  }

  TextEditingController period = TextEditingController();
  TextEditingController max = TextEditingController();
  TextEditingController min = TextEditingController();
  TextEditingController maxDialog = TextEditingController();
  TextEditingController minDialog = TextEditingController();
  TextEditingController periodDialog = TextEditingController();
  Add_Dialog() {
    var controller = Get.find<ExamTableController>();
    controller.updateFieldError("class", false);
    controller.updateFieldError("curr", false);
    controller.updateFieldError("semester", false);
    controller.updateFieldError("type", false);
    controller.updateFieldError("max", false);
    controller.updateFieldError("min", false);
    controller.updateFieldError("per", false);
    controller.updateFieldError("date", false);

    Get.dialog(barrierDismissible: false,
        GetBuilder<ExamTableController>(builder: (Econtroller) {
      return VMSAlertDialog(
          action: [
            ButtonDialog(
                text: "Add Exam".tr,
                onPressed: () async {
                  bool IsclassError = controller.classDialogIndex.isEmpty ||
                      controller.classDialogIndex == "";
                  bool IscurrError = controller.curiculmDialogIndex.isEmpty ||
                      controller.curiculmDialogIndex == "";
                  bool IssemesterError =
                      controller.semesterDialogIndex.isEmpty ||
                          controller.semesterDialogIndex == "";
                  bool IstypeError = controller.typeDialogIndex.isEmpty ||
                      controller.typeDialogIndex == "";
                  bool IsmaxError = max.text.trim().isEmpty;
                  bool IsminError = min.text.trim().isEmpty;
                  bool IsperError = period.text.trim().isEmpty;
                  bool IsdateError = controller.dateindex.value == null;

                  Econtroller.updateFieldError("class", IsclassError);
                  Econtroller.updateFieldError("curr", IscurrError);
                  Econtroller.updateFieldError("semester", IssemesterError);
                  Econtroller.updateFieldError("type", IstypeError);
                  Econtroller.updateFieldError("max", IsmaxError);
                  Econtroller.updateFieldError("min", IsminError);
                  Econtroller.updateFieldError("per", IsperError);
                  Econtroller.updateFieldError("date", IsdateError);

                  if (!(IsclassError ||
                      IscurrError ||
                      IssemesterError ||
                      IstypeError ||
                      IsmaxError ||
                      IsminError ||
                      IsperError ||
                      IsdateError)) {
                    await Addquizapi(context).Addquiz(
                        controller.curiculmDialogList
                            .indexOf(controller.selectedCuriculmDialog),
                        controller.typeDialogList
                            .indexOf(controller.selectedTypeDialog),
                        controller.dateindex.toString(),
                        period.text,
                        controller.classDialogList
                            .indexOf(controller.selectedClassDailog),
                        max.text,
                        min.text);
                    Get.back();
                  }
                },
                color: Get.theme.primaryColor,
                width: 120)
          ],
          contents: Container(
            width: Get.width / 3,
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 15.0),
                    child: Wrap(
                      runSpacing: 8.0,
                      spacing: 8.0,
                      children: [
                        DropDownexamTable(
                            IsError: Econtroller.IsclassError,
                            isLoading: Econtroller.isClassLoading,
                            title: "Class".tr,
                            width: 220,
                            type: "classDialog"),
                        DropDownexamTable(
                            IsError: Econtroller.IscurrError,
                            isDisabled: Econtroller.classDialogIndex == "",
                            isLoading: Econtroller.isCuriculmLoading,
                            title: "Curriculum".tr,
                            width: 220,
                            type: "curiculmDialog"),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 15.0),
                    child: Wrap(
                      runSpacing: 8.0,
                      spacing: 8.0,
                      children: [
                        DropDownexamTable(
                            IsError: Econtroller.IssemesterError,
                            isLoading: Econtroller.issemesterLoading,
                            title: "season".tr,
                            width: 220,
                            type: "semesterDialog"),
                        DropDownexamTable(
                            IsError: Econtroller.IstypeError,
                            isDisabled: Econtroller.semesterDialogIndex == "",
                            isLoading: Econtroller.isTypeLoading,
                            title: "Type".tr,
                            width: 220,
                            type: "typeDialog"),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 15.0),
                    child: Wrap(
                      runSpacing: 8.0,
                      spacing: 8.0,
                      children: [
                        Textfildwithupper(
                            fieldType: "number",
                            onChanged: (value) {
                              if (value.isNotEmpty) {
                                if (value == "0") {
                                  max.text = "1";
                                }
                                Econtroller.updateFieldError("max", false);
                              }
                            },
                            isRequired: true,
                            isError: Econtroller.ISmaxError,
                            Uptext: "Max Mark".tr,
                            width: 220,
                            controller: max,
                            hinttext: "Max Mark".tr),
                        Textfildwithupper(
                            fieldType: "number",
                            onChanged: (value) {
                              if (value.isNotEmpty) {
                                if (value == "0") {
                                  min.text = "1";
                                }
                                Econtroller.updateFieldError("min", false);
                              }
                            },
                            isRequired: true,
                            isError: Econtroller.ISminError,
                            Uptext: "Min Mark".tr,
                            width: 220,
                            controller: min,
                            hinttext: "Min Mark".tr)
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 15.0),
                    child: Wrap(
                      runSpacing: 8.0,
                      spacing: 8.0,
                      children: [
                        GestureDetector(
                          onTap: () async {
                            Duration? picked = await showDurationPicker(
                              context: context,
                              initialTime: Duration(hours: 0, minutes: 0),
                            );
                            if (picked != null) {
                              Econtroller.updateFieldError("per", false);
                              period.text =
                                  "${picked.inHours.toString().padLeft(2, '0')}:"
                                  "${(picked.inMinutes % 60).toString().padLeft(2, '0')}:00";
                            }
                          },
                          child: Textfildwithupper(
                            isRequired: true,
                            isError: Econtroller.ISperiodError,
                            readOnly: true,
                            enabled: false,
                            Uptext: "Period".tr,
                            width: 220,
                            controller: period,
                            hinttext: "00:00:00",
                          ),
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(bottom: 5.0),
                              child: RichText(
                                  text: TextSpan(
                                      text: "Date".tr,
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyMedium)),
                            ),
                            examDate(
                              isError: Econtroller.ISdateError,
                              isRequired: true,
                              width: 220,
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          apptitle: "Add Exam".tr,
          subtitle: "none");
    }));
    Get.find<ExamTableController>().initialData();
    period.clear();
    max.clear();
    min.clear();
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ExamTableController>(builder: (controller) {
      return Padding(
        padding: EdgeInsets.only(top: 38.0, right: 15, left: 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              padding: EdgeInsets.only(bottom: 25.0),
              width: Get.width * 0.87,
              child: Wrap(
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
                      DropDownexamTable(
                        isLoading: controller.issemesterLoading,
                        title: "Semester".tr,
                        width: 220,
                        type: 'season',
                      ),
                      DropDownexamTable(
                        isDisabled: controller.examSeasonIndex == "",
                        isLoading: controller.isTypeLoading,
                        title: "Type".tr,
                        width: 220,
                        type: 'type',
                      ),
                      DropDownexamTable(
                        isLoading: controller.isClassLoading,
                        isDisabled: false,
                        type: 'class',
                        title: "Class".tr,
                        width: 220,
                      ),
                    ],
                  ),
                  if (Get.find<Add_Data_controller>().roll != "observer")
                    Row(
                      mainAxisSize: MainAxisSize.min,
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
                              style: const ButtonStyle(
                                  shape: WidgetStatePropertyAll(
                                      RoundedRectangleBorder(
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(5))))),
                              onPressed: () {
                                Add_Dialog();
                              },
                              icon: Icon(Icons.add,
                                  size: 18,
                                  color: Theme.of(context).highlightColor)),
                        ),
                        Padding(
                          padding:
                              const EdgeInsets.only(right: 10.0, left: 10.0),
                          child: Container(
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
                                style: const ButtonStyle(
                                    shape: WidgetStatePropertyAll(
                                        RoundedRectangleBorder(
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(5))))),
                                onPressed: () {},
                                icon: Icon(VMS_Icons.xl,
                                    size: 18,
                                    color: Theme.of(context).highlightColor)),
                          ),
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
                              style: const ButtonStyle(
                                  shape: WidgetStatePropertyAll(
                                      RoundedRectangleBorder(
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(5))))),
                              onPressed: () {},
                              icon: Icon(VMS_Icons.pdf,
                                  size: 18,
                                  color: Theme.of(context).highlightColor)),
                        ),
                      ],
                    )
                ],
              ),
            ),
            GetBuilder<ExamTableController>(builder: (controller) {
              if (controller.isLoading) {
                return Expanded(
                  child: Container(
                    width: Get.width >= 768 ? Get.width - 120 : Get.width - 70,
                    child: LoadingAnimationWidget.inkDrop(
                      color: Theme.of(context).primaryColor,
                      size: 60,
                    ),
                  ),
                );
              }
              if (controller.filteredquiz!.isEmpty) {
                return Expanded(
                  child: Container(
                    width: Get.width >= 768 ? Get.width - 120 : Get.width - 70,
                    child: Center(
                      child: Text("No Data in Exam Table".tr,
                          style: Get.theme.textTheme.titleLarge!.copyWith(
                              fontSize: 16, fontWeight: FontWeight.normal)),
                    ),
                  ),
                );
              }
              return Expanded(
                child: Container(
                  width: Get.width >= 768 ? Get.width - 120 : Get.width - 70,
                  child: SingleChildScrollView(
                    scrollDirection: Axis.vertical,
                    child: Column(
                      children: [
                        SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: DataTable(
                            headingRowColor: WidgetStatePropertyAll(
                                Theme.of(context).indicatorColor),
                            border: TableBorder.all(
                              color: Theme.of(context).primaryColor,
                              width: 1.0,
                            ),
                            columns: [
                              DataColumn(
                                label: Text("Class".tr,
                                    textAlign: TextAlign.center,
                                    style:
                                        Theme.of(context).textTheme.titleLarge),
                              ),
                              DataColumn(label: Text('Type'.tr)),
                              DataColumn(label: Text('Curriculum Name'.tr)),
                              DataColumn(label: Text('Date'.tr)),
                              DataColumn(label: Text('Period'.tr)),
                              DataColumn(label: Text('Max Mark'.tr)),
                              DataColumn(
                                label: Text('Passing Mark'.tr),
                              ),
                              if (Get.find<Add_Data_controller>().roll !=
                                  "observer")
                                DataColumn(
                                  label: Text('Operations'.tr),
                                ),
                            ],
                            rows: controller.filteredquiz!.map((exam) {
                              return DataRow(cells: [
                                DataCell(Text(
                                     Get.find<LocalizationController>().currentLocale.value.languageCode ==
                  'ar'
                                        ? exam.classese?.name ?? ""
                                        : exam.classese?.enName ?? '')),
                                DataCell(Text(exam.type ?? '')),
                                DataCell(Text(
                                     Get.find<LocalizationController>().currentLocale.value.languageCode ==
                  'ar'
                                        ? exam.curriculumName ?? ''
                                        : exam.curriculumEnName ?? '')),
                                DataCell(Text(exam.startDate ?? '')),
                                DataCell(Text(exam.period ?? '')),
                                DataCell(Text(exam.maxMark?.toString() ?? '')),
                                DataCell(
                                    Text(exam.passingMark?.toString() ?? '')),
                                if (Get.find<Add_Data_controller>().roll !=
                                    "observer")
                                  DataCell(Row(
                                    spacing: 8.0,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    children: [
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
                                        icon: const Icon(VMS_Icons.bin),
                                        iconSize: 16,
                                        color: Colors.white,
                                        onPressed: () async {
                                          await DeletequizAPI(context)
                                              .Deletequiz(controller
                                                  .filteredquiz![controller
                                                      .filteredquiz!
                                                      .indexOf(exam)]
                                                  .id
                                                  .toString());
                                        },
                                      ),
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
                                                    const Color.fromARGB(
                                                        255, 2, 124, 49))),
                                        icon: const Icon(VMS_Icons.edit),
                                        iconSize: 16,
                                        color: Colors.white,
                                        onPressed: () async {
                                          maxDialog.text = controller
                                              .filteredquiz![controller
                                                  .filteredquiz!
                                                  .indexOf(exam)]
                                              .maxMark
                                              .toString();

                                          minDialog.text = controller
                                              .filteredquiz![controller
                                                  .filteredquiz!
                                                  .indexOf(exam)]
                                              .passingMark
                                              .toString();

                                          periodDialog.text = controller
                                              .filteredquiz![controller
                                                  .filteredquiz!
                                                  .indexOf(exam)]
                                              .period
                                              .toString();

                                          controller.dateindex.value =
                                              DateTime.parse(controller
                                                  .filteredquiz![controller
                                                      .filteredquiz!
                                                      .indexOf(exam)]
                                                  .startDate
                                                  .toString());

                                          controller.updateFieldError(
                                              "max", false);
                                          controller.updateFieldError(
                                              "min", false);
                                          controller.updateFieldError(
                                              "per", false);
                                          controller.updateFieldError(
                                              "date", false);

                                          Get.dialog(barrierDismissible: false,
                                              GetBuilder<ExamTableController>(
                                                  builder: (Econtroller) {
                                            return VMSAlertDialog(
                                                action: [
                                                  ButtonDialog(
                                                      text: "Edit Exam".tr,
                                                      onPressed: () async {
                                                        bool IsmaxError =
                                                            maxDialog.text
                                                                .trim()
                                                                .isEmpty;
                                                        bool IsminError =
                                                            minDialog.text
                                                                .trim()
                                                                .isEmpty;
                                                        bool IsperError =
                                                            periodDialog.text
                                                                .trim()
                                                                .isEmpty;
                                                        bool IsdateError =
                                                            controller.dateindex
                                                                    .value ==
                                                                null;

                                                        Econtroller
                                                            .updateFieldError(
                                                                "max",
                                                                IsmaxError);
                                                        Econtroller
                                                            .updateFieldError(
                                                                "min",
                                                                IsminError);
                                                        Econtroller
                                                            .updateFieldError(
                                                                "per",
                                                                IsperError);
                                                        Econtroller
                                                            .updateFieldError(
                                                                "date",
                                                                IsdateError);

                                                        if (!(IsmaxError ||
                                                            IsminError ||
                                                            IsperError ||
                                                            IsdateError)) {
                                                          await Editquizapi(context).Editquiz(
                                                              controller
                                                                  .filteredquiz![controller
                                                                      .filteredquiz!
                                                                      .indexOf(
                                                                          exam)]
                                                                  .id
                                                                  .toString(),
                                                              controller
                                                                  .dateindex
                                                                  .value
                                                                  .toString(),
                                                              periodDialog.text,
                                                              maxDialog.text,
                                                              minDialog.text);
                                                          Get.back();
                                                        }
                                                      },
                                                      color: Get
                                                          .theme.primaryColor,
                                                      width: 120)
                                                ],
                                                contents: Container(
                                                  width: Get.width / 3,
                                                  child: SingleChildScrollView(
                                                    child: Column(
                                                      mainAxisSize:
                                                          MainAxisSize.min,
                                                      children: [
                                                        Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                  .only(
                                                                  top: 15.0),
                                                          child: Wrap(
                                                            spacing: 8.0,
                                                            runSpacing: 8.0,
                                                            children: [
                                                              Textfildwithupper(
                                                                  fieldType:
                                                                      "number",
                                                                  onChanged:
                                                                      (value) {
                                                                    if (value
                                                                        .isNotEmpty) {
                                                                      if (value ==
                                                                          "0") {
                                                                        maxDialog.text =
                                                                            "1";
                                                                      }
                                                                      Econtroller.updateFieldError(
                                                                          "max",
                                                                          false);
                                                                    }
                                                                  },
                                                                  Uptext:
                                                                      "Max Mark"
                                                                          .tr,
                                                                  width: 220,
                                                                  isError:
                                                                      Econtroller
                                                                          .ISmaxError,
                                                                  controller:
                                                                      maxDialog,
                                                                  hinttext:
                                                                      "Max Mark"
                                                                          .tr),
                                                              Textfildwithupper(
                                                                  fieldType:
                                                                      "number",
                                                                  onChanged:
                                                                      (value) {
                                                                    if (value
                                                                        .isNotEmpty) {
                                                                      if (value ==
                                                                          "0") {
                                                                        minDialog.text =
                                                                            "1";
                                                                      }
                                                                      Econtroller.updateFieldError(
                                                                          "min",
                                                                          false);
                                                                    }
                                                                  },
                                                                  isError:
                                                                      Econtroller
                                                                          .ISminError,
                                                                  Uptext:
                                                                      "Min Mark"
                                                                          .tr,
                                                                  width: 220,
                                                                  controller:
                                                                      minDialog,
                                                                  hinttext:
                                                                      "Min Mark"
                                                                          .tr)
                                                            ],
                                                          ),
                                                        ),
                                                        Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                  .only(
                                                                  top: 15.0),
                                                          child: Wrap(
                                                            spacing: 8.0,
                                                            runSpacing: 8.0,
                                                            children: [
                                                              GestureDetector(
                                                                onTap:
                                                                    () async {
                                                                  Duration?
                                                                      picked =
                                                                      await showDurationPicker(
                                                                    context:
                                                                        context,
                                                                    initialTime: Duration(
                                                                        hours:
                                                                            0,
                                                                        minutes:
                                                                            0),
                                                                  );
                                                                  if (picked !=
                                                                      null) {
                                                                    periodDialog
                                                                            .text =
                                                                        "${picked.inHours.toString().padLeft(2, '0')}:"
                                                                        "${(picked.inMinutes % 60).toString().padLeft(2, '0')}:00";
                                                                  }
                                                                },
                                                                child: Textfildwithupper(
                                                                    isError:
                                                                        Econtroller
                                                                            .ISperiodError,
                                                                    enabled:
                                                                        false,
                                                                    Uptext:
                                                                        "Period"
                                                                            .tr,
                                                                    width: 220,
                                                                    controller:
                                                                        periodDialog,
                                                                    hinttext:
                                                                        "00:00:00"),
                                                              ),
                                                              Column(
                                                                crossAxisAlignment:
                                                                    CrossAxisAlignment
                                                                        .start,
                                                                children: [
                                                                  Padding(
                                                                    padding: const EdgeInsets
                                                                        .only(
                                                                        bottom:
                                                                            5.0),
                                                                    child: RichText(
                                                                        text: TextSpan(
                                                                            text:
                                                                                "Date".tr,
                                                                            style: Get.theme.textTheme.bodyMedium)),
                                                                  ),
                                                                  examDate(
                                                                    isError:
                                                                        Econtroller
                                                                            .ISdateError,
                                                                    width: 220,
                                                                  ),
                                                                ],
                                                              )
                                                            ],
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                                apptitle: "Edit Exam".tr,
                                                subtitle: "none");
                                          }));
                                        },
                                      ),
                                    ],
                                  )),
                              ]);
                            }).toList(),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            }),
          ],
        ),
      );
    });
  }
}
