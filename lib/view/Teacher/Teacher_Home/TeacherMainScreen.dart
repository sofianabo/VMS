import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vms_school/Link/API/Teacher_API/Get_My_Student.dart';
import 'package:vms_school/Link/Controller/Teacher_Controller/My_Students_Controller.dart';
import 'package:vms_school/view/Teacher/Teacher_Home/TeacherMainScreenGrid.dart';
import 'package:vms_school/widgets/TextFormSearch.dart';

class TeacherMainScreen extends StatefulWidget {
  const TeacherMainScreen({super.key});

  @override
  State<TeacherMainScreen> createState() => _GuardianMainScreenState();
}

class _GuardianMainScreenState extends State<TeacherMainScreen> {
  TextEditingController search = TextEditingController();

  @override
  void initState() {
    Get_My_Students_API().Get_My_Students();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Expanded(
          child: Column(
        children: [
          //AppbarTeacher(),
          Container(
            width: double.infinity,
            margin:
                const EdgeInsets.symmetric(horizontal: 30.0, vertical: 10.0),
            child: Row(
              children: [
                Expanded(
                  child:
                      GetBuilder<My_Students_Controller>(builder: (controller) {
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
      )),
    );
  }
}
