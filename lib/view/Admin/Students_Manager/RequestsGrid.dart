import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:get/get.dart';
import 'package:vms_school/Link/API/AdminAPI/Students/Guardian_APIS/ApproveRequestAPI.dart';
import 'package:vms_school/Link/API/AdminAPI/Students/Guardian_APIS/RejectEnrollRequestAPI.dart';
import 'package:vms_school/Link/Controller/AdminController/Students_Controllers/RequestsController.dart';
import 'package:vms_school/Link/Controller/WidgetController/DropDown_Controllers/DropDownClassesController.dart';
import 'package:vms_school/Link/Controller/WidgetController/DropDown_Controllers/DropDownDivisionController.dart';
import 'package:vms_school/Theme/themeController.dart';
import 'package:vms_school/widgets/Admin_Requests/DropDownRequestEnroll.dart';
import 'package:vms_school/widgets/ButtonsDialog.dart';
import 'package:vms_school/widgets/ButtonsGrid.dart';
import 'package:vms_school/widgets/GridAnimation.dart';
import 'package:vms_school/widgets/Schema_Widget.dart';
import 'package:vms_school/widgets/VMSAlertDialog.dart';

class RequestsGrid extends StatelessWidget {
  const RequestsGrid({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<Requestscontroller>(builder: (controller) {
      if (controller.isLoading == true) {
        return Container(
          padding: const EdgeInsets.only(left: 30.0, right: 30.0),
          child: GridView.builder(
            shrinkWrap: true,
            itemCount: 6,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              crossAxisSpacing: 25.0,
              mainAxisSpacing: 25.0,
              childAspectRatio: 1.3,
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
                                    width: 200,
                                    height: 20,
                                  ),
                                  SchemaWidget(
                                    width: 100,
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
              child: Text("No Requests",
                  style: Theme.of(context)
                      .textTheme
                      .titleLarge!
                      .copyWith(fontSize: 22, fontWeight: FontWeight.normal)));
        } else {
          return Container(
            padding: const EdgeInsets.only(left: 30.0, right: 30.0),
            child: GridView.builder(
              shrinkWrap: true,
              itemCount: controller.filteredregistration.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                crossAxisSpacing: 25.0,
                mainAxisSpacing: 25.0,
                childAspectRatio: 1.3,
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
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "Guardian Info :",
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
                              "Name : ${controller.filteredregistration[index].guardian?.name}",
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
                              "Mobile: ${controller.filteredregistration[index].guardian?.phone}",
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
                              "Email: ${controller.filteredregistration[index].guardian?.email}",
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
                              "National ID: ${controller.filteredregistration[index].guardian?.nationalId}",
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
                            child: Text("Student Info:",
                                style: Theme.of(context)
                                    .textTheme
                                    .titleLarge!
                                    .copyWith(fontSize: 18)),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 5.0),
                            child: Text(
                              "Name : ${controller.filteredregistration[index].student?.name}",
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
                              "Current Class: ${controller.filteredregistration[index].student?.clas ?? "No Class"}",
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyMedium!
                                  .copyWith(
                                      fontSize: 16,
                                      fontWeight: FontWeight.normal),
                            ),
                          ),
                          Padding(
                            padding:
                                const EdgeInsets.only(top: 5.0, bottom: 15.0),
                            child: Text(
                              "Previous Class: ${controller.filteredregistration[index].student?.previousClass ?? "No Class"}",
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyMedium!
                                  .copyWith(
                                      fontSize: 16,
                                      fontWeight: FontWeight.normal),
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              ButtonsGrid(
                                color: Theme.of(context).primaryColorLight,
                                width: 150,
                                height: 40,
                                text: "Manage",
                                onPressed: () async {
                                  Get.find<Dropdowndivisioncontroller>()
                                      .setIsDisiabled(true);
                                  controller.classIndex = "";
                                  controller.divisionIndex = "";
                                  Get.dialog(VMSAlertDialog(
                                      action: [
                                        ButtonDialog(
                                          text: 'Reject',
                                          onPressed: () async {
                                            await Rejectenrollrequestapi(
                                                    context)
                                                .Rejectenrollrequest(controller
                                                    .filteredregistration[index]
                                                    .acceptanceNumber!);
                                            Get.back();
                                          },
                                          width: 80,
                                          color: const Color(0xffB03D3D),
                                        ),
                                        ButtonDialog(
                                          text: 'Approve',
                                          onPressed: () async {
                                            await Approverequestapi(context)
                                                .Approverequest(
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
                                          color: Theme.of(context).primaryColor,
                                        )
                                      ],
                                      contents: Row(
                                        children: [
                                          GetBuilder<Dropdownclassescontroller>(
                                              builder: (controller) {
                                            return Dropdownrequestenroll(
                                              isLoading: controller.Isloading,
                                              width: Get.width / 5.2,
                                              type: "class",
                                              title: 'Class',
                                            );
                                          }),
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                left: 20.0),
                                            child: GetBuilder<
                                                    Dropdowndivisioncontroller>(
                                                builder: (controller) {
                                              return Dropdownrequestenroll(
                                                isDisabled:
                                                    controller.isDisiabled,
                                                isLoading: controller.isLoading,
                                                width: Get.width / 5.2,
                                                type: "division",
                                                title: 'Division',
                                              );
                                            }),
                                          )
                                        ],
                                      ),
                                      apptitle: 'Manage Student',
                                      subtitle: 'Manage Laith Azzam Student'));
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
                                        "${controller.filteredregistration[index].type}",
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyMedium!
                                            .copyWith(
                                                fontSize: 16,
                                                color: controller
                                                            .filteredregistration[
                                                                index]
                                                            .type ==
                                                        "Rejected"
                                                    ? const Color(0xffB27671)
                                                    : controller
                                                                .filteredregistration[
                                                                    index]
                                                                .type ==
                                                            "Pending"
                                                        ? const Color(
                                                            0xff297686)
                                                        : const Color(
                                                            0xff779DB6),
                                                fontWeight: FontWeight.normal),
                                      ),
                                    ),
                                    Icon(
                                        controller.filteredregistration[index]
                                                    .type ==
                                                "Rejected"
                                            ? Icons.close
                                            : controller
                                                        .filteredregistration[
                                                            index]
                                                        .type ==
                                                    "Pending"
                                                ? Icons.timelapse_outlined
                                                : Icons.timer,
                                        color: controller
                                                    .filteredregistration[index]
                                                    .type ==
                                                "Rejected"
                                            ? const Color(0xffB27671)
                                            : controller
                                                        .filteredregistration[
                                                            index]
                                                        .type ==
                                                    "Pending"
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
        }
      }
    });
  }
}
