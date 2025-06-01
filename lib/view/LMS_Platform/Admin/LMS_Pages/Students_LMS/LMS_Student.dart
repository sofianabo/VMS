import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vms_school/Icons_File/v_m_s__icons_icons.dart';
import 'package:vms_school/Link/API/LMS_APIs/Admin/Get_LMS_Students.dart';
import 'package:vms_school/Link/Controller/LMS_Controllers/Admin_LMS/Students_LMS_Controller.dart';
import 'package:vms_school/Link/Functions/Export_Exle_Function.dart';
import 'package:vms_school/Link/Model/AdminModel/Students_Models/AllStudyYearModel.dart';
import 'package:vms_school/Link/API/AdminAPI/Students/Students_APIs/DropDownPenaltyAPI.dart';
import 'package:vms_school/Link/API/AdminAPI/Students/Students_APIs/GetStudyYearStudentAPI.dart';
import 'package:vms_school/Link/Controller/AdminController/Employee_Controllers/Add_Data_controller.dart';
import 'package:vms_school/Link/Controller/AdminController/Students_Controllers/StudyYearStudentsController.dart';
import 'package:vms_school/Link/Controller/WidgetController/DropDown_Controllers/Sessions_DropDown_Controller.dart';
import 'package:vms_school/Link/Functions/Export_PDF_Function.dart';
import 'package:vms_school/Translate/local_controller.dart';
import 'package:vms_school/view/LMS_Platform/Admin/LMS_Pages/Students_LMS/LMS_StudentsGrid.dart';
import 'package:vms_school/view/SMS_Platform/Admin/Students_Manager/StudyYearStudentsGrid.dart';
import 'package:vms_school/view/Both_Platform/widgets/Admin/Admin_School/All_Screen_Sessions.dart';
import 'package:vms_school/view/Both_Platform/widgets/Admin/Admin_Students/DropDownStudyYearStudents.dart';
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
          child: LMS_StudentsGrid(),
        )),
      ],
    ));
  }
}
