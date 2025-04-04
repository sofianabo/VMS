import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vms_school/Icons_File/v_m_s__icons_icons.dart';
import 'package:vms_school/Link/API/AdminAPI/School/School_Screen_APIs/Sessions/Add_Session_API.dart';
import 'package:vms_school/Link/API/AdminAPI/School/School_Screen_APIs/Sessions/SessionAPI.dart';
import 'package:vms_school/Link/Controller/AdminController/School_Controllers/Session_Controller.dart';
import 'package:vms_school/view/Admin/School_Management/Sessions_Pages/Session_Management_Grid.dart';
import 'package:vms_school/widgets/ButtonsDialog.dart';
import 'package:vms_school/widgets/Calender.dart';
import 'package:vms_school/widgets/TextFildWithUpper_Num.dart';
import 'package:vms_school/widgets/VMSAlertDialog.dart';

class SessionManagement extends StatefulWidget {
  const SessionManagement({super.key});

  @override
  State<SessionManagement> createState() => _SessionManagementState();
}

class _SessionManagementState extends State<SessionManagement> {
  TextEditingController search = TextEditingController();
  TextEditingController yearController = TextEditingController();
  @override
  void initState() {
    Get_Session_Screen_API(context).Getsession();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: Column(
      children: [
        Container(
          margin: const EdgeInsets.only(left: 30.0, right: 30.0, top: 30.0),
          alignment: Alignment.center,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  const Spacer(),
                  Container(
                    width: 40,
                    height: 40,
                    decoration: BoxDecoration(
                        color: Theme.of(context).cardColor,
                        borderRadius: BorderRadius.circular(5),
                        boxShadow: const [
                          BoxShadow(
                              color: Colors.black12,
                              offset: Offset(0, 2),
                              blurRadius: 1)
                        ]),
                    child: IconButton(
                        style: ButtonStyle(
                            backgroundColor: WidgetStatePropertyAll(
                                Theme.of(context).cardColor),
                            shape: WidgetStatePropertyAll(
                                RoundedRectangleBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(5))))),
                        onPressed: () {
                          yearController.clear();
                          Get.find<SessionController>().initialData();
                          Get.dialog(barrierDismissible: false,
                              GetBuilder<SessionController>(
                                  builder: (controller) {
                            return VMSAlertDialog(
                                action: [
                                  ButtonDialog(
                                      text: "Add".tr,
                                      onPressed: () async {
                                        bool isStartEmpty =
                                            controller.startDate.value ==
                                                    null ||
                                                controller.startDate.value
                                                        .toString() ==
                                                    "";

                                        bool isEndEmpty =
                                            controller.endDate.value == null ||
                                                controller.endDate.value
                                                        .toString() ==
                                                    "";
                                        bool isNameEmpty = yearController.text
                                                .trim()
                                                .isEmpty ||
                                            yearController.text.length < 4 ||
                                            int.parse(yearController.text) >
                                                2098;

                                        controller.updateFieldError(
                                            "name", isNameEmpty);
                                        controller.updateFieldError(
                                            "start", isStartEmpty);
                                        controller.updateFieldError(
                                            "end", isEndEmpty);

                                        if (!(isNameEmpty ||
                                            isStartEmpty ||
                                            isEndEmpty)) {
                                          await Add_Session_API(context)
                                              .Add_Session(
                                                  "${yearController.text}-${controller.currentYear.value}",
                                                  controller.startDate.value
                                                      .toString(),
                                                  controller.endDate.value
                                                      .toString());
                                        }
                                      },
                                      color: Theme.of(context).primaryColor,
                                      width: 90)
                                ],
                                contents: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    GetBuilder<SessionController>(
                                        builder: (controllers) {
                                      return Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.end,
                                        children: [
                                          SizedBox(
                                            width: 220,
                                            child: Textfildwithupper_num(
                                              onChanged: (value) {
                                                controller.updateYear(value);
                                                if (value.isNotEmpty) {
                                                  controller.updateFieldError(
                                                      "name", false);
                                                }
                                              },
                                              isRequired: true,
                                              isError: controller.IsnameError,
                                              Uptext: "Study Year".tr,
                                              hinttext: "Enter Year".tr,
                                              sessionController: yearController,
                                              borderColor:
                                                  controllers.borderColor,
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
                                                  style: Get.theme.textTheme
                                                      .titleLarge!
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
                                    Padding(
                                      padding: const EdgeInsets.only(top: 15.0),
                                      child: Row(
                                        children: [
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            children: [
                                              DateSelector(
                                                width: 300,
                                                label: "Start Date".tr,
                                                dateValue: controller.startDate,
                                                onSelectDate:
                                                    controller.selectStartDate,
                                                isRequired: true,
                                                isError:
                                                    controller.IsstartError,
                                              )
                                            ],
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                left: 20.0, right: 20.0),
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              children: [
                                                DateSelector(
                                                  width: 300,
                                                  label: "End Date".tr,
                                                  dateValue: controller.endDate,
                                                  onSelectDate:
                                                      controller.selectEndDate,
                                                  isRequired: true,
                                                  isError:
                                                      controller.IsEndError,
                                                )
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                                apptitle: "Add Session".tr,
                                subtitle: "none");
                          }));
                        },
                        icon: Icon(Icons.add,
                            size: 18, color: Theme.of(context).highlightColor)),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 10.0, left: 10.0),
                    child: Container(
                      width: 40,
                      height: 40,
                      decoration: BoxDecoration(
                          color: Theme.of(context).cardColor,
                          borderRadius: BorderRadius.circular(5),
                          boxShadow: const [
                            BoxShadow(
                                color: Colors.black12,
                                offset: Offset(0, 2),
                                blurRadius: 1)
                          ]),
                      child: IconButton(
                          style: ButtonStyle(
                              backgroundColor: WidgetStatePropertyAll(
                                  Theme.of(context).cardColor),
                              shape: WidgetStatePropertyAll(
                                  RoundedRectangleBorder(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(5))))),
                          onPressed: () {},
                          icon: Icon(VMS_Icons.pdf,
                              size: 18,
                              color: Theme.of(context).highlightColor)),
                    ),
                  ),
                  Container(
                    width: 40,
                    height: 40,
                    decoration: BoxDecoration(
                        color: Theme.of(context).cardColor,
                        borderRadius: BorderRadius.circular(5),
                        boxShadow: const [
                          BoxShadow(
                              color: Colors.black12,
                              offset: Offset(0, 2),
                              blurRadius: 1)
                        ]),
                    child: IconButton(
                        style: ButtonStyle(
                            backgroundColor: WidgetStatePropertyAll(
                                Theme.of(context).cardColor),
                            shape: WidgetStatePropertyAll(
                                RoundedRectangleBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(5))))),
                        onPressed: () {},
                        icon: Icon(VMS_Icons.xl,
                            size: 18, color: Theme.of(context).highlightColor)),
                  ),
                ],
              ),
            ],
          ),
        ),
        Expanded(
            child: Padding(
          padding: const EdgeInsets.only(top: 15.0),
          child: SessionManagementGrid(),
        )),
      ],
    ));
  }
}
