import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vms_school/Link/API/AdminAPI/School/School_DropDown/DropdownClassesAPI.dart';
import 'package:vms_school/Link/API/AdminAPI/School/School_Screen_APIs/Quiz_Type/Add_Quiz_Type_API.dart';
import 'package:vms_school/Link/API/AdminAPI/School/School_Screen_APIs/Quiz_Type/Get_Class_None_Quiz.dart';
import 'package:vms_school/Link/API/AdminAPI/School/School_Screen_APIs/Quiz_Type/Update_Quiz_Type.dart';
import 'package:vms_school/Link/Controller/AdminController/Employee_Controllers/Add_Data_controller.dart';
import 'package:vms_school/Link/Controller/AdminController/School_Controllers/Teachernote_and_GradeReco.dart';
import 'package:vms_school/Link/Functions/Add_Opiration_Dialog.dart';
import 'package:vms_school/Link/Functions/Add_Table_Quiz_Functions.dart';
import 'package:vms_school/Translate/local_controller.dart';

import 'package:vms_school/view/Both_Platform/widgets/Admin/Admin_Table/QuizType_DropDown.dart';
import 'package:vms_school/view/Both_Platform/widgets/ButtonsDialog.dart';
import 'package:vms_school/view/Both_Platform/widgets/Schema_Widget.dart';
import 'package:vms_school/view/Both_Platform/widgets/VMSAlertDialog.dart';
import 'package:vms_school/view/SMS_Platform/Admin/School_Management/Teachers_notebook_grade_record_Pages/Teachers_notebook_grade_record_Grid.dart';

class Teachers_notebook_grade_record extends StatefulWidget {
  const Teachers_notebook_grade_record({super.key});

  @override
  State<Teachers_notebook_grade_record> createState() =>
      _Teachers_notebook_grade_recordState();
}

