import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:get/get.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:vms_school/Icons_File/v_m_s__icons_icons.dart';
import 'package:vms_school/Link/API/API.dart';
import 'package:vms_school/Link/API/AdminAPI/School/School_Screen_APIs/Curriculm_API/Delete_Curriculm_API.dart';
import 'package:vms_school/Link/API/AdminAPI/Students/Students_APIs/Get_Students_Illness.dart';
import 'package:vms_school/Link/API/AdminAPI/Students/Students_APIs/Get_Students_Information.dart';
import 'package:vms_school/Link/API/AdminAPI/Students/Students_APIs/Get_Students_Vaccines.dart';
import 'package:vms_school/Link/API/DownloadFiles.dart';
import 'package:vms_school/Link/API/Guardians_API/Get_Students_Information_API.dart';
import 'package:vms_school/Link/Controller/AdminController/School_Controllers/Illness_Controller.dart';
import 'package:vms_school/Link/Controller/AdminController/School_Controllers/Vaccines_Controller.dart';
import 'package:vms_school/Link/Controller/AdminController/Students_Controllers/Add_Students_Controller.dart';
import 'package:vms_school/Link/Controller/AdminController/Students_Controllers/PenaltiesAndRewardsController.dart';
import 'package:vms_school/Link/Controller/GuardianController/GuardianMainScreenController.dart';
import 'package:vms_school/Link/Controller/GuardianController/MyChildren_Controller.dart';
import 'package:vms_school/Link/Controller/WidgetController/DropDown_Controllers/DropDownCurriculumn_Controller.dart';
import 'package:vms_school/Translate/local_controller.dart';
import 'package:vms_school/main.dart';
import 'package:vms_school/widgets/ButtonsDialog.dart';
import 'package:vms_school/widgets/GridAnimation.dart';
import 'package:vms_school/widgets/Guardian/Animated_Requests.dart';
import 'package:vms_school/widgets/Guardian/ChildPenaltiesDialog.dart';
import 'package:vms_school/widgets/Guardian/ChildRewardsDialog.dart';
import 'package:vms_school/widgets/PDF_View.dart';
import 'package:vms_school/widgets/Schema_Widget.dart';
import 'package:vms_school/widgets/VMSAlertDialog.dart';

