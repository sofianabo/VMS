import 'package:flutter/material.dart';
import 'package:flutter_dropzone/flutter_dropzone.dart';
import 'package:get/get.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:vms_school/Link/API/LMS_APIs/Admin/AddLinkLMSAPI.dart';
import 'package:vms_school/Link/API/LMS_APIs/Admin/Add_File_LMS_API.dart';
import 'package:vms_school/Link/API/LMS_APIs/Admin/GetAllLinksLMSAPI.dart';
import 'package:vms_school/Link/API/LMS_APIs/Admin/Get_All_Curr_LMS.dart';
import 'package:vms_school/Link/API/LMS_APIs/Admin/Get_LMS_Files.dart';
import 'package:vms_school/Link/API/LMS_APIs/QuestionAPI/ArticleAPI/AddArticleAPI.dart';
import 'package:vms_school/Link/Controller/AdminController/Employee_Controllers/Add_Data_controller.dart';
import 'package:vms_school/Link/Controller/LMS_Controllers/Admin_LMS/Files_Controller.dart';
import 'package:vms_school/Link/Controller/LMS_Controllers/Admin_LMS/LinksLMS_Controller.dart';
import 'package:vms_school/Link/Controller/LMS_Controllers/Admin_LMS/QuestionBank_Controllers/ArticleQuestionController.dart';
import 'package:vms_school/Link/Controller/LMS_Controllers/Admin_LMS/TrueOrFalseController.dart';
import 'package:vms_school/view/Both_Platform/widgets/ButtonsDialog.dart';
import 'package:vms_school/view/Both_Platform/widgets/Squer_Button_Enabled_Disabled.dart';
import 'package:vms_school/view/Both_Platform/widgets/TextFildWithUpper.dart';
import 'package:vms_school/view/Both_Platform/widgets/VMSAlertDialog.dart';
import 'package:vms_school/view/LMS_Platform/Admin/LMS_Pages/Files_LMS/Files_LMS_Grid.dart';
import 'package:vms_school/view/Both_Platform/widgets/TextFormSearch.dart';
import 'package:vms_school/view/LMS_Platform/Admin/LMS_Pages/LinksLMS/LinksLMSGrid.dart';
import 'package:vms_school/view/LMS_Platform/Admin/LMS_Pages/Question_Bank/ArticleQuestion/ArticleQustionGrid.dart';
import 'package:vms_school/view/LMS_Platform/Admin/LMS_Pages/Question_Bank/TrueOrFalse/TrueOrFalseQustionGrid.dart';
import 'package:vms_school/view/LMS_Platform/Widget/File_LMS_DropDown.dart';
import 'package:vms_school/view/LMS_Platform/Widget/LinksLMSDropdown.dart';

class Articlequestionmanagment extends StatefulWidget {
  const Articlequestionmanagment({super.key});

  @override
  State<Articlequestionmanagment> createState() =>
      _ArticlequestionmanagmentState();
}

class _ArticlequestionmanagmentState extends State<Articlequestionmanagment> {
  @override
  initState() {
    // Getalllinkslmsapi().Getalllinkslms();
    // Get_LMS_Curriculm_API().Get_LMS_Curriculm();
    super.initState();
  }

  TextEditingController search = TextEditingController();
  TextEditingController qeustion = TextEditingController();
  TextEditingController mark = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return Column(
      children: [
        if (screenWidth > 769)
          GetBuilder<Articlequestioncontroller>(builder: (controller) {
            return Container(
              width: screenWidth,
              margin: const EdgeInsets.only(left: 40.0, right: 40.0, top: 0.0),
              child: Row(
                spacing: 20.0,
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  TextFormSearch(
                    click: () {
                      controller.clearFilter();
                    },
                    onchange: (value) {
                      controller.searchByName(
                        value,
                        controller.currindex,
                      );
                    },
                    width: screenWidth - 200,
                    radius: 5,
                    controller: search,
                    suffixIcon: search.text != "" ? Icons.clear : Icons.search,
                  ),
                  Squer_Button_Enabled_Disabled(
                      validate:
                          !(Get.find<Add_Data_controller>().roll != "observer"),
                      icon: Icons.add,
                      onTap: () {
                        qeustion.clear();
                        mark.clear();
                        Get.find<Articlequestioncontroller>().reset();
                        Get.find<Articlequestioncontroller>().resetError();

                        controller.updateFieldError("question", false);
                        controller.updateFieldError("mark", false);

                        Get.dialog(AddArticleDialog(),
                            barrierDismissible: false);
                      })
                ],
              ),
            );
          }),
        if (screenWidth <= 769)
          GetBuilder<Articlequestioncontroller>(builder: (controller) {
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
                          controller.currindex,
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
                          qeustion.clear();
                          mark.clear();
                          Get.find<Articlequestioncontroller>().reset();
                          Get.find<Articlequestioncontroller>().resetError();

                          controller.updateFieldError("question", false);
                          controller.updateFieldError("mark", false);

                          Get.dialog(AddArticleDialog(),
                              barrierDismissible: false);
                        })
                  ],
                ),
              ),
            );
          }),
        GetBuilder<Articlequestioncontroller>(builder: (controller) {
          // if (controller.isLoading == true) {
          //   return Expanded(
          //     child: Center(
          //         child: LoadingAnimationWidget.inkDrop(
          //       color: Theme.of(context).primaryColor,
          //       size: 60,
          //     )),
          //   );
          // }
          // if (controller.filtered_Links_LMS.isEmpty) {
          //   return Expanded(
          //     child: Center(
          //         child: Text("No Questions".tr,
          //             style: Theme.of(context).textTheme.titleLarge!.copyWith(
          //                 fontSize: 22, fontWeight: FontWeight.normal))),
          //   );
          // }
          return Articlequstiongrid();
        }),
      ],
    );
  }

  AddArticleDialog() {
    return GetBuilder<Articlequestioncontroller>(builder: (controller) {
      return VMSAlertDialog(
          contents: SizedBox(
            width: 400,
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Column(
                    spacing: 10.0,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Textfildwithupper(
                          isRequired: true,
                          onChanged: (value) {
                            if (value.isNotEmpty) {
                              controller.updateFieldError("question", false);
                            }
                          },
                          width: 350,
                          isError: controller.IsQuestionError,
                          controller: qeustion,
                          Uptext: "Question".tr,
                          hinttext: "Question".tr),
                      Textfildwithupper(
                          isRequired: true,
                          onChanged: (value) {
                            if (value.isNotEmpty) {
                              controller.updateFieldError("mark", false);
                            }
                          },
                          width: 350,
                          fieldType: "number",
                          isError: controller.IsMarkError,
                          controller: mark,
                          Uptext: "Mark".tr,
                          hinttext: "Mark".tr),
                    ],
                  ),
                ],
              ),
            ),
          ),
          action: [
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                ButtonDialog(
                    width: 150,
                    text: "Add Question".tr,
                    onPressed: () async {
                      bool isQuestionEmpty = qeustion.text.isEmpty;
                      bool isMarkEmpty = mark.text.isEmpty;

                      controller.updateFieldError("question", isQuestionEmpty);
                      controller.updateFieldError("mark", isMarkEmpty);

                      if (!(isQuestionEmpty || isMarkEmpty)) {
                        await Addarticleapi(context).Addarticle(
                            mark: mark.text, question: qeustion.text);
                      }
                    },
                    color: Theme.of(context).primaryColor)
              ],
            )
          ],
          apptitle: "Add Question".tr,
          subtitle: "none");
    });
  }
}
