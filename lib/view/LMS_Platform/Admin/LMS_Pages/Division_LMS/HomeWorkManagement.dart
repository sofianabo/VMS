import 'package:flutter/material.dart';
import 'package:flutter_dropzone/flutter_dropzone.dart';
import 'package:get/get.dart';
import 'package:vms_school/Link/API/LMS_APIs/Admin/AddFileHomeWorkAPI.dart';
import 'package:vms_school/Link/API/LMS_APIs/Admin/Get_All_Curr_LMS.dart';
import 'package:vms_school/Link/Controller/AdminController/Employee_Controllers/Add_Data_controller.dart';
import 'package:vms_school/Link/Controller/LMS_Controllers/Admin_LMS/HomeworkController.dart';
import 'package:vms_school/Link/Controller/LMS_Controllers/Admin_LMS/Selected_Screen.dart';
import 'package:vms_school/view/Both_Platform/widgets/ButtonsDialog.dart';
import 'package:vms_school/view/Both_Platform/widgets/Calender.dart';
import 'package:vms_school/view/Both_Platform/widgets/TextFildWithUpper.dart';
import 'package:vms_school/view/Both_Platform/widgets/TextFormSearch.dart';
import 'package:vms_school/view/Both_Platform/widgets/VMSAlertDialog.dart';
import 'package:vms_school/view/LMS_Platform/Admin/LMS_Pages/Division_LMS/HomeworkGrid.dart';
import 'package:vms_school/view/LMS_Platform/Widget/DivisionScreenDropdown.dart';

class Homeworkmanagement extends StatefulWidget {
  const Homeworkmanagement({super.key});

  @override
  State<Homeworkmanagement> createState() => _HomeworkmanagementState();
}

