import 'package:flutter/material.dart';
import 'package:flutter_dropzone/flutter_dropzone.dart';
import 'package:get/get.dart';
import 'package:vms_school/Icons_File/v_m_s__icons_icons.dart';
import 'package:vms_school/Link/API/AdminAPI/School/School_Screen_APIs/Curriculm_API/Add_Curriculm_API.dart';
import 'package:vms_school/Link/API/AdminAPI/School/School_Screen_APIs/Curriculm_API/Get_All_Curriculm.dart';
import 'package:vms_school/Link/API/AdminAPI/School/School_Screen_APIs/Subjects_API/Get_Subjects_API.dart';
import 'package:vms_school/Link/Controller/AdminController/Employee_Controllers/Add_Data_controller.dart';
import 'package:vms_school/Link/Controller/AdminController/School_Controllers/Subject_Controller.dart';
import 'package:vms_school/Link/Controller/WidgetController/DropDown_Controllers/DropDownCurriculumn_Controller.dart';
import 'package:vms_school/Link/Functions/Export_Exle_Function.dart';
import 'package:vms_school/Link/Functions/Export_PDF_Function.dart';
import 'package:vms_school/Translate/local_controller.dart';

import 'package:vms_school/view/Both_Platform/widgets/Admin/Admin_School/DropDownCurriMgmt.dart';
import 'package:vms_school/view/Both_Platform/widgets/ButtonsDialog.dart';
import 'package:vms_school/view/Both_Platform/widgets/TextFildWithUpper.dart';
import 'package:vms_school/view/Both_Platform/widgets/TextFormSearch.dart';
import 'package:vms_school/view/Both_Platform/widgets/VMSAlertDialog.dart';
import 'package:vms_school/Link/Model/AdminModel/School_Models/Curriculum_Model.dart';
import 'package:vms_school/view/SMS_Platform/Admin/School_Management/Curriculum_Pages/Curriculum_Grid.dart';

class Curriculum_Management extends StatefulWidget {
  const Curriculum_Management({super.key});

  @override
  State<Curriculum_Management> createState() => _Curriculum_ManagementState();
}

class _Curriculum_ManagementState extends State<Curriculum_Management> {
  TextEditingController search = TextEditingController();
  TextEditingController name = TextEditingController();
  TextEditingController enname = TextEditingController();
  TextEditingController max = TextEditingController();
  TextEditingController Passing = TextEditingController();

