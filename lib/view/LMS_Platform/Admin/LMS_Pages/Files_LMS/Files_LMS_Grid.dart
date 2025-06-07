import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:get/get.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:vms_school/Link/API/API.dart';
import 'package:vms_school/Link/API/DownloadFiles.dart';
import 'package:vms_school/Link/Controller/AdminController/Employee_Controllers/Add_Data_controller.dart';
import 'package:vms_school/Link/Controller/LMS_Controllers/Admin_LMS/Files_Controller.dart';
import 'package:vms_school/Translate/local_controller.dart';
import 'package:vms_school/view/Both_Platform/widgets/GridAnimation.dart';
import 'package:vms_school/view/Both_Platform/widgets/PDF_View.dart';
import 'package:vms_school/view/Both_Platform/widgets/Schema_Widget.dart';
import 'package:vms_school/view/Both_Platform/widgets/Squer_Button_Enabled_Disabled.dart';

class Files_LMS_Grid extends StatefulWidget {
  const Files_LMS_Grid({super.key});

  @override
  State<Files_LMS_Grid> createState() => _LmsStudentsgridState();
}

class _LmsStudentsgridState extends State<Files_LMS_Grid> {
  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection:
          Get.find<LocalizationController>().currentLocale.value.languageCode ==
                  'ar'
              ? TextDirection.rtl
              : TextDirection.ltr,
      child: GetBuilder<Files_Controller>(builder: (controller) {
        return Container(
          padding: EdgeInsets.only(left: 20, right: 20.0, bottom: 20.0),
          margin: EdgeInsets.only(left: 30, right: 30.0),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(5)),
            color: Color(0xffF9F8FD),
          ),
          child: ListView.builder(
            reverse: true,
            shrinkWrap: true,
            itemCount: controller.filtered_files_LMS.length,
            itemBuilder: (context, index) {
              return Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 15.0, bottom: 15.0),
                    child: Row(
                      spacing: 15.0,
                      children: [
                        Expanded(
                            child: Text(
                                "${controller.filtered_files_LMS[index].name}")),
                        Padding(
                          padding:
                              const EdgeInsets.only(left: 20.0, right: 20.0),
                          child: Text(
                              "( ${controller.filtered_files_LMS[index].curriculmFile!.name} )"),
                        ),
                        TextButton(
                            onPressed: () {},
                            child: Text(
                                controller.filtered_files_LMS[index].hidden == 1
                                    ? "Show File".tr
                                    : "Hide File".tr)),
                        Squer_Button_Enabled_Disabled(
                            validate: !(Get.find<Add_Data_controller>().roll !=
                                "observer"),
                            icon: Icons.open_in_new_rounded,
                            onTap: () {
                              openFileInNewTab(
                                  filePath:
                                      '$getpdf${controller.filtered_files_LMS[index].fileId}');
                            }),
                        Squer_Button_Enabled_Disabled(
                            validate: !(Get.find<Add_Data_controller>().roll !=
                                "observer"),
                            icon: Icons.file_download_outlined,
                            onTap: () {
                              final url =
                                  '$getimage${controller.filtered_files_LMS[index].fileId}}';
                              downloadFile(url,
                                  '${controller.filtered_files_LMS[index].name.toString().trim().replaceAll(" ", "_")}.pdf');
                            }),
                        Squer_Button_Enabled_Disabled(
                            validate: !(Get.find<Add_Data_controller>().roll !=
                                "observer"),
                            icon: Icons.delete_outline_outlined,
                            onTap: () {}),
                      ],
                    ),
                  ),
                  Divider(
                    height: 2,
                    color: Get.theme.primaryColor,
                  )
                ],
              );
            },
          ),
        );
      }),
    );
  }
}
