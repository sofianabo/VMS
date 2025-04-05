import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vms_school/Link/API/API.dart';
import 'package:vms_school/Link/API/AdminAPI/Employees_APIs/Edit_Employee_API.dart';
import 'package:vms_school/Link/Controller/AdminController/Employee_Controllers/Add_Data_controller.dart';
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

EditEmployee(BuildContext context, int idx, String employeeID) {
  final empolyeecontroller = Get.find<Allempolyeecontroller>();
  TextEditingController firstName =
      TextEditingController(text: empolyeecontroller.employee!.firstName);
  TextEditingController lastName =
      TextEditingController(text: empolyeecontroller.employee!.lastName);
  TextEditingController fatherName =
      TextEditingController(text: empolyeecontroller.employee!.fatherName);
  TextEditingController motherName =
      TextEditingController(text: empolyeecontroller.employee!.motherName);
  TextEditingController phoneNumper =
      TextEditingController(text: empolyeecontroller.employee!.phone);
  TextEditingController emergencyNumber =
      TextEditingController(text: empolyeecontroller.employee!.emergencyNumber);
  TextEditingController Address =
      TextEditingController(text: empolyeecontroller.employee!.address);
  TextEditingController currentAddress =
      TextEditingController(text: empolyeecontroller.employee!.currentAddress);
  TextEditingController Salary = TextEditingController(
      text: empolyeecontroller.employee!.salary.toString());
  TextEditingController Email =
      TextEditingController(text: empolyeecontroller.employee!.email);
  TextEditingController Username =
      TextEditingController(text: empolyeecontroller.employee!.userName);
  TextEditingController Joptitle =
      TextEditingController(text: empolyeecontroller.employee!.jobTitle!.tr);
  TextEditingController roll =
      TextEditingController(text: empolyeecontroller.employee!.roll!.tr);
  TextEditingController facebookUrl =
      TextEditingController(text: empolyeecontroller.employee!.facebookUrl);
  TextEditingController xPlatformUrl =
      TextEditingController(text: empolyeecontroller.employee!.twitterUrl);
  TextEditingController linkedinUrl =
      TextEditingController(text: empolyeecontroller.employee!.lenkedinUrl);
  TextEditingController instagramUrl =
      TextEditingController(text: empolyeecontroller.employee!.instagramUrl);
  TextEditingController bankAccountTitle = TextEditingController(
      text: empolyeecontroller.employee!.bankAccountTitle);
  TextEditingController bankName =
      TextEditingController(text: empolyeecontroller.employee!.bankName);
  TextEditingController bankBranchName =
      TextEditingController(text: empolyeecontroller.employee!.bankBranchName);
  TextEditingController bankAccountNumber = TextEditingController(
      text: empolyeecontroller.employee!.bankAccountNumber);
  TextEditingController ifscCode =
      TextEditingController(text: empolyeecontroller.employee!.iFSCCode);
  TextEditingController careerHistory =
      TextEditingController(text: empolyeecontroller.employee!.careerHistory);
  TextEditingController Qualification =
      TextEditingController(text: empolyeecontroller.employee!.qualification);
  TextEditingController Experience =
      TextEditingController(text: empolyeecontroller.employee!.experience);
  TextEditingController Note =
      TextEditingController(text: empolyeecontroller.employee!.note);

  Get.dialog(GetBuilder<Allempolyeecontroller>(builder: (controller) {
    controller.Birthdate.value = DateTime.parse(
        Get.find<Allempolyeecontroller>().employee!.birthDate.toString());
    controller.Joindate.value = DateTime.parse(
        Get.find<Allempolyeecontroller>().employee!.joinDate.toString());

    return VMSAlertDialog(
        action: [
          ButtonDialog(
              text: "Edit Employee".tr,
              onPressed: () async {
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
                bool isCurrentAdressEmpty = currentAddress.text.trim().isEmpty;
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
                    isExpEmpty)) if (Get.find<Add_Data_controller>()
                        .roll !=
                    "subAdmin") {
                  await EditEmployeeApi.EditEmployee(
                    employeeId: employeeID,
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
              },
              color: Get.find<Add_Data_controller>().roll == "subAdmin"
                  ? Get.theme.disabledColor
                  : Get.theme.primaryColor,
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
                                if (Get.find<Add_Data_controller>().roll !=
                                    "subAdmin") {
                                  await controller.pickImage(context);
                                }
                              },
                              child: CircleAvatar(
                                maxRadius: 100,
                                backgroundColor: const Color(0xffC4C4C4),
                                backgroundImage: controller
                                            .selectedImage.value !=
                                        null
                                    ? MemoryImage(
                                        controller.selectedImage.value!)
                                    : empolyeecontroller
                                                .filteredreemployees[idx]
                                                .imageId !=
                                            null
                                        ? NetworkImage(getimage +
                                            "${empolyeecontroller.filteredreemployees[idx].imageId}")
                                        : null,
                                child: controller.selectedImage.value == null &&
                                        empolyeecontroller
                                                .filteredreemployees[idx]
                                                .imageId ==
                                            null
                                    ? const Icon(
                                        Icons.image_outlined,
                                        color: Colors.white,
                                        size: 40,
                                      )
                                    : null,
                              ),
                            ),
                          )
                        ],
                      ),
                      Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Textfildwithupper(
                              width: 250,
                              onChanged: (value) {
                                if (value.isNotEmpty) {
                                  controller.updateFieldError("first", false);
                                }
                              },
                              isRequired: true,
                              isError: controller.IsFirstError,
                              controller: firstName,
                              Uptext: "First Name".tr,
                              hinttext: "First Name".tr),
                          Padding(
                            padding: const EdgeInsets.only(top: 22.0),
                            child: Textfildwithupper(
                                width: 250,
                                onChanged: (value) {
                                  if (value.isNotEmpty) {
                                    controller.updateFieldError("last", false);
                                  }
                                },
                                isError: controller.IsLastError,
                                isRequired: true,
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
                            width: 250,
                            onChanged: (value) {
                              if (value.isNotEmpty) {
                                controller.updateFieldError("father", false);
                              }
                            },
                            isError: controller.IsFatherError,
                            isRequired: true,
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
                              width: 250,
                              onChanged: (value) {
                                if (value.isNotEmpty) {
                                  controller.updateFieldError("mother", false);
                                }
                              },
                              isError: controller.IsMotherError,
                              isRequired: true,
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
                            width: 250,
                            fieldType: "phone",
                            onChanged: (value) {
                              if (value.isNotEmpty) {
                                controller.updateFieldError("phone", false);
                              }
                            },
                            isError: controller.IsPhoneError,
                            isRequired: true,
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
                              Uptext: "Birthdate".tr,
                              isError: controller.IsBirthError,
                              isRequired: true,
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
                            width: 250,
                            fieldType: "phone",
                            onChanged: (value) {
                              if (value.isNotEmpty) {
                                controller.updateFieldError("emgn", false);
                              }
                            },
                            isError: controller.IsEmgnError,
                            isRequired: true,
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
                            width: 250,
                            onChanged: (value) {
                              if (value.isNotEmpty) {
                                controller.updateFieldError("address", false);
                              }
                            },
                            isError: controller.IsAddressError,
                            isRequired: true,
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
                              width: 250,
                              onChanged: (value) {
                                if (value.isNotEmpty) {
                                  controller.updateFieldError(
                                      "caddress", false);
                                }
                              },
                              isError: controller.IsCAddressError,
                              isRequired: true,
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
                      children: [
                        Textfildwithupper(
                            readOnly: true,
                            width: 250,
                            controller: Email,
                            Uptext: "Email".tr,
                            hinttext: "Email".tr),
                        Padding(
                          padding: EdgeInsets.only(
                              left: prefs!.getString(languageKey) == "ar"
                                  ? 0
                                  : 20.0,
                              right: prefs!.getString(languageKey) == "ar"
                                  ? 20
                                  : 0),
                          child: Textfildwithupper(
                              readOnly: true,
                              width: 250,
                              controller: Username,
                              Uptext: "Username".tr,
                              hinttext: "Username".tr),
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 22.0),
                    child: Row(
                      children: [
                        Textfildwithupper(
                            readOnly: true,
                            width: 250,
                            isError: controller.IsJopError,
                            controller: Joptitle,
                            Uptext: "Job Title".tr,
                            hinttext: "Job Title".tr),
                        Padding(
                          padding: EdgeInsets.only(
                              left: prefs!.getString(languageKey) == "ar"
                                  ? 0
                                  : 20.0,
                              right: prefs!.getString(languageKey) == "ar"
                                  ? 20
                                  : 0),
                          child: Textfildwithupper(
                              readOnly: true,
                              width: 250,
                              controller: roll,
                              Uptext: "Role".tr,
                              hinttext: "Role".tr),
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 22.0),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Dropdownallemployee(
                            isError: controller.IsGenderError,
                            title: "Gender".tr,
                            width: 250,
                            type: "Gender"),
                        Padding(
                          padding: EdgeInsets.only(
                              left: prefs!.getString(languageKey) == "ar"
                                  ? 0
                                  : 20.0,
                              right: prefs!.getString(languageKey) == "ar"
                                  ? 20
                                  : 0),
                          child: Dropdownallemployee(
                              isError: controller.IsFamilyError,
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
                        Textfildwithupper(
                            width: 250,
                            readOnly: true,
                            controller: Salary,
                            Uptext: "Salary".tr,
                            hinttext: "Salary".tr),
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
        apptitle: "Edit Employee".tr,
        subtitle: "none");
  }));
}
