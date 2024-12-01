// ignore_for_file: non_constant_identifier_names, file_names

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/route_manager.dart';
import 'package:vms_school/widgets/ButtonsDialog.dart';
import 'package:vms_school/widgets/Calender.dart';
import 'package:vms_school/widgets/DropDown.dart';
import 'package:vms_school/widgets/LargeTextField.dart';
import 'package:vms_school/widgets/TextFieldDialog.dart';

EditTeacherDialog() {
  TextEditingController firstName = TextEditingController();
  TextEditingController lastName = TextEditingController();
  TextEditingController phoneNumber = TextEditingController();
  TextEditingController address = TextEditingController();
  TextEditingController emergency = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController currentAddress = TextEditingController();
  TextEditingController username = TextEditingController();
  TextEditingController salary = TextEditingController();
  TextEditingController fatherName = TextEditingController();
  TextEditingController jobTitle = TextEditingController();
  TextEditingController facebook = TextEditingController();
  TextEditingController motherName = TextEditingController();
  TextEditingController x = TextEditingController();
  TextEditingController linkedin = TextEditingController();
  TextEditingController insta = TextEditingController();
  TextEditingController bankAccountTitle = TextEditingController();
  TextEditingController bankName = TextEditingController();
  TextEditingController bankBranchName = TextEditingController();
  TextEditingController bankAccountNumber = TextEditingController();
  TextEditingController ifsc = TextEditingController();
  TextEditingController careerHistory = TextEditingController();
  TextEditingController qualification = TextEditingController();
  TextEditingController experience = TextEditingController();
  TextEditingController note = TextEditingController();
  return Get.dialog(
    Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
      backgroundColor: Colors.white,
      surfaceTintColor: Colors.white,
      child: Container(
        margin: const EdgeInsets.only(bottom: 20),
        height: Get.height,
        width: 554,
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
                    Text(
                      "Edit Student",
                      style: Get.theme.primaryTextTheme.bodyLarge,
                    ),
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
                          height: 162,
                          width: 162,
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
                            controller: lastName, hinttext: "last Name"),
                      ],
                    )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 15.0, right: 15, top: 15),
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
                        Text("Mother Name",
                            style: Get.theme.primaryTextTheme.labelSmall),
                        TextFieldDialog(
                            controller: motherName, hinttext: "Mother Name"),
                      ],
                    )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 15, right: 15, top: 15),
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
                        Text("Birth Date",
                            style: Get.theme.primaryTextTheme.labelSmall),
                        DatePicker(
                          width: 240,
                        )
                      ],
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 15, right: 15, top: 15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Emergency Number",
                            style: Get.theme.primaryTextTheme.labelSmall),
                        TextFieldDialog(
                            controller: emergency,
                            hinttext: "Emergency Number"),
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Join Date",
                            style: Get.theme.primaryTextTheme.labelSmall),
                        DatePicker(
                          width: 240,
                        )
                      ],
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 15.0, right: 15, top: 15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Address",
                            style: Get.theme.primaryTextTheme.labelSmall),
                        TextFieldDialog(
                            controller: address, hinttext: "Address"),
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Current Address",
                            style: Get.theme.primaryTextTheme.labelSmall),
                        TextFieldDialog(
                            controller: currentAddress,
                            hinttext: "Current Address"),
                      ],
                    )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 15.0, right: 15, top: 15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("E-mail",
                            style: Get.theme.primaryTextTheme.labelSmall),
                        TextFieldDialog(controller: email, hinttext: "E-mail"),
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("User Name",
                            style: Get.theme.primaryTextTheme.labelSmall),
                        TextFieldDialog(
                            controller: username, hinttext: "User Name"),
                      ],
                    )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 15.0, right: 15, top: 15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Salary",
                            style: Get.theme.primaryTextTheme.labelSmall),
                        TextFieldDialog(controller: salary, hinttext: "Salary"),
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Job Title",
                            style: Get.theme.primaryTextTheme.labelSmall),
                        TextFieldDialog(
                            controller: jobTitle, hinttext: "Job Title"),
                      ],
                    )
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 15, right: 15, top: 15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    DropDown(
                        title: "Gender", width: 240, options: ['dda', 'dd']),
                    DropDown(
                        title: "Family Status",
                        width: 240,
                        options: ['dfdsa', 'bhgmgh']),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 15, right: 15, top: 15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    DropDown(
                        title: "Contract Type",
                        width: 240,
                        options: ['fbdfba', 'bdfb']),
                    Container(
                      width: 240,
                      height: 40,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: Colors.white,
                        border: Border.all(color: Colors.grey),
                        boxShadow: const [
                          BoxShadow(
                            color: Colors.grey,
                            offset: Offset(0, 3),
                            blurRadius: 4,
                          ),
                        ],
                      ),
                      child: Text("illness",
                          style: Get.theme.primaryTextTheme.labelSmall),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 15, right: 15, top: 15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text("Social Media Info:",
                        style: Get.theme.primaryTextTheme.titleSmall),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 15, right: 15, top: 15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Facebook URL",
                            style: Get.theme.primaryTextTheme.labelSmall),
                        TextFieldDialog(
                            controller: facebook, hinttext: "Facebook URL"),
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("X Platform URL",
                            style: Get.theme.primaryTextTheme.labelSmall),
                        TextFieldDialog(
                            controller: x, hinttext: "X Platform URL"),
                      ],
                    )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 15, right: 15, top: 15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Linkedin URL",
                            style: Get.theme.primaryTextTheme.labelSmall),
                        TextFieldDialog(
                            controller: linkedin, hinttext: "Linkedin URL"),
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Instagram URL",
                            style: Get.theme.primaryTextTheme.labelSmall),
                        TextFieldDialog(
                            controller: insta, hinttext: "Instagram URL"),
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
                    Text("Teacher Bank Info:",
                        style: Get.theme.primaryTextTheme.titleSmall),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 15, right: 15, top: 15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Bank Account title",
                            style: Get.theme.primaryTextTheme.labelSmall),
                        TextFieldDialog(
                            controller: bankAccountTitle,
                            hinttext: "Bank Account Title"),
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Bank Name",
                            style: Get.theme.primaryTextTheme.labelSmall),
                        TextFieldDialog(
                            controller: bankName, hinttext: "Bank Name"),
                      ],
                    )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 15, right: 15, top: 15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Bank Branch Name",
                            style: Get.theme.primaryTextTheme.labelSmall),
                        TextFieldDialog(
                            controller: bankBranchName,
                            hinttext: "Bank Branch Name"),
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Bank Account Number",
                            style: Get.theme.primaryTextTheme.labelSmall),
                        TextFieldDialog(
                            controller: bankAccountNumber,
                            hinttext: "Bank Account Number"),
                      ],
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 15, right: 15, top: 15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("IFSC Code",
                            style: Get.theme.primaryTextTheme.labelSmall),
                        TextFieldDialog(
                            controller: ifsc, hinttext: "IFSC Code"),
                      ],
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 15, right: 15, top: 15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                        height: 40,
                        width: 400,
                        child: Divider(
                          color: Get.theme.colorScheme.primary,
                        )),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 15, right: 15, top: 15),
                child: Row(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Career History",
                            style: Get.theme.primaryTextTheme.labelSmall),
                        LargeTextField(
                            controller: careerHistory,
                            hinttext: "Career History")
                      ],
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 15, right: 15, top: 15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Qualification",
                            style: Get.theme.primaryTextTheme.labelSmall),
                        LargeTextField(
                            controller: qualification,
                            hinttext: "Qualification")
                      ],
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 15, right: 15, top: 15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Experience",
                            style: Get.theme.primaryTextTheme.labelSmall),
                        LargeTextField(
                            controller: experience, hinttext: "Experience")
                      ],
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 15, right: 15, top: 15),
                child: Row(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Note",
                            style: Get.theme.primaryTextTheme.labelSmall),
                        LargeTextField(controller: note, hinttext: "Note")
                      ],
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(right: 15, top: 15),
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
