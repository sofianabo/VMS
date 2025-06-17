import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:vms_school/Link/API/LMS_APIs/QuestionAPI/Fill_The_Blanks_API.dart/Get_Fill_The_Blanks_API.dart';
import 'package:vms_school/Link/Controller/LMS_Controllers/Admin_LMS/Quiz_Controller/Quiz_Fill_The_Blank_Controller.dart';
import 'package:vms_school/view/Both_Platform/widgets/TextFormSearch.dart';
import 'package:vms_school/view/Both_Platform/widgets/VMSAlertDialog.dart';
import 'package:vms_school/view/LMS_Platform/Admin/LMS_Pages/Quiz_Pages_LMS/Quiz_Question_LMS/Add_Quiz_Dialogs/Add_From_Bank/Fill_The_Blank/Quiz_Fill_The_Blank_Bank_gride.dart';

class Quiz_Fill_The_Blank_QBank extends StatefulWidget {
  const Quiz_Fill_The_Blank_QBank({super.key});

  @override
  State<Quiz_Fill_The_Blank_QBank> createState() => _Fill_The_BlankState();
}

class _Fill_The_BlankState extends State<Quiz_Fill_The_Blank_QBank> {
  @override
  initState() {
    Get_Fill_The_Blanks_API().Get_Fill_The_Blanks();
    super.initState();
  }

  TextEditingController search = TextEditingController();
  @override
  Widget build(BuildContext context) {
    double screenWidth = 600;
    return VMSAlertDialog(
      apptitle: "",
      subtitle: "none",
      action: [],
      contents: Container(
        width: screenWidth,
        child: Column(
          children: [
            GetBuilder<Quiz_Fill_The_Blank_Controller>(builder: (controller) {
              return Container(
                width: screenWidth,
                margin: const EdgeInsets.only(top: 10.0),
                child: TextFormSearch(
                  click: () {
                    controller.clearFilter();
                  },
                  onchange: (value) {
                    controller.searchByName(
                      value,
                    );
                  },
                  radius: 5,
                  controller: search,
                  suffixIcon: search.text != "" ? Icons.clear : Icons.search,
                ),
              );
            }),
            GetBuilder<Quiz_Fill_The_Blank_Controller>(builder: (controller) {
              if (controller.isLoading == true) {
                return Expanded(
                  child: Center(
                      child: LoadingAnimationWidget.inkDrop(
                    color: Theme.of(context).primaryColor,
                    size: 30,
                  )),
                );
              }
              if (controller.filterdQuestions!.isEmpty) {
                return Expanded(
                  child: Center(
                      child: Text("No Questions".tr,
                          style: Theme.of(context)
                              .textTheme
                              .titleLarge!
                              .copyWith(
                                  fontSize: 22,
                                  fontWeight: FontWeight.normal))),
                );
              }
              return Quiz_Fill_The_Blank_QBank_gride();
            }),
          ],
        ),
      ),
    );
  }
}
