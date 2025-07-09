import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vms_school/Link/API/AdminAPI/School/School_Screen_APIs/Sessions/Add_Session_API.dart';
import 'package:vms_school/Link/Controller/AdminController/School_Controllers/Session_Controller.dart';
import 'package:vms_school/view/Both_Platform/widgets/ButtonsDialog.dart';
import 'package:vms_school/view/Both_Platform/widgets/Calender.dart';
import 'package:vms_school/view/Both_Platform/widgets/TextFildWithUpper.dart';
import 'package:vms_school/view/Both_Platform/widgets/TextFildWithUpper_Num.dart';
import 'package:vms_school/view/Both_Platform/widgets/VMSAlertDialog.dart';

class Add_Session extends StatefulWidget {
  const Add_Session({super.key});

  @override
  State<Add_Session> createState() => _Add_SessionState();
}

class _Add_SessionState extends State<Add_Session> {
  TextEditingController yearController = TextEditingController();
  TextEditingController secondSemDay = TextEditingController();
  TextEditingController firstSemDay = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return GetBuilder<SessionController>(builder: (controller) {
      return VMSAlertDialog(
          action: [
            ButtonDialog(
                text: "Add".tr,
                onPressed: () async {
                  bool isStartEmpty = controller.startDate.value == null ||
                      controller.startDate.value.toString() == "";

                  bool isEndEmpty = controller.endDate.value == null ||
                      controller.endDate.value.toString() == "";

                  bool isStartFirstEmpty =
                      controller.firstsemesterStartDate.value == null ||
                          controller.firstsemesterStartDate.value.toString() ==
                              "";
                  bool isStartSecondEmpty =
                      controller.secondsemesterStartDate.value == null ||
                          controller.secondsemesterStartDate.value.toString() ==
                              "";
                  bool isEndfirstEmpty =
                      controller.firstsemesterendDate.value == null ||
                          controller.firstsemesterendDate.value.toString() ==
                              "";
                  bool isEndSecondEmpty =
                      controller.secondsemesterendDate.value == null ||
                          controller.secondsemesterendDate.value.toString() ==
                              "";
                  bool isfirstDaysEmpty = firstSemDay.text.trim().isEmpty;
                  bool isSecondDaysEmpty = secondSemDay.text.trim().isEmpty;

                  bool isNameEmpty = yearController.text.trim().isEmpty ||
                      yearController.text.length < 4 ||
                      int.parse(yearController.text) > 2098;

                  controller.updateFieldError("name", isNameEmpty);
                  controller.updateFieldError("start", isStartEmpty);
                  controller.updateFieldError("end", isEndEmpty);
                  controller.updateFieldError("firstStart", isStartFirstEmpty);
                  controller.updateFieldError("firstEnd", isEndfirstEmpty);
                  controller.updateFieldError(
                      "secondStart", isStartSecondEmpty);
                  controller.updateFieldError("secondEnd", isEndSecondEmpty);
                  controller.updateFieldError("firstDays", isfirstDaysEmpty);
                  controller.updateFieldError("secondDays", isSecondDaysEmpty);

                  if (!(isNameEmpty ||
                      isStartEmpty ||
                      isEndEmpty ||
                      isStartFirstEmpty ||
                      isEndfirstEmpty ||
                      isStartSecondEmpty ||
                      isEndSecondEmpty ||
                      isfirstDaysEmpty ||
                      isSecondDaysEmpty)) {
                    await Add_Session_API(context).Add_Session(
                      year:
                          "${yearController.text}-${controller.currentYear.value}",
                      classs: controller.checkbox1.value,
                      devi: controller.checkbox2.value,
                      qt: controller.checkbox3.value,
                      rsett: controller.checkbox4.value,
                      startDate: controller.startDate.value.toString(),
                      endDate: controller.endDate.value.toString(),
                      sessionId: controller.selectedDropdownValue.value,
                      firstStart:
                          controller.firstsemesterStartDate.value.toString(),
                      firstEnd:
                          controller.firstsemesterendDate.value.toString(),
                      secondStart:
                          controller.secondsemesterStartDate.value.toString(),
                      secondEnd:
                          controller.secondsemesterendDate.value.toString(),
                      firstDays: firstSemDay.text,
                      secondDays: secondSemDay.text,
                    );
                  }
                },
                color: Theme.of(context).primaryColor,
                width: 90)
          ],
          contents: Container(
            width: 620,
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Wrap(
                    runSpacing: 20.0,
                    spacing: 20.0,
                    crossAxisAlignment: WrapCrossAlignment.end,
                    runAlignment: WrapAlignment.spaceBetween,
                    alignment: WrapAlignment.spaceBetween,
                    children: [
                      GetBuilder<SessionController>(builder: (controllers) {
                        return Row(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            SizedBox(
                              width: screenWidth >= 690
                                  ? 270
                                  : (screenWidth) - 108,
                              child: Textfildwithupper_num(
                                onChanged: (value) {
                                  controller.updateYear(value);
                                  if (value.isNotEmpty) {
                                    controller.updateFieldError("name", false);
                                  }
                                },
                                isRequired: true,
                                isError: controller.IsnameError,
                                Uptext: "Study Year".tr,
                                hinttext: "Enter Year".tr,
                                sessionController: yearController,
                                borderColor: controllers.borderColor,
                              ),
                            ),
                            Obx(() {
                              return Padding(
                                padding: const EdgeInsets.only(
                                    left: 8.0, right: 8.0),
                                child: Container(
                                  height: 40,
                                  alignment: Alignment.center,
                                  child: Text(
                                    "/${controllers.currentYear.value}",
                                    style: Get.theme.textTheme.titleLarge!
                                        .copyWith(
                                      fontSize: 22,
                                    ),
                                  ),
                                ),
                              );
                            }),
                          ],
                        );
                      }),
                      ButtonDialog(
                        text: "Import".tr,
                        onPressed: controller.showDialog,
                        color: Theme.of(context).primaryColor,
                        width: screenWidth >= 690 ? 290 : (screenWidth) - 70,
                      )
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 15.0),
                    child: Wrap(
                      runAlignment: WrapAlignment.start,
                      crossAxisAlignment: WrapCrossAlignment.start,
                      alignment: WrapAlignment.start,
                      runSpacing: 20.0,
                      spacing: 20.0,
                      children: [
                        DateSelector(
                          width: screenWidth >= 690 ? 300 : (screenWidth) - 70,
                          label: "Start Date".tr,
                          dateValue: controller.startDate,
                          onSelectDate: controller.selectStartDate,
                          isRequired: true,
                          isError: controller.IsstartError,
                        ),
                        DateSelector(
                          width: screenWidth >= 690 ? 300 : (screenWidth) - 70,
                          label: "End Date".tr,
                          dateValue: controller.endDate,
                          onSelectDate: controller.selectEndDate,
                          isRequired: true,
                          isError: controller.IsEndError,
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 15.0),
                    child: Wrap(
                      runAlignment: WrapAlignment.start,
                      crossAxisAlignment: WrapCrossAlignment.start,
                      alignment: WrapAlignment.start,
                      runSpacing: 20.0,
                      spacing: 20.0,
                      children: [
                        firstSemesterStartDate(
                          width: screenWidth >= 690 ? 300 : (screenWidth) - 70,
                          label: "First Semester Start Date".tr,
                          dateValue: controller.firstsemesterStartDate,
                          onSelectDate: controller.selectFirstSemsterStartDate,
                          isRequired: true,
                          isError: controller.IsFirstStartError,
                        ),
                        SecondSemesterStartDate(
                          width: screenWidth >= 690 ? 300 : (screenWidth) - 70,
                          label: "Second Semester Start Date".tr,
                          dateValue: controller.secondsemesterStartDate,
                          onSelectDate: controller.selectSecondSemsterStartDate,
                          isRequired: true,
                          isError: controller.IsSecondStartError,
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 15.0),
                    child: Wrap(
                      runAlignment: WrapAlignment.start,
                      crossAxisAlignment: WrapCrossAlignment.start,
                      alignment: WrapAlignment.start,
                      runSpacing: 20.0,
                      spacing: 20.0,
                      children: [
                        FirstSemesterEndDate(
                          width: screenWidth >= 690 ? 300 : (screenWidth) - 70,
                          label: "First Semester End Date".tr,
                          dateValue: controller.firstsemesterendDate,
                          onSelectDate: controller.selectFirstSemesterEndDate,
                          isRequired: true,
                          isError: controller.IsFirstEndError,
                        ),
                        SecondSemesterEndDate(
                          width: screenWidth >= 690 ? 300 : (screenWidth) - 70,
                          label: "Second Semester End Date".tr,
                          dateValue: controller.secondsemesterendDate,
                          onSelectDate: controller.selectSecondSemesterEndDate,
                          isRequired: true,
                          isError: controller.IsSecondEndError,
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 15.0),
                    child: Wrap(
                      runAlignment: WrapAlignment.start,
                      crossAxisAlignment: WrapCrossAlignment.start,
                      alignment: WrapAlignment.start,
                      runSpacing: 20.0,
                      spacing: 20.0,
                      children: [
                        Textfildwithupper(
                            isRequired: true,
                            fieldType: 'number',
                            width:
                                screenWidth >= 690 ? 300 : (screenWidth) - 70,
                            isError: controller.IsFirstDaysError,
                            onChanged: (value) {
                              if (value.isNotEmpty) {
                                controller.updateFieldError("firstDays", false);
                              }
                            },
                            controller: firstSemDay,
                            Uptext:
                                "Number of actual working days in first semster"
                                    .tr,
                            hinttext:
                                "Number of actual working days in first semster"
                                    .tr),
                        Textfildwithupper(
                            isRequired: true,
                            fieldType: 'number',
                            width:
                                screenWidth >= 690 ? 300 : (screenWidth) - 70,
                            isError: controller.IsSecondDaysError,
                            onChanged: (value) {
                              if (value.isNotEmpty) {
                                controller.updateFieldError(
                                    "secondDays", false);
                              }
                            },
                            controller: secondSemDay,
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
          ),
          apptitle: "Add Session".tr,
          subtitle: "none");
    });
  }
}
