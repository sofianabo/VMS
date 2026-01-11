import 'package:duration_picker/duration_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:get/get.dart';
import 'package:vms_school/Link/API/LMS_APIs/QuizAPI/Delete_Quiz_Lms_API.dart';
import 'package:vms_school/Link/API/LMS_APIs/QuizAPI/Edit_Quiz_Lms_API.dart';
import 'package:vms_school/Link/API/LMS_APIs/QuizAPI/Quiz_Questions_APIs/Get_All_Quiz_Question_API.dart';
import 'package:vms_school/Link/Controller/AdminController/Employee_Controllers/Add_Data_controller.dart';
import 'package:vms_school/Link/Controller/LMS_Controllers/Admin_LMS/QuizController/AllQuizController.dart';
import 'package:vms_school/Link/Controller/LMS_Controllers/Admin_LMS/Quiz_Controller/Quiz_Questions_Controller.dart';
import 'package:vms_school/Link/Controller/LMS_Controllers/Admin_LMS/Selected_Screen.dart';
import 'package:vms_school/Translate/local_controller.dart';
import 'package:vms_school/view/Both_Platform/widgets/ButtonsDialog.dart';
import 'package:vms_school/view/Both_Platform/widgets/Calender.dart';
import 'package:vms_school/view/Both_Platform/widgets/GridAnimation.dart';
import 'package:vms_school/view/Both_Platform/widgets/Schema_Widget.dart';
import 'package:vms_school/view/Both_Platform/widgets/Squer_Button_Enabled_Disabled.dart';
import 'package:vms_school/view/Both_Platform/widgets/TextFildWithUpper.dart';
import 'package:vms_school/view/Both_Platform/widgets/VMSAlertDialog.dart';

class Quizstudentgrid extends StatefulWidget {
  Quizstudentgrid({super.key});

  @override
  State<Quizstudentgrid> createState() => _QuizstudentgridState();
}

class _QuizstudentgridState extends State<Quizstudentgrid> {
  @override
  void initState() {
    super.initState();
  }

  TextEditingController search = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    int getCrossAxisCount() {
      // if (screenWidth >= 1278) return 5;
      if (screenWidth >= 1070) return 4;
      if (screenWidth >= 950) return 3;
      if (screenWidth >= 769) return 2;
      return 1;
    }

    double getChildAspectRatio() {
      if (screenWidth >= 1070) return 1.1;
      if (screenWidth >= 950) return 1.1;
      if (screenWidth >= 838) return 1.6;
      if (screenWidth >= 769) return 1.5;
      if (screenWidth >= 539) return 2.2;
      return 1.7;
    }

    return Expanded(
      child: Directionality(
        textDirection: Get.find<LocalizationController>()
                    .currentLocale
                    .value
                    .languageCode ==
                'ar'
            ? TextDirection.rtl
            : TextDirection.ltr,
        child: GetBuilder<Allquizcontroller>(builder: (control) {
          return control.isLoading == true
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
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Expanded(
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    SchemaWidget(width: 120, height: 15)
                                  ],
                                ),
                              ),
                              Column(
                                spacing: 10.0,
                                children: [
                                  SchemaWidget(
                                    width: 300,
                                    height: 25,
                                    radius: 5,
                                  ),
                                  SchemaWidget(
                                    width: 300,
                                    height: 25,
                                    radius: 5,
                                  ),
                                  SchemaWidget(
                                    width: 300,
                                    height: 25,
                                    radius: 5,
                                  ),
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
              : control.filtered_quizLMS.isNotEmpty
                  ? GridView.builder(
                      padding:
                          const EdgeInsets.only(top: 10, left: 40, right: 40),
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: getCrossAxisCount(),
                          crossAxisSpacing: 20.0,
                          mainAxisSpacing: 20.0,
                          childAspectRatio: getChildAspectRatio()),
                      itemCount: control.filtered_quizLMS.length,
                      itemBuilder: (context, index) {
                        return HoverScaleCard(
                          child: GestureDetector(
                            onTap: () {
                              
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
                                  children: [
                               
                                    Column(
                                      spacing: 10,
                                      children: [
                                        Row(
                                          children: [
                                            Expanded(
                                              child: Text(
                                                  textAlign: TextAlign.center,
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                  "${control.filtered_quizLMS[index].name}",
                                                  style: Theme.of(context)
                                                      .textTheme
                                                      .titleMedium!
                                                      .copyWith(
                                                        fontSize: 20,
                                                      )),
                                            ),
                                          ],
                                        ),
                                        Text(
                                            overflow: TextOverflow.ellipsis,
                                            textAlign: TextAlign.center,
                                            "${control.filtered_quizLMS[index].startDate}",
                                            style: Theme.of(context)
                                                .textTheme
                                                .titleMedium!
                                                .copyWith(
                                                    fontSize: 16,
                                                    fontWeight:
                                                        FontWeight.normal)),
                                        Row(
                                          children: [
                                            Text(
                                                overflow: TextOverflow.ellipsis,
                                                "Curriculum".tr,
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .titleMedium!
                                                    .copyWith(
                                                      fontSize: 14,
                                                      fontWeight:
                                                          FontWeight.normal,
                                                    )),
                                            Text(
                                                overflow: TextOverflow.ellipsis,
                                                Get.find<LocalizationController>()
                                                            .currentLocale
                                                            .value
                                                            .languageCode ==
                                                        'ar'
                                                    ? " : ${control.filtered_quizLMS[index].curriculumName}"
                                                    : " : ${control.filtered_quizLMS[index].curriculumEnName}",
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .titleMedium!
                                                    .copyWith(
                                                      fontSize: 14,
                                                      fontWeight:
                                                          FontWeight.normal,
                                                    )),
                                          ],
                                        ),
                                      ],
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          spacing: 10.0,
                                          children: [
                                            Text(
                                                overflow: TextOverflow.ellipsis,
                                                "Period".tr,
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .titleMedium!
                                                    .copyWith(
                                                      fontSize: 14,
                                                      fontWeight:
                                                          FontWeight.normal,
                                                    )),
                                            Row(
                                              spacing: 3,
                                              children: [
                                                Text(
                                                    overflow:
                                                        TextOverflow.ellipsis,
                                                    "${control.filtered_quizLMS[index].period}",
                                                    style: Theme.of(context)
                                                        .textTheme
                                                        .titleMedium!
                                                        .copyWith(
                                                          fontSize: 14,
                                                          fontWeight:
                                                              FontWeight.normal,
                                                        )),
                                                Icon(
                                                  Icons.timer_outlined,
                                                  size: 14,
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                        Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          spacing: 10.0,
                                          children: [
                                            Text(
                                                overflow: TextOverflow.ellipsis,
                                                "Status".tr,
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .titleMedium!
                                                    .copyWith(
                                                      fontSize: 14,
                                                      fontWeight:
                                                          FontWeight.normal,
                                                    )),
                                         
                                          ],
                                        ),
                                      ],
                                    )
                                  ],
                                )),
                          ),
                        );
                      },
                    )
                  : Center(
                      child: Text("No Quizzes".tr,
                          style: Theme.of(context)
                              .textTheme
                              .titleLarge!
                              .copyWith(
                                  fontSize: 22,
                                  fontWeight: FontWeight.normal)));
        }),
      ),
    );
  }
}
