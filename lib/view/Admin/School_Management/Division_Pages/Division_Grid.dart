import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:get/get.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:vms_school/Icons_File/v_m_s__icons_icons.dart';
import 'package:vms_school/Link/API/AdminAPI/School/School_Screen_APIs/Division_API/Delete_Division_API.dart';
import 'package:vms_school/Link/API/AdminAPI/School/School_Screen_APIs/Division_API/Edit_Division_API.dart';
import 'package:vms_school/Link/Controller/AdminController/Years_Controllers/Divisions_Controller.dart';
import 'package:vms_school/Translate/local_controller.dart';
import 'package:vms_school/main.dart';
import 'package:vms_school/widgets/ButtonsDialog.dart';
import 'package:vms_school/widgets/GridAnimation.dart';
import 'package:vms_school/widgets/Schema_Widget.dart';
import 'package:vms_school/widgets/TextFildWithUpper.dart';
import 'package:vms_school/widgets/VMSAlertDialog.dart';

class DivisionGrid extends StatelessWidget {
  DivisionGrid({super.key});

  TextEditingController arName = TextEditingController();
  TextEditingController enName = TextEditingController();
  TextEditingController meetUrl = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    int getCrossAxisCount() {
      if (screenWidth >= 1278) return 5;
      if (screenWidth >= 1070) return 4;
      if (screenWidth >= 950) return 3;
      if (screenWidth >= 769) return 2;
      return 1;
    }

    double getChildAspectRatio() {
      if (screenWidth >= 1070) return 1.1;
      if (screenWidth >= 950) return 1.1;
      if (screenWidth >= 838) return 1.6;
      if (screenWidth >= 769) return 1.5;
      if (screenWidth >= 539) return 2.2;
      return 1.7;
    }

