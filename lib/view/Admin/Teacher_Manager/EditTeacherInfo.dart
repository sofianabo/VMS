import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vms_school/Link/API/API.dart';
import 'package:vms_school/Link/API/AdminAPI/Teacher_APIS/EditTeacherAPI.dart';
import 'package:vms_school/Link/Controller/AdminController/Employee_Controllers/Add_Data_controller.dart';
import 'package:vms_school/Link/Controller/AdminController/Teacher_Controllers/AddTeacherController.dart';
import 'package:vms_school/Link/Controller/AdminController/Teacher_Controllers/AllTeachersController.dart';
import 'package:vms_school/Translate/local_controller.dart';
import 'package:vms_school/widgets/Admin/Admin_Teachers/DropDownAllTeacher.dart';
import 'package:vms_school/widgets/ButtonsDialog.dart';
import 'package:vms_school/widgets/Calender.dart';
import 'package:vms_school/widgets/LargeTextField.dart';
import 'package:vms_school/widgets/TextFildWithUpper.dart';
import 'package:vms_school/widgets/VMSAlertDialog.dart';

class EditTeacherDialog extends StatefulWidget {
  EditTeacherDialog({required this.idx, required this.teacherId, super.key});
  int idx;
  String teacherId;

  @override
  State<EditTeacherDialog> createState() => _EditTeacherDialogState();
}

