import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:get/get.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:vms_school/Icons_File/v_m_s__icons_icons.dart';
import 'package:vms_school/Link/API/API.dart';
import 'package:vms_school/Link/API/AdminAPI/Students/Students_APIs/StudentPunishAPI.dart';
import 'package:vms_school/Link/API/Guardians_API/Get_Students_Marks_API.dart';
import 'package:vms_school/Link/Controller/AdminController/Employee_Controllers/Add_Data_controller.dart';
import 'package:vms_school/Link/Controller/AdminController/School_Controllers/Rewards_Controller.dart';
import 'package:vms_school/Link/Controller/AdminController/Students_Controllers/PenaltiesAndRewardsController.dart';
import 'package:vms_school/Link/Controller/AdminController/Students_Controllers/StudyYearStudentsController.dart';
import 'package:vms_school/Link/Controller/WidgetController/DropDown_Controllers/DropDownPenaltyController.dart';
import 'package:vms_school/Translate/local_controller.dart';
import 'package:vms_school/view/SMS_Platform/Admin/School_Management/Rewards_Pages/Rewards_Dialog.dart';
import 'package:vms_school/view/Both_Platform/widgets/Admin/Admin_Students/DropDownStudyYearStudents.dart';
import 'package:vms_school/view/Both_Platform/widgets/Admin/Admin_Students/Penality_And_Rewards_Dialog.dart';
import 'package:vms_school/view/Both_Platform/widgets/ButtonsDialog.dart';
import 'package:vms_school/view/Both_Platform/widgets/Calender.dart';
import 'package:vms_school/view/Both_Platform/widgets/GridAnimation.dart';
import 'package:vms_school/view/Both_Platform/widgets/Schema_Widget.dart';
import 'package:vms_school/view/Both_Platform/widgets/TextFildWithUpper.dart';
import 'package:vms_school/view/Both_Platform/widgets/VMSAlertDialog.dart';

class StudyYearStudentGrid extends StatefulWidget {
  const StudyYearStudentGrid({super.key});

  @override
  State<StudyYearStudentGrid> createState() => _StudyYearStudentGridState();
}

