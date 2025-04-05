import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vms_school/Icons_File/v_m_s__icons_icons.dart';
import 'package:vms_school/Link/API/AdminAPI/Students/Guardian_APIS/AddGuardianAPI.dart';
import 'package:vms_school/Link/API/AdminAPI/Students/Guardian_APIS/GetAllGuardiansAPI.dart';
import 'package:vms_school/Link/Controller/AdminController/Employee_Controllers/Add_Data_controller.dart';
import 'package:vms_school/Link/Controller/AdminController/Students_Controllers/allGaurdianController.dart';
import 'package:vms_school/view/Admin/Students_Manager/AllGuardianGrid.dart';
import 'package:vms_school/widgets/ButtonsDialog.dart';
import 'package:vms_school/widgets/Squer_Button_Enabled_Disabled.dart';
import 'package:vms_school/widgets/TextFildWithUpper.dart';
import 'package:vms_school/widgets/TextFormSearch.dart';
import 'package:vms_school/widgets/VMSAlertDialog.dart';

class AllGuardians extends StatefulWidget {
  const AllGuardians({super.key});

  @override
  State<AllGuardians> createState() => _AllGuardiansState();
}

class _AllGuardiansState extends State<AllGuardians> {
  @override
  void initState() {
    GetAllGuardiansAPI(context).getAllGuardian();
    // TODO: implement initState
    super.initState();
  }

  TextEditingController search = TextEditingController();

  TextEditingController email = TextEditingController();

  TextEditingController username = TextEditingController();

  TextEditingController pass = TextEditingController();

  TextEditingController cpass = TextEditingController();

  TextEditingController name = TextEditingController();

  TextEditingController phone = TextEditingController();

