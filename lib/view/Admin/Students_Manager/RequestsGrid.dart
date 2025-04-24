import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:get/get.dart';
import 'package:vms_school/Link/API/API.dart';
import 'package:vms_school/Link/API/AdminAPI/Students/Guardian_APIS/ApproveRequestAPI.dart';
import 'package:vms_school/Link/API/AdminAPI/Students/Guardian_APIS/RejectEnrollRequestAPI.dart';
import 'package:vms_school/Link/API/DownloadFiles.dart';
import 'package:vms_school/Link/Controller/AdminController/Employee_Controllers/Add_Data_controller.dart';
import 'package:vms_school/Link/Controller/AdminController/Students_Controllers/RequestsController.dart';
import 'package:vms_school/Link/Controller/WidgetController/DropDown_Controllers/DropDownClassesController.dart';
import 'package:vms_school/Link/Controller/WidgetController/DropDown_Controllers/DropDownDivisionController.dart';
import 'package:vms_school/Theme/themeController.dart';
import 'package:vms_school/Translate/local_controller.dart';
import 'package:vms_school/main.dart';
import 'package:vms_school/widgets/Admin_Requests/DropDownRequestEnroll.dart';
import 'package:vms_school/widgets/ButtonsDialog.dart';
import 'package:vms_school/widgets/ButtonsGrid.dart';
import 'package:vms_school/widgets/GridAnimation.dart';
import 'package:vms_school/widgets/PDF_View.dart';
import 'package:vms_school/widgets/Schema_Widget.dart';
import 'package:vms_school/widgets/VMSAlertDialog.dart';

