import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/route_manager.dart';
import 'package:vms_school/Link/API/API.dart';
import 'package:vms_school/Link/Controller/AdminController/AllEmpolyeeController.dart';
import 'package:vms_school/widgets/ButtonsDialog.dart';
import '../../Icons_File/v_m_s__icons_icons.dart';
import '../../widgets/GridAnimation.dart';
import '../../widgets/VMSAlertDialog.dart';

class AllEmployeeGrid extends StatelessWidget {
  List<Map<String, dynamic>> l = [
    {
      "name": "Laith Haitham Azzam",
      "roll": "ADMIN",
      "jop": "IT Support",
      "salary": "150.0000000",
    },
    {
      "name": "Laith Haitham Azzam",
      "roll": "Sub Admin",
      "jop": "IT Support",
      "salary": "150.0000000",
    },
    {
      "name": "Laith Haitham Azzam",
      "roll": "Registration",
      "jop": "IT Support",
      "salary": "150.0000000",
    },
    {
      "name": "Laith Haitham Azzam",
      "roll": "Supervisor",
      "jop": "IT Support",
      "salary": "150.0000000",
    },
    {
      "name": "Laith Haitham Azzam",
      "roll": "Accountant",
      "jop": "IT Support",
      "salary": "150.0000000",
    },
  ];

  AllEmployeeGrid({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<Allempolyeecontroller>(
        builder: (controller) {
          return GridView.builder(
            padding: const EdgeInsets.only(top: 10, left: 40, right: 40),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 4,
                crossAxisSpacing: 20.0,
                mainAxisSpacing: 20.0,
                childAspectRatio: 1.4),
            itemCount: controller.employee.length, // عدد العناصر في الشبكة
            itemBuilder: (context, index) {
              return HoverScaleCard(
                child: GestureDetector(
                    onTap: () {},
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
                              IconButton(
                                  style: ButtonStyle(
                                      backgroundColor:
                                      WidgetStatePropertyAll(Color(0xffB03D3D)),
                                      shape: WidgetStatePropertyAll(
                                          RoundedRectangleBorder(
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(5))))),
                                  onPressed: () {
                                    Get.dialog(VMSAlertDialog(
                                      action: [
                                        ButtonDialog(
                                            text: "Delete",
                                            onPressed: () {},
                                            color: Color(0xffB03D3D),
                                            width: 80),
                                        ButtonDialog(
                                            text: "Cancel",
                                            onPressed: () {
                                              Get.back();
                                            },
                                            color: Get.theme.primaryColor,
                                            width: 80)
                                      ],
                                      contents: Container(
                                          width: 500,
                                          child: Row(
                                            mainAxisAlignment:
                                            MainAxisAlignment.start,
                                            children: [
                                              Text(
                                                "Do You Want To Delete ${controller
                                                    .employee[index]
                                                    .fullName} Employee",
                                                style: Get.theme
                                                    .primaryTextTheme
                                                    .bodyMedium!
                                                    .copyWith(
                                                    fontSize: 16,
                                                    fontWeight:
                                                    FontWeight.normal),
                                              ),
                                            ],
                                          )),
                                      apptitle: "Delete Employee",
                                      subtitle: "none",
                                    ));
                                  },
                                  icon: Icon(VMS_Icons.bin,
                                      size: 16, color: Colors.white)),
                              Expanded(
                                  child: Center(
                                      child: Text(
                                        "${controller.employee[index]
                                            .fullName}",
                                        style: Get.theme.primaryTextTheme
                                            .bodyMedium!
                                            .copyWith(
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold),
                                      )))
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Column(
                                mainAxisAlignment: MainAxisAlignment
                                    .spaceAround,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      Text(
                                        "${controller.employee[index].roll}",
                                        style: Get.theme.primaryTextTheme
                                            .bodyMedium!
                                            .copyWith(
                                            color: controller.employee[index]
                                                .roll ==
                                                "Accountant"
                                                ? Color(0xff2684FC)
                                                : l[index]['roll'] ==
                                                "Sub Admin"
                                                ? Color(0xff297686)
                                                : l[index]['roll'] ==
                                                "Registration"
                                                ? Color(0xffB27671)
                                                : l[index]['roll'] ==
                                                "Supervisor"
                                                ? Color(0xff2F9742)
                                                : Get.theme
                                                .primaryColor,
                                            fontSize: 18,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.all(5.0),
                                        child: Icon(
                                          controller.employee[index].roll ==
                                              "Accountant"
                                              ? Icons
                                              .account_balance_wallet_outlined
                                              : l[index]['roll'] == "Sub Admin"
                                              ? Icons.manage_accounts_outlined
                                              : l[index]['roll'] ==
                                              "Registration"
                                              ? Icons.app_registration
                                              : l[index]['roll'] ==
                                              "Supervisor"
                                              ? Icons
                                              .supervised_user_circle_outlined
                                              : Icons
                                              .admin_panel_settings_outlined,
                                          color: controller.employee[index]
                                              .roll == "Accountant"
                                              ? Color(0xff2684FC)
                                              : l[index]['roll'] == "Sub Admin"
                                              ? Color(0xff297686)
                                              : l[index]['roll'] ==
                                              "Registration"
                                              ? Color(0xffB27671)
                                              : l[index]['roll'] ==
                                              "Supervisor"
                                              ? Color(0xff2F9742)
                                              : Get.theme.primaryColor,
                                        ),
                                      )
                                    ],
                                  ),
                                  Text(
                                    "${controller.employee[index].jobTitle}",
                                    style: Get.theme.primaryTextTheme
                                        .bodyMedium!
                                        .copyWith(
                                        color: Colors.black,
                                        fontSize: 14,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Text(
                                    "${controller.employee[index].salary}",
                                    style: Get.theme.primaryTextTheme
                                        .bodyMedium!
                                        .copyWith(
                                        fontSize: 14,
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold),
                                  )
                                ],
                              ),
                              Image.network(
                                  "$getimage${controller.employee[index]
                                      .imageId}",
                                  height: 100, width: 100),
                            ],
                          )
                        ],
                      ),
                    )),
              );
            },
          );
        }
    );
  }
}
