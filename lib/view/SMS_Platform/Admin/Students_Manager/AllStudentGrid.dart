import 'dart:ui';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:get/get.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:vms_school/Icons_File/v_m_s__icons_icons.dart';
import 'package:vms_school/Link/API/API.dart';
import 'package:vms_school/Link/API/AdminAPI/Students/Students_APIs/Delete_Student_API.dart';
import 'package:vms_school/Link/API/AdminAPI/Students/Students_APIs/Get_Students_Illness.dart';
import 'package:vms_school/Link/API/AdminAPI/Students/Students_APIs/Get_Students_Information.dart';
import 'package:vms_school/Link/API/AdminAPI/Students/Students_APIs/Get_Students_Vaccines.dart';
import 'package:vms_school/Link/Controller/AdminController/Employee_Controllers/Add_Data_controller.dart';
import 'package:vms_school/Link/Controller/AdminController/School_Controllers/Illness_Controller.dart';
import 'package:vms_school/Link/Controller/AdminController/School_Controllers/Vaccines_Controller.dart';
import 'package:vms_school/Link/Controller/AdminController/Students_Controllers/Add_Students_Controller.dart';
import 'package:vms_school/Link/Controller/AdminController/Students_Controllers/AllStudentsController.dart';
import 'package:vms_school/Translate/local_controller.dart';
import 'package:vms_school/main.dart';
import 'package:vms_school/view/Both_Platform/widgets/ButtonsDialog.dart';
import 'package:vms_school/view/Both_Platform/widgets/GridAnimation.dart';
import 'package:vms_school/view/Both_Platform/widgets/Schema_Widget.dart';
import 'package:vms_school/view/Both_Platform/widgets/VMSAlertDialog.dart';

