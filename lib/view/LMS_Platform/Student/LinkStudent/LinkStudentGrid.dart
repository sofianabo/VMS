import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vms_school/Link/API/LMS_APIs/Admin/DeleteLinkLmsAPI.dart';
import 'package:vms_school/Link/API/LMS_APIs/Admin/ShowAnHiddenLinkLmsAPI.dart';
import 'package:vms_school/Link/API/OpenURLs.dart';
import 'package:vms_school/Link/Controller/AdminController/Employee_Controllers/Add_Data_controller.dart';
import 'package:vms_school/Link/Controller/LMS_Controllers/Admin_LMS/LinksLMS_Controller.dart';
import 'package:vms_school/Translate/local_controller.dart';
import 'package:vms_school/view/Both_Platform/widgets/ButtonsDialog.dart';
import 'package:vms_school/view/Both_Platform/widgets/Squer_Button_Enabled_Disabled.dart';
import 'package:vms_school/view/Both_Platform/widgets/VMSAlertDialog.dart';

class Linkstudentgrid extends StatefulWidget {
  const Linkstudentgrid({super.key});

  @override
  State<Linkstudentgrid> createState() => _LinkstudentgridState();
}

class _LinkstudentgridState extends State<Linkstudentgrid> {
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
          child: GetBuilder<LinkslmsController>(builder: (controller) {
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
                  itemCount: controller.filtered_Links_LMS.length,
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
                                      "${controller.filtered_Links_LMS[index].name}")),
                              Padding(
                                padding: const EdgeInsets.only(
                                    left: 20.0, right: 20.0),
                                child: Text(Get.find<LocalizationController>()
                                            .currentLocale
                                            .value
                                            .languageCode ==
                                        'ar'
                                    ? "( ${controller.filtered_Links_LMS[index].curriculmUrl!.name} )"
                                    : "( ${controller.filtered_Links_LMS[index].curriculmUrl!.enName} )"),
                              ),
                           
                              Squer_Button_Enabled_Disabled(
                                  validate:
                                      !(Get.find<Add_Data_controller>().roll !=
                                          "observer"),
                                  icon: Icons.open_in_new_rounded,
                                  onTap: () {
                                    launchLink(
                                      url:
                                          "${controller.filtered_Links_LMS![index].url!}",
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
