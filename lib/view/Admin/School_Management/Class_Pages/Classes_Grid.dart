import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:get/get.dart';
import 'package:vms_school/Icons_File/v_m_s__icons_icons.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:vms_school/Link/API/AdminAPI/School/School_Screen_APIs/Class_API/Delete_Class_API.dart';
import 'package:vms_school/Link/API/AdminAPI/School/School_Screen_APIs/Class_API/Edit_Class_API.dart';
import 'package:vms_school/Link/Controller/AdminController/School_Controllers/Class_Mgmt_Controller.dart';
import 'package:vms_school/Link/Functions/Class_Curriculm_Funcation.dart';
import 'package:vms_school/Translate/local_controller.dart';
import 'package:vms_school/main.dart';
import 'package:vms_school/widgets/ButtonsDialog.dart';
import 'package:vms_school/widgets/GridAnimation.dart';
import 'package:vms_school/widgets/Schema_Widget.dart';
import 'package:vms_school/widgets/TextFildWithUpper.dart';
import 'package:vms_school/widgets/VMSAlertDialog.dart';

class ClassGrid extends StatelessWidget {
  ClassGrid({super.key});

  TextEditingController arName = TextEditingController();
  TextEditingController enName = TextEditingController();
  TextEditingController driveUrl = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: prefs!.getString(languageKey) == "ar"
          ? TextDirection.rtl
          : TextDirection.ltr,
      child: GetBuilder<ClassMgmtController>(builder: (control) {
        return control.isLoading == true
            ? GridView.builder(
                padding: const EdgeInsets.only(top: 10, left: 40, right: 40),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 5,
                    crossAxisSpacing: 20.0,
                    mainAxisSpacing: 20.0,
                    childAspectRatio: 1.1),
                itemCount: 10,
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
                            SchemaWidget(width: 35, height: 35),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                SchemaWidget(width: 20, height: 15),
                              ],
                            ),
                            SchemaWidget(width: 25, height: 15),
                            SchemaWidget(width: 25, height: 15),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                SchemaWidget(width: 25, height: 15),
                                SchemaWidget(width: 20, height: 20),
                              ],
                            )
                          ],
                        )),
                  )
                      .animate(onPlay: (controller) => controller.repeat())
                      .shimmer(
                          angle: 1,
                          color: Colors.grey.withOpacity(0.2),
                          duration: const Duration(seconds: 1),
                          delay: const Duration(seconds: 1));
                },
              )
            : control.filteredreclasses!.isNotEmpty
                ? GridView.builder(
                    padding:
                        const EdgeInsets.only(top: 10, left: 40, right: 40),
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 5,
                            crossAxisSpacing: 20.0,
                            mainAxisSpacing: 20.0,
                            childAspectRatio: 1.1),
                    itemCount: control.filteredreclasses!.length,
                    itemBuilder: (context, index) {
                      return HoverScaleCard(
                        child: GestureDetector(
                          onTap: () {
                            arName.text =
                                "${control.filteredreclasses![index].name}";
                            enName.text =
                                "${control.filteredreclasses![index].enName}";
                            driveUrl.text =
                                "${control.filteredreclasses![index].driveUrl}";
                            control.selectCurriculumsForClass(
                                control.filteredreclasses![index].curriculum);
                            Get.dialog(GetBuilder<ClassMgmtController>(
                                builder: (controllers) {
                              return VMSAlertDialog(
                                action: [
                                  ButtonDialog(
                                    text: "Edit".tr,
                                    onPressed: () async {
                                      bool isArNameEmpty =
                                          arName.text.trim().isEmpty;
                                      bool isEnNameEmpty = enName.text.isEmpty;
                                      bool isDriveEmpty =
                                          driveUrl.text.trim().isEmpty;

                                      controllers.updateFieldError(
                                          "arname", isArNameEmpty);
                                      controllers.updateFieldError(
                                          "enname", isEnNameEmpty);
                                      controllers.updateFieldError(
                                          "drive", isDriveEmpty);

                                      if (!(isArNameEmpty ||
                                          isEnNameEmpty ||
                                          isDriveEmpty)) {
                                        await Edit_Class_API(context)
                                            .Edit_Class(
                                          name: arName.text,
                                          enName: enName.text,
                                          driveUrl: driveUrl.text,
                                          classId: control
                                              .filteredreclasses![index].id,
                                          curriculum:
                                              control.selectedCurriculums,
                                        );

                                        arName.clear();
                                        enName.clear();
                                        driveUrl.clear();
                                        Get.back();
                                      }
                                    },
                                    color: Theme.of(context).primaryColor,
                                    width: 120,
                                  ),
                                ],
                                contents: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        Textfildwithupper(
                                          isError: controllers.IsEnnameError,
                                          isRequired: true,
                                          onChanged: (value) {
                                            if (value.isNotEmpty) {
                                              controllers.updateFieldError(
                                                  "enname", false);
                                            }
                                          },
                                          width: 250,
                                          controller: enName,
                                          Uptext: "Class En - Name".tr,
                                          hinttext: "Class En - Name".tr,
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.only(
                                              left: 15.0,
                                              right: 15.0,
                                              bottom: 15.0),
                                          child: Textfildwithupper(
                                            isError: controllers.IsArnameError,
                                            isRequired: true,
                                            onChanged: (value) {
                                              if (value.isNotEmpty) {
                                                controllers.updateFieldError(
                                                    "arname", false);
                                              }
                                            },
                                            width: 250,
                                            controller: arName,
                                            Uptext: "Class Ar - Name".tr,
                                            hinttext: "Class Ar - Name".tr,
                                          ),
                                        ),
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        Textfildwithupper(
                                          width: 250,
                                          controller: TextEditingController(
                                              text:
                                                  "${control.filteredreclasses![index].grade!.enName}"),
                                          Uptext: "Grade".tr,
                                          hinttext: "Grade".tr,
                                          readOnly: true,
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.only(
                                              left: 15.0, right: 15.0),
                                          child: Textfildwithupper(
                                            width: 250,
                                            controller: TextEditingController(
                                                text:
                                                    "${control.filteredreclasses![index].session!.year}"),
                                            Uptext: "Session".tr,
                                            hinttext: "Session".tr,
                                            readOnly: true,
                                          ),
                                        ),
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.only(
                                              top: 15.0, bottom: 15.0),
                                          child: Textfildwithupper(
                                            width: 250,
                                            controller: TextEditingController(
                                                text:
                                                    "${control.filteredreclasses![index].admin!.userName}"),
                                            Uptext: "Admin Account".tr,
                                            hinttext: "Admin Account".tr,
                                            readOnly: true,
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.only(
                                              top: 15.0, bottom: 15.0),
                                          child: Padding(
                                            padding: const EdgeInsets.only(
                                                left: 15.0, right: 15),
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          bottom: 5.0),
                                                  child: Text("Curriculums".tr),
                                                ),
                                                GestureDetector(
                                                  onTap: () =>
                                                      Class_Curriculm_Funcation(
                                                          context),
                                                  child: Container(
                                                    padding: EdgeInsets.only(
                                                        left: 5.0, right: 5.0),
                                                    width: 250,
                                                    height: 40,
                                                    decoration: controllers
                                                            .IscurrError
                                                        ? BoxDecoration(
                                                            border: Border.all(
                                                              color: Colors
                                                                  .red, // تغيير لون الحدود حسب حالة الخطأ
                                                            ),
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        5),
                                                          )
                                                        : BoxDecoration(
                                                            border: Border.all(
                                                              color: Color(
                                                                  0xffB3B3B3), // تغيير لون الحدود حسب حالة الخطأ
                                                            ),
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        5),
                                                          ),
                                                    child: Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceBetween,
                                                      children: [
                                                        GetBuilder<
                                                                ClassMgmtController>(
                                                            builder:
                                                                (controller) {
                                                          return Expanded(
                                                            child: Text(
                                                              maxLines: 1,
                                                              overflow:
                                                                  TextOverflow
                                                                      .ellipsis,
                                                              style: Theme.of(
                                                                      context)
                                                                  .textTheme
                                                                  .bodyMedium,
                                                              controller
                                                                      .selectedCurriculumNames
                                                                      .isNotEmpty
                                                                  ? Get.find<
                                                                          ClassMgmtController>()
                                                                      .selectedCurriculumNames
                                                                      .join(
                                                                          ', ')
                                                                  : 'No selected curriculum'
                                                                      .tr, // هنا نعرض رسالة "لا يوجد مناهج مختارة" إذا كانت القائمة فارغة.
                                                            ),
                                                          );
                                                        }),
                                                        const Icon(Icons
                                                            .arrow_drop_down),
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        Textfildwithupper(
                                          isError: controllers.IsDriveError,
                                          isRequired: true,
                                          onChanged: (value) {
                                            if (value.isNotEmpty) {
                                              controllers.updateFieldError(
                                                  "drive", false);
                                            }
                                          },
                                          width: 480,
                                          controller: driveUrl,
                                          Uptext: "Drive URL".tr,
                                          hinttext: "Drive URL".tr,
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.only(
                                              left: 5.0, top: 36.0),
                                          child: SvgPicture.asset(
                                            "../../images/drive.svg",
                                            width: 25,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                                apptitle: "Edit Class".tr,
                                subtitle: "none",
                              );
                            }));
                          },
                          child: Container(
                              padding: const EdgeInsets.all(20),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5),
                                  border: Border.all(
                                      color: Colors.grey, width: 0.5),
                                  color: Theme.of(context).cardColor,
                                  boxShadow: const [
                                    BoxShadow(
                                        color: Colors.black26,
                                        offset: Offset(0, 2),
                                        blurRadius: 1)
                                  ]),
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  control.filteredreclasses![index]
                                              .hasStudent ==
                                          false
                                      ? Container(
                                          width: 35,
                                          height: 35,
                                          decoration: BoxDecoration(
                                              color:
                                                  Theme.of(context).cardColor,
                                              borderRadius:
                                                  BorderRadius.circular(5),
                                              boxShadow: const [
                                                BoxShadow(
                                                    color: Colors.black12,
                                                    offset: Offset(0, 2),
                                                    blurRadius: 1)
                                              ]),
                                          child: IconButton(
                                              style: const ButtonStyle(
                                                  backgroundColor:
                                                      WidgetStatePropertyAll(
                                                          Color(0xffB03D3D)),
                                                  shape: WidgetStatePropertyAll(
                                                      RoundedRectangleBorder(
                                                          borderRadius:
                                                              BorderRadius.all(
                                                                  Radius
                                                                      .circular(
                                                                          5))))),
                                              onPressed: () {
                                                Get.dialog(VMSAlertDialog(
                                                    action: [
                                                      ButtonDialog(
                                                          text: "Delete".tr,
                                                          onPressed: () async {
                                                            await Delete_Class_API(
                                                                    context)
                                                                .Delete_Class(
                                                                    classId: control
                                                                        .filteredreclasses![
                                                                            index]
                                                                        .id,
                                                                    index:
                                                                        index);
                                                            Get.back();
                                                          },
                                                          color: const Color(
                                                              0xffB03D3D),
                                                          width: 80),
                                                      ButtonDialog(
                                                          text: "Cancel".tr,
                                                          onPressed: () {
                                                            Get.back();
                                                          },
                                                          color:
                                                              Theme.of(context)
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
                                                              "Do You Want To Deleteclass"
                                                                      .tr +
                                                                  " (${prefs!.getString(languageKey) == 'ar'?control.filteredreclasses![index].name:control.filteredreclasses![index].enName}) " +
                                                                  "Classs".tr,
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
                                                    apptitle: "Delete Class".tr,
                                                    subtitle: "none"));
                                              },
                                              icon: const Icon(VMS_Icons.bin,
                                                  size: 16,
                                                  color: Colors.white)),
                                        )
                                      : Text(""),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Text(
                                          prefs!.getString(languageKey) == 'ar'
                                              ? "${control.filteredreclasses![index].name}"
                                              : "${control.filteredreclasses![index].enName}",
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodyMedium!
                                              .copyWith(
                                                fontSize: 20,
                                              )),
                                    ],
                                  ),
                                  Text(
                                      prefs!.getString(languageKey) == 'ar'
                                          ? "${control.filteredreclasses![index].grade!.name}"
                                          : "${control.filteredreclasses![index].grade!.enName}",
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyMedium!),
                                  Text(
                                      "${control.filteredreclasses![index].session!.year}",
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyMedium!),
                                  Expanded(
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text("Drive URL".tr,
                                            style: Theme.of(context)
                                                .textTheme
                                                .bodyMedium!
                                                .copyWith(
                                                  fontSize: 16,
                                                )),
                                        SvgPicture.asset(
                                          "../../images/drive.svg",
                                          width: 20,
                                        )
                                      ],
                                    ),
                                  )
                                ],
                              )),
                        ),
                      );
                    },
                  )
                : Center(
                    child: Text("No Classes".tr,
                        style: Theme.of(context).textTheme.titleLarge!.copyWith(
                            fontSize: 22, fontWeight: FontWeight.normal)));
      }),
    );
  }
}
