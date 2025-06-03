import 'package:flutter/material.dart';
import 'package:flutter_dropzone/flutter_dropzone.dart';
import 'package:get/get.dart';
import 'package:vms_school/Link/API/LMS_APIs/Admin/Get_All_Curr_LMS.dart';
import 'package:vms_school/Link/API/LMS_APIs/Admin/Get_Subject_LMS.dart';
import 'package:vms_school/Link/Controller/AdminController/Employee_Controllers/Add_Data_controller.dart';
import 'package:vms_school/Link/Controller/AdminController/School_Controllers/Subject_Controller.dart';
import 'package:vms_school/Link/Controller/LMS_Controllers/Admin_LMS/Curr_LMS_Controller.dart';
import 'package:vms_school/Link/Controller/LMS_Controllers/Admin_LMS/HomeworkController.dart';
import 'package:vms_school/Link/Controller/LMS_Controllers/Admin_LMS/Subject_LMS_Controller.dart';
import 'package:vms_school/view/Both_Platform/website/Home.dart';
import 'package:vms_school/view/Both_Platform/widgets/ButtonsDialog.dart';
import 'package:vms_school/view/Both_Platform/widgets/Calender.dart';
import 'package:vms_school/view/Both_Platform/widgets/Squer_Button_Enabled_Disabled.dart';
import 'package:vms_school/view/Both_Platform/widgets/TextFildWithUpper.dart';
import 'package:vms_school/view/Both_Platform/widgets/TextFormSearch.dart';
import 'package:vms_school/view/Both_Platform/widgets/VMSAlertDialog.dart';
import 'package:vms_school/view/LMS_Platform/Admin/LMS_Pages/Curriculum_LMS/Curriculum_Grid.dart';
import 'package:vms_school/view/LMS_Platform/Admin/LMS_Pages/Division_LMS/HomeworkGrid.dart';
import 'package:vms_school/view/LMS_Platform/Widget/Curr_DropDown.dart';
import 'package:vms_school/view/LMS_Platform/Widget/DivisionScreenDropdown.dart';

class Homeworkmanagement extends StatefulWidget {
  const Homeworkmanagement({super.key});

  @override
  State<Homeworkmanagement> createState() => _HomeworkmanagementState();
}

class _HomeworkmanagementState extends State<Homeworkmanagement> {
  TextEditingController search = TextEditingController();
  TextEditingController name = TextEditingController();
  DropzoneViewController? ctrl;
  @override
  void initState() {
    Get_LMS_Curriculm_API().Get_LMS_Curriculm();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return Expanded(
        child: Column(
      children: [
        if (Get.find<Add_Data_controller>().roll != "observer")
          if (screenWidth > 769)
            GetBuilder<Homeworkcontroller>(builder: (controller) {
              return Container(
                width: screenWidth,
                margin:
                    const EdgeInsets.only(left: 40.0, right: 40.0, top: 0.0),
                child: Row(
                  spacing: 15.0,
                  crossAxisAlignment: CrossAxisAlignment.center,
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
                      suffixIcon:
                          search.text != "" ? Icons.clear : Icons.search,
                    ),
                    Divisionscreendropdown(
                      Isloading: controller.isLoading,
                      title: "Curriculum".tr,
                      width: 250,
                      type: "curriculum",
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
                            Get.find<Homeworkcontroller>().reset();

                            controller.updateFieldError("arname", false);
                            controller.updateFieldError("file", false);

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
        if (Get.find<Add_Data_controller>().roll != "observer")
          if (screenWidth <= 769)
            GetBuilder<Homeworkcontroller>(builder: (controller) {
              return Container(
                width: screenWidth,
                margin:
                    const EdgeInsets.only(left: 30.0, right: 30.0, top: 10.0),
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    spacing: 15.0,
                    children: [
                      Row(
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
                                  name.text = "";
                                  Get.find<Homeworkcontroller>().reset();

                                  controller.updateFieldError("arname", false);
                                  controller.updateFieldError("file", false);

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
                    ],
                  ),
                ),
              );
            }),
        Expanded(
            child: Padding(
          padding: const EdgeInsets.only(top: 15.0),
          child: Text("data"),
        )),
      ],
    ));
  }

  AddFileHomeworkDialog() {
    return GetBuilder<Homeworkcontroller>(builder: (controller) {
      return VMSAlertDialog(
          contents: SizedBox(
            width: 550,
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Wrap(
                    spacing: 20.0,
                    runSpacing: 20.0,
                    crossAxisAlignment: WrapCrossAlignment.center,
                    children: [
                      Textfildwithupper(
                          isRequired: true,
                          onChanged: (value) {
                            if (value.isNotEmpty) {
                              controller.updateFieldError("aname", false);
                            }
                          },
                          width: 350,
                          controller: name,
                          Uptext: "Name".tr,
                          hinttext: "Name".tr),
                      Divisionscreendropdown(
                        Isloading: controller.isLoading,
                        title: "Curriculum".tr,
                        width: 350,
                        type: "currDialog",
                      ),
                      HomeWorkSubmissionDate(
                        Uptext: "HomeWork Submission Date".tr,
                        width: 350,
                        isRequired: true,
                      )
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
                                              .endsWith('.pdf')) {
                                        controller.selectedFile.value =
                                            fileBytes;
                                        controller.fileName.value = fileName!;
                                        controller.updateTextFile(
                                            "PDF File Successfully Dropped!"
                                                .tr);
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
                      bool isfileEmpty = controller.selectedFile.value == null;

                      controller.updateFieldError("file", isfileEmpty);

                      if (!(isArNameEmpty || isfileEmpty)) {
                        // await Add_E_Book_API(context).Add_E_Book(
                        //   file: controller.selectedFile.value,
                        //   name: name.text,
                        //   enName: enName.text,
                        // );
                        controller.selectedFile.value!.clear();
                        name.clear();
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
