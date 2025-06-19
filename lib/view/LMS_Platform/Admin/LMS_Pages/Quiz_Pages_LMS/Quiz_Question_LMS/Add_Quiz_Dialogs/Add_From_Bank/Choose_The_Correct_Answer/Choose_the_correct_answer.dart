import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:vms_school/Link/API/LMS_APIs/QuestionAPI/Choose_The_Correct_API.dart/Get_Choose_The_Correct_API.dart';
import 'package:vms_school/Link/Controller/LMS_Controllers/Admin_LMS/Quiz_Controller/Quiz_SingleChoice_Controller.dart';
import 'package:vms_school/view/Both_Platform/widgets/TextFormSearch.dart';
import 'package:vms_school/view/Both_Platform/widgets/VMSAlertDialog.dart';
import 'package:vms_school/view/LMS_Platform/Admin/LMS_Pages/Quiz_Pages_LMS/Quiz_Question_LMS/Add_Quiz_Dialogs/Add_From_Bank/Choose_The_Correct_Answer/Choose_the_correct_answer_gride.dart';

class Add_Single_Choose_Quiz_From_Bank_Dialog extends StatefulWidget {
  const Add_Single_Choose_Quiz_From_Bank_Dialog({super.key});

  @override
  State<Add_Single_Choose_Quiz_From_Bank_Dialog> createState() =>
      _Add_Single_Choose_Quiz_From_Bank_DialogState();
}

class _Add_Single_Choose_Quiz_From_Bank_DialogState
    extends State<Add_Single_Choose_Quiz_From_Bank_Dialog> {
  @override
  initState() {
    Get_Choose_The_Correct_API().Get_Choose_The_Correct();
    super.initState();
  }

  TextEditingController search = TextEditingController();
  @override
  Widget build(BuildContext context) {
    double screenWidth = 600;
    return VMSAlertDialog(
      action: [],
      apptitle: "",
      subtitle: "none",
      contents: Container(
        width: screenWidth,
        child: Column(
          children: [
            GetBuilder<Quiz_Single_Choice_Controller>(builder: (controller) {
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
            GetBuilder<Quiz_Single_Choice_Controller>(builder: (controller) {
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
              return Add_Single_Choose_Quiz_From_Bank_Gride();
            }),
          ],
        ),
      ),
    );
  }
}
