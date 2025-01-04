import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:get/get.dart';
import 'package:vms_school/Icons_File/v_m_s__icons_icons.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:vms_school/Link/API/AdminAPI/School/School_Screen_APIs/Class_API/Delete_Class_API.dart';
import 'package:vms_school/Link/API/AdminAPI/School/School_Screen_APIs/Class_API/Edit_Class_API.dart';
import 'package:vms_school/Link/Controller/AdminController/School_Controllers/Class_Mgmt_Controller.dart';
import 'package:vms_school/widgets/ButtonsDialog.dart';
import 'package:vms_school/widgets/GridAnimation.dart';
import 'package:vms_school/widgets/Schema_Widget.dart';
import 'package:vms_school/widgets/TextFildWithUpper.dart';
import 'package:vms_school/widgets/VMSAlertDialog.dart';

class Transaction_Management_Grid extends StatelessWidget {
  Transaction_Management_Grid({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ClassMgmtController>(builder: (control) {
      return control.isLoading == true
          ? GridView.builder(
              padding: const EdgeInsets.only(top: 10, left: 40, right: 40),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 5,
                  crossAxisSpacing: 20.0,
                  mainAxisSpacing: 20.0,
                  childAspectRatio: 1.1),
              itemCount: 10,
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
                ).animate(onPlay: (controller) => controller.repeat()).shimmer(
                    angle: 1,
                    color: Colors.grey.withOpacity(0.2),
                    duration: Duration(seconds: 1),
                    delay: Duration(seconds: 1));
              },
            )
          : control.filteredreclasses!.isNotEmpty
              ? GridView.builder(
                  padding: const EdgeInsets.only(top: 10, left: 40, right: 40),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 5,
                      crossAxisSpacing: 20.0,
                      mainAxisSpacing: 20.0,
                      childAspectRatio: 1.1),
                  itemCount: control.filteredreclasses!.length,
                  itemBuilder: (context, index) {
                    return HoverScaleCard(
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
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Text(
                                      "${control.filteredreclasses![index].enName}",
                                      style: Get.theme.textTheme.bodyMedium!
                                          .copyWith(
                                        fontSize: 20,
                                      )),
                                ],
                              ),
                              Text(
                                  "${control.filteredreclasses![index].grade!.enName}",
                                  style: Get.theme.textTheme.bodyMedium!
                                      .copyWith(
                                          fontSize: 14, color: Colors.black)),
                              Text(
                                  "${control.filteredreclasses![index].session!.year}",
                                  style: Get.theme.textTheme.bodyMedium!
                                      .copyWith(
                                          fontSize: 14, color: Colors.black)),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text("Drive URL",
                                      style: Get.theme.textTheme.bodyMedium!
                                          .copyWith(
                                        fontSize: 16,
                                      )),
                                  SvgPicture.asset(
                                    "../../images/drive.svg",
                                    width: 20,
                                  )
                                ],
                              )
                            ],
                          )),
                    );
                  },
                )
              : Center(
                  child: Text("No Classes",
                      style: Get.theme.textTheme.titleLarge!.copyWith(
                          fontSize: 22, fontWeight: FontWeight.normal)));
    });
  }
}