    Edit_Division(String gradeid, String name) {
      return GetBuilder<Divisions_Controller>(builder: (controller) {
        return VMSAlertDialog(
          action: [
            ButtonDialog(
              text: "Edit".tr,
              onPressed: () async {
                bool isArNameEmpty = arName.text.isEmpty;
                bool isEnNameEmpty = enName.text.isEmpty;
                bool isDriveEmpty = meetUrl.text.isEmpty;

                controller.updateFieldError("ename", isEnNameEmpty);
                controller.updateFieldError("arname", isArNameEmpty);
                controller.updateFieldError("meet", isDriveEmpty);

                if (!(isArNameEmpty || isEnNameEmpty || isDriveEmpty)) {
                  await Edit_Division_API(context).Edit_Division(
                    name: arName.text,
                    enName: enName.text,
                    gradeId: gradeid,
                    meeturl: meetUrl.text,
                  );
                  Get.back();
                }
              },
              color: Theme.of(context).primaryColor,
              width: 120,
            ),
          ],
          contents: Container(
            width: 540,
            child: SingleChildScrollView(
              child: Wrap(
                alignment: WrapAlignment.center,
                runAlignment: WrapAlignment.center,
                crossAxisAlignment: WrapCrossAlignment.center,
                runSpacing: 10.0,
                spacing: 10.0,
                children: [
                  Wrap(
                    alignment: WrapAlignment.center,
                    runAlignment: WrapAlignment.center,
                    crossAxisAlignment: WrapCrossAlignment.center,
                    runSpacing: 10.0,
                    spacing: 10.0,
                    children: [
                      Textfildwithupper(
                        isError: controller.IsennameError,
                        isRequired: true,
                        onChanged: (value) {
                          if (value.isNotEmpty) {
                            controller.updateFieldError("ename", false);
                          }
                        },
                        width: 250,
                        controller: enName,
                        Uptext: "Division En - Name".tr,
                        hinttext: "Division En - Name".tr,
                      ),
                      Textfildwithupper(
                        isError: controller.IsarnameError,
                        isRequired: true,
                        onChanged: (value) {
                          if (value.isNotEmpty) {
                            controller.updateFieldError("arname", false);
                          }
                        },
                        width: 250,
                        controller: arName,
                        Uptext: "Division Ar - Name".tr,
                        hinttext: "Division Ar - Name".tr,
                      ),
                    ],
                  ),
                  Wrap(
                    alignment: WrapAlignment.center,
                    runAlignment: WrapAlignment.center,
                    crossAxisAlignment: WrapCrossAlignment.center,
                    runSpacing: 10.0,
                    spacing: 10.0,
                    children: [
                      Textfildwithupper(
                        readOnly: true,
                        width: 250,
                        controller: TextEditingController(text: name),
                        Uptext: "Class".tr,
                        hinttext: "Class".tr,
                      ),
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        spacing: 10.0,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Textfildwithupper(
                            isError: controller.IsmeetError,
                            isRequired: true,
                            onChanged: (value) {
                              if (value.isNotEmpty) {
                                controller.updateFieldError("meet", false);
                              }
                            },
                            width: 215,
                            controller: meetUrl,
                            Uptext: "Meet URL".tr,
                            hinttext: "Meet URL".tr,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 36.0),
                            child: SvgPicture.asset(
                              "assets/images/meet.svg",
                              width: 25,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          apptitle: "Edit Division".tr,
          subtitle: "none",
        );
      });
    }

    return Directionality(
      textDirection: prefs!.getString(languageKey) == "ar"
          ? TextDirection.rtl
          : TextDirection.ltr,
      child: GetBuilder<Divisions_Controller>(builder: (control) {
        return control.Isapiloading == true
            ? GridView.builder(
                padding: const EdgeInsets.only(top: 10, left: 40, right: 40),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: getCrossAxisCount(),
                    crossAxisSpacing: 20.0,
                    mainAxisSpacing: 20.0,
                    childAspectRatio: getChildAspectRatio()),
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
                                SchemaWidget(width: 30, height: 15),
                              ],
                            ),
                            SchemaWidget(width: 30, height: 15),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                SchemaWidget(width: 30, height: 15),
                                SchemaWidget(width: 25, height: 25),
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
            : control.filteredDivision!.isNotEmpty
                ? GridView.builder(
                    padding:
                        const EdgeInsets.only(top: 10, left: 40, right: 40),
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: getCrossAxisCount(),
                        crossAxisSpacing: 20.0,
                        mainAxisSpacing: 20.0,
                        childAspectRatio: getChildAspectRatio()),
                    itemCount: control.filteredDivision!.length,
                    itemBuilder: (context, index) {
                      return HoverScaleCard(
                        child: GestureDetector(
                          onTap: () {
                            control.updateFieldError("ename", false);
                            control.updateFieldError("arname", false);
                            control.updateFieldError("meet", false);
                            arName.text =
                                "${control.filteredDivision![index].name}";
                            enName.text =
                                "${control.filteredDivision![index].enName}";
                            meetUrl.text =
                                "${control.filteredDivision![index].meetUrl}";
                            Get.dialog(
                              Edit_Division(
                                  control.filteredDivision![index].id
                                      .toString(),
                                  control.filteredDivision![index].classes!
                                      .enName!),
                              barrierDismissible: false,
                            );
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
                                  control.filteredDivision![index].hasStudent ==
                                          true
                                      ? const Text("")
                                      : Container(
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
                                                            await Delete_Division_API(
                                                                    context)
                                                                .Delete_Division(
                                                                    index:
                                                                        index,
                                                                    Id: control
                                                                        .filteredDivision![
                                                                            index]
                                                                        .id);
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
                                                              "Do You Want To Deletediv"
                                                                      .tr +
                                                                  " (${prefs!.getString(languageKey) == "ar" ? control.filteredDivision![index].name : control.filteredDivision![index].enName} ) " +
                                                                  "Divisionn"
                                                                      .tr,
                                                              style: Theme.of(
                                                                      context)
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
                                                        "Delete Division".tr,
                                                    subtitle: "none"));
                                              },
                                              icon: const Icon(VMS_Icons.bin,
                                                  size: 16,
                                                  color: Colors.white)),
                                        ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Text(
                                          "${prefs!.getString(languageKey) == "ar" ? control.filteredDivision![index].name : control.filteredDivision![index].enName}",
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodyMedium!
                                              .copyWith(
                                                fontSize: 20,
                                              )),
                                    ],
                                  ),
                                  Text(
                                      "${prefs!.getString(languageKey) == "ar" ? control.filteredDivision![index].classes!.name : control.filteredDivision![index].classes!.enName}",
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyMedium!
                                          .copyWith(
                                            fontSize: 14,
                                          )),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text("Meet URL".tr,
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodyMedium!
                                              .copyWith(
                                                fontSize: 16,
                                              )),
                                      SvgPicture.asset(
                                        "assets/images/meet.svg",
                                        width: 20,
                                      )
                                    ],
                                  )
                                ],
                              )),
                        ),
                      );
                    },
                  )
                : Center(
                    child: Text("No Divisions".tr,
                        style: Theme.of(context).textTheme.titleLarge!.copyWith(
                            fontSize: 22, fontWeight: FontWeight.normal)));
      }),
    );
  }
}
