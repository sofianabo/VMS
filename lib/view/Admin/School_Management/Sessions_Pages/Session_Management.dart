import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx/Icons_File/v_m_s__icons_icons.dart';
import 'package:getx/Link/Controller/AdminController/Session_Controller.dart';
import 'package:getx/view/Admin/School_Management/Sessions_Pages/Session_Management_Grid.dart';
import 'package:getx/widgets/ButtonsDialog.dart';
import 'package:getx/widgets/Calender.dart';
import 'package:getx/widgets/TextFildWithUpper_Num.dart';
import 'package:getx/widgets/VMSAlertDialog.dart';

class SessionManagement extends StatelessWidget {
  SessionManagement({super.key});

  TextEditingController search = TextEditingController();
  TextEditingController yearController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: Column(
      children: [
        Container(
          margin: EdgeInsets.only(left: 30.0, right: 30.0, top: 30.0),
          alignment: Alignment.center,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Spacer(),
                  Container(
                    width: 40,
                    height: 40,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(5),
                        boxShadow: const [
                          BoxShadow(
                              color: Colors.black12,
                              offset: Offset(0, 2),
                              blurRadius: 1)
                        ]),
                    child: IconButton(
                        style: ButtonStyle(
                            backgroundColor:
                                WidgetStatePropertyAll(Color(0xffF9F8FD)),
                            shape: WidgetStatePropertyAll(
                                RoundedRectangleBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(5))))),
                        onPressed: () {
                          Get.dialog(VMSAlertDialog(
                              action: [
                                ButtonDialog(
                                    text: "Add",
                                    onPressed: () {},
                                    color: Get.theme.primaryColor,
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
                                        Container(
                                          width: 220,
                                          child: Textfildwithupper_num(
                                            Uptext: "Study Year",
                                            hinttext: "Enter Year",
                                            sessionController:
                                                controllers.sessionController,
                                            borderColor:
                                                controllers.borderColor,
                                          ),
                                        ),
                                        // عرض السنة المعدلة
                                        Obx(() {
                                          return Padding(
                                            padding: const EdgeInsets.only(
                                                left: 8.0, right: 8.0),
                                            child: Container(
                                              height: 40,
                                              alignment: Alignment.center,
                                              child: Text(
                                                "/${controllers.currentYear.value}",
                                                style: Get
                                                    .theme
                                                    .primaryTextTheme
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
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  bottom: 5.0),
                                              child: Text("Start Date"),
                                            ),
                                            DatePicker(
                                              width: 220,
                                            ),
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
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                    bottom: 5.0),
                                                child: Text("End Date"),
                                              ),
                                              DatePicker(
                                                width: 220,
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  )
                                ],
                              ),
                              apptitle: "Add Session",
                              subtitle: "none"));
                        },
                        icon: Icon(Icons.add,
                            size: 18, color: Get.theme.primaryColor)),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 10.0, left: 10.0),
                    child: Container(
                      width: 40,
                      height: 40,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(5),
                          boxShadow: const [
                            BoxShadow(
                                color: Colors.black12,
                                offset: Offset(0, 2),
                                blurRadius: 1)
                          ]),
                      child: IconButton(
                          style: ButtonStyle(
                              backgroundColor:
                                  WidgetStatePropertyAll(Color(0xffF9F8FD)),
                              shape: WidgetStatePropertyAll(
                                  RoundedRectangleBorder(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(5))))),
                          onPressed: () {},
                          icon: Icon(VMS_Icons.pdf,
                              size: 18, color: Get.theme.primaryColor)),
                    ),
                  ),
                  Container(
                    width: 40,
                    height: 40,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(5),
                        boxShadow: const [
                          BoxShadow(
                              color: Colors.black12,
                              offset: Offset(0, 2),
                              blurRadius: 1)
                        ]),
                    child: IconButton(
                        style: ButtonStyle(
                            backgroundColor:
                                WidgetStatePropertyAll(Color(0xffF9F8FD)),
                            shape: WidgetStatePropertyAll(
                                RoundedRectangleBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(5))))),
                        onPressed: () {},
                        icon: Icon(VMS_Icons.xl,
                            size: 18, color: Get.theme.primaryColor)),
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