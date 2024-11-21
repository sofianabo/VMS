// ignore_for_file: must_be_immutable, file_names

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx/Link/API/AdminAPI/GetAllClassAPI.dart';
import 'package:getx/Link/API/AdminAPI/GetAllGradeAPI.dart';
import 'package:getx/Link/API/AdminAPI/GetSessionAPI.dart';
import 'package:getx/Link/Controller/AdminController/AllStudentsController.dart';
import 'package:getx/Link/Controller/WidgetController/CheckBoxController.dart';
import 'package:getx/Icons_File/v_m_s__icons_icons.dart';
import 'package:getx/view/Admin/AllStudentGrid.dart';
import 'package:getx/widgets/Admin_Students/DropDownAllStudents.dart';
import 'package:getx/widgets/TextFormSearch.dart';

import '../../Link/API/AdminAPI/GetAllStudentAPI.dart';

class AllStudent extends StatefulWidget {
  AllStudent({super.key});

  @override
  State<AllStudent> createState() => _AllStudentState();
}

class _AllStudentState extends State<AllStudent> {
  @override
  void initState() {
    Getsessionapi(context).Getsession();
    Getallgradeapi(context).Getallgrade();
    Getallclassapi(context).getAllClasses();
    Getallstudentapi(context).Getallstudent(null);

    // TODO: implement initState
    super.initState();
  }

  TextEditingController search = TextEditingController();

  final CheckboxController controller = Get.put(CheckboxController());

  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    return Expanded(
        child: Column(
      children: [
        GetBuilder<Allstudentscontroller>(builder: (controllers) {
          return Container(
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
                          child: DropDownAllStudents(
                            title: "Session",
                            type: "session",
                            width: w / 6.5,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 8.0),
                          child: DropDownAllStudents(
                            type: "grade",
                            title: "Grade",
                            width: w / 6.5,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 8.0),
                          child: DropDownAllStudents(
                            type: "class",
                            title: "Class",
                            width: w / 6.5,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 8.0),
                          child: DropDownAllStudents(
                            type: "division",
                            title: "Division",
                            width: w / 6.5,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 8.0),
                          child: TextFormSearch(
                            onchange: (value) {
                              controllers.searchStudentByName(
                                  value); // البحث عند الكتابة
                            },
                            width: w / 6.5,
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
                                  shape: WidgetStatePropertyAll(
                                      RoundedRectangleBorder(
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(5))))),
                              onPressed: () {},
                              icon: Icon(VMS_Icons.xl,
                                  size: 18, color: Get.theme.primaryColor)),
                        ),
                        Padding(
                          padding:
                              const EdgeInsets.only(right: 10.0, left: 10.0),
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
                                    shape: WidgetStatePropertyAll(
                                        RoundedRectangleBorder(
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(5))))),
                                onPressed: () {},
                                icon: Icon(VMS_Icons.pdf,
                                    size: 18, color: Get.theme.primaryColor)),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ],
            ),
          );
        }),
        Expanded(
            child: Padding(
          padding: const EdgeInsets.only(top: 15.0),
          child: AllStudentGrid(),
        )),
      ],
    ));
  }
}
