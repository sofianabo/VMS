import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:vms_school/Link/API/LMS_APIs/QuestionAPI/MultiChoiseAPI/Get_Multi_Choice_API.dart';
import 'package:vms_school/Link/Controller/AdminController/Employee_Controllers/Add_Data_controller.dart';
import 'package:vms_school/Link/Controller/LMS_Controllers/Admin_LMS/QuestionBank_Controllers/Multi_Choice_Picture_Controller.dart';
import 'package:vms_school/view/Both_Platform/widgets/Squer_Button_Enabled_Disabled.dart';
import 'package:vms_school/view/Both_Platform/widgets/TextFormSearch.dart';
import 'package:vms_school/view/LMS_Platform/Admin/LMS_Pages/Question_Bank/MultiChoiceWithPicture.dart/Add_Multi_Choice_Picture.dart';
import 'package:vms_school/view/LMS_Platform/Admin/LMS_Pages/Question_Bank/MultiChoiceWithPicture.dart/Multi_Choice_Picture_Grid.dart';
import 'package:vms_school/view/LMS_Platform/Admin/LMS_Pages/Question_Bank/MultiChoiseQuestion.dart/Add_Multi_Choise_Question.dart';
import 'package:vms_school/view/LMS_Platform/Admin/LMS_Pages/Question_Bank/MultiChoiseQuestion.dart/Multi_Choise_Question_Grid.dart';

class Multi_Choice_Picture extends StatefulWidget {
  const Multi_Choice_Picture({super.key});

  @override
  State<Multi_Choice_Picture> createState() => _Multi_Choice_PictureState();
}

class _Multi_Choice_PictureState extends State<Multi_Choice_Picture> {
  @override
  initState() {
    Get_Multi_Choice_Api().Get_Multi_Choice();
    super.initState();
  }

  TextEditingController search = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return Column(
      children: [
        if (screenWidth > 769)
          GetBuilder<Multi_Choice_Picture_Controller>(builder: (controller) {
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
                        controller.initialAddCurr();
                        Get.dialog(Add_Multi_Choice_Picture());
                      })
                ],
              ),
            );
          }),
        if (screenWidth <= 769)
          GetBuilder<Multi_Choice_Picture_Controller>(builder: (controller) {
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
                          controller.initialAddCurr();

                          Get.dialog(Add_Multi_Choice_Picture());
                        })
                  ],
                ),
              ),
            );
          }),
        GetBuilder<Multi_Choice_Picture_Controller>(builder: (controller) {
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
          return Multi_Choice_Picture_Grid();
        }),
      ],
    );
  }
}
