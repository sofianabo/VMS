import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vms_school/Link/API/AdminAPI/Employees_APIs/AddFullEmployeeAPI.dart';
import 'package:vms_school/Link/Controller/AdminController/Employee_Controllers/Add_Full_Employee_Controller.dart';
import 'package:vms_school/Link/Controller/AdminController/Employee_Controllers/AllEmpolyeeController.dart';
import 'package:vms_school/Translate/local_controller.dart';
import 'package:vms_school/main.dart';
import 'package:vms_school/widgets/Admin/Admin_Employee/DropDownAllEmployee.dart';
import 'package:vms_school/widgets/ButtonsDialog.dart';
import 'package:vms_school/widgets/Calender.dart';
import 'package:vms_school/widgets/LargeTextField.dart';
import 'package:vms_school/widgets/TextFildWithUpper.dart';
import 'package:vms_school/widgets/VMSAlertDialog.dart';

class Add_Full_Employee extends StatefulWidget {
  const Add_Full_Employee({super.key});

  @override
  State<Add_Full_Employee> createState() => _Add_Full_EmployeeState();
}

class _Add_Full_EmployeeState extends State<Add_Full_Employee> {
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

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
    return GetBuilder<Allempolyeecontroller>(builder: (controller) {
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
                    bool isFamilyEmpty =
                        controller.Family_StatusIndex.isEmpty ||
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
          contents:
              GetBuilder<AddFullEmployeeController>(builder: (controller) {
            return SizedBox(
              width: 520,
              child: SingleChildScrollView(
                child: Column(
                  spacing: 2,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Container(
                      width: 520,
                      child: Wrap(
                        spacing: 20.0,
                        crossAxisAlignment: WrapCrossAlignment.center,
                        runSpacing: 2.0,
                        alignment: screenWidth >= 589
                            ? WrapAlignment.spaceBetween
                            : WrapAlignment.center,
                        runAlignment: WrapAlignment.center,
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
                                    child: controller.selectedImage.value ==
                                            null
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
                            spacing: 2.0,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Textfildwithupper(
                                  onChanged: (value) {
                                    if (value.isNotEmpty) {
                                      controller.updateFieldError(
                                          "first", false);
                                    }
                                  },
                                  isRequired: true,
                                  isError: controller.IsFirstError,
                                  width: screenWidth >= 600
                                      ? 250
                                      : (screenWidth) - 70,
                                  controller: firstName,
                                  Uptext: "First Name".tr,
                                  hinttext: "First Name".tr),
                              Textfildwithupper(
                                  onChanged: (value) {
                                    if (value.isNotEmpty) {
                                      controller.updateFieldError(
                                          "last", false);
                                    }
                                  },
                                  isError: controller.IsLastError,
                                  isRequired: true,
                                  width: screenWidth >= 600
                                      ? 250
                                      : (screenWidth) - 70,
                                  controller: lastName,
                                  Uptext: "Last Name".tr,
                                  hinttext: "Last Name".tr),
                            ],
                          )
                        ],
                      ),
                    ),
                    Wrap(
                      spacing: 20.0,
                      crossAxisAlignment: WrapCrossAlignment.center,
                      runSpacing: 2.0,
                      runAlignment: WrapAlignment.center,
                      children: [
                        Textfildwithupper(
                            onChanged: (value) {
                              if (value.isNotEmpty) {
                                controller.updateFieldError("father", false);
                              }
                            },
                            isError: controller.IsFatherError,
                            isRequired: true,
                            width:
                                screenWidth >= 600 ? 250 : (screenWidth) - 70,
                            controller: fatherName,
                            Uptext: "Father Name".tr,
                            hinttext: "Father Name".tr),
                        Textfildwithupper(
                            onChanged: (value) {
                              if (value.isNotEmpty) {
                                controller.updateFieldError("mother", false);
                              }
                            },
                            isError: controller.IsMotherError,
                            isRequired: true,
                            width:
                                screenWidth >= 600 ? 250 : (screenWidth) - 70,
                            controller: motherName,
                            Uptext: "Mother Name".tr,
                            hinttext: "Mother Name".tr)
                      ],
                    ),
                    Wrap(
                      spacing: 20.0,
                      crossAxisAlignment: WrapCrossAlignment.center,
                      runSpacing: 2.0,
                      runAlignment: WrapAlignment.center,
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
                            width:
                                screenWidth >= 600 ? 250 : (screenWidth) - 70,
                            controller: phoneNumper,
                            Uptext: "Phone Number".tr,
                            hinttext: "Phone Number".tr),
                        BirthDate(
                          isError: controller.IsBirthError,
                          isRequired: true,
                          Uptext: "Birthdate".tr,
                          width: screenWidth >= 600 ? 250 : (screenWidth) - 70,
                        )
                      ],
                    ),
                    Wrap(
                      spacing: 20.0,
                      crossAxisAlignment: WrapCrossAlignment.center,
                      runSpacing: 2.0,
                      runAlignment: WrapAlignment.center,
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
                            width:
                                screenWidth >= 600 ? 250 : (screenWidth) - 70,
                            controller: emergencyNumber,
                            Uptext: "Emergency Number".tr,
                            hinttext: "Emergency Number".tr),
                        JoinDate(
                          isError: controller.IsJoinError,
                          isRequired: true,
                          Uptext: "Join Date".tr,
                          width: screenWidth >= 600 ? 250 : (screenWidth) - 70,
                        )
                      ],
                    ),
                    Wrap(
                      spacing: 20.0,
                      crossAxisAlignment: WrapCrossAlignment.center,
                      runSpacing: 2.0,
                      runAlignment: WrapAlignment.center,
                      children: [
                        Textfildwithupper(
                            onChanged: (value) {
                              if (value.isNotEmpty) {
                                controller.updateFieldError("address", false);
                              }
                            },
                            isError: controller.IsAddressError,
                            isRequired: true,
                            width:
                                screenWidth >= 600 ? 250 : (screenWidth) - 70,
                            controller: Address,
                            Uptext: "Address".tr,
                            hinttext: "Address".tr),
                        Textfildwithupper(
                            onChanged: (value) {
                              if (value.isNotEmpty) {
                                controller.updateFieldError("caddress", false);
                              }
                            },
                            isError: controller.IsCAddressError,
                            isRequired: true,
                            width:
                                screenWidth >= 600 ? 250 : (screenWidth) - 70,
                            controller: currentAddress,
                            Uptext: "Current Address".tr,
                            hinttext: "Current Address".tr)
                      ],
                    ),
                    Wrap(
                      spacing: 20.0,
                      crossAxisAlignment: WrapCrossAlignment.end,
                      runSpacing: 2.0,
                      runAlignment: WrapAlignment.center,
                      children: [
                        Textfildwithupper(
                            fieldType: "number",
                            width:
                                screenWidth >= 600 ? 250 : (screenWidth) - 70,
                            controller: Salary,
                            Uptext: "Salary".tr,
                            hinttext: "Salary".tr),
                        Dropdownallemployee(
                            title: "Job Title".tr,
                            isError: controller.IsJopError,
                            width:
                                screenWidth >= 600 ? 250 : (screenWidth) - 70,
                            type: "dialogjobTitle")
                      ],
                    ),
                    Wrap(
                      spacing: 20.0,
                      crossAxisAlignment: WrapCrossAlignment.center,
                      runSpacing: 2.0,
                      runAlignment: WrapAlignment.center,
                      children: [
                        Dropdownallemployee(
                            isError: controller.IsGenderError,
                            title: "Gender".tr,
                            width:
                                screenWidth >= 600 ? 250 : (screenWidth) - 70,
                            type: "Gender"),
                        Dropdownallemployee(
                            title: "Family Status".tr,
                            width:
                                screenWidth >= 600 ? 250 : (screenWidth) - 70,
                            isError: controller.IsFamilyError,
                            type: "Family_Status")

                        // Gender
                        // Family_Status
                      ],
                    ),
                    Wrap(
                      spacing: 20.0,
                      crossAxisAlignment: WrapCrossAlignment.center,
                      runSpacing: 2.0,
                      runAlignment: WrapAlignment.center,
                      children: [
                        Padding(
                          padding:
                              const EdgeInsets.only(top: 15.0, bottom: 25.0),
                          child: Text(
                            "Social Media Info".tr,
                            style: Get.theme.textTheme.titleLarge!
                                .copyWith(fontSize: 20),
                          ),
                        )
                      ],
                    ),
                    Wrap(
                      spacing: 20.0,
                      crossAxisAlignment: WrapCrossAlignment.center,
                      runSpacing: 2.0,
                      runAlignment: WrapAlignment.center,
                      children: [
                        Textfildwithupper(
                            width:
                                screenWidth >= 600 ? 250 : (screenWidth) - 70,
                            controller: facebookUrl,
                            Uptext: "Facebook URL".tr,
                            hinttext: "Facebook URL".tr),
                        Textfildwithupper(
                            width:
                                screenWidth >= 600 ? 250 : (screenWidth) - 70,
                            controller: xPlatformUrl,
                            Uptext: "X Platform URL".tr,
                            hinttext: "X Platform URL".tr)
                      ],
                    ),
                    Wrap(
                      spacing: 20.0,
                      crossAxisAlignment: WrapCrossAlignment.center,
                      runSpacing: 2.0,
                      runAlignment: WrapAlignment.center,
                      children: [
                        Textfildwithupper(
                            width:
                                screenWidth >= 600 ? 250 : (screenWidth) - 70,
                            controller: linkedinUrl,
                            Uptext: "Linkedin URL".tr,
                            hinttext: "Linkedin URL".tr),
                        Textfildwithupper(
                            width:
                                screenWidth >= 600 ? 250 : (screenWidth) - 70,
                            controller: instagramUrl,
                            Uptext: "Instagram URL".tr,
                            hinttext: "Instagram URL".tr)
                      ],
                    ),
                    Wrap(
                      spacing: 20.0,
                      crossAxisAlignment: WrapCrossAlignment.center,
                      runSpacing: 2.0,
                      runAlignment: WrapAlignment.center,
                      children: [
                        Padding(
                          padding:
                              const EdgeInsets.only(top: 15.0, bottom: 25.0),
                          child: Text(
                            "Employee Bank Info".tr,
                            style: Get.theme.textTheme.titleLarge!
                                .copyWith(fontSize: 20),
                          ),
                        )
                      ],
                    ),
                    Wrap(
                      spacing: 20.0,
                      crossAxisAlignment: WrapCrossAlignment.center,
                      runSpacing: 2.0,
                      runAlignment: WrapAlignment.center,
                      children: [
                        Textfildwithupper(
                            width:
                                screenWidth >= 600 ? 250 : (screenWidth) - 70,
                            controller: bankAccountTitle,
                            Uptext: "Bank Account Title".tr,
                            hinttext: "Bank Account Title".tr),
                        Textfildwithupper(
                            width:
                                screenWidth >= 600 ? 250 : (screenWidth) - 70,
                            controller: bankName,
                            Uptext: "Bank Name".tr,
                            hinttext: "Bank Name".tr)
                      ],
                    ),
                    Wrap(
                      spacing: 20.0,
                      crossAxisAlignment: WrapCrossAlignment.center,
                      runSpacing: 2.0,
                      runAlignment: WrapAlignment.center,
                      children: [
                        Textfildwithupper(
                            width:
                                screenWidth >= 600 ? 250 : (screenWidth) - 70,
                            controller: bankBranchName,
                            Uptext: "Bank Branch Name".tr,
                            hinttext: "Bank Branch Name".tr),
                        Textfildwithupper(
                            width:
                                screenWidth >= 600 ? 250 : (screenWidth) - 70,
                            controller: bankAccountNumber,
                            Uptext: "Bank Account Number".tr,
                            hinttext: "Bank Account Number".tr)
                      ],
                    ),
                    Wrap(
                      spacing: 20.0,
                      crossAxisAlignment: WrapCrossAlignment.center,
                      runSpacing: 2.0,
                      runAlignment: WrapAlignment.center,
                      children: [
                        Textfildwithupper(
                            width:
                                screenWidth >= 600 ? 250 : (screenWidth) - 70,
                            controller: ifscCode,
                            Uptext: "IFSC Code".tr,
                            hinttext: "IFSC Code".tr),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 15.0, bottom: 25.0),
                      child: Divider(
                        color: Get.theme.primaryColor,
                        height: 1,
                      ),
                    ),
                    Wrap(
                      spacing: 20.0,
                      crossAxisAlignment: WrapCrossAlignment.center,
                      runSpacing: 2.0,
                      runAlignment: WrapAlignment.center,
                      children: [
                        LargeTextField(
                            width:
                                screenWidth >= 590 ? 500 : (screenWidth) - 70,
                            controller: careerHistory,
                            hinttext: "Career History".tr),
                      ],
                    ),
                    Wrap(
                      spacing: 20.0,
                      crossAxisAlignment: WrapCrossAlignment.center,
                      runSpacing: 2.0,
                      runAlignment: WrapAlignment.center,
                      children: [
                        LargeTextField(
                            width:
                                screenWidth >= 590 ? 500 : (screenWidth) - 70,
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
                    Wrap(
                      spacing: 20.0,
                      crossAxisAlignment: WrapCrossAlignment.center,
                      runSpacing: 2.0,
                      runAlignment: WrapAlignment.center,
                      children: [
                        LargeTextField(
                            width:
                                screenWidth >= 590 ? 500 : (screenWidth) - 70,
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
                    Wrap(
                      spacing: 20.0,
                      crossAxisAlignment: WrapCrossAlignment.center,
                      runSpacing: 2.0,
                      runAlignment: WrapAlignment.center,
                      children: [
                        LargeTextField(
                            width:
                                screenWidth >= 590 ? 500 : (screenWidth) - 70,
                            controller: Note,
                            hinttext: "Note".tr),
                      ],
                    ),
                  ],
                ),
              ),
            );
          }),
          apptitle: "Add Employee".tr,
          subtitle: "none");
    });
  }
}
