import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vms_school/Link/API/AdminAPI/School/School_Screen_APIs/Sessions/SessionAPI.dart';
import 'package:vms_school/Link/API/Guardians_API/Get_My_Children_API.dart';
import 'package:vms_school/Link/Controller/AdminController/Employee_Controllers/Add_Data_controller.dart';
import 'package:vms_school/Link/Controller/GuardianController/AddGurdianChildController.dart';
import 'package:vms_school/Link/Controller/GuardianController/MyChildren_Controller.dart';
import 'package:vms_school/view/Both_Platform/widgets/Admin/Admin_School/All_Screen_Sessions.dart';
import 'package:vms_school/view/Both_Platform/widgets/Guardian/DropdownGurdianSession.dart';
import 'package:vms_school/view/SMS_Platform/Guardian/AppBarGuardian.dart';
import 'package:vms_school/view/SMS_Platform/Guardian/Functions/Add_Student_For_Guardian.dart';
import 'package:vms_school/view/SMS_Platform/Guardian/MainScreen/GuardianMainScreenGrid.dart';
import 'package:vms_school/view/Both_Platform/widgets/ButtonsDialog.dart';
import 'package:vms_school/view/Both_Platform/widgets/Loading_Dialog.dart';
import 'package:vms_school/view/Both_Platform/widgets/TextFormSearch.dart';

class GuardianMainScreen extends StatefulWidget {
  const GuardianMainScreen({super.key});

  @override
  State<GuardianMainScreen> createState() => _GuardianMainScreenState();
}

class _GuardianMainScreenState extends State<GuardianMainScreen> {
  TextEditingController search = TextEditingController();

  @override
  void initState() {
    Get_Session_Screen_API().Getsession();

    Get_My_Children_API().Get_My_Children();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      body: GetBuilder<Add_Data_controller>(builder: (conts) {
        if (!conts.isVerified) {
          return Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
              spacing: 10.0,
              children: [
                Text("You have not confirmed your account yet.".tr),
                ButtonDialog(
                    text: "Verified Now".tr,
                    onPressed: () async {
                      if (!conts.isVerified) {
                        if (!Get.isDialogOpen!) {
                          await conts.showVerificationDialog();
                        }
                      }
                    },
                    color: Theme.of(context).primaryColor,
                    width: 250),
              ],
            ), 
          );
        } else {
          return GetBuilder<MyChildren_Controller>(builder: (control) {
            return Expanded(
              child: Column(
                children: [
                  Appbarguardian(),
                  if (screenWidth > 769)
                    Container(
                      width: double.infinity,
                      margin: const EdgeInsets.symmetric(
                          horizontal: 30.0, vertical: 10.0),
                      child: Wrap(
                        spacing: 8.0,
                        runSpacing: 8.0,
                        alignment: WrapAlignment.spaceBetween,
                        crossAxisAlignment: WrapCrossAlignment.center,
                        runAlignment: WrapAlignment.spaceBetween,
                        children: [
                          Wrap(
                            spacing: 8.0,
                            runSpacing: 8.0,
                            crossAxisAlignment: WrapCrossAlignment.center,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(top: 17.0),
                                child: Dropdowngurdiansession(
                                  title: "Session".tr,
                                  type: "session",
                                  width: 200,
                                  isLoading: control.isLoadingSession,
                                ),
                              ),
                              GetBuilder<MyChildren_Controller>(
                                  builder: (controller) {
                                return TextFormSearch(
                                  width: screenWidth - 350,
                                  click: () {
                                    controller.clearFilter();
                                  },
                                  onchange: (value) {
                                    controller.searchByName(value);
                                  },
                                  radius: 5,
                                  controller: search,
                                  suffixIcon: search.text.isNotEmpty
                                      ? Icons.close
                                      : Icons.search,
                                );
                              }),
                            ],
                          ),
                          Container(
                            width: 41,
                            height: 41,
                            decoration: BoxDecoration(
                              color: Theme.of(context).cardColor,
                              borderRadius: BorderRadius.circular(5),
                              boxShadow: const [
                                BoxShadow(
                                  color: Colors.black12,
                                  offset: Offset(0, 2),
                                  blurRadius: 1,
                                ),
                              ],
                            ),
                            child: IconButton(
                              style: const ButtonStyle(
                                shape: WidgetStatePropertyAll(
                                  RoundedRectangleBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(5)),
                                  ),
                                ),
                              ),
                              onPressed: () {
                                Get.find<Addgurdianchildcontroller>()
                                    .resetError();

                                Add_Students_Guardian_Functions();
                              },
                              icon: Icon(
                                Icons.add,
                                size: 18,
                                color: Theme.of(context)
                                    .textTheme
                                    .titleMedium!
                                    .color!,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  if (screenWidth <= 769)
                    Container(
                      width: double.infinity,
                      margin: const EdgeInsets.symmetric(
                          horizontal: 30.0, vertical: 10.0),
                      child: Wrap(
                        spacing: 8.0,
                        runSpacing: 8.0,
                        alignment: WrapAlignment.spaceBetween,
                        crossAxisAlignment: WrapCrossAlignment.center,
                        runAlignment: WrapAlignment.spaceBetween,
                        children: [
                          Wrap(
                            spacing: 8.0,
                            runSpacing: 8.0,
                            crossAxisAlignment: WrapCrossAlignment.center,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(top: 17.0),
                                child: Dropdowngurdiansession(
                                  title: "Session".tr,
                                  type: "session",
                                  width: 200,
                                  isLoading: control.isLoadingSession,
                                ),
                              ),
                              Row(
                                spacing: 10,
                                children: [
                                  GetBuilder<MyChildren_Controller>(
                                      builder: (controller) {
                                    return TextFormSearch(
                                      width: screenWidth - 150,
                                      click: () {
                                        controller.clearFilter();
                                      },
                                      onchange: (value) {
                                        controller.searchByName(value);
                                      },
                                      radius: 5,
                                      controller: search,
                                      suffixIcon: search.text.isNotEmpty
                                          ? Icons.close
                                          : Icons.search,
                                    );
                                  }),
                                  Container(
                                    width: 41,
                                    height: 41,
                                    decoration: BoxDecoration(
                                      color: Theme.of(context).cardColor,
                                      borderRadius: BorderRadius.circular(5),
                                      boxShadow: const [
                                        BoxShadow(
                                          color: Colors.black12,
                                          offset: Offset(0, 2),
                                          blurRadius: 1,
                                        ),
                                      ],
                                    ),
                                    child: IconButton(
                                      style: const ButtonStyle(
                                        shape: WidgetStatePropertyAll(
                                          RoundedRectangleBorder(
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(5)),
                                          ),
                                        ),
                                      ),
                                      onPressed: () {
                                        Get.find<Addgurdianchildcontroller>()
                                            .resetError();

                                        Add_Students_Guardian_Functions();
                                      },
                                      icon: Icon(
                                        Icons.add,
                                        size: 18,
                                        color: Theme.of(context)
                                            .textTheme
                                            .titleMedium!
                                            .color!,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  Expanded(
                      child: Padding(
                    padding: const EdgeInsets.only(top: 15.0),
                    child: GuardianMainScreenGrid(),
                  )),
                ],
              ),
            );
          });
        }
      }),
    );
  }
}
