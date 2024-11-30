// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vms_school/view/Admin/Students_Manager/StudentStatusGrid.dart';
import 'package:vms_school/widgets/Admin_Students/DropDownStudentsAttendence.dart';
import 'package:vms_school/widgets/Calender.dart';
import '../../../Icons_File/v_m_s__icons_icons.dart';
import '../../../widgets/TextFormSearch.dart';

class StudentStatus extends StatelessWidget {
  StudentStatus({super.key});

  TextEditingController serch = TextEditingController();
  @override
  Widget build(BuildContext context) {
    double w = Get.width;
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
                  Padding(
                    padding: const EdgeInsets.only(left: 8.0),
                    child: DropDownStudentsAttendens(
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
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(5))))),
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
                          title: "Division", width: w / 3.6, type: "division"),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 8.0),
                      child: DatePicker(
                        width: w / 3.6,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 8.0),
                      child: TextFormSearch(
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
          ),
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
