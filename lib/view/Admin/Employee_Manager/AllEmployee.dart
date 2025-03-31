import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vms_school/Link/API/AdminAPI/Employees_APIs/Get_All_Employee_API.dart';
import 'package:vms_school/Link/API/AdminAPI/Teacher_APIS/AddTeacherAPI.dart';
import 'package:vms_school/Link/Controller/AdminController/Employee_Controllers/AllEmpolyeeController.dart';
import 'package:vms_school/Link/Controller/WidgetController/Sessions_DropDown_Controller.dart';
import 'package:vms_school/Translate/local_controller.dart';
import 'package:vms_school/main.dart';
import 'package:vms_school/view/Admin/Employee_Manager/Add_Full_Employee.dart';
import 'package:vms_school/view/Admin/Employee_Manager/AllEmployeeGrid.dart';
import 'package:vms_school/widgets/Admin_Employee/Export_Data.dart';
import 'package:vms_school/widgets/Admin_School/All_Screen_Sessions.dart';
import 'package:vms_school/widgets/Admin_employee/DropDownAllEmployee.dart';
import 'package:vms_school/widgets/ButtonsDialog.dart';
import 'package:vms_school/widgets/Calender.dart';
import 'package:vms_school/widgets/DropDown.dart';
import 'package:vms_school/widgets/TextFormSearch.dart';
import '../../../Icons_File/v_m_s__icons_icons.dart';
import '../../../widgets/TextFildWithUpper.dart';
import '../../../widgets/VMSAlertDialog.dart';

class AllEmployee extends StatefulWidget {
  const AllEmployee({super.key});

  @override
  State<AllEmployee> createState() => _AllEmployeeState();
}

class _AllEmployeeState extends State<AllEmployee> {
  TextEditingController search = TextEditingController();

  TextEditingController username = TextEditingController();

  TextEditingController email = TextEditingController();

  TextEditingController password = TextEditingController();

  TextEditingController cPassword = TextEditingController();

  TextEditingController firstName = TextEditingController();
  TextEditingController lastName = TextEditingController();
  TextEditingController phone = TextEditingController();

