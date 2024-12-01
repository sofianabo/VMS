import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vms_school/Icons_File/v_m_s__icons_icons.dart';
import 'package:vms_school/Link/API/AdminAPI/School/School_Info_Export.dart';
import 'package:vms_school/Link/Controller/AdminController/School_Controllers/School_Info_Controller.dart';
import 'package:vms_school/widgets/TextFildWithUpper.dart';

class MyCheckBoxScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: GetBuilder<SchoolInfoController>(builder: (controller) {
      return Column(
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
                            shape: WidgetStatePropertyAll(
                                RoundedRectangleBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(5))))),
                        onPressed: () async {
                          await exportToPdf(controller.SchoolInfo);
                        },
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
                            shape: WidgetStatePropertyAll(
                                RoundedRectangleBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(5))))),
                        onPressed: () {
                          exportToExcel(controller.SchoolInfo, [
                            'مرحبا',
                            'مرحبا',
                            'مرحبا',
                            'مرحبا',
                            'مرحبا',
                            'مرحبا',
                            'مرحبا',
                            'مرحبا',
                            'مرحبا',
                            'مرحبا',
                            'مرحبا',
                            'مرحبا',
                            'مرحبا',
                          ]);
                        },
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
                      controller.initialdata();
                      return Container(
                          padding: EdgeInsets.all(15.0),
                          decoration: BoxDecoration(
                              border: Border.all(color: Color(0xffB3B3B3)),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(5))),
                          margin: EdgeInsets.only(
                              left: 30.0, right: 30.0, top: 30.0),
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
                                      controller: controller.School_Name,
                                      Uptext: "School Name",
                                      hinttext: "School Name"),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        left: 20.0, right: 20.0),
                                    child: Textfildwithupper(
                                        width: Get.width / 2.5,
                                        controller: controller.License_Number,
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
                                      controller: controller.Address,
                                      Uptext: "Address",
                                      hinttext: "Address"),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        left: 20.0, right: 20.0),
                                    child: Textfildwithupper(
                                        width: Get.width / 2.5,
                                        controller: controller.Village,
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
                                      controller: controller.Region,
                                      Uptext: "Region",
                                      hinttext: "Region"),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        left: 20.0, right: 20.0),
                                    child: Textfildwithupper(
                                        width: Get.width / 2.5,
                                        controller: controller.Phone,
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
                                      controller: controller.Email,
                                      Uptext: "Email",
                                      hinttext: "Email"),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        left: 20.0, right: 20.0),
                                    child: Textfildwithupper(
                                        width: Get.width / 2.5,
                                        controller: controller.Creation_Year,
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
                                      controller: controller.Clinic_Name,
                                      Uptext: "Clinic Name",
                                      hinttext: "Clinic Name"),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        left: 20.0, right: 20.0),
                                    child: Textfildwithupper(
                                        width: Get.width / 2.5,
                                        controller:
                                            controller.Congregation_number,
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
                                      controller: controller.Previous_name,
                                      Uptext: "Previous name",
                                      hinttext: "Previous name"),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        left: 20.0, right: 20.0),
                                    child: Textfildwithupper(
                                        width: Get.width / 2.5,
                                        controller: controller.Town_Chip,
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
                                                  checkColor: Colors.white,
                                                  value: controller
                                                      .Outstanding_School.value,
                                                  onChanged: (value) {
                                                    controller
                                                        .Outstanding_School
                                                        .value = value!;
                                                  },
                                                ),
                                                Text("Outstanding School"),
                                              ],
                                            )),
                                        Obx(() => Row(
                                              children: [
                                                Checkbox(
                                                  checkColor: Colors.white,
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
                                                  checkColor: Colors.white,
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
                                                  checkColor: Colors.white,
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
                                                    checkColor: Colors.white,
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
                                                    checkColor: Colors.white,
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
                                                    checkColor: Colors.white,
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
                                                    checkColor: Colors.white,
                                                    value: controller
                                                        .Industrial_Section
                                                        .value,
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
      );
    }));
  }
}
