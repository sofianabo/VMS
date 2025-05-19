import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vms_school/Icons_File/v_m_s__icons_icons.dart';
import 'package:vms_school/Link/API/AdminAPI/School/School_DropDown/DropdownClassesAPI.dart';
import 'package:vms_school/Link/API/AdminAPI/School/School_Screen_APIs/Subjects_API/Get_Subjects_API.dart';
import 'package:vms_school/Link/API/AdminAPI/Teacher_APIS/AddTeacherAPI.dart';
import 'package:vms_school/Link/API/AdminAPI/Teacher_APIS/GetAllTeachersAPI.dart';
import 'package:vms_school/Link/Controller/AdminController/Employee_Controllers/Add_Data_controller.dart';
import 'package:vms_school/Link/Controller/AdminController/Employee_Controllers/AllEmpolyeeController.dart';
import 'package:vms_school/Link/Controller/AdminController/Teacher_Controllers/AllTeachersController.dart';
import 'package:vms_school/Link/Controller/WidgetController/DropDown_Controllers/Sessions_DropDown_Controller.dart';
import 'package:vms_school/Link/Functions/Export_Exle_Function.dart';
import 'package:vms_school/Link/Functions/Export_PDF_Function.dart';
import 'package:vms_school/Link/Model/AdminModel/TeacherModels/AllTeacherModel.dart';
import 'package:vms_school/view/Admin/Teacher_Manager/TeacherManagementGrid.dart';
import 'package:vms_school/widgets/Admin/Admin_Employee/DropDownAllEmployee.dart';
import 'package:vms_school/widgets/Admin/Admin_School/All_Screen_Sessions.dart';
import 'package:vms_school/widgets/Admin/Admin_Teachers/DropDownAllTeacher.dart';
import 'package:vms_school/widgets/ButtonsDialog.dart';
import 'package:vms_school/widgets/Calender.dart';
import 'package:vms_school/widgets/Squer_Button_Enabled_Disabled.dart';
import 'package:vms_school/widgets/TextFildWithUpper.dart';
import 'package:vms_school/widgets/TextFormSearch.dart';
import 'package:vms_school/widgets/VMSAlertDialog.dart';

class TeacherManagement extends StatefulWidget {
  TeacherManagement({super.key});

  @override
  State<TeacherManagement> createState() => _TeacherManagementState();
}

class _TeacherManagementState extends State<TeacherManagement> {
  @override
  void initState() {
    Get.find<All_Screen_Sessions_Controller>().setSessionDefult();
    Get.find<Allteachercontroller>().initialData();
    Getallteachersapi.Getallteachers();
    Get_Subject_Screen_API(context).Get_Subject_Screen();
    Getallclassapi.getAllClasses();
    super.initState();
  }

  TextEditingController search = TextEditingController();
  TextEditingController username = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController firstName = TextEditingController();
  TextEditingController lastName = TextEditingController();
  TextEditingController phone = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController cPassword = TextEditingController();

  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;

