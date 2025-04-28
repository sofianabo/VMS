import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:get/get.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:vms_school/Icons_File/v_m_s__icons_icons.dart';
import 'package:vms_school/Link/API/API.dart';
import 'package:vms_school/Link/API/AdminAPI/School/School_Screen_APIs/Curriculm_API/Delete_Curriculm_API.dart';
import 'package:vms_school/Link/API/AdminAPI/Students/Students_APIs/Get_Students_Illness.dart';
import 'package:vms_school/Link/API/AdminAPI/Students/Students_APIs/Get_Students_Vaccines.dart';
import 'package:vms_school/Link/API/DownloadFiles.dart';
import 'package:vms_school/Link/Controller/AdminController/School_Controllers/Illness_Controller.dart';
import 'package:vms_school/Link/Controller/AdminController/School_Controllers/Vaccines_Controller.dart';
import 'package:vms_school/Link/Controller/AdminController/Students_Controllers/PenaltiesAndRewardsController.dart';
import 'package:vms_school/Link/Controller/GuardianController/GuardianMainScreenController.dart';
import 'package:vms_school/Link/Controller/GuardianController/MyChildren_Controller.dart';
import 'package:vms_school/Link/Controller/WidgetController/DropDown_Controllers/DropDownCurriculumn_Controller.dart';
import 'package:vms_school/Translate/local_controller.dart';
import 'package:vms_school/main.dart';
import 'package:vms_school/widgets/ButtonsDialog.dart';
import 'package:vms_school/widgets/GridAnimation.dart';
import 'package:vms_school/widgets/Guardian/ChildPenaltiesDialog.dart';
import 'package:vms_school/widgets/Guardian/ChildRewardsDialog.dart';
import 'package:vms_school/widgets/PDF_View.dart';
import 'package:vms_school/widgets/Schema_Widget.dart';
import 'package:vms_school/widgets/VMSAlertDialog.dart';

class GuardianMainScreenGrid extends StatelessWidget {
  const GuardianMainScreenGrid({super.key});

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
      if (screenWidth >= 1410) return 1.1;
      if (screenWidth >= 1278) return 0.8;
      if (screenWidth >= 1149) return 1;
      if (screenWidth >= 1070) return 0.9;
      if (screenWidth >= 920) return 0.85;
      if (screenWidth >= 906) return 0.75;
      if (screenWidth >= 769) return 1.1;
      if (screenWidth >= 616) return 1.92;
      if (screenWidth >= 527) return 1.6;
      if (screenWidth >= 400) return 1.1;

