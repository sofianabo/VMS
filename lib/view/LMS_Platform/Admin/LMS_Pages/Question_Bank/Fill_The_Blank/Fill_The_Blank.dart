import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:vms_school/Link/API/LMS_APIs/QuestionAPI/Fill_The_Blanks_API.dart/Get_Fill_The_Blanks_API.dart';
import 'package:vms_school/Link/Controller/AdminController/Employee_Controllers/Add_Data_controller.dart';
import 'package:vms_school/Link/Controller/LMS_Controllers/Admin_LMS/QuestionBank_Controllers/Fill_The_Blank_Controller.dart';
import 'package:vms_school/view/Both_Platform/widgets/Squer_Button_Enabled_Disabled.dart';
import 'package:vms_school/view/Both_Platform/widgets/TextFormSearch.dart';
import 'package:vms_school/view/LMS_Platform/Admin/LMS_Pages/Question_Bank/Fill_The_Blank/Add_Fill_The_Blank_Dialog.dart';
import 'package:vms_school/view/LMS_Platform/Admin/LMS_Pages/Question_Bank/Fill_The_Blank/Fill_The_Blank_gride.dart';

class Fill_The_Blank extends StatefulWidget {
  const Fill_The_Blank({super.key});

  @override
  State<Fill_The_Blank> createState() => _Fill_The_BlankState();
}

class _Fill_The_BlankState extends State<Fill_The_Blank> {
  @override
  initState() {
    Get_Fill_The_Blanks_API().Get_Fill_The_Blanks();
    super.initState();
  }

  TextEditingController search = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return Column(
      children: [
        if (screenWidth > 769)
          GetBuilder<Fill_The_Blank_Controller>(builder: (controller) {
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
                        Get.dialog(Add_Fill_The_Blank_Dialog());
                      })
                ],
              ),
            );
          }),
        if (screenWidth <= 769)
          GetBuilder<Fill_The_Blank_Controller>(builder: (controller) {
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
                          Get.dialog(Add_Fill_The_Blank_Dialog());
                        })
                  ],
                ),
              ),
            );
          }),
        GetBuilder<Fill_The_Blank_Controller>(builder: (controller) {
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
          return Fill_The_Blank_gride();
        }),
      ],
    );
  }
}
