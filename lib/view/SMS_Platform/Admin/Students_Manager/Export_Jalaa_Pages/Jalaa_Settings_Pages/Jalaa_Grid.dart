import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:get/get.dart';
import 'package:vms_school/Icons_File/v_m_s__icons_icons.dart';
import 'package:vms_school/Link/Controller/AdminController/Students_Controllers/Jalaa_For_Students/Jalaa_Page_Controller.dart';
import 'package:vms_school/Translate/local_controller.dart';
import 'package:vms_school/view/Both_Platform/widgets/ButtonsDialog.dart';
import 'package:vms_school/view/Both_Platform/widgets/GridAnimation.dart';
import 'package:vms_school/view/Both_Platform/widgets/Schema_Widget.dart';
import 'package:vms_school/view/Both_Platform/widgets/VMSAlertDialog.dart';

class All_Jalaas_Grid extends StatelessWidget {
  const All_Jalaas_Grid({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    int getCrossAxisCount() {
      if (screenWidth >= 1132) return 4;
      if (screenWidth >= 950) return 3;
      if (screenWidth >= 620) return 2;
      return 1;
    }

    double getChildAspectRatio() {
      if (screenWidth >= 1070) return 0.9;
      if (screenWidth >= 950) return 0.9;
      if (screenWidth >= 838) return 1.4;
      if (screenWidth >= 769) return 1.3;
      if (screenWidth >= 620) return 1.0;
      if (screenWidth >= 539) return 1.5;
      return 1.3;
    }

    return Directionality(
      textDirection:
          Get.find<LocalizationController>().currentLocale.value.languageCode ==
                  'ar'
              ? TextDirection.rtl
              : TextDirection.ltr,
      child: GetBuilder<Jalaa_Page_Controller>(builder: (control) {
        return control.isLoading
            ? GridView.builder(
                padding: const EdgeInsets.only(top: 10, left: 40, right: 40),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: getCrossAxisCount(),
                    crossAxisSpacing: 20.0,
                    mainAxisSpacing: 20.0,
                    childAspectRatio: getChildAspectRatio()),
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
                            Expanded(
                                child: SchemaWidget(width: 500, height: 150)),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Padding(
                                    padding: const EdgeInsets.only(
                                        top: 5.0, bottom: 5.0),
                                    child:
                                        SchemaWidget(width: 145, height: 20)),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    SchemaWidget(width: 145, height: 20),
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          top: 5.0, bottom: 5.0),
                                      child:
                                          SchemaWidget(width: 145, height: 20),
                                    ),
                                    SchemaWidget(width: 145, height: 20),
                                  ],
                                ),
                                SchemaWidget(width: 40, height: 40)
                              ],
                            )
                          ],
                        )),
                  );
                },
              ).animate(onPlay: (controller) => controller.repeat()).shimmer(
                angle: 1,
                color: Colors.grey.withOpacity(0.2),
                duration: const Duration(seconds: 1),
                delay: const Duration(seconds: 1))
            : control.filteredCurriculum.isNotEmpty
                ? GridView.builder(
                    padding:
                        const EdgeInsets.only(top: 10, left: 40, right: 40),
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: getCrossAxisCount(),
                        crossAxisSpacing: 20.0,
                        mainAxisSpacing: 20.0,
                        childAspectRatio: getChildAspectRatio()),
                    itemCount: control.filteredCurriculum.length,
                    itemBuilder: (context, index) {
                      return HoverScaleCard(
                        child: GestureDetector(
                          onTap: () async {},
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
                                  Expanded(
                                      child: SizedBox(
                                          width: 500,
                                          child: Image.asset("name"))),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Expanded(
                                        child: Padding(
                                          padding: const EdgeInsets.only(
                                              top: 5.0, bottom: 5.0),
                                          child: Center(
                                            child: Text("data"),
                                            //
                                            // Text(
                                            //     maxLines: 1,
                                            //     overflow: TextOverflow.ellipsis,
                                            //     Get.find<LocalizationController>()
                                            //         .currentLocale
                                            //         .value
                                            //         .languageCode ==
                                            //         'ar'
                                            //         ? "${control.filteredCurriculum[index].name}"
                                            //         : "${control.filteredCurriculum[index].enName}",
                                            //     style: Get
                                            //         .theme.textTheme.titleLarge!
                                            //         .copyWith(fontSize: 18))
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          Text("Max Mark :".tr + "sdf"),
                                        ],
                                      ),
                                      Container(
                                        width: 35,
                                        height: 35,
                                        decoration: BoxDecoration(
                                            color: Theme.of(context).cardColor,
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
                                                                Radius.circular(
                                                                    5))))),
                                            onPressed: () {
                                              Get.dialog(VMSAlertDialog(
                                                  action: [
                                                    ButtonDialog(
                                                        text: "Delete".tr,
                                                        onPressed: () {
                                                          // Delete_Curriculm_API(
                                                          //         context)
                                                          //     .Delete_Curriculm(
                                                          //         cid: control
                                                          //             .filteredCurriculum[
                                                          //                 index]
                                                          //             .id);
                                                        },
                                                        color: const Color(
                                                            0xffB03D3D),
                                                        width: 80),
                                                    ButtonDialog(
                                                        text: "Cancel".tr,
                                                        onPressed: () {
                                                          Get.back();
                                                        },
                                                        color: Theme.of(context)
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
                                                          //   Text(
                                                          //     "Do You Want To Deletecur"
                                                          //             .tr +
                                                          //         " ( ${Get.find<LocalizationController>().currentLocale.value.languageCode == 'ar' ? control.filteredCurriculum[index].name : control.filteredCurriculum[index].enName} ) " +
                                                          //         "Curriculumm"
                                                          //             .tr,
                                                          //     style: Get
                                                          //         .theme
                                                          //         .textTheme
                                                          //         .bodyMedium!
                                                          //         .copyWith(
                                                          //             fontSize:
                                                          //                 16,
                                                          //             fontWeight:
                                                          //                 FontWeight
                                                          //                     .normal),
                                                          //   ),
                                                        ],
                                                      ),
                                                    ],
                                                  ),
                                                  apptitle:
                                                      "Delete Curriculum".tr,
                                                  subtitle: "none"));
                                            },
                                            icon: const Icon(VMS_Icons.bin,
                                                size: 16, color: Colors.white)),
                                      ),
                                    ],
                                  )
                                ],
                              )),
                        ),
                      );
                    },
                  )
                : Center(
                    child: Text("No Jalaas Yet".tr,
                        style: Theme.of(context).textTheme.titleLarge!.copyWith(
                            fontSize: 22, fontWeight: FontWeight.normal)));
      }),
    );
  }
}
