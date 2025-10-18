import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_dropzone/flutter_dropzone.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:vms_school/Link/API/API.dart';
import 'package:vms_school/Link/API/LMS_APIs/Admin/DeleteHomeworlLMSAPI.dart';
import 'package:vms_school/Link/API/LMS_APIs/StudentLms/UploadStudentHomeworkAPI.dart';
import 'package:vms_school/Link/Controller/LMS_Controllers/Admin_LMS/Curr_LMS_Controller.dart';
import 'package:vms_school/Link/Controller/LMS_Controllers/Admin_LMS/HomeworkController.dart';
import 'package:vms_school/Link/Controller/LMS_Controllers/Admin_LMS/Selected_Screen.dart';
import 'package:vms_school/Link/Controller/LMS_Controllers/StudentLMSController.dart/StudentHomeworkController.dart';
import 'package:vms_school/Translate/local_controller.dart';
import 'package:vms_school/main.dart';
import 'package:vms_school/view/Both_Platform/widgets/ButtonsDialog.dart';
import 'package:vms_school/view/Both_Platform/widgets/GridAnimation.dart';
import 'package:vms_school/view/Both_Platform/widgets/PDF_View.dart';
import 'package:vms_school/view/Both_Platform/widgets/Schema_Widget.dart';
import 'package:vms_school/view/Both_Platform/widgets/VMSAlertDialog.dart';

