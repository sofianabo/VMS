import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vms_school/Icons_File/v_m_s__icons_icons.dart';
import 'package:vms_school/Link/API/AdminAPI/Teacher_APIS/AddTeacherAPI.dart';
import 'package:vms_school/Link/API/AdminAPI/Teacher_APIS/GetAllTeachersAPI.dart';
import 'package:vms_school/Link/Controller/AdminController/Employee_Controllers/AllEmpolyeeController.dart';
import 'package:vms_school/view/Admin/Teacher_Manager/TeacherManagementGrid.dart';
import 'package:vms_school/widgets/Admin_School/All_Screen_Sessions.dart';
import 'package:vms_school/widgets/Admin_employee/DropDownAllEmployee.dart';
import 'package:vms_school/widgets/Admin_teachers/DropDownAllTeacher.dart';
import 'package:vms_school/widgets/ButtonsDialog.dart';
import 'package:vms_school/widgets/Calender.dart';
import 'package:vms_school/widgets/DropDown.dart';
import 'package:vms_school/widgets/TextFildWithUpper.dart';
import 'package:vms_school/widgets/TextFormSearch.dart';
import 'package:vms_school/widgets/VMSAlertDialog.dart';

class TeacherManagement extends StatefulWidget {
  TeacherManagement({super.key});

  @override
  State<TeacherManagement> createState() => _TeacherManagementState();
}

class _TeacherManagementState extends State<TeacherManagement> {
  @override
  void initState() {
    Getallteachersapi.Getallteachers();
    super.initState();
  }

  TextEditingController search = TextEditingController();
  TextEditingController username = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController firstName = TextEditingController();
  TextEditingController lastName = TextEditingController();
  TextEditingController phone = TextEditingController();
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
                          child: DropDownAllSessions(
                            title: "Session",
                            width: w / 6.5,
                            type: "session",
                            API: "TeacherManagement",
                          )),
                      Padding(
                          padding: const EdgeInsets.only(left: 8.0),
                          child: Dropdownallteacher(
                              title: "Grade", width: w / 6.5, type: "grade")),
                      Padding(
                          padding: const EdgeInsets.only(left: 8.0),
                          child: Dropdownallteacher(
                              title: "Class", width: w / 6.5, type: "class")),
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
                              Get.dialog(GetBuilder<Allempolyeecontroller>(
                                  builder: (cont) {
                                return VMSAlertDialog(
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
                                                    cont.Joindate.toString(),
                                                    phone.text,
                                                    cont.GenderListIndex,
                                                    cont.ContractTypeIndex
                                                        .trim(),
                                                    "teacher",
                                                    "Teacher",
                                                    password.text);
                                            Get.back();
                                            Getallteachersapi.Getallteachers();
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
                                                  JoinDate(
                                                    width: 220,
                                                    Uptext: "Join Date",
                                                  )
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
                                                child: Dropdownallemployee(
                                                    title: "Gender",
                                                    width: 220,
                                                    type: "Gender"),
                                              ),
                                              Dropdownallemployee(
                                                  title: "Contract Type",
                                                  width: 220,
                                                  type: "Contract"),
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
                                    subtitle: "none");
                              }));
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
