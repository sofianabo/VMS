import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:vms_school/Link/API/Teacher_API/GetTeacherClassAPI.dart';
import 'package:vms_school/Link/API/Teacher_API/Get_My_Student.dart';
import 'package:vms_school/Link/Controller/Teacher_Controller/My_Students_Controller.dart';
import 'package:vms_school/view/Teacher/Functions/Marks/StudentMarksTeacher.dart';
import 'package:vms_school/view/Teacher/TeacherAppBar.dart';
import 'package:vms_school/view/Teacher/Teacher_Home/TeacherMainScreenGrid.dart';
import 'package:vms_school/widgets/Teacher/DropDownMyStudentTeacher.dart';
import 'package:vms_school/widgets/Teacher/DropDownTeacherMarks.dart';
import 'package:vms_school/widgets/TextFormSearch.dart';
import 'package:vms_school/widgets/VMSAlertDialog.dart';

class TeacherMainScreen extends StatefulWidget {
  const TeacherMainScreen({super.key});

  @override
  State<TeacherMainScreen> createState() => _GuardianMainScreenState();
}

class _GuardianMainScreenState extends State<TeacherMainScreen> {
  TextEditingController search = TextEditingController();
  @override
  void initState() {
    Getteacherclassapi.Getteacherclass();

    Get_My_Students_API().Get_My_Students();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GetBuilder<My_Students_Controller>(builder: (control) {
        return Expanded(
            child: Column(
          children: [
            Teacherappbar(),
            Container(
              width: double.infinity,
              margin:
                  const EdgeInsets.symmetric(horizontal: 30.0, vertical: 10.0),
              child: Row(
                spacing: 20,
                children: [
                  IconButton(
                    style: ButtonStyle(
                      maximumSize: WidgetStateProperty.all(const Size(35, 35)),
                      minimumSize: WidgetStateProperty.all(const Size(35, 35)),
                      iconSize: WidgetStateProperty.all(14),
                      shape: WidgetStateProperty.all(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(3),
                        ),
                      ),
                      backgroundColor: WidgetStateProperty.all(
                        Theme.of(context).primaryColorLight,
                      ),
                    ),
                    icon: FaIcon(
                      FontAwesomeIcons.markdown,
                      color: Colors.white,
                    ),
                    color: Colors.white,
                    onPressed: () {
                          Getteacherclassapi.Getteacherclass();

                      Get.dialog(Studentmarksteacher());
                    },
                  ),
                  Expanded(
                    child: GetBuilder<My_Students_Controller>(
                        builder: (controller) {
                      return TextFormSearch(
                        click: () {
                          controller.clearFilter();
                        },
                        onchange: (value) {
                          controller.searchByName(value, "", "");
                        },
                        radius: 5,
                        controller: search,
                        suffixIcon:
                            search.text.isNotEmpty ? Icons.close : Icons.search,
                      );
                    }),
                  ),
                  Dropdownmystudentteacher(
                    isLoading: control.isClassLoading,
                    title: "Class".tr,
                    width: 200,
                    type: "Class",
                  ),
                  Dropdownmystudentteacher(
                      isLoading: control.isDivisionLoading,
                      isDisabled: control.classIndex == "" ? true : false,
                      title: "Division".tr,
                      width: 200,
                      type: "Division"),
                  const SizedBox(width: 20),
                ],
              ),
            ),
            Expanded(
                child: Padding(
              padding: const EdgeInsets.only(top: 15.0),
              child: TeacherMainScreenGrid(),
            )),
          ],
        ));
      }),
    );
  }
}
