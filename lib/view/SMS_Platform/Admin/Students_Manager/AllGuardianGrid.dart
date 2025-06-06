import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:get/get.dart';
import 'package:vms_school/Link/API/AdminAPI/Students/Guardian_APIS/EditGuardianAPI.dart';
import 'package:vms_school/Link/Controller/AdminController/Employee_Controllers/Add_Data_controller.dart';
import 'package:vms_school/Link/Controller/AdminController/Students_Controllers/allGaurdianController.dart';
import 'package:vms_school/Translate/local_controller.dart';
import 'package:vms_school/main.dart';
import 'package:vms_school/view/Both_Platform/widgets/ButtonsDialog.dart';
import 'package:vms_school/view/Both_Platform/widgets/GridAnimation.dart';
import 'package:vms_school/view/Both_Platform/widgets/Schema_Widget.dart';
import 'package:vms_school/view/Both_Platform/widgets/TextFildWithUpper.dart';
import 'package:vms_school/view/Both_Platform/widgets/VMSAlertDialog.dart';

class AllGuardianGrid extends StatelessWidget {
  TextEditingController gName = TextEditingController();
  TextEditingController gNationalID = TextEditingController();
  TextEditingController gEmail = TextEditingController();
  TextEditingController gphone = TextEditingController();
  AllGuardianGrid({super.key});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    int getCrossAxisCount(double screenWidth) {
      if (screenWidth >= 1226) return 4;
      if (screenWidth >= 988) return 3;
      if (screenWidth >= 759) return 2;
      return 1;
    }

// متغيرات لتحديد نسبة الطول/العرض للعناصر
    double getChildAspectRatio(double screenWidth) {
      if (screenWidth >= 1226) return 1.8;
      if (screenWidth >= 988) return 2.2;
      if (screenWidth >= 759) return 2.6;
      if (screenWidth >= 573) return 3.8;
      return 3.0;
    }