      return 1;
    }

    return Directionality(
      textDirection: prefs!.getString(languageKey) == "ar"
          ? TextDirection.rtl
          : TextDirection.ltr,
      child: GetBuilder<MyChildren_Controller>(builder: (control) {
        return control.IsLoading
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
            : control.filteredStudents.isNotEmpty
                ? GridView.builder(
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
                                  control.filteredStudents[index].fileId != null
                                      ? Center(
                                          child: FutureBuilder(
                                            future: precacheImage(
                                              NetworkImage(
                                                  "$getimage${control.filteredStudents[index].fileId}"),
                                              context,
                                            ),
                                            builder: (context, snapshot) {
                                              if (snapshot.connectionState ==
                                                  ConnectionState.done) {
                                                return CircleAvatar(
                                                  maxRadius: 60,
                                                  backgroundColor:
                                                      const Color(0xffC4C4C4),
                                                  backgroundImage: NetworkImage(
                                                      "$getimage${control.filteredStudents[index].fileId}"),
                                                );
                                              } else {
                                                return CircleAvatar(
                                                  maxRadius: 60,
                                                  backgroundColor:
                                                      const Color(0xffC4C4C4),
                                                  child: LoadingAnimationWidget
                                                      .inkDrop(
                                                    color: Theme.of(context)
                                                        .primaryColor,
                                                    size: 30,
                                                  ),
                                                );
                                              }
                                            },
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
                                        ),
                                  Expanded(
                                    child: Center(
                                      child: Text(
                                          maxLines: 1,
                                          overflow: TextOverflow.ellipsis,
                                          "${control.filteredStudents[index].fullName}",
                                          style: Get.theme.textTheme.titleLarge!
                                              .copyWith(fontSize: 18)),
                                    ),
                                  ),
                                  Padding(
                                    padding:
                                        const EdgeInsets.only(bottom: 20.0),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          prefs!.getString(languageKey) == "ar"
                                              ? "${control.filteredStudents[index].classes!.name}"
                                                  .tr
                                              : " ${control.filteredStudents[index].classes!.enName}"
                                                  .tr,
                                          style: Get.theme.textTheme.bodyMedium,
                                        ),
                                        Text(
                                          prefs!.getString(languageKey) == "ar"
                                              ? "${control.filteredStudents[index].division!.name}"
                                                  .tr
                                              : " ${control.filteredStudents[index].division!.enName}"
                                                  .tr,
                                          style: Get.theme.textTheme.bodyMedium,
                                        ),
                                      ],
                                    ),
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      PopupMenuButton<String>(
                                        tooltip: "",
                                        icon: Container(
                                          height: 40,
                                          width: 40,
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(5),
                                            color: Theme.of(context)
                                                .primaryColorLight,
                                          ),
                                          child: Icon(
                                            VMS_Icons.dose,
                                            size: 16,
                                            color: Colors.white,
                                          ),
                                        ),

                                        itemBuilder: (BuildContext context) {
                                          return [
                                            PopupMenuItem<String>(
                                              value: 'Vaccines',
                                              child: Text('Vaccines'.tr,
                                                  style: Get.theme.textTheme
                                                      .bodyMedium),
                                              onTap: () {
                                                Get.find<Vaccines_Controller>()
                                                    .initialdata();
                                                Get_Students_Vacciness_API(
                                                        context)
                                                    .Get_Students_Vacciness(
                                                        studentId: control
                                                            .filteredStudents[
                                                                index]
                                                            .id,
                                                        index_of_student:
                                                            index);
                                              },
                                            ),
                                            PopupMenuItem<String>(
                                              value: 'Illness',
                                              child: Text(
                                                'Illness'.tr,
                                                style: Get
                                                    .theme.textTheme.bodyMedium,
                                              ),
                                              onTap: () {
                                                Get.find<Illness_Controller>()
                                                    .initialdata();
                                                Get_Students_Illness_API(
                                                        context)
                                                    .Get_Students_Illness(
                                                        studentId: control
                                                            .filteredStudents[
                                                                index]
                                                            .id,
                                                        index_of_Student:
                                                            index);
                                              },
                                            ),
                                          ];
                                        },
                                        onSelected: (String value) {
                                          // Handle selection here
                                        },
                                        color:
                                            Get.theme.cardColor, // لون الخلفية
                                        shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(
                                              5), // زوايا دائرية
                                        ),
                                      ),
                                      Container(
                                        width: 40,
                                        height: 40,
                                        decoration: BoxDecoration(
                                            color: Theme.of(context)
                                                .primaryColorLight,
                                            borderRadius:
                                                BorderRadius.circular(5),
                                            boxShadow: const [
                                              BoxShadow(
                                                  color: Colors.black12,
                                                  offset: Offset(0, 2),
                                                  blurRadius: 1)
                                            ]),
                                        child: IconButton(
                                            style: ButtonStyle(
                                                backgroundColor:
                                                    WidgetStatePropertyAll(
                                                        Theme.of(context)
                                                            .primaryColorLight),
                                                shape: WidgetStatePropertyAll(
                                                    RoundedRectangleBorder(
                                                        borderRadius:
                                                            BorderRadius.all(
                                                                Radius.circular(
                                                                    5))))),
                                            onPressed: () {},
                                            icon: const Icon(Icons.access_time,
                                                size: 20, color: Colors.white)),
                                      ),
                                      Container(
                                        width: 40,
                                        height: 40,
                                        decoration: BoxDecoration(
                                            color: Theme.of(context)
                                                .primaryColorLight,
                                            borderRadius:
                                                BorderRadius.circular(5),
                                            boxShadow: const [
                                              BoxShadow(
                                                  color: Colors.black12,
                                                  offset: Offset(0, 2),
                                                  blurRadius: 1)
                                            ]),
                                        child: IconButton(
                                            style: ButtonStyle(
                                                backgroundColor:
                                                    WidgetStatePropertyAll(
                                                        Theme.of(context)
                                                            .primaryColorLight),
                                                shape: WidgetStatePropertyAll(
                                                    RoundedRectangleBorder(
                                                        borderRadius:
                                                            BorderRadius.all(
                                                                Radius.circular(
                                                                    5))))),
                                            onPressed: () {},
                                            icon: const Icon(
                                                Icons.my_library_books_outlined,
                                                size: 16,
                                                color: Colors.white)),
                                      ),
                                      PopupMenuButton<String>(
                                        tooltip: "",
                                        icon: Container(
                                          height: 40,
                                          width: 40,
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(5),
                                            color: Theme.of(context)
                                                .primaryColorLight,
                                          ),
                                          child: Icon(
                                            Icons.analytics_sharp,
                                            size: 16,
                                            color: Colors.white,
                                          ),
                                        ),

                                        itemBuilder: (BuildContext context) {
                                          return [
                                            PopupMenuItem<String>(
                                              value: 'Rewards',
                                              child: Text('Rewards'.tr,
                                                  style: Get.theme.textTheme
                                                      .bodyMedium),
                                              onTap: () {
                                                final controllers = Get.put(
                                                    Penaltiesandrewardscontroller());
                                                controllers.fetchRewards(
                                                    int.parse(control
                                                        .filteredStudents[index]
                                                        .id
                                                        .toString()));

                                                Get.dialog(
                                                  barrierDismissible: false,
                                                  Childrewardsdialog(),
                                                );
                                              },
                                            ),
                                            PopupMenuItem<String>(
                                              value: 'Penalties',
                                              child: Text(
                                                'Penalties'.tr,
                                                style: Get
                                                    .theme.textTheme.bodyMedium,
                                              ),
                                              onTap: () {
                                                final controllers = Get.put(
                                                    Penaltiesandrewardscontroller());
                                                controllers.fetchPenalties(
                                                    int.parse(control
                                                        .filteredStudents[index]
                                                        .id
                                                        .toString()));

                                                Get.dialog(
                                                  barrierDismissible: false,
                                                  Childpenaltiesdialog(),
                                                );
                                              },
                                            ),
                                          ];
                                        },
                                        onSelected: (String value) {
                                          // Handle selection here
                                        },
                                        color:
                                            Get.theme.cardColor, // لون الخلفية
                                        shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(
                                              5), // زوايا دائرية
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              )),
                        ),
                      );
                    },
                  )
                : Center(
                    child: Text("No Students".tr,
                        style: Theme.of(context).textTheme.titleLarge!.copyWith(
                            fontSize: 22, fontWeight: FontWeight.normal)));
      }),
    );
  }
}
