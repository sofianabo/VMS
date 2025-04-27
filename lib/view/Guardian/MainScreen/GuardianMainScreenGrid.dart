import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:get/get.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:vms_school/Icons_File/v_m_s__icons_icons.dart';
import 'package:vms_school/Link/API/API.dart';
import 'package:vms_school/Link/API/AdminAPI/School/School_Screen_APIs/Curriculm_API/Delete_Curriculm_API.dart';
import 'package:vms_school/Link/API/DownloadFiles.dart';
import 'package:vms_school/Link/Controller/GuardianController/GuardianMainScreenController.dart';
import 'package:vms_school/Link/Controller/WidgetController/DropDown_Controllers/DropDownCurriculumn_Controller.dart';
import 'package:vms_school/Translate/local_controller.dart';
import 'package:vms_school/main.dart';
import 'package:vms_school/widgets/ButtonsDialog.dart';
import 'package:vms_school/widgets/GridAnimation.dart';
import 'package:vms_school/widgets/PDF_View.dart';
import 'package:vms_school/widgets/Schema_Widget.dart';
import 'package:vms_school/widgets/VMSAlertDialog.dart';

class GuardianMainScreenGrid extends StatelessWidget {
  const GuardianMainScreenGrid({super.key});

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
      if (screenWidth >= 1132) return 0.75;

