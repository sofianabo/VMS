import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:get/get.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:vms_school/Link/API/AuthAPI/LogoutAPI.dart';
import 'package:vms_school/Link/API/Teacher_API/GetMyQuizAPI.dart';
import 'package:vms_school/Link/Controller/AdminController/Employee_Controllers/Add_Data_controller.dart';
import 'package:vms_school/Link/Controller/LMS_Controllers/Admin_LMS/NumberOfContentController.dart';
import 'package:vms_school/Link/Controller/LMS_Controllers/Admin_LMS/Selected_Screen.dart';
import 'package:vms_school/Link/Controller/Teacher_Controller/QuizTableTeacherController.dart';
import 'package:vms_school/view/Both_Platform/widgets/ButtonsDialog.dart';
import 'package:vms_school/view/Both_Platform/widgets/GridAnimation.dart';
import 'package:vms_school/view/Both_Platform/widgets/VMSAlertDialog.dart';
import 'package:vms_school/view/LMS_Platform/Class/Exam_Scheald.dart';
import 'package:vms_school/view/LMS_Platform/Widget/Teacher_Class_Login_Dialog.dart';
import 'package:vms_school/view/SMS_Platform/Admin/School_Management/Teachers_notebook_grade_record_Pages/Teachers_notebook_grade_record.dart';

