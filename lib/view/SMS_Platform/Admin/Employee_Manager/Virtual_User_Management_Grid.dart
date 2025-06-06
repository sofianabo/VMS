import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:get/get.dart';
import 'package:get/route_manager.dart';
import 'package:vms_school/Icons_File/v_m_s__icons_icons.dart';
import 'package:vms_school/Link/API/AdminAPI/Employees_APIs/Delete_Virtual_User_API.dart';
import 'package:vms_school/Link/Controller/AdminController/Employee_Controllers/All_Virtual_Employee_Controller.dart';
import 'package:vms_school/view/Both_Platform/widgets/ButtonsDialog.dart';
import 'package:vms_school/view/Both_Platform/widgets/GridAnimation.dart';
import 'package:vms_school/view/Both_Platform/widgets/Schema_Widget.dart';
import 'package:vms_school/view/Both_Platform/widgets/VMSAlertDialog.dart';

class Virtual_User_Management_Grid extends StatefulWidget {
  const Virtual_User_Management_Grid({super.key});

  @override
  State<Virtual_User_Management_Grid> createState() =>
      _Virtual_User_Management_GridState();
}

class _Virtual_User_Management_GridState
    extends State<Virtual_User_Management_Grid> {
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    int getCrossAxisCount() {
      if (screenWidth >= 1800) return 5;
      if (screenWidth >= 1400) return 4;
      if (screenWidth >= 1000) return 3;
      if (screenWidth >= 700) return 2;
      return 1;
    }

    double getChildAspectRatio() {
      if (screenWidth >= 1800) return 1.0;
      if (screenWidth >= 1400) return 1.45;
      if (screenWidth >= 1260) return 1.75;
      if (screenWidth >= 1000) return 1.30;
      if (screenWidth >= 930) return 1.85;
      if (screenWidth >= 850) return 1.65;
      if (screenWidth >= 750) return 1.45;
      if (screenWidth >= 700) return 1.35;
      if (screenWidth >= 584) return 2.45;
      if (screenWidth >= 584) return 1.95;
      if (screenWidth >= 492) return 1.90;
      if (screenWidth >= 417) return 1.65;

      return 1.1;
    }

    return GetBuilder<All_Virtual_Employee_Controller>(builder: (controller) {
      return controller.isLoading == true
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
                            decoration:
                                BoxDecoration(
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
                                mainAxisAlignment: MainAxisAlignment.spaceAround,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      SchemaWidget(width: 50, height: 50),
                                      SchemaWidget(width: 60, height: 10),
                                    ],
                                  ),
                                  Expanded(
                                      child: Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          SchemaWidget(width: 60, height: 10),
                                        ],
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          SchemaWidget(width: 60, height: 10),
                                        ],
                                      ),
                                    ],
                                  ))
                                ])))
                    .animate(onPlay: (controller) => controller.repeat())
                    .shimmer(
                        angle: 1,
                        color: Colors.grey.withOpacity(0.2),
                        duration: const Duration(seconds: 1),
                        delay: const Duration(seconds: 1));
              },
            )
          : controller.filteredviraulUser!.isEmpty
              ? Center(
                  child: Text("No Virtual User".tr,
                      style: Theme.of(context).textTheme.titleLarge!.copyWith(
                          fontSize: 22, fontWeight: FontWeight.normal)))
              : GridView.builder(
                  padding: const EdgeInsets.only(top: 10, left: 40, right: 40),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: getCrossAxisCount(),
                      crossAxisSpacing: 20.0,
                      mainAxisSpacing: 20.0,
                      childAspectRatio: getChildAspectRatio()),
                  itemCount: controller.filteredviraulUser!.length,
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
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      if (controller.filteredviraulUser![index]
                                              .hasclasses ==
                                          false)
                                        IconButton(
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
                                                        Delete_Virtual_User_API(
                                                                context)
                                                            .Delete_Virtual_User(
                                                                id: controller
                                                                    .filteredviraulUser![
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
                                                      color: Theme.of(context)
                                                          .primaryColor,
                                                      width: 80)
                                                ],
                                                contents: SizedBox(
                                                    width: 500,
                                                    child: Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .start,
                                                      children: [
                                                        Text(
                                                          "Do You Want To Deletec"
                                                                  .tr +
                                                              " (${controller.filteredviraulUser![index].userName})" +
                                                              "Virtual User".tr,
                                                          style: Get
                                                              .theme
                                                              .textTheme
                                                              .bodyMedium!
                                                              .copyWith(
                                                                  fontSize: 16,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .normal),
                                                        ),
                                                      ],
                                                    )),
                                                apptitle: "Delete Employee".tr,
                                                subtitle: "none",
                                              ));
                                            },
                                            icon: const Icon(VMS_Icons.bin,
                                                size: 16, color: Colors.white)),
                                      Text(
                                        "${controller.filteredviraulUser![index].roll}"
                                            .tr,
                                        style: TextStyle(
                                            color: controller
                                                        .filteredviraulUser![
                                                            index]
                                                        .roll ==
                                                    "observer"
                                                ? const Color(0xff1EBC3B)
                                                : const Color(0xFF2C7AAD),
                                            fontSize: 18,
                                            fontWeight: FontWeight.bold),
                                      )
                                    ],
                                  ),
                                  Expanded(
                                      child: Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          Text(
                                            "${controller.filteredviraulUser![index].userName}",
                                            style: const TextStyle(
                                              fontSize: 18,
                                            ),
                                          )
                                        ],
                                      ),
                                    ],
                                  ))
                                ])));
                  },
                );
    });
  }
}
