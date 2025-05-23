import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vms_school/Link/API/API.dart';
import 'package:vms_school/Link/API/AdminAPI/Employees_APIs/Edit_Employee_API.dart';
import 'package:vms_school/Link/Controller/AdminController/Employee_Controllers/Add_Data_controller.dart';
import 'package:vms_school/Link/Controller/AdminController/Employee_Controllers/Add_Full_Employee_Controller.dart';
import 'package:vms_school/Link/Controller/AdminController/Employee_Controllers/AllEmpolyeeController.dart';
import 'package:vms_school/widgets/Admin/Admin_Employee/DropDownAllEmployee.dart';
import 'package:vms_school/widgets/ButtonsDialog.dart';
import 'package:vms_school/widgets/Calender.dart';
import 'package:vms_school/widgets/LargeTextField.dart';
import 'package:vms_school/widgets/TextFildWithUpper.dart';
import 'package:vms_school/widgets/VMSAlertDialog.dart';

class Edit_Employee extends StatefulWidget {
  Edit_Employee({required this.employeeID, super.key});

  String employeeID;
  @override
  State<Edit_Employee> createState() => _Edit_EmployeeState();
}

bool notReadOnly = Get.find<Add_Data_controller>().roll != "observer" &&
    Get.find<Add_Data_controller>().roll != "subAdmin";