class AllStudentGrid extends StatelessWidget {
  const AllStudentGrid({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    int getCrossAxisCount() {
      if (screenWidth >= 1800) return 5;
      if (screenWidth >= 1278) return 4;
      if (screenWidth >= 920) return 3;
      if (screenWidth >= 906) return 3;
      if (screenWidth >= 769) return 2;
      return 1;
    }

    double getChildAspectRatio() {
      if (screenWidth >= 1800) return 0.9;
      if (screenWidth >= 1410) return 0.9;
      if (screenWidth >= 1278) return 0.8;
      if (screenWidth >= 1149) return 1.1;
      if (screenWidth >= 1070) return 0.9;
      if (screenWidth >= 920) return 0.7;
      if (screenWidth >= 906) return 0.7;
      if (screenWidth >= 769) return 0.9;
      if (screenWidth >= 616) return 1.92;
      return 0.9;
    }

    return GetBuilder<Allstudentscontroller>(builder: (control) {
      return control.isLoading == false
          ? control.filteredStudents.isNotEmpty
              ? Directionality(
                  textDirection: Get.find<LocalizationController>()
                              .currentLocale
                              .value
                              .languageCode ==
                          'ar'
                      ? TextDirection.rtl
                      : TextDirection.ltr,
                  child: GridView.builder(
                    padding:
                        const EdgeInsets.only(top: 10, left: 40, right: 40),
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: getCrossAxisCount(),
                        crossAxisSpacing: 20.0,
                        mainAxisSpacing: 20.0,
                        childAspectRatio: getChildAspectRatio()),
                    itemCount: control.filteredStudents.length,
                    itemBuilder: (context, index) {
                      return HoverScaleCard(
                        child: Container(
                            padding: const EdgeInsets.all(20),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                border:
                                    Border.all(color: Colors.grey, width: 0.5),
                                color: Theme.of(context).cardColor,
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
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Expanded(
                                      child: Text(
                                        "${control.filteredStudents[index].fullName}",
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyMedium!
                                            .copyWith(
                                              fontSize: 20,
                                              fontWeight: FontWeight.bold,
                                            ),
                                      ),
                                    ),
                                    control.filteredStudents[index].fileId !=
                                            null
                                        ? CachedNetworkImage(
                                            imageUrl:
                                                "$getimage${control.filteredStudents[index].fileId}",
                                            imageBuilder:
                                                (context, imageProvider) =>
                                                    CircleAvatar(
                                              maxRadius: 60,
                                              backgroundColor:
                                                  const Color(0xffC4C4C4),
                                              backgroundImage: imageProvider,
                                            ),
                                            placeholder: (context, url) =>
                                                CircleAvatar(
                                              maxRadius: 60,
                                              backgroundColor:
                                                  const Color(0xffC4C4C4),
                                              child: LoadingAnimationWidget
                                                  .inkDrop(
                                                color: Theme.of(context)
                                                    .primaryColor,
                                                size: 30,
                                              ),
                                            ),
                                            errorWidget:
                                                (context, url, error) =>
                                                    CircleAvatar(
                                              maxRadius: 60,
                                              backgroundColor:
                                                  const Color(0xffC4C4C4),
                                              child: Text(
                                                control.filteredStudents[index]
                                                    .fullName!
                                                    .substring(0, 1)
                                                    .toUpperCase(),
                                                style: Get.textTheme.titleLarge!
                                                    .copyWith(
                                                  fontSize: 26,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                            ),
                                          )
                                        : CircleAvatar(
                                            maxRadius: 60,
                                            backgroundColor:
                                                const Color(0xffC4C4C4),
                                            child: Text(
                                              control.filteredStudents[index]
                                                  .fullName!
                                                  .substring(0, 1)
                                                  .toUpperCase(),
                                              style: Get.textTheme.titleLarge!
                                                  .copyWith(
                                                fontSize: 26,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                          )
                                  ],
                                ),
                                Text(
                                    "${"Mobile:".tr}${control.filteredStudents[index].mobileNumber}",
                                    style:
                                        Theme.of(context).textTheme.bodyMedium),
                                Text(
                                    "${"Email:".tr}${control.filteredStudents[index].email}",
                                    style:
                                        Theme.of(context).textTheme.bodyMedium),
                                Text(
                                    "${"Grade Level:".tr}${Get.find<LocalizationController>().currentLocale.value.languageCode == 'ar' ? control.filteredStudents[index].grade!.name : control.filteredStudents[index].grade!.enName}",
                                    style:
                                        Theme.of(context).textTheme.bodyMedium),
                                Padding(
                                  padding: const EdgeInsets.only(top: 8.0),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      if (Get.find<Add_Data_controller>()
                                              .roll !=
                                          "observer")
                                        if (Get.find<Add_Data_controller>()
                                                .roll !=
                                            "supervisor")
                                          IconButton(
                                            style: ButtonStyle(
                                                maximumSize:
                                                    WidgetStateProperty.all(
                                                        const Size(35, 35)),
                                                minimumSize:
                                                    WidgetStateProperty.all(
                                                        const Size(35, 35)),
                                                iconSize:
                                                    WidgetStateProperty.all(14),
                                                shape: WidgetStateProperty.all(
                                                    RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(5),
                                                )),
                                                backgroundColor:
                                                    WidgetStateProperty.all(
                                                        const Color(
                                                            0xffB03D3D))),
                                            onPressed: () {
                                              Get.dialog(VMSAlertDialog(
                                                  action: [
                                                    ButtonDialog(
                                                      width: 100,
                                                      text: "Delete".tr,
                                                      onPressed: () async {
                                                        await Delete_Student_API(
                                                                context)
                                                            .Delete_Student(
                                                                id: control
                                                                    .filteredStudents[
                                                                        index]
                                                                    .id
                                                                    .toString());
                                                      },
                                                      color: const Color(
                                                          0xffB03D3D),
                                                    ),
                                                    const SizedBox(
                                                      width: 10,
                                                    ),
                                                    ButtonDialog(
                                                        width: 100,
                                                        text: "Cancel".tr,
                                                        onPressed: () {
                                                          Get.back();
                                                        },
                                                        color: Theme.of(context)
                                                            .primaryColor)
                                                  ],
                                                  contents: Container(
                                                    width: 300,
                                                    child: Text(
                                                        style: TextStyle(
                                                            color:
                                                                Colors.black),
                                                        maxLines: 3,
                                                        "Do You Want To Deletee"
                                                                .tr +
                                                            "${control.filteredStudents[index].fullName}" +
                                                            "Studentt".tr),
                                                  ),
                                                  apptitle:
                                                      "Delete Students".tr,
                                                  subtitle: "none"));
                                            },
                                            icon: const Icon(VMS_Icons.bin),
                                            color: Colors.white,
                                          ),
                                      IconButton(
                                        style: ButtonStyle(
                                            maximumSize:
                                                WidgetStateProperty.all(
                                                    const Size(35, 35)),
                                            minimumSize:
                                                WidgetStateProperty.all(
                                                    const Size(35, 35)),
                                            iconSize:
                                                WidgetStateProperty.all(14),
                                            shape: WidgetStateProperty.all(
                                                RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(5),
                                            )),
                                            backgroundColor:
                                                WidgetStateProperty.all(
                                                    Theme.of(context)
                                                        .primaryColorLight)),
                                        onPressed: () async {
                                          Get.find<Illness_Controller>()
                                              .initialdata();
                                          await Get_Students_Illness_API(
                                                  context)
                                              .Get_Students_Illness(
                                                  studentId: control
                                                      .filteredStudents[index]
                                                      .id,
                                                  index_of_Student: index);
                                        },
                                        icon: const Icon(VMS_Icons.vir),
                                        color: Colors.white,
                                      ),
                                      IconButton(
                                        style: ButtonStyle(
                                            maximumSize:
                                                WidgetStateProperty.all(
                                                    const Size(35, 35)),
                                            minimumSize:
                                                WidgetStateProperty.all(
                                                    const Size(35, 35)),
                                            iconSize:
                                                WidgetStateProperty.all(14),
                                            shape: WidgetStateProperty.all(
                                                RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(5),
                                            )),
                                            backgroundColor:
                                                WidgetStateProperty.all(
                                                    Theme.of(context)
                                                        .primaryColorLight)),
                                        onPressed: () async {
                                          Get.find<Vaccines_Controller>()
                                              .initialdata();
                                          await Get_Students_Vacciness_API(
                                                  context)
                                              .Get_Students_Vacciness(
                                                  studentId: control
                                                      .filteredStudents[index]
                                                      .id,
                                                  index_of_student: index);
                                        },
                                        icon: const Icon(VMS_Icons.dose),
                                        color: Colors.white,
                                      ),
                                      IconButton(
                                        style: ButtonStyle(
                                            maximumSize:
                                                WidgetStateProperty.all(
                                                    const Size(35, 35)),
                                            minimumSize:
                                                WidgetStateProperty.all(
                                                    const Size(35, 35)),
                                            iconSize:
                                                WidgetStateProperty.all(14),
                                            shape: WidgetStateProperty.all(
                                                RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(5),
                                            )),
                                            backgroundColor:
                                                WidgetStateProperty.all(
                                                    Theme.of(context)
                                                        .primaryColorLight)),
                                        onPressed: () async {
                                          Get.find<Add_Students_Controller>()
                                              .resetError();

                                          await Get_Students_Information_API(
                                                  context)
                                              .Get_Students_Information(
                                                  StudentsID: control
                                                      .filteredStudents[index]
                                                      .id,
                                                  index: index);
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
                  ),
                )
              : Center(
                  child: Text("No Students".tr,
                      style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                          fontSize: 22, fontWeight: FontWeight.normal)))
          : GridView.builder(
              padding: const EdgeInsets.only(top: 10, left: 40, right: 40),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: getCrossAxisCount(),
                childAspectRatio: getChildAspectRatio(),
                crossAxisSpacing: 20.0,
                mainAxisSpacing: 20.0,
              ),
              itemCount: 8,
              itemBuilder: (context, index) {
                return HoverScaleCard(
                  child: Container(
                      padding: const EdgeInsets.all(20),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          border: Border.all(color: Colors.grey, width: 0.5),
                          color: Theme.of(context).cardColor,
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
                                  child: SchemaWidget(
                                width: 50,
                                height: 10,
                              )),
                              SchemaWidget(
                                width: 100,
                                height: 100,
                              )
                            ],
                          ),
                          SchemaWidget(
                            width: 60,
                            height: 10,
                          ),
                          SchemaWidget(
                            width: 55,
                            height: 10,
                          ),
                          SchemaWidget(
                            width: 30,
                            height: 10,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 8.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                SchemaWidget(
                                  width: 35,
                                  height: 35,
                                ),
                                if (Get.find<Add_Data_controller>().roll !=
                                    "observer")
                                  if (Get.find<Add_Data_controller>().roll !=
                                      "supervisor")
                                    SchemaWidget(
                                      width: 35,
                                      height: 35,
                                    ),
                                SchemaWidget(
                                  width: 35,
                                  height: 35,
                                ),
                                SchemaWidget(
                                  width: 35,
                                  height: 35,
                                ),
                              ],
                            ),
                          )
                        ],
                      )),
                ).animate(onPlay: (controller) => controller.repeat()).shimmer(
                    angle: 1,
                    color: Colors.white,
                    duration: const Duration(milliseconds: 600),
                    delay: const Duration(milliseconds: 200));
              },
            );
    });
  }
}
