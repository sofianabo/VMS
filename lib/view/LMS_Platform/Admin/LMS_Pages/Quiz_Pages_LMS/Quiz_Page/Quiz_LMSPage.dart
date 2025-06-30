import 'package:duration_picker/duration_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:vms_school/Link/API/API.dart';
import 'package:vms_school/Link/API/AdminAPI/School/School_Tables/DropDownSemsesterAPI.dart';
import 'package:vms_school/Link/API/LMS_APIs/QuizAPI/AddQuizLmsAPI.dart';
import 'package:vms_school/Link/API/LMS_APIs/Admin/Get_All_Curr_LMS.dart';
import 'package:vms_school/Link/API/LMS_APIs/QuizAPI/GetAllQuizLmsAPI.dart';
import 'package:vms_school/Link/Controller/AdminController/Employee_Controllers/Add_Data_controller.dart';
import 'package:vms_school/Link/Controller/AdminController/School_Controllers/ExamTableDialogController.dart';
import 'package:vms_school/Link/Controller/LMS_Controllers/Admin_LMS/QuizController/AllQuizController.dart';
import 'package:vms_school/view/Both_Platform/widgets/ButtonsDialog.dart';
import 'package:vms_school/view/Both_Platform/widgets/Calender.dart';
import 'package:vms_school/view/Both_Platform/widgets/Squer_Button_Enabled_Disabled.dart';
import 'package:vms_school/view/Both_Platform/widgets/TextFildWithUpper.dart';
import 'package:vms_school/view/Both_Platform/widgets/TextFormSearch.dart';
import 'package:vms_school/view/Both_Platform/widgets/VMSAlertDialog.dart';
import 'package:vms_school/view/LMS_Platform/Admin/LMS_Pages/Quiz_Pages_LMS/Quiz_Page/Quiz_QuestionPageGrid.dart';
import 'package:vms_school/view/LMS_Platform/Widget/QuizLmsDropdown.dart';

class QuizLmspage extends StatefulWidget {
  const QuizLmspage({super.key});

  @override
  State<QuizLmspage> createState() => _QuizLmspagesState();
}

class _QuizLmspagesState extends State<QuizLmspage> {
  @override
  initState() {
    Get_LMS_Curriculm_API().Get_LMS_Curriculm();
    Getallquizlmsapi().Getallquizlms();
    Dropdownsemsesterapi(context).Dropdownsemsester();

    super.initState();
  }

