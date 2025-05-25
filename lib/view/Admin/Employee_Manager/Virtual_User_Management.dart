import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vms_school/Icons_File/v_m_s__icons_icons.dart';
import 'package:vms_school/Link/API/AdminAPI/Employees_APIs/Add_Virtual_Employee.dart';
import 'package:vms_school/Link/API/AdminAPI/Employees_APIs/Get_Virtual_Employee.dart';
import 'package:vms_school/Link/Controller/AdminController/Employee_Controllers/AllEmpolyeeController.dart';
import 'package:vms_school/Link/Controller/AdminController/Employee_Controllers/All_Virtual_Employee_Controller.dart';
import 'package:vms_school/Link/Functions/Export_Exle_Function.dart';
import 'package:vms_school/Link/Functions/Export_PDF_Function.dart';
import 'package:vms_school/Link/Model/AdminModel/School_Models/Virtual_Employee_Model.dart';
import 'package:vms_school/Translate/local_controller.dart';
import 'package:vms_school/main.dart';
import 'package:vms_school/view/Admin/Employee_Manager/Virtual_User_Management_Grid.dart';
import 'package:vms_school/widgets/Admin/Admin_Employee/DropDownAllEmployee.dart';
import 'package:vms_school/widgets/ButtonsDialog.dart';
import 'package:vms_school/widgets/TextFildWithUpper.dart';
import 'package:vms_school/widgets/TextFormSearch.dart';
import 'package:vms_school/widgets/VMSAlertDialog.dart';
import 'package:vms_school/Link/Model/AdminModel/EmployeeModels/All_Employee_Model.dart';

class Virtual_User_Management extends StatefulWidget {
  const Virtual_User_Management({super.key});

  @override
  State<Virtual_User_Management> createState() =>
      _Virtual_User_ManagementState();
}

class _Virtual_User_ManagementState extends State<Virtual_User_Management> {
  TextEditingController search = TextEditingController();
  TextEditingController username = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController cPassword = TextEditingController();