class _Teachers_notebook_grade_recordState
    extends State<Teachers_notebook_grade_record> {
  @override
  void initState() {
    Get.find<TeachernoteAndGradeReco>().ClassIndex = "";
    Getallclassapi.getAllClasses();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: Column(
      children: [
        Container(
          width: Get.width,
          margin: const EdgeInsets.only(left: 30.0, right: 30.0, top: 30.0),
          child: GetBuilder<TeachernoteAndGradeReco>(builder: (controller) {
            return Wrap(
              crossAxisAlignment: WrapCrossAlignment.center,
              runAlignment: WrapAlignment.spaceBetween,
              alignment: WrapAlignment.spaceBetween,
              runSpacing: 8.0,
              spacing: 15.0,
              children: [
                Wrap(
                  runSpacing: 15.0,
                  spacing: 15.0,
                  children: [
                    QuizType_DropDown(
                        IsEnabled: true,
                        Isloading: controller.isClassLoading,
                        title: "Class".tr,
                        width: 250,
                        type: "class"),
                    QuizType_DropDown(
                        IsEnabled:
                            controller.ClassIndex.trim().toString() != "",
                        Isloading: false,
                        title: "Semester".tr,
                        width: 250,
                        type: "semester"),
                  ],
                ),
                if (Get.find<Add_Data_controller>().roll != "observer")
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    spacing: 15.0,
                    children: [
                      Container(
                        width: 40,
                        height: 40,
                        decoration: BoxDecoration(
                            color: controller.isClassLoading == true ||
                                    controller.ClassIndex.trim().toString() ==
                                        ""
                                ? Get.theme.disabledColor
                                : Theme.of(context).cardColor,
                            borderRadius: BorderRadius.circular(5),
                            boxShadow: const [
                              BoxShadow(
                                  color: Colors.black12,
                                  offset: Offset(0, 2),
                                  blurRadius: 1)
                            ]),
                        child: IconButton(
                            splashColor:
                                controller.isClassLoading == true || controller.ClassIndex.trim().toString() == ""
                                    ? Get.theme.disabledColor
                                    : Theme.of(context).cardColor,
                            style: ButtonStyle(
                                backgroundColor: WidgetStatePropertyAll(
                                    controller.isClassLoading == true || controller.ClassIndex.trim().toString() == ""
                                        ? Get.theme.disabledColor
                                        : Theme.of(context).cardColor),
                                shape: WidgetStatePropertyAll(RoundedRectangleBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(5))))),
                            onPressed: () {
                              if (controller.isClassLoading == true ||
                                  controller.ClassIndex.trim().toString() ==
                                      "") {
                                return;
                              }
                              controller.items.clear();
                              Get.dialog(
                                  barrierDismissible: false, Add_Group());
                            },
                            icon: Icon(Icons.add,
                                size: 18,
                                color: controller.isClassLoading == true ||
                                        controller.ClassIndex.trim().toString() == ""
                                    ? Colors.white
                                    : Theme.of(context).textTheme.titleMedium!.color!)),
                      ),
                      GetBuilder<TeachernoteAndGradeReco>(builder: (Con) {
                        return Container(
                          width: 40,
                          height: 40,
                          decoration: BoxDecoration(
                              color: controller.isClassLoading == true ||
                                      controller.ClassIndex.trim()
                                          .isEmpty || // لا حاجة ل toString() هنا
                                      (controller.Qt_Model?.type?.isEmpty ?? true)
                                  ? Get.theme.disabledColor
                                  : Theme.of(context).cardColor,
                              borderRadius: BorderRadius.circular(5),
                              boxShadow: const [
                                BoxShadow(
                                    color: Colors.black12,
                                    offset: Offset(0, 2),
                                    blurRadius: 1)
                              ]),
                          child: IconButton(
                              splashColor: controller.isClassLoading == true || controller.ClassIndex.trim().isEmpty || (controller.Qt_Model?.type?.isEmpty ?? true)
                                  ? Get.theme.disabledColor
                                  : Theme.of(context).cardColor,
                              style: ButtonStyle(
                                  backgroundColor: WidgetStatePropertyAll(
                                      controller.isClassLoading == true || controller.ClassIndex.trim().isEmpty || (controller.Qt_Model?.type?.isEmpty ?? true)
                                          ? Get.theme.disabledColor
                                          : Theme.of(context).cardColor),
                                  shape: WidgetStatePropertyAll(RoundedRectangleBorder(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(5))))),
                              onPressed: () {
                                Get.dialog(
                                    barrierDismissible: false,
                                    Add_Oparation_Dialog(
                                        controller: Con,
                                        Class_Id: controller.Classmodel?.classes
                                            ?.firstWhereOrNull(
                                              (element) =>
                                                  element.name ==
                                                      controller.ClassIndex ||
                                                  element.enName ==
                                                      controller.ClassIndex,
                                            )!
                                            .id));
                                if (controller.isClassLoading == true ||
                                    controller.ClassIndex.trim().isEmpty ||
                                    (controller.Qt_Model?.type?.isEmpty ??
                                        true)) {
                                  return;
                                }
                              },
                              icon: Icon(Icons.calculate_outlined,
                                  size: 18,
                                  color: controller.isClassLoading == true ||
                                          controller.ClassIndex.trim().isEmpty ||
                                          (controller.Qt_Model?.type?.isEmpty ?? true)
                                      ? Colors.white
                                      : Theme.of(context).textTheme.titleMedium!.color!)),
                        );
                      }),
                      Container(
                        width: 40,
                        height: 40,
                        decoration: BoxDecoration(
                            color: controller.isClassLoading == true ||
                                    controller.ClassIndex.trim().toString() ==
                                        ""
                                ? Get.theme.disabledColor
                                : Theme.of(context).cardColor,
                            borderRadius: BorderRadius.circular(5),
                            boxShadow: const [
                              BoxShadow(
                                  color: Colors.black12,
                                  offset: Offset(0, 2),
                                  blurRadius: 1)
                            ]),
                        child: IconButton(
                            splashColor:
                                controller.isClassLoading == true || controller.ClassIndex.trim().toString() == ""
                                    ? Get.theme.disabledColor
                                    : Theme.of(context).cardColor,
                            style: ButtonStyle(
                                backgroundColor: WidgetStatePropertyAll(
                                    controller.isClassLoading == true || controller.ClassIndex.trim().toString() == ""
                                        ? Get.theme.disabledColor
                                        : Theme.of(context).cardColor),
                                shape: WidgetStatePropertyAll(RoundedRectangleBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(5))))),
                            onPressed: () async {
                              if (controller.isClassLoading == true ||
                                  controller.ClassIndex.trim().toString() ==
                                      "") {
                                return;
                              }
                              if (controller.Qt_Model!.type!.isNotEmpty) {
                                await Update_Quiz_Type_API().Update_Quiz_Type(
                                  ClassId: controller
                                      .Classmodel!
                                      .classes![controller.ClassList.indexOf(
                                          controller.ClassIndex)]
                                      .id!,
                                  SemsterId: controller.SemesterSendIndex,
                                  groups: controller.groups,
                                );
                              } else {
                                Get.dialog(
                                    barrierDismissible: false, SelectedClass());
                              }
                            },
                            icon: Icon(Icons.save_outlined,
                                size: 18,
                                color: controller.isClassLoading == true ||
                                        controller.ClassIndex.trim().toString() == ""
                                    ? Colors.white
                                    : Theme.of(context).textTheme.titleMedium!.color!)),
                      ),
                    ],
                  )
              ],
            );
          }),
        ),
        Expanded(
            child: Padding(
          padding: const EdgeInsets.only(top: 15.0),
          child: GradesTableScreen(),
        )),
      ],
    ));
  }
}