class _StudyYearStudentGridState extends State<StudyYearStudentGrid>
    with SingleTickerProviderStateMixin {
  TextEditingController reason = TextEditingController();
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    print(width);
    int getCrossAxisCount(double screenWidth) {
      if (screenWidth >= 1200) return 4;
      if (screenWidth >= 900) return 3;
      if (screenWidth >= 600) return 2;
      return 1;
    }

    double getChildAspectRatio(double screenWidth) {
      if (screenWidth >= 1306) return 0.87;
      if (screenWidth >= 1276) return 0.9;
      if (screenWidth >= 1000) return 0.8;
      if (screenWidth >= 900) return 0.71;
      if (screenWidth >= 695) return 1.0;
      if (screenWidth >= 600) return 0.8;
      if (screenWidth >= 501 && screenWidth <= 599) return 1.1;
      if (screenWidth >= 420) return 1.2;
      if (screenWidth >= 377) return 0.85;
      if (screenWidth >= 376) return 1.0;
      return 0.8; // لأي قيمة أقل من 376
    }

    double w = MediaQuery.of(context).size.width;
    return Directionality(
      textDirection:
          Get.find<LocalizationController>().currentLocale.value.languageCode ==
                  'ar'
              ? TextDirection.rtl
              : TextDirection.ltr,
      child: GetBuilder<StudyYearStudentsController>(builder: (controller) {
        return controller.isLoading == true
            ? GridView.builder(
                padding: const EdgeInsets.only(top: 10, left: 40, right: 40),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: getCrossAxisCount(width),
                    crossAxisSpacing: 20.0,
                    mainAxisSpacing: 20.0,
                    childAspectRatio: getChildAspectRatio(width)),
                itemCount: 8,
                itemBuilder: (context, index) {
                  return HoverScaleCard(
                    child: Container(
                        padding: const EdgeInsets.all(20),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            border: Border.all(color: Colors.grey, width: 0.5),
                            color: Get.theme.cardColor,
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
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Expanded(
                                  child: SchemaWidget(width: 50, height: 15),
                                ),
                                SchemaWidget(
                                  width: 100,
                                  height: 100,
                                  radius: 100,
                                ),
                              ],
                            ),
                            SchemaWidget(width: 50, height: 15),
                            SchemaWidget(width: 50, height: 15),
                            Padding(
                              padding: const EdgeInsets.only(top: 8.0),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  SchemaWidget(
                                    width: 25,
                                    height: 25,
                                    radius: 3,
                                  ),
                                  SchemaWidget(
                                    width: 25,
                                    height: 25,
                                    radius: 3,
                                  ),
                                ],
                              ),
                            )
                          ],
                        )),
                  )
                      .animate(onPlay: (controller) => controller.repeat())
                      .shimmer(
                          duration: const Duration(seconds: 2),
                          color: Get.theme.primaryColor.withOpacity(0.1));
                },
              )
            : controller.filteredStudents!.isEmpty
                ? Center(
                    child: Text("No Students".tr,
                        style: Theme.of(context).textTheme.titleLarge!.copyWith(
                            fontSize: 22, fontWeight: FontWeight.normal)))
                : GridView.builder(
                    padding:
                        const EdgeInsets.only(top: 10, left: 40, right: 40),
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: getCrossAxisCount(width),
                        crossAxisSpacing: 20.0,
                        mainAxisSpacing: 20.0,
                        childAspectRatio: getChildAspectRatio(width)),
                    itemCount: controller.filteredStudents!.length,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () async {
                          if (Get.find<Add_Data_controller>().roll == "admin" ||
                              Get.find<Add_Data_controller>().roll ==
                                  "subAdmin" ||
                              Get.find<Add_Data_controller>().roll ==
                                  "supervisor") {
                            Get_Students_Marks_API_Gua().Get_Students_Marks(
                                name: controller
                                    .filteredStudents![index].fullName,
                                StudentsID:
                                    controller.filteredStudents![index].id);
                          }
                        },
                        child: HoverScaleCard(
                          child: Container(
                              padding: const EdgeInsets.all(20),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5),
                                  border: Border.all(
                                      color: Colors.grey, width: 0.5),
                                  color: Get.theme.cardColor,
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
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Expanded(
                                        child: Text(
                                            "${controller.filteredStudents![index].fullName}",
                                            style: Get
                                                .theme.textTheme.bodyMedium!
                                                .copyWith(
                                                    fontSize: 20,
                                                    fontWeight:
                                                        FontWeight.bold)),
                                      ),
                                      FutureBuilder(
                                        future: precacheImage(
                                            NetworkImage(
                                                "$getimage${controller.filteredStudents![index].fileId}"),
                                            context),
                                        builder: (context, snapshot) {
                                          if (snapshot.connectionState ==
                                              ConnectionState.done) {
                                            return CircleAvatar(
                                              maxRadius: 60,
                                              backgroundColor:
                                                  const Color(0xffC4C4C4),
                                              backgroundImage: controller
                                                          .filteredStudents![
                                                              index]
                                                          .fileId !=
                                                      null
                                                  ? NetworkImage(
                                                      "$getimage${controller.filteredStudents![index].fileId}")
                                                  : null,
                                              child: controller
                                                          .filteredStudents![
                                                              index]
                                                          .fileId ==
                                                      null
                                                  ? Text(
                                                      controller
                                                          .filteredStudents![
                                                              index]
                                                          .fullName!
                                                          .substring(0, 1)
                                                          .toUpperCase(),
                                                      style: Get
                                                          .textTheme.titleLarge!
                                                          .copyWith(
                                                              fontSize: 26,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold),
                                                    )
                                                  : null,
                                            );
                                          } else {
                                            return CircleAvatar(
                                              maxRadius: 60,
                                              backgroundColor:
                                                  const Color(0xffC4C4C4),
                                              child: LoadingAnimationWidget
                                                  .inkDrop(
                                                color: Theme.of(context)
                                                    .primaryColor,
                                                size: 30,
                                              ),
                                            );
                                          }
                                        },
                                      ),
                                    ],
                                  ),
                                  Text(
                                    "${controller.filteredStudents![index].states}"
                                        .tr,
                                    style: Get.theme.textTheme.bodyMedium!
                                        .copyWith(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16,
                                      color: controller.filteredStudents![index]
                                                  .states ==
                                              "Passing"
                                          ? const Color(0xff2F9742) // أخضر
                                          : controller.filteredStudents![index]
                                                      .states ==
                                                  "Failed"
                                              ? const Color(0xff972F2F) // أحمر
                                              : controller
                                                          .filteredStudents![
                                                              index]
                                                          .states ==
                                                      "No Result"
                                                  ? const Color(
                                                      0xFF488593) // بنفسجي جميل
                                                  : const Color.fromARGB(
                                                      255,
                                                      44,
                                                      134,
                                                      194), // أزرق (للحالات الأخرى)
                                    ),
                                  ),
                                  Text(
                                      "${Get.find<LocalizationController>().currentLocale.value.languageCode == 'ar' ? controller.filteredStudents![index].classes!.name : controller.filteredStudents![index].classes!.enName} / ${Get.find<LocalizationController>().currentLocale.value.languageCode == 'ar' ? controller.filteredStudents![index].division!.name : controller.filteredStudents![index].division!.enName}",
                                      style: Get.theme.textTheme.bodyMedium!
                                          .copyWith(
                                        fontWeight: FontWeight.bold,
                                      )),
                                  Padding(
                                    padding: const EdgeInsets.only(top: 8.0),
                                    child: Column(
                                      spacing: 10.0,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        if (Get.find<Add_Data_controller>()
                                                .roll ==
                                            "observer")
                                          Container(
                                            padding: EdgeInsets.all(8.0),
                                            decoration: BoxDecoration(
                                                color:
                                                    Get.find<Add_Data_controller>()
                                                                .roll !=
                                                            "observer"
                                                        ? Colors.transparent
                                                        : Theme.of(
                                                                context)
                                                            .disabledColor,
                                                borderRadius:
                                                    BorderRadius.all(
                                                        Radius.circular(3)),
                                                border: Border.all(
                                                    color: Get.find<Add_Data_controller>()
                                                                .roll !=
                                                            "observer"
                                                        ? Get.theme.textTheme
                                                            .titleMedium!.color!
                                                        : Theme.of(context)
                                                            .disabledColor)),
                                            child: Row(
                                              children: [
                                                Icon(
                                                  VMS_Icons.vcard,
                                                  color:
                                                      Get.find<Add_Data_controller>()
                                                                  .roll !=
                                                              "observer"
                                                          ? Get
                                                              .theme
                                                              .textTheme
                                                              .titleMedium!
                                                              .color!
                                                          : Colors.white,
                                                  size: 14,
                                                ),
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          left: 5.0,
                                                          right: 5.0),
                                                  child: Text(
                                                    'Export Certificate'.tr,
                                                    style: Get.theme.textTheme
                                                        .headlineMedium!
                                                        .copyWith(
                                                            color: Get.find<Add_Data_controller>()
                                                                        .roll !=
                                                                    "observer"
                                                                ? Color(
                                                                    0xff134B70)
                                                                : Colors.white),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        if (Get.find<Add_Data_controller>()
                                                .roll !=
                                            "observer")
                                          TextButton(
                                              style: ButtonStyle(
                                                  backgroundColor:
                                                      WidgetStatePropertyAll(
                                                          Colors.transparent),
                                                  shape: WidgetStatePropertyAll(
                                                      RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.all(
                                                            Radius.circular(3)),
                                                    side: BorderSide(
                                                        color: Get
                                                            .theme
                                                            .textTheme
                                                            .titleMedium!
                                                            .color!),
                                                  ))),
                                              onPressed: () {},
                                              child: Row(
                                                children: [
                                                  Icon(
                                                    VMS_Icons.vcard,
                                                    color: Get.textTheme
                                                        .titleMedium!.color!,
                                                    size: 14,
                                                  ),
                                                  Padding(
                                                    padding:
                                                        const EdgeInsets.only(
                                                            left: 5.0,
                                                            right: 5.0),
                                                    child: Text(
                                                      'Export Certificate'.tr,
                                                      style: Get.theme.textTheme
                                                          .headlineMedium!
                                                          .copyWith(
                                                              color: Color(
                                                                  0xff134B70)),
                                                    ),
                                                  ),
                                                ],
                                              )),
                                        PopupMenuButton<String>(
                                          enabled:
                                              Get.find<Add_Data_controller>()
                                                      .roll !=
                                                  "observer",
                                          child: Container(
                                            padding: EdgeInsets.all(8.0),
                                            decoration: BoxDecoration(
                                                color:
                                                    Get.find<Add_Data_controller>()
                                                                .roll !=
                                                            "observer"
                                                        ? Colors.transparent
                                                        : Theme.of(
                                                                context)
                                                            .disabledColor,
                                                borderRadius:
                                                    BorderRadius.all(
                                                        Radius.circular(3)),
                                                border: Border.all(
                                                    color: Get.find<Add_Data_controller>()
                                                                .roll !=
                                                            "observer"
                                                        ? Get.theme.textTheme
                                                            .titleMedium!.color!
                                                        : Theme.of(context)
                                                            .disabledColor)),
                                            child: Row(
                                              children: [
                                                Icon(
                                                  Icons.gavel,
                                                  color:
                                                      Get.find<Add_Data_controller>()
                                                                  .roll !=
                                                              "observer"
                                                          ? Get
                                                              .theme
                                                              .textTheme
                                                              .titleMedium!
                                                              .color!
                                                          : Colors.white,
                                                  size: 14,
                                                ),
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          left: 5.0,
                                                          right: 5.0),
                                                  child: Text(
                                                    'Rewards & Penalties'.tr,
                                                    style: Get.theme.textTheme
                                                        .headlineMedium!
                                                        .copyWith(
                                                            color: Get.find<Add_Data_controller>()
                                                                        .roll !=
                                                                    "observer"
                                                                ? Color(
                                                                    0xff134B70)
                                                                : Colors.white),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          tooltip: "".tr,
                                          onSelected: (value) {
                                            if (value == "Punishing".tr) {
                                              controller.initialStateDiag();
                                              reason.clear();
                                              Get.dialog(VMSAlertDialog(
                                                  action: [
                                                    ButtonDialog(
                                                      width: 90,
                                                      onPressed: () async {
                                                        await Studentpunishapi(
                                                                context)
                                                            .Studentpunish(
                                                                Get.find<
                                                                        Dropdownpenaltycontroller>()
                                                                    .penid!,
                                                                reason.text,
                                                                controller
                                                                    .startdate
                                                                    .value
                                                                    .toString(),
                                                                controller
                                                                    .enddate
                                                                    .value
                                                                    .toString(),
                                                                controller
                                                                    .filteredStudents![
                                                                        index]
                                                                    .id!);
                                                      },
                                                      color: Get
                                                          .theme.primaryColor,
                                                      text: "Send".tr,
                                                    )
                                                  ],
                                                  contents: Container(
                                                    width: 350,
                                                    child: Column(
                                                      mainAxisSize:
                                                          MainAxisSize.min,
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .center,
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .center,
                                                      children: [
                                                        GetBuilder<
                                                                Dropdownpenaltycontroller>(
                                                            builder:
                                                                (PController) {
                                                          return DropDownStudyYearStudents(
                                                            isLoading:
                                                                PController
                                                                    .Isloading,
                                                            title:
                                                                "Penaltyy".tr,
                                                            type: "penalty",
                                                            width: 300,
                                                          );
                                                        }),
                                                        Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                  .only(
                                                                  top: 15.0),
                                                          child: Column(
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .start,
                                                            children: [
                                                              Textfildwithupper(
                                                                  Uptext:
                                                                      "The Reason"
                                                                          .tr,
                                                                  isRequired:
                                                                      true,
                                                                  width: 300,
                                                                  controller:
                                                                      reason,
                                                                  hinttext:
                                                                      "The Reason"
                                                                          .tr),
                                                            ],
                                                          ),
                                                        ),
                                                        Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                  .only(
                                                                  top: 15.0,
                                                                  bottom: 15.0),
                                                          child: Column(
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .start,
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .start,
                                                            children: [
                                                              Padding(
                                                                padding:
                                                                    const EdgeInsets
                                                                        .only(
                                                                        bottom:
                                                                            5.0),
                                                                child: RichText(
                                                                  text: TextSpan(
                                                                      text: "Start Date"
                                                                          .tr,
                                                                      style: Get
                                                                          .theme
                                                                          .textTheme
                                                                          .bodyMedium!
                                                                          .copyWith(
                                                                              fontSize: 14,
                                                                              fontWeight: FontWeight.normal),
                                                                      children: const [
                                                                        TextSpan(
                                                                          text:
                                                                              " *",
                                                                          style: TextStyle(
                                                                              color: Colors.red,
                                                                              fontSize: 16),
                                                                        ),
                                                                      ]),
                                                                ),
                                                              ),
                                                              penaltyStartDate(
                                                                  width: 300)
                                                            ],
                                                          ),
                                                        ),
                                                        Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                  .only(
                                                                  top: 15.0,
                                                                  bottom: 15.0),
                                                          child: Column(
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .start,
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .start,
                                                            children: [
                                                              Text(
                                                                  "End Date".tr,
                                                                  style: Get
                                                                      .theme
                                                                      .textTheme
                                                                      .bodyMedium!),
                                                              PenaltyEndDate(
                                                                  width: 300)
                                                            ],
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                  apptitle:
                                                      "Punishing Student".tr,
                                                  subtitle: ""));
                                            } else if (value ==
                                                "Rewards & Penalties".tr) {
                                              final controllers = Get.put(
                                                  Penaltiesandrewardscontroller());

                                              controllers.fetchPenalties(
                                                  int.parse(controller
                                                      .filteredStudents![index]
                                                      .id
                                                      .toString()));

                                              controllers.fetchRewards(
                                                  int.parse(controller
                                                      .filteredStudents![index]
                                                      .id
                                                      .toString()));

                                              Get.dialog(
                                                barrierDismissible: false,
                                                Re_Pe_Page(
                                                    isTeacher: false,
                                                    Id: controller
                                                        .filteredStudents![
                                                            index]
                                                        .id
                                                        .toString(),
                                                    name: controller
                                                        .filteredStudents![
                                                            index]
                                                        .fullName
                                                        .toString()),
                                              );
                                            } else {
                                              Get.find<RewardsController>()
                                                  .setRewards();
                                              Get.find<RewardsController>()
                                                  .updateStudentName(controller
                                                      .filteredStudents![index]
                                                      .fullName!
                                                      .toString());
                                              Get.dialog(
                                                Rewards_Dialog(
                                                  isTeacher: false,
                                                  Studentname: controller
                                                      .filteredStudents![index]
                                                      .fullName!
                                                      .toString(),
                                                  FileType: "Rewards".tr +
                                                      " ( ${DateTime.now().toIso8601String().split('T').first} )",
                                                  id: controller
                                                      .filteredStudents![index]
                                                      .id!
                                                      .toString(),
                                                ),
                                                barrierDismissible: false,
                                              );
                                            }
                                          },
                                          itemBuilder: (BuildContext context) =>
                                              <PopupMenuEntry<String>>[
                                            PopupMenuItem<String>(
                                              value: 'Punishing'.tr,
                                              child: Text('Punishing'.tr),
                                            ),
                                            PopupMenuItem<String>(
                                              value: 'Rewards'.tr,
                                              child: Text('Rewards'.tr),
                                            ),
                                            PopupMenuItem<String>(
                                              value: 'Rewards & Penalties'.tr,
                                              child: Text(
                                                  'Rewards & Penalties'.tr),
                                            ),
                                          ],
                                        )
                                      ],
                                    ),
                                  )
                                ],
                              )),
                        ),
                      );
                    },
                  );
      }),
    );
  }
}
