// ignore_for_file: non_constant_identifier_names, file_names

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vms_school/Link/Controller/WidgetController/CheckBoxController.dart';
import 'package:vms_school/widgets/ButtonsDialog.dart';
import 'package:vms_school/widgets/Calender.dart';
import 'package:vms_school/widgets/DropDown.dart';
import 'package:vms_school/widgets/TextFieldDialog.dart';

EditStudentDialog() {
  TextEditingController firstName = TextEditingController();
  TextEditingController lastName = TextEditingController();
  TextEditingController phoneNumber = TextEditingController();
  TextEditingController placeofBirth = TextEditingController();
  TextEditingController religion = TextEditingController();
  TextEditingController nationalNumber = TextEditingController();
  TextEditingController currentAddress = TextEditingController();
  TextEditingController feeDiscount = TextEditingController();
  TextEditingController localID = TextEditingController();
  TextEditingController fatherName = TextEditingController();
  TextEditingController fatherJob = TextEditingController();
  TextEditingController fatherPhoneNumber = TextEditingController();
  TextEditingController motherName = TextEditingController();
  TextEditingController motherJob = TextEditingController();
  TextEditingController motherPhoneNumber = TextEditingController();
  TextEditingController guardianUserName = TextEditingController();
  TextEditingController guardianNationalID = TextEditingController();
  TextEditingController guardianEmail = TextEditingController();
  TextEditingController session = TextEditingController();
  return Get.dialog(
    Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
      backgroundColor: Colors.white,
      surfaceTintColor: Colors.white,
      child: Container(
        margin: const EdgeInsets.only(bottom: 20),
        height: Get.height,
        width: 560,
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(
                  left: 20.0,
                  right: 20.0,
                ),
                child: Padding(
                  padding: const EdgeInsets.only(top: 20.0, bottom: 20.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Edit Student",
                          style: Get.theme.textTheme.bodyMedium!),
                      IconButton(
                          onPressed: () {
                            Get.back();
                          },
                          icon: const Icon(Icons.close))
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 15.0, right: 15),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Column(
                      children: [
                        Image.asset(
                          "../../images/Rectangle66.png",
                          height: 200,
                          width: 200,
                        )
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 65.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("First Name",
                              style: Get.theme.textTheme.bodyMedium!),
                          TextFieldDialog(
                              controller: firstName, hinttext: "First Name"),
                          Padding(
                            padding: const EdgeInsets.only(top: 15.0),
                            child: Text("Last Name",
                                style: Get.theme.textTheme.bodyMedium!),
                          ),
                          TextFieldDialog(
                              controller: lastName, hinttext: "Last Name"),
                        ],
                      ),
                    )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 15.0, right: 15),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Birth Date",
                            style: Get.theme.textTheme.bodyMedium!),
                        DatePicker(
                          width: 250,
                          height: 40,
                        )
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 15.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Session",
                              style: Get.theme.textTheme.bodyMedium!),
                          TextFieldDialog(
                              controller: session, hinttext: "Session"),
                        ],
                      ),
                    )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 15, right: 15, top: 10),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Phone Number",
                            style: Get.theme.textTheme.bodyMedium!),
                        TextFieldDialog(
                            controller: phoneNumber, hinttext: "Phone Number"),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 15.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Place of Birth",
                              style: Get.theme.textTheme.bodyMedium!),
                          TextFieldDialog(
                              controller: placeofBirth,
                              hinttext: "Place of Birth"),
                        ],
                      ),
                    )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                  left: 15,
                  right: 15,
                ),
                child: Row(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Religion",
                            style: Get.theme.textTheme.bodyMedium!),
                        TextFieldDialog(
                            controller: religion, hinttext: "Religion"),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 15.0),
                      child:
                          GetBuilder<CheckboxController>(builder: (controller) {
                        return Container(
                          margin: const EdgeInsets.only(top: 30),
                          height: 70,
                          width: 220,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                height: 20,
                                child: Row(
                                  children: [
                                    Checkbox(
                                      value:
                                          controller.selectedIndex.value == 0,
                                      onChanged: (bool? value) {
                                        controller.selectcheck(0);
                                      },
                                    ),
                                    Text("Special Needs",
                                        style: Get
                                            .theme.primaryTextTheme.bodySmall),
                                  ],
                                ),
                              ),
                              SizedBox(
                                height: 20,
                                child: Row(
                                  children: [
                                    Checkbox(
                                      value:
                                          controller.selectedIndex.value == 1,
                                      onChanged: (bool? value) {
                                        controller.selectcheck(1);
                                      },
                                    ),
                                    Text("Martyr Son",
                                        style: Get
                                            .theme.primaryTextTheme.bodySmall),
                                  ],
                                ),
                              ),
                              const SizedBox(height: 16.0),
                            ],
                          ),
                        );
                      }),
                    )
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 15, right: 15, top: 10),
                child: Row(
                  children: [
                    DropDown(
                        title: "Class", width: 250, options: ['asdsa', 'bwfw']),
                    Padding(
                      padding: const EdgeInsets.only(left: 15.0),
                      child: DropDown(
                          title: "Division",
                          width: 250,
                          options: ['sdsb', 'fgng']),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 15, right: 15, top: 10),
                child: Row(
                  children: [
                    DropDown(
                        title: "Blood Type",
                        width: 250,
                        options: ['art', 'bhtg']),
                    Padding(
                      padding: const EdgeInsets.only(left: 15.0),
                      child:
                          DropDown(title: "Gender", width: 250, options: ['a']),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 15, right: 15, top: 10),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    DropDown(
                        title: "Location",
                        width: 250,
                        options: ['dfbfd', 'fdbb']),
                    Padding(
                      padding: const EdgeInsets.only(left: 15.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Current Address",
                              style: Get.theme.textTheme.bodyMedium!),
                          TextFieldDialog(
                              controller: currentAddress,
                              hinttext: "Current Address"),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 15, right: 15, top: 10),
                child: Row(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("National Number",
                            style: Get.theme.textTheme.bodyMedium!),
                        TextFieldDialog(
                            controller: nationalNumber,
                            hinttext: "National Number"),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 15.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Local ID",
                              style: Get.theme.textTheme.bodyMedium!),
                          TextFieldDialog(
                              controller: localID, hinttext: "Local ID"),
                        ],
                      ),
                    )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 15, right: 15, top: 10),
                child: Row(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Fee Discount",
                            style: Get.theme.textTheme.bodyMedium!),
                        TextFieldDialog(
                            controller: feeDiscount, hinttext: "Fee Discount"),
                      ],
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 15, right: 15, top: 15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      "Student's Father Info:",
                      style: Get.theme.textTheme.bodyMedium!,
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 15, right: 15, top: 10),
                child: Row(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Father Name",
                            style: Get.theme.textTheme.bodyMedium!),
                        TextFieldDialog(
                            controller: fatherName, hinttext: "Father Name"),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 15.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("His Job",
                              style: Get.theme.textTheme.bodyMedium!),
                          TextFieldDialog(
                              controller: fatherJob, hinttext: "His Job"),
                        ],
                      ),
                    )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 15, right: 15, top: 10),
                child: Row(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Phone Number",
                            style: Get.theme.textTheme.bodyMedium!),
                        TextFieldDialog(
                            controller: fatherPhoneNumber,
                            hinttext: "Phone Number"),
                      ],
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 15, right: 15, top: 15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      "Student's Mother Info:",
                      style: Get.theme.textTheme.bodyMedium!,
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 15, right: 15, top: 10),
                child: Row(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Mother Name",
                            style: Get.theme.textTheme.bodyMedium!),
                        TextFieldDialog(
                            controller: motherName, hinttext: "Mother Name"),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 15.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Her Job",
                              style: Get.theme.textTheme.bodyMedium!),
                          TextFieldDialog(
                              controller: motherJob, hinttext: "Her Job"),
                        ],
                      ),
                    )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 15, right: 15, top: 10),
                child: Row(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Phone Number",
                            style: Get.theme.textTheme.bodyMedium!),
                        TextFieldDialog(
                            controller: motherPhoneNumber,
                            hinttext: "Phone Number"),
                      ],
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 15, right: 15, top: 15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text("Student's Guardian Info:",
                        style: Get.theme.textTheme.bodyMedium!),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 15, right: 15, top: 10),
                child: Row(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Guardian Username",
                            style: Get.theme.textTheme.bodyMedium!),
                        TextFieldDialog(
                            controller: guardianUserName,
                            hinttext: "Guardian Username"),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 15.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Guardian National ID",
                              style: Get.theme.textTheme.bodyMedium!),
                          TextFieldDialog(
                              controller: guardianNationalID,
                              hinttext: "Guardian National ID"),
                        ],
                      ),
                    )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 15, right: 15, top: 10),
                child: Row(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Guardian E-mail",
                            style: Get.theme.textTheme.bodyMedium!),
                        TextFieldDialog(
                            controller: guardianEmail,
                            hinttext: "Guardian E-mail"),
                      ],
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(right: 15, top: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    ButtonDialog(
                        width: 100,
                        text: "Edit",
                        onPressed: () {},
                        color: Get.theme.colorScheme.primary)
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    ),
  );
}