class SelectedClassLMs extends StatelessWidget {
  const SelectedClassLMs({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    int getCrossAxisCount() {
      if (screenWidth >= 1432) return 5;
      if (screenWidth >= 1154) return 4;
      if (screenWidth >= 950) return 3;
      if (screenWidth >= 769) return 2;
      return 1;
    }

    double getChildAspectRatio() {
      if (screenWidth >= 1070) return 1.1;
      if (screenWidth >= 950) return 1.1;
      if (screenWidth >= 838) return 1.6;
      if (screenWidth >= 769) return 1.5;
      if (screenWidth >= 613) return 2.2;
      if (screenWidth >= 486) return 1.7;
      return 1.2;
    }

    return GetBuilder<Selected_Class_Controller>(builder: (control) {
      return control.isLoading == true
          ? LoadingAnimationWidget.staggeredDotsWave(
              color: Get.theme.primaryColor,
              size: 60,
            )
          : GridView.builder(
              padding: const EdgeInsets.only(top: 10, left: 50, right: 50),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: getCrossAxisCount(),
                  crossAxisSpacing: 20.0,
                  mainAxisSpacing: 20.0,
                  childAspectRatio: getChildAspectRatio()),
              itemCount: control.dataList.length,
              itemBuilder: (context, index) {
                if (Get.find<Add_Data_controller>().roll == "class")
                  return HoverScaleCard(
                    child: GestureDetector(
                      onTap: () async {
                        if (index <= 4) {
                          if (control.teacherid == null &&
                              Get.find<Add_Data_controller>().roll == "class") {
                            Get.dialog(Teacher_Class_Login_Dialog());
                          } else {
                            control.addToPath(
                                "${control.dataList[index]['name']}".tr);
                          }
                        }

                        if (index == control.dataList.length - 2) {
                          Get.dialog(VMSAlertDialog(
                              action: [],
                              contents: Exam_Scheald(),
                              apptitle: "Exam Table".tr,
                              subtitle: "none"));
                        }

                        if (index == control.dataList.length - 1) {
                          Get.dialog(VMSAlertDialog(
                              action: [
                                TextButton(
                                  onPressed: () {
                                    Navigator.pop(
                                        context); // إغلاق الديالوغ بدون خروج
                                  },
                                  child: Text(
                                    "إلغاء",
                                    style: TextStyle(
                                        color: Get.theme.primaryColor),
                                  ),
                                ),
                                ButtonDialog(
                                    text: "نعم، تسجيل الخروج",
                                    onPressed: () async {
                                      await Logoutapi(context)
                                          .Logout(Type: "now");
                                    },
                                    color: Get.theme.primaryColor,
                                    width: 250),
                              ],
                              contents: Container(
                                width: 300,
                                child: const Text(
                                  "بمجرد الضغط على زر (نعم تسجيل الخروج) سيتم تسجيل خروج حساب هذا الصف وحسابك إذا كنت قد سجلت فيه من هذا الجهاز، وستفقد الوصول إليه إلا عند إعادة تسجيل الدخول مرة أخرى.",
                                  textAlign: TextAlign.right,
                                ),
                              ),
                              apptitle: "تأكيد تسجيل الخروج",
                              subtitle: "none"));
                        }
                      },
                      child: Container(
                        padding: const EdgeInsets.all(20),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(5)),
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
                          spacing: 16.0,
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Icon(
                              control.dataList[index]['icon'],
                              color: Get.theme.textTheme.titleMedium!.color,
                              size: 50.0,
                            ),
                            Text(control.dataList[index]['name'],
                                style: Theme.of(context)
                                    .textTheme
                                    .titleMedium!
                                    .copyWith(
                                      fontSize: 19,
                                    )),
                            Expanded(
                              child: Center(
                                child: Text(
                                    maxLines: 4,
                                    overflow: TextOverflow.ellipsis,
                                    textAlign: TextAlign.center,
                                    control.dataList[index]['subtitle'],
                                    style: Theme.of(context)
                                        .textTheme
                                        .titleMedium!
                                        .copyWith(
                                          fontWeight: FontWeight.normal,
                                          fontSize: 10,
                                        )),
                              ),
                            ),
                            if (index < control.dataList.length - 2)
                              Text("( ${control.dataList[index]['count']} )",
                                  style: Theme.of(context)
                                      .textTheme
                                      .titleMedium!
                                      .copyWith(
                                        fontSize: 14,
                                      )),
                          ],
                        ),
                      ),
                    ),
                  );
                if (index < 8 &&
                    Get.find<Add_Data_controller>().roll != "class")
                  return HoverScaleCard(
                    child: GestureDetector(
                      onTap: () async {
                        if (index <= 4) {
                          control.addToPath(
                              "${control.dataList[index]['name']}".tr);
                        }

                        if (index == control.dataList.length - 2) {
                          Get.dialog(VMSAlertDialog(
                              action: [],
                              contents: Exam_Scheald(),
                              apptitle: "Exam Table".tr,
                              subtitle: "none"));
                        }

                        if (index == control.dataList.length - 1) {
                          Get.dialog(VMSAlertDialog(
                              action: [
                                TextButton(
                                  onPressed: () {
                                    Navigator.pop(
                                        context); // إغلاق الديالوغ بدون خروج
                                  },
                                  child: Text(
                                    "إلغاء",
                                    style: TextStyle(
                                        color: Get.theme.primaryColor),
                                  ),
                                ),
                                ButtonDialog(
                                    text: "نعم، تسجيل الخروج",
                                    onPressed: () async {
                                      await Logoutapi(context)
                                          .Logout(Type: "now");
                                    },
                                    color: Get.theme.primaryColor,
                                    width: 250),
                              ],
                              contents: Container(
                                width: 300,
                                child: const Text(
                                  "بمجرد الضغط على زر (نعم تسجيل الخروج) سيتم تسجيل خروج حساب هذا الصف وحسابك إذا كنت قد سجلت فيه من هذا الجهاز، وستفقد الوصول إليه إلا عند إعادة تسجيل الدخول مرة أخرى.",
                                  textAlign: TextAlign.right,
                                ),
                              ),
                              apptitle: "تأكيد تسجيل الخروج",
                              subtitle: "none"));
                        }
                      },
                      child: Container(
                        padding: const EdgeInsets.all(20),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(5)),
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
                          spacing: 16.0,
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Icon(
                              control.dataList[index]['icon'],
                              color: Get.theme.textTheme.titleMedium!.color,
                              size: 50.0,
                            ),
                            Text(control.dataList[index]['name'],
                                style: Theme.of(context)
                                    .textTheme
                                    .titleMedium!
                                    .copyWith(
                                      fontSize: 19,
                                    )),
                            Expanded(
                              child: Center(
                                child: Text(
                                    maxLines: 4,
                                    overflow: TextOverflow.ellipsis,
                                    textAlign: TextAlign.center,
                                    control.dataList[index]['subtitle'],
                                    style: Theme.of(context)
                                        .textTheme
                                        .titleMedium!
                                        .copyWith(
                                          fontWeight: FontWeight.normal,
                                          fontSize: 10,
                                        )),
                              ),
                            ),
                            if (index < control.dataList.length - 2)
                              Text("( ${control.dataList[index]['count']} )",
                                  style: Theme.of(context)
                                      .textTheme
                                      .titleMedium!
                                      .copyWith(
                                        fontSize: 14,
                                      )),
                          ],
                        ),
                      ),
                    ),
                  );
              },
            );
    });
  }
}
