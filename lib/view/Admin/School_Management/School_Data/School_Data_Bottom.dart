import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vms_school/Link/Controller/AdminController/Employee_Controllers/Add_Data_controller.dart';
import 'package:vms_school/Link/Controller/AdminController/School_Controllers/School_Info_Controller.dart';
import 'package:vms_school/widgets/TextFildWithUpper.dart';

class School_Data extends StatelessWidget {
  School_Data({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    print(screenWidth);
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        GetBuilder<SchoolInfoController>(builder: (controller) {
          return Container(
              padding: const EdgeInsets.all(15.0),
              decoration: BoxDecoration(
                  border: Border.all(color: const Color(0xffB3B3B3)),
                  borderRadius: const BorderRadius.all(Radius.circular(5))),
              margin: const EdgeInsets.only(left: 30.0, right: 30.0, top: 30.0),
              alignment: Alignment.center,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Wrap(
                    spacing: 10.0,
                    runSpacing: 10.0,
                    alignment: WrapAlignment.spaceBetween,
                    runAlignment: WrapAlignment.spaceBetween,
                    crossAxisAlignment: WrapCrossAlignment.center,
                    children: [
                      Textfildwithupper(
                          enabled: Get.find<Add_Data_controller>().roll !=
                              "subAdmin",
                          isRequired: true,
                          isError: controller.IsnameError,
                          onChanged: (value) {
                            if (value.isNotEmpty) {
                              controller.updateFieldError("name", false);
                            }
                          },
                          width: screenWidth >= 616 ? screenWidth / 2.8 : 300,
                          controller: controller.School_Name,
                          Uptext: "School Name".tr,
                          hinttext: "School Name".tr),
                      Textfildwithupper(
                          enabled: Get.find<Add_Data_controller>().roll !=
                              "subAdmin",
                          isError: controller.IslicError,
                          onChanged: (value) {
                            if (value.isNotEmpty) {
                              controller.updateFieldError("lic", false);
                            }
                          },
                          isRequired: true,
                          width: screenWidth >= 616 ? screenWidth / 2.8 : 300,
                          controller: controller.License_Number,
                          Uptext: "License Number".tr,
                          hinttext: "License Number".tr)
                    ],
                  ),
                  Wrap(
                    spacing: 10.0,
                    runSpacing: 10.0,
                    alignment: WrapAlignment.spaceBetween,
                    runAlignment: WrapAlignment.spaceBetween,
                    crossAxisAlignment: WrapCrossAlignment.center,
                    children: [
                      Textfildwithupper(
                          enabled: Get.find<Add_Data_controller>().roll !=
                              "subAdmin",
                          isError: controller.IsaddressError,
                          onChanged: (value) {
                            if (value.isNotEmpty) {
                              controller.updateFieldError("address", false);
                            }
                          },
                          isRequired: true,
                          width: screenWidth >= 616 ? screenWidth / 2.8 : 300,
                          controller: controller.Address,
                          Uptext: "Address".tr,
                          hinttext: "Address".tr),
                      Textfildwithupper(
                          enabled: Get.find<Add_Data_controller>().roll !=
                              "subAdmin",
                          isError: controller.IsvillError,
                          onChanged: (value) {
                            if (value.isNotEmpty) {
                              controller.updateFieldError("vill", false);
                            }
                          },
                          isRequired: true,
                          width: screenWidth >= 616 ? screenWidth / 2.8 : 300,
                          controller: controller.Village,
                          Uptext: "Village".tr,
                          hinttext: "Village".tr)
                    ],
                  ),
                  Wrap(
                    spacing: 10.0,
                    runSpacing: 10.0,
                    alignment: WrapAlignment.spaceBetween,
                    runAlignment: WrapAlignment.spaceBetween,
                    crossAxisAlignment: WrapCrossAlignment.center,
                    children: [
                      Textfildwithupper(
                          enabled: Get.find<Add_Data_controller>().roll !=
                              "subAdmin",
                          isError: controller.IsregError,
                          onChanged: (value) {
                            if (value.isNotEmpty) {
                              controller.updateFieldError("reg", false);
                            }
                          },
                          isRequired: true,
                          width: screenWidth >= 616 ? screenWidth / 2.8 : 300,
                          controller: controller.Region,
                          Uptext: "Region".tr,
                          hinttext: "Region".tr),
                      Textfildwithupper(
                          enabled: Get.find<Add_Data_controller>().roll !=
                              "subAdmin",
                          isError: controller.Isphoneror,
                          onChanged: (value) {
                            if (value.isNotEmpty) {
                              controller.updateFieldError("phone", false);
                            }
                          },
                          fieldType: "phone",
                          isRequired: true,
                          width: screenWidth >= 616 ? screenWidth / 2.8 : 300,
                          controller: controller.Phone,
                          Uptext: "Phone".tr,
                          hinttext: "Phone".tr)
                    ],
                  ),
                  Wrap(
                    spacing: 10.0,
                    runSpacing: 10.0,
                    alignment: WrapAlignment.spaceBetween,
                    runAlignment: WrapAlignment.spaceBetween,
                    crossAxisAlignment: WrapCrossAlignment.center,
                    children: [
                      Textfildwithupper(
                          enabled: Get.find<Add_Data_controller>().roll !=
                              "subAdmin",
                          isError: controller.IsworkError,
                          onChanged: (value) {
                            if (value.isNotEmpty) {
                              controller.updateFieldError("work", false);
                            }
                          },
                          fieldType: "number",
                          isRequired: true,
                          width: screenWidth >= 616 ? screenWidth / 2.8 : 300,
                          controller: controller.Work_Begin_Year,
                          Uptext: "Work Begin Year".tr,
                          hinttext: "Work Begin Year".tr),
                      Textfildwithupper(
                          enabled: Get.find<Add_Data_controller>().roll !=
                              "subAdmin",
                          isError: controller.IscxError,
                          onChanged: (value) {
                            if (value.isNotEmpty) {
                              controller.updateFieldError("cx", false);
                            }
                          },
                          fieldType: "number",
                          isRequired: true,
                          width: screenWidth >= 616 ? screenWidth / 2.8 : 300,
                          controller: controller.Creation_Year,
                          Uptext: "Creation Year".tr,
                          hinttext: "Creation Year".tr)
                    ],
                  ),
                  Wrap(
                    spacing: 10.0,
                    runSpacing: 10.0,
                    alignment: WrapAlignment.spaceBetween,
                    runAlignment: WrapAlignment.spaceBetween,
                    crossAxisAlignment: WrapCrossAlignment.center,
                    children: [
                      Textfildwithupper(
                          enabled: Get.find<Add_Data_controller>().roll !=
                              "subAdmin",
                          isError: controller.IsemailError,
                          onChanged: (value) {
                            if (value.isNotEmpty) {
                              controller.updateFieldError("email", false);
                            }
                          },
                          fieldType: "email",
                          isRequired: true,
                          width: screenWidth >= 616 ? screenWidth / 2.8 : 300,
                          controller: controller.Email,
                          Uptext: "Email".tr,
                          hinttext: "Email".tr),
                      Textfildwithupper(
                          enabled: Get.find<Add_Data_controller>().roll !=
                              "subAdmin",
                          width: screenWidth >= 616 ? screenWidth / 2.8 : 300,
                          controller: controller.Fax,
                          Uptext: "Fax".tr,
                          hinttext: "Fax".tr)
                    ],
                  ),
                  Wrap(
                    spacing: 10.0,
                    runSpacing: 10.0,
                    alignment: WrapAlignment.spaceBetween,
                    runAlignment: WrapAlignment.spaceBetween,
                    crossAxisAlignment: WrapCrossAlignment.center,
                    children: [
                      Textfildwithupper(
                          enabled: Get.find<Add_Data_controller>().roll !=
                              "subAdmin",
                          width: screenWidth >= 616 ? screenWidth / 2.8 : 300,
                          controller: controller.Clinic_Name,
                          Uptext: "Clinic Name".tr,
                          hinttext: "Clinic Name".tr),
                      Textfildwithupper(
                          enabled: Get.find<Add_Data_controller>().roll !=
                              "subAdmin",
                          fieldType: "number",
                          isError: controller.IscnumError,
                          onChanged: (value) {
                            if (value.isNotEmpty) {
                              controller.updateFieldError("cnum", false);
                            }
                          },
                          isRequired: true,
                          width: screenWidth >= 616 ? screenWidth / 2.8 : 300,
                          controller: controller.Congregation_number,
                          Uptext: "Congregation number".tr,
                          hinttext: "Congregation number".tr)
                    ],
                  ),
                  Wrap(
                    spacing: 10.0,
                    runSpacing: 10.0,
                    alignment: WrapAlignment.spaceBetween,
                    runAlignment: WrapAlignment.spaceBetween,
                    crossAxisAlignment: WrapCrossAlignment.center,
                    children: [
                      Textfildwithupper(
                          enabled: Get.find<Add_Data_controller>().roll !=
                              "subAdmin",
                          width: screenWidth >= 616 ? screenWidth / 2.8 : 300,
                          controller: controller.Previous_name,
                          Uptext: "Previous name".tr,
                          hinttext: "Previous name".tr),
                      Textfildwithupper(
                          enabled: Get.find<Add_Data_controller>().roll !=
                              "subAdmin",
                          isError: controller.IstwnError,
                          onChanged: (value) {
                            if (value.isNotEmpty) {
                              controller.updateFieldError("twn", false);
                            }
                          },
                          isRequired: true,
                          width: screenWidth >= 616 ? screenWidth / 2.8 : 300,
                          controller: controller.Town_Chip,
                          Uptext: "Town Chip".tr,
                          hinttext: "Town Chip".tr)
                    ],
                  ),
                  Wrap(
                    spacing: 10.0,
                    runSpacing: 10.0,
                    alignment: WrapAlignment.spaceBetween,
                    runAlignment: WrapAlignment.spaceBetween,
                    crossAxisAlignment: WrapCrossAlignment.center,
                    children: [
                      SizedBox(
                        width: screenWidth >= 616 ? screenWidth / 2.8 : 300,
                        child: Column(
                          children: [
                            Obx(() => Row(
                                  children: [
                                    Checkbox(
                                      checkColor: Colors.white,
                                      value:
                                          controller.Outstanding_School.value,
                                      onChanged: (value) {
                                        if (Get.find<Add_Data_controller>()
                                                .roll !=
                                            "subAdmin") {
                                          controller.Outstanding_School.value =
                                              value!;
                                        }
                                      },
                                    ),
                                    Text("Outstanding School".tr),
                                  ],
                                )),
                            Obx(() => Row(
                                  children: [
                                    Checkbox(
                                      checkColor: Colors.white,
                                      value: controller.Taken_OverSchool.value,
                                      onChanged: (value) {
                                        if (Get.find<Add_Data_controller>()
                                                .roll !=
                                            "subAdmin") {
                                          controller.Taken_OverSchool.value =
                                              value!;
                                        }
                                      },
                                    ),
                                    Text("Taken Over School".tr),
                                  ],
                                )),
                            Obx(() => Row(
                                  children: [
                                    Checkbox(
                                      checkColor: Colors.white,
                                      value: controller
                                          .Reassignment_Teachers.value,
                                      onChanged: (value) {
                                        if (Get.find<Add_Data_controller>()
                                                .roll !=
                                            "subAdmin") {
                                          controller.Reassignment_Teachers
                                              .value = value!;
                                        }
                                      },
                                    ),
                                    Text("Reassignment Teachers".tr),
                                  ],
                                )),
                            Obx(() => Row(
                                  children: [
                                    Checkbox(
                                      checkColor: Colors.white,
                                      value: controller.Martyrs_Sons.value,
                                      onChanged: (value) {
                                        if (Get.find<Add_Data_controller>()
                                                .roll !=
                                            "subAdmin") {
                                          controller.Martyrs_Sons.value =
                                              value!;
                                        }
                                      },
                                    ),
                                    Text("Martyrs Sons".tr),
                                  ],
                                )),
                            Obx(() => Row(
                                  children: [
                                    Checkbox(
                                      checkColor: Colors.white,
                                      value: controller.evening.value,
                                      onChanged: (value) {
                                        if (Get.find<Add_Data_controller>()
                                                .roll !=
                                            "subAdmin") {
                                          controller.evening.value = value!;
                                        }
                                      },
                                    ),
                                    Text("Evening".tr),
                                  ],
                                )),
                          ],
                        ),
                      ),
                      SizedBox(
                        width: screenWidth >= 616 ? screenWidth / 2.8 : 300,
                        child: Column(
                          children: [
                            Obx(() => Row(
                                  children: [
                                    Checkbox(
                                      checkColor: Colors.white,
                                      value:
                                          controller.Internet_Connection.value,
                                      onChanged: (value) {
                                        if (Get.find<Add_Data_controller>()
                                                .roll !=
                                            "subAdmin") {
                                          controller.Internet_Connection.value =
                                              value!;
                                        }
                                      },
                                    ),
                                    Text("Internet Connection".tr),
                                  ],
                                )),
                            Obx(() => Row(
                                  children: [
                                    Checkbox(
                                      checkColor: Colors.white,
                                      value: controller
                                          .Government_Connection.value,
                                      onChanged: (value) {
                                        if (Get.find<Add_Data_controller>()
                                                .roll !=
                                            "subAdmin") {
                                          controller.Government_Connection
                                              .value = value!;
                                        }
                                      },
                                    ),
                                    Text("Government Connection".tr),
                                  ],
                                )),
                            Obx(() => Row(
                                  children: [
                                    Checkbox(
                                      checkColor: Colors.white,
                                      value: controller.Joint_Building.value,
                                      onChanged: (value) {
                                        if (Get.find<Add_Data_controller>()
                                                .roll !=
                                            "subAdmin") {
                                          controller.Joint_Building.value =
                                              value!;
                                        }
                                      },
                                    ),
                                    Text("Joint Building".tr),
                                  ],
                                )),
                            Obx(() => Row(
                                  children: [
                                    Checkbox(
                                      checkColor: Colors.white,
                                      value:
                                          controller.Industrial_Section.value,
                                      onChanged: (value) {
                                        if (Get.find<Add_Data_controller>()
                                                .roll !=
                                            "subAdmin") {
                                          controller.Industrial_Section.value =
                                              value!;
                                        }
                                      },
                                    ),
                                    Text("Industrial Section".tr),
                                  ],
                                )),
                            Obx(() => Row(
                                  children: [
                                    Checkbox(
                                      checkColor: Colors.white,
                                      value: controller.morning.value,
                                      onChanged: (value) {
                                        if (Get.find<Add_Data_controller>()
                                                .roll !=
                                            "subAdmin") {
                                          controller.morning.value = value!;
                                        }
                                      },
                                    ),
                                    Text("Morning".tr),
                                  ],
                                )),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ));
        }),
      ],
    );
  }
}
