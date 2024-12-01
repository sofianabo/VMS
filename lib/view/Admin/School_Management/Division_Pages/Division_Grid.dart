import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:vms_school/Icons_File/v_m_s__icons_icons.dart';
import 'package:vms_school/Link/Controller/AdminController/Years_Controllers/Divisions_Controller.dart';
import 'package:vms_school/widgets/Admin_School/DropDownDivisionMgmt.dart';
import 'package:vms_school/widgets/ButtonsDialog.dart';
import 'package:vms_school/widgets/GridAnimation.dart';
import 'package:vms_school/widgets/TextFildWithUpper.dart';
import 'package:vms_school/widgets/VMSAlertDialog.dart';

class DivisionGrid extends StatelessWidget {
  DivisionGrid({super.key});

  TextEditingController arName = TextEditingController();
  TextEditingController enName = TextEditingController();
  TextEditingController meetUrl = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return GetBuilder<DropdownDivisions_Controller>(builder: (control) {
      return GridView.builder(
        padding: const EdgeInsets.only(top: 10, left: 40, right: 40),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 5,
            crossAxisSpacing: 20.0,
            mainAxisSpacing: 20.0,
            childAspectRatio: 1.1),
        itemCount: control.Division.length,
        itemBuilder: (context, index) {
          return HoverScaleCard(
            child: GestureDetector(
              onTap: () {
                control.ClassDiagIndex = control.Division[index]['class'];
                arName.text = "${control.Division[index]['arName']}";
                enName.text = "${control.Division[index]['enName']}";
                meetUrl.text = "${control.Division[index]['meet']}";
                Get.dialog(VMSAlertDialog(
                  action: [
                    ButtonDialog(
                      text: "Edit",
                      onPressed: () {
                        control.updatedata(
                          index,
                          arName.text,
                          enName.text,
                          meetUrl.text,
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
                        crossAxisAlignment: CrossAxisAlignment.end,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          DropDownDivisionMgmt(
                            title: "Class",
                            width: 250,
                            type: "classDiag",
                            selectedValue: control.selectClassDiagIndex,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 15.0),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Textfildwithupper(
                                  width: 230,
                                  controller: meetUrl,
                                  Uptext: "Meet URL",
                                  hinttext: "Meet URL",
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                      left: 5.0, top: 36.0),
                                  child: SvgPicture.asset(
                                    "../../images/meet.svg",
                                    width: 25,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  apptitle: "Edit Division",
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
                      Container(
                        width: 35,
                        height: 35,
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
                                    WidgetStatePropertyAll(Color(0xffB03D3D)),
                                shape: WidgetStatePropertyAll(
                                    RoundedRectangleBorder(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(5))))),
                            onPressed: () {
                              Get.dialog(VMSAlertDialog(
                                  action: [
                                    ButtonDialog(
                                        text: "Delete",
                                        onPressed: () {
                                          control.deleteDivision(index);
                                          Get.back();
                                        },
                                        color: Color(0xffB03D3D),
                                        width: 80),
                                    ButtonDialog(
                                        text: "Cancel",
                                        onPressed: () {
                                          Get.back();
                                        },
                                        color: Get.theme.primaryColor,
                                        width: 80)
                                  ],
                                  contents: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Container(
                                        width: 400,
                                      ),
                                      Row(
                                        children: [
                                          Text(
                                            "Do You Want To Delete (${control.Division[index]['enName']}) Division",
                                            style: Get.theme.textTheme.bodyMedium!
                                                .copyWith(
                                                    fontSize: 16,
                                                    fontWeight:
                                                        FontWeight.normal),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                  apptitle: "Delete Division",
                                  subtitle: "none"));
                            },
                            icon: Icon(VMS_Icons.bin,
                                size: 16, color: Colors.white)),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text("${control.Division[index]['enName']}",
                              style: Get.theme.textTheme.bodyMedium!
                                  .copyWith(
                                fontSize: 20,
                              )),
                        ],
                      ),
                      Text("${control.Division[index]['class']}",
                          style: Get.theme.textTheme.bodyMedium!
                              .copyWith(fontSize: 14, color: Colors.black)),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("Meet URL",
                              style: Get.theme.textTheme.bodyMedium!
                                  .copyWith(
                                fontSize: 16,
                              )),
                          SvgPicture.asset(
                            "../../images/meet.svg",
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
