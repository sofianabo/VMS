import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vms_school/Icons_File/v_m_s__icons_icons.dart';
import 'package:vms_school/Link/API/API.dart';
import 'package:vms_school/Link/API/AdminAPI/School/School_Screen_APIs/Rewards_APIs/Delete_Reward_API.dart';
import 'package:vms_school/Link/API/AdminAPI/Students/Students_APIs/Delete_Student_Penality.dart';
import 'package:vms_school/Link/Controller/AdminController/Employee_Controllers/Add_Data_controller.dart';
import 'package:vms_school/Link/Controller/AdminController/Students_Controllers/PenaltiesAndRewardsController.dart';
import 'package:vms_school/Translate/local_controller.dart';
import 'package:vms_school/main.dart';
import 'package:vms_school/widgets/ButtonsDialog.dart';
import 'package:vms_school/widgets/GridAnimation.dart';
import 'package:vms_school/widgets/PDF_View.dart';
import 'package:vms_school/widgets/VMSAlertDialog.dart';

class Re_Pe_Page extends StatefulWidget {
  Re_Pe_Page(
      {required this.Id,
      required this.name,
      super.key,
      required this.isTeacher});
  String Id;
  bool isTeacher;
  String name;

  @override
  State<Re_Pe_Page> createState() => _Re_Pe_PageState();
}