      if (screenWidth >= 1070) return 0.9;
      if (screenWidth >= 950) return 0.87;
      if (screenWidth >= 838) return 1.2;
      if (screenWidth >= 769) return 1.05;
      if (screenWidth >= 620) return 0.8;
      if (screenWidth >= 539) return 1.4;
      return 0.85;
    }

    return Directionality(
      textDirection: prefs!.getString(languageKey) == "ar"
          ? TextDirection.rtl
          : TextDirection.ltr,
      child: GetBuilder<Guardianmainscreencontroller>(builder: (control) {
        return
            //  control.isLoading
            //     ? GridView.builder(
            //         padding: const EdgeInsets.only(top: 10, left: 40, right: 40),
            //         gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            //             crossAxisCount: getCrossAxisCount(),
            //             crossAxisSpacing: 20.0,
            //             mainAxisSpacing: 20.0,
            //             childAspectRatio: getChildAspectRatio()),
            //         itemCount: 8,
            //         itemBuilder: (context, index) {
            //           return HoverScaleCard(
            //             child: Container(
            //                 padding: const EdgeInsets.all(20),
            //                 decoration: BoxDecoration(
            //                     borderRadius: BorderRadius.circular(5),
            //                     border: Border.all(color: Colors.grey, width: 0.5),
            //                     color: Theme.of(context).cardColor,
            //                     boxShadow: const [
            //                       BoxShadow(
            //                           color: Colors.black26,
            //                           offset: Offset(0, 2),
            //                           blurRadius: 1)
            //                     ]),
            //                 child: Column(
            //                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //                   crossAxisAlignment: CrossAxisAlignment.start,
            //                   children: [
            //                     Expanded(
            //                         child: SchemaWidget(width: 500, height: 150)),
            //                     Row(
            //                       mainAxisAlignment: MainAxisAlignment.center,
            //                       crossAxisAlignment: CrossAxisAlignment.center,
            //                       children: [
            //                         Padding(
            //                             padding: const EdgeInsets.only(
            //                                 top: 5.0, bottom: 5.0),
            //                             child:
            //                                 SchemaWidget(width: 145, height: 20)),
            //                       ],
            //                     ),
            //                     Row(
            //                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //                       children: [
            //                         Column(
            //                           crossAxisAlignment: CrossAxisAlignment.start,
            //                           mainAxisAlignment: MainAxisAlignment.start,
            //                           children: [
            //                             SchemaWidget(width: 145, height: 20),
            //                             Padding(
            //                               padding: const EdgeInsets.only(
            //                                   top: 5.0, bottom: 5.0),
            //                               child:
            //                                   SchemaWidget(width: 145, height: 20),
            //                             ),
            //                             SchemaWidget(width: 145, height: 20),
            //                           ],
            //                         ),
            //                         SchemaWidget(width: 40, height: 40)
            //                       ],
            //                     )
            //                   ],
            //                 )),
            //           );
            //         },
            //       ).animate(onPlay: (controller) => controller.repeat()).shimmer(
            //         angle: 1,
            //         color: Colors.grey.withOpacity(0.2),
            //         duration: const Duration(seconds: 1),
            //         delay: const Duration(seconds: 1))
            //     : control.filteredCurriculum.isNotEmpty
            //         ?
            GridView.builder(
          padding: const EdgeInsets.only(top: 10, left: 40, right: 40),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: getCrossAxisCount(),
              crossAxisSpacing: 20.0,
              mainAxisSpacing: 20.0,
              childAspectRatio: getChildAspectRatio()),
          itemCount: 10, //control.filteredCurriculum.length
          itemBuilder: (context, index) {
            return HoverScaleCard(
              child: GestureDetector(
                onTap: () async {},
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
                      spacing: 10,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // control.filteredStudents[index].fileId !=
                        //                   null
                        //               ?
                        Center(
                          child: FutureBuilder(
                            future: precacheImage(
                              NetworkImage(
                                  ""), //$getimage${control.filteredStudents[index].fileId}
                              context,
                            ),
                            builder: (context, snapshot) {
                              if (snapshot.connectionState ==
                                  ConnectionState.done) {
                                return CircleAvatar(
                                  maxRadius: 60,
                                  backgroundColor: const Color(0xffC4C4C4),
                                  backgroundImage: NetworkImage(
                                      ""), //$getimage${control.filteredStudents[index].fileId}
                                );
                              } else {
                                return CircleAvatar(
                                  maxRadius: 60,
                                  backgroundColor: const Color(0xffC4C4C4),
                                  child: LoadingAnimationWidget.inkDrop(
                                    color: Theme.of(context).primaryColor,
                                    size: 30,
                                  ),
                                );
                              }
                            },
                          ),
                        ),
                        // : CircleAvatar(
                        //     maxRadius: 60,
                        //     backgroundColor:
                        //         const Color(0xffC4C4C4),
                        //     child: Text(
                        //       control.filteredStudents[index]
                        //           .fullName!
                        //           .substring(0, 1)
                        //           .toUpperCase(),
                        //       style: Get.textTheme.titleLarge!
                        //           .copyWith(
                        //         fontSize: 26,
                        //         fontWeight: FontWeight.bold,
                        //       ),
                        //     ),
                        //   ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Expanded(
                              child: Padding(
                                padding: const EdgeInsets.only(
                                    top: 5.0, bottom: 5.0),
                                child: Center(
                                  child: Text(
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                      prefs!.getString(languageKey) == "ar"
                                          ? "الاسم العربي" //"${control.filteredCurriculum[index].name}"
                                          : "english name", //"${control.filteredCurriculum[index].enName}"
                                      style: Get.theme.textTheme.titleLarge!
                                          .copyWith(fontSize: 18)),
                                ),
                              ),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text("the fisrt class".tr
                                    // + " ${control.filteredCurriculum[index].maxMark}"
                                    ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                      top: 5.0, bottom: 5.0),
                                  child: Text("the first division"
                                          .tr //  + " ${control.filteredCurriculum[index].passingMark}"
                                      ),
                                ),
                              ],
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              width: 35,
                              height: 35,
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
                                          Get.theme.primaryColor),
                                      shape: WidgetStatePropertyAll(
                                          RoundedRectangleBorder(
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(5))))),
                                  onPressed: () {},
                                  icon: const Icon(VMS_Icons.bin,
                                      size: 16, color: Colors.white)),
                            ),
                            Container(
                              width: 35,
                              height: 35,
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
                                          Get.theme.primaryColor),
                                      shape: WidgetStatePropertyAll(
                                          RoundedRectangleBorder(
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(5))))),
                                  onPressed: () {},
                                  icon: const Icon(VMS_Icons.bin,
                                      size: 16, color: Colors.white)),
                            ),
                            Container(
                              width: 35,
                              height: 35,
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
                                          Get.theme.primaryColor),
                                      shape: WidgetStatePropertyAll(
                                          RoundedRectangleBorder(
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(5))))),
                                  onPressed: () {},
                                  icon: const Icon(VMS_Icons.bin,
                                      size: 16, color: Colors.white)),
                            ),
                            Container(
                              width: 35,
                              height: 35,
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
                                          Get.theme.primaryColor),
                                      shape: WidgetStatePropertyAll(
                                          RoundedRectangleBorder(
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(5))))),
                                  onPressed: () {},
                                  icon: const Icon(VMS_Icons.bin,
                                      size: 16, color: Colors.white)),
                            ),
                          ],
                        ),
                      ],
                    )),
              ),
            );
          },
        );
        // : Center(
        //     child: Text("No Curriculum".tr,
        //         style: Theme.of(context).textTheme.titleLarge!.copyWith(
        //             fontSize: 22, fontWeight: FontWeight.normal)));
      }),
    );
  }
}