    return Directionality(
      textDirection:
          Get.find<LocalizationController>().currentLocale.value.languageCode ==
                  'ar'
              ? TextDirection.rtl
              : TextDirection.ltr,
      child: GetBuilder<Allgaurdiancontroller>(builder: (control) {
        return control.isLoading == true
            ? GridView.builder(
                padding: const EdgeInsets.only(top: 10, left: 40, right: 40),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: getCrossAxisCount(width),
                  crossAxisSpacing: 20.0,
                  mainAxisSpacing: 20.0,
                  childAspectRatio: getChildAspectRatio(width),
                ),
                itemCount: 12,
                itemBuilder: (context, index) {
                  return HoverScaleCard(
                    child: Container(
                        padding: const EdgeInsets.all(20),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            border: Border.all(color: Colors.grey, width: 0.5),
                            color: Theme.of(context).cardColor,
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
                                  child: SchemaWidget(width: 30, height: 15),
                                ),
                              ],
                            ),
                            SchemaWidget(width: 40, height: 15),
                            SchemaWidget(width: 40, height: 15),
                          ],
                        )),
                  );
                },
              ).animate(onPlay: (controller) => controller.repeat()).shimmer(
                angle: 1,
                color: Colors.grey.withOpacity(0.2),
                duration: const Duration(seconds: 1),
                delay: const Duration(seconds: 1))
            : control.filteredregaurdians!.isEmpty
                ? Center(
                    child: Text("No Guardian".tr,
                        style: Theme.of(context).textTheme.titleLarge!.copyWith(
                            fontSize: 22, fontWeight: FontWeight.normal)))
                : GridView.builder(
                    padding:
                        const EdgeInsets.only(top: 10, left: 40, right: 40),
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: getCrossAxisCount(width),
                        crossAxisSpacing: 20.0,
                        mainAxisSpacing: 20.0,
                        childAspectRatio: getChildAspectRatio(width)),
                    itemCount: control.filteredregaurdians!.length,
                    itemBuilder: (context, index) {
                      return HoverScaleCard(
                        child: GestureDetector(
                          onTap: () {
                            control.resetError();
                            gName.text =
                                control.filteredregaurdians![index].name!;
                            gNationalID.text =
                                control.filteredregaurdians![index].nationalId!;
                            gEmail.text =
                                control.filteredregaurdians![index].email!;
                            gphone.text =
                                control.filteredregaurdians![index].phone!;

                            Get.dialog(GetBuilder<Allgaurdiancontroller>(
                                builder: (controller) {
                              return VMSAlertDialog(
                                  contents: Container(
                                    width: 550,
                                    child: SingleChildScrollView(
                                      child: Column(
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          Wrap(
                                            alignment:
                                                WrapAlignment.spaceBetween,
                                            crossAxisAlignment:
                                                WrapCrossAlignment.center,
                                            runAlignment:
                                                WrapAlignment.spaceBetween,
                                            spacing: 8.0,
                                            runSpacing: 8.0,
                                            children: [
                                              Textfildwithupper(
                                                  onChanged: (value) {
                                                    if (value.isNotEmpty) {
                                                      controller
                                                          .updateFieldError(
                                                              "name", false);
                                                    }
                                                  },
                                                  isError:
                                                      controller.IsnameError,
                                                  Uptext: "Guardian Name".tr,
                                                  isRequired: true,
                                                  controller: gName,
                                                  hinttext:
                                                      "${controller.filteredregaurdians![index].name}"),
                                              Textfildwithupper(
                                                  fieldType: "number",
                                                  onChanged: (value) {
                                                    if (value.isNotEmpty) {
                                                      controller
                                                          .updateFieldError(
                                                              "nid", false);
                                                    }
                                                  },
                                                  isError:
                                                      controller.IsnidError,
                                                  Uptext:
                                                      "Guardian National ID".tr,
                                                  isRequired: true,
                                                  controller: gNationalID,
                                                  hinttext:
                                                      "${controller.filteredregaurdians![index].nationalId}")
                                            ],
                                          ),
                                          Wrap(
                                            alignment:
                                                WrapAlignment.spaceBetween,
                                            crossAxisAlignment:
                                                WrapCrossAlignment.center,
                                            runAlignment:
                                                WrapAlignment.spaceBetween,
                                            spacing: 8.0,
                                            runSpacing: 8.0,
                                            children: [
                                              Textfildwithupper(
                                                  onChanged: (value) {
                                                    if (value.isNotEmpty) {
                                                      controller
                                                          .updateFieldError(
                                                              "email", false);
                                                    }
                                                  },
                                                  isError:
                                                      controller.IsEmailError,
                                                  isRequired: true,
                                                  fieldType: "email",
                                                  Uptext: "Guardian Email".tr,
                                                  controller: gEmail,
                                                  hinttext:
                                                      "${controller.filteredregaurdians![index].email}"),
                                              Textfildwithupper(
                                                  onChanged: (value) {
                                                    if (value.isNotEmpty) {
                                                      controller
                                                          .updateFieldError(
                                                              "phone", false);
                                                    }
                                                  },
                                                  fieldType: "phone",
                                                  isError:
                                                      controller.IsphoneError,
                                                  Uptext:
                                                      "Guardian Phone Number"
                                                          .tr,
                                                  isRequired: true,
                                                  controller: gphone,
                                                  hinttext:
                                                      "${controller.filteredregaurdians![index].phone}")
                                            ],
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                  action: [
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        ButtonDialog(
                                            width: 80,
                                            text: "Edit".tr,
                                            onPressed: () async {
                                              if (Get.find<
                                                          Add_Data_controller>()
                                                      .roll !=
                                                  "subAdmin") {
                                                bool isNameEmpty =
                                                    gName.text.trim().isEmpty;
                                                bool isPhoneEmpty =
                                                    gphone.text.trim().isEmpty;
                                                bool isNationalIDEmpty =
                                                    gNationalID.text
                                                        .trim()
                                                        .isEmpty;
                                                bool isEmailEmpty =
                                                    gEmail.text.trim().isEmpty;

                                                RegExp emailRegex = RegExp(
                                                    r"^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$");
                                                bool isEmailValid = emailRegex
                                                    .hasMatch(gEmail.text);

                                                controller.updateFieldError(
                                                    "name", isNameEmpty);
                                                controller.updateFieldError(
                                                    "phone", isPhoneEmpty);
                                                controller.updateFieldError(
                                                    "nid", isNationalIDEmpty);
                                                controller.updateFieldError(
                                                    "email",
                                                    isEmailEmpty ||
                                                        !isEmailValid);

                                                if (!(isNameEmpty ||
                                                    isPhoneEmpty ||
                                                    isNationalIDEmpty ||
                                                    isEmailEmpty ||
                                                    !isEmailValid)) {
                                                  await Editguardianapi(context)
                                                      .Editguardian(
                                                          controller
                                                              .filteredregaurdians![
                                                                  index]
                                                              .id!,
                                                          gName.text,
                                                          gEmail.text,
                                                          gNationalID.text,
                                                          gphone.text,
                                                          index);
                                                }
                                              }
                                            },
                                            color:
                                                Get.find<Add_Data_controller>()
                                                            .roll ==
                                                        "subAdmin"
                                                    ? Get.theme.disabledColor
                                                    : Theme.of(context)
                                                        .primaryColor)
                                      ],
                                    )
                                  ],
                                  apptitle: "Edit Guardian".tr,
                                  subtitle: "none");
                            }));
                          },
                          child: Container(
                              padding: const EdgeInsets.all(20),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5),
                                  border: Border.all(
                                      color: Colors.grey, width: 0.5),
                                  color: Theme.of(context).cardColor,
                                  boxShadow: const [
                                    BoxShadow(
                                        color: Colors.black26,
                                        offset: Offset(0, 2),
                                        blurRadius: 1)
                                  ]),
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Expanded(
                                        child: Text(
                                            overflow: TextOverflow.ellipsis,
                                            "${control.filteredregaurdians![index].name}",
                                            style: Theme.of(context)
                                                .textTheme
                                                .bodyMedium!
                                                .copyWith(
                                                    fontSize: 20,
                                                    fontWeight:
                                                        FontWeight.bold)),
                                      ),
                                      Text(
                                          overflow: TextOverflow.ellipsis,
                                          "${control.filteredregaurdians![index].userName}",
                                          style: Theme.of(context)
                                              .textTheme
                                              .titleLarge!),
                                    ],
                                  ),
                                  Text(
                                      overflow: TextOverflow.ellipsis,
                                      "Email:".tr +
                                          " ${control.filteredregaurdians![index].email}",
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyMedium!),
                                  Text(
                                      overflow: TextOverflow.ellipsis,
                                      "Mobile Number :".tr +
                                          " ${control.filteredregaurdians![index].phone}",
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyMedium!),
                                ],
                              )),
                        ),
                      );
                    },
                  );
      }),
    );
  }
}