class _HomeworkmanagementState extends State<Homeworkmanagement> {
  TextEditingController search = TextEditingController();
  TextEditingController name = TextEditingController();
  TextEditingController mark = TextEditingController();
  DropzoneViewController? ctrl;
  @override
  void initState() {
    Get_LMS_Curriculm_API().Get_LMS_Curriculm();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return Column(
      children: [
        if (screenWidth > 769)
          GetBuilder<Homeworkcontroller>(builder: (controller) {
            return Container(
              width: screenWidth,
              margin: const EdgeInsets.only(left: 40.0, right: 40.0, top: 0.0),
              child: Row(
                spacing: 15.0,
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  TextFormSearch(
                    click: () {
                      controller.clearFilter();
                    },
                    onchange: (value) {
                      controller.searchByName(
                        value,
                        controller.currindex,
                      );
                    },
                    width: screenWidth - 400,
                    radius: 5,
                    controller: search,
                    suffixIcon: search.text != "" ? Icons.clear : Icons.search,
                  ),
                  Divisionscreendropdown(
                    Isloading: controller.isCuriculmLoading,
                    title: "Curriculum".tr,
                    width: 250,
                    type: "curriculum",
                  ),
                  if (Get.find<Add_Data_controller>().roll != "observer")
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
                      child: PopupMenuButton(
                        style: ButtonStyle(
                            backgroundColor: WidgetStatePropertyAll(
                                Theme.of(context).cardColor),
                            shape: const WidgetStatePropertyAll(
                                RoundedRectangleBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(5))))),
                        tooltip: "",
                        child: Icon(Icons.add,
                            size: 18,
                            color: Theme.of(context)
                                .textTheme
                                .titleMedium!
                                .color!),
                        onSelected: (value) async {
                          if (value == "File Homework".tr) {
                            name.text = "";
                            mark.text = "";
                            Get.find<Homeworkcontroller>().reset();
                            Get.find<Homeworkcontroller>().resetError();

                            controller.updateFieldError("arname", false);
                            controller.updateFieldError("file", false);
                            controller.updateFieldError("birth", false);
                            controller.updateFieldError("curr", false);
                            controller.updateFieldError("mark", false);

                            Get.dialog(AddFileHomeworkDialog(),
                                barrierDismissible: false);
                          }
                          if (value == "Questions Homework".tr) {
                            // Get.find<Allempolyeecontroller>().reset();
                            // Get.dialog(
                            //   Add_Full_Employee(),
                            //   barrierDismissible: false,
                            // );
                          }
                        },
                        itemBuilder: (BuildContext context) =>
                            <PopupMenuEntry<String>>[
                          PopupMenuItem<String>(
                              value: 'File Homework'.tr,
                              child: Text(
                                'File Homework'.tr,
                              )),
                          PopupMenuItem<String>(
                              value: 'Questions Homework'.tr,
                              child: Text('Questions Homework'.tr)),
                        ],
                      ),
                    ),
                ],
              ),
            );
          }),
        if (screenWidth <= 769)
          GetBuilder<Homeworkcontroller>(builder: (controller) {
            return Container(
              width: screenWidth,
              margin: const EdgeInsets.only(left: 30.0, right: 30.0, top: 10.0),
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  spacing: 15.0,
                  children: [
                    TextFormSearch(
                      click: () {
                        controller.clearFilter();
                      },
                      onchange: (value) {
                        controller.searchByName(
                          value,
                          controller.currindex,
                        );
                      },
                      width: 250,
                      radius: 5,
                      controller: search,
                      suffixIcon:
                          search.text != "" ? Icons.clear : Icons.search,
                    ),
                    Divisionscreendropdown(
                      Isloading: controller.isLoading,
                      title: "Curriculum".tr,
                      width: 250,
                      type: "curriculum",
                    ),
                    if (Get.find<Add_Data_controller>().roll != "observer")
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
                        child: PopupMenuButton(
                          style: ButtonStyle(
                              backgroundColor: WidgetStatePropertyAll(
                                  Theme.of(context).cardColor),
                              shape: const WidgetStatePropertyAll(
                                  RoundedRectangleBorder(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(5))))),
                          tooltip: "",
                          child: Icon(Icons.add,
                              size: 18,
                              color: Theme.of(context)
                                  .textTheme
                                  .titleMedium!
                                  .color!),
                          onSelected: (value) async {
                            if (value == "File Homework".tr) {
                              name.clear();
                              mark.clear();
                              Get.find<Homeworkcontroller>().reset();
                              Get.find<Homeworkcontroller>().resetError();

                              controller.updateFieldError("arname", false);
                              controller.updateFieldError("file", false);
                              controller.updateFieldError("birth", false);
                              controller.updateFieldError("curr", false);
                              controller.updateFieldError("mark", false);

                              Get.dialog(AddFileHomeworkDialog(),
                                  barrierDismissible: false);
                            }
                            if (value == "Questions Homework".tr) {
                              // Get.find<Allempolyeecontroller>().reset();
                              // Get.dialog(
                              //   Add_Full_Employee(),
                              //   barrierDismissible: false,
                              // );
                            }
                          },
                          itemBuilder: (BuildContext context) =>
                              <PopupMenuEntry<String>>[
                            PopupMenuItem<String>(
                                value: 'File Homework'.tr,
                                child: Text(
                                  'File Homework'.tr,
                                )),
                            PopupMenuItem<String>(
                                value: 'Questions Homework'.tr,
                                child: Text('Questions Homework'.tr)),
                          ],
                        ),
                      ),
                  ],
                ),
              ),
            );
          }),
        Expanded(
            child: Padding(
          padding: const EdgeInsets.only(top: 15.0),
          child: Homeworkgrid(),
        )),
      ],
    );
  }

  AddFileHomeworkDialog() {
    return GetBuilder<Homeworkcontroller>(builder: (controller) {
      return VMSAlertDialog(
          contents: SizedBox(
            width: 400,
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Wrap(
                    spacing: 5.0,
                    runSpacing: 5.0,
                    crossAxisAlignment: WrapCrossAlignment.center,
                    runAlignment: WrapAlignment.center,
                    alignment: WrapAlignment.center,
                    children: [
                      Textfildwithupper(
                          isRequired: true,
                          onChanged: (value) {
                            if (value.isNotEmpty) {
                              controller.updateFieldError("aname", false);
                            }
                          },
                          width: 350,
                          isError: controller.IsAnameError,
                          controller: name,
                          Uptext: "Name".tr,
                          hinttext: "Name".tr),
                      Textfildwithupper(
                          fieldType: "number",
                          isRequired: true,
                          onChanged: (value) {
                            if (value.isNotEmpty) {
                              controller.updateFieldError("mark", false);
                            }
                          },
                          width: 350,
                          isError: controller.IsMarkError,
                          controller: mark,
                          Uptext: "Mark".tr,
                          hinttext: "Mark".tr),
                      Divisionscreendropdown(
                        Isloading: controller.isCuriculmDialogLoading,
                        title: "Curriculum".tr,
                        width: 350,
                        type: "currDialog",
                        isError: controller.iscurrError,
                      ),
                      HomeWorkSubmissionDate(
                        Uptext: "HomeWork Submission Date".tr,
                        width: 350,
                        isRequired: true,
                        isError: controller.isDateError,
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 10.0),
                    child: Wrap(
                      spacing: 20.0,
                      runSpacing: 20.0,
                      crossAxisAlignment: WrapCrossAlignment.center,
                      children: [
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
                                  : Get.theme.cardColor,
                            ),
                            alignment: Alignment.center,
                            width: 350,
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
                                              .endsWith('.pdf') ||
                                          fileName
                                              .toLowerCase()
                                              .endsWith('.jpg') ||
                                          fileName
                                              .toLowerCase()
                                              .endsWith('.jpeg')) {
                                        controller.selectedFile.value =
                                            fileBytes;
                                        controller.fileName.value = fileName!;
                                        controller.updateTextFile(
                                            "File Successfully Dropped!".tr);
                                        controller.updateFieldError(
                                            "file", false);
                                      } else {
                                        controller.updateTextFile(
                                            "Error: Unsupported File Type.".tr);
                                        controller.updateFieldError(
                                            "file", true);
                                      }
                                    } else {
                                      controller.updateTextFile(
                                          "Error: Only One File Is Allowed."
                                              .tr);
                                      controller.updateFieldError("file", true);
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
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          action: [
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                ButtonDialog(
                    width: 150,
                    text: "Add Homework".tr,
                    onPressed: () async {
                      bool isArNameEmpty = name.text.isEmpty;
                      bool ismarkEmpty = mark.text.isEmpty;
                      bool iscurrEmpty =
                          controller.selectdialog_CurrIndex.isEmpty ||
                              controller.selectdialog_CurrIndex == '';
                      bool isdateEmpty = controller.homeworkDate.value == null;
                      bool isfileEmpty = controller.selectedFile.value == null;

                      controller.updateFieldError("file", isfileEmpty);
                      controller.updateFieldError("curr", iscurrEmpty);
                      controller.updateFieldError("birth", isdateEmpty);
                      controller.updateFieldError("aname", isArNameEmpty);
                      controller.updateFieldError("mark", ismarkEmpty);

                      if (!(isArNameEmpty ||
                          isfileEmpty ||
                          iscurrEmpty ||
                          ismarkEmpty ||
                          isdateEmpty)) {
                        await Addfilehomeworkapi(context).Addfilehomework(
                            file: controller.selectedFile.value,
                            name: name.text,
                            curriculumId: controller.dialogCurrList
                                .indexOf(controller.selectdialog_CurrIndex),
                            divisionId: Get.find<Selected_Class_Controller>()
                                .divisionid,
                            endDate: controller.selectDate,
                            mark: mark.text);
                        // controller.selectedFile.value!.clear();
                        // name.clear();
                      }
                    },
                    color: Theme.of(context).primaryColor)
              ],
            )
          ],
          apptitle: "Add File HomeWork".tr,
          subtitle: "none");
    });
  }
}
