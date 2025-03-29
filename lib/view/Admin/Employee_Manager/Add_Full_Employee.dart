import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vms_school/Link/API/AdminAPI/Employees_APIs/AddFullEmployeeAPI.dart';
import 'package:vms_school/Link/Controller/AdminController/Employee_Controllers/Add_Full_Employee_Controller.dart';
import 'package:vms_school/Link/Controller/AdminController/Employee_Controllers/AllEmpolyeeController.dart';
import 'package:vms_school/Translate/local_controller.dart';
import 'package:vms_school/main.dart';
import 'package:vms_school/widgets/ButtonsDialog.dart';
import 'package:vms_school/widgets/Calender.dart';
import 'package:vms_school/widgets/LargeTextField.dart';
import 'package:vms_school/widgets/TextFildWithUpper.dart';
import 'package:vms_school/widgets/VMSAlertDialog.dart';
import 'package:vms_school/widgets/Admin_employee/DropDownAllEmployee.dart';

Add_Full_Employee(BuildContext context) {
  TextEditingController firstName = TextEditingController();
  TextEditingController lastName = TextEditingController();
  TextEditingController fatherName = TextEditingController();
  TextEditingController motherName = TextEditingController();
  TextEditingController phoneNumper = TextEditingController();
  TextEditingController emergencyNumber = TextEditingController();
  TextEditingController Address = TextEditingController();
  TextEditingController currentAddress = TextEditingController();
  TextEditingController Salary = TextEditingController(text: "0");
  TextEditingController facebookUrl = TextEditingController();
  TextEditingController xPlatformUrl = TextEditingController();
  TextEditingController linkedinUrl = TextEditingController();
  TextEditingController instagramUrl = TextEditingController();
  TextEditingController bankAccountTitle = TextEditingController();
  TextEditingController bankName = TextEditingController();
  TextEditingController bankBranchName = TextEditingController();
  TextEditingController bankAccountNumber = TextEditingController();
  TextEditingController ifscCode = TextEditingController();
  TextEditingController careerHistory = TextEditingController();
  TextEditingController Qualification = TextEditingController();
  TextEditingController Experience = TextEditingController();
  TextEditingController Note = TextEditingController();

  Get.dialog(GetBuilder<Allempolyeecontroller>(builder: (controller) {
    return VMSAlertDialog(
        action: [
          ButtonDialog(
              text: "Add Employee".tr,
              onPressed: () async {
                {
                  bool isJopEmpty = controller.dialogjobTitleIndex.isEmpty ||
                      controller.dialogjobTitleIndex == "";
                  bool isGenderEmpty = controller.GenderListIndex.isEmpty ||
                      controller.GenderListIndex == "";
                  bool isFamilyEmpty = controller.Family_StatusIndex.isEmpty ||
                      controller.Family_StatusIndex == "";
                  bool isjoinEmpty = controller.Joindate.value == null ||
                      controller.Joindate.value.toString() == "";
                  bool isBirthEmpty = controller.Birthdate.value == null ||
                      controller.Birthdate.value.toString() == "";
                  bool isfirstEmpty = firstName.text.trim().isEmpty;
                  bool islastnameEmpty = lastName.text.trim().isEmpty;
                  bool isfatherEmpty = fatherName.text.trim().isEmpty;
                  bool ismotherEmpty = motherName.text.trim().isEmpty;
                  bool isphoneEmpty = phoneNumper.text.trim().isEmpty;
                  bool isemgnEmpty = emergencyNumber.text.trim().isEmpty;
                  bool isaddressEmpty = Address.text.trim().isEmpty;
                  bool isCurrentAdressEmpty =
                      currentAddress.text.trim().isEmpty;
                  bool isQualEmpty = Qualification.text.trim().isEmpty;
                  bool isExpEmpty = Experience.text.trim().isEmpty;
                  final cont = Get.find<AddFullEmployeeController>();
                  cont.updateFieldError("first", isfirstEmpty);
                  cont.updateFieldError("last", islastnameEmpty);
                  cont.updateFieldError("father", isfatherEmpty);
                  cont.updateFieldError("mother", ismotherEmpty);
                  cont.updateFieldError("birth", isBirthEmpty);
                  cont.updateFieldError("phone", isphoneEmpty);
                  cont.updateFieldError("emgn", isemgnEmpty);
                  cont.updateFieldError("join", isjoinEmpty);
                  cont.updateFieldError("address", isaddressEmpty);
                  cont.updateFieldError("caddress", isCurrentAdressEmpty);
                  cont.updateFieldError("jop", isJopEmpty);
                  cont.updateFieldError("gender", isGenderEmpty);
                  cont.updateFieldError("family", isFamilyEmpty);
                  cont.updateFieldError("qua", isQualEmpty);
                  cont.updateFieldError("exp", isExpEmpty);

                  if (!(isJopEmpty ||
                      isGenderEmpty ||
                      isFamilyEmpty ||
                      isjoinEmpty ||
                      isBirthEmpty ||
                      isfirstEmpty ||
                      islastnameEmpty ||
                      isfatherEmpty ||
                      ismotherEmpty ||
                      isphoneEmpty ||
                      isemgnEmpty ||
                      isaddressEmpty ||
                      isCurrentAdressEmpty ||
                      isQualEmpty ||
                      isExpEmpty)) {
                    await AddFullEmployee.addFullEmployees(
                      First_Name: firstName.text,
                      Last_Name: lastName.text,
                      Father_Name: fatherName.text,
                      Mother_Name: motherName.text,
                      Phone_Numper: phoneNumper.text,
                      Emergency_Number: emergencyNumber.text,
                      Address: Address.text,
                      Current_Address: currentAddress.text,
                      Birth_Date: controller.Birthdate.value.toString(),
                      Join_Date: controller.Joindate.value.toString(),
                      Jop_Title: controller.dialogjobTitleIndex,
                      Gender: controller.GenderListIndex,
                      Family_State: controller.Family_StatusIndex,
                      Salary: Salary.text,
                      selectedImage: Get.find<AddFullEmployeeController>()
                          .selectedImage
                          .value,
                      Facebook_URL: facebookUrl.text,
                      X_Platform_URL: xPlatformUrl.text,
                      Linkedin_URL: linkedinUrl.text,
                      Instagram_URL: instagramUrl.text,
                      Bank_Account_Title: bankAccountTitle.text,
                      Bank_Name: bankName.text,
                      Bank_Branch_Name: bankBranchName.text,
                      Bank_Account_Number: bankAccountNumber.text,
                      IFSC_Code: ifscCode.text,
                      Career_History: careerHistory.text,
                      Qualification: Qualification.text,
                      Experience: Experience.text,
                      Note: Note.text,
                    );
                  }
                }
              },
              color: Get.theme.primaryColor,
              width: 140)
        ],
        contents: GetBuilder<AddFullEmployeeController>(builder: (controller) {
          return SizedBox(
            width: 520,
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        children: [
                          Obx(
                            () => GestureDetector(
                              onTap: () async {
                                await controller.pickImage(context);
                              },
                              child: CircleAvatar(
                                backgroundColor: const Color(0xffC4C4C4),
                                maxRadius: 100,
                                backgroundImage:
                                    controller.selectedImage.value != null
                                        ? MemoryImage(
                                            controller.selectedImage.value!)
                                        : null,
                                child: controller.selectedImage.value == null
                                    ? const Icon(
                                        Icons.image_outlined,
                                        color: Colors.white,
                                        size: 40,
                                      )
                                    : null, // عرض الأيقونة إذا لم تكن هناك صورة
                              ),
                            ),
                          )
                        ],
                      ),
                      Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Textfildwithupper(
                              onChanged: (value) {
                                if (value.isNotEmpty) {
                                  controller.updateFieldError("first", false);
                                }
                              },
                              isRequired: true,
                              isError: controller.IsFirstError,
                              width: 250,
                              controller: firstName,
                              Uptext: "First Name".tr,
                              hinttext: "First Name".tr),
                          Padding(
                            padding: const EdgeInsets.only(top: 22.0),
                            child: Textfildwithupper(
                                onChanged: (value) {
                                  if (value.isNotEmpty) {
                                    controller.updateFieldError("last", false);
                                  }
                                },
                                isError: controller.IsLastError,
                                isRequired: true,
                                width: 250,
                                controller: lastName,
                                Uptext: "Last Name".tr,
                                hinttext: "Last Name".tr),
                          ),
                        ],
                      )
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 10.0),
                    child: Row(
                      children: [
                        Textfildwithupper(
                            onChanged: (value) {
                              if (value.isNotEmpty) {
                                controller.updateFieldError("father", false);
                              }
                            },
                            isError: controller.IsFatherError,
                            isRequired: true,
                            width: 250,
                            controller: fatherName,
                            Uptext: "Father Name".tr,
                            hinttext: "Father Name".tr),
                        Padding(
                          padding: EdgeInsets.only(
                              left: prefs!.getString(languageKey) == "ar"
                                  ? 0
                                  : 20.0,
                              right: prefs!.getString(languageKey) == "ar"
                                  ? 20
                                  : 0),
                          child: Textfildwithupper(
                              onChanged: (value) {
                                if (value.isNotEmpty) {
                                  controller.updateFieldError("mother", false);
                                }
                              },
                              isError: controller.IsMotherError,
                              isRequired: true,
                              width: 250,
                              controller: motherName,
                              Uptext: "Mother Name".tr,
                              hinttext: "Mother Name".tr),
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 22.0),
                    child: Row(
                      children: [
                        Textfildwithupper(
                            fieldType: "phone",
                            onChanged: (value) {
                              if (value.isNotEmpty) {
                                controller.updateFieldError("phone", false);
                              }
                            },
                            isError: controller.IsPhoneError,
                            isRequired: true,
                            width: 250,
                            controller: phoneNumper,
                            Uptext: "Phone Number".tr,
                            hinttext: "Phone Number".tr),
                        Padding(
                            padding: EdgeInsets.only(
                                left: prefs!.getString(languageKey) == "ar"
                                    ? 0
                                    : 20.0,
                                right: prefs!.getString(languageKey) == "ar"
                                    ? 20
                                    : 0),
                            child: BirthDate(
                              isError: controller.IsBirthError,
                              isRequired: true,
                              Uptext: "Birthdate".tr,
                              width: 250,
                            ))
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 22.0),
                    child: Row(
                      children: [
                        Textfildwithupper(
                            fieldType: "phone",
                            onChanged: (value) {
                              if (value.isNotEmpty) {
                                controller.updateFieldError("emgn", false);
                              }
                            },
                            isError: controller.IsEmgnError,
                            isRequired: true,
                            width: 250,
                            controller: emergencyNumber,
                            Uptext: "Emergency Number".tr,
                            hinttext: "Emergency Number".tr),
                        Padding(
                            padding: EdgeInsets.only(
                                left: prefs!.getString(languageKey) == "ar"
                                    ? 0
                                    : 20.0,
                                right: prefs!.getString(languageKey) == "ar"
                                    ? 20
                                    : 0),
                            child: JoinDate(
                              isError: controller.IsJoinError,
                              isRequired: true,
                              Uptext: "Join Date".tr,
                              width: 250,
                            ))
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 22.0),
                    child: Row(
                      children: [
                        Textfildwithupper(
                            onChanged: (value) {
                              if (value.isNotEmpty) {
                                controller.updateFieldError("address", false);
                              }
                            },
                            isError: controller.IsAddressError,
                            isRequired: true,
                            width: 250,
                            controller: Address,
                            Uptext: "Address".tr,
                            hinttext: "Address".tr),
                        Padding(
                          padding: EdgeInsets.only(
                              left: prefs!.getString(languageKey) == "ar"
                                  ? 0
                                  : 20.0,
                              right: prefs!.getString(languageKey) == "ar"
                                  ? 20
                                  : 0),
                          child: Textfildwithupper(
                              onChanged: (value) {
                                if (value.isNotEmpty) {
                                  controller.updateFieldError(
                                      "caddress", false);
                                }
                              },
                              isError: controller.IsCAddressError,
                              isRequired: true,
                              width: 250,
                              controller: currentAddress,
                              Uptext: "Current Address".tr,
                              hinttext: "Current Address".tr),
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 22.0),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Textfildwithupper(
                            fieldType: "number",
                            width: 250,
                            controller: Salary,
                            Uptext: "Salary".tr,
                            hinttext: "Salary".tr),
                        Padding(
                          padding: EdgeInsets.only(
                              left: prefs!.getString(languageKey) == "ar"
                                  ? 0
                                  : 20.0,
                              right: prefs!.getString(languageKey) == "ar"
                                  ? 20
                                  : 0),
                        ),
                        Dropdownallemployee(
                            title: "Job Title".tr,
                            isError: controller.IsJopError,
                            width: 250,
                            type: "dialogjobTitle")
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 22.0),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Dropdownallemployee(
                            title: "Gender".tr, width: 250, type: "Gender"),
                        Padding(
                          padding: EdgeInsets.only(
                              left: prefs!.getString(languageKey) == "ar"
                                  ? 0
                                  : 20.0,
                              right: prefs!.getString(languageKey) == "ar"
                                  ? 20
                                  : 0),
                          child: Dropdownallemployee(
                              title: "Family Status".tr,
                              width: 250,
                              type: "Family_Status"),
                        )

                        // Gender
                        // Family_Status
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 22.0),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(
                          "Social Media Info".tr,
                          style: Get.theme.textTheme.titleLarge!
                              .copyWith(fontSize: 20),
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 22.0),
                    child: Row(
                      children: [
                        Textfildwithupper(
                            width: 250,
                            controller: facebookUrl,
                            Uptext: "Facebook URL".tr,
                            hinttext: "Facebook URL".tr),
                        Padding(
                          padding: EdgeInsets.only(
                              left: prefs!.getString(languageKey) == "ar"
                                  ? 0
                                  : 20.0,
                              right: prefs!.getString(languageKey) == "ar"
                                  ? 20
                                  : 0),
                          child: Textfildwithupper(
                              width: 250,
                              controller: xPlatformUrl,
                              Uptext: "X Platform URL".tr,
                              hinttext: "X Platform URL".tr),
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 22.0),
                    child: Row(
                      children: [
                        Textfildwithupper(
                            width: 250,
                            controller: linkedinUrl,
                            Uptext: "Linkedin URL".tr,
                            hinttext: "Linkedin URL".tr),
                        Padding(
                          padding: EdgeInsets.only(
                              left: prefs!.getString(languageKey) == "ar"
                                  ? 0
                                  : 20.0,
                              right: prefs!.getString(languageKey) == "ar"
                                  ? 20
                                  : 0),
                          child: Textfildwithupper(
                              width: 250,
                              controller: instagramUrl,
                              Uptext: "Instagram URL".tr,
                              hinttext: "Instagram URL".tr),
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 22.0),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(
                          "Employee Bank Info".tr,
                          style: Get.theme.textTheme.titleLarge!
                              .copyWith(fontSize: 20),
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 22.0),
                    child: Row(
                      children: [
                        Textfildwithupper(
                            width: 250,
                            controller: bankAccountTitle,
                            Uptext: "Bank Account Title".tr,
                            hinttext: "Bank Account Title".tr),
                        Padding(
                          padding: EdgeInsets.only(
                              left: prefs!.getString(languageKey) == "ar"
                                  ? 0
                                  : 20.0,
                              right: prefs!.getString(languageKey) == "ar"
                                  ? 20
                                  : 0),
                          child: Textfildwithupper(
                              width: 250,
                              controller: bankName,
                              Uptext: "Bank Name".tr,
                              hinttext: "Bank Name".tr),
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 22.0),
                    child: Row(
                      children: [
                        Textfildwithupper(
                            width: 250,
                            controller: bankBranchName,
                            Uptext: "Bank Branch Name".tr,
                            hinttext: "Bank Branch Name".tr),
                        Padding(
                          padding: EdgeInsets.only(
                              left: prefs!.getString(languageKey) == "ar"
                                  ? 0
                                  : 20.0,
                              right: prefs!.getString(languageKey) == "ar"
                                  ? 20
                                  : 0),
                          child: Textfildwithupper(
                              width: 250,
                              controller: bankAccountNumber,
                              Uptext: "Bank Account Number".tr,
                              hinttext: "Bank Account Number".tr),
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 22.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Textfildwithupper(
                            width: 250,
                            controller: ifscCode,
                            Uptext: "IFSC Code".tr,
                            hinttext: "IFSC Code".tr),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 22.0),
                    child: Divider(
                      color: Get.theme.primaryColor,
                      height: 1,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 22.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        LargeTextField(
                            controller: careerHistory,
                            hinttext: "Career History".tr),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 22.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        LargeTextField(
                            onChanged: (value) {
                              if (value.isNotEmpty) {
                                controller.updateFieldError("qua", false);
                              }
                            },
                            isError: controller.IsQualfError,
                            isRequired: true,
                            controller: Qualification,
                            hinttext: "Qualification".tr),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 22.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        LargeTextField(
                            onChanged: (value) {
                              if (value.isNotEmpty) {
                                controller.updateFieldError("exp", false);
                              }
                            },
                            isError: controller.IsExpError,
                            isRequired: true,
                            controller: Experience,
                            hinttext: "Experience".tr),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 22.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        LargeTextField(controller: Note, hinttext: "Note".tr),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        }),
        apptitle: "Add Employee".tr,
        subtitle: "none");
  }));
}
