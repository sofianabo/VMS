import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vms_school/Link/API/LMS_APIs/Admin/Get_All_Curr_LMS.dart';
import 'package:vms_school/Link/API/LMS_APIs/Admin/Get_Subject_LMS.dart';
import 'package:vms_school/Link/Controller/AdminController/Employee_Controllers/Add_Data_controller.dart';
import 'package:vms_school/Link/Controller/AdminController/School_Controllers/Subject_Controller.dart';
import 'package:vms_school/Link/Controller/LMS_Controllers/Admin_LMS/Curr_LMS_Controller.dart';
import 'package:vms_school/Link/Controller/LMS_Controllers/Admin_LMS/Subject_LMS_Controller.dart';
import 'package:vms_school/view/Both_Platform/widgets/TextFormSearch.dart';
import 'package:vms_school/view/LMS_Platform/Admin/LMS_Pages/Curriculum_LMS/Curriculum_Grid.dart';
import 'package:vms_school/view/LMS_Platform/Widget/Curr_DropDown.dart';

class Curriculum_ManagementLMS extends StatefulWidget {
  const Curriculum_ManagementLMS({super.key});

  @override
  State<Curriculum_ManagementLMS> createState() =>
      _Curriculum_ManagementState();
}

class _Curriculum_ManagementState extends State<Curriculum_ManagementLMS> {
  TextEditingController search = TextEditingController();

  @override
  void initState() {
    Get_LMS_Curriculm_API().Get_LMS_Curriculm();
    Get_Subject_LMS_API().Get_Subject_LMS();
    Get.find<Curriculumn_LMS_Controller>().initialScreen();
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
            Container(
              width: screenWidth,
              margin: const EdgeInsets.only(left: 40.0, right: 40.0, top: 0.0),
              child: Row(
                spacing: 15.0,
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  GetBuilder<Subject_LMS_Controller>(builder: (controller) {
                    return DropDownLMSCurriMgmt(
                      Isloading: controller.isLoading,
                      title: "Subject".tr,
                      width: 250,
                      type: "Subject",
                    );
                  }),
                  DropDownLMSCurriMgmt(
                    Isloading: false,
                    title: "Semester".tr,
                    width: 250,
                    type: "semester",
                  ),
                  GetBuilder<Curriculumn_LMS_Controller>(builder: (controller) {
                    return TextFormSearch(
                      click: () {
                        controller.clearFilter();
                      },
                      onchange: (value) {
                        controller.searchByName(value, controller.semesterIndex,
                            controller.subjectIndex);
                      },
                      width: screenWidth - 610,
                      radius: 5,
                      controller: search,
                      suffixIcon:
                          search.text != "" ? Icons.clear : Icons.search,
                    );
                  }),
                ],
              ),
            ),
        if (Get.find<Add_Data_controller>().roll != "observer")
          if (screenWidth <= 769)
            Container(
              width: screenWidth,
              margin: const EdgeInsets.only(left: 30.0, right: 30.0, top: 10.0),
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  spacing: 15.0,
                  children: [
                    Row(
                      spacing: 15.0,
                      children: [
                        GetBuilder<Subject_Controller>(builder: (controller) {
                          return DropDownLMSCurriMgmt(
                            Isloading: controller.isLoading,
                            title: "Subject".tr,
                            width: 250,
                            type: "Subject",
                          );
                        }),
                        DropDownLMSCurriMgmt(
                          Isloading: false,
                          title: "Semester".tr,
                          width: 250,
                          type: "semester",
                        ),
                        GetBuilder<Curriculumn_LMS_Controller>(
                            builder: (controller) {
                          return TextFormSearch(
                            click: () {
                              controller.clearFilter();
                            },
                            onchange: (value) {
                              controller.searchByName(
                                  value,
                                  controller.semesterIndex,
                                  controller.subjectIndex);
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
                  ],
                ),
              ),
            ),
        Expanded(
            child: Padding(
          padding: const EdgeInsets.only(top: 15.0),
          child: CurriculumGridLMS(),
        )),
      ],
    ));
  }
}
