import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vms_school/Link/API/AdminAPI/School/School_Screen_APIs/Sessions/Add_Session_API.dart';
import 'package:vms_school/Link/Controller/AdminController/School_Controllers/Session_Controller.dart';
import 'package:vms_school/widgets/ButtonsDialog.dart';
import 'package:vms_school/widgets/Calender.dart';
import 'package:vms_school/widgets/TextFildWithUpper_Num.dart';
import 'package:vms_school/widgets/VMSAlertDialog.dart';

class Add_Session extends StatefulWidget {
  const Add_Session({super.key});

  @override
  State<Add_Session> createState() => _Add_SessionState();
}

class _Add_SessionState extends State<Add_Session> {
  TextEditingController yearController = TextEditingController();
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
                  bool isNameEmpty = yearController.text.trim().isEmpty ||
                      yearController.text.length < 4 ||
                      int.parse(yearController.text) > 2098;

                  controller.updateFieldError("name", isNameEmpty);
                  controller.updateFieldError("start", isStartEmpty);
                  controller.updateFieldError("end", isEndEmpty);

                  if (!(isNameEmpty || isStartEmpty || isEndEmpty)) {
                    await Add_Session_API(context).Add_Session(
                      "${yearController.text}-${controller.currentYear.value}",
                      controller.startDate.value.toString(),
                      controller.endDate.value.toString(),
                      controller.selectedDropdownValue.value,
                      controller.checkbox1.value,
                      controller.checkbox2.value,
                      controller.checkbox3.value,
                      controller.checkbox4.value,
                    );
                  }
                },
                color: Theme.of(context).primaryColor,
                width: 90)
          ],
          contents: Container(
            width: 620,
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
                            width:
                                screenWidth >= 690 ? 270 : (screenWidth) - 108,
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
                              padding:
                                  const EdgeInsets.only(left: 8.0, right: 8.0),
                              child: Container(
                                height: 40,
                                alignment: Alignment.center,
                                child: Text(
                                  "/${controllers.currentYear.value}",
                                  style:
                                      Get.theme.textTheme.titleLarge!.copyWith(
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
                      text: "Move".tr,
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
                )
              ],
            ),
          ),
          apptitle: "Add Session".tr,
          subtitle: "none");
    });
  }
}
