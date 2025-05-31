import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vms_school/Link/Controller/AdminController/Employee_Controllers/Add_Data_controller.dart';
import 'package:vms_school/Link/Controller/AdminController/Main_Admin_Controller/AdminHomeContentController.dart';
import 'package:vms_school/view/Both_Platform/widgets/ButtonsDialog.dart';
import 'package:vms_school/view/SMS_Platform/Admin/All_Settings/Profile_Settings.dart';
import 'package:vms_school/view/SMS_Platform/Admin/Requests/Requests.dart';
import 'package:vms_school/view/SMS_Platform/Registeration/Registeration_Home_Screens/AppBarRegisteration.dart';

class RegisterationHome extends StatefulWidget {
  const RegisterationHome({super.key});

  @override
  State<RegisterationHome> createState() => _RegisterationHomeState();
}

var addController = Get.find<Add_Data_controller>();

class _RegisterationHomeState extends State<RegisterationHome> {
  @override
  Widget build(BuildContext context) {
    return Directionality(
        textDirection: TextDirection.ltr,
        child: Scaffold(
          body: GetBuilder<AdminHomeContentController>(builder: (controller) {
            return GetBuilder<Add_Data_controller>(builder: (conts) {
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
                return Stack(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        AppbarRegisteration(),
                        Expanded(
                          child: Builder(
                            builder: (context) {
                              switch (controller.content) {
                                case "Enroll Requests":
                                  return Requests();
                                case "My Profile":
                                  return ProfileSettings();
                                default:
                                  return Requests();
                              }
                            },
                          ),
                        ),
                      ],
                    ),
                  ],
                );
              }
            });
          }),
        ));
  }
}
