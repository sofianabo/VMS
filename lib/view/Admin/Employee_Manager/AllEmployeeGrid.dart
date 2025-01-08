import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:get/get.dart';
import 'package:get/route_manager.dart';
import 'package:vms_school/Link/API/API.dart';
import 'package:vms_school/Link/API/AdminAPI/Employees_APIs/Delete_Employee.dart';
import 'package:vms_school/Link/API/AdminAPI/Employees_APIs/Get_Employee_By_Id_API.dart';
import 'package:vms_school/Link/Controller/AdminController/Employee_Controllers/AllEmpolyeeController.dart';
import 'package:vms_school/widgets/ButtonsDialog.dart';
import 'package:vms_school/widgets/Schema_Widget.dart';
import '../../../Icons_File/v_m_s__icons_icons.dart';
import '../../../widgets/GridAnimation.dart';
import '../../../widgets/VMSAlertDialog.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class AllEmployeeGrid extends StatelessWidget {
  const AllEmployeeGrid({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<Allempolyeecontroller>(builder: (controller) {
      return controller.isLoading
          ? GridView.builder(
              padding: const EdgeInsets.only(top: 10, left: 40, right: 40),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 4,
                  crossAxisSpacing: 20.0,
                  mainAxisSpacing: 20.0,
                  childAspectRatio: 1.4),
              itemCount: 8, // عدد العناصر في الشبكة
              itemBuilder: (context, index) {
                return HoverScaleCard(
                  child: Container(
                    padding: const EdgeInsets.all(20),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        border: Border.all(color: Colors.grey, width: 0.5),
                        color: Colors.white,
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
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SchemaWidget(
                              width: 80,
                              height: 80,
                            ),
                            Expanded(
                                child: Center(
                              child: SchemaWidget(
                                width: 100,
                                height: 20,
                              ),
                            ))
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Column(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    Row(
                                      children: [
                                        SchemaWidget(
                                          width: 20,
                                          height: 20,
                                        ),
                                        SchemaWidget(
                                          width: 100,
                                          height: 20,
                                        ),
                                      ],
                                    )
                                  ],
                                ),
                                SchemaWidget(
                                  width: 100,
                                  height: 20,
                                ),
                                SchemaWidget(
                                  width: 100,
                                  height: 20,
                                ),
                              ],
                            ),
                            SchemaWidget(
                              width: 60,
                              height: 60,
                              radius: 60,
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ).animate(onPlay: (controller) => controller.repeat()).shimmer(
                    angle: 1,
                    color: Colors.white,
                    duration: const Duration(milliseconds: 600),
                    delay: const Duration(milliseconds: 200));
              },
            )
          : controller.filteredreemployees.isNotEmpty
              ? GridView.builder(
                  padding: const EdgeInsets.only(top: 10, left: 40, right: 40),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 4,
                      crossAxisSpacing: 20.0,
                      mainAxisSpacing: 20.0,
                      childAspectRatio: 1.4),
                  itemCount: controller
                      .filteredreemployees.length, // عدد العناصر في الشبكة
                  itemBuilder: (context, index) {
                    return HoverScaleCard(
                      child: GestureDetector(
                          onTap: () async {
                            if (controller
                                    .filteredreemployees[index].hasEmployee ==
                                true) {
                              await GetEmployeeByIdApi.GetEmployeeById(
                                  employeeID: controller
                                      .filteredreemployees[index].id
                                      .toString(),
                                  context: context,
                                  index: index);
                            } else {
                              Get.dialog(VMSAlertDialog(
                                action: [],
                                contents: const Text("This Employee Not Have Data"),
                                apptitle:
                                    "This Employee Not Uploaded his/her Data",
                                subtitle: "none",
                              ));
                            }
                          },
                          child: Container(
                            padding: const EdgeInsets.all(20),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                border:
                                    Border.all(color: Colors.grey, width: 0.5),
                                color: Colors.white,
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
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
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
                                                  text: "Delete",
                                                  onPressed: () {
                                                    DeleteEmployee.DeleteEmployeeByID(
                                                        employeeID: controller
                                                            .filteredreemployees[
                                                                index]
                                                            .id
                                                            .toString());
                                                  },
                                                  color: const Color(0xffB03D3D),
                                                  width: 80),
                                              ButtonDialog(
                                                  text: "Cancel",
                                                  onPressed: () {},
                                                  color: Get.theme.primaryColor,
                                                  width: 80)
                                            ],
                                            contents: SizedBox(
                                                width: 500,
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.start,
                                                  children: [
                                                    Text(
                                                      "Do You Want To Delete ${controller.employees[index].fullName} Employee",
                                                      style: Get
                                                          .theme
                                                          .primaryTextTheme
                                                          .bodyMedium!
                                                          .copyWith(
                                                              fontSize: 16,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .normal),
                                                    ),
                                                  ],
                                                )),
                                            apptitle: "Delete Employee",
                                            subtitle: "none",
                                          ));
                                        },
                                        icon: const Icon(VMS_Icons.bin,
                                            size: 16, color: Colors.white)),
                                    Expanded(
                                        child: Center(
                                            child: Text(
                                      "${controller.filteredreemployees[index].fullName}",
                                      style: Get.theme.textTheme.bodyMedium!
                                          .copyWith(
                                              fontSize: 20,
                                              fontWeight: FontWeight.bold),
                                    )))
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceAround,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Row(
                                          children: [
                                            Text(
                                              "${controller.filteredreemployees[index].roll}",
                                              style: Get
                                                  .theme.textTheme.bodyMedium!
                                                  .copyWith(
                                                      color: controller
                                                                  .filteredreemployees[
                                                                      index]
                                                                  .roll ==
                                                              "Accountant"
                                                          ? const Color(0xff2684FC)
                                                          : controller
                                                                      .filteredreemployees[
                                                                          index]
                                                                      .roll ==
                                                                  "Sub Admin"
                                                              ? const Color(
                                                                  0xff297686)
                                                              : controller
                                                                          .filteredreemployees[
                                                                              index]
                                                                          .roll ==
                                                                      "Registration"
                                                                  ? const Color(
                                                                      0xffB27671)
                                                                  : controller.filteredreemployees[index].roll ==
                                                                          "Supervisor"
                                                                      ? const Color(
                                                                          0xff2F9742)
                                                                      : Get
                                                                          .theme
                                                                          .primaryColor,
                                                      fontSize: 18,
                                                      fontWeight:
                                                          FontWeight.bold),
                                            ),
                                            Padding(
                                              padding:
                                                  const EdgeInsets.all(5.0),
                                              child: Icon(
                                                controller
                                                            .filteredreemployees[
                                                                index]
                                                            .roll ==
                                                        "Accountant"
                                                    ? Icons
                                                        .account_balance_wallet_outlined
                                                    : controller
                                                                .filteredreemployees[
                                                                    index]
                                                                .roll ==
                                                            "Sub Admin"
                                                        ? Icons
                                                            .manage_accounts_outlined
                                                        : controller
                                                                    .filteredreemployees[
                                                                        index]
                                                                    .roll ==
                                                                "Registration"
                                                            ? Icons
                                                                .app_registration
                                                            : controller
                                                                        .filteredreemployees[
                                                                            index]
                                                                        .roll ==
                                                                    "Supervisor"
                                                                ? Icons
                                                                    .supervised_user_circle_outlined
                                                                : Icons
                                                                    .admin_panel_settings_outlined,
                                                color: controller
                                                            .filteredreemployees[
                                                                index]
                                                            .roll ==
                                                        "Accountant"
                                                    ? const Color(0xff2684FC)
                                                    : controller
                                                                .filteredreemployees[
                                                                    index]
                                                                .roll ==
                                                            "Sub Admin"
                                                        ? const Color(0xff297686)
                                                        : controller
                                                                    .filteredreemployees[
                                                                        index]
                                                                    .roll ==
                                                                "Registration"
                                                            ? const Color(0xffB27671)
                                                            : controller
                                                                        .filteredreemployees[
                                                                            index]
                                                                        .roll ==
                                                                    "Supervisor"
                                                                ? const Color(
                                                                    0xff2F9742)
                                                                : Get.theme
                                                                    .primaryColor,
                                              ),
                                            )
                                          ],
                                        ),
                                        Text(
                                          "${controller.filteredreemployees[index].jobTitle}",
                                          style: Get.theme.textTheme.bodyMedium!
                                              .copyWith(
                                                  color: Colors.black,
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.bold),
                                        ),
                                        Text(
                                          "${controller.filteredreemployees[index].salary}",
                                          style: Get.theme.textTheme.bodyMedium!
                                              .copyWith(
                                                  fontSize: 14,
                                                  color: Colors.black,
                                                  fontWeight: FontWeight.bold),
                                        )
                                      ],
                                    ),
                                    FutureBuilder(
                                      future: precacheImage(
                                          NetworkImage(
                                              "$getimage${controller.filteredreemployees[index].imageId}"),
                                          context),
                                      builder: (context, snapshot) {
                                        if (snapshot.connectionState ==
                                            ConnectionState.done) {
                                          return CircleAvatar(
                                            maxRadius: 60,
                                            backgroundColor:
                                                const Color(0xffC4C4C4),
                                            backgroundImage: controller
                                                        .filteredreemployees[
                                                            index]
                                                        .imageId !=
                                                    null
                                                ? NetworkImage(
                                                    "$getimage${controller.filteredreemployees[index].imageId}")
                                                : null,
                                            child: controller
                                                        .filteredreemployees[
                                                            index]
                                                        .imageId ==
                                                    null
                                                ? Text(
                                                    controller.filteredreemployees[index].fullName!.substring(0, 1).toUpperCase(),
                                                    style: Get
                                                        .textTheme.titleLarge!
                                                        .copyWith(
                                                            fontSize: 26,
                                                            fontWeight:
                                                                FontWeight
                                                                    .bold),
                                                  )
                                                : null,
                                          );
                                        } else {
                                          return CircleAvatar(
                                            maxRadius: 60,
                                            backgroundColor:
                                                const Color(0xffC4C4C4),
                                            child:
                                                LoadingAnimationWidget.inkDrop(
                                              color: Theme.of(context)
                                                  .primaryColor,
                                              size: 30,
                                            ),
                                          );
                                        }
                                      },
                                    ),
                                  ],
                                )
                              ],
                            ),
                          )),
                    );
                  },
                )
              : Center(
                  child: Text("No Employees",
                      style: Get.theme.textTheme.titleLarge!.copyWith(
                          fontSize: 22, fontWeight: FontWeight.normal)));
    });
  }
}
