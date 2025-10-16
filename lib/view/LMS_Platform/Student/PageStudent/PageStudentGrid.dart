import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vms_school/Link/API/API.dart';
import 'package:vms_school/Link/API/LMS_APIs/Admin/DeletePageLmsAPI.dart';
import 'package:vms_school/Link/API/LMS_APIs/Admin/ShowAndHiddenPageLmsAPI.dart';
import 'package:vms_school/Link/API/OpenURLs.dart';
import 'package:vms_school/Link/Controller/AdminController/Employee_Controllers/Add_Data_controller.dart';
import 'package:vms_school/Link/Controller/LMS_Controllers/Admin_LMS/PagesLmsController.dart';
import 'package:vms_school/Translate/local_controller.dart';
import 'package:vms_school/view/Both_Platform/widgets/ButtonsDialog.dart';
import 'package:vms_school/view/Both_Platform/widgets/Squer_Button_Enabled_Disabled.dart';
import 'package:vms_school/view/Both_Platform/widgets/VMSAlertDialog.dart';

class Pagestudentgrid extends StatefulWidget {
  const Pagestudentgrid({super.key});

  @override
  State<Pagestudentgrid> createState() => _PagestudentgridState();
}

class _PagestudentgridState extends State<Pagestudentgrid> {
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return Expanded(
      child: SingleChildScrollView(
        child: Directionality(
          textDirection: Get.find<LocalizationController>()
                      .currentLocale
                      .value
                      .languageCode ==
                  'ar'
              ? TextDirection.rtl
              : TextDirection.ltr,
          child: GetBuilder<Pageslmscontroller>(builder: (controller) {
            return SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Container(
                width: screenWidth >= 768 ? screenWidth - 70 : 800,
                padding: EdgeInsets.only(left: 20, right: 20.0, bottom: 20.0),
                margin: EdgeInsets.only(left: 30, right: 30.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(5)),
                  color: Get.theme.cardColor,
                ),
                child: ListView.builder(
                  reverse: true,
                  shrinkWrap: true,
                  itemCount: controller.filtered_Page_lms.length,
                  itemBuilder: (context, index) {
                    return Column(
                      children: [
                        Padding(
                          padding:
                              const EdgeInsets.only(top: 15.0, bottom: 15.0),
                          child: Row(
                            spacing: 15.0,
                            children: [
                              Expanded(
                                  child: Text(
                                      "${controller.filtered_Page_lms[index].name}")),
                              Padding(
                                padding: const EdgeInsets.only(
                                    left: 20.0, right: 20.0),
                                child: Text(Get.find<LocalizationController>()
                                            .currentLocale
                                            .value
                                            .languageCode ==
                                        'ar'
                                    ? "( ${controller.filtered_Page_lms[index].curriculmPage!.name} )"
                                    : "( ${controller.filtered_Page_lms[index].curriculmPage!.enName} )"),
                              ),
                             
                              Squer_Button_Enabled_Disabled(
                                  validate:
                                      !(Get.find<Add_Data_controller>().roll !=
                                          "observer"),
                                  icon: Icons.open_in_new_rounded,
                                  onTap: () {
                                    launchLink(
                                      url:
                                          "$hostPort$showPage/${controller.filtered_Page_lms[index].id}",
                                      type: LinkType.website,
                                      context: context,
                                    );
                                    
                                  }),
                          
                            ],
                          ),
                        ),
                        Divider(
                          height: 2,
                          color: Get.theme.textTheme.titleMedium!.color,
                        )
                      ],
                    );
                  },
                ),
              ),
            );
          }),
        ),
      ),
    );
  }
}