class Homeworkstudentgrid extends StatelessWidget {
  const Homeworkstudentgrid({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    DropzoneViewController? ctrl;

    int getCrossAxisCount() {
      if (screenWidth >= 1400) return 5;
      if (screenWidth >= 1150) return 4;
      if (screenWidth >= 950) return 3;
      if (screenWidth >= 769) return 2;
      return 1;
    }

    double getChildAspectRatio() {
      if (screenWidth >= 1150) return 1.1;
      if (screenWidth >= 950) return 1.1;
      if (screenWidth >= 838) return 1.6;
      if (screenWidth >= 769) return 1.5;
      if (screenWidth >= 613) return 1.8;
      if (screenWidth >= 486) return 1.7;
      return 1.2;
    }

    return Directionality(
      textDirection:
          Get.find<LocalizationController>().currentLocale.value.languageCode ==
                  'ar'
              ? TextDirection.rtl
              : TextDirection.ltr,
      child: GetBuilder<Studenthomeworkcontroller>(builder: (control) {
        return control.isLoading
            ? GridView.builder(
                padding: const EdgeInsets.only(top: 10, left: 40, right: 40),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: getCrossAxisCount(),
                    crossAxisSpacing: 20.0,
                    mainAxisSpacing: 20.0,
                    childAspectRatio: getChildAspectRatio()),
                itemCount: 10,
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
                            SchemaWidget(width: 35, height: 35),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                SchemaWidget(width: 20, height: 15),
                              ],
                            ),
                            SchemaWidget(width: 25, height: 15),
                            SchemaWidget(width: 25, height: 15),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                SchemaWidget(width: 25, height: 15),
                                SchemaWidget(width: 20, height: 20),
                              ],
                            )
                          ],
                        )),
                  )
                      .animate(onPlay: (controller) => controller.repeat())
                      .shimmer(
                          angle: 1,
                          color: Colors.grey.withOpacity(0.2),
                          duration: const Duration(seconds: 1),
                          delay: const Duration(seconds: 1));
                },
              )
            : control.filteredhomework.isNotEmpty
                ? GridView.builder(
                    padding:
                        const EdgeInsets.only(top: 10, left: 40, right: 40),
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: getCrossAxisCount(),
                        crossAxisSpacing: 20.0,
                        mainAxisSpacing: 20.0,
                        childAspectRatio: getChildAspectRatio()),
                    itemCount: control.filteredhomework.length,
                    itemBuilder: (context, index) {
                      return HoverScaleCard(
                        child: GestureDetector(
                          onTap: () async {
                            openFileInNewTab(
                                filePath:
                                    '$getpdf${control.filteredhomework[index].fileId}');
                          },
                          child: Container(
                              padding: const EdgeInsets.all(20),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5),
                                  border: Border.all(
                                      color: Theme.of(context)
                                          .textTheme
                                          .titleMedium!
                                          .color!,
                                      width: 0.5),
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
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Container(
                                        alignment: Alignment.center,
                                        width: 180,
                                        child: Text(
                                            "${control.filteredhomework[index].name}",
                                            style: Theme.of(context)
                                                .textTheme
                                                .titleMedium!
                                                .copyWith(
                                                  fontSize: 20,
                                                )),
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 22,
                                  ),
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    spacing: 5.0,
                                    children: [
                                      Text(
                                          Get.find<LocalizationController>()
                                                      .currentLocale
                                                      .value
                                                      .languageCode ==
                                                  'ar'
                                              ? "${control.filteredhomework[index].homeworkeCurriculum!.name}"
                                              : "${control.filteredhomework[index].homeworkeCurriculum!.enName}",
                                          style: Theme.of(context)
                                              .textTheme
                                              .titleMedium!
                                              .copyWith(
                                                  fontWeight: FontWeight.normal,
                                                  fontSize: 14)),
                                      Text(
                                          "Mark".tr +
                                              ": " +
                                              "${control.filteredhomework[index].mark}",
                                          style: Theme.of(context)
                                              .textTheme
                                              .titleMedium!
                                              .copyWith(
                                                  fontWeight: FontWeight.normal,
                                                  fontSize: 14)),
                                      Text(
                                          "HomeWork Submission Date".tr +
                                              ": " +
                                              "${control.filteredhomework[index].lastDate}",
                                          style: Theme.of(context)
                                              .textTheme
                                              .titleMedium!
                                              .copyWith(
                                                  fontWeight: FontWeight.normal,
                                                  fontSize: 14)),
                                                                       control.filteredhomework[index].state==true?
                                                        Text("Upload is done".tr)
:                            
                                      TextButton(
                                          style: ButtonStyle(
                                            backgroundColor:
                                                WidgetStatePropertyAll(
                                                    Get.theme.primaryColor),
                                          ),
                                          onPressed: () {
                                            Get.find<Studenthomeworkcontroller>()
                                                .reset();
                                            Get.find<Studenthomeworkcontroller>()
                                                .resetError();
                                            control.updateFieldError(
                                                "file", false);

                                            Get.dialog(
                                                barrierDismissible: false,
                                                GetBuilder<Studenthomeworkcontroller>(
                                                    builder: (controll) {
                                              return VMSAlertDialog(
                                                  action: [
                                                    Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment.end,
                                                      children: [
                                                               ButtonDialog(
                                                            width: 150,
                                                            text:
                                                                "Upload Homework"
                                                                    .tr,
                                                            onPressed:
                                                                () async {
                                                              bool isfileEmpty =
                                                                  controll.selectedFile
                                                                          .value ==
                                                                      null;

                                                              controll
                                                                  .updateFieldError(
                                                                      "file",
                                                                      isfileEmpty);

                                                              if (!(isfileEmpty)) {
                                                                await Uploadstudenthomeworkapi(
                                                                        context)
                                                                    .Addfilehomework(
                                                                  file: controll
                                                                      .selectedFile
                                                                      .value,
                                                                  homeworkId:controll
                                                                      .filteredhomework[index]
                                                                      .id,
                                                                );
                                                              }
                                                            },
                                                            color: Theme.of(
                                                                    context)
                                                                .primaryColor)
                                                      ],
                                                    )
                                                  ],
                                                  contents: SizedBox(
                                                    width: 400,
                                                    child:
                                                        SingleChildScrollView(
                                                      child: Column(
                                                        mainAxisSize:
                                                            MainAxisSize.min,
                                                        children: [
                                                          Padding(
                                                            padding:
                                                                const EdgeInsets
                                                                    .only(
                                                                    top: 10.0),
                                                            child: Wrap(
                                                              spacing: 20.0,
                                                              runSpacing: 20.0,
                                                              crossAxisAlignment:
                                                                  WrapCrossAlignment
                                                                      .center,
                                                              children: [
                                                                GestureDetector(
                                                                  onTap: () {
                                                                    controll
                                                                        .pickPDFFile();
                                                                  },
                                                                  child:
                                                                      AnimatedContainer(
                                                                    duration: const Duration(
                                                                        milliseconds:
                                                                            500),
                                                                    decoration:
                                                                        BoxDecoration(
                                                                      borderRadius: const BorderRadius
                                                                          .all(
                                                                          Radius.circular(
                                                                              5)),
                                                                      border: control
                                                                              .IsFileError
                                                                          ? Border.all(
                                                                              color: Colors.redAccent)
                                                                          : Border.all(color: const Color(0xffD9D9D9)),
                                                                      color: control.isHoveringFile
                                                                          ? Theme.of(context)
                                                                              .primaryColor
                                                                          : Get
                                                                              .theme
                                                                              .cardColor,
                                                                    ),
                                                                    alignment:
                                                                        Alignment
                                                                            .center,
                                                                    width: 350,
                                                                    height: 100,
                                                                    child:
                                                                        Stack(
                                                                      children: [
                                                                        DropzoneView(
                                                                          operation:
                                                                              DragOperation.copy,
                                                                          cursor:
                                                                              CursorType.Default,
                                                                          onCreated:
                                                                              (DropzoneViewController controller) {
                                                                            ctrl =
                                                                                controller;
                                                                          },
                                                                          onHover:
                                                                              () {
                                                                            controll.updateHoverFile(true);
                                                                          },
                                                                          onLeave:
                                                                              () {
                                                                            controll.updateHoverFile(false);
                                                                          },
                                                                          onDropFiles:
                                                                              (List<DropzoneFileInterface>? files) async {
                                                                            if (files != null &&
                                                                                files.length == 1) {
                                                                              final file = files.first;
                                                                              final mimeType = await ctrl?.getFileMIME(file);
                                                                              final fileName = await ctrl?.getFilename(file);
                                                                              final fileBytes = await ctrl?.getFileData(file);

                                                                              if (mimeType == 'application/pdf' || fileName!.toLowerCase().endsWith('.pdf') || fileName.toLowerCase().endsWith('.jpg') || fileName.toLowerCase().endsWith('.jpeg')) {
                                                                                controll.selectedFile.value = fileBytes;
                                                                                controll.fileName.value = fileName!;
                                                                                controll.updateTextFile("File Successfully Dropped!".tr);
                                                                                controll.updateFieldError("file", false);
                                                                              } else {
                                                                                controll.updateTextFile("Error: Unsupported File Type.".tr);
                                                                                controll.updateFieldError("file", true);
                                                                              }
                                                                            } else {
                                                                              controll.updateTextFile("Error: Only One File Is Allowed.".tr);
                                                                              controll.updateFieldError("file", true);
                                                                            }
                                                                          },
                                                                        ),
                                                                        Center(
                                                                          child: controll.selectedFile.value != null
                                                                              ? IconButton(
                                                                                  onPressed: () {
                                                                                    controll.Clearfile();
                                                                                  },
                                                                                  icon: Icon(
                                                                                    Icons.delete_outline_outlined,
                                                                                    color: Colors.redAccent,
                                                                                  ))
                                                                              : Text(
                                                                                  textAlign: TextAlign.center,
                                                                                  control.fileStatus,
                                                                                  style: TextStyle(
                                                                                    color: control.isHoveringFile ? Colors.white : const Color(0xffCBBFBF),
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
                                                  apptitle: "Upload Homework".tr + " (${control.filteredhomework[index].name})",
                                                  subtitle: "");
                                            }));
                                          },
                                          child: Text(
                                            "Upload Homework".tr,
                                            style:
                                                Get.theme.textTheme.bodyMedium,
                                          ))
                                    ],
                                  ),
                                ],
                              )),
                        ),
                      );
                    },
                  )
                : Center(
                    child: Text("No Homework".tr,
                        style: Theme.of(context).textTheme.titleLarge!.copyWith(
                            fontSize: 22, fontWeight: FontWeight.normal)));
      }),
    );
  }
}
