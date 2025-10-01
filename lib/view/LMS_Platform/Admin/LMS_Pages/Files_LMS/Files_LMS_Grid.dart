import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:get/get.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:vms_school/Link/API/API.dart';
import 'package:vms_school/Link/API/DownloadFiles.dart';
import 'package:vms_school/Link/API/LMS_APIs/Admin/DeleteFileLMSAPI.dart';
import 'package:vms_school/Link/API/LMS_APIs/Admin/ShowAndHiddenFileLmsAPI.dart';
import 'package:vms_school/Link/Controller/AdminController/Employee_Controllers/Add_Data_controller.dart';
import 'package:vms_school/Link/Controller/LMS_Controllers/Admin_LMS/Files_Controller.dart';
import 'package:vms_school/Translate/local_controller.dart';
import 'package:vms_school/view/Both_Platform/widgets/ButtonsDialog.dart';
import 'package:vms_school/view/Both_Platform/widgets/GridAnimation.dart';
import 'package:vms_school/view/Both_Platform/widgets/PDF_View.dart';
import 'package:vms_school/view/Both_Platform/widgets/Schema_Widget.dart';
import 'package:vms_school/view/Both_Platform/widgets/Squer_Button_Enabled_Disabled.dart';
import 'package:vms_school/view/Both_Platform/widgets/VMSAlertDialog.dart';

class Files_LMS_Grid extends StatefulWidget {
  const Files_LMS_Grid({super.key});

  @override
  State<Files_LMS_Grid> createState() => _LmsStudentsgridState();
}

class _LmsStudentsgridState extends State<Files_LMS_Grid> {
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return Expanded(
      child: SingleChildScrollView(
        child: Directionality(
          textDirection: Get.find<LocalizationController>()
                      .currentLocale
                      .value
                      .languageCode ==
                  'ar'
              ? TextDirection.rtl
              : TextDirection.ltr,
          child: GetBuilder<Files_Controller>(builder: (controller) {
            return SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Container(
                width: screenWidth >= 768 ? screenWidth - 70 : 800,
                padding: EdgeInsets.only(left: 20, right: 20.0, bottom: 20.0),
                margin: EdgeInsets.only(left: 30, right: 30.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(5)),
                  color: Get.theme.cardColor,
                ),
                child: ListView.builder(
                  reverse: true,
                  shrinkWrap: true,
                  itemCount: controller.filtered_files_LMS.length,
                  itemBuilder: (context, index) {
                    return Column(
                      children: [
                        Padding(
                          padding:
                              const EdgeInsets.only(top: 15.0, bottom: 15.0),
                          child: Row(
                            spacing: 15.0,
                            children: [
                              Expanded(
                                  child: Text(
                                      "${controller.filtered_files_LMS[index].name}")),
                              Padding(
                                padding: const EdgeInsets.only(
                                    left: 20.0, right: 20.0),
                                child: Text(Get.find<LocalizationController>()
                                            .currentLocale
                                            .value
                                            .languageCode ==
                                        'ar'
                                    ? "( ${controller.filtered_files_LMS[index].curriculmFile!.name} )"
                                    : "( ${controller.filtered_files_LMS[index].curriculmFile!.enName} )"),
                              ),
                              TextButton(
                                  onPressed: () {
                                    if (controller
                                            .filtered_files_LMS[index].hidden ==
                                        1) {
                                      Showandhiddenfilelmsapi(context)
                                          .Showandhiddenfilelms(
                                        hidden: false,
                                        id: controller
                                            .filtered_files_LMS![index].id,
                                      );
                                    } else {
                                      Showandhiddenfilelmsapi(context)
                                          .Showandhiddenfilelms(
                                        hidden: true,
                                        id: controller
                                            .filtered_files_LMS![index].id,
                                      );
                                    }
                                  },
                                  child: Text(
                                    controller.filtered_files_LMS[index]
                                                .hidden ==
                                            1
                                        ? "Show File".tr
                                        : "Hide File".tr,
                                    style: Get.theme.textTheme.titleMedium!
                                        .copyWith(fontSize: 14),
                                  )),
                              Squer_Button_Enabled_Disabled(
                                  validate:
                                      !(Get.find<Add_Data_controller>().roll !=
                                          "observer"),
                                  icon: Icons.open_in_new_rounded,
                                  onTap: () {
                                    openFileInNewTab(
                                        filePath:
                                            '$getpdf${controller.filtered_files_LMS[index].fileId}');
                                  }),
                              Squer_Button_Enabled_Disabled(
                                  validate:
                                      !(Get.find<Add_Data_controller>().roll !=
                                          "observer"),
                                  icon: Icons.file_download_outlined,
                                  onTap: () {
                                    final url =
                                        '$getimage${controller.filtered_files_LMS[index].fileId}}';
                                    downloader.downloadFile(url,
                                        '${controller.filtered_files_LMS[index].name.toString().trim().replaceAll(" ", "_")}.pdf');
                                  }),
                              Squer_Button_Enabled_Disabled(
                                  validate:
                                      !(Get.find<Add_Data_controller>().roll !=
                                          "observer"),
                                  icon: Icons.delete_outline_outlined,
                                  onTap: () {
                                    Get.dialog(VMSAlertDialog(
                                        action: [
                                          ButtonDialog(
                                              text: "Delete".tr,
                                              onPressed: () async {
                                                Deletefilelmsapi(context)
                                                    .Deletefilelms(
                                                  id: controller
                                                      .filtered_files_LMS![
                                                          index]
                                                      .id,
                                                );
                                              },
                                              color: const Color(0xffB03D3D),
                                              width: 80),
                                          ButtonDialog(
                                              text: "Cancel".tr,
                                              onPressed: () {
                                                Get.back();
                                              },
                                              color: Theme.of(context)
                                                  .primaryColor,
                                              width: 80)
                                        ],
                                        contents: Column(
                                          mainAxisSize: MainAxisSize.min,
                                          children: [
                                            Container(
                                              width: 400,
                                            ),
                                            Row(
                                              children: [
                                                Text(
                                                  "Do You Want To deletefiles"
                                                          .tr +
                                                      " (${controller.filtered_files_LMS![index].name}) " +
                                                      "filee".tr,
                                                  style: Get.theme.textTheme
                                                      .bodyMedium!
                                                      .copyWith(
                                                          fontSize: 16,
                                                          fontWeight: FontWeight
                                                              .normal),
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                        apptitle: "Delete File".tr,
                                        subtitle: "none"));
                                  }),
                            ],
                          ),
                        ),
                        Divider(
                          height: 2,
                          color: Get.theme.textTheme.titleMedium!.color,
                        )
                      ],
                    );
                  },
                ),
              ),
            );
          }),
        ),
      ),
    );
  }
}
