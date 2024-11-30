import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vms_school/Icons_File/v_m_s__icons_icons.dart';
import 'package:vms_school/Link/Controller/WidgetController/DropDown_Controllers/DropDownCurriculumn_Controller.dart';
import 'package:vms_school/view/Admin/School_Management/Curriculum_Pages/Curriculum_Grid.dart';
import 'package:vms_school/widgets/Admin_School/DropDownCurriMgmt.dart';
import 'package:vms_school/widgets/ButtonsDialog.dart';
import 'package:vms_school/widgets/TextFildWithUpper.dart';
import 'package:vms_school/widgets/TextFormSearch.dart';
import 'package:vms_school/widgets/VMSAlertDialog.dart';

class Curriculum_Management extends StatelessWidget {
  Curriculum_Management({super.key});

  TextEditingController search = TextEditingController();
  TextEditingController name = TextEditingController();
  TextEditingController max = TextEditingController();
  TextEditingController Passing = TextEditingController();

  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
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
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 8.0),
                        child: DropDownCurriMgmt(
                          title: "Session",
                          width: w / 6,
                          type: "session",
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 8.0),
                        child: DropDownCurriMgmt(
                          title: "Class",
                          width: w / 6,
                          type: "class",
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 8.0),
                        child: DropDownCurriMgmt(
                          title: "Semester",
                          width: w / 6,
                          type: "semester",
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 8.0),
                        child: TextFormSearch(
                          width: w / 4,
                          radius: 5,
                          controller: search,
                          suffixIcon: Icons.search,
                        ),
                      ),
                    ],
                  ),
                  Spacer(),
                  Row(
                    children: [
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
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(5))))),
                            onPressed: () {
                              Get.dialog(
                                  GetBuilder<DropDownCurriculumn_Controller>(
                                      builder: (controller) {
                                return VMSAlertDialog(
                                    action: [
                                      ButtonDialog(
                                          text: "Add",
                                          onPressed: () {
                                            controller.addData(
                                              name.text,
                                              max.text,
                                              Passing.text,
                                            );
                                            Get.back();
                                            name.clear();
                                            max.clear();
                                            Passing.clear();
                                          },
                                          color: Get.theme.primaryColor,
                                          width: 90)
                                    ],
                                    contents: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        Container(
                                          width: 520,
                                        ),
                                        Row(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            DropDownCurriMgmt(
                                                title: "Class",
                                                width: 250,
                                                type: "class"),
                                            DropDownCurriMgmt(
                                                title: "Semester",
                                                width: 250,
                                                type: "semester")
                                          ],
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.only(
                                              top: 15.0, bottom: 15.0),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.end,
                                            children: [
                                              Textfildwithupper(
                                                  width: 250,
                                                  controller: name,
                                                  Uptext: "Name Curriculum",
                                                  hinttext: "Name Curriculum"),
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                    left: 15.0, right: 15.0),
                                                child: Column(
                                                  mainAxisSize:
                                                      MainAxisSize.min,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.start,
                                                  children: [
                                                    Text("Failing Subject"),
                                                    Column(
                                                      children: [
                                                        Row(
                                                          children: [
                                                            Checkbox(
                                                              value: controller
                                                                  .isFailingSubject,
                                                              // Use the state from the controller
                                                              onChanged:
                                                                  (value) {
                                                                controller
                                                                    .updateSelection(
                                                                        value!); // Update the state
                                                              },
                                                            ),
                                                            Text(
                                                                "Is Failing Subject"),
                                                          ],
                                                        ),
                                                      ],
                                                    )
                                                  ],
                                                ),
                                              )
                                            ],
                                          ),
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Textfildwithupper(
                                                controller: max,
                                                Uptext: "Max Mark",
                                                hinttext: "Max Mark"),
                                            Textfildwithupper(
                                                controller: Passing,
                                                Uptext: "Passing Mark",
                                                hinttext: "Passing Mark")
                                          ],
                                        ),
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(top: 15.0),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            children: [
                                              Container(
                                                decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.all(
                                                      Radius.circular(5),
                                                    ),
                                                    border: Border.all(
                                                        color:
                                                            Color(0xffD9D9D9))),
                                                alignment: Alignment.center,
                                                width: 250,
                                                height: 100,
                                                child: Text(
                                                  textAlign: TextAlign.center,
                                                  "Click To Add File\nOr\nDrag And Drop File Here",
                                                  style: TextStyle(
                                                      color: Color(0xffCBBFBF)),
                                                ),
                                              ),
                                              Container(
                                                decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.all(
                                                      Radius.circular(5),
                                                    ),
                                                    border: Border.all(
                                                        color:
                                                            Color(0xffD9D9D9))),
                                                alignment: Alignment.center,
                                                width: 250,
                                                height: 100,
                                                child: Text(
                                                  textAlign: TextAlign.center,
                                                  "Click To Add File\nOr\nDrag And Drop File Here",
                                                  style: TextStyle(
                                                      color: Color(0xffCBBFBF)),
                                                ),
                                              )
                                            ],
                                          ),
                                        )
                                      ],
                                    ),
                                    apptitle: "Add Curriculum",
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
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(5))))),
                            onPressed: () {},
                            icon: Icon(VMS_Icons.xl,
                                size: 18, color: Get.theme.primaryColor)),
                      ),
                    ],
                  )
                ],
              ),
            ],
          ),
        ),
        Expanded(
            child: Padding(
          padding: const EdgeInsets.only(top: 15.0),
          child: CurriculumGrid(),
        )),
      ],
    ));
  }
}
