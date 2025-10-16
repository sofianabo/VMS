import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_dropzone/flutter_dropzone.dart';
import 'package:get/get.dart';
import 'package:vms_school/Link/API/API.dart';
import 'package:vms_school/Link/API/LMS_APIs/Admin/GetHomework_LMSAPI.dart';
import 'package:vms_school/Link/API/LMS_APIs/Admin/Get_All_Curr_LMS.dart';
import 'package:vms_school/Link/API/LMS_APIs/StudentLms/UploadStudentHomeworkAPI.dart';
import 'package:vms_school/Link/Controller/AdminController/Employee_Controllers/Add_Data_controller.dart';
import 'package:vms_school/Link/Controller/LMS_Controllers/Admin_LMS/HomeworkController.dart';
import 'package:vms_school/Translate/local_controller.dart';
import 'package:vms_school/main.dart';
import 'package:vms_school/view/Both_Platform/widgets/ButtonsDialog.dart';
import 'package:vms_school/view/Both_Platform/widgets/GridAnimation.dart';
import 'package:vms_school/view/Both_Platform/widgets/PDF_View.dart';
import 'package:vms_school/view/Both_Platform/widgets/Schema_Widget.dart';
import 'package:vms_school/view/Both_Platform/widgets/Squer_Button_Enabled_Disabled.dart';
import 'package:vms_school/view/Both_Platform/widgets/TextFormSearch.dart';
import 'package:vms_school/view/Both_Platform/widgets/VMSAlertDialog.dart';
import 'package:vms_school/view/LMS_Platform/Admin/LMS_Pages/Division_LMS/HomeworkGrid.dart';
import 'package:vms_school/view/LMS_Platform/Student/HomeworkStudent/HomeworkStudentGrid.dart';
import 'package:vms_school/view/LMS_Platform/Widget/DivisionScreenDropdown.dart';

class Homeworkstudentmange extends StatefulWidget {
  const Homeworkstudentmange({super.key});

  @override
  State<Homeworkstudentmange> createState() => _HomeworkstudentmangeState();
}

class _HomeworkstudentmangeState extends State<Homeworkstudentmange> {
  TextEditingController search = TextEditingController();

  DropzoneViewController? ctrl;
  @override
  void initState() {
    Get_LMS_Curriculm_API().Get_LMS_Curriculm();
    GethomeworkLmsapi().GethomeworkLms(id: prefs!.getString("divisionId"));
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
                    Isloading: controller.isLoading,
                    title: "Curriculum".tr,
                    width: 250,
                    type: "curriculum",
                  ),
                  Squer_Button_Enabled_Disabled(
                      validate:
                          !(Get.find<Add_Data_controller>().roll != "observer"),
                      icon: Icons.home_work_outlined,
                      onTap: () {
                        Get.dialog(
                            barrierDismissible: false,
                            ShowCorrectingHomework());
                      })
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
                    Squer_Button_Enabled_Disabled(
                        validate: !(Get.find<Add_Data_controller>().roll !=
                            "observer"),
                        icon: Icons.home_work_outlined,
                        onTap: () {
                          Get.dialog(
                              barrierDismissible: false,
                              ShowCorrectingHomework());
                        })
                  ],
                ),
              ),
            );
          }),
        Expanded(
            child: Padding(
          padding: const EdgeInsets.only(top: 15.0),
          child: Homeworkstudentgrid(),
        )),
      ],
    );
  }
Widget ShowCorrectingHomework() {
  double screenWidth = MediaQuery.of(context).size.width;
  
  int getCrossAxisCount() {
    if (screenWidth >= 1400) return 5;
    if (screenWidth >= 1150) return 4;
    if (screenWidth >= 950) return 3;
    if (screenWidth >= 769) return 2;
    return 1;
  }

  double getChildAspectRatio() {
    if (screenWidth >= 1150) return 1.1;
    if (screenWidth >= 950) return 1;
    if (screenWidth >= 838) return 1.6;
    if (screenWidth >= 769) return 1.2;
    if (screenWidth >= 613) return 1.6;
    if (screenWidth >= 486) return 1.1;
    return 0.7;
  }

  return GetBuilder<Homeworkcontroller>(builder: (control) {
    return VMSAlertDialog(
      action: [],
      contents: SizedBox(
        width: Get.width,
        height: Get.height,
        child: SingleChildScrollView(
          child: Directionality(
            textDirection: Get.find<LocalizationController>()
                        .currentLocale
                        .value
                        .languageCode ==
                    'ar'
                ? TextDirection.rtl
                : TextDirection.ltr,
            child: control.isLoading
                ? GridView.builder(
                    shrinkWrap: true, // أضف هذا
                    physics: NeverScrollableScrollPhysics(), // وأضف هذا
                    padding: const EdgeInsets.only(
                        top: 10, left: 40, right: 40),
                    gridDelegate:
                        SliverGridDelegateWithFixedCrossAxisCount(
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
                                border: Border.all(
                                    color: Colors.grey, width: 0.5),
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
                              crossAxisAlignment:
                                  CrossAxisAlignment.start,
                              children: [
                                SchemaWidget(width: 35, height: 35),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.center,
                                  crossAxisAlignment:
                                      CrossAxisAlignment.center,
                                  children: [
                                    SchemaWidget(width: 20, height: 15),
                                  ],
                                ),
                                SchemaWidget(width: 25, height: 15),
                                SchemaWidget(width: 25, height: 15),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    SchemaWidget(width: 25, height: 15),
                                    SchemaWidget(width: 20, height: 20),
                                  ],
                                )
                              ],
                            )),
                      )
                          .animate(
                              onPlay: (controller) => controller.repeat())
                          .shimmer(
                              angle: 1,
                              color: Colors.grey.withOpacity(0.2),
                              duration: const Duration(seconds: 1),
                              delay: const Duration(seconds: 1));
                    },
                  )
                : control.filteredhomework.isNotEmpty
                    ? GridView.builder(
                        shrinkWrap: true, // أضف هذا
                        physics: NeverScrollableScrollPhysics(), // وأضف هذا
                        padding: const EdgeInsets.only(
                            top: 10, left: 40, right: 40),
                        gridDelegate:
                            SliverGridDelegateWithFixedCrossAxisCount(
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
                                      borderRadius:
                                          BorderRadius.circular(5),
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
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      SizedBox(
                                        height: 10,
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
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
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
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
                                                      fontWeight:
                                                          FontWeight.normal,
                                                      fontSize: 14)),
                                          Text(
                                              "Mark".tr +
                                                  ": " +
                                                  "${control.filteredhomework[index].mark}",
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .titleMedium!
                                                  .copyWith(
                                                      fontWeight:
                                                          FontWeight.normal,
                                                      fontSize: 14)),
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
                            style: Theme.of(context)
                                .textTheme
                                .titleLarge!
                                .copyWith(
                                    fontSize: 22,
                                    fontWeight: FontWeight.normal))),
          ),
        ),
      ),
      apptitle: "Correcting my homework".tr,
      subtitle: "",
    );
  });
}
}
