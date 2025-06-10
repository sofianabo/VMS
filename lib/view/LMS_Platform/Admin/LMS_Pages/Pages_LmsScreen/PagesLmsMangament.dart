import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:vms_school/Link/API/LMS_APIs/Admin/AddPagesLmsAPI.dart';
import 'package:vms_school/Link/API/LMS_APIs/Admin/Get_All_Curr_LMS.dart';
import 'package:vms_school/Link/API/LMS_APIs/Admin/PagesLmsAPI.dart';
import 'package:vms_school/Link/Controller/AdminController/Employee_Controllers/Add_Data_controller.dart';
import 'package:vms_school/Link/Controller/LMS_Controllers/Admin_LMS/PagesLmsController.dart';
import 'package:vms_school/view/Both_Platform/widgets/ButtonsDialog.dart';
import 'package:vms_school/view/Both_Platform/widgets/Squer_Button_Enabled_Disabled.dart';
import 'package:vms_school/view/Both_Platform/widgets/TextFildWithUpper.dart';
import 'package:vms_school/view/Both_Platform/widgets/VMSAlertDialog.dart';
import 'package:vms_school/view/Both_Platform/widgets/TextFormSearch.dart';
import 'package:vms_school/view/LMS_Platform/Admin/LMS_Pages/Pages_LmsScreen/PagesLmsGrid.dart';
import 'package:vms_school/view/LMS_Platform/Widget/PagesLmsdropdown.dart';

class Pageslmsmangament extends StatefulWidget {
  const Pageslmsmangament({super.key});

  @override
  State<Pageslmsmangament> createState() => _PageslmsmangamentState();
}

class _PageslmsmangamentState extends State<Pageslmsmangament> {
  @override
  initState() {
    Pageslmsapi().Pageslms();
    Get_LMS_Curriculm_API().Get_LMS_Curriculm();
    super.initState();
  }

  TextEditingController search = TextEditingController();
  TextEditingController name = TextEditingController();
  TextEditingController page = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return Column(
      children: [
        if (screenWidth > 769)
          GetBuilder<Pageslmscontroller>(builder: (controller) {
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
                      controller.searchByName(
                        value,
                        controller.currindex,
                      );
                    },
                    width: screenWidth - 400,
                    radius: 5,
                    controller: search,
                    suffixIcon: search.text != "" ? Icons.clear : Icons.search,
                  ),
                  Pageslmsdropdown(
                    Isloading: controller.isCuriculmLoading,
                    title: "Curriculum".tr,
                    width: 250,
                    type: "curriculum",
                  ),
                  Squer_Button_Enabled_Disabled(
                      validate:
                          !(Get.find<Add_Data_controller>().roll != "observer"),
                      icon: Icons.add,
                      onTap: () {
                        name.clear();
                        page.clear();
                        Get.find<Pageslmscontroller>().reset();
                        Get.find<Pageslmscontroller>().resetError();

                        controller.updateFieldError("arname", false);
                        controller.updateFieldError("page", false);

                        controller.updateFieldError("curr", false);

                        Get.dialog(AddPageDialog(), barrierDismissible: false);
                      })
                ],
              ),
            );
          }),
        if (screenWidth <= 769)
          GetBuilder<Pageslmscontroller>(builder: (controller) {
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
                    Pageslmsdropdown(
                      Isloading: controller.isCuriculmLoading,
                      title: "Curriculum".tr,
                      width: 250,
                      type: "curriculum",
                    ),
                    Squer_Button_Enabled_Disabled(
                        validate: !(Get.find<Add_Data_controller>().roll !=
                            "observer"),
                        icon: Icons.add,
                        onTap: () {
                          name.clear();
                          page.clear();
                          Get.find<Pageslmscontroller>().reset();
                          Get.find<Pageslmscontroller>().resetError();

                          controller.updateFieldError("arname", false);
                          controller.updateFieldError("page", false);
                          controller.updateFieldError("curr", false);

                          Get.dialog(AddPageDialog(),
                              barrierDismissible: false);
                        })
                  ],
                ),
              ),
            );
          }),
        GetBuilder<Pageslmscontroller>(builder: (controller) {
          if (controller.isLoading == true) {
            return Expanded(
              child: Center(
                  child: LoadingAnimationWidget.inkDrop(
                color: Theme.of(context).primaryColor,
                size: 60,
              )),
            );
          }
          if (controller.filtered_Page_lms.isEmpty) {
            return Expanded(
              child: Center(
                  child: Text("No Pages".tr,
                      style: Theme.of(context).textTheme.titleLarge!.copyWith(
                          fontSize: 22, fontWeight: FontWeight.normal))),
            );
          }
          return Pageslmsgrid();
        }),
      ],
    );
  }

  AddPageDialog() {
    return GetBuilder<Pageslmscontroller>(builder: (controller) {
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
                              controller.updateFieldError("aname", false);
                            }
                          },
                          width: 350,
                          isError: controller.IsAnameError,
                          controller: name,
                          Uptext: "Name".tr,
                          hinttext: "Name".tr),
                      Textfildwithupper(
                          isRequired: true,
                          onChanged: (value) {
                            if (value.isNotEmpty) {
                              controller.updateFieldError("page", false);
                            }
                          },
                          width: 350,
                          isError: controller.isPageError,
                          controller: page,
                          Uptext: "Page".tr,
                          hinttext: "Page".tr),
                      Pageslmsdropdown(
                        Isloading: controller.isCuriculmDialogLoading,
                        title: "Curriculum".tr,
                        width: 350,
                        type: "currDialog",
                        isError: controller.iscurrError,
                      ),
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Checkbox(
                            checkColor: Colors.white,
                            value: controller.Hidden,
                            onChanged: (value) {
                              if (Get.find<Add_Data_controller>().roll !=
                                  "subAdmin") {
                                controller.updateHid(value!);
                              }
                            },
                          ),
                          Text("Is Hidden Page".tr),
                        ],
                      ),
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
                    text: "Add".tr,
                    onPressed: () async {
                      bool isArNameEmpty = name.text.isEmpty;
                      bool isPageEmpty = page.text.isEmpty;
                      bool iscurrEmpty =
                          controller.selectdialog_CurrIndex.isEmpty ||
                              controller.selectdialog_CurrIndex == '';

                      controller.updateFieldError("curr", iscurrEmpty);
                      controller.updateFieldError("aname", isArNameEmpty);
                      controller.updateFieldError("page", isPageEmpty);

                      if (!(isArNameEmpty || iscurrEmpty || isPageEmpty)) {
                        await Addpageslmsapi(context).Addpageslms(
                          hidden: controller.Hidden,
                          link: page.text,
                          name: name.text,
                          curriculumId: controller.dialogCurrList
                              .indexOf(controller.selectdialog_CurrIndex),
                        );
                      }
                    },
                    color: Theme.of(context).primaryColor)
              ],
            )
          ],
          apptitle: "Add Page".tr,
          subtitle: "none");
    });
  }
}
