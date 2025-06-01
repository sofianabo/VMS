import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vms_school/Link/API/LMS_APIs/Admin/Get_LMS_Students.dart';
import 'package:vms_school/Link/Controller/LMS_Controllers/Admin_LMS/Students_LMS_Controller.dart';
import 'package:vms_school/view/LMS_Platform/Admin/LMS_Pages/Files_LMS/Files_LMS_Grid.dart';
import 'package:vms_school/view/Both_Platform/widgets/TextFormSearch.dart';

class Files_LMS extends StatefulWidget {
  const Files_LMS({super.key});

  @override
  State<Files_LMS> createState() => _StudyYearStudentsState();
}

class _StudyYearStudentsState extends State<Files_LMS> {
  @override
  initState() {
    Get_LMS_Students_API().Get_LMS_Students();
    super.initState();
  }

  TextEditingController search = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return Expanded(
        child: Column(
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
          child: Files_LMS_Grid(),
        )),
      ],
    ));
  }
}
