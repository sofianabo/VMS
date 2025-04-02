import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vms_school/Link/API/API.dart';
import 'package:vms_school/Link/API/AdminAPI/School/School_Screen_APIs/Rewards_APIs/Delete_Reward_API.dart';
import 'package:vms_school/Link/Controller/AdminController/Students_Controllers/PenaltiesAndRewardsController.dart';
import 'package:vms_school/Translate/local_controller.dart';
import 'package:vms_school/main.dart';
import 'package:vms_school/widgets/PDF_View.dart';
import 'package:vms_school/widgets/VMSAlertDialog.dart';

class Re_Pe_Page extends StatefulWidget {
  Re_Pe_Page({required this.Id, required this.name, super.key});
  String Id;
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
                    Tab(text: 'Penalties'.tr),
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
                                                          onPressed: () async {
                                                            await Delete_Reward_API()
                                                                .Delete_Reward(
                                                                    Rewards_ID: PAR_Controller
                                                                        .Rewardsmodel!
                                                                        .prizes![
                                                                            index]
                                                                        .id!,
                                                                    ixd: index);
                                                          },
                                                          icon: Icon(
                                                              Icons
                                                                  .delete_outline_outlined,
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
                                  child: SingleChildScrollView(
                                    scrollDirection: Axis.vertical,
                                    child: DataTable(
                                      border: TableBorder.all(
                                        color: Get.theme.primaryColor,
                                        width: 1.0,
                                      ),
                                      columns: [
                                        DataColumn(label: Text('Penalty'.tr)),
                                        DataColumn(
                                            label: Text('Start Date'.tr)),
                                        DataColumn(label: Text('End Date'.tr)),
                                        DataColumn(label: Text('Reason'.tr)),
                                      ],
                                      rows: [
                                        for (var i in PAR_Controller
                                                .penaltiesModel
                                                ?.penaltyStudent ??
                                            [])
                                          DataRow(cells: [
                                            DataCell(Text(i.penalty != null &&
                                                    i.penalty!.isNotEmpty &&
                                                    prefs!.getString(
                                                            languageKey) ==
                                                        'ar'
                                                ? i.penalty![0].name ?? "N/A"
                                                : i.penalty != null &&
                                                        i.penalty!.isNotEmpty
                                                    ? i.penalty![0].enName
                                                    : "N/A")),
                                            DataCell(Text(
                                                "${i.startDate ?? 'N/A'}")),
                                            DataCell(
                                                Text("${i.endDate ?? 'N/A'}")),
                                            DataCell(
                                                Text("${i.cause ?? 'N/A'}")),
                                          ])
                                      ],
                                    ),
                                  ),
                                ),
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