  TextEditingController search = TextEditingController();
  TextEditingController name = TextEditingController();
  TextEditingController page = TextEditingController();
  TextEditingController period = TextEditingController();
  TextEditingController max = TextEditingController();
  TextEditingController min = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return Column(
      children: [
        if (screenWidth > 769)
          GetBuilder<Allquizcontroller>(builder: (controller) {
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
                  Quizlmsdropdown(
                      title: "Curriculum".tr,
                      width: 250,
                      type: "curriculum",
                      Isloading: controller.isCuriculmLoading),
                  Squer_Button_Enabled_Disabled(
                      validate:
                          !(Get.find<Add_Data_controller>().roll != "observer"),
                      icon: Icons.add,
                      onTap: () {
                        name.clear();
                        max.clear();
                        min.clear();
                        period.clear();
                        Get.find<Allquizcontroller>().reset();
                        Get.find<Allquizcontroller>().resetError();

                        AddQuizDialog();
                      })
                ],
              ),
            );
          }),
        if (screenWidth <= 769)
          GetBuilder<Allquizcontroller>(builder: (controller) {
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
                    Quizlmsdropdown(
                        title: "Curriculum".tr,
                        width: 250,
                        type: "curriculum",
                        Isloading: controller.isCuriculmLoading),
                    Squer_Button_Enabled_Disabled(
                        validate: !(Get.find<Add_Data_controller>().roll !=
                            "observer"),
                        icon: Icons.add,
                        onTap: () {
                          name.clear();
                          max.clear();
                          min.clear();
                          period.clear();

                          Get.find<Allquizcontroller>().reset();
                          Get.find<Allquizcontroller>().resetError();

                          AddQuizDialog();
                        })
                  ],
                ),
              ),
            );
          }),
        GetBuilder<Allquizcontroller>(builder: (controller) {
          if (controller.isLoading == true) {
            return Expanded(
              child: Center(
                  child: LoadingAnimationWidget.inkDrop(
                color: Theme.of(context).primaryColor,
                size: 60,
              )),
            );
          }
          if (controller.filtered_quizLMS.isEmpty) {
            return Expanded(
              child: Center(
                  child: Text("No Quizzes".tr,
                      style: Theme.of(context).textTheme.titleLarge!.copyWith(
                          fontSize: 22, fontWeight: FontWeight.normal))),
            );
          }
          return QuizQuestionpagegrid();
        }),
      ],
    );
  }

  AddQuizDialog() {
    var controller = Get.find<Allquizcontroller>();
    controller.updateFieldError("class", false);
    controller.updateFieldError("curr", false);
    controller.updateFieldError("semester", false);
    controller.updateFieldError("type", false);
    controller.updateFieldError("max", false);
    controller.updateFieldError("min", false);
    controller.updateFieldError("per", false);
    controller.updateFieldError("date", false);

    Get.dialog(barrierDismissible: false,
        GetBuilder<Allquizcontroller>(builder: (Econtroller) {
      return VMSAlertDialog(
          action: [
            ButtonDialog(
                text: "Add Exam".tr,
                onPressed: () async {
                  bool IscurrError = controller.dialog_currIndex.isEmpty ||
                      controller.dialog_currIndex == "";
                  bool IssemesterError =
                      controller.semesterDialogIndex.isEmpty ||
                          controller.semesterDialogIndex == "";
                  bool IstypeError = controller.typeDialogIndex.isEmpty ||
                      controller.typeDialogIndex == "";
                  bool IsmaxError = max.text.trim().isEmpty;
                  bool IsminError = min.text.trim().isEmpty;
                  bool IsperError = period.text.trim().isEmpty;
                  bool IsNameError = name.text.trim().isEmpty;
                  bool IsdateError = controller.dateindex.value == null;

                  Econtroller.updateFieldError("curr", IscurrError);
                  Econtroller.updateFieldError("semester", IssemesterError);
                  Econtroller.updateFieldError("type", IstypeError);
                  Econtroller.updateFieldError("max", IsmaxError);
                  Econtroller.updateFieldError("min", IsminError);
                  Econtroller.updateFieldError("per", IsperError);
                  Econtroller.updateFieldError("date", IsdateError);
                  Econtroller.updateFieldError("name", IsNameError);

                  if (!(IscurrError ||
                      IssemesterError ||
                      IstypeError ||
                      IsmaxError ||
                      IsminError ||
                      IsperError ||
                      IsNameError ||
                      IsdateError)) {
                    await Addquizlmsapi(context).Addquizlms(
                        controller.dialogCurrList
                            .indexOf(controller.selectdialog_CurrIndex),
                        controller.typeDialogList
                            .indexOf(controller.selectedTypeDialog),
                        controller.dateindex.toString(),
                        period.text,
                        name.text,
                        controller.Hidden,
                        max.text,
                        min.text);
                    Get.back();
                  }
                },
                color: Get.theme.primaryColor,
                width: 120)
          ],
          contents: Container(
            width: Get.width / 3,
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 15.0),
                    child: Wrap(
                      runSpacing: 8.0,
                      spacing: 8.0,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 28.0),
                          child: Quizlmsdropdown(
                              isError: Econtroller.IscurrError,
                              // isDisabled: Econtroller.classDialogIndex == "",
                              Isloading: Econtroller.isCuriculmDialogLoading,
                              title: "Curriculum".tr,
                              width: 220,
                              type: "curiculmDialog"),
                        ),
                        Textfildwithupper(
                            onChanged: (value) {
                              if (value.isNotEmpty) {
                                Econtroller.updateFieldError("name", false);
                              }
                            },
                            isRequired: true,
                            isError: Econtroller.IsAnameError,
                            Uptext: "Name".tr,
                            width: 220,
                            controller: name,
                            hinttext: "Name".tr),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 15.0),
                    child: Wrap(
                      runSpacing: 8.0,
                      spacing: 8.0,
                      children: [
                        Quizlmsdropdown(
                            isError: Econtroller.IssemesterError,
                            Isloading: Econtroller.issemesterLoading,
                            title: "season".tr,
                            width: 220,
                            type: "semesterDialog"),
                        GetBuilder<Examtabledialogcontroller>(builder: (c) {
                          return Quizlmsdropdown(
                              isError: Econtroller.IstypeError,
                              isDisabled: Econtroller.semesterDialogIndex == "",
                              Isloading: c.isTypeLoading,
                              title: "Type".tr,
                              width: 220,
                              type: "typeDialog");
                        }),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 15.0),
                    child: Wrap(
                      runSpacing: 8.0,
                      spacing: 8.0,
                      children: [
                        Textfildwithupper(
                            fieldType: "number",
                            onChanged: (value) {
                              if (value.isNotEmpty) {
                                if (value == "0") {
                                  max.text = "1";
                                }
                                Econtroller.updateFieldError("max", false);
                              }
                            },
                            isRequired: true,
                            isError: Econtroller.ISmaxError,
                            Uptext: "Max Mark".tr,
                            width: 220,
                            controller: max,
                            hinttext: "Max Mark".tr),
                        Textfildwithupper(
                            fieldType: "number",
                            onChanged: (value) {
                              if (value.isNotEmpty) {
                                if (value == "0") {
                                  min.text = "1";
                                }
                                Econtroller.updateFieldError("min", false);
                              }
                            },
                            isRequired: true,
                            isError: Econtroller.ISminError,
                            Uptext: "Min Mark".tr,
                            width: 220,
                            controller: min,
                            hinttext: "Min Mark".tr)
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 15.0),
                    child: Wrap(
                      runSpacing: 8.0,
                      spacing: 8.0,
                      children: [
                        GestureDetector(
                          onTap: () async {
                            Duration? picked = await showDurationPicker(
                                context: context,
                                initialTime: Duration(hours: 0, minutes: 0),
                                decoration: BoxDecoration(
                                    color: Get.theme.cardColor,
                                    backgroundBlendMode: BlendMode.color));
                            if (picked != null) {
                              Econtroller.updateFieldError("per", false);
                              period.text =
                                  "${picked.inHours.toString().padLeft(2, '0')}:"
                                  "${(picked.inMinutes % 60).toString().padLeft(2, '0')}:00";
                            }
                          },
                          child: Textfildwithupper(
                            isRequired: true,
                            isError: Econtroller.ISperiodError,
                            readOnly: true,
                            enabled: false,
                            Uptext: "Period".tr,
                            width: 220,
                            controller: period,
                            hinttext: "00:00:00",
                          ),
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(bottom: 5.0),
                              child: RichText(
                                  text: TextSpan(
                                      text: "Date".tr,
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyMedium)),
                            ),
                            examDateLMS(
                              isError: Econtroller.ISdateError,
                              isRequired: true,
                              width: 220,
                            ),
                          ],
                        ),
                        Wrap(
                          alignment: WrapAlignment.center,
                          runAlignment: WrapAlignment.center,
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
                            Text("Is It Hidden".tr),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          apptitle: "Add Exam".tr,
          subtitle: "none");
    }));
    // Get.find<Allquizcontroller>().initialData();
    // period.clear();
    // max.clear();
    // min.clear();
  }
}
