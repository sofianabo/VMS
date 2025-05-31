import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vms_school/Link/API/Guardians_API/Update_My_Data_API.dart';
import 'package:vms_school/Link/Controller/AuthController/Enroll_Controller.dart';
import 'package:vms_school/Link/Controller/GuardianController/Guardian_My_Data_Controller.dart';
import 'package:vms_school/view/Both_Platform/widgets/TextFildWithUpper.dart';

class Personal extends StatefulWidget {
  const Personal({super.key});

  @override
  State<Personal> createState() => _PersonalState();
}

class _PersonalState extends State<Personal> {
  var controller = Get.find<Guardian_My_Data_Controller>();
  TextEditingController First = TextEditingController();
  TextEditingController Username = TextEditingController();

  TextEditingController Last = TextEditingController();

  TextEditingController National = TextEditingController();

  TextEditingController Phone = TextEditingController();

  Future<void> loadData() async {
    if (controller.guardianMyData!.data != null) {
      First.text = controller.guardianMyData!.data!.fullName ?? '';
      National.text = controller.guardianMyData!.data!.nationalId ?? '';
      Phone.text = controller.guardianMyData!.data!.phone ?? '';
      Username.text = controller.guardianMyData!.data!.userName ?? '';
    }
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<Guardian_My_Data_Controller>(builder: (Gua_Controller) {
      if (!Gua_Controller.isLoading) {
        loadData();
      }
      return GetBuilder<EnrollController>(builder: (controller) {
        return SingleChildScrollView(
          child: Column(
            children: [
              Column(
                spacing: 5.0,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Textfildwithupper(
                      enabled: false,
                      width: 400,
                      controller: Username,
                      Uptext: "Username".tr,
                      hinttext: "Username".tr),
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
                      Uptext: "Full Name".tr,
                      hinttext: "Full Name".tr),
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
                        bool isPhoneEmpty = Phone.text.trim().isEmpty;
                        bool isNationalIDEmpty = National.text.trim().isEmpty;

                        controller.updateFieldError("name", isNameEmpty);
                        controller.updateFieldError("phone", isPhoneEmpty);
                        controller.updateFieldError("nid", isNationalIDEmpty);

                        if (!(isNameEmpty ||
                            isPhoneEmpty ||
                            isNationalIDEmpty)) {
                          await Update_My_Data_API().Update_My_Data(
                              full: First.text,
                              National: National.text,
                              Phone: Phone.text);
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
    });
  }
}
