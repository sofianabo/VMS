import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:vms_school/Link/API/LMS_APIs/QuestionAPI/DragDrop_Question_APi/Get_Dragdrop_API.dart';
import 'package:vms_school/Link/API/LMS_APIs/QuestionAPI/MatchingAPI/Get_Matching_Question_API.dart';
import 'package:vms_school/Link/API/LMS_APIs/QuestionAPI/MultiChoiseAPI/Get_Multi_Choice_API.dart';
import 'package:vms_school/Link/Controller/AdminController/Employee_Controllers/Add_Data_controller.dart';
import 'package:vms_school/Link/Controller/LMS_Controllers/Admin_LMS/QuestionBank_Controllers/Drag_Drop_Question_Controller.dart';
import 'package:vms_school/Link/Controller/LMS_Controllers/Admin_LMS/QuestionBank_Controllers/MatchingQuestionController.dart';
import 'package:vms_school/Link/Controller/LMS_Controllers/Admin_LMS/QuestionBank_Controllers/Multi_Choise_Question_Controller.dart';
import 'package:vms_school/view/Both_Platform/widgets/Squer_Button_Enabled_Disabled.dart';
import 'package:vms_school/view/Both_Platform/widgets/TextFormSearch.dart';
import 'package:vms_school/view/LMS_Platform/Admin/LMS_Pages/Question_Bank/DragDrop_Question.dart/Add_DragDrop_Question.dart';
import 'package:vms_school/view/LMS_Platform/Admin/LMS_Pages/Question_Bank/DragDrop_Question.dart/DragDrop_Question_Grid.dart';
import 'package:vms_school/view/LMS_Platform/Admin/LMS_Pages/Question_Bank/MatchingQuestion/AddMatchingQuestion.dart';
import 'package:vms_school/view/LMS_Platform/Admin/LMS_Pages/Question_Bank/MatchingQuestion/MatchingQuestionGrid.dart';
import 'package:vms_school/view/LMS_Platform/Admin/LMS_Pages/Question_Bank/MultiChoiseQuestion.dart/Add_Multi_Choise_Question.dart';
import 'package:vms_school/view/LMS_Platform/Admin/LMS_Pages/Question_Bank/MultiChoiseQuestion.dart/Multi_Choise_Question_Grid.dart';

class Dragdrop_Question extends StatefulWidget {
  const Dragdrop_Question({super.key});

  @override
  State<Dragdrop_Question> createState() => _Dragdrop_QuestionState();
}

class _Dragdrop_QuestionState extends State<Dragdrop_Question> {
  @override
  initState() {
    Get_Dragdrop_Api().Get_Dragdrop();
    super.initState();
  }

  TextEditingController search = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return Column(
      children: [
        if (screenWidth > 769)
          GetBuilder<DragDrop_Question_Controller>(builder: (controller) {
            return Container(
              width: screenWidth,
              margin: const EdgeInsets.only(left: 40.0, right: 40.0, top: 0.0),
              child: Row(
                spacing: 15.0,
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  TextFormSearch(
                    click: () {
                      controller.clearFilter();
                    },
                    onchange: (value) {
                      controller.searchByName(value);
                    },
                    width: screenWidth - 140,
                    radius: 5,
                    controller: search,
                    suffixIcon: search.text != "" ? Icons.clear : Icons.search,
                  ),
                  Squer_Button_Enabled_Disabled(
                      validate:
                          !(Get.find<Add_Data_controller>().roll != "observer"),
                      icon: Icons.add,
                      onTap: () {
                        controller.resetAllFields();

                        Get.dialog(Add_Dragdrop_Question(),
                            barrierDismissible: false);
                      })
                ],
              ),
            );
          }),
        if (screenWidth <= 769)
          GetBuilder<DragDrop_Question_Controller>(builder: (controller) {
            return Container(
              width: screenWidth,
              margin: const EdgeInsets.only(left: 30.0, right: 30.0, top: 10.0),
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  spacing: 15.0,
                  children: [
                    TextFormSearch(
                      click: () {
                        controller.clearFilter();
                      },
                      onchange: (value) {
                        controller.searchByName(
                          value,
                        );
                      },
                      width: 250,
                      radius: 5,
                      controller: search,
                      suffixIcon:
                          search.text != "" ? Icons.clear : Icons.search,
                    ),
                    Squer_Button_Enabled_Disabled(
                        validate: !(Get.find<Add_Data_controller>().roll !=
                            "observer"),
                        icon: Icons.add,
                        onTap: () {
                          controller.resetAllFields();
                          Get.dialog(Add_Dragdrop_Question(),
                              barrierDismissible: false);
                        })
                  ],
                ),
              ),
            );
          }),
        GetBuilder<DragDrop_Question_Controller>(builder: (controller) {
          if (controller.isLoading == true) {
            return Expanded(
              child: Center(
                  child: LoadingAnimationWidget.inkDrop(
                color: Theme.of(context).primaryColor,
                size: 60,
              )),
            );
          }
          if (controller.filterdQuestions!.isEmpty) {
            return Expanded(
              child: Center(
                  child: Text("No Questions".tr,
                      style: Theme.of(context).textTheme.titleLarge!.copyWith(
                          fontSize: 22, fontWeight: FontWeight.normal))),
            );
          }
          return Dragdrop_Question_Grid();
        }),
      ],
    );
  }
}
