import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:vms_school/Link/API/Teacher_API/GetTeacherClassAPI.dart';
import 'package:vms_school/Link/API/Teacher_API/GetTeacherClassMarksAPI.dart';
import 'package:vms_school/Link/API/Teacher_API/Get_My_Student.dart';
import 'package:vms_school/Link/Controller/Teacher_Controller/My_Students_Controller.dart';
import 'package:vms_school/Translate/local_controller.dart';
import 'package:vms_school/view/Teacher/Functions/Marks/StudentMarksTeacher.dart';
import 'package:vms_school/view/Teacher/TeacherAppBar.dart';
import 'package:vms_school/view/Teacher/Teacher_Home/TeacherMainScreenGrid.dart';
import 'package:vms_school/widgets/Teacher/DropDownMyStudentTeacher.dart';
import 'package:vms_school/widgets/TextFormSearch.dart';

class TeacherMainScreen extends StatefulWidget {
  const TeacherMainScreen({super.key});

  @override
  State<TeacherMainScreen> createState() => _GuardianMainScreenState();
}

class _GuardianMainScreenState extends State<TeacherMainScreen> {
  TextEditingController search = TextEditingController();
  @override
  void initState() {
    Getteacherclassapi.Getteacherclass();

    Get_My_Students_API().Get_My_Students();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      body: GetBuilder<My_Students_Controller>(builder: (control) {
        return Expanded(
            child: Column(
          children: [
            Teacherappbar(),
            if (screenWidth > 769)
              Container(
                width: screenWidth,
                margin: const EdgeInsets.only(
                    left: 40, top: 20.0, bottom: 15.0, right: 40),
                child: Wrap(
                  textDirection: Get.find<LocalizationController>()
                              .currentLocale
                              .value
                              .languageCode ==
                          'ar'
                      ? TextDirection.ltr
                      : TextDirection.rtl,
                  alignment: WrapAlignment.spaceBetween,
                  runSpacing: 10.0,
                  spacing: 10.0,
                  crossAxisAlignment: WrapCrossAlignment.center,
                  runAlignment: WrapAlignment.start,
                  children: [
                    IconButton(
                      style: ButtonStyle(
                        maximumSize:
                            WidgetStateProperty.all(const Size(35, 35)),
                        minimumSize:
                            WidgetStateProperty.all(const Size(35, 35)),
                        iconSize: WidgetStateProperty.all(14),
                        shape: WidgetStateProperty.all(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(3),
                          ),
                        ),
                        backgroundColor: WidgetStateProperty.all(
                          Theme.of(context).primaryColor,
                        ),
                      ),
                      icon: FaIcon(
                        FontAwesomeIcons.markdown,
                        color: Colors.white,
                      ),
                      color: Colors.white,
                      onPressed: () {
                        Getteacherclassmarksapi.Getteacherclassmarks();

                        Get.dialog(Studentmarksteacher());
                      },
                    ),
                    GetBuilder<My_Students_Controller>(builder: (controller) {
                      return TextFormSearch(
                        width: screenWidth - 550,
                        click: () {
                          controller.clearFilter();
                        },
                        onchange: (value) {
                          controller.searchByName(value, controller.classIndex,
                              controller.divisionIndex);
                        },
                        radius: 5,
                        controller: search,
                        suffixIcon:
                            search.text.isNotEmpty ? Icons.close : Icons.search,
                      );
                    }),
                    Wrap(
                      textDirection: Get.find<LocalizationController>()
                                  .currentLocale
                                  .value
                                  .languageCode ==
                              'ar'
                          ? TextDirection.ltr
                          : TextDirection.rtl,
                      spacing: 15.0,
                      children: [
                        Dropdownmystudentteacher(
                            isLoading: control.isDivisionLoading,
                            isDisabled: control.classIndex == "" ? true : false,
                            title: "Division".tr,
                            width: 200,
                            type: "Division"),
                        Dropdownmystudentteacher(
                          isLoading: control.isClassLoading,
                          title: "Class".tr,
                          width: 200,
                          type: "Class",
                        ),
                      ],
                    )
                  ],
                ),
              ),
            if (screenWidth <= 769)
              Container(
                width: screenWidth,
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    textDirection: Get.find<LocalizationController>()
                                .currentLocale
                                .value
                                .languageCode ==
                            'ar'
                        ? TextDirection.ltr
                        : TextDirection.rtl,
                    spacing: 20,
                    children: [
                      IconButton(
                        style: ButtonStyle(
                          maximumSize:
                              WidgetStateProperty.all(const Size(35, 35)),
                          minimumSize:
                              WidgetStateProperty.all(const Size(35, 35)),
                          iconSize: WidgetStateProperty.all(14),
                          shape: WidgetStateProperty.all(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(3),
                            ),
                          ),
                          backgroundColor: WidgetStateProperty.all(
                            Theme.of(context).primaryColor,
                          ),
                        ),
                        icon: FaIcon(
                          FontAwesomeIcons.markdown,
                          color: Colors.white,
                        ),
                        color: Colors.white,
                        onPressed: () {
                          Getteacherclassmarksapi.Getteacherclassmarks();

                          Get.dialog(Studentmarksteacher());
                        },
                      ),
                      GetBuilder<My_Students_Controller>(builder: (controller) {
                        return TextFormSearch(
                          width: 300,
                          click: () {
                            controller.clearFilter();
                          },
                          onchange: (value) {
                            controller.searchByName(
                                value,
                                controller.classIndex,
                                controller.divisionIndex);
                          },
                          radius: 5,
                          controller: search,
                          suffixIcon: search.text.isNotEmpty
                              ? Icons.close
                              : Icons.search,
                        );
                      }),
                      Dropdownmystudentteacher(
                          isLoading: control.isDivisionLoading,
                          isDisabled: control.classIndex == "" ? true : false,
                          title: "Division".tr,
                          width: 200,
                          type: "Division"),
                      Dropdownmystudentteacher(
                        isLoading: control.isClassLoading,
                        title: "Class".tr,
                        width: 200,
                        type: "Class",
                      ),
                      const SizedBox(width: 20),
                    ],
                  ),
                ),
              ),
            Expanded(
                child: Padding(
              padding: const EdgeInsets.only(top: 15.0),
              child: TeacherMainScreenGrid(),
            )),
          ],
        ));
      }),
    );
  }
}
