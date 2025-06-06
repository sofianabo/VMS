import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:vms_school/Link/API/API.dart';
import 'package:vms_school/Link/Controller/AdminController/School_Controllers/Rewards_Controller.dart';
import 'package:vms_school/Link/Controller/AdminController/Students_Controllers/PenaltiesAndRewardsController.dart';
import 'package:vms_school/Link/Controller/Teacher_Controller/My_Students_Controller.dart';
import 'package:vms_school/Translate/local_controller.dart';
import 'package:vms_school/view/SMS_Platform/Admin/School_Management/Rewards_Pages/Rewards_Dialog.dart';
import 'package:vms_school/view/Both_Platform/widgets/Admin/Admin_Students/Penality_And_Rewards_Dialog.dart';
import 'package:vms_school/view/Both_Platform/widgets/GridAnimation.dart';
import 'package:vms_school/view/Both_Platform/widgets/Schema_Widget.dart';

class TeacherMainScreenGrid extends StatelessWidget {
  const TeacherMainScreenGrid({super.key});

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
      if (screenWidth >= 630) return 1.78;
      return 0.9;
    }

    return Directionality(
      textDirection:
          Get.find<LocalizationController>().currentLocale.value.languageCode ==
                  'ar'
              ? TextDirection.rtl
              : TextDirection.ltr,
      child: GetBuilder<My_Students_Controller>(builder: (control) {
        return control.IsLoading
            ? GridView.builder(
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
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                SchemaWidget(
                                  width: 120,
                                  height: 120,
                                  radius: 60,
                                )
                              ],
                            ),
                            SchemaWidget(
                              width: 120,
                              height: 10,
                              radius: 60,
                            ),
                            Padding(
                              padding: const EdgeInsets.only(bottom: 20.0),
                              child: Column(
                                spacing: 20,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  SchemaWidget(
                                    width: 60,
                                    height: 10,
                                    radius: 60,
                                  ),
                                  SchemaWidget(
                                    width: 60,
                                    height: 10,
                                    radius: 60,
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 8.0),
                              child: SchemaWidget(
                                  width: double.infinity,
                                  height: 40,
                                  radius: 5),
                            ),
                          ],
                        )),
                  )
                      .animate(onPlay: (controller) => controller.repeat())
                      .shimmer(
                          angle: 1,
                          color: Colors.white,
                          duration: const Duration(milliseconds: 600),
                          delay: const Duration(milliseconds: 200));
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
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
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
                                                  control
                                                      .filteredStudents[index]
                                                      .fullName!
                                                      .substring(0, 1)
                                                      .toUpperCase(),
                                                  style: Get
                                                      .textTheme.titleLarge!
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
                                    "${control.filteredStudents[index].fullName}",
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodyMedium!
                                        .copyWith(
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold,
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
                                          Get.find<LocalizationController>()
                                                      .currentLocale
                                                      .value
                                                      .languageCode ==
                                                  'ar'
                                              ? "${"Class".tr}: ${control.filteredStudents[index].classes!.name}"
                                                  .tr
                                              : "${"Class".tr}: ${control.filteredStudents[index].classes!.enName}"
                                                  .tr,
                                          style: Get.theme.textTheme.bodyMedium,
                                        ),
                                        Text(
                                          Get.find<LocalizationController>()
                                                      .currentLocale
                                                      .value
                                                      .languageCode ==
                                                  'ar'
                                              ? " ${"Division".tr}: ${control.filteredStudents[index].division!.name}"
                                                  .tr
                                              : " ${"Division".tr}: ${control.filteredStudents[index].division!.enName}"
                                                  .tr,
                                          style: Get.theme.textTheme.bodyMedium,
                                        ),
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(top: 8.0),
                                    child: Builder(builder: (context) {
                                      return MaterialButton(
                                        shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(5)),
                                        child: Container(
                                          height: 35,
                                          decoration: BoxDecoration(
                                            color: Theme.of(context)
                                                .primaryColorLight,
                                            borderRadius:
                                                BorderRadius.circular(5),
                                          ),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            spacing: 15,
                                            children: [
                                              Text(
                                                "Rewards".tr,
                                                style: Get
                                                    .theme.textTheme.bodyMedium!
                                                    .copyWith(
                                                        color: Colors.white),
                                              ),
                                              FaIcon(
                                                FontAwesomeIcons.gift,
                                                color: Colors.white,
                                                size: 17,
                                              ),
                                            ],
                                          ),
                                        ),
                                        color:
                                            Theme.of(context).primaryColorLight,
                                        onPressed: () async {
                                          final RenderBox button = context
                                              .findRenderObject() as RenderBox;
                                          final RenderBox overlay =
                                              Overlay.of(context)
                                                      .context
                                                      .findRenderObject()
                                                  as RenderBox;
                                          final Offset position =
                                              button.localToGlobal(Offset.zero,
                                                  ancestor: overlay);

                                          final selected =
                                              await showMenu<String>(
                                            context: context,
                                            position: RelativeRect.fromLTRB(
                                              position.dx,
                                              position.dy + button.size.height,
                                              overlay.size.width - position.dx,
                                              0,
                                            ),
                                            color: Get.theme.cardColor,
                                            shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(5)),
                                            items: [
                                              PopupMenuItem<String>(
                                                value: 'Rewards',
                                                child: Text('Rewards'.tr,
                                                    style: Get.theme.textTheme
                                                        .bodyMedium),
                                              ),
                                              PopupMenuItem<String>(
                                                value: 'Add Rewards',
                                                child: Text('Add Rewards'.tr,
                                                    style: Get.theme.textTheme
                                                        .bodyMedium),
                                              ),
                                            ],
                                          );

                                          if (selected == 'Rewards') {
                                            Get.find<
                                                    Penaltiesandrewardscontroller>()
                                                .fetchRewards(int.parse(control
                                                    .filteredStudents[index].id
                                                    .toString()));
                                            Get.dialog(
                                              Re_Pe_Page(
                                                  isTeacher: true,
                                                  Id: control
                                                      .filteredStudents[index]
                                                      .id
                                                      .toString(),
                                                  name: control
                                                      .filteredStudents[index]
                                                      .fullName!),
                                            );
                                          } else if (selected ==
                                              'Add Rewards') {
                                            Get.find<RewardsController>()
                                                .setRewards();
                                            Get.find<RewardsController>()
                                                .updateStudentName(control
                                                    .filteredStudents[index]
                                                    .fullName!
                                                    .toString());
                                            Get.dialog(
                                              Rewards_Dialog(
                                                isTeacher: true,
                                                Studentname: control
                                                    .filteredStudents[index]
                                                    .fullName!
                                                    .toString(),
                                                FileType: "امتياز",
                                                id: control
                                                    .filteredStudents[index].id!
                                                    .toString(),
                                              ),
                                              barrierDismissible: false,
                                            );

                                            //Add Rewards Here
                                          }
                                        },
                                      );
                                    }),
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
