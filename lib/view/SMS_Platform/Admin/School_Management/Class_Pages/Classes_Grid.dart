import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:get/get.dart';
import 'package:vms_school/Icons_File/v_m_s__icons_icons.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:vms_school/Link/API/AdminAPI/School/School_Screen_APIs/Class_API/Delete_Class_API.dart';
import 'package:vms_school/Link/Controller/AdminController/School_Controllers/Class_Mgmt_Controller.dart';
import 'package:vms_school/Translate/local_controller.dart';
import 'package:vms_school/view/SMS_Platform/Admin/School_Management/Class_Pages/Edit_Class.dart';
import 'package:vms_school/view/Both_Platform/widgets/ButtonsDialog.dart';
import 'package:vms_school/view/Both_Platform/widgets/GridAnimation.dart';
import 'package:vms_school/view/Both_Platform/widgets/Schema_Widget.dart';
import 'package:vms_school/view/Both_Platform/widgets/VMSAlertDialog.dart';

class ClassGrid extends StatelessWidget {
  ClassGrid({super.key});

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

    return Directionality(
      textDirection:
          Get.find<LocalizationController>().currentLocale.value.languageCode ==
                  'ar'
              ? TextDirection.rtl
              : TextDirection.ltr,
      child: GetBuilder<ClassMgmtController>(builder: (control) {
        return control.isLoading == true
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
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: getCrossAxisCount(),
                        crossAxisSpacing: 20.0,
                        mainAxisSpacing: 20.0,
                        childAspectRatio: getChildAspectRatio()),
                    itemCount: control.filteredreclasses!.length,
                    itemBuilder: (context, index) {
                      return HoverScaleCard(
                        child: GestureDetector(
                          onTap: () {
                            control.selectCurriculumsForClass(
                                control.filteredreclasses![index].curriculum);
                            Get.dialog(
                              Edit_Class(
                                id: control.filteredreclasses![index].id!,
                                arName: control.filteredreclasses![index].name!,
                                enName:
                                    control.filteredreclasses![index].enName!,
                                driveUrl:
                                    control.filteredreclasses![index].driveUrl!,
                                username: control
                                    .filteredreclasses![index].admin!.userName!,
                                year: control
                                    .filteredreclasses![index].session!.year!,
                              ),
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
                                                            Delete_Class_API(
                                                                    context)
                                                                .Delete_Class(
                                                                    classId: control
                                                                        .filteredreclasses![
                                                                            index]
                                                                        .id,
                                                                    index:
                                                                        index);
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
                                                                  " (${Get.find<LocalizationController>().currentLocale.value.languageCode == 'ar' ? control.filteredreclasses![index].name : control.filteredreclasses![index].enName}) " +
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
                                          Get.find<LocalizationController>()
                                                      .currentLocale
                                                      .value
                                                      .languageCode ==
                                                  'ar'
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
                                      Get.find<LocalizationController>()
                                                  .currentLocale
                                                  .value
                                                  .languageCode ==
                                              'ar'
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
                                          "assets/images/drive.svg",
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