class _EditTeacherDialogState extends State<EditTeacherDialog> {
  bool notReadOnly = Get.find<Add_Data_controller>().roll != "observer" &&
      Get.find<Add_Data_controller>().roll != "subAdmin" &&
      Get.find<Add_Data_controller>().roll != "supervisor";
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

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
    TextEditingController salary = TextEditingController(
        text: teacherControler.oTeacher!.salary != null
            ? teacherControler.oTeacher!.salary.toString()
            : "0");
    TextEditingController fatherName =
        TextEditingController(text: teacherControler.oTeacher!.fatherName);
    TextEditingController jobTitle =
        TextEditingController(text: teacherControler.oTeacher!.jobTitle!.tr);
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
    TextEditingController bankAccountTitle = TextEditingController(
        text: teacherControler.oTeacher!.bankAccountTitle);
    TextEditingController bankName =
        TextEditingController(text: teacherControler.oTeacher!.bankName);
    TextEditingController bankBranchName =
        TextEditingController(text: teacherControler.oTeacher!.bankBranchName);
    TextEditingController bankAccountNumber = TextEditingController(
        text: teacherControler.oTeacher!.bankAccountNumber);
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
    return GetBuilder<Allteachercontroller>(builder: (control) {
      control.Joindate.value = DateTime.parse(
          Get.find<Allteachercontroller>().oTeacher!.joinDate.toString());
      control.Birthdate.value = DateTime.parse(
          Get.find<Allteachercontroller>().oTeacher!.birthDate.toString());
      return Directionality(
        textDirection: Get.find<LocalizationController>()
                    .currentLocale
                    .value
                    .languageCode ==
                'ar'
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
                      spacing: 5,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Container(
                          width: 520,
                          child: Wrap(
                            spacing: 10.0,
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
                                        if (notReadOnly) {
                                          if (Get.find<Add_Data_controller>()
                                                  .roll !=
                                              "subAdmin") {
                                            await addcontrol.pickImage(context);
                                          }
                                        }
                                      },
                                      child: CircleAvatar(
                                        maxRadius: 100,
                                        backgroundColor:
                                            const Color(0xffC4C4C4),
                                        backgroundImage: addcontrol
                                                    .selectedImage.value !=
                                                null
                                            ? MemoryImage(
                                                addcontrol.selectedImage.value!)
                                            : teacherControler
                                                        .filteredTeacher![
                                                            widget.idx]
                                                        .imageId !=
                                                    null
                                                ? NetworkImage(getimage +
                                                    "${teacherControler.filteredTeacher![widget.idx].imageId}")
                                                : null,
                                        child: addcontrol.selectedImage.value ==
                                                    null &&
                                                teacherControler
                                                        .filteredTeacher![
                                                            widget.idx]
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
                                spacing: 10,
                                children: [
                                  Textfildwithupper(
                                      enabled: notReadOnly,
                                      onChanged: (value) {
                                        if (value.isNotEmpty) {
                                          control.updateFieldError(
                                              "first", false);
                                        }
                                      },
                                      isRequired: true,
                                      isError: control.ISfirstNameError,
                                      width: screenWidth >= 600
                                          ? 250
                                          : (screenWidth) - 70,
                                      controller: firstName,
                                      Uptext: "First Name".tr,
                                      hinttext: "First Name".tr),
                                  Padding(
                                    padding: const EdgeInsets.only(top: 2.0),
                                    child: Textfildwithupper(
                                        enabled: notReadOnly,
                                        onChanged: (value) {
                                          if (value.isNotEmpty) {
                                            control.updateFieldError(
                                                "last", false);
                                          }
                                        },
                                        isError: control.ISlastNameError,
                                        isRequired: true,
                                        width: screenWidth >= 600
                                            ? 250
                                            : (screenWidth) - 70,
                                        controller: lastName,
                                        Uptext: "Last Name".tr,
                                        hinttext: "Last Name".tr),
                                  ),
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
                                onChanged: (value) {
                                  if (value.isNotEmpty) {
                                    control.updateFieldError("father", false);
                                  }
                                },
                                isError: control.IsFatherError,
                                isRequired: true,
                                width: screenWidth >= 600
                                    ? 250
                                    : (screenWidth) - 70,
                                controller: fatherName,
                                Uptext: "Father Name".tr,
                                hinttext: "Father Name".tr),
                            Textfildwithupper(
                                enabled: notReadOnly,
                                onChanged: (value) {
                                  if (value.isNotEmpty) {
                                    control.updateFieldError("mother", false);
                                  }
                                },
                                isError: control.IsMotherError,
                                isRequired: true,
                                width: screenWidth >= 600
                                    ? 250
                                    : (screenWidth) - 70,
                                controller: motherName,
                                Uptext: "Mother Name".tr,
                                hinttext: "Mother Name".tr)
                          ],
                        ),
                        Wrap(
                          spacing: 10.0,
                          crossAxisAlignment: WrapCrossAlignment.start,
                          runSpacing: 2.0,
                          runAlignment: WrapAlignment.center,
                          children: [
                            Textfildwithupper(
                                enabled: notReadOnly,
                                width: screenWidth >= 600
                                    ? 250
                                    : (screenWidth) - 70,
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
                            EditBirthDateTeacher(
                              Uptext: "Birthdate".tr,
                              isRequired: true,
                              width:
                                  screenWidth >= 600 ? 250 : (screenWidth) - 70,
                            )
                          ],
                        ),
                        Wrap(
                          spacing: 10.0,
                          crossAxisAlignment: WrapCrossAlignment.start,
                          runSpacing: 2.0,
                          runAlignment: WrapAlignment.center,
                          children: [
                            Textfildwithupper(
                                enabled: notReadOnly,
                                width: screenWidth >= 600
                                    ? 250
                                    : (screenWidth) - 70,
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
                            EditJoinDateTeacher(
                              Uptext: "Join Date".tr,
                              isRequired: true,
                              width:
                                  screenWidth >= 600 ? 250 : (screenWidth) - 70,
                            )
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 22.0),
                          child: Wrap(
                            spacing: 10.0,
                            crossAxisAlignment: WrapCrossAlignment.center,
                            runSpacing: 2.0,
                            runAlignment: WrapAlignment.center,
                            children: [
                              Textfildwithupper(
                                  enabled: notReadOnly,
                                  width: screenWidth >= 600
                                      ? 250
                                      : (screenWidth) - 70,
                                  onChanged: (value) {
                                    if (value.isNotEmpty) {
                                      control.updateFieldError(
                                          "address", false);
                                    }
                                  },
                                  isError: control.IsAddressError,
                                  isRequired: true,
                                  controller: address,
                                  Uptext: "Address".tr,
                                  hinttext: "Address".tr),
                              Textfildwithupper(
                                  enabled: notReadOnly,
                                  width: screenWidth >= 600
                                      ? 250
                                      : (screenWidth) - 70,
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
                                  hinttext: "Current Address".tr)
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
                                isRequired: true,
                                isError: control.ISemailError,
                                fieldType: "email",
                                enabled: notReadOnly,
                                readOnly: !notReadOnly,
                                width: screenWidth >= 600
                                    ? 250
                                    : (screenWidth) - 70,
                                controller: email,
                                Uptext: "Email".tr,
                                hinttext: "Email".tr),
                            Textfildwithupper(
                                enabled: notReadOnly,
                                readOnly: true,
                                width: screenWidth >= 600
                                    ? 250
                                    : (screenWidth) - 70,
                                controller: username,
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
                                width: screenWidth >= 600
                                    ? 250
                                    : (screenWidth) - 70,
                                controller: salary,
                                Uptext: "Salary".tr,
                                hinttext: "Salary".tr),
                            Textfildwithupper(
                                enabled: notReadOnly,
                                isRequired: true,
                                readOnly: true,
                                width: screenWidth >= 600
                                    ? 250
                                    : (screenWidth) - 70,
                                controller: jobTitle,
                                Uptext: "Job Title".tr,
                                hinttext: "Job Title".tr)
                          ],
                        ),
                        //ddddddddddddd
                        Wrap(
                          spacing: 10.0,
                          crossAxisAlignment: WrapCrossAlignment.center,
                          runSpacing: 2.0,
                          runAlignment: WrapAlignment.center,
                          children: [
                            Dropdownallteacher(
                              isDisabled: !notReadOnly,
                              title: "Gender".tr,
                              type: "GenderDialog",
                              width:
                                  screenWidth >= 600 ? 250 : (screenWidth) - 70,
                            ),
                            Dropdownallteacher(
                              isDisabled: !notReadOnly,
                              title: "Family Status".tr,
                              type: "FamilyStatusDialog",
                              width:
                                  screenWidth >= 600 ? 250 : (screenWidth) - 70,
                            )
                          ],
                        ),
                        Wrap(
                          spacing: 10.0,
                          crossAxisAlignment: WrapCrossAlignment.start,
                          runSpacing: 2.0,
                          runAlignment: WrapAlignment.center,
                          children: [
                            Dropdownallteacher(
                              isDisabled: !notReadOnly,
                              title: "Contract Type".tr,
                              type: "ContractTypeDialog",
                              width:
                                  screenWidth >= 600 ? 250 : (screenWidth) - 70,
                            ),
                            Container(
                              width:
                                  screenWidth >= 600 ? 250 : (screenWidth) - 70,
                              child: Obx(() => ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                        shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(5))),
                                        backgroundColor:
                                            control.isPendAccount.value
                                                ? Get.theme.primaryColor
                                                : Get.theme.disabledColor),
                                    onPressed: () {
                                      if (notReadOnly) {
                                        if (!control.isPendAccount.value) {
                                          Get.defaultDialog(
                                            radius: 5,
                                            contentPadding:
                                                EdgeInsets.all(20.0),
                                            title: "Pend Account".tr,
                                            middleText:
                                                "Do You Want To Pend Account"
                                                        .tr +
                                                    "  (${control.oTeacher?.firstName} ${control.oTeacher?.lastName})",
                                            confirm: ElevatedButton(
                                              onPressed: () {
                                                control.togglePindTeacher(true);
                                                Get.back();
                                              },
                                              child: Text("Yes".tr),
                                              style: ElevatedButton.styleFrom(
                                                  backgroundColor:
                                                      Color(0xffB03D3D),
                                                  foregroundColor:
                                                      Colors.white),
                                            ),
                                            cancel: ElevatedButton(
                                              onPressed: () {
                                                Get.back();
                                              },
                                              child: Text("No".tr),
                                              style: ElevatedButton.styleFrom(
                                                  backgroundColor:
                                                      Get.theme.primaryColor,
                                                  foregroundColor:
                                                      Colors.white),
                                            ),
                                          );
                                        } else {
                                          Get.defaultDialog(
                                            title: "UnPend Account".tr,
                                            radius: 5,
                                            contentPadding:
                                                EdgeInsets.all(20.0),
                                            middleText:
                                                "Do You Want To UnPend Account"
                                                        .tr +
                                                    "  ( ${control.oTeacher?.firstName} ${control.oTeacher?.lastName} )",
                                            confirm: ElevatedButton(
                                              onPressed: () {
                                                control
                                                    .togglePindTeacher(false);
                                                Get.back();
                                              },
                                              child: Text("Yes".tr),
                                              style: ElevatedButton.styleFrom(
                                                  backgroundColor:
                                                      Color(0xffB03D3D),
                                                  foregroundColor:
                                                      Colors.white),
                                            ),
                                            cancel: ElevatedButton(
                                              onPressed: () {
                                                Get.back();
                                              },
                                              child: Text("No".tr),
                                              style: ElevatedButton.styleFrom(
                                                  backgroundColor:
                                                      Get.theme.primaryColor,
                                                  foregroundColor:
                                                      Colors.white),
                                            ),
                                          );
                                        }
                                      }
                                    },
                                    child: Row(
                                      children: [
                                        Icon(
                                            color: Colors.white,
                                            control.isPendAccount.value
                                                ? Icons.lock_open_outlined
                                                : Icons.lock),
                                        Padding(
                                          padding: const EdgeInsets.only(
                                              left: 8.0,
                                              right: 8.0,
                                              top: 10,
                                              bottom: 10),
                                          child: Text(
                                            control.isPendAccount.value
                                                ? "UnPend This Account".tr
                                                : "Pend Account".tr,
                                            style:
                                                TextStyle(color: Colors.white),
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
                              style: Theme.of(context)
                                  .textTheme
                                  .titleLarge!
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
                                width: screenWidth >= 600
                                    ? 250
                                    : (screenWidth) - 70,
                                controller: facebook,
                                Uptext: "Facebook URL".tr,
                                hinttext: "Facebook URL".tr),
                            Textfildwithupper(
                                enabled: notReadOnly,
                                width: screenWidth >= 600
                                    ? 250
                                    : (screenWidth) - 70,
                                controller: x,
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
                                width: screenWidth >= 600
                                    ? 250
                                    : (screenWidth) - 70,
                                controller: linkedin,
                                Uptext: "Linkedin URL".tr,
                                hinttext: "Linkedin URL".tr),
                            Textfildwithupper(
                                enabled: notReadOnly,
                                width: screenWidth >= 600
                                    ? 250
                                    : (screenWidth) - 70,
                                controller: insta,
                                Uptext: "Instagram URL".tr,
                                hinttext: "Instagram URL".tr)
                          ],
                        ),
                        Row(
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
                        Wrap(
                          spacing: 10.0,
                          crossAxisAlignment: WrapCrossAlignment.center,
                          runSpacing: 2.0,
                          runAlignment: WrapAlignment.center,
                          children: [
                            Textfildwithupper(
                                enabled: notReadOnly,
                                width: screenWidth >= 600
                                    ? 250
                                    : (screenWidth) - 70,
                                controller: bankAccountTitle,
                                Uptext: "Bank Account Title".tr,
                                hinttext: "Bank Account Title".tr),
                            Textfildwithupper(
                                enabled: notReadOnly,
                                width: screenWidth >= 600
                                    ? 250
                                    : (screenWidth) - 70,
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
                                width: screenWidth >= 600
                                    ? 250
                                    : (screenWidth) - 70,
                                controller: bankBranchName,
                                Uptext: "Bank Branch Name".tr,
                                hinttext: "Bank Branch Name".tr),
                            Textfildwithupper(
                                enabled: notReadOnly,
                                width: screenWidth >= 600
                                    ? 250
                                    : (screenWidth) - 70,
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
                                width: screenWidth >= 600
                                    ? 250
                                    : (screenWidth) - 70,
                                controller: ifsc,
                                Uptext: "IFSC Code".tr,
                                hinttext: "IFSC Code".tr),
                          ],
                        ),
                        Divider(
                          color: Theme.of(context).primaryColor,
                          height: 1,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            LargeTextField(
                                readOnly: !notReadOnly,
                                width: screenWidth >= 590
                                    ? 500
                                    : (screenWidth) - 70,
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
                                onChanged: (value) {
                                  if (value.isNotEmpty) {
                                    control.updateFieldError(
                                        "qualification", false);
                                  }
                                },
                                isError: control.IsQualificationError,
                                isRequired: true,
                                width: screenWidth >= 590
                                    ? 500
                                    : (screenWidth) - 70,
                                controller: qualification,
                                hinttext: "Qualification".tr),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            LargeTextField(
                                readOnly: !notReadOnly,
                                onChanged: (value) {
                                  if (value.isNotEmpty) {
                                    control.updateFieldError("exp", false);
                                  }
                                },
                                width: screenWidth >= 590
                                    ? 500
                                    : (screenWidth) - 70,
                                isError: control.IsExperinceError,
                                isRequired: true,
                                controller: experience,
                                hinttext: "Experience".tr),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            LargeTextField(
                                readOnly: !notReadOnly,
                                width: screenWidth >= 590
                                    ? 500
                                    : (screenWidth) - 70,
                                controller: note,
                                hinttext: "Note".tr),
                          ],
                        ),
                      ],
                    ),
                  ),
                );
              }),
              apptitle: "Edit Teacher".tr,
              subtitle: "none",
              action: [
                if (notReadOnly)
                  ButtonDialog(
                      text: "Edit Teacher".tr,
                      onPressed: () async {
                        bool isGenderEmpty =
                            control.genderDialogIndex.isEmpty ||
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
                        bool isEmailEmpty = email.text.trim().isEmpty;

                        RegExp emailRegex = RegExp(
                            r"^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$");
                        bool isEmailValid = emailRegex.hasMatch(email.text);

                        control.updateFieldError(
                            "email", isEmailEmpty || !isEmailValid);
                        control.updateFieldError("first", isfirstEmpty);
                        control.updateFieldError("last", islastnameEmpty);
                        control.updateFieldError("father", isfatherEmpty);
                        control.updateFieldError("mother", ismotherEmpty);
                        control.updateFieldError("birth", isBirthEmpty);
                        control.updateFieldError("phone", isphoneEmpty);
                        control.updateFieldError("emgn", isemgnEmpty);
                        control.updateFieldError("join", isjoinEmpty);
                        control.updateFieldError("address", isaddressEmpty);
                        control.updateFieldError(
                            "caddress", isCurrentAdressEmpty);
                        control.updateFieldError("gender", isGenderEmpty);
                        control.updateFieldError("family", isFamilyEmpty);
                        control.updateFieldError("qualification", isQualEmpty);
                        control.updateFieldError("exp", isExpEmpty);
                        control.updateFieldError(
                            "contract", iscontractTypeEmpty);
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
                            employeeId: widget.teacherId,
                            selectedImage: Get.find<Addteachercontroller>()
                                .selectedImage
                                .value,
                            First_Name: firstName.text,
                            Last_Name: lastName.text,
                            Father_Name: fatherName.text,
                            Mother_Name: motherName.text,
                            Phone_Numper: phoneNumber.text,
                            Birth_Date:
                                control.Birthdate.value.toString() ?? "",
                            Emergency_Number: emergency.text,
                            Join_Date: control.Joindate.value.toString() ?? "",
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
                            email: email.text,
                            pend: control.isPendAccount.value,
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
    });
  }
}