  DropzoneViewController? ctrl;
  @override
  void initState() {
    Get_All_Curriculm_API(context).Get_All_Curriculm();
    Get_Subject_Screen_API(context).Get_Subject_Screen();
    Get.find<Curriculumn_Controller>().initialScreen();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Add_Curr() {
      return GetBuilder<Curriculumn_Controller>(builder: (controller) {
        return VMSAlertDialog(
            action: [
              ButtonDialog(
                  text: "Add".tr,
                  onPressed: () async {
                    bool isArNameEmpty = name.text.isEmpty;
                    bool isEnNameEmpty = enname.text.isEmpty;
                    bool isMaxEmpty = max.text.isEmpty;
                    bool isPassingEmpty = Passing.text.isEmpty;
                    bool isSubjectEmpty =
                        controller.dialog_SubjectIndex.isEmpty ||
                            controller.dialog_SubjectIndex == "";
                    // bool isSemesterEmpty =
                    //     controller.selectedSemesterIds.isEmpty ||
                    //         controller.selectedSemesterIds == [];
                    bool isImageEmpty = controller.selectedImage.value == null;
                    bool isFileEmpty = controller.selectedFile.value == null;

                    controller.updateFieldError("aname", isArNameEmpty);
                    controller.updateFieldError("ename", isEnNameEmpty);
                    controller.updateFieldError("subject", isSubjectEmpty);
                    // controller.updateFieldError("semester", isSemesterEmpty);
                    controller.updateFieldError("max", isMaxEmpty);
                    controller.updateFieldError("passing", isPassingEmpty);
                    controller.updateFieldError("image", isImageEmpty);
                    controller.updateFieldError("file", isFileEmpty);

                    for (var fieldSet in controller.subCurrFields) {
                      if (fieldSet['name']!.text.isEmpty ||
                          fieldSet['enname']!.text.isEmpty ||
                          fieldSet['max']!.text.isEmpty ||
                          fieldSet['passing']!.text.isEmpty) {
                        Get.snackbar(
                            "Error".tr, "Please fill all additional fields".tr);
                        return;
                      }
                    }
                    if (!(isArNameEmpty ||
                        isEnNameEmpty ||
                        isMaxEmpty ||
                        isPassingEmpty ||
                        isSubjectEmpty ||
                        // isSemesterEmpty ||
                        isImageEmpty ||
                        isFileEmpty)) {
                     if (await Add_Curriculm_API(context).Add_Curriculm(
      subjectId: controller.subjectId!,
      name: name.text,
      Ename: enname.text,
      maxMark: max.text,
      PassingMark: Passing.text,
      type: controller.isFailingSubject,
      file: controller.selectedFile.value,
      Image: controller.selectedImage.value,
      subCurr: controller.subCurrFields.isNotEmpty
          ? controller.subCurrFields.map((fieldSet) {
              return {
                'name': fieldSet['name']!.text,
                'enname': fieldSet['enname']!.text,
                'max': fieldSet['max']!.text,
                'passing': fieldSet['passing']!.text,
              };
            }).toList()
          : null,
    ) == 200) {
  name.clear();
  enname.clear();
  max.clear();
  Passing.clear();
  controller.selectedFile.value!.clear();
  controller.selectedImage.value!.clear();
  controller.subjectIndex = "";
  controller.clearSubCurrFields();
}
                    }
                  },
                  color: Theme.of(context).primaryColor,
                  width: 90),
            ],
            contents: Container(
              width: 520,
              child: SingleChildScrollView(
                child: Column(
                  spacing: 15.0,
                  children: [
                    Wrap(
                      spacing: 15.0,
                      runSpacing: 10.0,
                      crossAxisAlignment: WrapCrossAlignment.center,
                      alignment: WrapAlignment.center,
                      runAlignment: WrapAlignment.center,
                      children: [
                        GetBuilder<Subject_Controller>(
                            builder: (subject_controller) {
                          return DropDownCurriMgmt(
                              isError: controller.IsSubjectError,
                              Isloading: subject_controller.isLoading,
                              title: "Subject".tr,
                              width: 250,
                              type: "Dialog_Subject");
                        }),

                        Container(
                          width: 250,
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Checkbox(
                                value: controller.isFailingSubject,
                                // Use the state from the controller
                                onChanged: (value) {
                                  controller.updateSelection(
                                      value!); // Update the state
                                },
                              ),
                              Text("Is Failed subject".tr),
                            ],
                          ),
                        ),
                        // DropDownCurriMgmt(
                        //     isError: controller.IsSemesterError,
                        //     title: "Semester".tr,
                        //     width: 250,
                        //     type: "Dialog_semester")
                      ],
                    ),
                    Wrap(
                      spacing: 15.0,
                      runSpacing: 10.0,
                      crossAxisAlignment: WrapCrossAlignment.center,
                      alignment: WrapAlignment.center,
                      runAlignment: WrapAlignment.center,
                      children: [
                        Textfildwithupper(
                            isError: controller.IsAnameError,
                            isRequired: true,
                            onChanged: (value) {
                              if (value.isNotEmpty) {
                                controller.updateFieldError("aname", false);
                              }
                            },
                            width: 250,
                            controller: name,
                            Uptext: "Curriculum Name".tr,
                            hinttext: "Curriculum Name - Class Name".tr),
                        Textfildwithupper(
                            isError: controller.IsEnameError,
                            isRequired: true,
                            onChanged: (value) {
                              if (value.isNotEmpty) {
                                controller.updateFieldError("ename", false);
                              }
                            },
                            width: 250,
                            controller: enname,
                            Uptext: "Curriculum English Name".tr,
                            hinttext:
                                "Curriculum English Name - English Class Name"
                                    .tr),
                      ],
                    ),
                    Wrap(
                      spacing: 15.0,
                      runSpacing: 10.0,
                      crossAxisAlignment: WrapCrossAlignment.center,
                      alignment: WrapAlignment.center,
                      runAlignment: WrapAlignment.center,
                      children: [
                        Textfildwithupper(
                            fieldType: "number",
                            isError: controller.IsMaxError,
                            isRequired: true,
                            onChanged: (value) {
                              if (value.isNotEmpty) {
                                controller.updateFieldError("max", false);
                              }
                            },
                            controller: max,
                            Uptext: "Max Mark".tr,
                            hinttext: "Max Mark".tr),
                        Textfildwithupper(
                            fieldType: "number",
                            isError: controller.IsPassingError,
                            isRequired: true,
                            onChanged: (value) {
                              if (value.isNotEmpty) {
                                controller.updateFieldError("passing", false);
                              }
                            },
                            controller: Passing,
                            Uptext: "Passing Mark".tr,
                            hinttext: "Passing Mark".tr)
                      ],
                    ),
                    Wrap(
                      spacing: 15.0,
                      runSpacing: 10.0,
                      crossAxisAlignment: WrapCrossAlignment.center,
                      alignment: WrapAlignment.center,
                      runAlignment: WrapAlignment.center,
                      children: [
                        // Dropzone area for files and PDFs
                        GestureDetector(
                          onTap: () {
                            controller.pickPDFFile();
                          },
                          child: AnimatedContainer(
                            duration: const Duration(milliseconds: 500),
                            decoration: BoxDecoration(
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(5)),
                              border: controller.IsFileError
                                  ? Border.all(color: Colors.redAccent)
                                  : Border.all(color: const Color(0xffD9D9D9)),
                              color: controller.isHoveringFile
                                  ? Theme.of(context).primaryColor
                                  : Theme.of(context).cardColor,
                            ),
                            alignment: Alignment.center,
                            width: 250,
                            height: 100,
                            child: Stack(
                              children: [
                                DropzoneView(
                                  operation: DragOperation.copy,
                                  cursor: CursorType.Default,
                                  onCreated:
                                      (DropzoneViewController controller) {
                                    ctrl = controller;
                                  },
                                  onHover: () {
                                    controller.updateHoverFile(true);
                                  },
                                  onLeave: () {
                                    controller.updateHoverFile(false);
                                  },
                                  onDropFiles: (List<DropzoneFileInterface>?
                                      files) async {
                                    if (files != null && files.length == 1) {
                                      final file = files.first;
                                      final mimeType =
                                          await ctrl?.getFileMIME(file);
                                      final fileName =
                                          await ctrl?.getFilename(file);
                                      final fileBytes =
                                          await ctrl?.getFileData(file);

                                      if (mimeType == 'application/pdf' ||
                                          fileName!
                                              .toLowerCase()
                                              .endsWith('.pdf')) {
                                        controller.selectedFile.value =
                                            fileBytes;
                                        controller.fileName.value = fileName!;
                                        controller.updateTextFile(
                                            "PDF File Successfully Dropped!");
                                        controller.updateFieldError(
                                            "file", false);
                                      } else {
                                        controller.updateTextFile(
                                            "Error: Unsupported File Type.");
                                      }
                                    } else {
                                      controller.updateTextFile(
                                          "Error: Only One File Is Allowed.");
                                    }
                                  },
                                ),
                                Center(
                                  child: controller.selectedFile.value != null
                                      ? IconButton(
                                          onPressed: () {
                                            controller.Clearfile();
                                          },
                                          icon: Icon(
                                            Icons.delete_outline_outlined,
                                            color: Colors.redAccent,
                                          ))
                                      : Text(
                                          textAlign: TextAlign.center,
                                          controller.fileStatus,
                                          style: TextStyle(
                                            color: controller.isHoveringFile
                                                ? Colors.white
                                                : const Color(0xffCBBFBF),
                                          ),
                                        ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            controller.pickImage();
                          },
                          child: AnimatedContainer(
                            duration: const Duration(milliseconds: 500),
                            decoration: BoxDecoration(
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(5)),
                              border: controller.IsImageError
                                  ? Border.all(color: Colors.redAccent)
                                  : Border.all(color: const Color(0xffD9D9D9)),
                              color: controller.isHoveringimage
                                  ? Theme.of(context).primaryColor
                                  : Theme.of(context).cardColor,
                            ),
                            alignment: Alignment.center,
                            width: 250,
                            height: 100,
                            child: Stack(
                              children: [
                                DropzoneView(
                                  operation: DragOperation.copy,
                                  cursor: CursorType.Default,
                                  onCreated:
                                      (DropzoneViewController controller) {
                                    ctrl = controller;
                                  },
                                  onHover: () {
                                    controller.updateHoverImage(true);
                                  },
                                  onLeave: () {
                                    controller.updateHoverImage(false);
                                  },
                                  onDropFiles: (List<DropzoneFileInterface>?
                                      files) async {
                                    if (files != null && files.length == 1) {
                                      final file = files.first;
                                      final mimeType =
                                          await ctrl?.getFileMIME(file);
                                      final fileName =
                                          await ctrl?.getFilename(file);
                                      final fileBytes =
                                          await ctrl?.getFileData(file);
                                      if (mimeType == 'image/jpeg' ||
                                          mimeType == 'image/png' ||
                                          fileName!
                                              .toLowerCase()
                                              .endsWith('.jpg') ||
                                          fileName
                                              .toLowerCase()
                                              .endsWith('.jpeg') ||
                                          fileName
                                              .toLowerCase()
                                              .endsWith('.png')) {
                                        controller.selectedImage.value =
                                            fileBytes;
                                        controller.updateTextImage(
                                            "Image Successfully Dropped!");
                                        controller.updateFieldError(
                                            "image", false);
                                      } else {
                                        controller.updateTextImage(
                                            "Error: Unsupported File Type.");
                                      }
                                    } else {
                                      controller.updateTextImage(
                                          "Error: Only One File Is Allowed.");
                                    }
                                  },
                                ),
                                Center(
                                  child: controller.selectedImage.value != null
                                      ? IconButton(
                                          onPressed: () {
                                            controller.ClearImage();
                                          },
                                          icon: Icon(
                                            Icons.delete_outline_outlined,
                                            color: Colors.redAccent,
                                          ))
                                      : Text(
                                          textAlign: TextAlign.center,
                                          controller.imageStatus,
                                          style: TextStyle(
                                            color: controller.isHoveringimage
                                                ? Colors.white
                                                : const Color(0xffCBBFBF),
                                          ),
                                        ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        Container(
                          margin: EdgeInsets.symmetric(vertical: 10),
                          child: ElevatedButton(
                            onPressed: () {
                              controller.addSubCurrFieldSet();
                            },
                            child: Text("Add Sub-Curriculum".tr),
                          ),
                        ),

                        // عرض الحقول الإضافية
                        ...controller.subCurrFields
                            .asMap()
                            .entries
                            .map((entry) {
                          int index = entry.key;
                          var fieldSet = entry.value;
                          return Column(
                            children: [
                              Wrap(
                                spacing: 15.0,
                                runSpacing: 10.0,
                                crossAxisAlignment: WrapCrossAlignment.center,
                                alignment: WrapAlignment.center,
                                runAlignment: WrapAlignment.center,
                                children: [
                                  Textfildwithupper(
                                    isRequired: true,
                                    width: 250,
                                    controller: fieldSet['name']!,
                                    Uptext: "Curriculum Name".tr +
                                        " ${index + 1}".tr,
                                    hinttext: "Curriculum Name - Class Name".tr,
                                  ),
                                  Textfildwithupper(
                                    isRequired: true,
                                    width: 250,
                                    controller: fieldSet['enname']!,
                                    Uptext: "Curriculum English Name".tr +
                                        " ${index + 1}".tr,
                                    hinttext:
                                        "Curriculum English Name - English Class Name"
                                            .tr,
                                  ),
                                ],
                              ),
                              Wrap(
                                spacing: 15.0,
                                runSpacing: 10.0,
                                crossAxisAlignment: WrapCrossAlignment.center,
                                alignment: WrapAlignment.center,
                                runAlignment: WrapAlignment.center,
                                children: [
                                  Textfildwithupper(
                                    fieldType: "number",
                                    isRequired: true,
                                    width: 250,
                                    controller: fieldSet['max']!,
                                    Uptext: "Max Mark".tr + " ${index + 1}".tr,
                                    hinttext: "Max Mark".tr,
                                  ),
                                  Textfildwithupper(
                                    fieldType: "number",
                                    isRequired: true,
                                    width: 250,
                                    controller: fieldSet['passing']!,
                                    Uptext:
                                        "Passing Mark".tr + " ${index + 1}".tr,
                                    hinttext: "Passing Mark".tr,
                                  ),
                                  IconButton(
                                    icon: Icon(Icons.delete, color: Colors.red),
                                    onPressed: () =>
                                        controller.removeSubCurrFieldSet(index),
                                  ),
                                ],
                              ),
                              Divider(),
                            ],
                          );
                        }).toList(),
                      ],
                    )
                  ],
                ),
              ),
            ),
            apptitle: "Add Curriculum".tr,
            subtitle: "none");
      });
    }

    double screenWidth = MediaQuery.of(context).size.width;
    return Expanded(
        child: Column(
      children: [
        if (Get.find<Add_Data_controller>().roll != "observer")
          if (screenWidth > 769)
            Container(
              width: screenWidth,
              margin: const EdgeInsets.only(left: 30.0, right: 30.0, top: 30.0),
              child: Wrap(
                alignment: WrapAlignment.spaceBetween,
                runSpacing: 10.0,
                spacing: 15.0,
                crossAxisAlignment: WrapCrossAlignment.center,
                runAlignment: WrapAlignment.start,
                children: [
                  Wrap(
                    runSpacing: 10.0,
                    spacing: 15.0,
                    children: [
                      GetBuilder<Subject_Controller>(builder: (controller) {
                        return DropDownCurriMgmt(
                          Isloading: controller.isLoading,
                          title: "Subject".tr,
                          width: 250,
                          type: "Subject",
                        );
                      }),
                      // DropDownCurriMgmt(
                      //   Isloading: false,
                      //   title: "Semester".tr,
                      //   width: 250,
                      //   type: "semester",
                      // ),
                      GetBuilder<Curriculumn_Controller>(builder: (controller) {
                        return TextFormSearch(
                          click: () {
                            controller.clearFilter();
                          },
                          onchange: (value) {
                            // controller.searchByName(
                            //     value,
                            //     controller.semesterIndex,
                            //     controller.subjectIndex);
                            controller.searchByName(
                                value, controller.subjectIndex);
                          },
                          width: 250,
                          radius: 5,
                          controller: search,
                          suffixIcon:
                              search.text != "" ? Icons.clear : Icons.search,
                        );
                      }),
                    ],
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    spacing: 15.0,
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
                              var controller =
                                  Get.find<Curriculumn_Controller>();
                              controller.initialAddCurr();
                              name.clear();
                              enname.clear();
                              max.clear();
                              Passing.clear();
                              Get.dialog(
                                Add_Curr(),
                                barrierDismissible: false,
                              );
                            },
                            icon: Icon(Icons.add,
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
                              exportDataToPdf<Curriculum>(
                                items: Get.find<Curriculumn_Controller>()
                                    .filteredCurriculum!,
                                headers: [
                                  "Name".tr,
                                  "English Name".tr,
                                  "Max Mark".tr,
                                  "Passing Mark".tr,
                                  "Subject".tr,
                                  "Failed subject".tr,
                                ],
                                fieldMappings: {
                                  "Name".tr: (reg) => reg.name ?? "",
                                  "English Name".tr: (reg) => reg.enName ?? "",
                                  "Max Mark".tr: (reg) => reg.maxMark ?? "",
                                  "Passing Mark".tr: (reg) =>
                                      reg.passingMark ?? "",
                                  "Subject".tr: (reg) =>
                                      Get.find<LocalizationController>()
                                                  .currentLocale
                                                  .value
                                                  .languageCode ==
                                              'ar'
                                          ? reg.subject!.name
                                          : reg.subject!.enName ?? "",
                                  "Failed subject".tr: (reg) =>
                                      reg.type == 1 ? "Yes".tr : "No".tr ?? "",
                                },
                                fileName: "Curriculum".tr +
                                    '${DateTime.now().toIso8601String()}',
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
                              exportDataToExcel<Curriculum>(
                                items: Get.find<Curriculumn_Controller>()
                                    .filteredCurriculum!,
                                headers: [
                                  "Name".tr,
                                  "English Name".tr,
                                  "Max Mark".tr,
                                  "Passing Mark".tr,
                                  "Subject".tr,
                                  "Failed subject".tr,
                                ],
                                fieldMappings: {
                                  "Name".tr: (reg) => reg.name ?? "",
                                  "English Name".tr: (reg) => reg.enName ?? "",
                                  "Max Mark".tr: (reg) => reg.maxMark ?? "",
                                  "Passing Mark".tr: (reg) =>
                                      reg.passingMark ?? "",
                                  "Subject".tr: (reg) =>
                                      Get.find<LocalizationController>()
                                                  .currentLocale
                                                  .value
                                                  .languageCode ==
                                              'ar'
                                          ? reg.subject!.name
                                          : reg.subject!.enName ?? "",
                                  "Failed subject".tr: (reg) =>
                                      reg.type == 1 ? "Yes".tr : "No".tr ?? "",
                                },
                                fileName: "Curriculum".tr +
                                    '${DateTime.now().toIso8601String()}',
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
              ),
            ),
        if (Get.find<Add_Data_controller>().roll != "observer")
          if (screenWidth <= 769)
            Container(
              width: screenWidth,
              margin: const EdgeInsets.only(left: 30.0, right: 30.0, top: 30.0),
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  spacing: 15.0,
                  children: [
                    Row(
                      spacing: 15.0,
                      children: [
                        GetBuilder<Subject_Controller>(builder: (controller) {
                          return DropDownCurriMgmt(
                            Isloading: controller.isLoading,
                            title: "Subject".tr,
                            width: 250,
                            type: "Subject",
                          );
                        }),
                        // DropDownCurriMgmt(
                        //   Isloading: false,
                        //   title: "Semester".tr,
                        //   width: 250,
                        //   type: "semester",
                        // ),
                        GetBuilder<Curriculumn_Controller>(
                            builder: (controller) {
                          return TextFormSearch(
                            click: () {
                              controller.clearFilter();
                            },
                            onchange: (value) {
                              // controller.searchByName(
                              //     value,
                              //     controller.semesterIndex,
                              //     controller.subjectIndex);
                              controller.searchByName(
                                  value, controller.subjectIndex);
                            },
                            width: 250,
                            radius: 5,
                            controller: search,
                            suffixIcon:
                                search.text != "" ? Icons.clear : Icons.search,
                          );
                        }),
                      ],
                    ),
                    Row(
                      spacing: 15.0,
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
                                var controller =
                                    Get.find<Curriculumn_Controller>();
                                controller.initialAddCurr();
                                name.clear();
                                enname.clear();
                                max.clear();
                                Passing.clear();
                                Get.dialog(
                                  Add_Curr(),
                                  barrierDismissible: false,
                                );
                              },
                              icon: Icon(Icons.add,
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
                                exportDataToPdf<Curriculum>(
                                  items: Get.find<Curriculumn_Controller>()
                                      .filteredCurriculum!,
                                  headers: [
                                    "Name".tr,
                                    "English Name".tr,
                                    "Max Mark".tr,
                                    "Passing Mark".tr,
                                    "Subject".tr,
                                    "Failed subject".tr,
                                  ],
                                  fieldMappings: {
                                    "Name".tr: (reg) => reg.name ?? "",
                                    "English Name".tr: (reg) =>
                                        reg.enName ?? "",
                                    "Max Mark".tr: (reg) => reg.maxMark ?? "",
                                    "Passing Mark".tr: (reg) =>
                                        reg.passingMark ?? "",
                                    "Subject".tr: (reg) =>
                                        Get.find<LocalizationController>()
                                                    .currentLocale
                                                    .value
                                                    .languageCode ==
                                                'ar'
                                            ? reg.subject!.name
                                            : reg.subject!.enName ?? "",
                                    "Failed subject".tr: (reg) => reg.type == 1
                                        ? "Yes".tr
                                        : "No".tr ?? "",
                                  },
                                  fileName: "Curriculum".tr +
                                      '${DateTime.now().toIso8601String()}',
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
                                exportDataToExcel<Curriculum>(
                                  items: Get.find<Curriculumn_Controller>()
                                      .filteredCurriculum!,
                                  headers: [
                                    "Name".tr,
                                    "English Name".tr,
                                    "Max Mark".tr,
                                    "Passing Mark".tr,
                                    "Subject".tr,
                                    "Failed subject".tr,
                                  ],
                                  fieldMappings: {
                                    "Name".tr: (reg) => reg.name ?? "",
                                    "English Name".tr: (reg) =>
                                        reg.enName ?? "",
                                    "Max Mark".tr: (reg) => reg.maxMark ?? "",
                                    "Passing Mark".tr: (reg) =>
                                        reg.passingMark ?? "",
                                    "Subject".tr: (reg) =>
                                        Get.find<LocalizationController>()
                                                    .currentLocale
                                                    .value
                                                    .languageCode ==
                                                'ar'
                                            ? reg.subject!.name
                                            : reg.subject!.enName ?? "",
                                    "Failed subject".tr: (reg) => reg.type == 1
                                        ? "Yes".tr
                                        : "No".tr ?? "",
                                  },
                                  fileName: "Curriculum".tr +
                                      '${DateTime.now().toIso8601String()}',
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
                ),
              ),
            ),
        Expanded(
            child: Padding(
          padding: const EdgeInsets.only(top: 15.0),
          child: CurriculumGrid(),
        )),
      ],
    ));
  }
}
