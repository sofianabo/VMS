import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:vms_school/Link/API/LMS_APIs/QuestionAPI/DragDrop_Question_APi/Get_Dragdrop_API.dart';
import 'package:vms_school/Link/API/LMS_APIs/QuestionAPI/Fill_The_Blanks_API.dart/Get_Fill_The_Blanks_API.dart';
import 'package:vms_school/Link/Controller/LMS_Controllers/Admin_LMS/Quiz_Controller/Quiz_DragDrop_Question_Controller.dart';
import 'package:vms_school/Link/Controller/LMS_Controllers/Admin_LMS/Quiz_Controller/Quiz_Fill_The_Blank_Controller.dart';
import 'package:vms_school/view/Both_Platform/widgets/TextFormSearch.dart';
import 'package:vms_school/view/Both_Platform/widgets/VMSAlertDialog.dart';
import 'package:vms_school/view/LMS_Platform/Admin/LMS_Pages/Quiz_Pages_LMS/Quiz_Question_LMS/Add_Quiz_Dialogs/Add_From_Bank/DragDrop/DragDrop_From_Bank_Grid.dart';
import 'package:vms_school/view/LMS_Platform/Admin/LMS_Pages/Quiz_Pages_LMS/Quiz_Question_LMS/Add_Quiz_Dialogs/Add_From_Bank/Fill_The_Blank/Quiz_Fill_The_Blank_Bank_gride.dart';

class Dragdrop_From_Bank_Managment extends StatefulWidget {
  const Dragdrop_From_Bank_Managment({super.key});

  @override
  State<Dragdrop_From_Bank_Managment> createState() => _Dragdrop_From_Bank_ManagmentState();
}

class _Dragdrop_From_Bank_ManagmentState extends State<Dragdrop_From_Bank_Managment> {
  @override
  initState() {
    Get_Dragdrop_Api().Get_Dragdrop();
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
            GetBuilder<Quiz_DragDrop_Question_Controller>(builder: (controller) {
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
            GetBuilder<Quiz_DragDrop_Question_Controller>(builder: (controller) {
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
              return Dragdrop_From_Bank_Grid();
            }),
          ],
        ),
      ),
    );
  }
}
