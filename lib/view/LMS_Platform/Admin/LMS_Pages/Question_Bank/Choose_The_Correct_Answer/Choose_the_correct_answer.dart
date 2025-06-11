import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:vms_school/Link/Controller/AdminController/Employee_Controllers/Add_Data_controller.dart';
import 'package:vms_school/Link/Controller/LMS_Controllers/Admin_LMS/QuestionBank_Controllers/Choose_The_Correct_Answer_Controller.dart';
import 'package:vms_school/view/Both_Platform/widgets/Squer_Button_Enabled_Disabled.dart';
import 'package:vms_school/view/Both_Platform/widgets/TextFormSearch.dart';
import 'package:vms_school/view/LMS_Platform/Admin/LMS_Pages/Question_Bank/Choose_The_Correct_Answer/Add_Choose_Correct_Questions_Dialog.dart';
import 'package:vms_school/view/LMS_Platform/Admin/LMS_Pages/Question_Bank/Choose_The_Correct_Answer/Choose_the_correct_answer_gride.dart';

class Choose_the_correct_answer extends StatefulWidget {
  const Choose_the_correct_answer({super.key});

  @override
  State<Choose_the_correct_answer> createState() =>
      _Choose_the_correct_answerState();
}

class _Choose_the_correct_answerState extends State<Choose_the_correct_answer> {
  @override
  initState() {
    // Getalllinkslmsapi().Getalllinkslms();
    super.initState();
  }

  TextEditingController search = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return Column(
      children: [
        if (screenWidth > 769)
          GetBuilder<Choose_The_Correct_Answer>(builder: (controller) {
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
                        Get.dialog(Add_Choose_Correct_Questions_Dialog());
                      })
                ],
              ),
            );
          }),
        if (screenWidth <= 769)
          GetBuilder<Choose_The_Correct_Answer>(builder: (controller) {
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
                          Get.dialog(Add_Choose_Correct_Questions_Dialog());
                        })
                  ],
                ),
              ),
            );
          }),
        GetBuilder<Choose_The_Correct_Answer>(builder: (controller) {
          if (controller.isLoading == true) {
            return Expanded(
              child: Center(
                  child: LoadingAnimationWidget.inkDrop(
                color: Theme.of(context).primaryColor,
                size: 60,
              )),
            );
          }
          // if (controller.filtered_Links_LMS.isEmpty) {
          //   return Expanded(
          //     child: Center(
          //         child: Text("No Questions".tr,
          //             style: Theme.of(context).textTheme.titleLarge!.copyWith(
          //                 fontSize: 22, fontWeight: FontWeight.normal))),
          //   );
          // }
          return Choose_the_correct_answer_gride();
        }),
      ],
    );
  }
}
