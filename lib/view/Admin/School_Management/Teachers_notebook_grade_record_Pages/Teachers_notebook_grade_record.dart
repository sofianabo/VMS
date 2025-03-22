import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vms_school/Icons_File/v_m_s__icons_icons.dart';
import 'package:vms_school/Link/API/AdminAPI/School/School_DropDown/DropdownClassesAPI.dart';
import 'package:vms_school/Link/Controller/AdminController/School_Controllers/Teachernote_and_GradeReco.dart';
import 'package:vms_school/Link/Functions/Add_Teacher_Functions.dart';
import 'package:vms_school/Translate/local_controller.dart';
import 'package:vms_school/main.dart';
import 'package:vms_school/view/Admin/School_Management/Teachers_notebook_grade_record_Pages/Teachers_notebook_grade_record_Grid.dart';
import 'package:vms_school/widgets/Admin_Table/QuizType_DropDown.dart';
import 'package:vms_school/widgets/ButtonsDialog.dart';
import 'package:vms_school/widgets/VMSAlertDialog.dart';

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
    Getallclassapi.getAllClasses();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: Column(
      children: [
        Container(
          margin: const EdgeInsets.only(left: 30.0, right: 30.0, top: 30.0),
          alignment: Alignment.center,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              GetBuilder<TeachernoteAndGradeReco>(builder: (controller) {
                return Row(
                  spacing: 15.0,
                  children: [
                    QuizType_DropDown(
                        Isloading: controller.isClassLoading,
                        title: "Class".tr,
                        width: 250,
                        type: "class"),
                    QuizType_DropDown(
                        Isloading: false,
                        title: "Semester".tr,
                        width: 250,
                        type: "semester"),
                    const Spacer(),
                    Container(
                      width: 40,
                      height: 40,
                      decoration: BoxDecoration(
                          color: Theme.of(context).cardColor,
                          borderRadius: BorderRadius.circular(5),
                          boxShadow: const [
                            BoxShadow(
                                color: Colors.black12,
                                offset: Offset(0, 2),
                                blurRadius: 1)
                          ]),
                      child: IconButton(
                          style: ButtonStyle(
                              backgroundColor: WidgetStatePropertyAll(
                                  Theme.of(context).cardColor),
                              shape: WidgetStatePropertyAll(
                                  RoundedRectangleBorder(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(5))))),
                          onPressed: () {
                            Get.dialog(Add_Group());
                          },
                          icon: Icon(Icons.add,
                              size: 18,
                              color: Theme.of(context).highlightColor)),
                    ),
                    Container(
                      width: 40,
                      height: 40,
                      decoration: BoxDecoration(
                          color: Theme.of(context).cardColor,
                          borderRadius: BorderRadius.circular(5),
                          boxShadow: const [
                            BoxShadow(
                                color: Colors.black12,
                                offset: Offset(0, 2),
                                blurRadius: 1)
                          ]),
                      child: IconButton(
                          style: ButtonStyle(
                              backgroundColor: WidgetStatePropertyAll(
                                  Theme.of(context).cardColor),
                              shape: WidgetStatePropertyAll(
                                  RoundedRectangleBorder(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(5))))),
                          onPressed: () {
                            Get.dialog(Add_Group());
                          },
                          icon: Icon(Icons.add,
                              size: 18,
                              color: Theme.of(context).highlightColor)),
                    ),
                    Container(
                      width: 40,
                      height: 40,
                      decoration: BoxDecoration(
                          color: Theme.of(context).cardColor,
                          borderRadius: BorderRadius.circular(5),
                          boxShadow: const [
                            BoxShadow(
                                color: Colors.black12,
                                offset: Offset(0, 2),
                                blurRadius: 1)
                          ]),
                      child: IconButton(
                          style: ButtonStyle(
                              backgroundColor: WidgetStatePropertyAll(
                                  Theme.of(context).cardColor),
                              shape: WidgetStatePropertyAll(
                                  RoundedRectangleBorder(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(5))))),
                          onPressed: () {
                            Get.dialog(SelectedClass());
                          },
                          icon: Icon(Icons.save_outlined,
                              size: 18,
                              color: Theme.of(context).highlightColor)),
                    ),
                    Container(
                      width: 40,
                      height: 40,
                      decoration: BoxDecoration(
                          color: Theme.of(context).cardColor,
                          borderRadius: BorderRadius.circular(5),
                          boxShadow: const [
                            BoxShadow(
                                color: Colors.black12,
                                offset: Offset(0, 2),
                                blurRadius: 1)
                          ]),
                      child: IconButton(
                          style: ButtonStyle(
                              backgroundColor: WidgetStatePropertyAll(
                                  Theme.of(context).cardColor),
                              shape: WidgetStatePropertyAll(
                                  RoundedRectangleBorder(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(5))))),
                          onPressed: () {},
                          icon: Icon(VMS_Icons.xl,
                              size: 18,
                              color: Theme.of(context).highlightColor)),
                    ),
                  ],
                );
              }),
            ],
          ),
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
  return GetBuilder<TeachernoteAndGradeReco>(builder: (controller) {
    return VMSAlertDialog(
      action: [
        ButtonDialog(
          text: "Done".tr,
          onPressed: () {
            Get.back();
          },
          color: Get.theme.primaryColor,
          width: 65,
        ),
      ],
      contents: Padding(
        padding: EdgeInsets.only(top: 25.0, bottom: 25.0),
        child: SizedBox(
          width: 700,
          child: controller.isClassLoading
              ? Center(child: CircularProgressIndicator()) // مؤشر تحميل
              : GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 10.0,
                    mainAxisSpacing: 10.0,
                    childAspectRatio: 1.8,
                  ),
                  itemCount: controller.Classmodel!.classes!.length,
                  itemBuilder: (context, index) {
                    var classItem = controller.Classmodel!.classes![index];
                    String classId = classItem.id.toString();
                    bool isSelected =
                        controller.selectedClasses.contains(classId);

                    return GestureDetector(
                      onTap: () {
                        controller.toggleClassSelection(classId);
                      },
                      child: Container(
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          color: isSelected ? Colors.blue : Colors.red,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Text(
                          prefs!.getString(languageKey) == 'ar'
                              ? "${classItem.name.toString()}"
                              : "${classItem.enName.toString()}",
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
  });
}
