import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx/Icons_File/v_m_s__icons_icons.dart';
import 'package:getx/Link/Controller/AdminController/School_Info_Controller.dart';
import 'package:getx/widgets/ButtonsDialog.dart';
import 'package:getx/widgets/TextFildWithUpper.dart';

class MyCheckBoxScreen extends StatelessWidget {
  TextEditingController School_Name = TextEditingController();
  TextEditingController License_Number = TextEditingController();
  TextEditingController Address = TextEditingController();
  TextEditingController Village = TextEditingController();
  TextEditingController Region = TextEditingController();
  TextEditingController Phone = TextEditingController();
  TextEditingController Email = TextEditingController();
  TextEditingController Creation_Year = TextEditingController();
  TextEditingController Clinic_Name = TextEditingController();
  TextEditingController Congregation_number = TextEditingController();
  TextEditingController Previous_name = TextEditingController();
  TextEditingController Town_Chip = TextEditingController();
  TextEditingController Fax = TextEditingController();
  TextEditingController Work_Begin_Year = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 18.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.end,
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
                        shape: WidgetStatePropertyAll(RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(5))))),
                    onPressed: () {},
                    icon: Icon(Icons.save,
                        size: 18, color: Get.theme.primaryColor)),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 10.0),
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
                          shape: WidgetStatePropertyAll(RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(5))))),
                      onPressed: () {},
                      icon: Icon(VMS_Icons.pdf,
                          size: 18, color: Get.theme.primaryColor)),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 20.0, left: 10.0),
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
                          shape: WidgetStatePropertyAll(RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(5))))),
                      onPressed: () {},
                      icon: Icon(VMS_Icons.xl,
                          size: 18, color: Get.theme.primaryColor)),
                ),
              ),
            ],
          ),
        ),
        Expanded(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.only(bottom: 40.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  GetBuilder<SchoolInfoController>(builder: (controller) {
                    return Container(
                        padding: EdgeInsets.all(15.0),
                        decoration: BoxDecoration(
                            border: Border.all(color: Color(0xffB3B3B3)),
                            borderRadius: BorderRadius.all(Radius.circular(5))),
                        margin:
                            EdgeInsets.only(left: 30.0, right: 30.0, top: 30.0),
                        alignment: Alignment.center,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Textfildwithupper(
                                    width: Get.width / 2.5,
                                    controller: School_Name,
                                    Uptext: "School Name",
                                    hinttext: "School Name"),
                                Padding(
                                  padding: const EdgeInsets.only(
                                      left: 20.0, right: 20.0),
                                  child: Textfildwithupper(
                                      width: Get.width / 2.5,
                                      controller: License_Number,
                                      Uptext: "License Number",
                                      hinttext: "License Number"),
                                )
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Textfildwithupper(
                                    width: Get.width / 2.5,
                                    controller: Address,
                                    Uptext: "Address",
                                    hinttext: "Address"),
                                Padding(
                                  padding: const EdgeInsets.only(
                                      left: 20.0, right: 20.0),
                                  child: Textfildwithupper(
                                      width: Get.width / 2.5,
                                      controller: Village,
                                      Uptext: "Village",
                                      hinttext: "Village"),
                                )
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Textfildwithupper(
                                    width: Get.width / 2.5,
                                    controller: Region,
                                    Uptext: "Region",
                                    hinttext: "Region"),
                                Padding(
                                  padding: const EdgeInsets.only(
                                      left: 20.0, right: 20.0),
                                  child: Textfildwithupper(
                                      width: Get.width / 2.5,
                                      controller: Phone,
                                      Uptext: "Phone",
                                      hinttext: "Phone"),
                                )
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Textfildwithupper(
                                    width: Get.width / 2.5,
                                    controller: Email,
                                    Uptext: "Email",
                                    hinttext: "Email"),
                                Padding(
                                  padding: const EdgeInsets.only(
                                      left: 20.0, right: 20.0),
                                  child: Textfildwithupper(
                                      width: Get.width / 2.5,
                                      controller: Creation_Year,
                                      Uptext: "Creation Year",
                                      hinttext: "Creation Year"),
                                )
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Textfildwithupper(
                                    width: Get.width / 2.5,
                                    controller: Clinic_Name,
                                    Uptext: "Clinic Name",
                                    hinttext: "Clinic Name"),
                                Padding(
                                  padding: const EdgeInsets.only(
                                      left: 20.0, right: 20.0),
                                  child: Textfildwithupper(
                                      width: Get.width / 2.5,
                                      controller: Congregation_number,
                                      Uptext: "Congregation number",
                                      hinttext: "Congregation number"),
                                )
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Textfildwithupper(
                                    width: Get.width / 2.5,
                                    controller: Previous_name,
                                    Uptext: "Previous name",
                                    hinttext: "Previous name"),
                                Padding(
                                  padding: const EdgeInsets.only(
                                      left: 20.0, right: 20.0),
                                  child: Textfildwithupper(
                                      width: Get.width / 2.5,
                                      controller: Town_Chip,
                                      Uptext: "Town Chip",
                                      hinttext: "Town Chip"),
                                )
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Container(
                                  width: Get.width / 2.5,
                                  child: Column(
                                    children: [
                                      Obx(() => Row(
                                            children: [
                                              Checkbox(
                                                value: controller
                                                    .Outstanding_School.value,
                                                onChanged: (value) {
                                                  controller.Outstanding_School
                                                      .value = value!;
                                                },
                                              ),
                                              Text("Outstanding School"),
                                            ],
                                          )),
                                      Obx(() => Row(
                                            children: [
                                              Checkbox(
                                                value: controller
                                                    .Taken_OverSchool.value,
                                                onChanged: (value) {
                                                  controller.Taken_OverSchool
                                                      .value = value!;
                                                },
                                              ),
                                              Text("Taken Over School"),
                                            ],
                                          )),
                                      Obx(() => Row(
                                            children: [
                                              Checkbox(
                                                value: controller
                                                    .Reassignment_Teachers
                                                    .value,
                                                onChanged: (value) {
                                                  controller
                                                      .Reassignment_Teachers
                                                      .value = value!;
                                                },
                                              ),
                                              Text("Reassignment Teachers"),
                                            ],
                                          )),
                                      Obx(() => Row(
                                            children: [
                                              Checkbox(
                                                value: controller
                                                    .Martyrs_Sons.value,
                                                onChanged: (value) {
                                                  controller.Martyrs_Sons
                                                      .value = value!;
                                                },
                                              ),
                                              Text("Martyrs Sons"),
                                            ],
                                          )),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                      left: 20.0, right: 20.0),
                                  child: Container(
                                    width: Get.width / 2.5,
                                    child: Column(
                                      children: [
                                        Obx(() => Row(
                                              children: [
                                                Checkbox(
                                                  value: controller
                                                      .Internet_Connection
                                                      .value,
                                                  onChanged: (value) {
                                                    controller
                                                        .Internet_Connection
                                                        .value = value!;
                                                  },
                                                ),
                                                Text("Internet Connection"),
                                              ],
                                            )),
                                        Obx(() => Row(
                                              children: [
                                                Checkbox(
                                                  value: controller
                                                      .Government_Connection
                                                      .value,
                                                  onChanged: (value) {
                                                    controller
                                                        .Government_Connection
                                                        .value = value!;
                                                  },
                                                ),
                                                Text("Government Connection"),
                                              ],
                                            )),
                                        Obx(() => Row(
                                              children: [
                                                Checkbox(
                                                  value: controller
                                                      .Joint_Building.value,
                                                  onChanged: (value) {
                                                    controller.Joint_Building
                                                        .value = value!;
                                                  },
                                                ),
                                                Text("Joint Building"),
                                              ],
                                            )),
                                        Obx(() => Row(
                                              children: [
                                                Checkbox(
                                                  value: controller
                                                      .Industrial_Section.value,
                                                  onChanged: (value) {
                                                    controller
                                                        .Industrial_Section
                                                        .value = value!;
                                                  },
                                                ),
                                                Text("Industrial Section"),
                                              ],
                                            )),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ));
                  }),
                ],
              ),
            ),
          ),
        ),
      ],
    ));
  }
}
