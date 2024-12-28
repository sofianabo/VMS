// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vms_school/Link/API/AdminAPI/Students_APIs/StudentAttendenceAPI.dart';
import 'package:vms_school/Link/Controller/AdminController/Students_Controllers/AdminStudentsAttendens.dart';
import 'package:vms_school/Link/Controller/AdminController/Students_Controllers/Student_Attendenc_Controller.dart';
import 'package:vms_school/Link/Controller/WidgetController/Sessions_DropDown_Controller.dart';
import 'package:vms_school/view/Admin/Students_Manager/StudentStatusGrid.dart';
import 'package:vms_school/widgets/Admin_School/All_Screen_Sessions.dart';
import 'package:vms_school/widgets/Admin_Students/DropDownStudentsAttendence.dart';
import 'package:vms_school/widgets/Calender.dart';
import '../../../Icons_File/v_m_s__icons_icons.dart';
import '../../../widgets/TextFormSearch.dart';

class StudentStatus extends StatefulWidget {
  StudentStatus({super.key});

  @override
  State<StudentStatus> createState() => _StudentStatusState();
}

class _StudentStatusState extends State<StudentStatus> {
  TextEditingController serch = TextEditingController();
  @override
  void initState() {
    Get.find<All_Screen_Sessions_Controller>().setSessionDefult();
    Studentattendenceapi(context)
        .Studentattendence();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double w = Get.width;
    return Expanded(
        child: Column(
      children: [
        Container(
          margin: EdgeInsets.only(left: 30.0, right: 30.0, top: 30.0),
          alignment: Alignment.center,
          child: GetBuilder<StudentAttendencController>(builder: (controler) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 8.0),
                      child: DropDownAllSessions(
                        API: "StudentState",
                          title: "session", width: w / 3.6, type: "session"),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 8.0),
                      child: DropDownStudentsAttendens(
                          title: "Grade", width: w / 3.6, type: "grade"),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 8.0),
                      child: DropDownStudentsAttendens(
                          title: "Class", width: w / 3.6, type: "class"),
                    ),
                    Spacer(),
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
                              shape: WidgetStatePropertyAll(
                                  RoundedRectangleBorder(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(5))))),
                          onPressed: () {},
                          icon: Icon(VMS_Icons.pdf,
                              size: 18, color: Get.theme.primaryColor)),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 8.0),
                  child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 8.0),
                        child: DropDownStudentsAttendens(
                            title: "Division",
                            width: w / 3.6,
                            type: "division"),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 8.0),
                        child: selectStudentsDateAttendence(
                          width: w / 3.6,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 8.0),
                        child: TextFormSearch(
                          onchange: (value) {
                            controler.searchattendenceByName(value);
                          },
                          width: w / 3.6,
                          radius: 5,
                          controller: serch,
                          suffixIcon: Icons.search,
                        ),
                      ),
                      Spacer(),
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
                                shape: WidgetStatePropertyAll(
                                    RoundedRectangleBorder(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(5))))),
                            onPressed: () {},
                            icon: Icon(VMS_Icons.xl,
                                size: 18, color: Get.theme.primaryColor)),
                      ),
                    ],
                  ),
                ),
              ],
            );
          }),
        ),
        Expanded(
            child: Padding(
          padding: const EdgeInsets.only(top: 15.0),
          child: StudentStatusGrid(),
        )),
      ],
    ));
  }
}
