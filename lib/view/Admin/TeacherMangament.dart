// ignore_for_file: must_be_immutable, file_names

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx/Icons_File/v_m_s__icons_icons.dart';
import 'package:getx/Link/API/AdminAPI/AddTeacherAPI.dart';
import 'package:getx/view/Admin/TeacherManagementGrid.dart';
import 'package:getx/widgets/ButtonsDialog.dart';
import 'package:getx/widgets/Calender.dart';
import 'package:getx/widgets/DropDown.dart';
import 'package:getx/widgets/TextFormSearch.dart';
import 'package:getx/widgets/VMSAlertDialog.dart';

import '../../widgets/TextFildWithUpper.dart';

class TeacherManagement extends StatelessWidget {
  TeacherManagement({super.key});

  TextEditingController search = TextEditingController();
  TextEditingController username = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController firstName = TextEditingController();
  TextEditingController lastName = TextEditingController();
  TextEditingController gender = TextEditingController();
  TextEditingController joinDate = TextEditingController();
  TextEditingController phone = TextEditingController();
  TextEditingController contractType = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController cPassword = TextEditingController();

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
                        child: DropDown(
                            title: "2024-2025",
                            width: w / 6,
                            options: ['abbb', 'bfddfvd']),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 8.0),
                        child: DropDown(
                            title: "Grade",
                            width: w / 6,
                            options: ['abbb', 'bfddfvd']),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 8.0),
                        child: DropDown(
                            title: "Class",
                            width: w / 6,
                            options: ['abbb', 'bfddfvd']),
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
                              Get.dialog(VMSAlertDialog(
                                  action: [
                                    ButtonDialog(
                                        text: "Add Teacher",
                                        onPressed: () async {
                                          await Addteacherapi(context)
                                              .Addteacher(
                                                  firstName.text,
                                                  lastName.text,
                                                  email.text,
                                                  username.text,
                                                  "2024-11-16",
                                                  phone.text,
                                                  "Male",
                                                  "Hours",
                                                  "teacher",
                                                  "Teacher",
                                                  password.text);
                                        },
                                        color: Get.theme.primaryColor,
                                        width: 120)
                                  ],
                                  contents: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Row(
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                right: 15.0),
                                            child: Textfildwithupper(
                                                Uptext: "First Name",
                                                width: 220,
                                                controller: firstName,
                                                hinttext: "First Name"),
                                          ),
                                          Textfildwithupper(
                                              Uptext: "Last Name",
                                              width: 220,
                                              controller: lastName,
                                              hinttext: "Last Name")
                                        ],
                                      ),
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(top: 15.0),
                                        child: Row(
                                          children: [
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  right: 15.0),
                                              child: Textfildwithupper(
                                                  Uptext: "Email",
                                                  width: 220,
                                                  controller: email,
                                                  hinttext: "Email"),
                                            ),
                                            Textfildwithupper(
                                                Uptext: "Username",
                                                width: 220,
                                                controller: username,
                                                hinttext: "Username")
                                          ],
                                        ),
                                      ),
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(top: 15.0),
                                        child: Row(
                                          children: [
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  right: 15.0),
                                              child: Textfildwithupper(
                                                  Uptext: "Phone Number",
                                                  width: 220,
                                                  controller: phone,
                                                  hinttext: "Phone Number"),
                                            ),
                                            Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          bottom: 5.0),
                                                  child: Text("Join Date"),
                                                ),
                                                DatePicker(width: 220)
                                              ],
                                            )
                                          ],
                                        ),
                                      ),
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(top: 15.0),
                                        child: Row(
                                          children: [
                                            Padding(
                                                padding: const EdgeInsets.only(
                                                    right: 15.0),
                                                child: DropDown(
                                                    width: 220,
                                                    title: "Gender",
                                                    options: [])),
                                            DropDown(
                                                width: 220,
                                                title: "Contract Type",
                                                options: [])
                                          ],
                                        ),
                                      ),
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(top: 15.0),
                                        child: Row(
                                          children: [
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  right: 15.0),
                                              child: Textfildwithupper(
                                                  Uptext: "Password",
                                                  width: 220,
                                                  controller: password,
                                                  hinttext: "Password"),
                                            ),
                                            Textfildwithupper(
                                                Uptext: "Confirm Password",
                                                width: 220,
                                                controller: cPassword,
                                                hinttext: "Confirm Password")
                                          ],
                                        ),
                                      )
                                    ],
                                  ),
                                  apptitle: "Add Teacher",
                                  subtitle: "none"));
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
          child: TeacherManagementGrid(),
        )),
      ],
    ));
  }
}