class _Re_Pe_PageState extends State<Re_Pe_Page>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

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
      if (screenWidth >= 439) return 1.5;
      return 1.3;
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
                TabBar(
                  controller: _tabController,
                  labelColor: Get.theme.primaryColor,
                  unselectedLabelColor: Colors.grey,
                  indicatorColor: Get.theme.primaryColor,
                  indicatorWeight: 4.0,
                  splashBorderRadius: BorderRadius.circular(10),
                  dividerHeight: 0,
                  tabs: [
                    Tab(text: 'Rewards'.tr),
                    if (widget.isTeacher == false) Tab(text: 'Penalties'.tr),
                  ],
                ),
                Expanded(
                  child: TabBarView(
                    controller: _tabController,
                    children: [
                      PAR_Controller.Rewards_isLoading
                          ? Center(child: CircularProgressIndicator())
                          : PAR_Controller.Rewardsmodel!.prizes!.isEmpty
                              ? Center(
                                  child: Text("No Rewards".tr,
                                      style: Theme.of(context)
                                          .textTheme
                                          .titleLarge!
                                          .copyWith(
                                              fontSize: 22,
                                              fontWeight: FontWeight.normal)))
                              : Container(
                                  height: 600,
                                  width: 400,
                                  padding: EdgeInsets.all(16.0),
                                  child: SingleChildScrollView(
                                    child: ListView.builder(
                                      shrinkWrap: true,
                                      itemCount: PAR_Controller
                                          .Rewardsmodel!.prizes!.length,
                                      itemBuilder: (context, index) {
                                        return Container(
                                          height: 70,
                                          child: Column(
                                            spacing: 5.0,
                                            mainAxisSize: MainAxisSize.min,
                                            children: [
                                              Row(
                                                children: [
                                                  Text(
                                                      "${PAR_Controller.Rewardsmodel!.prizes![index].name}"),
                                                  Spacer(),
                                                  Row(
                                                    spacing: 10.0,
                                                    children: [
                                                      IconButton(
                                                          style: ButtonStyle(
                                                              backgroundColor:
                                                                  WidgetStatePropertyAll(Get
                                                                      .theme
                                                                      .primaryColor),
                                                              shape: WidgetStatePropertyAll(
                                                                  RoundedRectangleBorder(
                                                                      borderRadius:
                                                                          BorderRadius.all(Radius.circular(
                                                                              5))))),
                                                          onPressed: () {
                                                            final url =
                                                                '$getpdf${PAR_Controller.Rewardsmodel!.prizes![index].fileId}';
                                                            openFileInNewTab(
                                                                filePath: url);
                                                          },
                                                          icon: Icon(
                                                              Icons
                                                                  .file_download_outlined,
                                                              size: 20,
                                                              color: Colors
                                                                  .white)),
                                                      if (widget.isTeacher ==
                                                          false)
                                                        if (Get.find<Add_Data_controller>()
                                                                .roll !=
                                                            "observer")
                                                          IconButton(
                                                              style: ButtonStyle(
                                                                  backgroundColor:
                                                                      WidgetStatePropertyAll(Get
                                                                          .theme
                                                                          .primaryColor),
                                                                  shape: WidgetStatePropertyAll(RoundedRectangleBorder(
                                                                      borderRadius:
                                                                          BorderRadius.all(Radius.circular(
                                                                              5))))),
                                                              onPressed:
                                                                  () async {
                                                                await Delete_Reward_API().Delete_Reward(
                                                                    Rewards_ID: PAR_Controller
                                                                        .Rewardsmodel!
                                                                        .prizes![
                                                                            index]
                                                                        .id!,
                                                                    ixd: index);
                                                              },
                                                              icon: Icon(Icons.delete_outline_outlined,
                                                                  size: 20,
                                                                  color: Colors
                                                                      .white)),
                                                    ],
                                                  ),
                                                ],
                                              ),
                                              Divider(),
                                            ],
                                          ),
                                        );
                                      },
                                    ),
                                  ),
                                ),

                      // Penalties Table
                      if (widget.isTeacher == false)
                        PAR_Controller.isPenalityLoading
                            ? Center(child: CircularProgressIndicator())
                            : PAR_Controller
                                    .penaltiesModel!.penaltyStudent!.isEmpty
                                ? Center(
                                    child: Text("No Penalty".tr,
                                        style: Theme.of(context)
                                            .textTheme
                                            .titleLarge!
                                            .copyWith(
                                                fontSize: 22,
                                                fontWeight: FontWeight.normal)))
                                : Container(
                                    padding: EdgeInsets.all(16.0),
                                    child: GridView.builder(
                                      itemCount: PAR_Controller.penaltiesModel!
                                          .penaltyStudent!.length,
                                      gridDelegate:
                                          SliverGridDelegateWithFixedCrossAxisCount(
                                        crossAxisCount: getCrossAxisCount(),
                                        childAspectRatio: getChildAspectRatio(),
                                        crossAxisSpacing: 15.0,
                                        mainAxisSpacing: 15.0,
                                      ),
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
                                            width: 250,
                                            height: 250,
                                            child: SingleChildScrollView(
                                              child: Padding(
                                                padding: const EdgeInsets.only(
                                                    top: 7.0,
                                                    left: 10.0,
                                                    right: 5.0,
                                                    bottom: 5.0),
                                                child: Column(
                                                  spacing: 10.0,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.center,
                                                  children: [
                                                    Row(
                                                      children: [
                                                        if (Get.find<Add_Data_controller>()
                                                                .roll !=
                                                            "observer")
                                                          IconButton(
                                                              style: ButtonStyle(
                                                                  backgroundColor:
                                                                      WidgetStatePropertyAll(
                                                                          Color(
                                                                              0xffB03D3D)),
                                                                  shape: const WidgetStatePropertyAll(
                                                                      RoundedRectangleBorder(
                                                                          borderRadius: BorderRadius.all(Radius.circular(
                                                                              5))))),
                                                              onPressed: () {
                                                                Get.dialog(
                                                                    VMSAlertDialog(
                                                                  action: [
                                                                    ButtonDialog(
                                                                        text: "Delete"
                                                                            .tr,
                                                                        onPressed:
                                                                            () async {
                                                                          await deleteStudentPenalty_API().deleteStudentPenalty_AP(
                                                                              index: index,
                                                                              penaltyId: PAR_Controller.penaltiesModel!.penaltyStudent![index].id!);
                                                                        },
                                                                        color: const Color(
                                                                            0xffB03D3D),
                                                                        width:
                                                                            80),
                                                                    ButtonDialog(
                                                                        text: "Cancel"
                                                                            .tr,
                                                                        onPressed:
                                                                            () {
                                                                          Get.back();
                                                                        },
                                                                        color: Theme.of(context)
                                                                            .primaryColor,
                                                                        width:
                                                                            80)
                                                                  ],
                                                                  contents:
                                                                      SizedBox(
                                                                          width:
                                                                              500,
                                                                          child:
                                                                              Row(
                                                                            mainAxisAlignment:
                                                                                MainAxisAlignment.start,
                                                                            children: [
                                                                              Text(
                                                                                "Do You Want To Delete".tr,
                                                                                style: Get.theme.textTheme.bodyMedium!.copyWith(fontSize: 16, fontWeight: FontWeight.normal),
                                                                              ),
                                                                            ],
                                                                          )),
                                                                  apptitle:
                                                                      "Delete Penalty"
                                                                          .tr,
                                                                  subtitle:
                                                                      "none",
                                                                ));
                                                              },
                                                              icon: Icon(
                                                                  VMS_Icons.bin,
                                                                  size: 16,
                                                                  color: Colors
                                                                      .white)),
                                                      ],
                                                    ),
                                                    Padding(
                                                      padding:
                                                          const EdgeInsets.only(
                                                              top: 8.0,
                                                              bottom: 8.0),
                                                      child: Text(Get.find<
                                                                      LocalizationController>()
                                                                  .currentLocale
                                                                  .value
                                                                  .languageCode ==
                                                              'ar'
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
                                                        Text("End Date".tr +
                                                            ": "),
                                                        Text(
                                                            "${PAR_Controller.penaltiesModel!.penaltyStudent![index].endDate ?? "Not Selected".tr}"),
                                                      ],
                                                    ),
                                                    Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .start,
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
                                    )),
                    ],
                  ),
                ),
              ],
            ),
          ),
          apptitle: "Rewards & Penalties".tr,
          subtitle: "none",
        );
      },
    );
  }
}
