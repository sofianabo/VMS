import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:get/get.dart';
import 'package:vms_school/Link/API/AdminAPI/Students/Guardian_APIS/EditGuardianAPI.dart';
import 'package:vms_school/Link/Controller/AdminController/Students_Controllers/allGaurdianController.dart';
import 'package:vms_school/Translate/local_controller.dart';
import 'package:vms_school/main.dart';
import 'package:vms_school/widgets/ButtonsDialog.dart';
import 'package:vms_school/widgets/Schema_Widget.dart';
import 'package:vms_school/widgets/TextFildWithUpper.dart';
import 'package:vms_school/widgets/VMSAlertDialog.dart';
import '../../../widgets/GridAnimation.dart';

class AllGuardianGrid extends StatelessWidget {
  TextEditingController gName = TextEditingController();
  TextEditingController gNationalID = TextEditingController();
  TextEditingController gEmail = TextEditingController();
  TextEditingController gphone = TextEditingController();
  AllGuardianGrid({super.key});

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: prefs!.getString(languageKey) == 'ar'
          ? TextDirection.rtl
          : TextDirection.ltr,
      child: GetBuilder<Allgaurdiancontroller>(builder: (control) {
        return control.isLoading == true
            ? GridView.builder(
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
                itemCount: Get.width <= 1226 && Get.width >= 988
                    ? 9
                    : Get.width <= 987 && Get.width >= 759
                        ? 6
                        : Get.width <= 758
                            ? 4
                            : 12,
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
                                  contents: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Textfildwithupper(
                                              onChanged: (value) {
                                                if (value.isNotEmpty) {
                                                  controller.updateFieldError(
                                                      "name", false);
                                                }
                                              },
                                              isError: controller.IsnameError,
                                              Uptext: "Guardian Name".tr,
                                              isRequired: true,
                                              controller: gName,
                                              hinttext:
                                                  "${controller.filteredregaurdians![index].name}"),
                                          Padding(
                                            padding: EdgeInsets.only(
                                                left: prefs!.getString(
                                                            languageKey) ==
                                                        "ar"
                                                    ? 0
                                                    : 20.0,
                                                right: prefs!.getString(
                                                            languageKey) ==
                                                        "ar"
                                                    ? 20
                                                    : 0),
                                            child: Textfildwithupper(
                                                fieldType: "number",
                                                onChanged: (value) {
                                                  if (value.isNotEmpty) {
                                                    controller.updateFieldError(
                                                        "nid", false);
                                                  }
                                                },
                                                isError: controller.IsnidError,
                                                Uptext:
                                                    "Guardian National ID".tr,
                                                isRequired: true,
                                                controller: gNationalID,
                                                hinttext:
                                                    "${controller.filteredregaurdians![index].nationalId}"),
                                          )
                                        ],
                                      ),
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(top: 20.0),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Textfildwithupper(
                                                onChanged: (value) {
                                                  if (value.isNotEmpty) {
                                                    controller.updateFieldError(
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
                                            Padding(
                                              padding: EdgeInsets.only(
                                                  left: prefs!.getString(
                                                              languageKey) ==
                                                          "ar"
                                                      ? 0
                                                      : 20.0,
                                                  right: prefs!.getString(
                                                              languageKey) ==
                                                          "ar"
                                                      ? 20
                                                      : 0),
                                              child: Textfildwithupper(
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
                                                      "${controller.filteredregaurdians![index].phone}"),
                                            )
                                          ],
                                        ),
                                      )
                                    ],
                                  ),
                                  action: [
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        ButtonDialog(
                                            width: 80,
                                            text: "Edit".tr,
                                            onPressed: () async {
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
                                            },
                                            color:
                                                Theme.of(context).primaryColor)
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
                                          "${control.filteredregaurdians![index].userName}",
                                          style: Theme.of(context)
                                              .textTheme
                                              .titleLarge!),
                                    ],
                                  ),
                                  Text(
                                      "Email:".tr +
                                          " ${control.filteredregaurdians![index].email}",
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyMedium!),
                                  Text(
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