  @override
  void initState() {
    Get_Virtual_Employee_API.Get_Virtual_Employee();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    return Expanded(
        child: Column(
      children: [
        GetBuilder<All_Virtual_Employee_Controller>(builder: (controller) {
          return Container(
            margin: const EdgeInsets.only(left: 30.0, right: 30.0, top: 30.0),
            alignment: Alignment.center,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Row(
                      children: [
                        Padding(
                            padding: const EdgeInsets.only(left: 8.0),
                            child: Dropdownallemployee(
                                title: "Job Title".tr,
                                width: w / 5,
                                type: "roll")),
                        Padding(
                          padding: const EdgeInsets.only(left: 8.0),
                          child: TextFormSearch(
                            onchange: (value) {
                              controller.searchRequestByName(value,
                                  Get.find<Allempolyeecontroller>().rollIndex);
                            },
                            click: () {
                              controller.clearFilter();
                            },
                            width: w / 2,
                            radius: 5,
                            controller: search,
                            suffixIcon: search.text.isNotEmpty
                                ? Icons.close
                                : Icons.search,
                          ),
                        ),
                      ],
                    ),
                    const Spacer(),
                    Row(
                      children: [
                        Container(
                          width: 40,
                          height: 40,
                          decoration: BoxDecoration(
                              color: Theme.of(context).cardColor,
                              borderRadius: BorderRadius.circular(5),
                              boxShadow: const [
                                BoxShadow(
                                    color: Colors.black12,
                                    offset: Offset(0, 2),
                                    blurRadius: 1)
                              ]),
                          child: IconButton(
                              style: ButtonStyle(
                                  backgroundColor: WidgetStatePropertyAll(
                                      Theme.of(context).cardColor),
                                  shape: WidgetStatePropertyAll(
                                      RoundedRectangleBorder(
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(5))))),
                              onPressed: () {
                                username.clear();
                                password.clear();
                                cPassword.clear();
                                Get.find<Allempolyeecontroller>()
                                    .rolldialogIndex = "";
                                Get.dialog(barrierDismissible: false,
                                    GetBuilder<All_Virtual_Employee_Controller>(
                                        builder: (Virtual_controller) {
                                  return VMSAlertDialog(
                                      action: [
                                        ButtonDialog(
                                            text: "Add Virtual User".tr,
                                            onPressed: () {
                                              {
                                                bool isUsernameEmpty = username
                                                    .text
                                                    .trim()
                                                    .isEmpty;
                                                bool isJoptitleEmpty = Get.find<
                                                            Allempolyeecontroller>()
                                                        .rolldialogIndex
                                                        .isEmpty ||
                                                    Get.find<Allempolyeecontroller>()
                                                            .rolldialogIndex ==
                                                        "";

                                                bool isPasswordEmpty = password
                                                    .text
                                                    .trim()
                                                    .isEmpty;
                                                bool isConfirmPasswordEmpty =
                                                    cPassword.text
                                                        .trim()
                                                        .isEmpty;

                                                RegExp passwordRegex = RegExp(
                                                    r"^[a-zA-Z0-9]{8,}$");
                                                bool isPasswordValid =
                                                    passwordRegex.hasMatch(
                                                        password.text);

                                                bool isConfirmPasswordValid =
                                                    passwordRegex.hasMatch(
                                                        cPassword.text);

                                                Virtual_controller
                                                    .updateFieldError(
                                                        "username",
                                                        isUsernameEmpty);
                                                Virtual_controller
                                                    .updateFieldError(
                                                        "jop", isJoptitleEmpty);

                                                Virtual_controller
                                                    .updateFieldError(
                                                        "password",
                                                        isPasswordEmpty ||
                                                            !isPasswordValid);
                                                Virtual_controller.updateFieldError(
                                                    "cpassword",
                                                    isConfirmPasswordEmpty ||
                                                        !isConfirmPasswordValid ||
                                                        cPassword.text !=
                                                            cPassword.text);

                                                // إذا لم يكن هناك أي أخطاء، قم بإضافة ولي الأمر
                                                if (!(isUsernameEmpty ||
                                                    isJoptitleEmpty ||
                                                    isPasswordEmpty ||
                                                    !isPasswordValid ||
                                                    isConfirmPasswordEmpty ||
                                                    !isConfirmPasswordValid ||
                                                    password.text !=
                                                        cPassword.text)) {
                                                  Add_Virtual_Employee_API
                                                      .Add_Virtual_Employee(
                                                          userName:
                                                              username.text,
                                                          password:
                                                              password.text,
                                                          roll: Get.find<
                                                                  Allempolyeecontroller>()
                                                              .rolldialogIndex);
                                                }
                                              }
                                            },
                                            color:
                                                Theme.of(context).primaryColor,
                                            width: 150)
                                      ],
                                      contents: Column(
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          Row(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.end,
                                            spacing: 20,
                                            children: [
                                              Textfildwithupper(
                                                  onChanged: (value) {
                                                    if (value.isNotEmpty) {
                                                      Virtual_controller
                                                          .updateFieldError(
                                                              "username",
                                                              false);
                                                    }
                                                  },
                                                  isRequired: true,
                                                  isError: Virtual_controller
                                                      .IsusernameError,
                                                  Uptext: "Username".tr,
                                                  width: 250,
                                                  controller: username,
                                                  hinttext: "Username".tr),
                                              Dropdownallemployee(
                                                  isError: Virtual_controller
                                                      .IsJoptitleError,
                                                  title: "Job Title".tr,
                                                  width: 250,
                                                  type: "rolldialog"),
                                            ],
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                top: 15.0),
                                            child: Row(
                                              spacing: 20,
                                              children: [
                                                Textfildwithupper(
                                                    onChanged: (value) {
                                                      if (value.isNotEmpty) {
                                                        Virtual_controller
                                                            .updateFieldError(
                                                                "password",
                                                                false);
                                                      }
                                                    },
                                                    isError: Virtual_controller
                                                        .IsPasswordError,
                                                    fieldType: "password",
                                                    IconButton: IconButton(
                                                        onPressed: () {
                                                          Virtual_controller
                                                              .ChangeShowPassword(
                                                                  !Virtual_controller
                                                                      .ShowPassword);
                                                        },
                                                        icon: Icon(
                                                          Virtual_controller
                                                                  .ShowPassword
                                                              ? Icons
                                                                  .visibility_off
                                                              : Icons
                                                                  .remove_red_eye_outlined,
                                                          color:
                                                              Theme.of(context)
                                                                  .textTheme
                                                                  .bodySmall!
                                                                  .color,
                                                        )),
                                                    hidePassword:
                                                        Virtual_controller
                                                            .ShowPassword,
                                                    isRequired: true,
                                                    Uptext: "Password".tr,
                                                    width: 250,
                                                    controller: password,
                                                    hinttext: "Password".tr),
                                                Textfildwithupper(
                                                    customErrorMessage: cPassword
                                                                    .text
                                                                    .trim() !=
                                                                "" &&
                                                            cPassword
                                                                .text.isNotEmpty
                                                        ? "كلمات المرور غير متطابقة"
                                                        : "لا يمكن ترك الحقل فارغ",
                                                    onChanged: (value) {
                                                      if (value.isNotEmpty) {
                                                        Virtual_controller
                                                            .updateFieldError(
                                                                "cpassword",
                                                                false);
                                                      }
                                                    },
                                                    isError: Virtual_controller
                                                        .IsConfirmPasswordError,
                                                    fieldType: "password",
                                                    IconButton: IconButton(
                                                        onPressed: () {
                                                          Virtual_controller
                                                              .ChangeShowConfirmPassword(
                                                                  !Virtual_controller
                                                                      .ShowConfirmPassword);
                                                        },
                                                        icon: Icon(
                                                          Virtual_controller
                                                                  .ShowConfirmPassword
                                                              ? Icons
                                                                  .visibility_off
                                                              : Icons
                                                                  .remove_red_eye_outlined,
                                                          color:
                                                              Theme.of(context)
                                                                  .textTheme
                                                                  .bodySmall!
                                                                  .color,
                                                        )),
                                                    hidePassword:
                                                        Virtual_controller
                                                            .ShowConfirmPassword,
                                                    isRequired: true,
                                                    Uptext:
                                                        "Confirm Password".tr,
                                                    width: 250,
                                                    controller: cPassword,
                                                    hinttext:
                                                        "Confirm Password".tr)
                                              ],
                                            ),
                                          )
                                        ],
                                      ),
                                      apptitle: "Add Virtual User".tr,
                                      subtitle: "none");
                                }));
                              },
                              icon: Icon(Icons.add,
                                  size: 18,
                                  color: Theme.of(context)
                                      .textTheme
                                      .titleMedium!
                                      .color!)),
                        ),
                        Padding(
                          padding:
                              const EdgeInsets.only(right: 10.0, left: 10.0),
                          child: Container(
                            width: 40,
                            height: 40,
                            decoration: BoxDecoration(
                                color: Theme.of(context).cardColor,
                                borderRadius: BorderRadius.circular(5),
                                boxShadow: const [
                                  BoxShadow(
                                      color: Colors.black12,
                                      offset: Offset(0, 2),
                                      blurRadius: 1)
                                ]),
                            child: IconButton(
                                style: ButtonStyle(
                                    backgroundColor: WidgetStatePropertyAll(
                                        Theme.of(context).cardColor),
                                    shape: WidgetStatePropertyAll(
                                        RoundedRectangleBorder(
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(5))))),
                                onPressed: () {
                                  exportDataToPdf<ViraulUser>(
                                    items: Get.find<
                                            All_Virtual_Employee_Controller>()
                                        .filteredviraulUser!,
                                    headers: [
                                      "Username".tr,
                                      "Roll".tr,
                                    ],
                                    fieldMappings: {
                                      "Username".tr: (reg) =>
                                          reg.userName ?? "",
                                      "Roll".tr: (reg) => reg.roll!.tr ?? "",
                                    },
                                    fileName: "Virtual Employee".tr +
                                        ' ${DateTime.now().toIso8601String()}',
                                  );
                                },
                                icon: Icon(VMS_Icons.pdf,
                                    size: 18,
                                    color: Theme.of(context)
                                        .textTheme
                                        .titleMedium!
                                        .color!)),
                          ),
                        ),
                        Container(
                          width: 40,
                          height: 40,
                          decoration: BoxDecoration(
                              color: Theme.of(context).cardColor,
                              borderRadius: BorderRadius.circular(5),
                              boxShadow: const [
                                BoxShadow(
                                    color: Colors.black12,
                                    offset: Offset(0, 2),
                                    blurRadius: 1)
                              ]),
                          child: IconButton(
                              style: ButtonStyle(
                                  backgroundColor: WidgetStatePropertyAll(
                                      Theme.of(context).cardColor),
                                  shape: WidgetStatePropertyAll(
                                      RoundedRectangleBorder(
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(5))))),
                              onPressed: () {
                                exportDataToExcel<ViraulUser>(
                                  items: Get.find<
                                          All_Virtual_Employee_Controller>()
                                      .filteredviraulUser!,
                                  headers: [
                                    "Username".tr,
                                    "Roll".tr,
                                  ],
                                  fieldMappings: {
                                    "Username".tr: (reg) => reg.userName ?? "",
                                    "Roll".tr: (reg) => reg.roll!.tr ?? "",
                                  },
                                  fileName: "Virtual Employee".tr +
                                      ' ${DateTime.now().toIso8601String()}',
                                );
                              },
                              icon: Icon(VMS_Icons.xl,
                                  size: 18,
                                  color: Theme.of(context)
                                      .textTheme
                                      .titleMedium!
                                      .color!)),
                        ),
                      ],
                    )
                  ],
                ),
              ],
            ),
          );
        }),
        Expanded(
            child: Padding(
          padding: const EdgeInsets.only(top: 15.0),
          child: Virtual_User_Management_Grid(),
        )),
      ],
    ));
  }
}
