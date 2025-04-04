import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:get/get.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:vms_school/Icons_File/v_m_s__icons_icons.dart';
import 'package:vms_school/Link/API/API.dart';
import 'package:vms_school/Link/API/AdminAPI/School/School_Screen_APIs/PenaltyAPI/Get_All_Penalties_API.dart';
import 'package:vms_school/Link/API/AdminAPI/School/School_Screen_APIs/Rewards_APIs/Get_All_Rewards_API.dart';
import 'package:vms_school/Link/API/AdminAPI/Students/Students_APIs/StudentPunishAPI.dart';
import 'package:vms_school/Link/Controller/AdminController/School_Controllers/Rewards_Controller.dart';
import 'package:vms_school/Link/Controller/AdminController/Students_Controllers/PenaltiesAndRewardsController.dart';
import 'package:vms_school/Link/Controller/AdminController/Students_Controllers/StudyYearStudentsController.dart';
import 'package:vms_school/Link/Controller/WidgetController/DropDown_Controllers/DropDownPenaltyController.dart';
import 'package:vms_school/Link/Model/AdminModel/Students_Models/PenaltiesAndRewardsStudentModel.dart';
import 'package:vms_school/Translate/local_controller.dart';
import 'package:vms_school/main.dart';
import 'package:vms_school/view/Admin/School_Management/Rewards_Pages/Rewards_Dialog.dart';
import 'package:vms_school/widgets/Admin_Students/DropDownStudyYearStudents.dart';
import 'package:vms_school/widgets/Admin_Students/Penality_And_Rewards_Dialog.dart';
import 'package:vms_school/widgets/ButtonsDialog.dart';
import 'package:vms_school/widgets/Calender.dart';
import 'package:vms_school/widgets/GridAnimation.dart';
import 'package:vms_school/widgets/Schema_Widget.dart';
import 'package:vms_school/widgets/TextFildWithUpper.dart';
import 'package:vms_school/widgets/VMSAlertDialog.dart';

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
    double w = MediaQuery.of(context).size.width;
    return Directionality(
      textDirection: prefs!.getString(languageKey) == 'ar'
          ? TextDirection.rtl
          : TextDirection.ltr,
      child: GetBuilder<StudyYearStudentsController>(builder: (controller) {
        return controller.isLoading == true
            ? GridView.builder(
                padding: const EdgeInsets.only(top: 10, left: 40, right: 40),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 4,
                    crossAxisSpacing: 20.0,
                    mainAxisSpacing: 20.0,
                    childAspectRatio: 1.1),
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
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 4,
                            crossAxisSpacing: 20.0,
                            mainAxisSpacing: 20.0,
                            childAspectRatio: 1.0),
                    itemCount: controller.filteredStudents!.length,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () async {
                          final controllers =
                              Get.put(Penaltiesandrewardscontroller());

                          controllers.fetchPenalties(int.parse(controller
                              .filteredStudents![index].id
                              .toString()));

                          controllers.fetchRewards(int.parse(controller
                              .filteredStudents![index].id
                              .toString()));

                          Get.dialog(
                            Re_Pe_Page(
                                Id: controller.filteredStudents![index].id
                                    .toString(),
                                name: controller
                                    .filteredStudents![index].fullName
                                    .toString()),
                          );
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
                                      "${controller.filteredStudents![index].state}"
                                          .tr,
                                      style: Get.theme.textTheme.bodyMedium!
                                          .copyWith(
                                              fontSize: 16,
                                              color: controller
                                                          .filteredStudents![
                                                              index]
                                                          .state ==
                                                      "Passing".tr
                                                  ? const Color(0xff2F9742)
                                                  : controller
                                                              .filteredStudents![
                                                                  index]
                                                              .state ==
                                                          "Failed".tr
                                                      ? const Color(0xff972F2F)
                                                      : const Color.fromARGB(
                                                          255, 44, 134, 194))),
                                  Text(
                                      "${"Grade Level:".tr} ${prefs!.getString(languageKey) == 'ar' ? controller.filteredStudents![index].grade!.name : controller.filteredStudents![index].grade!.enName}",
                                      style: Get.theme.textTheme.bodyMedium),
                                  Padding(
                                    padding: const EdgeInsets.only(top: 8.0),
                                    child: Column(
                                      spacing: 10.0,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        TextButton(
                                            style: ButtonStyle(
                                                backgroundColor:
                                                    const WidgetStatePropertyAll(
                                                        Colors.transparent),
                                                shape: WidgetStatePropertyAll(
                                                    RoundedRectangleBorder(
                                                  borderRadius:
                                                      const BorderRadius.all(
                                                          Radius.circular(3)),
                                                  side: BorderSide(
                                                      color: Get.theme
                                                          .highlightColor),
                                                ))),
                                            onPressed: () {},
                                            child: Row(
                                              children: [
                                                Icon(
                                                  VMS_Icons.vcard,
                                                  color:
                                                      Get.theme.highlightColor,
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
                                                        .headlineMedium,
                                                  ),
                                                ),
                                              ],
                                            )),
                                        PopupMenuButton<String>(
                                          child: Container(
                                            padding: EdgeInsets.all(8.0),
                                            decoration: BoxDecoration(
                                                borderRadius: BorderRadius.all(
                                                    Radius.circular(3)),
                                                border: Border.all(
                                                    color: Get
                                                        .theme.highlightColor)),
                                            child: Row(
                                              children: [
                                                Icon(
                                                  Icons.gavel,
                                                  color:
                                                      Get.theme.highlightColor,
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
                                                        .headlineMedium,
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
                                                  contents: Column(
                                                    mainAxisSize:
                                                        MainAxisSize.min,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment.start,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      const SizedBox(
                                                        width: 350,
                                                      ),
                                                      GetBuilder<
                                                              Dropdownpenaltycontroller>(
                                                          builder:
                                                              (PController) {
                                                        return DropDownStudyYearStudents(
                                                          isLoading: PController
                                                              .Isloading,
                                                          title: "Penaltyy".tr,
                                                          type: "penalty",
                                                          width: w / 3.6,
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
                                                            Text(
                                                                "The Reason".tr,
                                                                style: Get
                                                                    .theme
                                                                    .textTheme
                                                                    .labelSmall),
                                                            Textfildwithupper(
                                                                Uptext:
                                                                    "The Reason"
                                                                        .tr,
                                                                isRequired:
                                                                    true,
                                                                width: w / 3.6,
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
                                                                    text:
                                                                        "Start Date"
                                                                            .tr,
                                                                    style: Get
                                                                        .theme
                                                                        .textTheme
                                                                        .bodyMedium!
                                                                        .copyWith(
                                                                            fontSize:
                                                                                14,
                                                                            fontWeight:
                                                                                FontWeight.normal),
                                                                    children: const [
                                                                      TextSpan(
                                                                        text:
                                                                            " *",
                                                                        style: TextStyle(
                                                                            color:
                                                                                Colors.red,
                                                                            fontSize: 16),
                                                                      ),
                                                                    ]),
                                                              ),
                                                            ),
                                                            penaltyStartDate(
                                                                width: w / 3.6)
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
                                                            Text("End Date".tr,
                                                                style: Get
                                                                    .theme
                                                                    .textTheme
                                                                    .bodyMedium!),
                                                            PenaltyEndDate(
                                                                width: w / 3.6)
                                                          ],
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                  apptitle:
                                                      "Punishing Student".tr,
                                                  subtitle: ""));
                                            } else {
                                              Get.find<RewardsController>()
                                                  .setRewards();
                                              Get.dialog(
                                                Rewards_Dialog(
                                                    Studentname: controller
                                                        .filteredStudents![
                                                            index]
                                                        .fullName!
                                                        .toString(),
                                                    FileType: "امتياز",
                                                    id: controller
                                                        .filteredStudents![
                                                            index]
                                                        .id!
                                                        .toString(),
                                                    name: controller
                                                            .filteredStudents![
                                                                index]
                                                            .fullName ??
                                                        "unKnow"),
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
