import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vms_school/Link/API/AdminAPI/Get_All_Employee_API.dart';
import 'package:vms_school/view/Admin/AllEmployeeGrid.dart';
import 'package:vms_school/view/Admin/Employee_Manager/Add_Full_Employee.dart';
import 'package:vms_school/widgets/Admin_employee/DropDownAllEmployee.dart';
import 'package:vms_school/widgets/ButtonsDialog.dart';
import 'package:vms_school/widgets/TextFormSearch.dart';
import '../../Icons_File/v_m_s__icons_icons.dart';
import '../../widgets/TextFildWithUpper.dart';
import '../../widgets/VMSAlertDialog.dart';

class AllEmployee extends StatefulWidget {
  AllEmployee({super.key});

  @override
  State<AllEmployee> createState() => _AllEmployeeState();
}

class _AllEmployeeState extends State<AllEmployee> {
  TextEditingController search = TextEditingController();

  TextEditingController username = TextEditingController();

  TextEditingController email = TextEditingController();

  TextEditingController password = TextEditingController();

  TextEditingController cPassword = TextEditingController();

  @override
  void initState() {
    Get_All_Employee_API(context).Get_All_Employee();
    super.initState();
  }

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
                              title: "Session",
                              width: w / 6.5,
                              type: "session")),
                      Padding(
                          padding: const EdgeInsets.only(left: 8.0),
                          child: Dropdownallemployee(
                              title: "Job Title",
                              width: w / 6.5,
                              type: "jobTitle")),
                      Padding(
                        padding: const EdgeInsets.only(left: 8.0),
                        child: TextFormSearch(
                          width: w / 3.5,
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
                            color: Color(0xffF9F8FD),
                            borderRadius: BorderRadius.circular(5),
                            boxShadow: const [
                              BoxShadow(
                                  color: Colors.black12,
                                  offset: Offset(0, 2),
                                  blurRadius: 1)
                            ]),
                        child: PopupMenuButton(
                          style: ButtonStyle(
                              backgroundColor:
                                  WidgetStatePropertyAll(Color(0xffF9F8FD)),
                              shape: WidgetStatePropertyAll(
                                  RoundedRectangleBorder(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(5))))),
                          tooltip: "",
                          child: Icon(Icons.add,
                              size: 18, color: Get.theme.primaryColor),
                          onSelected: (value) {
                            if (value == "Add Employee") {
                              Get.dialog(VMSAlertDialog(
                                  action: [
                                    ButtonDialog(
                                        text: "Add Employee",
                                        onPressed: () {
                                          Get.back();
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
                                  apptitle: "Add Employee",
                                  subtitle: "none"));
                            }
                            if (value == "Add Full Employee") {
                              Add_Full_Employee(context);
                            }
                          },

                          itemBuilder: (BuildContext context) =>
                              <PopupMenuEntry<String>>[
                            PopupMenuItem<String>(
                              value: 'Add Employee',
                              child: Text('Add Employee',
                                  style: Get.theme.primaryTextTheme.bodySmall),
                            ),
                            PopupMenuItem<String>(
                              value: 'Add Full Employee',
                              child: Text('Add Full Employee',
                                  style: Get.theme.primaryTextTheme.bodySmall),
                            ),
                          ],
                        ),
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
          child: AllEmployeeGrid(),
        )),
      ],
    ));
  }
}
