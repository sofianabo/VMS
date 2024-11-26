import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vms_school/Icons_File/v_m_s__icons_icons.dart';
import 'package:vms_school/view/Admin/Employee_Manager/Virtual_User_Management_Grid.dart';
import 'package:vms_school/widgets/Admin_employee/DropDownAllEmployee.dart';
import 'package:vms_school/widgets/ButtonsDialog.dart';
import 'package:vms_school/widgets/TextFildWithUpper.dart';
import 'package:vms_school/widgets/TextFormSearch.dart';
import 'package:vms_school/widgets/VMSAlertDialog.dart';

class Virtual_User_Management extends StatefulWidget {
  Virtual_User_Management({super.key});

  @override
  State<Virtual_User_Management> createState() =>
      _Virtual_User_ManagementState();
}

class _Virtual_User_ManagementState extends State<Virtual_User_Management> {
  TextEditingController search = TextEditingController();
  TextEditingController username = TextEditingController();
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
                          child: Dropdownallemployee(
                              title: "Job Title", width: w / 5, type: "roll")),
                      Padding(
                        padding: const EdgeInsets.only(left: 8.0),
                        child: TextFormSearch(
                          width: w / 2,
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
                                        text: "Add Virtual User",
                                        onPressed: () {
                                          Get.back();
                                        },
                                        color: Get.theme.primaryColor,
                                        width: 150)
                                  ],
                                  contents: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.end,
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                right: 15.0),
                                            child: Textfildwithupper(
                                                Uptext: "Username",
                                                width: 250,
                                                controller: username,
                                                hinttext: "Username"),
                                          ),
                                          Dropdownallemployee(
                                              title: "Job Title",
                                              width: 250,
                                              type: "rolldialog"),
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
                                                  Uptext: "Password",
                                                  width: 250,
                                                  controller: password,
                                                  hinttext: "Password"),
                                            ),
                                            Textfildwithupper(
                                                Uptext: "Confirm Password",
                                                width: 250,
                                                controller: cPassword,
                                                hinttext: "Confirm Password")
                                          ],
                                        ),
                                      )
                                    ],
                                  ),
                                  apptitle: "Add Virtual User",
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
          child: Virtual_User_Management_Grid(),
        )),
      ],
    ));
  }
}
