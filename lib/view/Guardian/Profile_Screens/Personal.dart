import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vms_school/Link/Controller/AuthController/Enroll_Controller.dart';
import 'package:vms_school/widgets/TextFildWithUpper.dart';

class Personal extends StatefulWidget {
  const Personal({super.key});

  @override
  State<Personal> createState() => _PersonalState();
}

class _PersonalState extends State<Personal> {
  TextEditingController First = TextEditingController();

  TextEditingController Last = TextEditingController();

  TextEditingController National = TextEditingController();

  TextEditingController Phone = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return GetBuilder<EnrollController>(builder: (controller) {
      return SingleChildScrollView(
        child: Column(
          children: [
            Column(
              spacing: 5.0,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Textfildwithupper(
                    onChanged: (value) {
                      if (value.isNotEmpty) {
                        controller.updateFieldError("name", false);
                      }
                    },
                    isError: controller.IsnameError,
                    isRequired: true,
                    width: 400,
                    controller: First,
                    Uptext: "First Name".tr,
                    hinttext: "First Name".tr),
                Textfildwithupper(
                    onChanged: (value) {
                      if (value.isNotEmpty) {
                        controller.updateFieldError("last", false);
                      }
                    },
                    isError: controller.IsLastnameError,
                    isRequired: true,
                    width: 400,
                    controller: Last,
                    Uptext: "Last Name".tr,
                    hinttext: "Last Name".tr),
                Textfildwithupper(
                    onChanged: (value) {
                      if (value.isNotEmpty) {
                        controller.updateFieldError("nid", false);
                      }
                    },
                    isError: controller.IsnidError,
                    isRequired: true,
                    fieldType: "number",
                    width: 400,
                    controller: National,
                    Uptext: "National ID".tr,
                    hinttext: "National ID".tr),
                Textfildwithupper(
                    onChanged: (value) {
                      if (value.isNotEmpty) {
                        controller.updateFieldError("phone", false);
                      }
                    },
                    isError: controller.IsphoneError,
                    isRequired: true,
                    fieldType: "phone",
                    width: 400,
                    controller: Phone,
                    Uptext: "Phone".tr,
                    hinttext: "Phone".tr),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(top: 15.0),
              child: TextButton(
                  style: ButtonStyle(
                    shape: WidgetStatePropertyAll(RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(5)))),
                    backgroundColor:
                        WidgetStatePropertyAll(Get.theme.canvasColor),
                    foregroundColor: WidgetStatePropertyAll(Colors.white),
                  ),
                  onPressed: () async {
                    if (controller.Isloading == false) {
                      bool isNameEmpty = First.text.trim().isEmpty;
                      bool isLastNameEmpty = Last.text.trim().isEmpty;
                      bool isPhoneEmpty = Phone.text.trim().isEmpty;
                      bool isNationalIDEmpty = National.text.trim().isEmpty;

                      controller.updateFieldError("name", isNameEmpty);
                      controller.updateFieldError("last", isLastNameEmpty);
                      controller.updateFieldError("phone", isPhoneEmpty);
                      controller.updateFieldError("nid", isNationalIDEmpty);

                      if (!(isNameEmpty ||
                          isPhoneEmpty ||
                          isNationalIDEmpty ||
                          isLastNameEmpty)) {
                        //هون ابو اللول
                      }
                    }
                  },
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    spacing: 10.0,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(
                            top: 5.0, bottom: 5.0, left: 20.0, right: 20.0),
                        child: Text("Save".tr),
                      ),
                      Icon(Icons.save_outlined)
                    ],
                  )),
            )
          ],
        ),
      );
    });
  }
}
