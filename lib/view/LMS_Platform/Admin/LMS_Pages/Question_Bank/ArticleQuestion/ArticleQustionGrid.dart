import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vms_school/Link/API/LMS_APIs/Admin/DeleteLinkLmsAPI.dart';
import 'package:vms_school/Link/API/LMS_APIs/Admin/ShowAnHiddenLinkLmsAPI.dart';
import 'package:vms_school/Link/API/LMS_APIs/QuestionAPI/ArticleAPI/DeleteArticleAPI.dart';
import 'package:vms_school/Link/API/OpenURLs.dart';
import 'package:vms_school/Link/Controller/AdminController/Employee_Controllers/Add_Data_controller.dart';
import 'package:vms_school/Link/Controller/LMS_Controllers/Admin_LMS/LinksLMS_Controller.dart';
import 'package:vms_school/Link/Controller/LMS_Controllers/Admin_LMS/QuestionBank_Controllers/ArticleQuestionController.dart';
import 'package:vms_school/Link/Controller/LMS_Controllers/Admin_LMS/TrueOrFalseController.dart';
import 'package:vms_school/Translate/local_controller.dart';
import 'package:vms_school/view/Both_Platform/widgets/ButtonsDialog.dart';
import 'package:vms_school/view/Both_Platform/widgets/Squer_Button_Enabled_Disabled.dart';
import 'package:vms_school/view/Both_Platform/widgets/TextFildWithUpper.dart';
import 'package:vms_school/view/Both_Platform/widgets/VMSAlertDialog.dart';

class Articlequstiongrid extends StatefulWidget {
  const Articlequstiongrid({super.key});

  @override
  State<Articlequstiongrid> createState() => _ArticlequstiongridState();
}

class _ArticlequstiongridState extends State<Articlequstiongrid> {
  TextEditingController ques = TextEditingController();
  TextEditingController mark = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    int getCrossAxisCount() {
      if (screenWidth >= 950) return 3;
      if (screenWidth >= 769) return 2;
      return 1;
    }

    double getChildAspectRatio() {
      if (screenWidth >= 1070) return 2.2;
      if (screenWidth >= 950) return 1.1;
      if (screenWidth >= 838) return 1.6;
      if (screenWidth >= 769) return 1.5;
      if (screenWidth >= 613) return 2.2;
      if (screenWidth >= 486) return 1.7;
      return 1.2;
    }

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
          child: GetBuilder<Articlequestioncontroller>(builder: (controller) {
            return SingleChildScrollView(
              child: Container(
                width: screenWidth >= 768 ? screenWidth - 70 : 800,
                padding: EdgeInsets.only(left: 20, right: 20.0, bottom: 20.0),
                margin: EdgeInsets.only(left: 30, right: 30.0, top: 10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(5)),
                  color: Colors.white,
                ),
                child: GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: getCrossAxisCount(),
                      crossAxisSpacing: 20.0,
                      mainAxisSpacing: 20.0,
                      childAspectRatio: getChildAspectRatio()),
                  shrinkWrap: true,
                  itemCount: controller.filtered_articleQuestion.length,
                  itemBuilder: (context, index) {
                    return Container(
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
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        spacing: 15.0,
                        children: [
                          Expanded(
                              child: Center(
                            child: SingleChildScrollView(
                              child: Text(
                                "${controller.filtered_articleQuestion[index].description}",
                                textAlign: TextAlign.center,
                              ),
                            ),
                          )),
                          Squer_Button_Enabled_Disabled(
                              validate:
                                  !(Get.find<Add_Data_controller>().roll !=
                                      "observer"),
                              icon: Icons.delete_outline_outlined,
                              isDelete: true,
                              onTap: () {
                                Get.dialog(VMSAlertDialog(
                                    action: [
                                      ButtonDialog(
                                          text: "Delete".tr,
                                          onPressed: () async {
                                            Deletearticleapi(context)
                                                .Deletearticle(
                                              question: controller
                                                      .filtered_articleQuestion![
                                                  index],
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
                                              "Do You Want To deletequestion"
                                                      .tr +
                                                  "qustionn".tr,
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
                                    apptitle: "Delete Question".tr,
                                    subtitle: "none"));
                              }),
                        ],
                      ),
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
