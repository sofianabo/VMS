// ignore_for_file: non_constant_identifier_names, file_names

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx/Controller/WidgetController/CheckBoxController.dart';
import 'package:getx/widgets/ButtonsDialog.dart';
import 'package:getx/widgets/Calender.dart';
import 'package:getx/widgets/DropDown.dart';
import 'package:getx/widgets/TextFieldDialog.dart';

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
        width: 600,
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(
                  left: 20.0,
                  right: 20.0,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Edit Student",
                        style: Get.theme.primaryTextTheme.bodyLarge),
                    IconButton(
                        onPressed: () {
                          Get.back();
                        },
                        icon: const Icon(Icons.highlight_remove))
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 15.0, right: 15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      children: [
                        Image.asset(
                          "../../images/Home-background2.png",
                          height: 200,
                          width: 200,
                        )
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("First Name",
                            style: Get.theme.primaryTextTheme.labelSmall),
                        TextFieldDialog(
                            controller: firstName, hinttext: "First Name"),
                        Padding(
                          padding: const EdgeInsets.only(top: 15.0),
                          child: Text("Last Name",
                              style: Get.theme.primaryTextTheme.labelSmall),
                        ),
                        TextFieldDialog(
                            controller: lastName, hinttext: "Last Name"),
                      ],
                    )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 15.0, right: 15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Birth Date",
                            style: Get.theme.primaryTextTheme.labelSmall),
                        DatePicker(width: 210,)
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Session",
                            style: Get.theme.primaryTextTheme.labelSmall),
                        TextFieldDialog(
                            controller: session, hinttext: "Session"),
                      ],
                    )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 15, right: 15, top: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Phone Number",
                            style: Get.theme.primaryTextTheme.labelSmall),
                        TextFieldDialog(
                            controller: phoneNumber, hinttext: "Phone Number"),
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Place of Birth",
                            style: Get.theme.primaryTextTheme.labelSmall),
                        TextFieldDialog(
                            controller: placeofBirth,
                            hinttext: "Place of Birth"),
                      ],
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
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Religion",
                            style: Get.theme.primaryTextTheme.labelSmall),
                        TextFieldDialog(
                            controller: religion, hinttext: "Religion"),
                      ],
                    ),
                    GetBuilder<CheckboxController>(builder: (controller) {
                      return Container(
                        margin: const EdgeInsets.only(top: 30),
                        height: 60,
                        width: 220,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            SizedBox(
                              height: 20,
                              child: Row(
                                children: [
                                  Checkbox(
                                    value: controller.selectedIndex.value == 0,
                                    onChanged: (bool? value) {
                                      controller.selectcheck(0);
                                    },
                                  ),
                                  Text("Special Needs",
                                      style:
                                          Get.theme.primaryTextTheme.bodySmall),
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 20,
                              child: Row(
                                children: [
                                  Checkbox(
                                    value: controller.selectedIndex.value == 1,
                                    onChanged: (bool? value) {
                                      controller.selectcheck(1);
                                    },
                                  ),
                                  Text("Martyr Son",
                                      style:
                                          Get.theme.primaryTextTheme.bodySmall),
                                ],
                              ),
                            ),
                            const SizedBox(height: 16.0),
                          ],
                        ),
                      );
                    })
                  ],
                ),
              ),
              Padding(
                padding:  EdgeInsets.only(left: 15, right: 15, top: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
               
                        DropDown(title: "Class",width: 280,options: ['asdsa','bwfw']),
                    
                        DropDown(title: "Division",width: 280,options: ['sdsb','fgng']),
                    
                  ],
                ),
              ),
              Padding(
                padding:  EdgeInsets.only(left: 15, right: 15, top: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                                            DropDown(title: "Blood Type",width: 280,options: ['art','bhtg']),

                                           DropDown(title: "Gender",width: 280,options: ['a']),

                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 15, right: 15, top: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                                        DropDown(title: "Location",width: 280,options: ['dfbfd','fdbb']),

                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Current Address",
                            style: Get.theme.primaryTextTheme.labelSmall),
                        TextFieldDialog(
                            controller: currentAddress,
                            hinttext: "Current Address"),
                      ],
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 15, right: 15, top: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("National Number",
                            style: Get.theme.primaryTextTheme.labelSmall),
                        TextFieldDialog(
                            controller: nationalNumber,
                            hinttext: "National Number"),
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Local ID",
                            style: Get.theme.primaryTextTheme.labelSmall),
                        TextFieldDialog(
                            controller: localID, hinttext: "Local ID"),
                      ],
                    )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 15, right: 15, top: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Fee Discount",
                            style: Get.theme.primaryTextTheme.labelSmall),
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
                      style: Get.theme.primaryTextTheme.titleSmall,
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 15, right: 15, top: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Father Name",
                            style: Get.theme.primaryTextTheme.labelSmall),
                        TextFieldDialog(
                            controller: fatherName, hinttext: "Father Name"),
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("His Job",
                            style: Get.theme.primaryTextTheme.labelSmall),
                        TextFieldDialog(
                            controller: fatherJob, hinttext: "His Job"),
                      ],
                    )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 15, right: 15, top: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Phone Number",
                            style: Get.theme.primaryTextTheme.labelSmall),
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
                      style: Get.theme.primaryTextTheme.titleSmall,
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 15, right: 15, top: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Mother Name",
                            style: Get.theme.primaryTextTheme.labelSmall),
                        TextFieldDialog(
                            controller: motherName, hinttext: "Mother Name"),
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Her Job",
                            style: Get.theme.primaryTextTheme.labelSmall),
                        TextFieldDialog(
                            controller: motherJob, hinttext: "Her Job"),
                      ],
                    )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 15, right: 15, top: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Phone Number",
                            style: Get.theme.primaryTextTheme.labelSmall),
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
                        style: Get.theme.primaryTextTheme.titleSmall),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 15, right: 15, top: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Guardian Username",
                            style: Get.theme.primaryTextTheme.labelSmall),
                        TextFieldDialog(
                            controller: guardianUserName,
                            hinttext: "Guardian Username"),
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Guardian National ID",
                            style: Get.theme.primaryTextTheme.labelSmall),
                        TextFieldDialog(
                            controller: guardianNationalID,
                            hinttext: "Guardian National ID"),
                      ],
                    )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 15, right: 15, top: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Guardian E-mail",
                            style: Get.theme.primaryTextTheme.labelSmall),
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
