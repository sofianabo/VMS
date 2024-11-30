import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:vms_school/Icons_File/v_m_s__icons_icons.dart';
import 'package:vms_school/Link/Controller/AdminController/Years_Controllers/Divisions_Controller.dart';
import 'package:vms_school/view/Admin/School_Management/Division_Pages/Division_Grid.dart';
import 'package:vms_school/widgets/Admin_School/DropDownDivisionMgmt.dart';
import 'package:vms_school/widgets/ButtonsDialog.dart';
import 'package:vms_school/widgets/TextFildWithUpper.dart';
import 'package:vms_school/widgets/VMSAlertDialog.dart';

class DivisionManagement extends StatelessWidget {
  DivisionManagement({super.key});

  TextEditingController arName = TextEditingController();
  TextEditingController enName = TextEditingController();
  TextEditingController driveUrl = TextEditingController();

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
                  DropDownDivisionMgmt(
                      title: "Session", width: Get.width / 3, type: "session"),
                  Padding(
                    padding: const EdgeInsets.only(left: 8.0),
                    child: DropDownDivisionMgmt(
                        title: "Class", width: Get.width / 3, type: "class"),
                  ),
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
                          Get.dialog(GetBuilder<DropdownDivisions_Controller>(
                              builder: (controller) {
                            return VMSAlertDialog(
                                action: [
                                  ButtonDialog(
                                      text: "Add",
                                      onPressed: () {
                                        controller.addData(
                                          arName.text,
                                          enName.text,
                                          driveUrl.text,
                                        );
                                        arName.clear();
                                        enName.clear();
                                        driveUrl.clear();
                                        Get.back();
                                      },
                                      color: Get.theme.primaryColor,
                                      width: 120),
                                ],
                                contents: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        Textfildwithupper(
                                            width: 250,
                                            controller: enName,
                                            Uptext: "Division En - Name",
                                            hinttext: "Division En - Name"),
                                        Padding(
                                          padding: EdgeInsets.only(
                                              left: 15.0,
                                              right: 15.0,
                                              bottom: 15.0),
                                          child: Textfildwithupper(
                                              width: 250,
                                              controller: arName,
                                              Uptext: "Division Ar - Name",
                                              hinttext: "Division Ar - Name"),
                                        ),
                                      ],
                                    ),
                                    Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.end,
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        DropDownDivisionMgmt(
                                            title: "Class",
                                            width: 250,
                                            type: "classDiag"),
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(left: 15.0),
                                          child: Row(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            children: [
                                              Textfildwithupper(
                                                  width: 230,
                                                  controller: driveUrl,
                                                  Uptext: "Meet URL",
                                                  hinttext: "Meet URL"),
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                    left: 5.0, top: 36.0),
                                                child: SvgPicture.asset(
                                                    "../../images/meet.svg",
                                                    width: 25),
                                              )
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                                apptitle: "Add Division",
                                subtitle: "none");
                          }));
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
          child: DivisionGrid(),
        )),
      ],
    ));
  }
}
