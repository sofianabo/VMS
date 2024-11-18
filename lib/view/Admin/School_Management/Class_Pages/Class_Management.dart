import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:getx/Icons_File/v_m_s__icons_icons.dart';
import 'package:getx/Link/Controller/AdminController/Class_Mgmt_Controller.dart';
import 'package:getx/view/Admin/School_Management/Class_Pages/Classes_Grid.dart';
import 'package:getx/widgets/Admin_School/DropDownClassMgmt.dart';
import 'package:getx/widgets/ButtonsDialog.dart';
import 'package:getx/widgets/TextFildWithUpper.dart';
import 'package:getx/widgets/VMSAlertDialog.dart';

class ClassManagement extends StatelessWidget {
  ClassManagement({super.key});

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
                  DropDownClassMgmt(
                      title: "Grade", width: Get.width / 3, type: "grade"),
                  Padding(
                    padding: const EdgeInsets.only(left: 8.0),
                    child: DropDownClassMgmt(
                        title: "Session",
                        width: Get.width / 3,
                        type: "session"),
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
                          Get.dialog(GetBuilder<ClassMgmtController>(
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
                                            Uptext: "Grade En - Name",
                                            hinttext: "Grade En - Name"),
                                        Padding(
                                          padding: EdgeInsets.only(
                                              left: 15.0,
                                              right: 15.0,
                                              bottom: 15.0),
                                          child: Textfildwithupper(
                                              width: 250,
                                              controller: arName,
                                              Uptext: "Grade Ar - Name",
                                              hinttext: "Grade Ar - Name"),
                                        ),
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        DropDownClassMgmt(
                                            title: "Class",
                                            width: 250,
                                            type: "classdiag"),
                                        Padding(
                                          padding: EdgeInsets.only(
                                              left: 15.0, right: 15.0),
                                          child: DropDownClassMgmt(
                                              title: "Division",
                                              width: 250,
                                              type: "divisiondiag"),
                                        ),
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.only(
                                              top: 15.0, bottom: 15.0),
                                          child: DropDownClassMgmt(
                                              title: "Admin Account",
                                              width: 515,
                                              type: "admin"),
                                        ),
                                      ],
                                    ),
                                    Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        Textfildwithupper(
                                            width: 480,
                                            controller: driveUrl,
                                            Uptext: "Drive URL",
                                            hinttext: "Drive URL"),
                                        Padding(
                                          padding: const EdgeInsets.only(
                                              left: 5.0, top: 36.0),
                                          child: SvgPicture.asset(
                                              "../../images/drive.svg",
                                              width: 25),
                                        )
                                      ],
                                    ),
                                  ],
                                ),
                                apptitle: "Add Grade",
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
          child: ClassesGrid(),
        )),
      ],
    ));
  }
}
