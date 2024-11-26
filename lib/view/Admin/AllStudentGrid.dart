// ignore_for_file: must_be_immutable, file_names

import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vms_school/Icons_File/v_m_s__icons_icons.dart';
import 'package:vms_school/Link/API/API.dart';
import 'package:vms_school/Link/API/AdminAPI/DeleteStudentAPI.dart';
import 'package:vms_school/Link/Controller/AdminController/AllStudentsController.dart';
import 'package:vms_school/view/Admin/EditStudentInfo.dart';
import 'package:vms_school/widgets/ButtonsDialog.dart';

import '../../widgets/GridAnimation.dart';

class AllStudentGrid extends StatelessWidget {
  List<String> items = [
    'Item 1',
    'Item 2',
    'Item 3',
    'Item 4',
    'Item 5',
    'Item 6'
  ];

  AllStudentGrid({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<Allstudentscontroller>(builder: (control) {
      return GridView.builder(
        padding: const EdgeInsets.only(top: 10, left: 40, right: 40),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: Get.width <= 1278 && Get.width >= 1000
                ? 3
                : Get.width <= 999 && Get.width >= 759
                    ? 2
                    : Get.width <= 758
                        ? 1
                        : 4,
            crossAxisSpacing: 20.0,
            mainAxisSpacing: 20.0,
            childAspectRatio: Get.width <= 1410 && Get.width >= 1278
                //THREE ITEMS
                ? 0.8
                : Get.width <= 1278 && Get.width >= 1149
                    //THREE ITEMS
                    ? 1.3
                    : Get.width <= 1148 && Get.width >= 1045
                        ? 1.16
                        : Get.width <= 999 && Get.width >= 759
                            ? 1.2
                            : Get.width <= 758 && Get.width >= 714
                                ? 2.0
                                : Get.width <= 713 && Get.width >= 569
                                    ? 1.6
                                    : Get.width <= 570
                                        ? 1.3
                                        //NORMAL ITEMS
                                        : 0.95),
        itemCount: control.filteredStudents.length,
        itemBuilder: (context, index) {
          return HoverScaleCard(
            child: Container(
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    border: Border.all(color: Colors.grey, width: 0.5),
                    color: Colors.white,
                    boxShadow: const [
                      BoxShadow(
                          color: Colors.black26,
                          offset: Offset(0, 2),
                          blurRadius: 1)
                    ]),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: Text(
                              "${control.filteredStudents[index].fullName}",
                              style: Get.theme.primaryTextTheme.bodyMedium!
                                  .copyWith(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold)),
                        ),
                        Image.asset("../../images/Rectangle66.png",
                            height: 100, width: 100)
                      ],
                    ),
                    Text(
                        "Mobile: ${control.filteredStudents[index].mobileNumber}",
                        style: Get.theme.primaryTextTheme.bodySmall),
                    Text("Email: ${control.filteredStudents[index].email}",
                        style: Get.theme.primaryTextTheme.bodySmall),
                    Text(
                        "Grade Level: ${control.filteredStudents[index].enName}",
                        style: Get.theme.primaryTextTheme.bodySmall),
                    Padding(
                      padding: const EdgeInsets.only(top: 8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          IconButton(
                            style: ButtonStyle(
                                maximumSize:
                                    WidgetStateProperty.all(Size(35, 35)),
                                minimumSize:
                                    WidgetStateProperty.all(Size(35, 35)),
                                iconSize: WidgetStateProperty.all(14),
                                shape: WidgetStateProperty.all(
                                    RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(5),
                                )),
                                backgroundColor:
                                    WidgetStateProperty.all(Color(0xffB03D3D))),
                            onPressed: () {
                              Get.dialog(BackdropFilter(
                                filter: ImageFilter.blur(sigmaX: 2, sigmaY: 2),
                                child: AlertDialog(
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(5)),
                                  backgroundColor: Colors.white,
                                  surfaceTintColor: Colors.white,
                                  title: Text(
                                    "Delete Student",
                                    style: Get.theme.primaryTextTheme.bodyLarge,
                                  ),
                                  content: SizedBox(
                                      width: 400,
                                      height: 40,
                                      child: Text(
                                        "Do you want to delete Laith Azzam",
                                        style: Get
                                            .theme.primaryTextTheme.bodyMedium,
                                      )),
                                  actions: [
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        ButtonDialog(
                                            width: 100,
                                            text: "Delete",
                                            onPressed: () async {
                                              await Deletestudentapi(context)
                                                  .Deletestudent(control
                                                      .filteredStudents[index]
                                                      .id!);
                                            },
                                            color: Colors.red),
                                        const SizedBox(
                                          width: 10,
                                        ),
                                        ButtonDialog(
                                            width: 100,
                                            text: "Cancel",
                                            onPressed: () {
                                              Get.back();
                                            },
                                            color:
                                                Get.theme.colorScheme.primary)
                                      ],
                                    )
                                  ],
                                ),
                              ));
                            },
                            icon: const Icon(VMS_Icons.bin),
                            color: Colors.white,
                          ),
                          IconButton(
                            style: ButtonStyle(
                                maximumSize:
                                    WidgetStateProperty.all(Size(35, 35)),
                                minimumSize:
                                    WidgetStateProperty.all(Size(35, 35)),
                                iconSize: WidgetStateProperty.all(14),
                                shape: WidgetStateProperty.all(
                                    RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(5),
                                )),
                                backgroundColor: WidgetStateProperty.all(
                                    Get.theme.primaryColor)),
                            onPressed: () {},
                            icon: const Icon(VMS_Icons.vir),
                            color: Colors.white,
                          ),
                          IconButton(
                            style: ButtonStyle(
                                maximumSize:
                                    WidgetStateProperty.all(Size(35, 35)),
                                minimumSize:
                                    WidgetStateProperty.all(Size(35, 35)),
                                iconSize: WidgetStateProperty.all(14),
                                shape: WidgetStateProperty.all(
                                    RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(5),
                                )),
                                backgroundColor: WidgetStateProperty.all(
                                    Get.theme.primaryColor)),
                            onPressed: () {},
                            icon: const Icon(VMS_Icons.dose),
                            color: Colors.white,
                          ),
                          IconButton(
                            style: ButtonStyle(
                                maximumSize:
                                    WidgetStateProperty.all(Size(35, 35)),
                                minimumSize:
                                    WidgetStateProperty.all(Size(35, 35)),
                                iconSize: WidgetStateProperty.all(14),
                                shape: WidgetStateProperty.all(
                                    RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(5),
                                )),
                                backgroundColor: WidgetStateProperty.all(
                                    Get.theme.primaryColor)),
                            onPressed: () {
                              EditStudentDialog();
                            },
                            icon: const Icon(VMS_Icons.vcard),
                            color: Colors.white,
                          ),
                        ],
                      ),
                    )
                  ],
                )),
          );
        },
      );
    });
  }
}