    Add_Dialog() {
      Get.find<Allteachercontroller>().resetError();
      Get.find<Allempolyeecontroller>().Joindate.value = null;
      Get.find<Allempolyeecontroller>().GenderListIndex = "";
      Get.find<Allempolyeecontroller>().ContractTypeIndex = "";
      firstName.clear();
      lastName.clear();
      email.clear();
      username.clear();
      phone.clear();
      password.clear();
      cPassword.clear();
      Get.dialog(barrierDismissible: false,
          GetBuilder<Allteachercontroller>(builder: (controller) {
        return VMSAlertDialog(
            action: [
              ButtonDialog(
                  text: "Add Teacher".tr,
                  onPressed: () async {
                    bool isUsernameEmpty = username.text.trim().isEmpty;
                    bool isPhoneEmpty = phone.text.trim().isEmpty;
                    bool isEmailEmpty = email.text.trim().isEmpty;
                    bool isPasswordEmpty = password.text.trim().isEmpty;
                    bool isConfirmPasswordEmpty = cPassword.text.trim().isEmpty;
                    bool isFirstnameEmpty = firstName.text.trim().isEmpty;
                    bool isLastnameEmpty = lastName.text.trim().isEmpty;
                    bool isJoindateEmpty =
                        Get.find<Allempolyeecontroller>().Joindate.value ==
                            null;
                    bool isGenderEmpty = Get.find<Allempolyeecontroller>()
                            .GenderListIndex
                            .isEmpty ||
                        Get.find<Allempolyeecontroller>().GenderListIndex == "";
                    bool isContractTypeEmpty = Get.find<Allempolyeecontroller>()
                            .ContractTypeIndex
                            .isEmpty ||
                        Get.find<Allempolyeecontroller>().ContractTypeIndex ==
                            "";

                    RegExp emailRegex = RegExp(
                        r"^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$");
                    bool isEmailValid = emailRegex.hasMatch(email.text);

                    RegExp passwordRegex = RegExp(r"^[a-zA-Z0-9]{8,}$");
                    bool isPasswordValid =
                        passwordRegex.hasMatch(password.text);
                    bool isConfirmPasswordValid =
                        passwordRegex.hasMatch(cPassword.text);

                    // تحديث الأخطاء بناءً على الإدخال
                    controller.updateFieldError("first", isFirstnameEmpty);
                    controller.updateFieldError("last", isLastnameEmpty);
                    controller.updateFieldError(
                        "email", isEmailEmpty || !isEmailValid);
                    controller.updateFieldError("username", isUsernameEmpty);
                    controller.updateFieldError("phone", isPhoneEmpty);

                    controller.updateFieldError("join", isJoindateEmpty);
                    controller.updateFieldError("gender", isGenderEmpty);
                    controller.updateFieldError(
                        "contract", isContractTypeEmpty);
                    controller.updateFieldError(
                        "password", isPasswordEmpty || !isPasswordValid);
                    controller.updateFieldError(
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
                          Get.find<Allempolyeecontroller>().Joindate.toString(),
                          phone.text,
                          Get.find<Allempolyeecontroller>().GenderListIndex,
                          Get.find<Allempolyeecontroller>()
                              .ContractTypeIndex
                              .trim(),
                          "Teacher",
                          "Teacher",
                          password.text);
                    }
                  },
                  color: Theme.of(context).primaryColor,
                  width: 120)
            ],
            contents: Container(
              width: 460,
              child: SingleChildScrollView(
                child: Column(
                  spacing: 10.0,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Wrap(
                      runSpacing: 8.0,
                      spacing: 8.0,
                      crossAxisAlignment: WrapCrossAlignment.center,
                      alignment: WrapAlignment.center,
                      runAlignment: WrapAlignment.center,
                      children: [
                        Textfildwithupper(
                            onChanged: (value) {
                              if (value.isNotEmpty) {
                                controller.updateFieldError("first", false);
                              }
                            },
                            isRequired: true,
                            isError: controller.ISfirstNameError,
                            Uptext: "First Name".tr,
                            width: 220,
                            controller: firstName,
                            hinttext: "First Name".tr),
                        Textfildwithupper(
                            onChanged: (value) {
                              if (value.isNotEmpty) {
                                controller.updateFieldError("last", false);
                              }
                            },
                            isRequired: true,
                            isError: controller.ISlastNameError,
                            Uptext: "Last Name".tr,
                            width: 220,
                            controller: lastName,
                            hinttext: "Last Name".tr)
                      ],
                    ),
                    Wrap(
                      runSpacing: 8.0,
                      spacing: 8.0,
                      crossAxisAlignment: WrapCrossAlignment.center,
                      alignment: WrapAlignment.center,
                      runAlignment: WrapAlignment.center,
                      children: [
                        Textfildwithupper(
                            onChanged: (value) {
                              if (value.isNotEmpty) {
                                controller.updateFieldError("email", false);
                              }
                            },
                            fieldType: "email",
                            isRequired: true,
                            isError: controller.ISemailError,
                            Uptext: "Email".tr,
                            width: 220,
                            controller: email,
                            hinttext: "Email".tr),
                        Textfildwithupper(
                            onChanged: (value) {
                              if (value.isNotEmpty) {
                                controller.updateFieldError("username", false);
                              }
                            },
                            isRequired: true,
                            isError: controller.ISusernameError,
                            Uptext: "Username".tr,
                            width: 220,
                            controller: username,
                            hinttext: "Username".tr)
                      ],
                    ),
                    Wrap(
                      runSpacing: 8.0,
                      spacing: 8.0,
                      crossAxisAlignment: WrapCrossAlignment.center,
                      alignment: WrapAlignment.center,
                      runAlignment: WrapAlignment.center,
                      children: [
                        Textfildwithupper(
                            fieldType: "phone",
                            onChanged: (value) {
                              if (value.isNotEmpty) {
                                controller.updateFieldError("phone", false);
                              }
                            },
                            isRequired: true,
                            isError: controller.ISphoneError,
                            Uptext: "Phone Number".tr,
                            width: 220,
                            controller: phone,
                            hinttext: "Phone Number".tr),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            JoinDate(
                              isRequired: true,
                              isError: controller.IsJoinError,
                              width: 220,
                              Uptext: "Join Date".tr,
                            )
                          ],
                        )
                      ],
                    ),
                    Wrap(
                      runSpacing: 8.0,
                      spacing: 8.0,
                      crossAxisAlignment: WrapCrossAlignment.center,
                      alignment: WrapAlignment.center,
                      runAlignment: WrapAlignment.center,
                      children: [
                        Dropdownallemployee(
                            isError: controller.IsGenderError,
                            title: "Gender".tr,
                            width: 220,
                            type: "Gender"),
                        Dropdownallemployee(
                            isError: controller.IsContractError,
                            title: "Contract Type".tr,
                            width: 220,
                            type: "Contract"),
                      ],
                    ),
                    Wrap(
                      runSpacing: 8.0,
                      spacing: 8.0,
                      crossAxisAlignment: WrapCrossAlignment.center,
                      alignment: WrapAlignment.center,
                      runAlignment: WrapAlignment.center,
                      children: [
                        Textfildwithupper(
                            hidePassword: controller.ShowPassword,
                            IconButton: IconButton(
                                onPressed: () {
                                  controller.ChangeShowPassword(
                                      !controller.ShowPassword);
                                },
                                icon: Icon(
                                  controller.ShowPassword
                                      ? Icons.visibility_off
                                      : Icons.remove_red_eye_outlined,
                                  color: Theme.of(context)
                                      .textTheme
                                      .bodySmall!
                                      .color,
                                )),
                            onChanged: (value) {
                              if (value.isNotEmpty) {
                                controller.updateFieldError("password", false);
                              }
                            },
                            fieldType: "password",
                            isRequired: true,
                            isError: controller.ISpasswordError,
                            Uptext: "Password".tr,
                            width: 220,
                            controller: password,
                            hinttext: "Password".tr),
                        Textfildwithupper(
                            customErrorMessage: cPassword.text.trim() != "" &&
                                    cPassword.text.isNotEmpty
                                ? "كلمات المرور غير متطابقة"
                                : "لا يمكن ترك الحقل فارغ",
                            hidePassword: controller.ShowConfirmPassword,
                            IconButton: IconButton(
                                onPressed: () {
                                  controller.ChangeShowConfirmPassword(
                                      !controller.ShowConfirmPassword);
                                },
                                icon: Icon(
                                  controller.ShowConfirmPassword
                                      ? Icons.visibility_off
                                      : Icons.remove_red_eye_outlined,
                                  color: Theme.of(context)
                                      .textTheme
                                      .bodySmall!
                                      .color,
                                )),
                            onChanged: (value) {
                              if (value.isNotEmpty) {
                                controller.updateFieldError("cpassword", false);
                              }
                            },
                            fieldType: "password",
                            isRequired: true,
                            isError: controller.IScPasswordError,
                            Uptext: "Confirm Password".tr,
                            width: 220,
                            controller: cPassword,
                            hinttext: "Confirm Password".tr)
                      ],
                    )
                  ],
                ),
              ),
            ),
            apptitle: "Add Teacher".tr,
            subtitle: "none");
      }));
    }

    return Expanded(
        child: Column(
      children: [
        if (w > 897)
          Container(
            width: w,
            margin: EdgeInsets.only(left: 30.0, right: 30.0, top: 30.0),
            child: Wrap(
              runSpacing: 8.0,
              spacing: 8.0,
              crossAxisAlignment: WrapCrossAlignment.center,
              alignment: WrapAlignment.spaceBetween,
              runAlignment: WrapAlignment.spaceBetween,
              children: [
                GetBuilder<Allteachercontroller>(builder: (controller) {
                  return Wrap(
                    runSpacing: 8.0,
                    spacing: 8.0,
                    children: [
                      DropDownAllSessions(
                        title: "Session".tr,
                        width: 200,
                        type: "session",
                        API: "TeacherManagement",
                      ),
                      Dropdownallteacher(
                        isLoading: controller.isClassLoading,
                        width: 200,
                        title: "Class".tr,
                        type: 'Class',
                      ),
                      Dropdownallteacher(
                        isLoading: controller.isSubjectLoading,
                        width: 200,
                        title: "Subject".tr,
                        type: 'Subject',
                      ),
                      TextFormSearch(
                        click: () {
                          controller.clearFilter();
                        },
                        onchange: (value) {
                          controller.searchRequestByName(value,
                              controller.classIndex, controller.SubjectIndex);
                        },
                        width: 300,
                        radius: 5,
                        controller: search,
                        suffixIcon:
                            search.text.isNotEmpty ? Icons.close : Icons.search,
                      ),
                    ],
                  );
                }),
                if (Get.find<Add_Data_controller>().roll != "observer")
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    spacing: 8.0,
                    children: [
                      Squer_Button_Enabled_Disabled(
                        onTap: () {
                          Add_Dialog();
                        },
                        icon: Icons.add,
                        validate:
                            Get.find<Add_Data_controller>().roll == "subAdmin",
                      ),
                      Container(
                        width: 40,
                        height: 40,
                        decoration: BoxDecoration(
                            color: Theme.of(context).cardColor,
                            borderRadius: BorderRadius.circular(5),
                            boxShadow: [
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
                              exportDataToPdf<Teachers>(
                                items: Get.find<Allteachercontroller>()
                                    .filteredTeacher!,
                                headers: [
                                  "Name".tr,
                                  "Gender".tr,
                                  "Contract Type".tr,
                                  "Subjects Count".tr,
                                  "Phone Number".tr,
                                  "Email".tr,
                                ],
                                fieldMappings: {
                                  "Name".tr: (reg) => reg.fullName ?? "",
                                  "Phone Number".tr: (reg) => reg.phone ?? "",
                                  "Email".tr: (reg) => reg.email ?? "",
                                  "Contract Type".tr: (reg) =>
                                      reg.contractType!.tr ?? "",
                                  "Gender".tr: (reg) => reg.gender!.tr ?? "",
                                  "Subjects Count".tr: (reg) =>
                                      reg.subject!.length ?? "",
                                },
                                fileName: "Teachers".tr +
                                    ' ${DateTime.now().toIso8601String()}',
                              );
                            },
                            icon: Icon(VMS_Icons.pdf,
                                size: 18,
                                color: Theme.of(context).highlightColor)),
                      ),
                      Container(
                        width: 40,
                        height: 40,
                        decoration: BoxDecoration(
                            color: Theme.of(context).cardColor,
                            borderRadius: BorderRadius.circular(5),
                            boxShadow: [
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
                              exportDataToExcel<Teachers>(
                                items: Get.find<Allteachercontroller>()
                                    .filteredTeacher!,
                                headers: [
                                  "Name".tr,
                                  "Gender".tr,
                                  "Contract Type".tr,
                                  "Subjects Count".tr,
                                  "Phone Number".tr,
                                  "Email".tr,
                                ],
                                fieldMappings: {
                                  "Name".tr: (reg) => reg.fullName ?? "",
                                  "Phone Number".tr: (reg) => reg.phone ?? "",
                                  "Email".tr: (reg) => reg.email ?? "",
                                  "Contract Type".tr: (reg) =>
                                      reg.contractType!.tr ?? "",
                                  "Gender".tr: (reg) => reg.gender!.tr ?? "",
                                  "Subjects Count".tr: (reg) =>
                                      reg.subject!.length ?? "",
                                },
                                fileName: "Teachers".tr +
                                    ' ${DateTime.now().toIso8601String()}',
                              );
                            },
                            icon: Icon(VMS_Icons.xl,
                                size: 18,
                                color: Theme.of(context).highlightColor)),
                      ),
                    ],
                  )
              ],
            ),
          ),
        if (w <= 897)
          Container(
            width: w,
            margin: EdgeInsets.only(left: 30.0, right: 30.0, top: 30.0),
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: GetBuilder<Allteachercontroller>(builder: (controller) {
                return Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  spacing: 8.0,
                  children: [
                    DropDownAllSessions(
                      title: "Session".tr,
                      width: 200,
                      type: "session",
                      API: "TeacherManagement",
                    ),
                    Dropdownallteacher(
                      isLoading: controller.isClassLoading,
                      width: 200,
                      title: "Class".tr,
                      type: 'Class',
                    ),
                    Dropdownallteacher(
                      isLoading: controller.isSubjectLoading,
                      width: 200,
                      title: "Subject".tr,
                      type: 'Subject',
                    ),
                    TextFormSearch(
                      click: () {
                        controller.clearFilter();
                      },
                      onchange: (value) {
                        controller.searchRequestByName(value,
                            controller.classIndex, controller.SubjectIndex);
                      },
                      width: 300,
                      radius: 5,
                      controller: search,
                      suffixIcon:
                          search.text.isNotEmpty ? Icons.close : Icons.search,
                    ),
                    if (Get.find<Add_Data_controller>().roll != "observer")
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        spacing: 8.0,
                        children: [
                          Squer_Button_Enabled_Disabled(
                            onTap: () {
                              Add_Dialog();
                            },
                            icon: Icons.add,
                            validate: Get.find<Add_Data_controller>().roll ==
                                "subAdmin",
                          ),
                          Container(
                            width: 40,
                            height: 40,
                            decoration: BoxDecoration(
                                color: Theme.of(context).cardColor,
                                borderRadius: BorderRadius.circular(5),
                                boxShadow: [
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
                                  exportDataToPdf<Teachers>(
                                    items: Get.find<Allteachercontroller>()
                                        .filteredTeacher!,
                                    headers: [
                                      "Name".tr,
                                      "Gender".tr,
                                      "Contract Type".tr,
                                      "Subjects Count".tr,
                                      "Phone Number".tr,
                                      "Email".tr,
                                    ],
                                    fieldMappings: {
                                      "Name".tr: (reg) => reg.fullName ?? "",
                                      "Phone Number".tr: (reg) =>
                                          reg.phone ?? "",
                                      "Email".tr: (reg) => reg.email ?? "",
                                      "Contract Type".tr: (reg) =>
                                          reg.contractType!.tr ?? "",
                                      "Gender".tr: (reg) =>
                                          reg.gender!.tr ?? "",
                                      "Subjects Count".tr: (reg) =>
                                          reg.subject!.length ?? "",
                                    },
                                    fileName: "Teachers".tr +
                                        ' ${DateTime.now().toIso8601String()}',
                                  );
                                },
                                icon: Icon(VMS_Icons.pdf,
                                    size: 18,
                                    color: Theme.of(context).highlightColor)),
                          ),
                          Container(
                            width: 40,
                            height: 40,
                            decoration: BoxDecoration(
                                color: Theme.of(context).cardColor,
                                borderRadius: BorderRadius.circular(5),
                                boxShadow: [
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
                                  exportDataToExcel<Teachers>(
                                    items: Get.find<Allteachercontroller>()
                                        .filteredTeacher!,
                                    headers: [
                                      "Name".tr,
                                      "Gender".tr,
                                      "Contract Type".tr,
                                      "Subjects Count".tr,
                                      "Phone Number".tr,
                                      "Email".tr,
                                    ],
                                    fieldMappings: {
                                      "Name".tr: (reg) => reg.fullName ?? "",
                                      "Phone Number".tr: (reg) =>
                                          reg.phone ?? "",
                                      "Email".tr: (reg) => reg.email ?? "",
                                      "Contract Type".tr: (reg) =>
                                          reg.contractType!.tr ?? "",
                                      "Gender".tr: (reg) =>
                                          reg.gender!.tr ?? "",
                                      "Subjects Count".tr: (reg) =>
                                          reg.subject!.length ?? "",
                                    },
                                    fileName: "Teachers".tr +
                                        ' ${DateTime.now().toIso8601String()}',
                                  );
                                },
                                icon: Icon(VMS_Icons.xl,
                                    size: 18,
                                    color: Theme.of(context).highlightColor)),
                          ),
                        ],
                      )
                  ],
                );
              }),
            ),
          ),
        Expanded(
            child: Padding(
          padding: EdgeInsets.only(top: 15.0),
          child: TeacherManagementGrid(),
        )),
      ],
    ));
  }
}
