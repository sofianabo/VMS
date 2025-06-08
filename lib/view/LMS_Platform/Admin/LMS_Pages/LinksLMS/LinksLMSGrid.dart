import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vms_school/Link/API/LMS_APIs/Admin/DeleteLinkLmsAPI.dart';
import 'package:vms_school/Link/API/OpenURLs.dart';
import 'package:vms_school/Link/Controller/AdminController/Employee_Controllers/Add_Data_controller.dart';
import 'package:vms_school/Link/Controller/LMS_Controllers/Admin_LMS/LinksLMS_Controller.dart';
import 'package:vms_school/Translate/local_controller.dart';
import 'package:vms_school/view/Both_Platform/widgets/ButtonsDialog.dart';
import 'package:vms_school/view/Both_Platform/widgets/Squer_Button_Enabled_Disabled.dart';
import 'package:vms_school/view/Both_Platform/widgets/VMSAlertDialog.dart';

class Linkslmsgrid extends StatefulWidget {
  const Linkslmsgrid({super.key});

  @override
  State<Linkslmsgrid> createState() => _LinkslmsgriddState();
}

class _LinkslmsgriddState extends State<Linkslmsgrid> {
  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection:
          Get.find<LocalizationController>().currentLocale.value.languageCode ==
                  'ar'
              ? TextDirection.rtl
              : TextDirection.ltr,
      child: GetBuilder<LinkslmsController>(builder: (controller) {
        return Container(
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
                    padding: const EdgeInsets.only(top: 15.0, bottom: 15.0),
                    child: Row(
                      spacing: 15.0,
                      children: [
                        Expanded(
                            child: Text(
                                "${controller.filtered_Links_LMS[index].name}")),
                        Padding(
                          padding:
                              const EdgeInsets.only(left: 20.0, right: 20.0),
                          child: Text(Get.find<LocalizationController>()
                                      .currentLocale
                                      .value
                                      .languageCode ==
                                  'ar'
                              ? "( ${controller.filtered_Links_LMS[index].curriculmUrl!.name} )"
                              : "( ${controller.filtered_Links_LMS[index].curriculmUrl!.enName} )"),
                        ),
                        TextButton(
                            onPressed: () {},
                            child: Text(
                                controller.filtered_Links_LMS[index].hidden == 1
                                    ? "Show File".tr
                                    : "Hide File".tr,
                                style: Get.theme.textTheme.bodyMedium!.copyWith(
                                    color: Color.fromARGB(255, 44, 128, 184)))),
                        Squer_Button_Enabled_Disabled(
                            validate: !(Get.find<Add_Data_controller>().roll !=
                                "observer"),
                            icon: Icons.open_in_new_rounded,
                            onTap: () {
                              launchLink(
                                url:
                                    "${controller.filtered_Links_LMS![index].url!}",
                                type: LinkType.website,
                                context: context,
                              );
                              ;
                            }),
                        Squer_Button_Enabled_Disabled(
                            validate: !(Get.find<Add_Data_controller>().roll !=
                                "observer"),
                            icon: Icons.delete_outline_outlined,
                            onTap: () {
                              Get.dialog(VMSAlertDialog(
                                  action: [
                                    ButtonDialog(
                                        text: "Delete".tr,
                                        onPressed: () async {
                                          Deletelinklmsapi(context)
                                              .Deletelinklms(
                                            id: controller
                                                .filtered_Links_LMS![index].id,
                                          );
                                        },
                                        color: const Color(0xffB03D3D),
                                        width: 80),
                                    ButtonDialog(
                                        text: "Cancel".tr,
                                        onPressed: () {
                                          Get.back();
                                        },
                                        color: Theme.of(context).primaryColor,
                                        width: 80)
                                  ],
                                  contents: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Container(
                                        width: 400,
                                      ),
                                      Row(
                                        children: [
                                          Text(
                                            "Do You Want To deletelink".tr +
                                                " (${controller.filtered_Links_LMS![index].name}) " +
                                                "linkk".tr,
                                            style: Get
                                                .theme.textTheme.bodyMedium!
                                                .copyWith(
                                                    fontSize: 16,
                                                    fontWeight:
                                                        FontWeight.normal),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                  apptitle: "Delete Link".tr,
                                  subtitle: "none"));
                            }),
                      ],
                    ),
                  ),
                  Divider(
                    height: 2,
                    color: Color.fromARGB(255, 44, 128, 184),
                  )
                ],
              );
            },
          ),
        );
      }),
    );
  }
}