SelectedClass() {
  Get_None_Class.Get_None_Class_API(
      semesterId: Get.find<TeachernoteAndGradeReco>().SemesterSendIndex);
  return GetBuilder<TeachernoteAndGradeReco>(
    builder: (controller) {
      return VMSAlertDialog(
        action: [
          controller.isClassDialogLoading
              ? Center(child: SchemaWidget(width: 65, height: 100))
              : ButtonDialog(
                  text: "Done".tr,
                  onPressed: () async {
                    await Add_Quiz_Type_API().Add_Quiz_Type(
                      ClassId: controller.selectedClasses,
                      SemsterId: controller.SemesterSendIndex,
                      groups: controller.groups,
                    );
                  },
                  color: Get.theme.primaryColor,
                  width: 65,
                ),
        ],
        contents: Padding(
          padding: EdgeInsets.only(top: 25.0, bottom: 25.0),
          child: SizedBox(
            width: 700,
            child: controller.isClassDialogLoading
                ? Center(child: CircularProgressIndicator()) // مؤشر تحميل
                : GridView.builder(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 10.0,
                      mainAxisSpacing: 10.0,
                      childAspectRatio: 1.8,
                    ),
                    itemCount: controller.NoneClassmodel!.classes!.length,
                    itemBuilder: (context, index) {
                      var classItem =
                          controller.NoneClassmodel!.classes![index];
                      String classId = classItem.id.toString();
                      bool isSelected =
                          controller.selectedClasses.contains(classId);
                      bool isClassIndex = classId == controller.ClassIndex;

                      return GestureDetector(
                        onTap: () {
                          if (!isClassIndex) {
                            controller.toggleClassSelection(classId);
                          }
                        },
                        child: Container(
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            color: isSelected
                                ? Get.theme.primaryColor
                                : Get.theme.disabledColor,
                            borderRadius: BorderRadius.circular(10),
                            border: isClassIndex
                                ? Border.all(
                                    color: Colors.yellow,
                                    width: 2) // إبراز العنصر الرئيسي
                                : null,
                          ),
                          child: Text(
                            Get.find<LocalizationController>()
                                        .currentLocale
                                        .value
                                        .languageCode ==
                                    'ar'
                                ? "${classItem.name}"
                                : "${classItem.enName}",
                            style: TextStyle(color: Colors.white, fontSize: 16),
                          ),
                        ),
                      );
                    },
                  ),
          ),
        ),
        apptitle: "Selected Class",
        subtitle: "none",
      );
    },
  );
}
