import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:vms_school/Link/API/LMS_APIs/QuestionAPI/MultiChoiseAPI/Get_Multi_Choice_API.dart';
import 'package:vms_school/Link/Controller/AdminController/Employee_Controllers/Add_Data_controller.dart';
import 'package:vms_school/Link/Controller/LMS_Controllers/Admin_LMS/Quiz_Controller/Quiz_Multi_Choise_Controller.dart';
import 'package:vms_school/view/Both_Platform/widgets/TextFormSearch.dart';
import 'package:vms_school/view/Both_Platform/widgets/VMSAlertDialog.dart';
import 'package:vms_school/view/LMS_Platform/Admin/LMS_Pages/Quiz_Pages_LMS/Quiz_Question_LMS/Add_Quiz_Dialogs/Add_From_Bank/Muilti_Choice/Add_Multi_Choise_Question_Grid_Bank.dart';

class Add_Multi_Choise_Question_From_Bank extends StatefulWidget {
  const Add_Multi_Choise_Question_From_Bank({super.key});

  @override
  State<Add_Multi_Choise_Question_From_Bank> createState() =>
      _Add_Multi_Choise_Question_From_BankState();
}

class _Add_Multi_Choise_Question_From_BankState
    extends State<Add_Multi_Choise_Question_From_Bank> {
  @override
  initState() {
    Get_Multi_Choice_Api().Get_Multi_Choice();
    super.initState();
  }

  TextEditingController search = TextEditingController();
  @override
  Widget build(BuildContext context) {
    double screenWidth = 600;
    return VMSAlertDialog(
        action: [],
        contents: Container(
          width: screenWidth,
          child: Column(
            children: [
              GetBuilder<Quiz_Multi_Choise_Controller>(builder: (controller) {
                return Container(
                  width: screenWidth,
                  child: TextFormSearch(
                    click: () {
                      controller.clearFilter();
                    },
                    onchange: (value) {
                      controller.searchByName(value);
                    },
                    radius: 5,
                    controller: search,
                    suffixIcon: search.text != "" ? Icons.clear : Icons.search,
                  ),
                );
              }),
              GetBuilder<Quiz_Multi_Choise_Controller>(builder: (controller) {
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
                            style: Theme.of(context)
                                .textTheme
                                .titleLarge!
                                .copyWith(
                                    fontSize: 22,
                                    fontWeight: FontWeight.normal))),
                  );
                }
                return Add_Multi_Choise_Question_Grid_From_Bank();
              }),
            ],
          ),
        ),
        apptitle: "",
        subtitle: "none");
  }
}
