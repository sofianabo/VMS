import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vms_school/Link/API/LMS_APIs/Admin/DeleteLinkLmsAPI.dart';
import 'package:vms_school/Link/API/LMS_APIs/Admin/ShowAnHiddenLinkLmsAPI.dart';
import 'package:vms_school/Link/API/OpenURLs.dart';
import 'package:vms_school/Link/Controller/AdminController/Employee_Controllers/Add_Data_controller.dart';
import 'package:vms_school/Link/Controller/LMS_Controllers/Admin_LMS/LinksLMS_Controller.dart';
import 'package:vms_school/Link/Controller/LMS_Controllers/Admin_LMS/TrueOrFalseController.dart';
import 'package:vms_school/Translate/local_controller.dart';
import 'package:vms_school/view/Both_Platform/widgets/ButtonsDialog.dart';
import 'package:vms_school/view/Both_Platform/widgets/Squer_Button_Enabled_Disabled.dart';
import 'package:vms_school/view/Both_Platform/widgets/VMSAlertDialog.dart';

class Trueorfalsequstiongrid extends StatefulWidget {
  const Trueorfalsequstiongrid({super.key});

  @override
  State<Trueorfalsequstiongrid> createState() => _TrueorfalsequstiongridState();
}

class _TrueorfalsequstiongridState extends State<Trueorfalsequstiongrid> {
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
          child: GetBuilder<Trueorfalsecontroller>(builder: (controller) {
            return SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Container(
                width: screenWidth >= 768 ? screenWidth - 70 : 800,
                padding: EdgeInsets.only(left: 20, right: 20.0, bottom: 20.0),
                margin: EdgeInsets.only(left: 30, right: 30.0, top: 10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(5)),
                  color: Colors.white,
                ),
                child: ListView.builder(
                  reverse: true,
                  shrinkWrap: true,
                  itemCount: 5, //controller.filtered_Links_LMS.length
                  itemBuilder: (context, index) {
                    return Column(
                      spacing: 10,
                      children: [
                        Padding(
                          padding:
                              const EdgeInsets.only(top: 15.0, bottom: 15.0),
                          child: Container(
                            padding: EdgeInsets.all(15),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                border: Border.all(
                                    color: Theme.of(context)
                                        .textTheme
                                        .titleMedium!
                                        .color!,
                                    width: 0.5),
                                color: Theme.of(context).cardColor,
                                boxShadow: const [
                                  BoxShadow(
                                      color: Colors.black26,
                                      offset: Offset(0, 2),
                                      blurRadius: 1)
                                ]),
                            child: Column(
                              spacing: 10,
                              children: [
                                Row(
                                  spacing: 15.0,
                                  children: [
                                    Expanded(child: Text("What is your name")),
                                    Squer_Button_Enabled_Disabled(
                                        validate:
                                            !(Get.find<Add_Data_controller>()
                                                    .roll !=
                                                "observer"),
                                        icon: Icons.edit_note_outlined,
                                        onTap: () {}),
                                    Squer_Button_Enabled_Disabled(
                                        validate:
                                            !(Get.find<Add_Data_controller>()
                                                    .roll !=
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
                                                            .filtered_Links_LMS![
                                                                index]
                                                            .id,
                                                      );
                                                    },
                                                    color:
                                                        const Color(0xffB03D3D),
                                                    width: 80),
                                                ButtonDialog(
                                                    text: "Cancel".tr,
                                                    onPressed: () {
                                                      Get.back();
                                                    },
                                                    color: Theme.of(context)
                                                        .primaryColor,
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
                                                        "Do You Want To deletelink"
                                                                .tr +
                                                            " (${controller.filtered_Links_LMS![index].name}) " +
                                                            "linkk".tr,
                                                        style: Get
                                                            .theme
                                                            .textTheme
                                                            .bodyMedium!
                                                            .copyWith(
                                                                fontSize: 16,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .normal),
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
                                Row(
                                  spacing: 20,
                                  children: [
                                    Radio<bool>(
                                        overlayColor: WidgetStatePropertyAll(
                                            Colors.transparent),
                                        activeColor: Get.theme.primaryColor,
                                        value: true,
                                        groupValue:
                                            true, // يمكنك استبدالها بمتغير لحفظ القيمة المحددة
                                        onChanged: (bool? value) {}),
                                    Text("صح"),
                                    Radio<bool>(
                                        overlayColor: WidgetStatePropertyAll(
                                            Colors.transparent),
                                        activeColor: Get.theme.primaryColor,
                                        value: false,
                                        groupValue:
                                            true, // يمكنك استبدالها بمتغير لحفظ القيمة المحددة
                                        onChanged: (bool? value) {}),
                                    Text("خطأ"),
                                  ],
                                )
                              ],
                            ),
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
              ),
            );
          }),
        ),
      ),
    );
  }
}