  TextEditingController nationalId = TextEditingController();

  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    return Expanded(
        child: Column(
      children: [
        Container(
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
                      GetBuilder<Allgaurdiancontroller>(builder: (controller) {
                        return Padding(
                          padding: const EdgeInsets.only(left: 8.0),
                          child: TextFormSearch(
                            click: () {
                              controller.clearFilter();
                            },
                            onchange: (value) {
                              controller.searchGaurdian(value);
                            },
                            width: w * 0.7,
                            radius: 5,
                            controller: search,
                            suffixIcon: search.text.isNotEmpty
                                ? Icons.close
                                : Icons.search,
                          ),
                        );
                      }),
                    ],
                  ),
                  const Spacer(),
                  Row(
                    children: [
                      Squer_Button_Enabled_Disabled(
                        onTap: () {
                          {
                            Get.find<Allgaurdiancontroller>().resetError();
                            email.clear();
                            username.clear();
                            pass.clear();
                            cpass.clear();
                            name.clear();
                            phone.clear();
                            nationalId.clear();
                            Get.dialog(barrierDismissible: false,
                                GetBuilder<Allgaurdiancontroller>(
                                    builder: (controller) {
                              return VMSAlertDialog(
                                  contents: SizedBox(
                                      child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                right: 15.0, left: 15),
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
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
                                                    fieldType: "email",
                                                    isRequired: true,
                                                    controller: email,
                                                    hinttext: "Email".tr,
                                                    Uptext: "Email".tr)
                                              ],
                                            ),
                                          ),
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Textfildwithupper(
                                                  onChanged: (value) {
                                                    if (value.isNotEmpty) {
                                                      controller
                                                          .updateFieldError(
                                                              "username",
                                                              false);
                                                    }
                                                  },
                                                  isRequired: true,
                                                  isError: controller
                                                      .IsusernameError,
                                                  controller: username,
                                                  hinttext:
                                                      "Guardian Username".tr,
                                                  Uptext:
                                                      "Guardian Username".tr)
                                            ],
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
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  right: 15.0, left: 15),
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Textfildwithupper(
                                                      onChanged: (value) {
                                                        if (value.isNotEmpty) {
                                                          controller
                                                              .updateFieldError(
                                                                  "name",
                                                                  false);
                                                        }
                                                      },
                                                      isRequired: true,
                                                      isError: controller
                                                          .IsnameError,
                                                      controller: name,
                                                      Uptext: "Name".tr,
                                                      hinttext: "Name".tr)
                                                ],
                                              ),
                                            ),
                                            Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Textfildwithupper(
                                                    fieldType: "phone",
                                                    onChanged: (value) {
                                                      if (value.isNotEmpty) {
                                                        controller
                                                            .updateFieldError(
                                                                "phone", false);
                                                      }
                                                    },
                                                    isRequired: true,
                                                    isError:
                                                        controller.IsphoneError,
                                                    controller: phone,
                                                    Uptext: "Phone Number".tr,
                                                    hinttext: "Phone Number".tr)
                                              ],
                                            )
                                          ],
                                        ),
                                      ),
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(top: 20.0),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  right: 15.0, left: 15),
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
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
                                                      isRequired: true,
                                                      controller: nationalId,
                                                      hinttext:
                                                          "National ID".tr,
                                                      Uptext: "National ID".tr)
                                                ],
                                              ),
                                            ),
                                            Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Textfildwithupper(
                                                    onChanged: (value) {
                                                      if (value.isNotEmpty) {
                                                        controller
                                                            .updateFieldError(
                                                                "password",
                                                                false);
                                                      }
                                                    },
                                                    isError: controller
                                                        .IsPasswordError,
                                                    fieldType: "password",
                                                    IconButton: IconButton(
                                                        onPressed: () {
                                                          controller
                                                              .ChangeShowPassword(
                                                                  !controller
                                                                      .ShowPassword);
                                                        },
                                                        icon: Icon(
                                                          controller
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
                                                        controller.ShowPassword,
                                                    isRequired: true,
                                                    controller: pass,
                                                    hinttext: "Password".tr,
                                                    Uptext: "Password".tr)
                                              ],
                                            )
                                          ],
                                        ),
                                      ),
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(top: 20.0),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  right: 15.0, left: 15),
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Textfildwithupper(
                                                      onChanged: (value) {
                                                        if (value.isNotEmpty) {
                                                          controller
                                                              .updateFieldError(
                                                                  "cpassword",
                                                                  false);
                                                        }
                                                      },
                                                      isError: controller
                                                          .IsConfirmPasswordError,
                                                      fieldType: "password",
                                                      IconButton: IconButton(
                                                          onPressed: () {
                                                            controller
                                                                .ChangeShowConfirmPassword(
                                                                    !controller
                                                                        .ShowConfirmPassword);
                                                          },
                                                          icon: Icon(
                                                            controller
                                                                    .ShowConfirmPassword
                                                                ? Icons
                                                                    .visibility_off
                                                                : Icons
                                                                    .remove_red_eye_outlined,
                                                            color: Theme.of(
                                                                    context)
                                                                .textTheme
                                                                .bodySmall!
                                                                .color,
                                                          )),
                                                      hidePassword: controller
                                                          .ShowConfirmPassword,
                                                      isRequired: true,
                                                      controller: cpass,
                                                      hinttext:
                                                          "Confirm Password".tr,
                                                      Uptext:
                                                          "Confirm Password".tr)
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  )),
                                  action: [
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        ButtonDialog(
                                            width: 150,
                                            text: "Add Guardian".tr,
                                            onPressed: () {
                                              bool isUsernameEmpty =
                                                  username.text.trim().isEmpty;
                                              bool isNameEmpty =
                                                  name.text.trim().isEmpty;
                                              bool isPhoneEmpty =
                                                  phone.text.trim().isEmpty;
                                              bool isNationalIDEmpty =
                                                  nationalId.text
                                                      .trim()
                                                      .isEmpty;
                                              bool isEmailEmpty =
                                                  email.text.trim().isEmpty;
                                              bool isPasswordEmpty =
                                                  pass.text.trim().isEmpty;
                                              bool isConfirmPasswordEmpty =
                                                  cpass.text.trim().isEmpty;

                                              // التحقق من صحة البريد وكلمة المرور
                                              RegExp emailRegex = RegExp(
                                                  r"^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$");
                                              bool isEmailValid = emailRegex
                                                  .hasMatch(email.text);

                                              RegExp passwordRegex =
                                                  RegExp(r"^[a-zA-Z0-9]{8,}$");
                                              bool isPasswordValid =
                                                  passwordRegex
                                                      .hasMatch(pass.text);

                                              // تحديث الأخطاء بناءً على الإدخال
                                              controller.updateFieldError(
                                                  "username", isUsernameEmpty);
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
                                              controller.updateFieldError(
                                                  "password",
                                                  isPasswordEmpty ||
                                                      !isPasswordValid);
                                              controller.updateFieldError(
                                                  "cpassword",
                                                  isConfirmPasswordEmpty ||
                                                      pass.text != cpass.text);

                                              // إذا لم يكن هناك أي أخطاء، قم بإضافة ولي الأمر
                                              if (!(isUsernameEmpty ||
                                                  isNameEmpty ||
                                                  isPhoneEmpty ||
                                                  isNationalIDEmpty ||
                                                  isEmailEmpty ||
                                                  !isEmailValid ||
                                                  isPasswordEmpty ||
                                                  !isPasswordValid ||
                                                  isConfirmPasswordEmpty ||
                                                  pass.text != cpass.text)) {
                                                Addguardianapi(context)
                                                    .addguardian(
                                                  name.text,
                                                  email.text,
                                                  nationalId.text,
                                                  phone.text,
                                                  username.text,
                                                  pass.text,
                                                );
                                              }
                                            },
                                            color:
                                                Theme.of(context).primaryColor)
                                      ],
                                    )
                                  ],
                                  apptitle: "Add Guardian".tr,
                                  subtitle: "none");
                            }));
                          }
                        },
                        icon: Icons.add,
                        validate:
                            Get.find<Add_Data_controller>().roll == "subAdmin",
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 10.0),
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
                              style: const ButtonStyle(
                                  shape: WidgetStatePropertyAll(
                                      RoundedRectangleBorder(
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(5))))),
                              onPressed: () {},
                              icon: Icon(VMS_Icons.pdf,
                                  size: 18,
                                  color: Theme.of(context).highlightColor)),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 10.0, left: 10.0),
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
                              style: const ButtonStyle(
                                  shape: WidgetStatePropertyAll(
                                      RoundedRectangleBorder(
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(5))))),
                              onPressed: () {},
                              icon: Icon(VMS_Icons.xl,
                                  size: 18,
                                  color: Theme.of(context).highlightColor)),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ],
          ),
        ),
        Expanded(
            child: Padding(
          padding: const EdgeInsets.only(top: 15.0),
          child: AllGuardianGrid(),
        )),
      ],
    ));
  }
}
