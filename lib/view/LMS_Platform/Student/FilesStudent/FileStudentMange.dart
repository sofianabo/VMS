import 'package:flutter/material.dart';
import 'package:flutter_dropzone/flutter_dropzone.dart';
import 'package:get/get.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:vms_school/Link/API/LMS_APIs/Admin/Get_All_Curr_LMS.dart';
import 'package:vms_school/Link/API/LMS_APIs/Admin/Get_LMS_Files.dart';
import 'package:vms_school/Link/Controller/LMS_Controllers/Admin_LMS/Files_Controller.dart';
import 'package:vms_school/view/Both_Platform/widgets/TextFormSearch.dart';
import 'package:vms_school/view/LMS_Platform/Student/FilesStudent/FileStudentGrid.dart';
import 'package:vms_school/view/LMS_Platform/Widget/File_LMS_DropDown.dart';

class Filestudentmange extends StatefulWidget {
  const Filestudentmange({super.key});

  @override
  State<Filestudentmange> createState() => _FilestudentmangeState();
}

class _FilestudentmangeState extends State<Filestudentmange> {
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
                    File_LMS_DropDown(
                      Isloading: controller.isCuriculmLoading,
                      title: "Curriculum".tr,
                      width: 250,
                      type: "curriculum",
                    ),
                 
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
          return Filestudentgrid();
        }),
      ],
    );
  }

}
