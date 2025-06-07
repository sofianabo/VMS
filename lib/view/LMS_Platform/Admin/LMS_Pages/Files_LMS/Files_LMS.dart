import 'package:flutter/material.dart';
import 'package:flutter_dropzone/flutter_dropzone.dart';
import 'package:get/get.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:vms_school/Link/API/LMS_APIs/Admin/Add_File_LMS_API.dart';
import 'package:vms_school/Link/API/LMS_APIs/Admin/Get_All_Curr_LMS.dart';
import 'package:vms_school/Link/API/LMS_APIs/Admin/Get_LMS_Files.dart';
import 'package:vms_school/Link/Controller/AdminController/Employee_Controllers/Add_Data_controller.dart';
import 'package:vms_school/Link/Controller/LMS_Controllers/Admin_LMS/Files_Controller.dart';
import 'package:vms_school/view/Both_Platform/widgets/ButtonsDialog.dart';
import 'package:vms_school/view/Both_Platform/widgets/Squer_Button_Enabled_Disabled.dart';
import 'package:vms_school/view/Both_Platform/widgets/TextFildWithUpper.dart';
import 'package:vms_school/view/Both_Platform/widgets/VMSAlertDialog.dart';
import 'package:vms_school/view/LMS_Platform/Admin/LMS_Pages/Files_LMS/Files_LMS_Grid.dart';
import 'package:vms_school/view/Both_Platform/widgets/TextFormSearch.dart';
import 'package:vms_school/view/LMS_Platform/Widget/File_LMS_DropDown.dart';

class Files_LMS extends StatefulWidget {
  const Files_LMS({super.key});

  @override
  State<Files_LMS> createState() => _StudyYearStudentsState();
}

class _StudyYearStudentsState extends State<Files_LMS> {
  @override
  initState() {
    Get_LMS_Files_API().Get_LMS_Files();
    Get_LMS_Curriculm_API().Get_LMS_Curriculm();
    super.initState();
  }

  TextEditingController search = TextEditingController();
  TextEditingController name = TextEditingController();
  DropzoneViewController? ctrl;
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return Column(
      children: [
        if (screenWidth > 769)
          GetBuilder<Files_Controller>(builder: (controller) {
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
                  File_LMS_DropDown(
                    Isloading: controller.isCuriculmLoading,
                    title: "Curriculum".tr,
                    width: 250,
                    type: "curriculum",
                  ),
                  Squer_Button_Enabled_Disabled(
                      validate:
                          !(Get.find<Add_Data_controller>().roll != "observer"),
                      icon: Icons.add,
                      onTap: () {
                        name.clear();
                        Get.find<Files_Controller>().reset();
                        Get.find<Files_Controller>().resetError();

                        controller.updateFieldError("arname", false);
                        controller.updateFieldError("file", false);
                        controller.updateFieldError("birth", false);
                        controller.updateFieldError("curr", false);

                        Get.dialog(AddFileDialog(), barrierDismissible: false);
                      })
                ],
              ),
            );
          }),
        if (screenWidth <= 769)
          GetBuilder<Files_Controller>(builder: (controller) {
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
                    Squer_Button_Enabled_Disabled(
                        validate:
                            Get.find<Add_Data_controller>().roll != "observer",
                        icon: Icons.add,
                        onTap: () {
                          name.clear();
                          Get.find<Files_Controller>().reset();
                          Get.find<Files_Controller>().resetError();

                          controller.updateFieldError("arname", false);
                          controller.updateFieldError("file", false);
                          controller.updateFieldError("birth", false);
                          controller.updateFieldError("curr", false);

                          Get.dialog(AddFileDialog(),
                              barrierDismissible: false);
                        })
                  ],
                ),
              ),
            );
          }),
        GetBuilder<Files_Controller>(builder: (controller) {
          if (controller.isLoading == true) {
            return Expanded(
              child: Center(
                  child: LoadingAnimationWidget.inkDrop(
                color: Theme.of(context).primaryColor,
                size: 60,
              )),
            );
          }
          if (controller.filtered_files_LMS.isEmpty) {
            return Expanded(
              child: Center(
                  child: Text("No Files".tr,
                      style: Theme.of(context).textTheme.titleLarge!.copyWith(
                          fontSize: 22, fontWeight: FontWeight.normal))),
            );
          }
          return Files_LMS_Grid();
        }),
      ],
    );
  }

  AddFileDialog() {
    return GetBuilder<Files_Controller>(builder: (controller) {
      return VMSAlertDialog(
          contents: SizedBox(
            width: 400,
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Column(
                    spacing: 10.0,
                    crossAxisAlignment: CrossAxisAlignment.center,
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
                      File_LMS_DropDown(
                        Isloading: controller.isCuriculmDialogLoading,
                        title: "Curriculum".tr,
                        width: 350,
                        type: "currDialog",
                        isError: controller.iscurrError,
                      ),
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
                                onCreated: (DropzoneViewController controller) {
                                  ctrl = controller;
                                },
                                onHover: () {
                                  controller.updateHoverFile(true);
                                },
                                onLeave: () {
                                  controller.updateHoverFile(false);
                                },
                                onDropFiles:
                                    (List<DropzoneFileInterface>? files) async {
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
                                      controller.selectedFile.value = fileBytes;
                                      controller.fileName.value = fileName!;
                                      controller.updateTextFile(
                                          "File Successfully Dropped!".tr);
                                      controller.updateFieldError(
                                          "file", false);
                                    } else {
                                      controller.updateTextFile(
                                          "Error: Unsupported File Type.".tr);
                                      controller.updateFieldError("file", true);
                                    }
                                  } else {
                                    controller.updateTextFile(
                                        "Error: Only One File Is Allowed.".tr);
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
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Checkbox(
                            checkColor: Colors.white,
                            value: controller.Hidden,
                            onChanged: (value) {
                              if (Get.find<Add_Data_controller>().roll !=
                                  "subAdmin") {
                                controller.updateHid(value!);
                              }
                            },
                          ),
                          Text("Is Hidden File".tr),
                        ],
                      ),
                    ],
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
                    text: "Add File".tr,
                    onPressed: () async {
                      bool isArNameEmpty = name.text.isEmpty;
                      bool iscurrEmpty =
                          controller.selectdialog_CurrIndex.isEmpty ||
                              controller.selectdialog_CurrIndex == '';
                      bool isfileEmpty = controller.selectedFile.value == null;

                      controller.updateFieldError("file", isfileEmpty);
                      controller.updateFieldError("curr", iscurrEmpty);
                      controller.updateFieldError("aname", isArNameEmpty);

                      if (!(isArNameEmpty || isfileEmpty || iscurrEmpty)) {
                        await Add_File_API().Add_File(
                          hidden: controller.Hidden,
                          file: controller.selectedFile.value,
                          name: name.text,
                          curriculumId: controller.dialogCurrList
                              .indexOf(controller.selectdialog_CurrIndex),
                        );
                      }
                    },
                    color: Theme.of(context).primaryColor)
              ],
            )
          ],
          apptitle: "Add File".tr,
          subtitle: "none");
    });
  }
}