class RequestsGrid extends StatelessWidget {
  const RequestsGrid({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    int getCrossAxisCount() {
      if (screenWidth >= 1800) return 5;
      if (screenWidth >= 1278) return 4;
      if (screenWidth >= 988) return 3;
      if (screenWidth >= 600) return 2;

      return 1;
    }

    double getChildAspectRatio() {
      if (screenWidth >= 1800) return 0.9;
      if (screenWidth >= 1278) return 0.85;
      if (screenWidth >= 1109) return 0.95;
      if (screenWidth >= 988) return 0.85;
      if (screenWidth >= 946) return 1.24;
      if (screenWidth >= 832) return 1.05;
      if (screenWidth >= 700) return 0.95;
      if (screenWidth >= 638) return 0.87;
      if (screenWidth >= 600) return 0.75;
      if (screenWidth >= 530) return 1.5;
      if (screenWidth >= 470) return 1.3;
      if (screenWidth >= 405) return 1.1;
      return 0.93;
    }

    return GetBuilder<Requestscontroller>(builder: (controller) {
      if (controller.isLoading == true) {
        return Container(
          padding: const EdgeInsets.only(left: 30.0, right: 30.0),
          child: GridView.builder(
            shrinkWrap: true,
            itemCount: 6,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: getCrossAxisCount(),
              crossAxisSpacing: 25.0,
              mainAxisSpacing: 25.0,
              childAspectRatio: getChildAspectRatio(),
            ),
            itemBuilder: (context, index) {
              return HoverScaleCard(
                child: Stack(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                          color: Theme.of(context).cardColor,
                          border: Border.all(color: Colors.grey, width: 0.2),
                          borderRadius:
                              const BorderRadius.all(Radius.circular(5)),
                          boxShadow: const [
                            BoxShadow(
                                color: Colors.black12,
                                offset: Offset(0, 2),
                                blurRadius: 1)
                          ]),
                      child: Padding(
                        padding: const EdgeInsets.only(left: 8.0, right: 8.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(top: 10.0),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  SchemaWidget(
                                    width: 180,
                                    height: 20,
                                  ),
                                  SchemaWidget(
                                    width: 80,
                                    height: 20,
                                  )
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 5.0),
                              child: SchemaWidget(
                                width: 150,
                                height: 20,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 5.0),
                              child: SchemaWidget(
                                width: 100,
                                height: 20,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 5.0),
                              child: SchemaWidget(
                                width: 125,
                                height: 20,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 5.0),
                              child: SchemaWidget(
                                width: 120,
                                height: 20,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 5.0),
                              child: SchemaWidget(
                                width: 115,
                                height: 20,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 5.0),
                              child: SchemaWidget(
                                width: 110,
                                height: 20,
                              ),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.only(top: 5.0, bottom: 15.0),
                              child: SchemaWidget(
                                width: 105,
                                height: 20,
                              ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                SchemaWidget(
                                  width: 150,
                                  height: 40,
                                  radius: 10,
                                ),
                                SchemaWidget(
                                  width: 100,
                                  height: 20,
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                    )
                        .animate(onPlay: (controller) => controller.repeat())
                        .shimmer(
                            angle: 1,
                            color: Theme.of(context).dialogBackgroundColor,
                            duration: const Duration(seconds: 1),
                            delay: const Duration(seconds: 1)),
                    const Center(
                        child: CircularProgressIndicator(
                      color: Color(0xffe6e7ea),
                      strokeCap: StrokeCap.round,
                    )),
                  ],
                ),
              );
            },
          ),
        );
      } else {
        if (controller.filteredregistration.isEmpty) {
          return Center(
              child: Text("No Requests".tr,
                  style: Theme.of(context)
                      .textTheme
                      .titleLarge!
                      .copyWith(fontSize: 22, fontWeight: FontWeight.normal)));
        } else {
          return Directionality(
            textDirection: prefs!.getString(languageKey) == "ar"
                ? TextDirection.rtl
                : TextDirection.ltr,
            child: LayoutBuilder(builder: (context, constraints) {
              return Container(
                padding: const EdgeInsets.only(left: 30.0, right: 30.0),
                child: GridView.builder(
                  shrinkWrap: true,
                  itemCount: controller.filteredregistration.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: getCrossAxisCount(),
                    crossAxisSpacing: 25.0,
                    mainAxisSpacing: 25.0,
                    childAspectRatio: getChildAspectRatio(),
                  ),
                  itemBuilder: (context, index) {
                    return HoverScaleCard(
                      child: Container(
                        decoration: BoxDecoration(
                            color: Theme.of(context).cardColor,
                            border: Border.all(color: Colors.grey, width: 0.2),
                            borderRadius:
                                const BorderRadius.all(Radius.circular(5)),
                            boxShadow: const [
                              BoxShadow(
                                  color: Colors.black12,
                                  offset: Offset(0, 2),
                                  blurRadius: 1)
                            ]),
                        child: Padding(
                          padding: const EdgeInsets.only(left: 8.0, right: 8.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(top: 10.0),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      "Guardian Info :".tr,
                                      style: Theme.of(context)
                                          .textTheme
                                          .titleLarge!
                                          .copyWith(fontSize: 18),
                                    ),
                                    Text(
                                        "${controller.filteredregistration[index].date}"),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 5.0),
                                child: Text(
                                  maxLines: 3,
                                  overflow: TextOverflow.ellipsis,
                                  "${"Name :".tr} ${controller.filteredregistration[index].guardian?.name}",
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyMedium!
                                      .copyWith(
                                          fontSize: 16,
                                          fontWeight: FontWeight.normal),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 5.0),
                                child: Text(
                                  overflow: TextOverflow.ellipsis,
                                  "${"Mobile:".tr} ${controller.filteredregistration[index].guardian?.phone}",
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyMedium!
                                      .copyWith(
                                          fontSize: 16,
                                          fontWeight: FontWeight.normal),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 5.0),
                                child: Text(
                                  maxLines: 3,
                                  overflow: TextOverflow.ellipsis,
                                  "Email: ".tr +
                                      " ${controller.filteredregistration[index].guardian?.email}",
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyMedium!
                                      .copyWith(
                                          fontSize: 16,
                                          fontWeight: FontWeight.normal),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 5.0),
                                child: Text(
                                  overflow: TextOverflow.ellipsis,
                                  "${"National ID:".tr} ${controller.filteredregistration[index].guardian?.nationalId}",
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyMedium!
                                      .copyWith(
                                          fontSize: 16,
                                          fontWeight: FontWeight.normal),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 5.0),
                                child: Text("Student Info:".tr,
                                    style: Theme.of(context)
                                        .textTheme
                                        .titleLarge!
                                        .copyWith(fontSize: 18)),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 5.0),
                                child: Text(
                                  maxLines: 3,
                                  overflow: TextOverflow.ellipsis,
                                  "${"Name :".tr} ${controller.filteredregistration[index].student?.name}",
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyMedium!
                                      .copyWith(
                                          fontSize: 16,
                                          fontWeight: FontWeight.normal),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 5.0),
                                child: Text(
                                  overflow: TextOverflow.ellipsis,
                                  "${"Current Class:".tr} ${controller.filteredregistration[index].student?.clas ?? "No Class"}",
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyMedium!
                                      .copyWith(
                                          fontSize: 16,
                                          fontWeight: FontWeight.normal),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(
                                    top: 5.0, bottom: 15.0),
                                child: Text(
                                  overflow: TextOverflow.ellipsis,
                                  "${"Previous Class:".tr} ${controller.filteredregistration[index].student?.previousClass ?? "No Class"}",
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyMedium!
                                      .copyWith(
                                          fontSize: 16,
                                          fontWeight: FontWeight.normal),
                                ),
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  ButtonsGrid(
                                    color: Get.find<Add_Data_controller>()
                                                .roll ==
                                            "subAdmin"
                                        ? Get.theme.disabledColor
                                        : Theme.of(context).primaryColorLight,
                                    width: 150,
                                    height: 40,
                                    text: "Manage".tr,
                                    onPressed: () async {
                                      if (Get.find<Add_Data_controller>()
                                              .roll !=
                                          "subAdmin") {
                                        Get.find<Dropdowndivisioncontroller>()
                                            .setIsDisiabled(true);
                                        controller.classIndex = "";
                                        controller.divisionIndex = "";
                                        Get.dialog(VMSAlertDialog(
                                            action: [
                                              ButtonDialog(
                                                text: 'Reject'.tr,
                                                onPressed: () async {
                                                  await Rejectenrollrequestapi(
                                                          context)
                                                      .Rejectenrollrequest(controller
                                                          .filteredregistration[
                                                              index]
                                                          .acceptanceNumber!);
                                                  Get.back();
                                                },
                                                width: 80,
                                                color: const Color(0xffB03D3D),
                                              ),
                                              ButtonDialog(
                                                text: 'Approve'.tr,
                                                onPressed: () async {
                                                  await Approverequestapi(context).Approverequest(
                                                      controller
                                                          .filteredregistration[
                                                              index]
                                                          .acceptanceNumber!,
                                                      controller
                                                          .filteredregistration[
                                                              index]
                                                          .student!
                                                          .id!,
                                                      controller.classlist
                                                          .indexOf(controller
                                                              .selectedClassIndex),
                                                      controller.divisionlist
                                                          .indexOf(controller
                                                              .selectedDivisionIndex));
                                                },
                                                width: 80,
                                                color: Theme.of(context)
                                                    .primaryColor,
                                              )
                                            ],
                                            contents: SingleChildScrollView(
                                              child: Column(
                                                spacing: 10.0,
                                                children: [
                                                  GetBuilder<
                                                          Dropdownclassescontroller>(
                                                      builder: (controller) {
                                                    return Dropdownrequestenroll(
                                                      isLoading:
                                                          controller.Isloading,
                                                      width: 300,
                                                      type: "class",
                                                      title: 'Class'.tr,
                                                    );
                                                  }),
                                                  GetBuilder<
                                                          Dropdowndivisioncontroller>(
                                                      builder: (controller) {
                                                    return Dropdownrequestenroll(
                                                      isDisabled: controller
                                                          .isDisiabled,
                                                      isLoading:
                                                          controller.isLoading,
                                                      width: 300,
                                                      type: "division",
                                                      title: 'Division'.tr,
                                                    );
                                                  }),
                                                  TextButton(
                                                      onPressed: () {
                                                        for (int i = 0;
                                                            i <
                                                                controller
                                                                    .filteredregistration
                                                                    .length;
                                                            i++) {
                                                          openFileInNewTab(
                                                              filePath:
                                                                  '$getpdf${controller.filteredregistration[index].fileId![i]}');
                                                        }
                                                      },
                                                      child: Text("Show Files"))
                                                ],
                                              ),
                                            ),
                                            apptitle: 'Manage Student'.tr,
                                            subtitle:
                                                '${controller.filteredregistration[index].student?.name}'));
                                      }
                                    },
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(right: 8.0),
                                    child: Row(
                                      children: [
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(right: 8.0),
                                          child: Text(
                                            "${controller.filteredregistration[index].type!.tr}",
                                            style: Theme.of(context)
                                                .textTheme
                                                .bodyMedium!
                                                .copyWith(
                                                    fontSize: 16,
                                                    color: controller
                                                                .filteredregistration[
                                                                    index]
                                                                .type ==
                                                            "Rejected".tr
                                                        ? const Color(
                                                            0xffB27671)
                                                        : controller
                                                                    .filteredregistration[
                                                                        index]
                                                                    .type ==
                                                                "Pending".tr
                                                            ? const Color(
                                                                0xff297686)
                                                            : const Color(
                                                                0xff779DB6),
                                                    fontWeight:
                                                        FontWeight.normal),
                                          ),
                                        ),
                                        Icon(
                                            controller
                                                        .filteredregistration[
                                                            index]
                                                        .type ==
                                                    "Rejected".tr
                                                ? Icons.close
                                                : controller
                                                            .filteredregistration[
                                                                index]
                                                            .type ==
                                                        "Pending".tr
                                                    ? Icons.timelapse_outlined
                                                    : Icons.timer,
                                            color: controller
                                                        .filteredregistration[
                                                            index]
                                                        .type ==
                                                    "Rejected".tr
                                                ? const Color(0xffB27671)
                                                : controller
                                                            .filteredregistration[
                                                                index]
                                                            .type ==
                                                        "Pending".tr
                                                    ? const Color(0xff297686)
                                                    : const Color(0xff779DB6))
                                      ],
                                    ),
                                  )
                                ],
                              )
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                ),
              );
            }),
          );
        }
      }
    });
  }
}
