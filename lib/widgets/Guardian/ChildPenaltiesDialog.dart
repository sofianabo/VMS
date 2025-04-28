import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vms_school/Icons_File/v_m_s__icons_icons.dart';
import 'package:vms_school/Link/API/API.dart';
import 'package:vms_school/Link/API/AdminAPI/School/School_Screen_APIs/Rewards_APIs/Delete_Reward_API.dart';
import 'package:vms_school/Link/API/AdminAPI/Students/Students_APIs/Delete_Student_Penality.dart';
import 'package:vms_school/Link/Controller/AdminController/Students_Controllers/PenaltiesAndRewardsController.dart';
import 'package:vms_school/Translate/local_controller.dart';
import 'package:vms_school/main.dart';
import 'package:vms_school/widgets/ButtonsDialog.dart';
import 'package:vms_school/widgets/GridAnimation.dart';
import 'package:vms_school/widgets/PDF_View.dart';
import 'package:vms_school/widgets/VMSAlertDialog.dart';

class Childpenaltiesdialog extends StatefulWidget {
  const Childpenaltiesdialog({super.key});

  @override
  State<Childpenaltiesdialog> createState() => _ChildpenaltiesdialogState();
}

class _ChildpenaltiesdialogState extends State<Childpenaltiesdialog> {
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    int getCrossAxisCount() {
      if (screenWidth >= 650) return 2;
      return 1;
    }

    double getChildAspectRatio() {
      if (screenWidth >= 650) return 1.1;
      if (screenWidth >= 527) return 2.0;
      return 1.8;
    }

    return GetBuilder<Penaltiesandrewardscontroller>(
      builder: (PAR_Controller) {
        return VMSAlertDialog(
          action: [],
          contents: SizedBox(
            width: 600,
            height: Get.height,
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Text(
                    'Details'.tr,
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                ),
                PAR_Controller.isPenalityLoading
                    ? Expanded(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Center(child: CircularProgressIndicator()),
                          ],
                        ),
                      )
                    : PAR_Controller.penaltiesModel!.penaltyStudent!.isEmpty
                        ? Expanded(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Center(
                                    child: Text("No Penalty".tr,
                                        style: Theme.of(context)
                                            .textTheme
                                            .titleLarge!
                                            .copyWith(
                                                fontSize: 22,
                                                fontWeight:
                                                    FontWeight.normal))),
                              ],
                            ),
                          )
                        : Expanded(
                            child: Column(
                              children: [
                                // Penalties Table
                                Container(
                                  padding: EdgeInsets.all(16.0),
                                  child: GridView.builder(
                                    shrinkWrap: true,
                                    physics:
                                        const NeverScrollableScrollPhysics(),
                                    gridDelegate:
                                        SliverGridDelegateWithFixedCrossAxisCount(
                                      crossAxisCount: getCrossAxisCount(),
                                      childAspectRatio: getChildAspectRatio(),
                                      crossAxisSpacing: 15.0,
                                      mainAxisSpacing: 15.0,
                                    ),
                                    itemCount: PAR_Controller
                                        .penaltiesModel!.penaltyStudent!.length,
                                    itemBuilder: (context, index) {
                                      return HoverScaleCard(
                                        child: Container(
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(5),
                                              border: Border.all(
                                                  color: Colors.grey,
                                                  width: 0.5),
                                              color: Get.theme.cardColor,
                                              boxShadow: const [
                                                BoxShadow(
                                                    color: Colors.black26,
                                                    offset: Offset(0, 2),
                                                    blurRadius: 1)
                                              ]),
                                          child: SingleChildScrollView(
                                            child: Padding(
                                              padding: const EdgeInsets.only(
                                                  top: 7.0,
                                                  left: 10.0,
                                                  right: 5.0,
                                                  bottom: 5.0),
                                              child: Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.center,
                                                children: [
                                                  Padding(
                                                    padding:
                                                        const EdgeInsets.only(
                                                            top: 8.0,
                                                            bottom: 8.0),
                                                    child: Text((prefs!.getString(
                                                                languageKey) ==
                                                            'ar')
                                                        ? "( ${PAR_Controller.penaltiesModel!.penaltyStudent![index].penalty![0].name} )"
                                                        : "( ${PAR_Controller.penaltiesModel!.penaltyStudent![index].penalty![0].enName} )"),
                                                  ),
                                                  Row(
                                                    children: [
                                                      Text("Start Date".tr +
                                                          ": "),
                                                      Text(
                                                          "${PAR_Controller.penaltiesModel!.penaltyStudent![index].startDate}"),
                                                    ],
                                                  ),
                                                  Row(
                                                    children: [
                                                      Text(
                                                          "End Date".tr + ": "),
                                                      Text(
                                                          "${PAR_Controller.penaltiesModel!.penaltyStudent![index].endDate}"),
                                                    ],
                                                  ),
                                                  Row(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Text("Cause".tr + ": "),
                                                      Expanded(
                                                        child: Text(
                                                            maxLines: 10,
                                                            "${PAR_Controller.penaltiesModel!.penaltyStudent![index].cause}"),
                                                      )
                                                    ],
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ),
                                      );
                                    },
                                  ),
                                ),
                              ],
                            ),
                          ),
              ],
            ),
          ),
          apptitle: "Penalties".tr,
          subtitle: "none",
        );
      },
    );
  }
}
