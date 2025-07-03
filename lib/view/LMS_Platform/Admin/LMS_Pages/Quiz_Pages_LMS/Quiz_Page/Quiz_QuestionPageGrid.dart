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

class QuizQuestionpagegrid extends StatefulWidget {
  QuizQuestionpagegrid({super.key});

  @override
  State<QuizQuestionpagegrid> createState() => _QuizQuestionpagegridState();
}

class _QuizQuestionpagegridState extends State<QuizQuestionpagegrid> {
  @override
  void initState() {
    super.initState();
  }

  TextEditingController search = TextEditingController();
  TextEditingController name = TextEditingController();
  TextEditingController page = TextEditingController();
  TextEditingController period = TextEditingController();
  TextEditingController max = TextEditingController();
  TextEditingController min = TextEditingController();

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
                              Get.find<Quiz_Questions_Controller>().quiz_Id =
                                  control.filtered_quizLMS[index].id;
                              Get_Quiz_Questions_API().Get_Quiz_Questions();
                              Get.find<Selected_Class_Controller>()
                                  .addToPath("Add Questions".tr);
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
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Squer_Button_Enabled_Disabled(
                                            validate: !(Get.find<
                                                        Add_Data_controller>()
                                                    .roll !=
                                                "observer"),
                                            icon: Icons.edit_note_outlined,
                                            onTap: () {
                                              max.text = control
                                                  .filtered_quizLMS[index]
                                                  .maxMark
                                                  .toString();
                                              name.text = control
                                                  .filtered_quizLMS[index].name
                                                  .toString();
                                              min.text = control
                                                  .filtered_quizLMS[index]
                                                  .passingMark
                                                  .toString();

                                              period.text = control
                                                  .filtered_quizLMS[index]
                                                  .period
                                                  .toString();

                                              control.dateindex.value =
                                                  DateTime.parse(control
                                                      .filtered_quizLMS[index]
                                                      .startDate
                                                      .toString());

                                              control.updateFieldError(
                                                  "max", false);
                                              control.updateFieldError(
                                                  "min", false);
                                              control.updateFieldError(
                                                  "per", false);
                                              control.updateFieldError(
                                                  "date", false);

                                              Get.dialog(
                                                  barrierDismissible: false,
                                                  GetBuilder<Allquizcontroller>(
                                                      builder: (Econtroller) {
                                                return VMSAlertDialog(
                                                    action: [
                                                      ButtonDialog(
                                                          text: "Edit Exam".tr,
                                                          onPressed: () async {
                                                            bool IsmaxError =
                                                                max.text
                                                                    .trim()
                                                                    .isEmpty;
                                                            bool IsminError =
                                                                min.text
                                                                    .trim()
                                                                    .isEmpty;
                                                            bool IsperError =
                                                                period.text
                                                                    .trim()
                                                                    .isEmpty;
                                                            bool IsNameError =
                                                                name.text
                                                                    .trim()
                                                                    .isEmpty;
                                                            bool IsdateError =
                                                                control.dateindex
                                                                        .value ==
                                                                    null;

                                                            Econtroller
                                                                .updateFieldError(
                                                                    "max",
                                                                    IsmaxError);
                                                            Econtroller
                                                                .updateFieldError(
                                                                    "min",
                                                                    IsminError);
                                                            Econtroller
                                                                .updateFieldError(
                                                                    "per",
                                                                    IsperError);
                                                            Econtroller
                                                                .updateFieldError(
                                                                    "date",
                                                                    IsdateError);
                                                            Econtroller
                                                                .updateFieldError(
                                                                    "name",
                                                                    IsNameError);

                                                            if (!(IsmaxError ||
                                                                IsminError ||
                                                                IsperError ||
                                                                IsNameError ||
                                                                IsdateError)) {
                                                              await Edit_Quiz_Lms_Api(
                                                                      context)
                                                                  .Edit_Quiz_Lms(
                                                                quiz: control
                                                                        .filtered_quizLMS[
                                                                    index],
                                                                name: name.text,
                                                                id: control
                                                                    .filtered_quizLMS[
                                                                        index]
                                                                    .id,
                                                                PassingMark: int
                                                                    .parse(min
                                                                        .text),
                                                                maxMark: int
                                                                    .parse(max
                                                                        .text),
                                                                hidden: control
                                                                    .Hidden,
                                                                period:
                                                                    period.text,
                                                                startDate: control
                                                                    .dateindex
                                                                    .toString(),
                                                              );
                                                              Get.back();
                                                            }
                                                          },
                                                          color: Get.theme
                                                              .primaryColor,
                                                          width: 120)
                                                    ],
                                                    contents: Container(
                                                      width: Get.width / 3,
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
                                                                      top:
                                                                          15.0),
                                                              child: Wrap(
                                                                runSpacing: 8.0,
                                                                spacing: 8.0,
                                                                children: [
                                                                  Textfildwithupper(
                                                                      onChanged:
                                                                          (value) {
                                                                        if (value
                                                                            .isNotEmpty) {
                                                                          Econtroller.updateFieldError(
                                                                              "name",
                                                                              false);
                                                                        }
                                                                      },
                                                                      isRequired:
                                                                          true,
                                                                      isError:
                                                                          Econtroller
                                                                              .IsAnameError,
                                                                      Uptext:
                                                                          "Name"
                                                                              .tr,
                                                                      width:
                                                                          220,
                                                                      controller:
                                                                          name,
                                                                      hinttext:
                                                                          "Name"
                                                                              .tr),
                                                                  Padding(
                                                                    padding: const EdgeInsets
                                                                        .only(
                                                                        top:
                                                                            5.0),
                                                                    child:
                                                                        examDateLms(
                                                                      Uptext:
                                                                          "Date"
                                                                              .tr,
                                                                      isError:
                                                                          Econtroller
                                                                              .ISdateError,
                                                                      isRequired:
                                                                          true,
                                                                      width:
                                                                          220,
                                                                    ),
                                                                  ),
                                                                ],
                                                              ),
                                                            ),
                                                            Padding(
                                                              padding:
                                                                  const EdgeInsets
                                                                      .only(
                                                                      top:
                                                                          15.0),
                                                              child: Wrap(
                                                                runSpacing: 8.0,
                                                                spacing: 8.0,
                                                                children: [
                                                                  Textfildwithupper(
                                                                      fieldType:
                                                                          "number",
                                                                      onChanged:
                                                                          (value) {
                                                                        if (value
                                                                            .isNotEmpty) {
                                                                          if (value ==
                                                                              "0") {
                                                                            max.text =
                                                                                "1";
                                                                          }
                                                                          Econtroller.updateFieldError(
                                                                              "max",
                                                                              false);
                                                                        }
                                                                      },
                                                                      isRequired:
                                                                          true,
                                                                      isError:
                                                                          Econtroller
                                                                              .ISmaxError,
                                                                      Uptext:
                                                                          "Max Mark"
                                                                              .tr,
                                                                      width:
                                                                          220,
                                                                      controller:
                                                                          max,
                                                                      hinttext:
                                                                          "Max Mark"
                                                                              .tr),
                                                                  Textfildwithupper(
                                                                      fieldType:
                                                                          "number",
                                                                      onChanged:
                                                                          (value) {
                                                                        if (value
                                                                            .isNotEmpty) {
                                                                          if (value ==
                                                                              "0") {
                                                                            min.text =
                                                                                "1";
                                                                          }
                                                                          Econtroller.updateFieldError(
                                                                              "min",
                                                                              false);
                                                                        }
                                                                      },
                                                                      isRequired:
                                                                          true,
                                                                      isError:
                                                                          Econtroller
                                                                              .ISminError,
                                                                      Uptext:
                                                                          "Min Mark"
                                                                              .tr,
                                                                      width:
                                                                          220,
                                                                      controller:
                                                                          min,
                                                                      hinttext:
                                                                          "Min Mark"
                                                                              .tr)
                                                                ],
                                                              ),
                                                            ),
                                                            Padding(
                                                              padding:
                                                                  const EdgeInsets
                                                                      .only(
                                                                      top:
                                                                          15.0),
                                                              child: Wrap(
                                                                runSpacing: 8.0,
                                                                spacing: 8.0,
                                                                children: [
                                                                  GestureDetector(
                                                                    onTap:
                                                                        () async {
                                                                      Duration? picked = await showDurationPicker(
                                                                          context:
                                                                              context,
                                                                          initialTime: Duration(
                                                                              hours:
                                                                                  0,
                                                                              minutes:
                                                                                  0),
                                                                          decoration: BoxDecoration(
                                                                              color: Get.theme.cardColor,
                                                                              backgroundBlendMode: BlendMode.color));
                                                                      if (picked !=
                                                                          null) {
                                                                        Econtroller.updateFieldError(
                                                                            "per",
                                                                            false);
                                                                        period.text =
                                                                            "${picked.inHours.toString().padLeft(2, '0')}:"
                                                                            "${(picked.inMinutes % 60).toString().padLeft(2, '0')}:00";
                                                                      }
                                                                    },
                                                                    child:
                                                                        Textfildwithupper(
                                                                      isRequired:
                                                                          true,
                                                                      isError:
                                                                          Econtroller
                                                                              .ISperiodError,
                                                                      readOnly:
                                                                          true,
                                                                      enabled:
                                                                          false,
                                                                      Uptext:
                                                                          "Period"
                                                                              .tr,
                                                                      width:
                                                                          220,
                                                                      controller:
                                                                          period,
                                                                      hinttext:
                                                                          "00:00:00",
                                                                    ),
                                                                  ),
                                                                  Row(
                                                                    children: [
                                                                      Checkbox(
                                                                        checkColor:
                                                                            Colors.white,
                                                                        value: control.Hidden ==
                                                                                1
                                                                            ? true
                                                                            : false,
                                                                        onChanged:
                                                                            (value) {
                                                                          if (Get.find<Add_Data_controller>().roll !=
                                                                              "subAdmin") {
                                                                            control.updateHid(value == true
                                                                                ? 1
                                                                                : 0);
                                                                          }
                                                                        },
                                                                      ),
                                                                      Text("Is It Hidden"
                                                                          .tr),
                                                                    ],
                                                                  ),
                                                                ],
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                    ),
                                                    apptitle: "Edit Exam".tr,
                                                    subtitle: "none");
                                              }));
                                            }),
                                        Squer_Button_Enabled_Disabled(
                                            isDelete: true,
                                            validate: !(Get.find<
                                                        Add_Data_controller>()
                                                    .roll !=
                                                "observer"),
                                            icon: Icons.delete,
                                            onTap: () {
                                              Delete_Quiz_Lms_Api(context)
                                                  .DeleteQuizLms(
                                                quiz: control
                                                    .filtered_quizLMS[index],
                                              );
                                            }),
                                      ],
                                    ),
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
                                            Row(
                                              spacing: 3,
                                              children: [
                                                Text(
                                                    overflow:
                                                        TextOverflow.ellipsis,
                                                    control
                                                                .filtered_quizLMS[
                                                                    index]
                                                                .hidden ==
                                                            1
                                                        ? "Hidden".tr
                                                        : "UnHidden".tr,
                                                    style: Theme.of(context)
                                                        .textTheme
                                                        .titleMedium!
                                                        .copyWith(
                                                          fontSize: 14,
                                                          fontWeight:
                                                              FontWeight.normal,
                                                        )),
                                                Icon(
                                                  Icons.remove_red_eye_outlined,
                                                  size: 14,
                                                ),
                                              ],
                                            ),
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
