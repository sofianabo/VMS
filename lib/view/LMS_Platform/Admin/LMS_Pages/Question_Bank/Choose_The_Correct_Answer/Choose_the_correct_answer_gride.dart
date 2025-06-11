import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vms_school/Link/Controller/AdminController/Employee_Controllers/Add_Data_controller.dart';
import 'package:vms_school/Link/Controller/LMS_Controllers/Admin_LMS/QuestionBank_Controllers/Choose_The_Correct_Answer_Controller.dart';
import 'package:vms_school/Translate/local_controller.dart';
import 'package:vms_school/view/Both_Platform/widgets/ButtonsDialog.dart';
import 'package:vms_school/view/Both_Platform/widgets/Squer_Button_Enabled_Disabled.dart';
import 'package:vms_school/view/Both_Platform/widgets/VMSAlertDialog.dart';

class Choose_the_correct_answer_gride extends StatefulWidget {
  const Choose_the_correct_answer_gride({super.key});

  @override
  State<Choose_the_correct_answer_gride> createState() =>
      _Choose_the_correct_answer_grideState();
}

class _Choose_the_correct_answer_grideState
    extends State<Choose_the_correct_answer_gride> {
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return Expanded(
      child: Padding(
        padding: const EdgeInsets.only(top: 15.0),
        child: SingleChildScrollView(
          child: Directionality(
            textDirection: Get.find<LocalizationController>()
                        .currentLocale
                        .value
                        .languageCode ==
                    'ar'
                ? TextDirection.rtl
                : TextDirection.ltr,
            child: GetBuilder<Choose_The_Correct_Answer>(builder: (controller) {
              return SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Container(
                  width: screenWidth >= 768 ? screenWidth - 40 : 800,
                  padding: EdgeInsets.only(left: 20, right: 20.0, bottom: 20.0),
                  margin: EdgeInsets.only(left: 20, right: 20.0),
                  child: ListView.builder(
                    shrinkWrap: true,
                    itemCount: 5,
                    itemBuilder: (context, index) {
                      return Column(
                        children: [
                          Container(
                            width: screenWidth,
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
                            padding: const EdgeInsets.all(20),
                            child: Column(
                              spacing: 20.0,
                              crossAxisAlignment:
                                  Get.find<LocalizationController>()
                                              .currentLocale
                                              .value
                                              .languageCode ==
                                          'ar'
                                      ? CrossAxisAlignment.start
                                      : CrossAxisAlignment.end,
                              mainAxisAlignment:
                                  Get.find<LocalizationController>()
                                              .currentLocale
                                              .value
                                              .languageCode ==
                                          'ar'
                                      ? MainAxisAlignment.start
                                      : MainAxisAlignment.end,
                              children: [
                                Row(
                                  spacing: 30.0,
                                  children: [
                                    Expanded(
                                      child: Text(
                                          maxLines: 10,
                                          style: Theme.of(context)
                                              .textTheme
                                              .titleMedium!
                                              .copyWith(fontSize: 16),
                                          "${index + 1})- " +
                                              "هل الاجابة المختارة هي الصحيحة : "),
                                    ),
                                    Row(
                                      spacing: 10.0,
                                      children: [
                                        Squer_Button_Enabled_Disabled(
                                            validate: !(Get.find<
                                                        Add_Data_controller>()
                                                    .roll !=
                                                "observer"),
                                            icon: Icons.edit_note_outlined,
                                            onTap: () {}),
                                        Squer_Button_Enabled_Disabled(
                                            isDelete: true,
                                            validate: !(Get.find<
                                                        Add_Data_controller>()
                                                    .roll !=
                                                "observer"),
                                            icon: Icons.delete_outline_outlined,
                                            onTap: () {
                                              Get.dialog(VMSAlertDialog(
                                                  action: [
                                                    ButtonDialog(
                                                        text: "Delete".tr,
                                                        onPressed: () async {},
                                                        color: const Color(
                                                            0xffB03D3D),
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
                                                    mainAxisSize:
                                                        MainAxisSize.min,
                                                    children: [
                                                      Container(
                                                        width: 400,
                                                      ),
                                                      Row(
                                                        children: [
                                                          Text(
                                                            "Do You Want To delete"
                                                                    .tr +
                                                                " ({controller.filtered_Links_LMS![index].name}) " +
                                                                "Question".tr,
                                                            style: Get
                                                                .theme
                                                                .textTheme
                                                                .bodyMedium!
                                                                .copyWith(
                                                                    fontSize:
                                                                        16,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .normal),
                                                          ),
                                                        ],
                                                      ),
                                                    ],
                                                  ),
                                                  apptitle:
                                                      "Delete Question".tr,
                                                  subtitle: "none"));
                                            }),
                                      ],
                                    )
                                  ],
                                ),
                                ListView.builder(
                                  shrinkWrap: true,
                                  itemCount: 3,
                                  itemBuilder: (context, index) {
                                    return Container(
                                        width: screenWidth,
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(5),
                                            border: Border.all(
                                                color: index == 0
                                                    ? Color(0xff147C3E)
                                                    : Theme.of(context)
                                                        .textTheme
                                                        .titleMedium!
                                                        .color!,
                                                width: 0.5),
                                            color: index == 0
                                                ? Color(0xff147C3E)
                                                : Theme.of(context).cardColor,
                                            boxShadow: const [
                                              BoxShadow(
                                                  color: Colors.black26,
                                                  offset: Offset(0, 2),
                                                  blurRadius: 1)
                                            ]),
                                        padding: const EdgeInsets.all(10),
                                        margin: const EdgeInsets.only(
                                            top: 5.0, bottom: 5.0),
                                        child: Text(
                                            style: TextStyle(
                                              color: index == 0
                                                  ? Colors.white
                                                  : Theme.of(context)
                                                      .textTheme
                                                      .titleMedium!
                                                      .color,
                                            ),
                                            "انا الاجابة الاكثر صحة"));
                                  },
                                )
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(bottom: 30, top: 30),
                            child: Divider(
                              height: 3,
                              color: Get.theme.textTheme.titleMedium!.color,
                            ),
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
      ),
    );
  }
}
