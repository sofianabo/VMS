import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vms_school/Link/API/LMS_APIs/Admin/Get_LMS_Students.dart';
import 'package:vms_school/Link/Controller/LMS_Controllers/Admin_LMS/Students_LMS_Controller.dart';
import 'package:vms_school/view/LMS_Platform/Admin/LMS_Pages/Students_LMS/LMS_StudentsGrid.dart';
import 'package:vms_school/view/Both_Platform/widgets/TextFormSearch.dart';

class LMS_Students extends StatefulWidget {
  const LMS_Students({super.key});

  @override
  State<LMS_Students> createState() => _StudyYearStudentsState();
}

class _StudyYearStudentsState extends State<LMS_Students> {
  @override
  initState() {
    Get_LMS_Students_API().Get_LMS_Students();
    super.initState();
  }

  TextEditingController search = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return Column(
      children: [
        GetBuilder<Students_LMS_Controller>(builder: (controller) {
          return TextFormSearch(
            click: () {
              controller.clearFilter();
            },
            onchange: (value) {
              controller.searchByName(
                value,
              );
            },
            width: screenWidth - 80,
            radius: 5,
            controller: search,
            suffixIcon: search.text != "" ? Icons.clear : Icons.search,
          );
        }),
        Expanded(
            child: Padding(
          padding: const EdgeInsets.only(top: 15.0),
          child: LMS_StudentsGrid(),
        )),
      ],
    );
  }
}
