import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vms_school/Link/API/AdminAPI/EditGuardianAPI.dart';
import 'package:vms_school/Link/Controller/AdminController/allGaurdianController.dart';
import 'package:vms_school/widgets/ButtonsDialog.dart';
import 'package:vms_school/widgets/TextFieldDialog.dart';
import 'package:vms_school/widgets/VMSAlertDialog.dart';
import '../../widgets/GridAnimation.dart';

class AllGuardianGrid extends StatelessWidget {
  
  TextEditingController gUserName = TextEditingController();
  TextEditingController gNationalID = TextEditingController();
  TextEditingController gEmail = TextEditingController();
  TextEditingController gphone = TextEditingController();
  AllGuardianGrid({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<Allgaurdiancontroller>(builder: (control) {
      return GridView.builder(
        padding: const EdgeInsets.only(top: 10, left: 40, right: 40),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: Get.width <= 1226 && Get.width >= 988
                ? 3
                : Get.width <= 987 && Get.width >= 759
                    ? 2
                    : Get.width <= 758
                        ? 1
                        : 4,
            crossAxisSpacing: 20.0,
            mainAxisSpacing: 20.0,
            childAspectRatio: Get.width <= 1226 && Get.width >= 988
                ? 2.2
                : Get.width <= 987 && Get.width >= 759
                    ? 2.7
                    : Get.width <= 758 && Get.width >= 573
                        ? 3.8
                        : Get.width <= 573
                            ? 3.0
                            : 1.8),
        itemCount: control.guardian.length,
        itemBuilder: (context, index) {
          gUserName.text = control.guardian[index].name!;
          gNationalID.text = control.guardian[index].nationalId!;
          gEmail.text = control.guardian[index].email!;
          gphone.text = control.guardian[index].phone!;
          return HoverScaleCard(
            child: GestureDetector(
              onTap: () {
                Get.dialog(VMSAlertDialog(
                    contents: SizedBox(
                        child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Guardian Name",
                                  style: Get.theme.primaryTextTheme.labelSmall,
                                ),
                                TextFieldDialog(
                                    controller: gUserName,
                                    hinttext: "${control.guardian[index].name}")
                              ],
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 15.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Guardian National ID",
                                    style:
                                        Get.theme.primaryTextTheme.labelSmall,
                                  ),
                                  TextFieldDialog(
                                      controller: gNationalID,
                                      hinttext:
                                          "${control.guardian[index].nationalId}")
                                ],
                              ),
                            )
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 20.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Guardian Email",
                                    style:
                                        Get.theme.primaryTextTheme.labelSmall,
                                  ),
                                  TextFieldDialog(
                                      controller: gEmail,
                                      hinttext:
                                          "${control.guardian[index].email}")
                                ],
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 15.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Guardian Phone Number",
                                      style:
                                          Get.theme.primaryTextTheme.labelSmall,
                                    ),
                                    TextFieldDialog(
                                        controller: gphone,
                                        hinttext:
                                            "${control.guardian[index].phone}")
                                  ],
                                ),
                              )
                            ],
                          ),
                        )
                      ],
                    )),
                    action: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          ButtonDialog(
                              width: 80,
                              text: "Edit",
                              onPressed: () async {
                                await Editguardianapi(context).Editguardian(
                                    control.guardian[index].id!,
                                    gUserName.text,
                                    gEmail.text,
                                    gNationalID.text,
                                    gphone.text,
                                    index);
                                Get.back();
                              },
                              color: Get.theme.colorScheme.primary)
                        ],
                      )
                    ],
                    apptitle: "Edit Guardian",
                    subtitle: "none"));
              },
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
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: Text("${control.guardian[index].name}",
                                style: Get.theme.primaryTextTheme.bodyMedium!
                                    .copyWith(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold)),
                          ),
                        ],
                      ),
                      Text("Email: ${control.guardian[index].email}",
                          style: Get.theme.primaryTextTheme.bodySmall),
                      Text("Mobile Number : ${control.guardian[index].phone}",
                          style: Get.theme.primaryTextTheme.bodySmall),
                    ],
                  )),
            ),
          );
        },
      );
    });
  }
}