  @override
  void initState() {
    Get.find<All_Screen_Sessions_Controller>().setSessionDefult();
    Get_All_Employee_API.Get_All_Employee();
    super.initState();
  }

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
                      Padding(
                          padding: const EdgeInsets.only(left: 8.0),
                          child: DropDownAllSessions(
                            title: "Session".tr,
                            width: w / 6.5,
                            type: "session",
                            API: "AllEmployee",
                          )),
                      Padding(
                          padding: const EdgeInsets.only(left: 8.0),
                          child: Dropdownallemployee(
                              title: "Job Title".tr,
                              width: w / 6.5,
                              type: "jobTitle")),
                      GetBuilder<Allempolyeecontroller>(builder: (controller) {
                        return Padding(
                          padding: const EdgeInsets.only(left: 8.0),
                          child: TextFormSearch(
                            click: () {
                              controller.clearFilter();
                              print("Filter cleared");
                            },
                            width: w / 3.5,
                            radius: 5,
                            controller: search,
                            onchange: (value) {
                              controller.searchRequestByName(
                                  value, controller.jobTitleIndex);
                            },
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
                        child: PopupMenuButton(
                          style: ButtonStyle(
                              backgroundColor: WidgetStatePropertyAll(
                                  Theme.of(context).cardColor),
                              shape: WidgetStatePropertyAll(
                                  RoundedRectangleBorder(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(5))))),
                          tooltip: "",
                          child: Icon(Icons.add,
                              size: 18,
                              color: Theme.of(context).highlightColor),
                          onSelected: (value) {
                            if (value == "Add Employee".tr) {
                              Get.dialog(GetBuilder<Allempolyeecontroller>(
                                  builder: (cont) {
                                return VMSAlertDialog(
                                    action: [
                                      ButtonDialog(
                                          text: "Add Employee".tr,
                                          onPressed: () async {
                                            bool isRollEmpty = Get.find<
                                                        Allempolyeecontroller>()
                                                    .selecteferollIndex
                                                    .isEmpty ||
                                                Get.find<Allempolyeecontroller>()
                                                        .selecteferollIndex ==
                                                    "";

                                            bool isJopEmpty = Get.find<
                                                        Allempolyeecontroller>()
                                                    .selectefejopIndex
                                                    .isEmpty ||
                                                Get.find<Allempolyeecontroller>()
                                                        .selectefejopIndex ==
                                                    "";

                                            bool isUsernameEmpty =
                                                username.text.trim().isEmpty;
                                            bool isPhoneEmpty =
                                                phone.text.trim().isEmpty;
                                            bool isEmailEmpty =
                                                email.text.trim().isEmpty;
                                            bool isPasswordEmpty =
                                                password.text.trim().isEmpty;
                                            bool isConfirmPasswordEmpty =
                                                cPassword.text.trim().isEmpty;
                                            bool isFirstnameEmpty =
                                                firstName.text.trim().isEmpty;
                                            bool isLastnameEmpty =
                                                lastName.text.trim().isEmpty;
                                            bool isJoindateEmpty = Get.find<
                                                        Allempolyeecontroller>()
                                                    .Joindate
                                                    .value ==
                                                null;
                                            bool isGenderEmpty = Get.find<
                                                        Allempolyeecontroller>()
                                                    .GenderListIndex
                                                    .isEmpty ||
                                                Get.find<Allempolyeecontroller>()
                                                        .GenderListIndex ==
                                                    "";
                                            bool isContractTypeEmpty = Get.find<
                                                        Allempolyeecontroller>()
                                                    .ContractTypeIndex
                                                    .isEmpty ||
                                                Get.find<Allempolyeecontroller>()
                                                        .ContractTypeIndex ==
                                                    "";

                                            RegExp emailRegex = RegExp(
                                                r"^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$");
                                            bool isEmailValid =
                                                emailRegex.hasMatch(email.text);

                                            RegExp passwordRegex =
                                                RegExp(r"^[a-zA-Z0-9]{8,}$");
                                            bool isPasswordValid = passwordRegex
                                                .hasMatch(password.text);
                                            bool isConfirmPasswordValid =
                                                passwordRegex
                                                    .hasMatch(cPassword.text);

                                            // تحديث الأخطاء بناءً على الإدخال
                                            cont.updateFieldError(
                                                "first", isFirstnameEmpty);
                                            cont.updateFieldError(
                                                "last", isLastnameEmpty);
                                            cont.updateFieldError("email",
                                                isEmailEmpty || !isEmailValid);
                                            cont.updateFieldError(
                                                "username", isUsernameEmpty);
                                            cont.updateFieldError(
                                                "phone", isPhoneEmpty);

                                            cont.updateFieldError(
                                                "join", isJoindateEmpty);
                                            cont.updateFieldError(
                                                "roll", isRollEmpty);
                                            cont.updateFieldError(
                                                "jop", isJopEmpty);
                                            cont.updateFieldError(
                                                "gender", isGenderEmpty);
                                            cont.updateFieldError("contract",
                                                isContractTypeEmpty);
                                            cont.updateFieldError(
                                                "password",
                                                isPasswordEmpty ||
                                                    !isPasswordValid);
                                            cont.updateFieldError(
                                                "cpassword",
                                                isConfirmPasswordEmpty ||
                                                    password.text !=
                                                        cPassword.text ||
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
                                                password.text !=
                                                    cPassword.text)) {
                                              await Addteacherapi(context)
                                                  .Addteacher(
                                                      firstName.text,
                                                      lastName.text,
                                                      email.text,
                                                      username.text,
                                                      cont.Joindate.toString(),
                                                      phone.text,
                                                      cont.GenderListIndex,
                                                      cont.ContractTypeIndex
                                                          .trim(),
                                                      cont.ferollIndex ==
                                                              "Sub Admin"
                                                          ? "subAdmin"
                                                          : cont.ferollIndex,
                                                      cont.fejopIndex,
                                                      password.text);
                                            }
                                          },
                                          color: Theme.of(context).primaryColor,
                                          width: 120)
                                    ],
                                    contents: SingleChildScrollView(
                                      child: Column(
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          Row(
                                            children: [
                                              Padding(
                                                padding: EdgeInsets.only(
                                                    left: prefs!.getString(
                                                                languageKey) ==
                                                            'ar'
                                                        ? 15
                                                        : 0,
                                                    right: prefs!.getString(
                                                                languageKey) ==
                                                            'ar'
                                                        ? 0
                                                        : 15),
                                                child: Textfildwithupper(
                                                    onChanged: (value) {
                                                      if (value.isNotEmpty) {
                                                        cont.updateFieldError(
                                                            "first", false);
                                                      }
                                                    },
                                                    isRequired: true,
                                                    isError:
                                                        cont.ISfirstNameError,
                                                    Uptext: "First Name".tr,
                                                    width: 220,
                                                    controller: firstName,
                                                    hinttext: "First Name".tr),
                                              ),
                                              Textfildwithupper(
                                                  onChanged: (value) {
                                                    if (value.isNotEmpty) {
                                                      cont.updateFieldError(
                                                          "last", false);
                                                    }
                                                  },
                                                  isRequired: true,
                                                  isError: cont.ISlastNameError,
                                                  Uptext: "Last Name".tr,
                                                  width: 220,
                                                  controller: lastName,
                                                  hinttext: "Last Name".tr)
                                            ],
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                top: 15.0),
                                            child: Row(
                                              children: [
                                                Padding(
                                                  padding: EdgeInsets.only(
                                                      left: prefs!.getString(
                                                                  languageKey) ==
                                                              'ar'
                                                          ? 15
                                                          : 0,
                                                      right: prefs!.getString(
                                                                  languageKey) ==
                                                              'ar'
                                                          ? 0
                                                          : 15),
                                                  child: Textfildwithupper(
                                                      onChanged: (value) {
                                                        if (value.isNotEmpty) {
                                                          cont.updateFieldError(
                                                              "email", false);
                                                        }
                                                      },
                                                      fieldType: "email",
                                                      isRequired: true,
                                                      isError:
                                                          cont.ISemailError,
                                                      Uptext: "Email".tr,
                                                      width: 220,
                                                      controller: email,
                                                      hinttext: "Email".tr),
                                                ),
                                                Textfildwithupper(
                                                    onChanged: (value) {
                                                      if (value.isNotEmpty) {
                                                        cont.updateFieldError(
                                                            "username", false);
                                                      }
                                                    },
                                                    isRequired: true,
                                                    isError:
                                                        cont.ISusernameError,
                                                    Uptext: "Username".tr,
                                                    width: 220,
                                                    controller: username,
                                                    hinttext: "Username".tr)
                                              ],
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                top: 15.0),
                                            child: Row(
                                              children: [
                                                Padding(
                                                  padding: EdgeInsets.only(
                                                      left: prefs!.getString(
                                                                  languageKey) ==
                                                              'ar'
                                                          ? 15
                                                          : 0,
                                                      right: prefs!.getString(
                                                                  languageKey) ==
                                                              'ar'
                                                          ? 0
                                                          : 15),
                                                  child: Textfildwithupper(
                                                      fieldType: "phone",
                                                      onChanged: (value) {
                                                        if (value.isNotEmpty) {
                                                          cont.updateFieldError(
                                                              "phone", false);
                                                        }
                                                      },
                                                      isRequired: true,
                                                      isError:
                                                          cont.ISphoneError,
                                                      Uptext: "Phone Number".tr,
                                                      width: 220,
                                                      controller: phone,
                                                      hinttext:
                                                          "Phone Number".tr),
                                                ),
                                                Column(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.start,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    JoinDate(
                                                      isRequired: true,
                                                      isError: cont.IsJoinError,
                                                      width: 220,
                                                      Uptext: "Join Date".tr,
                                                    )
                                                  ],
                                                )
                                              ],
                                            ),
                                          ),
                                          Padding(
                                            padding: EdgeInsets.only(top: 15.0),
                                            child: Row(
                                              children: [
                                                Padding(
                                                  padding: EdgeInsets.only(
                                                      left: prefs!.getString(
                                                                  languageKey) ==
                                                              'ar'
                                                          ? 15
                                                          : 0,
                                                      right: prefs!.getString(
                                                                  languageKey) ==
                                                              'ar'
                                                          ? 0
                                                          : 15),
                                                  child: Dropdownallemployee(
                                                      isError: cont.IsJopError,
                                                      title: "Job Title".tr,
                                                      width: 220,
                                                      type: "fejop"),
                                                ),
                                                Dropdownallemployee(
                                                    Disabled:
                                                        cont.fejopIndex == "",
                                                    isError: cont.IsRollError,
                                                    title: "Role".tr,
                                                    width: 220,
                                                    type: "feroll"),
                                              ],
                                            ),
                                          ),
                                          Padding(
                                            padding: EdgeInsets.only(top: 15.0),
                                            child: Row(
                                              children: [
                                                Padding(
                                                  padding: EdgeInsets.only(
                                                      left: prefs!.getString(
                                                                  languageKey) ==
                                                              'ar'
                                                          ? 15
                                                          : 0,
                                                      right: prefs!.getString(
                                                                  languageKey) ==
                                                              'ar'
                                                          ? 0
                                                          : 15),
                                                  child: Dropdownallemployee(
                                                      isError:
                                                          cont.IsGenderError,
                                                      title: "Gender".tr,
                                                      width: 220,
                                                      type: "Gender"),
                                                ),
                                                Dropdownallemployee(
                                                    isError:
                                                        cont.IsContractError,
                                                    title: "Contract Type".tr,
                                                    width: 220,
                                                    type: "Contract"),
                                              ],
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                top: 15.0),
                                            child: Row(
                                              children: [
                                                Padding(
                                                  padding: EdgeInsets.only(
                                                      left: prefs!.getString(
                                                                  languageKey) ==
                                                              'ar'
                                                          ? 15
                                                          : 0,
                                                      right: prefs!.getString(
                                                                  languageKey) ==
                                                              'ar'
                                                          ? 0
                                                          : 15),
                                                  child: Textfildwithupper(
                                                      hidePassword:
                                                          cont.ShowPassword,
                                                      IconButton: IconButton(
                                                          onPressed: () {
                                                            cont.ChangeShowPassword(
                                                                !cont
                                                                    .ShowPassword);
                                                          },
                                                          icon: Icon(
                                                            cont.ShowPassword
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
                                                      onChanged: (value) {
                                                        if (value.isNotEmpty) {
                                                          cont.updateFieldError(
                                                              "password",
                                                              false);
                                                        }
                                                      },
                                                      fieldType: "password",
                                                      isRequired: true,
                                                      isError:
                                                          cont.ISpasswordError,
                                                      Uptext: "Password".tr,
                                                      width: 220,
                                                      controller: password,
                                                      hinttext: "Password".tr),
                                                ),
                                                Textfildwithupper(
                                                    hidePassword: cont
                                                        .ShowConfirmPassword,
                                                    IconButton: IconButton(
                                                        onPressed: () {
                                                          cont.ChangeShowConfirmPassword(
                                                              !cont
                                                                  .ShowConfirmPassword);
                                                        },
                                                        icon: Icon(
                                                          cont.ShowConfirmPassword
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
                                                    onChanged: (value) {
                                                      if (value.isNotEmpty) {
                                                        cont.updateFieldError(
                                                            "cpassword", false);
                                                      }
                                                    },
                                                    fieldType: "password",
                                                    isRequired: true,
                                                    isError:
                                                        cont.IScPasswordError,
                                                    Uptext:
                                                        "Confirm Password".tr,
                                                    width: 220,
                                                    controller: cPassword,
                                                    hinttext:
                                                        "Confirm Password".tr)
                                              ],
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                    apptitle: "Add Employee".tr,
                                    subtitle: "none");
                              }));
                            }
                            if (value == "Add Full Employee".tr) {
                              Add_Full_Employee(context);
                            }
                          },
                          itemBuilder: (BuildContext context) =>
                              <PopupMenuEntry<String>>[
                            PopupMenuItem<String>(
                                value: 'Add Employee'.tr,
                                child: Text(
                                  'Add Employee'.tr,
                                )),
                            PopupMenuItem<String>(
                                value: 'Add Full Employee'.tr,
                                child: Text('Add Full Employee'.tr)),
                          ],
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
                              style: ButtonStyle(
                                  backgroundColor: WidgetStatePropertyAll(
                                      Theme.of(context).cardColor),
                                  shape: WidgetStatePropertyAll(
                                      RoundedRectangleBorder(
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(5))))),
                              onPressed: () {
                                exportEmployeesToPDF(
                                    Get.find<Allempolyeecontroller>()
                                        .filteredreemployees);
                              },
                              icon: Icon(VMS_Icons.pdf,
                                  size: 18,
                                  color: Theme.of(context).highlightColor)),
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
                              exportEmployeesToExcel(
                                  Get.find<Allempolyeecontroller>()
                                      .filteredreemployees);
                            },
                            icon: Icon(VMS_Icons.xl,
                                size: 18,
                                color: Theme.of(context).highlightColor)),
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
          child: AllEmployeeGrid(),
        )),
      ],
    ));
  }
}
