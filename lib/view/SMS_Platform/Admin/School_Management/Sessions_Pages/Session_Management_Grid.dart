import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:get/get.dart';
import 'package:vms_school/Icons_File/v_m_s__icons_icons.dart';
import 'package:vms_school/Link/API/AdminAPI/School/School_Screen_APIs/Sessions/CloseSessionAPI.dart';
import 'package:vms_school/Link/API/AdminAPI/School/School_Screen_APIs/Sessions/Delete_Session_API.dart';
import 'package:vms_school/Link/API/AdminAPI/School/School_Screen_APIs/Sessions/Edit_Session_API.dart';
import 'package:vms_school/Link/Controller/AdminController/Employee_Controllers/Add_Data_controller.dart';
import 'package:vms_school/Link/Controller/AdminController/School_Controllers/Session_Controller.dart';
import 'package:vms_school/Translate/local_controller.dart';
import 'package:vms_school/view/Both_Platform/widgets/ButtonsDialog.dart';
import 'package:vms_school/view/Both_Platform/widgets/Calender.dart';
import 'package:vms_school/view/Both_Platform/widgets/GridAnimation.dart';
import 'package:vms_school/view/Both_Platform/widgets/Schema_Widget.dart';
import 'package:vms_school/view/Both_Platform/widgets/TextFildWithUpper.dart';
import 'package:vms_school/view/Both_Platform/widgets/TextFildWithUpper_Num.dart';
import 'package:vms_school/view/Both_Platform/widgets/VMSAlertDialog.dart';

