import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx/Link/Controller/AdminController/Class_Mgmt_Controller.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:getx/widgets/Admin_School/DropDownClassMgmt.dart';
import 'package:getx/widgets/ButtonsDialog.dart';
import 'package:getx/widgets/GridAnimation.dart';
import 'package:getx/widgets/TextFildWithUpper.dart';
import 'package:getx/widgets/VMSAlertDialog.dart';

class ClassesGrid extends StatelessWidget {
  ClassesGrid({super.key});

  TextEditingController arName = TextEditingController();
  TextEditingController enName = TextEditingController();
  TextEditingController driveUrl = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return GetBuilder<ClassMgmtController>(builder: (control) {
      return GridView.builder(
        padding: const EdgeInsets.only(top: 10, left: 40, right: 40),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 5,
            crossAxisSpacing: 20.0,
            mainAxisSpacing: 20.0,
            childAspectRatio: 1.1),
        itemCount: control.Classes.length,
        itemBuilder: (context, index) {
          return HoverScaleCard(
            child: GestureDetector(
              onTap: () {
                control.editeGradeIndex = control.Classes[index]['grade'];
                control.editeSessionIndex = control.Classes[index]['session'];
                control.editeAdminIndex = control.Classes[index]['admin'];
                arName.text = "${control.Classes[index]['arName']}";
                enName.text = "${control.Classes[index]['enName']}";
                driveUrl.text = "${control.Classes[index]['drive']}";
                Get.dialog(VMSAlertDialog(
                  action: [
                    ButtonDialog(
                      text: "Edit",
                      onPressed: () {
                        control.updatedata(
                          index,
                          arName.text,
                          enName.text,
                          driveUrl.text,
                        );
                        Get.back();
                      },
                      color: Get.theme.primaryColor,
                      width: 120,
                    ),
                  ],
                  contents: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Textfildwithupper(
                            width: 250,
                            controller: enName,
                            Uptext: "Grade En - Name",
                            hinttext: "Grade En - Name",
                          ),
                          Padding(
                            padding: EdgeInsets.only(
                                left: 15.0, right: 15.0, bottom: 15.0),
                            child: Textfildwithupper(
                              width: 250,
                              controller: arName,
                              Uptext: "Grade Ar - Name",
                              hinttext: "Grade Ar - Name",
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          DropDownClassMgmt(
                            title: "Grade",
                            width: 250,
                            type: "editeGrade",
                            selectedValue: control.editeGradeIndex,
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: 15.0, right: 15.0),
                            child: DropDownClassMgmt(
                              title: "Session",
                              width: 250,
                              type: "editeSession",
                              selectedValue: control.editeSessionIndex,
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Padding(
                            padding:
                                const EdgeInsets.only(top: 15.0, bottom: 15.0),
                            child: DropDownClassMgmt(
                              title: "Admin Account",
                              width: 515,
                              type: "editeAdmin",
                              selectedValue: control.editeAdminIndex,
                            ),
                          ),
                        ],
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Textfildwithupper(
                            width: 480,
                            controller: driveUrl,
                            Uptext: "Drive URL",
                            hinttext: "Drive URL",
                          ),
                          Padding(
                            padding:
                                const EdgeInsets.only(left: 5.0, top: 36.0),
                            child: SvgPicture.asset(
                              "../../images/drive.svg",
                              width: 25,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  apptitle: "Edit Grade",
                  subtitle: "none",
                ));
              },
              child: Container(
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      border: Border.all(color: Colors.grey, width: 0.5),
                      color: Colors.white,
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
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text("${control.Classes[index]['enName']}",
                              style: Get.theme.primaryTextTheme.titleLarge!
                                  .copyWith(
                                fontSize: 20,
                              )),
                        ],
                      ),
                      Text("${control.Classes[index]['grade']}",
                          style: Get.theme.primaryTextTheme.titleLarge!
                              .copyWith(fontSize: 14, color: Colors.black)),
                      Text("${control.Classes[index]['session']}",
                          style: Get.theme.primaryTextTheme.titleLarge!
                              .copyWith(fontSize: 14, color: Colors.black)),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("Drive URL",
                              style: Get.theme.primaryTextTheme.titleLarge!
                                  .copyWith(
                                fontSize: 16,
                              )),
                          SvgPicture.asset(
                            "../../images/drive.svg",
                            width: 20,
                          )
                        ],
                      )
                    ],
                  )),
            ),
          );
        },
      );
    });
  }
}
