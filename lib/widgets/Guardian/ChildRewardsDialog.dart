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

class Childrewardsdialog extends StatefulWidget {
  Childrewardsdialog({required this.Id, required this.name, super.key});
  String Id;
  String name;

  @override
  State<Childrewardsdialog> createState() => _ChildrewardsdialogState();
}

class _ChildrewardsdialogState extends State<Childrewardsdialog>
    with SingleTickerProviderStateMixin {


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
               
                Expanded(
                  child: Column(
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

                     
                    ],
                  ),
                ),
              ],
            ),
          ),
          apptitle: "Rewards".tr,
          subtitle: "none",
        );
      },
    );
  }
}
