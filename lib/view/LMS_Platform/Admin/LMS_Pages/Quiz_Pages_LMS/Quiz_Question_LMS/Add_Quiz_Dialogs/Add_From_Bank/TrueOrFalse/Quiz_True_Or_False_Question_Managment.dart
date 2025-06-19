import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:vms_school/Link/API/LMS_APIs/QuestionAPI/TrueOrFalseAPI.dart/GetAllTrueOrFalseAPI.dart';
import 'package:vms_school/Link/Controller/LMS_Controllers/Admin_LMS/Quiz_Controller/Quiz_True_Or_Flase_Controller.dart';
import 'package:vms_school/view/Both_Platform/widgets/TextFormSearch.dart';
import 'package:vms_school/view/Both_Platform/widgets/VMSAlertDialog.dart';
import 'package:vms_school/view/LMS_Platform/Admin/LMS_Pages/Quiz_Pages_LMS/Quiz_Question_LMS/Add_Quiz_Dialogs/Add_From_Bank/TrueOrFalse/Quiz_True_Or_False_Qustion_Grid.dart';

class Add_True_False_Quiz_From_Bank extends StatefulWidget {
  const Add_True_False_Quiz_From_Bank({super.key});

  @override
  State<Add_True_False_Quiz_From_Bank> createState() =>
      _Add_True_False_Quiz_From_BanktState();
}

class _Add_True_False_Quiz_From_BanktState
    extends State<Add_True_False_Quiz_From_Bank> {
  @override
  initState() {
    Getalltrueorfalseapi().Getalltrueorfalse();

    super.initState();
  }

  TextEditingController search = TextEditingController();
  TextEditingController qeustion = TextEditingController();

  @override
  Widget build(BuildContext context) {
    double screenWidth = 600;
    return VMSAlertDialog(
      subtitle: "none",
      apptitle: "",
      action: [],
      contents: Container(
        width: screenWidth,
        child: Column(
          children: [
            GetBuilder<Quiz_True_Or_False_Controller>(builder: (controller) {
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
            GetBuilder<Quiz_True_Or_False_Controller>(builder: (controller) {
              if (controller.isLoading == true) {
                return Expanded(
                  child: Center(
                      child: LoadingAnimationWidget.inkDrop(
                    color: Theme.of(context).primaryColor,
                    size: 30,
                  )),
                );
              }
              if (controller.filtered_questions.isEmpty) {
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
              return Quiz_True_Or_False_Manage_Gride();
            }),
          ],
        ),
      ),
    );
  }
}
