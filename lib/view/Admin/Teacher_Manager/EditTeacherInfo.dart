import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vms_school/Link/API/API.dart';
import 'package:vms_school/Link/API/AdminAPI/Teacher_APIS/EditTeacherAPI.dart';
import 'package:vms_school/Link/Controller/AdminController/Employee_Controllers/Add_Data_controller.dart';
import 'package:vms_school/Link/Controller/AdminController/Teacher_Controllers/AddTeacherController.dart';
import 'package:vms_school/Link/Controller/AdminController/Teacher_Controllers/AllTeachersController.dart';
import 'package:vms_school/Translate/local_controller.dart';
import 'package:vms_school/main.dart';
import 'package:vms_school/widgets/Admin_teachers/DropDownAllTeacher.dart';
import 'package:vms_school/widgets/ButtonsDialog.dart';
import 'package:vms_school/widgets/Calender.dart';
import 'package:vms_school/widgets/LargeTextField.dart';
import 'package:vms_school/widgets/TextFildWithUpper.dart';
import 'package:vms_school/widgets/VMSAlertDialog.dart';

EditTeacherDialog(BuildContext context, int idx, String teacherId) {
  final teacherControler = Get.find<Allteachercontroller>();
  TextEditingController firstName =
      TextEditingController(text: teacherControler.oTeacher!.firstName);
  TextEditingController lastName =
      TextEditingController(text: teacherControler.oTeacher!.lastName);
  TextEditingController phoneNumber =
      TextEditingController(text: teacherControler.oTeacher!.phone);
  TextEditingController address =
      TextEditingController(text: teacherControler.oTeacher!.address);
  TextEditingController emergency =
      TextEditingController(text: teacherControler.oTeacher!.emergencyNumber);
  TextEditingController email =
      TextEditingController(text: teacherControler.oTeacher!.email);
  TextEditingController currentAddress =
      TextEditingController(text: teacherControler.oTeacher!.currentAddress);
  TextEditingController username =
      TextEditingController(text: teacherControler.oTeacher!.userName);
  TextEditingController salary =
      TextEditingController(text: teacherControler.oTeacher!.salary.toString());
  TextEditingController fatherName =
      TextEditingController(text: teacherControler.oTeacher!.fatherName);
  TextEditingController jobTitle =
      TextEditingController(text: teacherControler.oTeacher!.jobTitle);
  TextEditingController facebook =
      TextEditingController(text: teacherControler.oTeacher!.facebookUrl);
  TextEditingController motherName =
      TextEditingController(text: teacherControler.oTeacher!.motherName);
  TextEditingController x =
      TextEditingController(text: teacherControler.oTeacher!.twitterUrl);
  TextEditingController linkedin =
      TextEditingController(text: teacherControler.oTeacher!.lenkedinUrl);
  TextEditingController insta =
      TextEditingController(text: teacherControler.oTeacher!.instagramUrl);
  TextEditingController bankAccountTitle =
      TextEditingController(text: teacherControler.oTeacher!.bankAccountTitle);
  TextEditingController bankName =
      TextEditingController(text: teacherControler.oTeacher!.bankName);
  TextEditingController bankBranchName =
      TextEditingController(text: teacherControler.oTeacher!.bankBranchName);
  TextEditingController bankAccountNumber =
      TextEditingController(text: teacherControler.oTeacher!.bankAccountNumber);
  TextEditingController ifsc =
      TextEditingController(text: teacherControler.oTeacher!.iFSCCode);
  TextEditingController careerHistory =
      TextEditingController(text: teacherControler.oTeacher!.careerHistory);
  TextEditingController qualification =
      TextEditingController(text: teacherControler.oTeacher!.qualification);
  TextEditingController experience =
      TextEditingController(text: teacherControler.oTeacher!.experience);
  TextEditingController note =
      TextEditingController(text: teacherControler.oTeacher!.note);
  Get.find<Allteachercontroller>().resetError();

  return Get.dialog(barrierDismissible: false,
      GetBuilder<Allteachercontroller>(builder: (control) {
    control.Joindate.value = DateTime.parse(
        Get.find<Allteachercontroller>().oTeacher!.joinDate.toString());
    control.Birthdate.value = DateTime.parse(
        Get.find<Allteachercontroller>().oTeacher!.birthDate.toString());
    return Directionality(
      textDirection: prefs!.getString(languageKey) == "ar"
          ? TextDirection.rtl
          : TextDirection.ltr,
      child: GetBuilder<Allteachercontroller>(builder: (control) {
        control.Joindate.value = DateTime.parse(
            Get.find<Allteachercontroller>().oTeacher!.joinDate.toString());
        control.Birthdate.value = DateTime.parse(
            Get.find<Allteachercontroller>().oTeacher!.birthDate.toString());

        return VMSAlertDialog(
            contents: GetBuilder<Addteachercontroller>(builder: (addcontrol) {
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
                                      await addcontrol.pickImage(context);
                                    }
                                  },
                                  child: CircleAvatar(
                                    maxRadius: 100,
                                    backgroundColor: const Color(0xffC4C4C4),
                                    backgroundImage: addcontrol
                                                .selectedImage.value !=
                                            null
                                        ? MemoryImage(
                                            addcontrol.selectedImage.value!)
                                        : teacherControler.filteredTeacher![idx]
                                                    .imageId !=
                                                null
                                            ? NetworkImage(getimage +
                                                "${teacherControler.filteredTeacher![idx].imageId}")
                                            : null,
                                    child: addcontrol.selectedImage.value ==
                                                null &&
                                            teacherControler
                                                    .filteredTeacher![idx]
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
                                  onChanged: (value) {
                                    if (value.isNotEmpty) {
                                      control.updateFieldError("first", false);
                                    }
                                  },
                                  isRequired: true,
                                  isError: control.ISfirstNameError,
                                  width: 250,
                                  controller: firstName,
                                  Uptext: "First Name".tr,
                                  hinttext: "First Name".tr),
                              Padding(
                                padding: const EdgeInsets.only(top: 22.0),
                                child: Textfildwithupper(
                                    onChanged: (value) {
                                      if (value.isNotEmpty) {
                                        control.updateFieldError("last", false);
                                      }
                                    },
                                    isError: control.ISlastNameError,
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
                                    control.updateFieldError("father", false);
                                  }
                                },
                                isError: control.IsFatherError,
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
                                      control.updateFieldError("mother", false);
                                    }
                                  },
                                  isError: control.IsMotherError,
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
                                width: 250,
                                onChanged: (value) {
                                  if (value.isNotEmpty) {
                                    control.updateFieldError("phone", false);
                                  }
                                },
                                isError: control.ISphoneError,
                                isRequired: true,
                                fieldType: "phone",
                                controller: phoneNumber,
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
                                child: EditBirthDateTeacher(
                                  Uptext: "Birthdate".tr,
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
                                onChanged: (value) {
                                  if (value.isNotEmpty) {
                                    control.updateFieldError("emgn", false);
                                  }
                                },
                                isError: control.IsEmergencyError,
                                isRequired: true,
                                controller: emergency,
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
                                child: EditJoinDateTeacher(
                                  Uptext: "Join Date".tr,
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
                                onChanged: (value) {
                                  if (value.isNotEmpty) {
                                    control.updateFieldError("address", false);
                                  }
                                },
                                isError: control.IsAddressError,
                                isRequired: true,
                                controller: address,
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
                                      control.updateFieldError(
                                          "caddress", false);
                                    }
                                  },
                                  isError: control.IsCurrentAddressError,
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
                                controller: email,
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
                                  controller: username,
                                  Uptext: "Username".tr,
                                  hinttext: "Username".tr),
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
                                controller: salary,
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
                              child: Textfildwithupper(
                                  isRequired: true,
                                  readOnly: true,
                                  width: 250,
                                  controller: jobTitle,
                                  Uptext: "Job Title".tr,
                                  hinttext: "Job Title".tr),
                            )
                          ],
                        ),
                      ),
                      //ddddddddddddd
                      Padding(
                        padding: const EdgeInsets.only(top: 22.0),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Dropdownallteacher(
                              title: "Gender".tr,
                              type: "GenderDialog",
                              width: 250,
                            ),
                            Padding(
                              padding: EdgeInsets.only(
                                  left: prefs!.getString(languageKey) == "ar"
                                      ? 0
                                      : 20.0,
                                  right: prefs!.getString(languageKey) == "ar"
                                      ? 20
                                      : 0),
                              child: Dropdownallteacher(
                                title: "Family Status".tr,
                                type: "FamilyStatusDialog",
                                width: 250,
                              ),
                            )
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 22.0),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Dropdownallteacher(
                              title: "Contract Type".tr,
                              type: "ContractTypeDialog",
                              width: 250,
                            ),
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
                              style: Theme.of(context)
                                  .textTheme
                                  .titleLarge!
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
                                controller: facebook,
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
                                  controller: x,
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
                                controller: linkedin,
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
                                  controller: insta,
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
                              "Teacher Bank Info".tr,
                              style: Theme.of(context)
                                  .textTheme
                                  .titleLarge!
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
                                controller: ifsc,
                                Uptext: "IFSC Code".tr,
                                hinttext: "IFSC Code".tr),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 22.0),
                        child: Divider(
                          color: Theme.of(context).primaryColor,
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
                                    control.updateFieldError(
                                        "qualification", false);
                                  }
                                },
                                isError: control.IsQualificationError,
                                isRequired: true,
                                controller: qualification,
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
                                    control.updateFieldError("exp", false);
                                  }
                                },
                                isError: control.IsExperinceError,
                                isRequired: true,
                                controller: experience,
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
                            LargeTextField(
                                controller: note, hinttext: "Note".tr),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              );
            }),
            apptitle: "Edit Teacher".tr,
            subtitle: "none",
            action: [
              ButtonDialog(
                  text: "Edit Teacher".tr,
                  onPressed: () async {
                    bool isGenderEmpty = control.genderDialogIndex.isEmpty ||
                        control.genderDialogIndex == "";
                    bool iscontractTypeEmpty =
                        control.contractTypeDialogIndex.isEmpty ||
                            control.contractTypeDialogIndex == "";
                    bool isFamilyEmpty =
                        control.familyStatusDialogIndex.isEmpty ||
                            control.familyStatusDialogIndex == "";
                    bool isjoinEmpty = control.Joindate.value == null ||
                        control.Joindate.value.toString() == "";
                    bool isBirthEmpty = control.Birthdate.value == null ||
                        control.Birthdate.value.toString() == "";
                    bool isfirstEmpty = firstName.text.trim().isEmpty;
                    bool islastnameEmpty = lastName.text.trim().isEmpty;
                    bool isfatherEmpty = fatherName.text.trim().isEmpty;
                    bool ismotherEmpty = motherName.text.trim().isEmpty;
                    bool isphoneEmpty = phoneNumber.text.trim().isEmpty;
                    bool isemgnEmpty = emergency.text.trim().isEmpty;
                    bool isaddressEmpty = address.text.trim().isEmpty;
                    bool isCurrentAdressEmpty =
                        currentAddress.text.trim().isEmpty;
                    bool isQualEmpty = qualification.text.trim().isEmpty;
                    bool isExpEmpty = experience.text.trim().isEmpty;

                    control.updateFieldError("first", isfirstEmpty);
                    control.updateFieldError("last", islastnameEmpty);
                    control.updateFieldError("father", isfatherEmpty);
                    control.updateFieldError("mother", ismotherEmpty);
                    control.updateFieldError("birth", isBirthEmpty);
                    control.updateFieldError("phone", isphoneEmpty);
                    control.updateFieldError("emgn", isemgnEmpty);
                    control.updateFieldError("join", isjoinEmpty);
                    control.updateFieldError("address", isaddressEmpty);
                    control.updateFieldError("caddress", isCurrentAdressEmpty);
                    control.updateFieldError("gender", isGenderEmpty);
                    control.updateFieldError("family", isFamilyEmpty);
                    control.updateFieldError("qualification", isQualEmpty);
                    control.updateFieldError("exp", isExpEmpty);
                    control.updateFieldError("contract", iscontractTypeEmpty);
                    if (!(iscontractTypeEmpty ||
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
                      await Editteacherapi.Editteacher(
                        employeeId: teacherId,
                        selectedImage: Get.find<Addteachercontroller>()
                            .selectedImage
                            .value,
                        First_Name: firstName.text,
                        Last_Name: lastName.text,
                        Father_Name: fatherName.text,
                        Mother_Name: motherName.text,
                        Phone_Numper: phoneNumber.text,
                        Birth_Date: control.Birthdate.value.toString(),
                        Emergency_Number: emergency.text,
                        Join_Date: control.Joindate.value.toString(),
                        Address: address.text,
                        Current_Address: currentAddress.text,
                        Gender: control.genderDialogIndex,
                        Family_State: control.familyStatusDialogIndex,
                        contractType: control.contractTypeDialogIndex,
                        Facebook_URL: facebook.text,
                        X_Platform_URL: x.text,
                        Linkedin_URL: linkedin.text,
                        Instagram_URL: insta.text,
                        Bank_Account_Title: bankAccountTitle.text,
                        Bank_Name: bankName.text,
                        Bank_Branch_Name: bankBranchName.text,
                        Bank_Account_Number: bankAccountNumber.text,
                        IFSC_Code: ifsc.text,
                        Career_History: careerHistory.text,
                        Qualification: qualification.text,
                        Experience: experience.text,
                        Note: note.text,
                      );
                    }
                  },
                  color: Get.find<Add_Data_controller>().roll == "subAdmin"
                      ? Get.theme.disabledColor
                      : Theme.of(context).primaryColor,
                  width: 140)
            ]);
      }),
    );
  }));
}