class GuardianMainScreenGrid extends StatelessWidget {
  const GuardianMainScreenGrid({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    int getCrossAxisCount() {
      if (screenWidth >= 1800) return 5;
      if (screenWidth >= 1278) return 4;
      if (screenWidth >= 920) return 3;
      if (screenWidth >= 906) return 3;
      if (screenWidth >= 769) return 2;
      return 1;
    }

    double getChildAspectRatio() {
      if (screenWidth >= 1800) return 0.9;
      if (screenWidth >= 1410) return 0.9;
      if (screenWidth >= 1278) return 0.8;
      if (screenWidth >= 1149) return 1.1;
      if (screenWidth >= 1070) return 0.9;
      if (screenWidth >= 920) return 0.7;
      if (screenWidth >= 906) return 0.7;
      if (screenWidth >= 769) return 0.9;
      if (screenWidth >= 616) return 1.92;
      return 0.9;
    }

    return Directionality(
      textDirection: prefs!.getString(languageKey) == "ar"
          ? TextDirection.rtl
          : TextDirection.ltr,
      child: GetBuilder<MyChildren_Controller>(builder: (control) {
        return control.IsLoading
            ? GridView.builder(
                padding: const EdgeInsets.only(top: 10, left: 40, right: 40),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: getCrossAxisCount(),
                  childAspectRatio: getChildAspectRatio(),
                  crossAxisSpacing: 20.0,
                  mainAxisSpacing: 20.0,
                ),
                itemCount: 8,
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
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Expanded(
                                    child: SchemaWidget(
                                  width: 50,
                                  height: 10,
                                )),
                                SchemaWidget(
                                  width: 100,
                                  height: 100,
                                )
                              ],
                            ),
                            SchemaWidget(
                              width: 60,
                              height: 10,
                            ),
                            SchemaWidget(
                              width: 55,
                              height: 10,
                            ),
                            SchemaWidget(
                              width: 30,
                              height: 10,
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 8.0),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  SchemaWidget(
                                    width: 35,
                                    height: 35,
                                  ),
                                  SchemaWidget(
                                    width: 35,
                                    height: 35,
                                  ),
                                  SchemaWidget(
                                    width: 35,
                                    height: 35,
                                  ),
                                  SchemaWidget(
                                    width: 35,
                                    height: 35,
                                  ),
                                ],
                              ),
                            )
                          ],
                        )),
                  )
                      .animate(onPlay: (controller) => controller.repeat())
                      .shimmer(
                          angle: 1,
                          color: Colors.white,
                          duration: const Duration(milliseconds: 600),
                          delay: const Duration(milliseconds: 200));
                },
              ).animate(onPlay: (controller) => controller.repeat()).shimmer(
                angle: 1,
                color: Colors.grey.withOpacity(0.2),
                duration: const Duration(seconds: 1),
                delay: const Duration(seconds: 1))
            : control.filteredStudents.isNotEmpty
                ? GridView.builder(
                    padding:
                        const EdgeInsets.only(top: 10, left: 40, right: 40),
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: getCrossAxisCount(),
                        crossAxisSpacing: 20.0,
                        mainAxisSpacing: 20.0,
                        childAspectRatio: getChildAspectRatio()),
                    itemCount: control.filteredStudents.length,
                    itemBuilder: (context, index) {
                      if (control.filteredStudents[index].classes != null) {
                        return HoverScaleCard(
                          child: GestureDetector(
                            onTap: () async {
                              Get.find<Add_Students_Controller>().resetError();

                              await Get_Students_Information_API_Gua(context)
                                  .Get_Students_Information(
                                      canEdit: false,
                                      StudentsID:
                                          control.filteredStudents[index].id,
                                      index: index);
                            },
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
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        control.filteredStudents[index]
                                                    .fileId !=
                                                null
                                            ? FutureBuilder(
                                                future: precacheImage(
                                                  NetworkImage(
                                                      "$getimage${control.filteredStudents[index].fileId}"),
                                                  context,
                                                ),
                                                builder: (context, snapshot) {
                                                  if (snapshot
                                                          .connectionState ==
                                                      ConnectionState.done) {
                                                    return CircleAvatar(
                                                      maxRadius: 60,
                                                      backgroundColor:
                                                          const Color(
                                                              0xffC4C4C4),
                                                      backgroundImage: NetworkImage(
                                                          "$getimage${control.filteredStudents[index].fileId}"),
                                                    );
                                                  } else {
                                                    return CircleAvatar(
                                                      maxRadius: 60,
                                                      backgroundColor:
                                                          const Color(
                                                              0xffC4C4C4),
                                                      child:
                                                          LoadingAnimationWidget
                                                              .inkDrop(
                                                        color: Theme.of(context)
                                                            .primaryColor,
                                                        size: 30,
                                                      ),
                                                    );
                                                  }
                                                },
                                              )
                                            : CircleAvatar(
                                                maxRadius: 60,
                                                backgroundColor:
                                                    const Color(0xffC4C4C4),
                                                child: Text(
                                                  control
                                                      .filteredStudents[index]
                                                      .fullName!
                                                      .substring(0, 1)
                                                      .toUpperCase(),
                                                  style: Get
                                                      .textTheme.titleLarge!
                                                      .copyWith(
                                                    fontSize: 26,
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                ),
                                              ),
                                      ],
                                    ),
                                    Text(
                                      "${control.filteredStudents[index].fullName}",
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyMedium!
                                          .copyWith(
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold,
                                          ),
                                    ),
                                    Padding(
                                      padding:
                                          const EdgeInsets.only(bottom: 20.0),
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            prefs!.getString(languageKey) ==
                                                    "ar"
                                                ? "${"Class".tr}: ${control.filteredStudents[index].classes!.name}"
                                                    .tr
                                                : "${"Class".tr}: ${control.filteredStudents[index].classes!.enName}"
                                                    .tr,
                                            style:
                                                Get.theme.textTheme.bodyMedium,
                                          ),
                                          Text(
                                            prefs!.getString(languageKey) ==
                                                    "ar"
                                                ? " ${"Division".tr}: ${control.filteredStudents[index].division!.name}"
                                                    .tr
                                                : " ${"Division".tr}: ${control.filteredStudents[index].division!.enName}"
                                                    .tr,
                                            style:
                                                Get.theme.textTheme.bodyMedium,
                                          ),
                                        ],
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(top: 8.0),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          // زر الجرعات (Vaccines / Illness)
                                          Builder(builder: (context) {
                                            return IconButton(
                                              style: ButtonStyle(
                                                maximumSize:
                                                    WidgetStateProperty.all(
                                                        const Size(35, 35)),
                                                minimumSize:
                                                    WidgetStateProperty.all(
                                                        const Size(35, 35)),
                                                iconSize:
                                                    WidgetStateProperty.all(14),
                                                shape: WidgetStateProperty.all(
                                                  RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            5),
                                                  ),
                                                ),
                                                backgroundColor:
                                                    WidgetStateProperty.all(
                                                  Theme.of(context)
                                                      .primaryColorLight,
                                                ),
                                              ),
                                              icon: const Icon(VMS_Icons.dose),
                                              color: Colors.white,
                                              onPressed: () async {
                                                final RenderBox button =
                                                    context.findRenderObject()
                                                        as RenderBox;
                                                final RenderBox overlay =
                                                    Overlay.of(context)
                                                            .context
                                                            .findRenderObject()
                                                        as RenderBox;
                                                final Offset position = button
                                                    .localToGlobal(Offset.zero,
                                                        ancestor: overlay);

                                                final selected =
                                                    await showMenu<String>(
                                                  context: context,
                                                  position:
                                                      RelativeRect.fromLTRB(
                                                    position.dx,
                                                    position.dy +
                                                        button.size.height,
                                                    overlay.size.width -
                                                        position.dx,
                                                    0,
                                                  ),
                                                  color: Get.theme.cardColor,
                                                  shape: RoundedRectangleBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              5)),
                                                  items: [
                                                    PopupMenuItem<String>(
                                                      value: 'Vaccines',
                                                      child: Text('Vaccines'.tr,
                                                          style: Get
                                                              .theme
                                                              .textTheme
                                                              .bodyMedium),
                                                    ),
                                                    PopupMenuItem<String>(
                                                      value: 'Illness',
                                                      child: Text('Illness'.tr,
                                                          style: Get
                                                              .theme
                                                              .textTheme
                                                              .bodyMedium),
                                                    ),
                                                  ],
                                                );

                                                if (selected == 'Vaccines') {
                                                  Get.find<
                                                          Vaccines_Controller>()
                                                      .initialdata();
                                                  Get_Students_Vacciness_API(
                                                          context)
                                                      .Get_Students_Vacciness(
                                                    studentId: control
                                                        .filteredStudents[index]
                                                        .id,
                                                    index_of_student: index,
                                                  );
                                                } else if (selected ==
                                                    'Illness') {
                                                  Get.find<Illness_Controller>()
                                                      .initialdata();
                                                  Get_Students_Illness_API(
                                                          context)
                                                      .Get_Students_Illness(
                                                    studentId: control
                                                        .filteredStudents[index]
                                                        .id,
                                                    index_of_Student: index,
                                                  );
                                                }
                                              },
                                            );
                                          }),

                                          // زر الوقت (بدون منيو)
                                          IconButton(
                                            style: ButtonStyle(
                                              maximumSize:
                                                  WidgetStateProperty.all(
                                                      const Size(35, 35)),
                                              minimumSize:
                                                  WidgetStateProperty.all(
                                                      const Size(35, 35)),
                                              iconSize:
                                                  WidgetStateProperty.all(14),
                                              shape: WidgetStateProperty.all(
                                                RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(5),
                                                ),
                                              ),
                                              backgroundColor:
                                                  WidgetStateProperty.all(
                                                Theme.of(context)
                                                    .primaryColorLight,
                                              ),
                                            ),
                                            icon: const Icon(Icons.access_time),
                                            color: Colors.white,
                                            onPressed: () {
                                              // ضع الوظيفة هنا
                                            },
                                          ),

                                          // زر الملاحظات (بدون منيو)
                                          IconButton(
                                            style: ButtonStyle(
                                              maximumSize:
                                                  WidgetStateProperty.all(
                                                      const Size(35, 35)),
                                              minimumSize:
                                                  WidgetStateProperty.all(
                                                      const Size(35, 35)),
                                              iconSize:
                                                  WidgetStateProperty.all(14),
                                              shape: WidgetStateProperty.all(
                                                RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(5),
                                                ),
                                              ),
                                              backgroundColor:
                                                  WidgetStateProperty.all(
                                                Theme.of(context)
                                                    .primaryColorLight,
                                              ),
                                            ),
                                            icon: const Icon(Icons
                                                .my_library_books_outlined),
                                            color: Colors.white,
                                            onPressed: () {
                                              // ضع الوظيفة هنا
                                            },
                                          ),

                                          // زر التحليلات (Rewards / Penalties)
                                          Builder(builder: (context) {
                                            return IconButton(
                                              style: ButtonStyle(
                                                maximumSize:
                                                    WidgetStateProperty.all(
                                                        const Size(35, 35)),
                                                minimumSize:
                                                    WidgetStateProperty.all(
                                                        const Size(35, 35)),
                                                iconSize:
                                                    WidgetStateProperty.all(14),
                                                shape: WidgetStateProperty.all(
                                                  RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            5),
                                                  ),
                                                ),
                                                backgroundColor:
                                                    WidgetStateProperty.all(
                                                  Theme.of(context)
                                                      .primaryColorLight,
                                                ),
                                              ),
                                              icon: const Icon(
                                                  Icons.analytics_sharp),
                                              color: Colors.white,
                                              onPressed: () async {
                                                final RenderBox button =
                                                    context.findRenderObject()
                                                        as RenderBox;
                                                final RenderBox overlay =
                                                    Overlay.of(context)
                                                            .context
                                                            .findRenderObject()
                                                        as RenderBox;
                                                final Offset position = button
                                                    .localToGlobal(Offset.zero,
                                                        ancestor: overlay);

                                                final selected =
                                                    await showMenu<String>(
                                                  context: context,
                                                  position:
                                                      RelativeRect.fromLTRB(
                                                    position.dx,
                                                    position.dy +
                                                        button.size.height,
                                                    overlay.size.width -
                                                        position.dx,
                                                    0,
                                                  ),
                                                  color: Get.theme.cardColor,
                                                  shape: RoundedRectangleBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              5)),
                                                  items: [
                                                    PopupMenuItem<String>(
                                                      value: 'Rewards',
                                                      child: Text('Rewards'.tr,
                                                          style: Get
                                                              .theme
                                                              .textTheme
                                                              .bodyMedium),
                                                    ),
                                                    PopupMenuItem<String>(
                                                      value: 'Penalties',
                                                      child: Text(
                                                          'Penalties'.tr,
                                                          style: Get
                                                              .theme
                                                              .textTheme
                                                              .bodyMedium),
                                                    ),
                                                  ],
                                                );

                                                if (selected == 'Rewards') {
                                                  final controllers = Get.put(
                                                      Penaltiesandrewardscontroller());
                                                  controllers.fetchRewards(
                                                    int.parse(control
                                                        .filteredStudents[index]
                                                        .id
                                                        .toString()),
                                                  );
                                                  Get.dialog(
                                                      barrierDismissible: false,
                                                      Childrewardsdialog());
                                                } else if (selected ==
                                                    'Penalties') {
                                                  final controllers = Get.put(
                                                      Penaltiesandrewardscontroller());
                                                  controllers.fetchPenalties(
                                                    int.parse(control
                                                        .filteredStudents[index]
                                                        .id
                                                        .toString()),
                                                  );
                                                  Get.dialog(
                                                      barrierDismissible: false,
                                                      Childpenaltiesdialog());
                                                }
                                              },
                                            );
                                          }),
                                        ],
                                      ),
                                    ),
                                  ],
                                )),
                          ),
                        );
                      } else {
                        return HoverScaleCard(
                          child: AnimatedBorder(
                            child: Container(
                                padding: const EdgeInsets.all(20),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(5),
                                    border: Border.all(
                                        color: Theme.of(context).primaryColor,
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
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        control.filteredStudents[index]
                                                    .fileId !=
                                                null
                                            ? FutureBuilder(
                                                future: precacheImage(
                                                  NetworkImage(
                                                      "$getimage${control.filteredStudents[index].fileId}"),
                                                  context,
                                                ),
                                                builder: (context, snapshot) {
                                                  if (snapshot
                                                          .connectionState ==
                                                      ConnectionState.done) {
                                                    return CircleAvatar(
                                                      maxRadius: 60,
                                                      backgroundColor:
                                                          const Color(
                                                              0xffC4C4C4),
                                                      backgroundImage: NetworkImage(
                                                          "$getimage${control.filteredStudents[index].fileId}"),
                                                    );
                                                  } else {
                                                    return CircleAvatar(
                                                      maxRadius: 60,
                                                      backgroundColor:
                                                          const Color(
                                                              0xffC4C4C4),
                                                      child:
                                                          LoadingAnimationWidget
                                                              .inkDrop(
                                                        color: Theme.of(context)
                                                            .primaryColor,
                                                        size: 30,
                                                      ),
                                                    );
                                                  }
                                                },
                                              )
                                            : CircleAvatar(
                                                maxRadius: 60,
                                                backgroundColor:
                                                    const Color(0xffC4C4C4),
                                                child: Text(
                                                  control
                                                      .filteredStudents[index]
                                                      .fullName!
                                                      .substring(0, 1)
                                                      .toUpperCase(),
                                                  style: Get
                                                      .textTheme.titleLarge!
                                                      .copyWith(
                                                    fontSize: 26,
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                ),
                                              ),
                                      ],
                                    ),
                                    Text(
                                      "${control.filteredStudents[index].fullName}",
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyMedium!
                                          .copyWith(
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold,
                                          ),
                                    ),
                                    Padding(
                                      padding:
                                          const EdgeInsets.only(right: 8.0),
                                      child: Column(
                                        spacing: 15.0,
                                        children: [
                                          Text(
                                            "Request State".tr,
                                            style: Theme.of(context)
                                                .textTheme
                                                .bodyMedium!
                                                .copyWith(
                                                    fontSize: 18,
                                                    color: Colors.black,
                                                    fontWeight:
                                                        FontWeight.normal),
                                          ),
                                          Row(
                                            spacing: 25.0,
                                            mainAxisSize: MainAxisSize.min,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Text(
                                                "${control.filteredStudents[index].type!.tr}",
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .bodyMedium!
                                                    .copyWith(
                                                        fontSize: 16,
                                                        color: control
                                                                    .filteredStudents[
                                                                        index]
                                                                    .type ==
                                                                "Rejected".tr
                                                            ? const Color(
                                                                0xffB27671)
                                                            : control
                                                                        .filteredStudents[
                                                                            index]
                                                                        .type ==
                                                                    "Pending".tr
                                                                ? const Color(
                                                                    0xff297686)
                                                                : const Color(
                                                                    0xff779DB6),
                                                        fontWeight:
                                                            FontWeight.normal),
                                              ),
                                              Icon(
                                                  control
                                                              .filteredStudents[
                                                                  index]
                                                              .type ==
                                                          "Rejected".tr
                                                      ? Icons.close
                                                      : control
                                                                  .filteredStudents[
                                                                      index]
                                                                  .type ==
                                                              "Pending".tr
                                                          ? Icons
                                                              .timelapse_outlined
                                                          : Icons.timer,
                                                  color: control
                                                              .filteredStudents[
                                                                  index]
                                                              .type ==
                                                          "Rejected".tr
                                                      ? const Color(0xffB27671)
                                                      : control
                                                                  .filteredStudents[
                                                                      index]
                                                                  .type ==
                                                              "Pending".tr
                                                          ? const Color(
                                                              0xff297686)
                                                          : const Color(
                                                              0xff779DB6))
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(top: 8.0),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          IconButton(
                                            style: ButtonStyle(
                                                maximumSize:
                                                    WidgetStateProperty.all(
                                                        const Size(35, 35)),
                                                minimumSize:
                                                    WidgetStateProperty.all(
                                                        const Size(35, 35)),
                                                iconSize:
                                                    WidgetStateProperty.all(14),
                                                shape: WidgetStateProperty.all(
                                                    RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(5),
                                                )),
                                                backgroundColor:
                                                    WidgetStateProperty.all(
                                                        const Color(
                                                            0xffB03D3D))),
                                            onPressed: () {
                                              Get.dialog(VMSAlertDialog(
                                                  action: [
                                                    ButtonDialog(
                                                      width: 100,
                                                      text: "Delete".tr,
                                                      onPressed: () async {
                                                        // await Delete_Student_API(
                                                        //     context)
                                                        //     .Delete_Student(
                                                        //     id: control
                                                        //         .filteredStudents[
                                                        //     index]
                                                        //         .id
                                                        //         .toString());
                                                      },
                                                      color: const Color(
                                                          0xffB03D3D),
                                                    ),
                                                    const SizedBox(
                                                      width: 10,
                                                    ),
                                                    ButtonDialog(
                                                        width: 100,
                                                        text: "Cancel".tr,
                                                        onPressed: () {
                                                          Get.back();
                                                        },
                                                        color: Theme.of(context)
                                                            .primaryColor)
                                                  ],
                                                  contents: Container(
                                                    width: 300,
                                                    child: Text(
                                                        style: TextStyle(
                                                            color:
                                                                Colors.black),
                                                        maxLines: 3,
                                                        "Do You Want To Deletee"
                                                                .tr +
                                                            "${control.filteredStudents[index].fullName}" +
                                                            "Studentt".tr),
                                                  ),
                                                  apptitle:
                                                      "Delete Students".tr,
                                                  subtitle: "none"));
                                            },
                                            icon: const Icon(VMS_Icons.bin),
                                            color: Colors.white,
                                          ),
                                          IconButton(
                                            style: ButtonStyle(
                                                maximumSize:
                                                    WidgetStateProperty.all(
                                                        const Size(35, 35)),
                                                minimumSize:
                                                    WidgetStateProperty.all(
                                                        const Size(35, 35)),
                                                iconSize:
                                                    WidgetStateProperty.all(14),
                                                shape: WidgetStateProperty.all(
                                                    RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(5),
                                                )),
                                                backgroundColor:
                                                    WidgetStateProperty.all(
                                                        Theme.of(context)
                                                            .primaryColorLight)),
                                            onPressed: () async {
                                              Get.find<Illness_Controller>()
                                                  .initialdata();
                                              await Get_Students_Illness_API(
                                                      context)
                                                  .Get_Students_Illness(
                                                      studentId: control
                                                          .filteredStudents[
                                                              index]
                                                          .id,
                                                      index_of_Student: index);
                                            },
                                            icon: const Icon(VMS_Icons.vir),
                                            color: Colors.white,
                                          ),
                                          IconButton(
                                            style: ButtonStyle(
                                                maximumSize:
                                                    WidgetStateProperty.all(
                                                        const Size(35, 35)),
                                                minimumSize:
                                                    WidgetStateProperty.all(
                                                        const Size(35, 35)),
                                                iconSize:
                                                    WidgetStateProperty.all(14),
                                                shape: WidgetStateProperty.all(
                                                    RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(5),
                                                )),
                                                backgroundColor:
                                                    WidgetStateProperty.all(
                                                        Theme.of(context)
                                                            .primaryColorLight)),
                                            onPressed: () async {
                                              Get.find<Vaccines_Controller>()
                                                  .initialdata();
                                              await Get_Students_Vacciness_API(
                                                      context)
                                                  .Get_Students_Vacciness(
                                                      studentId: control
                                                          .filteredStudents[
                                                              index]
                                                          .id,
                                                      index_of_student: index);
                                            },
                                            icon: const Icon(VMS_Icons.dose),
                                            color: Colors.white,
                                          ),
                                          IconButton(
                                            style: ButtonStyle(
                                                maximumSize:
                                                    WidgetStateProperty.all(
                                                        const Size(35, 35)),
                                                minimumSize:
                                                    WidgetStateProperty.all(
                                                        const Size(35, 35)),
                                                iconSize:
                                                    WidgetStateProperty.all(14),
                                                shape: WidgetStateProperty.all(
                                                    RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(5),
                                                )),
                                                backgroundColor:
                                                    WidgetStateProperty.all(
                                                        Theme.of(context)
                                                            .primaryColorLight)),
                                            onPressed: () async {
                                              Get.find<
                                                      Add_Students_Controller>()
                                                  .resetError();

                                              await Get_Students_Information_API_Gua(
                                                      context)
                                                  .Get_Students_Information(
                                                      canEdit: false,
                                                      StudentsID: control
                                                          .filteredStudents[
                                                              index]
                                                          .id,
                                                      index: index);
                                            },
                                            icon: const Icon(VMS_Icons.vcard),
                                            color: Colors.white,
                                          ),
                                        ],
                                      ),
                                    )
                                  ],
                                )),
                          ),
                        );
                      }
                    },
                  )
                : Center(
                    child: Text("No Students".tr,
                        style: Theme.of(context).textTheme.titleLarge!.copyWith(
                            fontSize: 22, fontWeight: FontWeight.normal)));
      }),
    );
  }
}