class _Edit_EmployeeState extends State<Edit_Employee> {
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    var empolyeecontroller = Get.find<Allempolyeecontroller>();
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
    TextEditingController emergencyNumber = TextEditingController(
        text: empolyeecontroller.employee!.emergencyNumber);
    TextEditingController Address =
        TextEditingController(text: empolyeecontroller.employee!.address);
    TextEditingController currentAddress = TextEditingController(
        text: empolyeecontroller.employee!.currentAddress);
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
    TextEditingController bankBranchName = TextEditingController(
        text: empolyeecontroller.employee!.bankBranchName);
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
    return GetBuilder<Allempolyeecontroller>(builder: (controller) {
      controller.Birthdate.value = DateTime.parse(
          Get.find<Allempolyeecontroller>().employee!.birthDate.toString());
      controller.Joindate.value = DateTime.parse(
          Get.find<Allempolyeecontroller>().employee!.joinDate.toString());

      return VMSAlertDialog(
          action: [
            if (Get.find<Add_Data_controller>().roll != "observer")
              ButtonDialog(
                  text: "Edit Employee".tr,
                  onPressed: () async {
                    bool isEmailEmpty = Email.text.trim().isEmpty;
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

                    RegExp emailRegex = RegExp(
                        r"^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$");
                    bool isEmailValid = emailRegex.hasMatch(Email.text);
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
                    cont.updateFieldError("gender", isGenderEmpty);
                    cont.updateFieldError("family", isFamilyEmpty);
                    cont.updateFieldError("qua", isQualEmpty);
                    cont.updateFieldError(
                        "email", isEmailEmpty || !isEmailValid);
                    cont.updateFieldError("exp", isExpEmpty);

                    if (!(isGenderEmpty ||
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
                      print(controller.isPendAccount.value);
                      await EditEmployeeApi.EditEmployee(
                        employeeId: widget.employeeID,
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
                        email: Email.text,
                        pend: controller.isPendAccount.value,
                      );
                    }
                  },
                  color: Get.find<Add_Data_controller>().roll == "subAdmin"
                      ? Get.theme.disabledColor
                      : Get.theme.primaryColor,
                  width: 140)
          ],
          contents:
              GetBuilder<AddFullEmployeeController>(builder: (controller) {
            return SizedBox(
              width: 520,
              child: SingleChildScrollView(
                child: Column(
                  spacing: 5,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Container(
                      width: 520,
                      child: Wrap(
                        spacing: 10.0,
                        crossAxisAlignment: WrapCrossAlignment.center,
                        runSpacing: 20.0,
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
                                    if (notReadOnly) {
                                      if (Get.find<Add_Data_controller>()
                                              .roll !=
                                          "subAdmin") {
                                        await controller.pickImage(context);
                                      }
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
                                                    .employee!.imageId !=
                                                null
                                            ? NetworkImage(getimage +
                                                "${empolyeecontroller.employee!.imageId}")
                                            : null,
                                    child: controller.selectedImage.value ==
                                                null &&
                                            empolyeecontroller
                                                    .employee!.imageId ==
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
                            spacing: 10,
                            children: [
                              Textfildwithupper(
                                  enabled: notReadOnly,
                                  width: screenWidth >= 600
                                      ? 250
                                      : (screenWidth) - 70,
                                  onChanged: (value) {
                                    if (value.isNotEmpty) {
                                      controller.updateFieldError(
                                          "first", false);
                                    }
                                  },
                                  isRequired: true,
                                  isError: controller.IsFirstError,
                                  controller: firstName,
                                  Uptext: "First Name".tr,
                                  hinttext: "First Name".tr),
                              Textfildwithupper(
                                  enabled: notReadOnly,
                                  width: screenWidth >= 600
                                      ? 250
                                      : (screenWidth) - 70,
                                  onChanged: (value) {
                                    if (value.isNotEmpty) {
                                      controller.updateFieldError(
                                          "last", false);
                                    }
                                  },
                                  isError: controller.IsLastError,
                                  isRequired: true,
                                  controller: lastName,
                                  Uptext: "Last Name".tr,
                                  hinttext: "Last Name".tr),
                            ],
                          )
                        ],
                      ),
                    ),
                    Wrap(
                      spacing: 10.0,
                      crossAxisAlignment: WrapCrossAlignment.center,
                      runSpacing: 2.0,
                      runAlignment: WrapAlignment.center,
                      children: [
                        Textfildwithupper(
                            enabled: notReadOnly,
                            width:
                                screenWidth >= 600 ? 250 : (screenWidth) - 70,
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
                        Textfildwithupper(
                            enabled: notReadOnly,
                            width:
                                screenWidth >= 600 ? 250 : (screenWidth) - 70,
                            onChanged: (value) {
                              if (value.isNotEmpty) {
                                controller.updateFieldError("mother", false);
                              }
                            },
                            isError: controller.IsMotherError,
                            isRequired: true,
                            controller: motherName,
                            Uptext: "Mother Name".tr,
                            hinttext: "Mother Name".tr)
                      ],
                    ),
                    Wrap(
                      spacing: 10.0,
                      crossAxisAlignment: WrapCrossAlignment.center,
                      runSpacing: 2.0,
                      runAlignment: WrapAlignment.center,
                      children: [
                        Textfildwithupper(
                            enabled: notReadOnly,
                            width:
                                screenWidth >= 600 ? 250 : (screenWidth) - 70,
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
                        BirthDate(
                          Uptext: "Birthdate".tr,
                          isError: controller.IsBirthError,
                          isRequired: true,
                          width: screenWidth >= 600 ? 250 : (screenWidth) - 70,
                        )
                      ],
                    ),
                    Wrap(
                      spacing: 10.0,
                      crossAxisAlignment: WrapCrossAlignment.center,
                      runSpacing: 2.0,
                      runAlignment: WrapAlignment.center,
                      children: [
                        Textfildwithupper(
                            enabled: notReadOnly,
                            width:
                                screenWidth >= 600 ? 250 : (screenWidth) - 70,
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
                        JoinDate(
                          isError: controller.IsJoinError,
                          isRequired: true,
                          Uptext: "Join Date".tr,
                          width: screenWidth >= 600 ? 250 : (screenWidth) - 70,
                        )
                      ],
                    ),
                    Wrap(
                      spacing: 10.0,
                      crossAxisAlignment: WrapCrossAlignment.center,
                      runSpacing: 2.0,
                      runAlignment: WrapAlignment.center,
                      children: [
                        Textfildwithupper(
                            enabled: notReadOnly,
                            width:
                                screenWidth >= 600 ? 250 : (screenWidth) - 70,
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
                        Textfildwithupper(
                            enabled: notReadOnly,
                            width:
                                screenWidth >= 600 ? 250 : (screenWidth) - 70,
                            onChanged: (value) {
                              if (value.isNotEmpty) {
                                controller.updateFieldError("caddress", false);
                              }
                            },
                            isError: controller.IsCAddressError,
                            isRequired: true,
                            controller: currentAddress,
                            Uptext: "Current Address".tr,
                            hinttext: "Current Address".tr)
                      ],
                    ),
                    Wrap(
                      spacing: 10.0,
                      crossAxisAlignment: WrapCrossAlignment.center,
                      runSpacing: 2.0,
                      runAlignment: WrapAlignment.center,
                      children: [
                        Textfildwithupper(
                            enabled: notReadOnly,
                            readOnly: !notReadOnly,
                            width:
                                screenWidth >= 600 ? 250 : (screenWidth) - 70,
                            controller: Email,
                            Uptext: "Email".tr,
                            hinttext: "Email".tr),
                        Textfildwithupper(
                            enabled: notReadOnly,
                            readOnly: true,
                            width:
                                screenWidth >= 600 ? 250 : (screenWidth) - 70,
                            controller: Username,
                            Uptext: "Username".tr,
                            hinttext: "Username".tr)
                      ],
                    ),
                    Wrap(
                      spacing: 10.0,
                      crossAxisAlignment: WrapCrossAlignment.center,
                      runSpacing: 2.0,
                      runAlignment: WrapAlignment.center,
                      children: [
                        Textfildwithupper(
                            enabled: notReadOnly,
                            readOnly: true,
                            width:
                                screenWidth >= 600 ? 250 : (screenWidth) - 70,
                            controller: Joptitle,
                            Uptext: "Job Title".tr,
                            hinttext: "Job Title".tr),
                        Textfildwithupper(
                            enabled: notReadOnly,
                            readOnly: true,
                            width:
                                screenWidth >= 600 ? 250 : (screenWidth) - 70,
                            controller: roll,
                            Uptext: "Role".tr,
                            hinttext: "Role".tr)
                      ],
                    ),
                    Wrap(
                      spacing: 10.0,
                      crossAxisAlignment: WrapCrossAlignment.center,
                      runSpacing: 2.0,
                      runAlignment: WrapAlignment.center,
                      children: [
                        Dropdownallemployee(
                            Disabled: !notReadOnly,
                            isError: controller.IsGenderError,
                            title: "Gender".tr,
                            width:
                                screenWidth >= 600 ? 250 : (screenWidth) - 70,
                            type: "Gender"),
                        Dropdownallemployee(
                            Disabled: !notReadOnly,
                            isError: controller.IsFamilyError,
                            title: "Family Status".tr,
                            width:
                                screenWidth >= 600 ? 250 : (screenWidth) - 70,
                            type: "Family_Status")

                        // Gender
                        // Family_Status
                      ],
                    ),
                    Wrap(
                      spacing: 10.0,
                      crossAxisAlignment: WrapCrossAlignment.center,
                      runSpacing: 2.0,
                      runAlignment: WrapAlignment.center,
                      alignment: WrapAlignment.center,
                      children: [
                        Textfildwithupper(
                            enabled: notReadOnly,
                            width:
                                screenWidth >= 600 ? 250 : (screenWidth) - 70,
                            readOnly: true,
                            controller: Salary,
                            Uptext: "Salary".tr,
                            hinttext: "Salary".tr),
                        if (empolyeecontroller.employee!.ispend != null)
                          Container(
                            padding: EdgeInsets.only(top: 5),
                            width:
                                screenWidth >= 600 ? 250 : (screenWidth) - 70,
                            child: Obx(() => ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                      shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(5))),
                                      backgroundColor:
                                          Get.find<Allempolyeecontroller>()
                                                  .isPendAccount
                                                  .value
                                              ? Get.theme.primaryColor
                                              : Get.theme.disabledColor),
                                  onPressed: () {
                                    if (notReadOnly) {
                                      if (!Get.find<Allempolyeecontroller>()
                                          .isPendAccount
                                          .value) {
                                        Get.defaultDialog(
                                          radius: 5,
                                          contentPadding: EdgeInsets.all(20.0),
                                          title: "Pend Account".tr,
                                          middleText: "Do You Want To Pend Account"
                                                  .tr +
                                              "  (${empolyeecontroller.employee?.firstName} ${empolyeecontroller.employee?.lastName})",
                                          confirm: ElevatedButton(
                                            onPressed: () {
                                              Get.find<Allempolyeecontroller>()
                                                  .togglePindTeacher(true);
                                              Get.back();
                                            },
                                            child: Text("Yes".tr),
                                            style: ElevatedButton.styleFrom(
                                                backgroundColor:
                                                    Color(0xffB03D3D),
                                                foregroundColor: Colors.white),
                                          ),
                                          cancel: ElevatedButton(
                                            onPressed: () {
                                              Get.back();
                                            },
                                            child: Text("No".tr),
                                            style: ElevatedButton.styleFrom(
                                                backgroundColor:
                                                    Get.theme.primaryColor,
                                                foregroundColor: Colors.white),
                                          ),
                                        );
                                      } else {
                                        Get.defaultDialog(
                                          title: "UnPend Account".tr,
                                          radius: 5,
                                          contentPadding: EdgeInsets.all(20.0),
                                          middleText:
                                              "Do You Want To UnPend Account"
                                                      .tr +
                                                  "  ( ${empolyeecontroller.employee!.firstName} ${empolyeecontroller.employee!.lastName} )",
                                          confirm: ElevatedButton(
                                            onPressed: () {
                                              Get.find<Allempolyeecontroller>()
                                                  .togglePindTeacher(false);
                                              Get.back();
                                            },
                                            child: Text("Yes".tr),
                                            style: ElevatedButton.styleFrom(
                                                backgroundColor:
                                                    Color(0xffB03D3D),
                                                foregroundColor: Colors.white),
                                          ),
                                          cancel: ElevatedButton(
                                            onPressed: () {
                                              Get.back();
                                            },
                                            child: Text("No".tr),
                                            style: ElevatedButton.styleFrom(
                                                backgroundColor:
                                                    Get.theme.primaryColor,
                                                foregroundColor: Colors.white),
                                          ),
                                        );
                                      }
                                    }
                                  },
                                  child: Row(
                                    children: [
                                      Icon(
                                          color: Colors.white,
                                          Get.find<Allempolyeecontroller>()
                                                  .isPendAccount
                                                  .value
                                              ? Icons.lock_open_outlined
                                              : Icons.lock),
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            left: 8.0,
                                            right: 8.0,
                                            top: 10,
                                            bottom: 10),
                                        child: Text(
                                          Get.find<Allempolyeecontroller>()
                                                  .isPendAccount
                                                  .value
                                              ? "UnPend This Account".tr
                                              : "Pend Account".tr,
                                          style: TextStyle(color: Colors.white),
                                        ),
                                      ),
                                    ],
                                  ),
                                )),
                          ),
                      ],
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(
                          "Social Media Info".tr,
                          style: Get.theme.textTheme.titleLarge!
                              .copyWith(fontSize: 20),
                        )
                      ],
                    ),
                    Wrap(
                      spacing: 10.0,
                      crossAxisAlignment: WrapCrossAlignment.center,
                      runSpacing: 2.0,
                      runAlignment: WrapAlignment.center,
                      children: [
                        Textfildwithupper(
                            enabled: notReadOnly,
                            width:
                                screenWidth >= 600 ? 250 : (screenWidth) - 70,
                            controller: facebookUrl,
                            Uptext: "Facebook URL".tr,
                            hinttext: "Facebook URL".tr),
                        Textfildwithupper(
                            enabled: notReadOnly,
                            width:
                                screenWidth >= 600 ? 250 : (screenWidth) - 70,
                            controller: xPlatformUrl,
                            Uptext: "X Platform URL".tr,
                            hinttext: "X Platform URL".tr)
                      ],
                    ),
                    Wrap(
                      spacing: 10.0,
                      crossAxisAlignment: WrapCrossAlignment.center,
                      runSpacing: 2.0,
                      runAlignment: WrapAlignment.center,
                      children: [
                        Textfildwithupper(
                            enabled: notReadOnly,
                            width:
                                screenWidth >= 600 ? 250 : (screenWidth) - 70,
                            controller: linkedinUrl,
                            Uptext: "Linkedin URL".tr,
                            hinttext: "Linkedin URL".tr),
                        Textfildwithupper(
                            enabled: notReadOnly,
                            width:
                                screenWidth >= 600 ? 250 : (screenWidth) - 70,
                            controller: instagramUrl,
                            Uptext: "Instagram URL".tr,
                            hinttext: "Instagram URL".tr)
                      ],
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(
                          "Employee Bank Info".tr,
                          style: Get.theme.textTheme.titleLarge!
                              .copyWith(fontSize: 20),
                        )
                      ],
                    ),
                    Wrap(
                      spacing: 10.0,
                      crossAxisAlignment: WrapCrossAlignment.center,
                      runSpacing: 2.0,
                      runAlignment: WrapAlignment.center,
                      children: [
                        Textfildwithupper(
                            enabled: notReadOnly,
                            width:
                                screenWidth >= 600 ? 250 : (screenWidth) - 70,
                            controller: bankAccountTitle,
                            Uptext: "Bank Account Title".tr,
                            hinttext: "Bank Account Title".tr),
                        Textfildwithupper(
                            enabled: notReadOnly,
                            width:
                                screenWidth >= 600 ? 250 : (screenWidth) - 70,
                            controller: bankName,
                            Uptext: "Bank Name".tr,
                            hinttext: "Bank Name".tr)
                      ],
                    ),
                    Wrap(
                      spacing: 10.0,
                      crossAxisAlignment: WrapCrossAlignment.center,
                      runSpacing: 2.0,
                      runAlignment: WrapAlignment.center,
                      children: [
                        Textfildwithupper(
                            enabled: notReadOnly,
                            width:
                                screenWidth >= 600 ? 250 : (screenWidth) - 70,
                            controller: bankBranchName,
                            Uptext: "Bank Branch Name".tr,
                            hinttext: "Bank Branch Name".tr),
                        Textfildwithupper(
                            enabled: notReadOnly,
                            width:
                                screenWidth >= 600 ? 250 : (screenWidth) - 70,
                            controller: bankAccountNumber,
                            Uptext: "Bank Account Number".tr,
                            hinttext: "Bank Account Number".tr)
                      ],
                    ),
                    Wrap(
                      spacing: 10.0,
                      crossAxisAlignment: WrapCrossAlignment.center,
                      runSpacing: 2.0,
                      runAlignment: WrapAlignment.center,
                      alignment: WrapAlignment.center,
                      children: [
                        Textfildwithupper(
                            enabled: notReadOnly,
                            width:
                                screenWidth >= 600 ? 250 : (screenWidth) - 70,
                            controller: ifscCode,
                            Uptext: "IFSC Code".tr,
                            hinttext: "IFSC Code".tr),
                      ],
                    ),
                    Divider(
                      color: Get.theme.primaryColor,
                      height: 1,
                    ),
                    Row(
                      children: [
                        LargeTextField(
                            readOnly: !notReadOnly,
                            width:
                                screenWidth >= 590 ? 500 : (screenWidth) - 70,
                            controller: careerHistory,
                            hinttext: "Career History".tr),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        LargeTextField(
                            readOnly: !notReadOnly,
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
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        LargeTextField(
                            readOnly: !notReadOnly,
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
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        LargeTextField(
                            readOnly: !notReadOnly,
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
          apptitle: "Edit Employee".tr,
          subtitle: "none");
    });
  }
}
