import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vms_school/Link/API/AdminAPI/Teacher_APIS/AddTeacherAPI.dart';
import 'package:vms_school/Link/Controller/AdminController/Employee_Controllers/AllEmpolyeeController.dart';
import 'package:vms_school/widgets/Admin/Admin_Employee/DropDownAllEmployee.dart';
import 'package:vms_school/widgets/ButtonsDialog.dart';
import 'package:vms_school/widgets/Calender.dart';
import '../../../widgets/TextFildWithUpper.dart';
import '../../../widgets/VMSAlertDialog.dart';

class AddEmployee extends StatefulWidget {
  const AddEmployee({super.key});

  @override
  State<AddEmployee> createState() => _AddEmployeeState();
}

class _AddEmployeeState extends State<AddEmployee> {
  TextEditingController username = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController cPassword = TextEditingController();
  TextEditingController firstName = TextEditingController();
  TextEditingController lastName = TextEditingController();
  TextEditingController phone = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return GetBuilder<Allempolyeecontroller>(builder: (cont) {
      return VMSAlertDialog(
          action: [
            ButtonDialog(
                text: "Add Employee".tr,
                onPressed: () async {
                  bool isRollEmpty = Get.find<Allempolyeecontroller>()
                          .selecteferollIndex
                          .isEmpty ||
                      Get.find<Allempolyeecontroller>().selecteferollIndex ==
                          "";

                  bool isJopEmpty = Get.find<Allempolyeecontroller>()
                          .selectefejopIndex
                          .isEmpty ||
                      Get.find<Allempolyeecontroller>().selectefejopIndex == "";

                  bool isUsernameEmpty = username.text.trim().isEmpty;
                  bool isPhoneEmpty = phone.text.trim().isEmpty;
                  bool isEmailEmpty = email.text.trim().isEmpty;
                  bool isPasswordEmpty = password.text.trim().isEmpty;
                  bool isConfirmPasswordEmpty = cPassword.text.trim().isEmpty;
                  bool isFirstnameEmpty = firstName.text.trim().isEmpty;
                  bool isLastnameEmpty = lastName.text.trim().isEmpty;
                  bool isJoindateEmpty =
                      Get.find<Allempolyeecontroller>().Joindate.value == null;
                  bool isGenderEmpty = Get.find<Allempolyeecontroller>()
                          .GenderListIndex
                          .isEmpty ||
                      Get.find<Allempolyeecontroller>().GenderListIndex == "";
                  bool isContractTypeEmpty = Get.find<Allempolyeecontroller>()
                          .ContractTypeIndex
                          .isEmpty ||
                      Get.find<Allempolyeecontroller>().ContractTypeIndex == "";

                  RegExp emailRegex = RegExp(
                      r"^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$");
                  bool isEmailValid = emailRegex.hasMatch(email.text);

                  RegExp passwordRegex = RegExp(r"^[a-zA-Z0-9]{8,}$");
                  bool isPasswordValid = passwordRegex.hasMatch(password.text);
                  bool isConfirmPasswordValid =
                      passwordRegex.hasMatch(cPassword.text);

                  // تحديث الأخطاء بناءً على الإدخال
                  cont.updateFieldError("first", isFirstnameEmpty);
                  cont.updateFieldError("last", isLastnameEmpty);
                  cont.updateFieldError("email", isEmailEmpty || !isEmailValid);
                  cont.updateFieldError("username", isUsernameEmpty);
                  cont.updateFieldError("phone", isPhoneEmpty);

                  cont.updateFieldError("join", isJoindateEmpty);
                  cont.updateFieldError("roll", isRollEmpty);
                  cont.updateFieldError("jop", isJopEmpty);
                  cont.updateFieldError("gender", isGenderEmpty);
                  cont.updateFieldError("contract", isContractTypeEmpty);
                  cont.updateFieldError(
                      "password", isPasswordEmpty || !isPasswordValid);
                  cont.updateFieldError(
                      "cpassword",
                      isConfirmPasswordEmpty ||
                          password.text != cPassword.text ||
                          !isConfirmPasswordValid);

                  if (!(isFirstnameEmpty ||
                      isLastnameEmpty ||
                      isUsernameEmpty ||
                      isPhoneEmpty ||
                      isJoindateEmpty ||
                      isGenderEmpty ||
                      isContractTypeEmpty ||
                      isEmailEmpty ||
                      !isEmailValid ||
                      isPasswordEmpty ||
                      !isPasswordValid ||
                      isConfirmPasswordEmpty ||
                      !isConfirmPasswordValid ||
                      password.text != cPassword.text)) {
                    await Addteacherapi(context).Addteacher(
                        firstName.text,
                        lastName.text,
                        email.text,
                        username.text,
                        cont.Joindate.toString(),
                        phone.text,
                        cont.GenderListIndex,
                        cont.ContractTypeIndex.trim(),
                        cont.ferollIndex == "Sub Admin"
                            ? "subAdmin"
                            : cont.ferollIndex,
                        cont.fejopIndex,
                        password.text);
                  }
                },
                color: Theme.of(context).primaryColor,
                width: 120)
          ],
          contents: Container(
            width: 500,
            child: SingleChildScrollView(
              child: Column(
                spacing: 2.0,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Wrap(
                    spacing: 10.0,
                    runAlignment: WrapAlignment.center,
                    crossAxisAlignment: WrapCrossAlignment.center,
                    runSpacing: 2.0,
                    alignment: WrapAlignment.center,
                    children: [
                      Textfildwithupper(
                          onChanged: (value) {
                            if (value.isNotEmpty) {
                              cont.updateFieldError("first", false);
                            }
                          },
                          isRequired: true,
                          isError: cont.ISfirstNameError,
                          Uptext: "First Name".tr,
                          width: screenWidth >= 520 ? 220 : (screenWidth) - 70,
                          controller: firstName,
                          hinttext: "First Name".tr),
                      Textfildwithupper(
                          onChanged: (value) {
                            if (value.isNotEmpty) {
                              cont.updateFieldError("last", false);
                            }
                          },
                          isRequired: true,
                          isError: cont.ISlastNameError,
                          Uptext: "Last Name".tr,
                          width: screenWidth >= 520 ? 220 : (screenWidth) - 70,
                          controller: lastName,
                          hinttext: "Last Name".tr)
                    ],
                  ),
                  Wrap(
                    spacing: 10.0,
                    runAlignment: WrapAlignment.center,
                    crossAxisAlignment: WrapCrossAlignment.center,
                    runSpacing: 2.0,
                    alignment: WrapAlignment.center,
                    children: [
                      Textfildwithupper(
                          onChanged: (value) {
                            if (value.isNotEmpty) {
                              cont.updateFieldError("email", false);
                            }
                          },
                          fieldType: "email",
                          isRequired: true,
                          isError: cont.ISemailError,
                          Uptext: "Email".tr,
                          width: screenWidth >= 520 ? 220 : (screenWidth) - 70,
                          controller: email,
                          hinttext: "Email".tr),
                      Textfildwithupper(
                          onChanged: (value) {
                            if (value.isNotEmpty) {
                              cont.updateFieldError("username", false);
                            }
                          },
                          isRequired: true,
                          isError: cont.ISusernameError,
                          Uptext: "Username".tr,
                          width: screenWidth >= 520 ? 220 : (screenWidth) - 70,
                          controller: username,
                          hinttext: "Username".tr)
                    ],
                  ),
                  Wrap(
                    spacing: 10.0,
                    runAlignment: WrapAlignment.center,
                    crossAxisAlignment: WrapCrossAlignment.center,
                    runSpacing: 2.0,
                    alignment: WrapAlignment.center,
                    children: [
                      Textfildwithupper(
                          fieldType: "phone",
                          onChanged: (value) {
                            if (value.isNotEmpty) {
                              cont.updateFieldError("phone", false);
                            }
                          },
                          isRequired: true,
                          isError: cont.ISphoneError,
                          Uptext: "Phone Number".tr,
                          width: screenWidth >= 520 ? 220 : (screenWidth) - 70,
                          controller: phone,
                          hinttext: "Phone Number".tr),
                      JoinDate(
                        isRequired: true,
                        isError: cont.IsJoinError,
                        width: screenWidth >= 520 ? 220 : (screenWidth) - 70,
                        Uptext: "Join Date".tr,
                      )
                    ],
                  ),
                  Wrap(
                    spacing: 10.0,
                    runAlignment: WrapAlignment.center,
                    crossAxisAlignment: WrapCrossAlignment.center,
                    runSpacing: 2.0,
                    alignment: WrapAlignment.center,
                    children: [
                      Dropdownallemployee(
                          isError: cont.IsJopError,
                          title: "Job Title".tr,
                          width: screenWidth >= 520 ? 220 : (screenWidth) - 70,
                          type: "fejop"),
                      Dropdownallemployee(
                          Disabled: cont.fejopIndex == "",
                          isError: cont.IsRollError,
                          title: "Role".tr,
                          width: screenWidth >= 520 ? 220 : (screenWidth) - 70,
                          type: "feroll"),
                    ],
                  ),
                  Wrap(
                    spacing: 10.0,
                    runAlignment: WrapAlignment.center,
                    crossAxisAlignment: WrapCrossAlignment.center,
                    runSpacing: 2.0,
                    alignment: WrapAlignment.center,
                    children: [
                      Dropdownallemployee(
                          isError: cont.IsGenderError,
                          title: "Gender".tr,
                          width: screenWidth >= 520 ? 220 : (screenWidth) - 70,
                          type: "Gender"),
                      Dropdownallemployee(
                          isError: cont.IsContractError,
                          title: "Contract Type".tr,
                          width: screenWidth >= 520 ? 220 : (screenWidth) - 70,
                          type: "Contract"),
                    ],
                  ),
                  Wrap(
                    spacing: 10.0,
                    runAlignment: WrapAlignment.center,
                    crossAxisAlignment: WrapCrossAlignment.center,
                    runSpacing: 2.0,
                    alignment: WrapAlignment.center,
                    children: [
                      Textfildwithupper(
                          hidePassword: cont.ShowPassword,
                          IconButton: IconButton(
                              onPressed: () {
                                cont.ChangeShowPassword(!cont.ShowPassword);
                              },
                              icon: Icon(
                                cont.ShowPassword
                                    ? Icons.visibility_off
                                    : Icons.remove_red_eye_outlined,
                                color: Theme.of(context)
                                    .textTheme
                                    .bodySmall!
                                    .color,
                              )),
                          onChanged: (value) {
                            if (value.isNotEmpty) {
                              cont.updateFieldError("password", false);
                            }
                          },
                          fieldType: "password",
                          isRequired: true,
                          isError: cont.ISpasswordError,
                          Uptext: "Password".tr,
                          width: screenWidth >= 520 ? 220 : (screenWidth) - 70,
                          controller: password,
                          hinttext: "Password".tr),
                      Textfildwithupper(
                          customErrorMessage: cPassword.text.trim() != "" &&
                                  cPassword.text.isNotEmpty
                              ? "كلمات المرور غير متطابقة"
                              : "لا يمكن ترك الحقل فارغ",
                          hidePassword: cont.ShowConfirmPassword,
                          IconButton: IconButton(
                              onPressed: () {
                                cont.ChangeShowConfirmPassword(
                                    !cont.ShowConfirmPassword);
                              },
                              icon: Icon(
                                cont.ShowConfirmPassword
                                    ? Icons.visibility_off
                                    : Icons.remove_red_eye_outlined,
                                color: Theme.of(context)
                                    .textTheme
                                    .bodySmall!
                                    .color,
                              )),
                          onChanged: (value) {
                            if (value.isNotEmpty) {
                              cont.updateFieldError("cpassword", false);
                            }
                          },
                          fieldType: "password",
                          isRequired: true,
                          isError: cont.IScPasswordError,
                          Uptext: "Confirm Password".tr,
                          width: screenWidth >= 520 ? 220 : (screenWidth) - 70,
                          controller: cPassword,
                          hinttext: "Confirm Password".tr)
                    ],
                  )
                ],
              ),
            ),
          ),
          apptitle: "Add Employee".tr,
          subtitle: "none");
    });
  }
}