class SessionManagementGrid extends StatelessWidget {
  const SessionManagementGrid({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController secondSemDay = TextEditingController();
    TextEditingController firstSemDay = TextEditingController();
    final screenWidth = MediaQuery.of(context).size.width;
    int getCrossAxisCount() {
      if (screenWidth >= 1278) return 5;
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

    return Directionality(
      textDirection:
          Get.find<LocalizationController>().currentLocale.value.languageCode ==
                  'ar'
              ? TextDirection.rtl
              : TextDirection.ltr,
      child: GetBuilder<SessionController>(builder: (control) {
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
                  return Container(
                          padding: const EdgeInsets.all(20),
                          decoration:
                              BoxDecoration(
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
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              SchemaWidget(width: 120, height: 20),
                              SchemaWidget(width: 100, height: 20),
                              Row(
                                children: [
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      SchemaWidget(width: 120, height: 20),
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(top: 8.0),
                                        child: SchemaWidget(
                                            width: 120, height: 20),
                                      ),
                                    ],
                                  )
                                ],
                              )
                            ],
                          ))
                      .animate(onPlay: (controller) => controller.repeat())
                      .shimmer(
                          angle: 1,
                          color: Colors.grey.withOpacity(0.2),
                          duration: const Duration(seconds: 1),
                          delay: const Duration(seconds: 1));
                },
              )
            : control.sessionsss!.isEmpty
                ? Center(
                    child: Text("No Sessions".tr,
                        style: Theme.of(context).textTheme.titleLarge!.copyWith(
                            fontSize: 22, fontWeight: FontWeight.normal)))
                : GridView.builder(
                    padding:
                        const EdgeInsets.only(top: 10, left: 40, right: 40),
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: getCrossAxisCount(),
                        crossAxisSpacing: 20.0,
                        mainAxisSpacing: 20.0,
                        childAspectRatio: getChildAspectRatio()),
                    itemCount: control.Sessionss.length,
                    itemBuilder: (context, index) {
                      return HoverScaleCard(
                        child: Stack(
                          children: [
                            GestureDetector(
                              onTap: () {
                                if (Get.find<Add_Data_controller>().roll ==
                                    "observer") {
                                  //
                                  // {
                                  //   Get.find<SessionController>()
                                  //       .sessionController
                                  //       .text = control.Sessionss[index]
                                  //   ['name']
                                  //       .toString()
                                  //       .substring(0, 4);
                                  //   Get.find<SessionController>().currentYear.value =
                                  //       int.parse(control.Sessionss[index]['name']
                                  //           .toString()
                                  //           .substring(0, 4)) +
                                  //           1;
                                  //   Get.find<SessionController>().startDate.value =
                                  //       DateTime.parse(
                                  //           control.Sessionss[index]['startDate']);
                                  //   Get.find<SessionController>().endDate.value =
                                  //       DateTime.parse(
                                  //           control.Sessionss[index]['endDate']);
                                  //
                                  //   Get.dialog(barrierDismissible: false,
                                  //       GetBuilder<SessionController>(
                                  //           builder: (controller) {
                                  //             return VMSAlertDialog(
                                  //                 action: [],
                                  //                 contents: Container(
                                  //                   width: 620,
                                  //                   child: Column(
                                  //                     mainAxisSize: MainAxisSize.min,
                                  //                     crossAxisAlignment:
                                  //                     CrossAxisAlignment.start,
                                  //                     mainAxisAlignment:
                                  //                     MainAxisAlignment.start,
                                  //                     children: [
                                  //                       GetBuilder<SessionController>(
                                  //                           builder: (controllers) {
                                  //                             return Row(
                                  //                               mainAxisAlignment:
                                  //                               MainAxisAlignment.start,
                                  //                               crossAxisAlignment:
                                  //                               CrossAxisAlignment.end,
                                  //                               children: [
                                  //                                 SizedBox(
                                  //                                   width: 220,
                                  //                                   child: Textfildwithupper_num(
                                  //                                     enabled: false,
                                  //                                     onChanged: (value) {
                                  //                                       controller
                                  //                                           .updateYear(value);
                                  //                                       if (value.isNotEmpty) {
                                  //                                         controller
                                  //                                             .updateFieldError(
                                  //                                             "name", false);
                                  //                                       }
                                  //                                     },
                                  //                                     isRequired: true,
                                  //                                     isError:
                                  //                                     controller.IsnameError,
                                  //                                     Uptext: "Study Year".tr,
                                  //                                     hinttext: "Enter Year".tr,
                                  //                                     sessionController:
                                  //                                     controller
                                  //                                         .sessionController,
                                  //                                     borderColor:
                                  //                                     controllers.borderColor,
                                  //                                   ),
                                  //                                 ),
                                  //                                 Obx(() {
                                  //                                   return Padding(
                                  //                                     padding:
                                  //                                     const EdgeInsets.only(
                                  //                                         left: 8.0,
                                  //                                         right: 8.0),
                                  //                                     child: Container(
                                  //                                       height: 40,
                                  //                                       alignment:
                                  //                                       Alignment.center,
                                  //                                       child: Text(
                                  //                                         "/${controllers.currentYear.value}",
                                  //                                         style: Get
                                  //                                             .theme
                                  //                                             .textTheme
                                  //                                             .displayLarge!
                                  //                                             .copyWith(
                                  //                                           fontSize: 22,
                                  //                                         ),
                                  //                                       ),
                                  //                                     ),
                                  //                                   );
                                  //                                 }),
                                  //                               ],
                                  //                             );
                                  //                           }),
                                  //                       Padding(
                                  //                         padding: const EdgeInsets.only(
                                  //                             top: 15.0),
                                  //                         child: Wrap(
                                  //                           spacing: 20.0,
                                  //                           runSpacing: 20.0,
                                  //                           children: [
                                  //                             DateSelector(
                                  //                               enabled: false,
                                  //                               width: 300,
                                  //                               label: "Start Date".tr,
                                  //                               dateValue:
                                  //                               controller.startDate,
                                  //                               onSelectDate: controller
                                  //                                   .selectStartDate,
                                  //                               isRequired: true,
                                  //                               isError: controller
                                  //                                   .startDate.value ==
                                  //                                   null, // تحقق من الخطأ
                                  //                             ),
                                  //                             DateSelector(
                                  //                               enabled: false,
                                  //                               width: 300,
                                  //                               label: "End Date".tr,
                                  //                               dateValue: controller.endDate,
                                  //                               onSelectDate:
                                  //                               controller.selectEndDate,
                                  //                               isRequired: true,
                                  //                               isError: controller
                                  //                                   .endDate.value ==
                                  //                                   null ||
                                  //                                   controller.endDate.value!
                                  //                                       .isBefore(controller
                                  //                                       .startDate
                                  //                                       .value
                                  //                                       ?.add(Duration(
                                  //                                       days:
                                  //                                       1)) ??
                                  //                                       DateTime.now()),
                                  //                             ),
                                  //                           ],
                                  //                         ),
                                  //                       )
                                  //                     ],
                                  //                   ),
                                  //                 ),
                                  //                 apptitle: "Edit Session".tr,
                                  //                 subtitle: "none");
                                  //           }));
                                  // }
                                } else {
                                  if (control.Sessionss[index]['status']
                                          .toString() !=
                                      "Closed") {
                                    if (Get.find<Add_Data_controller>().roll ==
                                        "admin") {
                                      Get.dialog(VMSAlertDialog(
                                          action: [
                                            ButtonDialog(
                                                text: "Yes Close".tr,
                                                onPressed: () async {
                                                  await Closesessionapi(context)
                                                      .Closesession(
                                                          index: index,
                                                          sessionId: control
                                                              .sessionsss![
                                                                  index]
                                                              .id);
                                                },
                                                color: const Color(0xff134B70),
                                                width: 120),
                                            ButtonDialog(
                                                text: "Cancel".tr,
                                                onPressed: () {
                                                  Get.back();
                                                },
                                                color: const Color(0xffB03D3D),
                                                width: 120),
                                          ],
                                          contents: SizedBox(
                                              width: 400,
                                              child: Text(
                                                "Close".tr +
                                                    " ${control.Sessionss[index]['name']}",
                                                style: const TextStyle(
                                                    fontSize: 16),
                                              )),
                                          apptitle: "Close Session".tr,
                                          subtitle: "none"));
                                    }
                                  }
                                }
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
                                  child: Stack(
                                    fit: StackFit.passthrough,
                                    children: [
                                      Center(
                                        child: Text(
                                          "${control.Sessionss[index]['name']!.replaceRange(4, 9, "").replaceRange(0, 2, "20\n")}",
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                              color: const Color(0xff134B70)
                                                  .withOpacity(0.2),
                                              fontWeight: FontWeight.bold,
                                              fontSize: 60),
                                        ),
                                      ),
                                      Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          Text(
                                              "${control.Sessionss[index]['name']}",
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .bodyMedium!
                                                  .copyWith(
                                                    fontSize: 20,
                                                  )),
                                          Text(
                                              "${control.Sessionss[index]['status']}"
                                                  .toString()
                                                  .tr,
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .bodyMedium!
                                                  .copyWith(
                                                    fontSize: 26,
                                                    fontWeight: FontWeight.bold,
                                                    color: control.Sessionss[
                                                                    index]
                                                                    ['status']
                                                                .toString()
                                                                .tr ==
                                                            "Closed".tr
                                                        ? const Color(
                                                            0xffB03D3D)
                                                        : const Color(
                                                            0xff2F9742),
                                                  )),
                                          Row(
                                            children: [
                                              Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                mainAxisAlignment:
                                                    MainAxisAlignment.start,
                                                children: [
                                                  Text(
                                                      "Start Date :".tr +
                                                          " ${control.Sessionss[index]['startDate']}",
                                                      style: Get.theme.textTheme
                                                          .displayLarge!
                                                          .copyWith(
                                                        fontSize: 16,
                                                        fontWeight:
                                                            FontWeight.normal,
                                                      )),
                                                  Text(
                                                      "End Date :".tr +
                                                          " ${control.Sessionss[index]['endDate']}",
                                                      style: Get.theme.textTheme
                                                          .displayLarge!
                                                          .copyWith(
                                                        fontSize: 16,
                                                        fontWeight:
                                                            FontWeight.normal,
                                                      )),
                                                ],
                                              )
                                            ],
                                          )
                                        ],
                                      ),
                                    ],
                                  )),
                            ),
                            if (Get.find<Add_Data_controller>().roll !=
                                "observer")
                              if (Get.find<Add_Data_controller>().roll !=
                                  "supervisor")
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    if (Get.find<Add_Data_controller>().roll !=
                                        "subAdmin")
                                      if (control.Sessionss[index]
                                              ['hasStudents'] ==
                                          false)
                                        _iconButton(
                                          iconData: VMS_Icons.bin,
                                          color: const Color(0xffB03D3D),
                                          onPressed: () {
                                            Get.dialog(
                                              VMSAlertDialog(
                                                action: [
                                                  ButtonDialog(
                                                      text: "Delete".tr,
                                                      onPressed: () async {
                                                        await Delete_Session_API(
                                                                context)
                                                            .Delete_Session(
                                                                sessionId: control
                                                                        .Sessionss[
                                                                    index]['id']);
                                                      },
                                                      color: const Color(
                                                          0xffB03D3D),
                                                      width: 120),
                                                  ButtonDialog(
                                                      text: "Cancel".tr,
                                                      onPressed: () async {},
                                                      color: Theme.of(context)
                                                          .primaryColor,
                                                      width: 120)
                                                ],
                                                contents: Column(
                                                  mainAxisSize:
                                                      MainAxisSize.min,
                                                  children: [
                                                    SizedBox(
                                                      width: 400,
                                                      child: Text(
                                                        "Do You Want To Deletess"
                                                                .tr +
                                                            " (${control.Sessionss[index]['name']}) " +
                                                            "Sessionn".tr,
                                                        style: const TextStyle(
                                                            fontSize: 16),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                                apptitle: "Delete Session".tr,
                                                subtitle: "none",
                                              ),
                                            );
                                          },
                                        ),
                                    _iconButton(
                                      iconData: Icons.edit_note_outlined,
                                      color: Theme.of(context).primaryColor,
                                      onPressed: () {
                                        Get.find<SessionController>()
                                            .sessionController
                                            .text = control.Sessionss[index]
                                                ['name']
                                            .toString()
                                            .substring(0, 4);
                                        Get.find<SessionController>()
                                            .currentYear
                                            .value = int.parse(control
                                                .Sessionss[index]['name']
                                                .toString()
                                                .substring(0, 4)) +
                                            1;

                                        firstSemDay.text = control
                                            .Sessionss[index]['firstCount']
                                            .toString();
                                        secondSemDay.text = control
                                            .Sessionss[index]['secondCount']
                                            .toString();
                                        Get.find<SessionController>()
                                                .startDate
                                                .value =
                                            DateTime.parse(control
                                                .Sessionss[index]['startDate']);
                                        Get.find<SessionController>()
                                                .endDate
                                                .value =
                                            DateTime.parse(control
                                                .Sessionss[index]['endDate']);
                                        Get.find<SessionController>()
                                                .firstsemesterStartDate
                                                .value =
                                            DateTime.parse(
                                                control.Sessionss[index]
                                                    ['firstStart']);
                                        Get.find<SessionController>()
                                                .firstsemesterendDate
                                                .value =
                                            DateTime.parse(control
                                                .Sessionss[index]['firstEnd']);

                                        Get.find<SessionController>()
                                                .secondsemesterStartDate
                                                .value =
                                            DateTime.parse(
                                                control.Sessionss[index]
                                                    ['secondStart']);
                                        Get.find<SessionController>()
                                                .secondsemesterendDate
                                                .value =
                                            DateTime.parse(control
                                                .Sessionss[index]['secondEnd']);

                                        Get.dialog(barrierDismissible: false,
                                            GetBuilder<SessionController>(
                                                builder: (controller) {
                                          return VMSAlertDialog(
                                              action: [
                                                ButtonDialog(
                                                    text: "Edit Session".tr,
                                                    onPressed: () async {
                                                      bool isStartEmpty = controller
                                                                  .startDate
                                                                  .value ==
                                                              null ||
                                                          controller.startDate
                                                                  .value
                                                                  .toString() ==
                                                              "";

                                                      bool isEndEmpty = controller
                                                                  .endDate
                                                                  .value ==
                                                              null ||
                                                          controller
                                                                  .endDate.value
                                                                  .toString() ==
                                                              "";
                                                      bool isStartFirstEmpty = controller
                                                                  .firstsemesterStartDate
                                                                  .value ==
                                                              null ||
                                                          controller
                                                                  .firstsemesterStartDate
                                                                  .value
                                                                  .toString() ==
                                                              "";
                                                      bool isStartSecondEmpty = controller
                                                                  .secondsemesterStartDate
                                                                  .value ==
                                                              null ||
                                                          controller
                                                                  .secondsemesterStartDate
                                                                  .value
                                                                  .toString() ==
                                                              "";
                                                      bool isEndfirstEmpty = controller
                                                                  .firstsemesterendDate
                                                                  .value ==
                                                              null ||
                                                          controller
                                                                  .firstsemesterendDate
                                                                  .value
                                                                  .toString() ==
                                                              "";
                                                      bool isEndSecondEmpty = controller
                                                                  .secondsemesterendDate
                                                                  .value ==
                                                              null ||
                                                          controller
                                                                  .secondsemesterendDate
                                                                  .value
                                                                  .toString() ==
                                                              "";
                                                      bool isfirstDaysEmpty =
                                                          firstSemDay.text
                                                              .trim()
                                                              .isEmpty;
                                                      bool isSecondDaysEmpty =
                                                          secondSemDay.text
                                                              .trim()
                                                              .isEmpty;

                                                      bool isNameEmpty = controller
                                                              .sessionController
                                                              .text
                                                              .trim()
                                                              .isEmpty ||
                                                          controller
                                                                  .sessionController
                                                                  .text
                                                                  .length <
                                                              4 ||
                                                          int.parse(controller
                                                                  .sessionController
                                                                  .text) >
                                                              2098;

                                                      controller
                                                          .updateFieldError(
                                                              "name",
                                                              isNameEmpty);
                                                      controller
                                                          .updateFieldError(
                                                              "start",
                                                              isStartEmpty);
                                                      controller
                                                          .updateFieldError(
                                                              "end",
                                                              isEndEmpty);
                                                      controller
                                                          .updateFieldError(
                                                              "firstStart",
                                                              isStartFirstEmpty);
                                                      controller
                                                          .updateFieldError(
                                                              "firstEnd",
                                                              isEndfirstEmpty);
                                                      controller.updateFieldError(
                                                          "secondStart",
                                                          isStartSecondEmpty);
                                                      controller
                                                          .updateFieldError(
                                                              "secondEnd",
                                                              isEndSecondEmpty);
                                                      controller
                                                          .updateFieldError(
                                                              "firstDays",
                                                              isfirstDaysEmpty);
                                                      controller
                                                          .updateFieldError(
                                                              "secondDays",
                                                              isSecondDaysEmpty);

                                                      if (!(isNameEmpty ||
                                                          isStartEmpty ||
                                                          isEndEmpty ||
                                                          isStartFirstEmpty ||
                                                          isEndfirstEmpty ||
                                                          isStartSecondEmpty ||
                                                          isEndSecondEmpty ||
                                                          isfirstDaysEmpty ||
                                                          isSecondDaysEmpty)) {
                                                        await Edit_Session_API(context).Edit_Session(
                                                            sessionId:
                                                                control.Sessionss[index]
                                                                    ['id'],
                                                            year:
                                                                "${Get.find<SessionController>().sessionController.text}-${int.parse(Get.find<SessionController>().sessionController.text) + 1}",
                                                            startDate:
                                                                Get.find<SessionController>()
                                                                    .startDate
                                                                    .value
                                                                    .toString(),
                                                            endDate:
                                                                Get.find<SessionController>()
                                                                    .endDate
                                                                    .value
                                                                    .toString(),
                                                            firstStart:
                                                                Get.find<SessionController>()
                                                                    .firstsemesterStartDate
                                                                    .value
                                                                    .toString(),
                                                            firstEnd: Get.find<SessionController>()
                                                                .firstsemesterendDate
                                                                .value
                                                                .toString(),
                                                            secondStart:
                                                                Get.find<SessionController>()
                                                                    .secondsemesterStartDate
                                                                    .value
                                                                    .toString(),
                                                            secondEnd: Get.find<SessionController>()
                                                                .secondsemesterendDate
                                                                .value
                                                                .toString(),
                                                            firstDays: firstSemDay
                                                                .text,
                                                            secondDays:
                                                                secondSemDay.text);
                                                      }
                                                    },
                                                    color: Theme.of(context)
                                                        .primaryColor,
                                                    width: 90)
                                              ],
                                              contents: Container(
                                                width: 620,
                                                child: Column(
                                                  mainAxisSize:
                                                      MainAxisSize.min,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.start,
                                                  children: [
                                                    GetBuilder<
                                                            SessionController>(
                                                        builder: (controllers) {
                                                      return Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .start,
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .end,
                                                        children: [
                                                          SizedBox(
                                                            width: 220,
                                                            child:
                                                                Textfildwithupper_num(
                                                              onChanged:
                                                                  (value) {
                                                                controller
                                                                    .updateYear(
                                                                        value);
                                                                if (value
                                                                    .isNotEmpty) {
                                                                  controller
                                                                      .updateFieldError(
                                                                          "name",
                                                                          false);
                                                                }
                                                              },
                                                              isRequired: true,
                                                              isError: controller
                                                                  .IsnameError,
                                                              Uptext:
                                                                  "Study Year"
                                                                      .tr,
                                                              hinttext:
                                                                  "Enter Year"
                                                                      .tr,
                                                              sessionController:
                                                                  controller
                                                                      .sessionController,
                                                              borderColor:
                                                                  controllers
                                                                      .borderColor,
                                                            ),
                                                          ),
                                                          Obx(() {
                                                            return Padding(
                                                              padding:
                                                                  const EdgeInsets
                                                                      .only(
                                                                      left: 8.0,
                                                                      right:
                                                                          8.0),
                                                              child: Container(
                                                                height: 40,
                                                                alignment:
                                                                    Alignment
                                                                        .center,
                                                                child: Text(
                                                                  "/${controllers.currentYear.value}",
                                                                  style: Get
                                                                      .theme
                                                                      .textTheme
                                                                      .displayLarge!
                                                                      .copyWith(
                                                                    fontSize:
                                                                        22,
                                                                  ),
                                                                ),
                                                              ),
                                                            );
                                                          }),
                                                        ],
                                                      );
                                                    }),
                                                    Padding(
                                                      padding:
                                                          const EdgeInsets.only(
                                                              top: 15.0),
                                                      child: Wrap(
                                                        spacing: 20.0,
                                                        runSpacing: 20.0,
                                                        children: [
                                                          DateSelector(
                                                            width: 300,
                                                            label:
                                                                "Start Date".tr,
                                                            dateValue:
                                                                controller
                                                                    .startDate,
                                                            onSelectDate: controller
                                                                .selectStartDate,
                                                            isRequired: true,
                                                            isError: controller
                                                                    .startDate
                                                                    .value ==
                                                                null, // تحقق من الخطأ
                                                          ),
                                                          DateSelector(
                                                            width: 300,
                                                            label:
                                                                "End Date".tr,
                                                            dateValue:
                                                                controller
                                                                    .endDate,
                                                            onSelectDate:
                                                                controller
                                                                    .selectEndDate,
                                                            isRequired: true,
                                                            isError: controller
                                                                        .endDate
                                                                        .value ==
                                                                    null ||
                                                                controller.endDate.value!.isBefore(controller
                                                                        .startDate
                                                                        .value
                                                                        ?.add(Duration(
                                                                            days:
                                                                                1)) ??
                                                                    DateTime
                                                                        .now()),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                    Padding(
                                                      padding:
                                                          const EdgeInsets.only(
                                                              top: 15.0),
                                                      child: Wrap(
                                                        runAlignment:
                                                            WrapAlignment.start,
                                                        crossAxisAlignment:
                                                            WrapCrossAlignment
                                                                .start,
                                                        alignment:
                                                            WrapAlignment.start,
                                                        runSpacing: 20.0,
                                                        spacing: 20.0,
                                                        children: [
                                                          firstSemesterStartDate(
                                                            width: screenWidth >=
                                                                    690
                                                                ? 300
                                                                : (screenWidth) -
                                                                    70,
                                                            label:
                                                                "First Semester Start Date"
                                                                    .tr,
                                                            dateValue: controller
                                                                .firstsemesterStartDate,
                                                            onSelectDate: controller
                                                                .selectFirstSemsterStartDate,
                                                            isRequired: true,
                                                            isError: controller
                                                                .IsFirstStartError,
                                                          ),
                                                          FirstSemesterEndDate(
                                                            width: screenWidth >=
                                                                    690
                                                                ? 300
                                                                : (screenWidth) -
                                                                    70,
                                                            label:
                                                                "First Semester End Date"
                                                                    .tr,
                                                            dateValue: controller
                                                                .firstsemesterendDate,
                                                            onSelectDate: controller
                                                                .selectFirstSemesterEndDate,
                                                            isRequired: true,
                                                            isError: controller
                                                                .IsFirstEndError,
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                    Padding(
                                                      padding:
                                                          const EdgeInsets.only(
                                                              top: 15.0),
                                                      child: Wrap(
                                                        runAlignment:
                                                            WrapAlignment.start,
                                                        crossAxisAlignment:
                                                            WrapCrossAlignment
                                                                .start,
                                                        alignment:
                                                            WrapAlignment.start,
                                                        runSpacing: 20.0,
                                                        spacing: 20.0,
                                                        children: [
                                                          SecondSemesterStartDate(
                                                            width: screenWidth >=
                                                                    690
                                                                ? 300
                                                                : (screenWidth) -
                                                                    70,
                                                            label:
                                                                "Second Semester Start Date"
                                                                    .tr,
                                                            dateValue: controller
                                                                .secondsemesterStartDate,
                                                            onSelectDate: controller
                                                                .selectSecondSemsterStartDate,
                                                            isRequired: true,
                                                            isError: controller
                                                                .IsSecondStartError,
                                                          ),
                                                          SecondSemesterEndDate(
                                                            width: screenWidth >=
                                                                    690
                                                                ? 300
                                                                : (screenWidth) -
                                                                    70,
                                                            label:
                                                                "Second Semester End Date"
                                                                    .tr,
                                                            dateValue: controller
                                                                .secondsemesterendDate,
                                                            onSelectDate: controller
                                                                .selectSecondSemesterEndDate,
                                                            isRequired: true,
                                                            isError: controller
                                                                .IsSecondEndError,
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                    Padding(
                                                      padding:
                                                          const EdgeInsets.only(
                                                              top: 15.0),
                                                      child: Wrap(
                                                        runAlignment:
                                                            WrapAlignment.start,
                                                        crossAxisAlignment:
                                                            WrapCrossAlignment
                                                                .start,
                                                        alignment:
                                                            WrapAlignment.start,
                                                        runSpacing: 20.0,
                                                        spacing: 20.0,
                                                        children: [
                                                          Textfildwithupper(
                                                              isRequired: true,
                                                              fieldType:
                                                                  'number',
                                                              width: screenWidth >=
                                                                      690
                                                                  ? 300
                                                                  : (screenWidth) -
                                                                      70,
                                                              isError: controller
                                                                  .IsFirstDaysError,
                                                              onChanged:
                                                                  (value) {
                                                                if (value
                                                                    .isNotEmpty) {
                                                                  controller
                                                                      .updateFieldError(
                                                                          "firstDays",
                                                                          false);
                                                                }
                                                              },
                                                              controller:
                                                                  firstSemDay,
                                                              Uptext:
                                                                  "Number of actual working days in first semster"
                                                                      .tr,
                                                              hinttext:
                                                                  "Number of actual working days in first semster"
                                                                      .tr),
                                                          Textfildwithupper(
                                                              isRequired: true,
                                                              fieldType:
                                                                  'number',
                                                              width: screenWidth >=
                                                                      690
                                                                  ? 300
                                                                  : (screenWidth) -
                                                                      70,
                                                              isError: controller
                                                                  .IsSecondDaysError,
                                                              onChanged:
                                                                  (value) {
                                                                if (value
                                                                    .isNotEmpty) {
                                                                  controller
                                                                      .updateFieldError(
                                                                          "secondDays",
                                                                          false);
                                                                }
                                                              },
                                                              controller:
                                                                  secondSemDay,
                                                              Uptext:
                                                                  "Number of actual working days in second semester"
                                                                      .tr,
                                                              hinttext:
                                                                  "Number of actual working days in second semester"
                                                                      .tr),
                                                        ],
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              apptitle: "Edit Session".tr,
                                              subtitle: "none");
                                        }));
                                      },
                                    ),
                                  ],
                                )
                          ],
                        ),
                      );
                    },
                  );
      }),
    );
  }

  Widget _iconButton(
      {required IconData iconData,
      required Color color,
      required VoidCallback onPressed}) {
    return Container(
      margin: const EdgeInsets.all(5),
      width: 35,
      height: 35,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(5),
        boxShadow: const [
          BoxShadow(color: Colors.black12, offset: Offset(0, 2), blurRadius: 1),
        ],
      ),
      child: IconButton(
        style: ButtonStyle(
          backgroundColor: WidgetStatePropertyAll(color),
          shape: const WidgetStatePropertyAll(RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(5)))),
        ),
        onPressed: onPressed,
        icon: Icon(iconData, size: 15, color: Colors.white),
      ),
    );
  }
}
