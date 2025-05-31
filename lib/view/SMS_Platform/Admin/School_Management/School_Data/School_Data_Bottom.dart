import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vms_school/Link/Controller/AdminController/Employee_Controllers/Add_Data_controller.dart';
import 'package:vms_school/Link/Controller/AdminController/School_Controllers/School_Info_Controller.dart';
import 'package:vms_school/view/SMS_Platform/Admin/School_Management/School_Data/TimePick.dart';
import 'package:vms_school/view/Both_Platform/widgets/Admin/Admin_School/School_Data_DropDown.dart';
import 'package:vms_school/view/Both_Platform/widgets/TextFildWithUpper.dart';

class School_Data extends StatelessWidget {
  School_Data({super.key});

  bool enabled = Get.find<Add_Data_controller>().roll == "admin";

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
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
                          enabled: enabled,
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
                          enabled: enabled,
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
                          enabled: enabled,
                          isError: controller.IsArabicaddressError,
                          onChanged: (value) {
                            if (value.isNotEmpty) {
                              controller.updateFieldError(
                                  "Arabicaddress", false);
                            }
                          },
                          isRequired: true,
                          width: screenWidth >= 616 ? screenWidth / 2.8 : 300,
                          controller: controller.ArabicAddress,
                          Uptext: "Arabic Address".tr,
                          hinttext: "Arabic Address".tr),
                      Textfildwithupper(
                          enabled: enabled,
                          isError: controller.IsEnglishaddressError,
                          onChanged: (value) {
                            if (value.isNotEmpty) {
                              controller.updateFieldError(
                                  "Englishaddress", false);
                            }
                          },
                          isRequired: true,
                          width: screenWidth >= 616 ? screenWidth / 2.8 : 300,
                          controller: controller.EnglishAddress,
                          Uptext: "English Address".tr,
                          hinttext: "English Address".tr),
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
                          enabled: enabled,
                          isError: controller.IsEnglishvillError,
                          onChanged: (value) {
                            if (value.isNotEmpty) {
                              controller.updateFieldError("Englishvill", false);
                            }
                          },
                          isRequired: true,
                          width: screenWidth >= 616 ? screenWidth / 2.8 : 300,
                          controller: controller.EnglishVillage,
                          Uptext: "English Village".tr,
                          hinttext: "English Village".tr),
                      Textfildwithupper(
                          enabled: enabled,
                          isError: controller.IsArabicvillError,
                          onChanged: (value) {
                            if (value.isNotEmpty) {
                              controller.updateFieldError("Arabicvill", false);
                            }
                          },
                          isRequired: true,
                          width: screenWidth >= 616 ? screenWidth / 2.8 : 300,
                          controller: controller.ArabicVillage,
                          Uptext: "Arabic Village".tr,
                          hinttext: "Arabic Village".tr),
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
                          enabled: enabled,
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
                          enabled: enabled,
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
                          enabled: enabled,
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
                          enabled: enabled,
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
                          enabled: enabled,
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
                          enabled: enabled,
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
                          enabled: enabled,
                          width: screenWidth >= 616 ? screenWidth / 2.8 : 300,
                          controller: controller.Clinic_Name,
                          Uptext: "Clinic Name".tr,
                          hinttext: "Clinic Name".tr),
                      Textfildwithupper(
                          enabled: enabled,
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
                          enabled: enabled,
                          width: screenWidth >= 616 ? screenWidth / 2.8 : 300,
                          controller: controller.Previous_name,
                          Uptext: "Previous name".tr,
                          hinttext: "Previous name".tr),
                      Textfildwithupper(
                          enabled: enabled,
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
                      School_Data_DropDown(
                        isRequired: true,
                        isLoading: controller.isCountryLoading,
                        isError: controller.IsCountryError,
                        type: "Country",
                        title: "Country".tr,
                        width: screenWidth >= 616 ? screenWidth / 2.8 : 300,
                        isDisabled: !enabled,
                      ),
                      Textfildwithupper(
                          fieldType: "phone",
                          enabled: enabled,
                          isRequired: false,
                          width: screenWidth >= 616 ? screenWidth / 2.8 : 300,
                          controller: controller.whatsapp,
                          Uptext: "Whatsapp Number".tr,
                          hinttext: "Whatsapp Number".tr)
                    ],
                  ),
                  Wrap(
                    spacing: 10.0,
                    runSpacing: 10.0,
                    alignment: WrapAlignment.spaceBetween,
                    runAlignment: WrapAlignment.spaceBetween,
                    crossAxisAlignment: WrapCrossAlignment.center,
                    children: [
                      Wrap(
                        spacing: 5.0,
                        runSpacing: 5.0,
                        alignment: WrapAlignment.spaceBetween,
                        runAlignment: WrapAlignment.spaceBetween,
                        crossAxisAlignment: WrapCrossAlignment.center,
                        children: [
                          TimePickerField(
                            label: "Start Time (Morning)".tr,
                            hint: "Select start time",
                            width: screenWidth >= 616 ? screenWidth / 5.7 : 145,
                            enabled: enabled,
                            timeValue: controller.morningStartTime,
                            controller: controller.Morning_working_hours_Start,
                          ),
                          TimePickerField(
                            label: "End Time (Morning)".tr,
                            hint: "Select end time",
                            width: screenWidth >= 616 ? screenWidth / 5.7 : 145,
                            enabled: enabled,
                            timeValue: controller.morningEndTime,
                            controller: controller.Morning_working_hours_End,
                          ),
                        ],
                      ),
                      Wrap(
                        spacing: 5.0,
                        runSpacing: 5.0,
                        alignment: WrapAlignment.spaceBetween,
                        runAlignment: WrapAlignment.spaceBetween,
                        crossAxisAlignment: WrapCrossAlignment.center,
                        children: [
                          TimePickerField(
                            label: "Start Time (Evening)".tr,
                            hint: "Select start time",
                            width: screenWidth >= 616 ? screenWidth / 5.7 : 145,
                            enabled: enabled,
                            timeValue: controller.eveningStartTime,
                            controller: controller.Evening_working_hours_Start,
                          ),
                          TimePickerField(
                            label: "End Time (Evening)".tr,
                            hint: "Select end time",
                            width: screenWidth >= 616 ? screenWidth / 5.7 : 145,
                            enabled: enabled,
                            timeValue: controller.eveningEndTime,
                            controller: controller.Evening_working_hours_End,
                          ),
                        ],
                      ),
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
                          enabled: enabled,
                          isRequired: false,
                          width: screenWidth >= 616 ? screenWidth / 2.8 : 300,
                          controller: controller.facebook,
                          Uptext: "Facebook URL".tr,
                          hinttext: "Facebook URL".tr),
                      Textfildwithupper(
                          enabled: enabled,
                          isError: controller.IsevnError,
                          isRequired: false,
                          width: screenWidth >= 616 ? screenWidth / 2.8 : 300,
                          controller: controller.youtube,
                          Uptext: "Youtube URL".tr,
                          hinttext: "Youtube URL".tr)
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
                                      onChanged: enabled
                                          ? (value) {
                                              if (Get.find<
                                                          Add_Data_controller>()
                                                      .roll !=
                                                  "subAdmin") {
                                                controller.Outstanding_School
                                                    .value = value!;
                                              }
                                            }
                                          : null,
                                    ),
                                    Text("Outstanding School".tr),
                                  ],
                                )),
                            Obx(() => Row(
                                  children: [
                                    Checkbox(
                                      checkColor: Colors.white,
                                      value: controller.Taken_OverSchool.value,
                                      onChanged: enabled
                                          ? (value) {
                                              if (Get.find<
                                                          Add_Data_controller>()
                                                      .roll !=
                                                  "subAdmin") {
                                                controller.Taken_OverSchool
                                                    .value = value!;
                                              }
                                            }
                                          : null,
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
                                      onChanged: enabled
                                          ? (value) {
                                              if (Get.find<
                                                          Add_Data_controller>()
                                                      .roll !=
                                                  "subAdmin") {
                                                controller.Reassignment_Teachers
                                                    .value = value!;
                                              }
                                            }
                                          : null,
                                    ),
                                    Text("Reassignment Teachers".tr),
                                  ],
                                )),
                            Obx(() => Row(
                                  children: [
                                    Checkbox(
                                      checkColor: Colors.white,
                                      value: controller.Martyrs_Sons.value,
                                      onChanged: enabled
                                          ? (value) {
                                              if (Get.find<
                                                          Add_Data_controller>()
                                                      .roll !=
                                                  "subAdmin") {
                                                controller.Martyrs_Sons.value =
                                                    value!;
                                              }
                                            }
                                          : null,
                                    ),
                                    Text("Martyrs Sons".tr),
                                  ],
                                )),
                            Obx(() => Row(
                                  children: [
                                    Checkbox(
                                      checkColor: Colors.white,
                                      value: controller.evening.value,
                                      onChanged: enabled
                                          ? (value) {
                                              if (Get.find<
                                                          Add_Data_controller>()
                                                      .roll !=
                                                  "subAdmin") {
                                                controller.evening.value =
                                                    value!;
                                              }
                                            }
                                          : null,
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
                                      onChanged: enabled
                                          ? (value) {
                                              if (Get.find<
                                                          Add_Data_controller>()
                                                      .roll !=
                                                  "subAdmin") {
                                                controller.Internet_Connection
                                                    .value = value!;
                                              }
                                            }
                                          : null,
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
                                      onChanged: enabled
                                          ? (value) {
                                              if (Get.find<
                                                          Add_Data_controller>()
                                                      .roll !=
                                                  "subAdmin") {
                                                controller.Government_Connection
                                                    .value = value!;
                                              }
                                            }
                                          : null,
                                    ),
                                    Text("Government Connection".tr),
                                  ],
                                )),
                            Obx(() => Row(
                                  children: [
                                    Checkbox(
                                      checkColor: Colors.white,
                                      value: controller.Joint_Building.value,
                                      onChanged: enabled
                                          ? (value) {
                                              if (Get.find<
                                                          Add_Data_controller>()
                                                      .roll !=
                                                  "subAdmin") {
                                                controller.Joint_Building
                                                    .value = value!;
                                              }
                                            }
                                          : null,
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
                                      onChanged: enabled
                                          ? (value) {
                                              if (Get.find<
                                                          Add_Data_controller>()
                                                      .roll !=
                                                  "subAdmin") {
                                                controller.Industrial_Section
                                                    .value = value!;
                                              }
                                            }
                                          : null,
                                    ),
                                    Text("Industrial Section".tr),
                                  ],
                                )),
                            Obx(() => Row(
                                  children: [
                                    Checkbox(
                                      checkColor: Colors.white,
                                      value: controller.morning.value,
                                      onChanged: enabled
                                          ? (value) {
                                              if (Get.find<
                                                          Add_Data_controller>()
                                                      .roll !=
                                                  "subAdmin") {
                                                controller.morning.value =
                                                    value!;
                                              }
                                            }
                                          : null,
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
