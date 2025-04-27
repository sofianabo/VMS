import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vms_school/Link/API/AdminAPI/Employees_APIs/Add_Employee_Info.dart';
import 'package:vms_school/Link/Controller/AdminController/Employee_Controllers/Add_Data_controller.dart';
import 'package:vms_school/Link/Controller/AdminController/Main_Admin_Controller/Admin_DropDown_Profile_Controller.dart';
import 'package:vms_school/Link/Controller/AdminController/Main_Admin_Controller/Admin_Profile_Content.dart';
import 'package:vms_school/Translate/local_controller.dart';
import 'package:vms_school/widgets/Admin/AdminAllSettings/Button_Has_IconText.dart';
import 'package:vms_school/widgets/Admin/AdminAllSettings/Long_Text_Field.dart';
import 'package:vms_school/widgets/Admin/AdminAllSettings/Profile_DatePicker.dart';
import 'package:vms_school/widgets/Admin/AdminAllSettings/Profile_DropDown.dart';
import 'package:vms_school/widgets/Admin/AdminAllSettings/TextField_Profile.dart';

class Add_Data_account extends StatefulWidget {
  const Add_Data_account({super.key});

  @override
  State<Add_Data_account> createState() => _ProfileState();
}

class _ProfileState extends State<Add_Data_account> {
  var add_Data_controller = Get.put(Add_Data_controller());
  TextEditingController Firstname = TextEditingController();
  TextEditingController Lastname = TextEditingController();
  TextEditingController Mothername = TextEditingController();
  TextEditingController Fathername = TextEditingController();
  TextEditingController phoneNumper = TextEditingController();
  TextEditingController emergencyNumber = TextEditingController();
  TextEditingController Address = TextEditingController();
  TextEditingController currentAddress = TextEditingController();
  TextEditingController careerHistory = TextEditingController();
  TextEditingController Qualification = TextEditingController();
  TextEditingController Experience = TextEditingController();
  TextEditingController Note = TextEditingController();
  TextEditingController facebookUrl = TextEditingController();
  TextEditingController xPlatformUrl = TextEditingController();
  TextEditingController linkedinUrl = TextEditingController();
  TextEditingController instagramUrl = TextEditingController();
  TextEditingController bankAccountTitle = TextEditingController();
  TextEditingController bankName = TextEditingController();
  TextEditingController bankBranchName = TextEditingController();
  TextEditingController bankAccountNumber = TextEditingController();
  TextEditingController ifscCode = TextEditingController();
  TextEditingController newpassword = TextEditingController();
  TextEditingController confnewpassword = TextEditingController();
  bool initialazized = false;
  @override
  void fillControllersWithData() {
    initialazized = true;
    Firstname.text = add_Data_controller.myData?.firstName ?? '';
    Lastname.text = add_Data_controller.myData?.lastName ?? '';
    Mothername.text = add_Data_controller.myData?.motherName ?? '';
    Fathername.text = add_Data_controller.myData?.fatherName ?? '';
    phoneNumper.text = add_Data_controller.myData?.phone ?? '';
    emergencyNumber.text = add_Data_controller.myData?.emergencyNumber ?? '';
    Address.text = add_Data_controller.myData?.address ?? '';
    currentAddress.text = add_Data_controller.myData?.currentAddress ?? '';
    careerHistory.text = add_Data_controller.myData?.careerHistory ?? '';
    Qualification.text = add_Data_controller.myData?.qualification ?? '';
    Experience.text = add_Data_controller.myData?.experience ?? '';
    Note.text = add_Data_controller.myData?.note ?? '';
    facebookUrl.text = add_Data_controller.myData?.facebookUrl ?? '';
    xPlatformUrl.text = add_Data_controller.myData?.twitterUrl ?? '';
    linkedinUrl.text = add_Data_controller.myData?.lenkedinUrl ?? '';
    instagramUrl.text = add_Data_controller.myData?.instagramUrl ?? '';
    bankAccountTitle.text = add_Data_controller.myData?.bankAccountTitle ?? '';
    bankName.text = add_Data_controller.myData?.bankName ?? '';
    bankBranchName.text = add_Data_controller.myData?.bankBranchName ?? '';
    bankAccountNumber.text =
        add_Data_controller.myData?.bankAccountNumber ?? '';
    ifscCode.text = add_Data_controller.myData?.iFSCCode ?? '';
    add_Data_controller.Birthdate.value =
        add_Data_controller.myData?.birthDate != null
            ? DateTime.parse("${add_Data_controller.myData?.birthDate}")
            : null;

    add_Data_controller.Joindate.value =
        add_Data_controller.myData?.joinDate != null
            ? DateTime.parse("${add_Data_controller.myData?.joinDate}")
            : null;

    Get.find<Profile_DropDown_Controller>().Family_StatusIndex =
        add_Data_controller.myData!.familystatus != null
            ? "${add_Data_controller.myData?.familystatus}"
            : "";

    Get.find<Profile_DropDown_Controller>().GenderIndex =
        add_Data_controller.myData!.gender != null
            ? "${add_Data_controller.myData?.gender}"
            : "";
  }

  @override
  Widget build(BuildContext context) {
    return add_Data_controller.isLoading
        ? Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              CircularProgressIndicator(),
            ],
          )
        : Align(
            alignment: Alignment.topCenter,
            child: SingleChildScrollView(
              child: GetBuilder<Admin_Profile_Content>(builder: (controller) {
                if (initialazized == false) {
                  fillControllersWithData();
                }
                return Column(
                  textDirection: Get.find<LocalizationController>()
                              .currentLocale
                              .value
                              .languageCode ==
                          'ar'
                      ? TextDirection.rtl
                      : TextDirection.ltr,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      textDirection: Get.find<LocalizationController>()
                                  .currentLocale
                                  .value
                                  .languageCode ==
                              'ar'
                          ? TextDirection.rtl
                          : TextDirection.ltr,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(
                              top: 25.0, left: 15.0, right: 15.0, bottom: 15.0),
                          child: Text(
                            "Profile".tr,
                            style: TextStyle(fontSize: 18),
                          ),
                        ),
                        Button_Has_IconText(
                          onPressed: () async {
                            await Add_Employee_Information.Add_Employee_Info(
                              First_Name: Firstname.text,
                              Last_Name: Lastname.text,
                              Father_Name: Fathername.text,
                              Mother_Name: Mothername.text,
                              Phone_Numper: phoneNumper.text,
                              Emergency_Number: emergencyNumber.text,
                              Address: Address.text,
                              Current_Address: currentAddress.text,
                              Birth_Date: add_Data_controller.Birthdate.value
                                  .toString(),
                              Gender: Get.find<Profile_DropDown_Controller>()
                                  .selecteGenderIndex,
                              Family_State:
                                  Get.find<Profile_DropDown_Controller>()
                                      .selecteFamily_StatusIndex,
                              Facebook_URL: facebookUrl.text,
                              X_Platform_URL: xPlatformUrl.text,
                              Linkedin_URL: linkedinUrl.text,
                              Instagram_URL: instagramUrl.text,
                              Bank_Account_Title: bankName.text,
                              Bank_Name: bankBranchName.text,
                              Bank_Branch_Name: bankAccountNumber.text,
                              Bank_Account_Number: bankAccountNumber.text,
                              IFSC_Code: ifscCode.text,
                              Career_History: careerHistory.text,
                              Qualification: Qualification.text,
                              Experience: Experience.text,
                              Note: Note.text,
                              Password: newpassword.text,
                              selectedImage:
                                  add_Data_controller.selectedImage.value,
                            );
                          },
                          text: "Save".tr,
                          icon: Icon(
                            Icons.save_outlined,
                            color: Colors.black,
                          ),
                        ),
                      ],
                    ),
                    Container(
                      padding: EdgeInsets.all(15.0),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(15)),
                          border:
                              Border.all(color: Color(0xffF6F6F6), width: 1.5)),
                      child: GetBuilder<Add_Data_controller>(
                          init: Add_Data_controller(),
                          builder: (picController) {
                            return Row(
                              textDirection: Get.find<LocalizationController>()
                                          .currentLocale
                                          .value
                                          .languageCode ==
                                      'ar'
                                  ? TextDirection.rtl
                                  : TextDirection.ltr,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  textDirection:
                                      Get.find<LocalizationController>()
                                                  .currentLocale
                                                  .value
                                                  .languageCode ==
                                              'ar'
                                          ? TextDirection.rtl
                                          : TextDirection.ltr,
                                  children: [
                                    CircleAvatar(
                                      maxRadius: 60,
                                      backgroundColor: const Color(0xffC4C4C4),
                                      child: picController
                                                      .selectedImage.value !=
                                                  null &&
                                              picController.selectedImage.value!
                                                  .isNotEmpty
                                          ? ClipRRect(
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(600)),
                                              child: Image.memory(
                                                width: 120,
                                                height: 120,
                                                picController
                                                    .selectedImage.value!,
                                                fit: BoxFit.cover,
                                              ),
                                            )
                                          : Text(
                                              picController.myData?.firstName
                                                      ?.substring(0, 1)
                                                      .toUpperCase() ??
                                                  'N',
                                              style: Get.textTheme.titleLarge
                                                  ?.copyWith(
                                                color: Get.theme.primaryColor,
                                                fontSize: 26,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          left: 10.0, right: 10.0),
                                      child: Column(
                                        textDirection:
                                            Get.find<LocalizationController>()
                                                        .currentLocale
                                                        .value
                                                        .languageCode ==
                                                    'ar'
                                                ? TextDirection.rtl
                                                : TextDirection.ltr,
                                        spacing: 5.0,
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            "${add_Data_controller.myData?.firstName} ${add_Data_controller.myData?.lastName}",
                                            style: TextStyle(
                                                fontSize: 16,
                                                fontWeight: FontWeight.bold),
                                          ),
                                          Text(
                                              "${add_Data_controller.myData?.userName}",
                                              style: TextStyle(
                                                fontSize: 12,
                                              )),
                                          Row(
                                            textDirection:
                                                Get.find<LocalizationController>()
                                                            .currentLocale
                                                            .value
                                                            .languageCode ==
                                                        'ar'
                                                    ? TextDirection.rtl
                                                    : TextDirection.ltr,
                                            spacing: 5.0,
                                            children: [
                                              Icon(
                                                Icons.add,
                                                size: 14,
                                              ),
                                              Text(
                                                  "${add_Data_controller.myData?.jobTitle}"
                                                      .tr,
                                                  style: TextStyle(
                                                    fontSize: 12,
                                                  )),
                                            ],
                                          ),
                                          Row(
                                            textDirection:
                                                Get.find<LocalizationController>()
                                                            .currentLocale
                                                            .value
                                                            .languageCode ==
                                                        'ar'
                                                    ? TextDirection.rtl
                                                    : TextDirection.ltr,
                                            spacing: 5.0,
                                            children: [
                                              Icon(
                                                Icons.timer,
                                                size: 14,
                                              ),
                                              Text(
                                                  "${add_Data_controller.myData?.contractType}"
                                                      .tr,
                                                  style: TextStyle(
                                                    fontSize: 12,
                                                  )),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                                Column(
                                  spacing: 8.0,
                                  children: [
                                    Button_Has_IconText(
                                      onPressed: () {
                                        add_Data_controller.pickImage(
                                            context, false);
                                      },
                                      text: picController.selectedImage.value ==
                                              null
                                          ? "Add Picture".tr
                                          : "Edit Picture".tr,
                                      icon: Icon(
                                        Icons.edit,
                                        color: Get.theme.secondaryHeaderColor,
                                      ),
                                    ),
                                    if (picController.selectedImage.value !=
                                        null)
                                      Button_Has_IconText(
                                        onPressed: () {
                                          picController.removeimage();
                                        },
                                        text: "Delete Picture".tr,
                                        icon: Icon(
                                          Icons.delete_outline_outlined,
                                          color: Color(0xffB03D3D),
                                        ),
                                      )
                                  ],
                                )
                              ],
                            );
                          }),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 15.0, bottom: 15.0),
                      padding: EdgeInsets.all(15.0),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(15)),
                          border:
                              Border.all(color: Color(0xffF6F6F6), width: 1.5)),
                      child: Column(
                        spacing: 5.0,
                        children: [
                          Row(
                            textDirection: Get.find<LocalizationController>()
                                        .currentLocale
                                        .value
                                        .languageCode ==
                                    'ar'
                                ? TextDirection.rtl
                                : TextDirection.ltr,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Personal Information".tr,
                                style: TextStyle(fontSize: 18),
                              ),
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 15.0),
                            child: Wrap(
                              alignment: WrapAlignment.spaceBetween,
                              runAlignment: WrapAlignment.spaceBetween,
                              runSpacing: 25.0,
                              spacing: 25.0,
                              textDirection: Get.find<LocalizationController>()
                                          .currentLocale
                                          .value
                                          .languageCode ==
                                      'ar'
                                  ? TextDirection.rtl
                                  : TextDirection.ltr,
                              children: [
                                TextField_Profile(
                                  upicon: Icon(
                                    Icons.personal_injury_rounded,
                                    color: Theme.of(context)
                                        .textTheme
                                        .bodySmall!
                                        .color,
                                    size: 20,
                                  ),
                                  controller: Firstname,
                                  Uptext: "First Name".tr,
                                  enabled: true,
                                ),
                                TextField_Profile(
                                  upicon: Icon(
                                    Icons.personal_injury_rounded,
                                    color: Theme.of(context)
                                        .textTheme
                                        .bodySmall!
                                        .color,
                                    size: 20,
                                  ),
                                  controller: Lastname,
                                  Uptext: "Last Name".tr,
                                  enabled: true,
                                ),
                                TextField_Profile(
                                  upicon: Icon(
                                    Icons.boy,
                                    color: Theme.of(context)
                                        .textTheme
                                        .bodySmall!
                                        .color,
                                    size: 20,
                                  ),
                                  controller: Fathername,
                                  Uptext: "Father Name".tr,
                                  enabled: true,
                                ),
                                TextField_Profile(
                                  upicon: Icon(
                                    Icons.girl,
                                    color: Theme.of(context)
                                        .textTheme
                                        .bodySmall!
                                        .color,
                                    size: 20,
                                  ),
                                  controller: Mothername,
                                  Uptext: "Mother Name".tr,
                                  enabled: true,
                                ),
                                TextField_Profile(
                                  upicon: Icon(
                                    Icons.phone_enabled_outlined,
                                    color: Theme.of(context)
                                        .textTheme
                                        .bodySmall!
                                        .color,
                                    size: 20,
                                  ),
                                  controller: phoneNumper,
                                  Uptext: "Phone Number".tr,
                                  enabled: true,
                                ),
                                TextField_Profile(
                                  upicon: Icon(
                                    Icons.sos,
                                    color: Theme.of(context)
                                        .textTheme
                                        .bodySmall!
                                        .color,
                                    size: 20,
                                  ),
                                  enabled: true,
                                  controller: emergencyNumber,
                                  Uptext: "Emergency Number".tr,
                                ),
                                Profile_JoinDate(
                                  upicon: Icon(
                                    Icons.date_range_outlined,
                                    color: Theme.of(context)
                                        .textTheme
                                        .bodySmall!
                                        .color,
                                    size: 20,
                                  ),
                                  enabled: false,
                                  Uptext: "Join Date".tr,
                                  width: 220,
                                ),
                                Profile_BirthDate(
                                  upicon: Icon(
                                    Icons.date_range_rounded,
                                    color: Theme.of(context)
                                        .textTheme
                                        .bodySmall!
                                        .color,
                                    size: 20,
                                  ),
                                  enabled: true,
                                  Uptext: "Birthdate".tr,
                                  width: 220,
                                ),
                                TextField_Profile(
                                  upicon: Icon(
                                    Icons.location_on_outlined,
                                    color: Theme.of(context)
                                        .textTheme
                                        .bodySmall!
                                        .color,
                                    size: 20,
                                  ),
                                  enabled: true,
                                  controller: Address,
                                  Uptext: "Address".tr,
                                ),
                                TextField_Profile(
                                  upicon: Icon(
                                    Icons.my_location_outlined,
                                    color: Theme.of(context)
                                        .textTheme
                                        .bodySmall!
                                        .color,
                                    size: 20,
                                  ),
                                  enabled: true,
                                  controller: currentAddress,
                                  Uptext: "Current Address".tr,
                                ),
                                Profile_DropDown(
                                    upicon: Icon(
                                      Icons.transgender_outlined,
                                      color: Theme.of(context)
                                          .textTheme
                                          .bodySmall!
                                          .color,
                                      size: 20,
                                    ),
                                    labelText: "Gender".tr,
                                    enabled: true,
                                    title: "Gender".tr,
                                    width: 220,
                                    type: "Gender"),
                                Profile_DropDown(
                                    upicon: Icon(
                                      Icons.family_restroom_outlined,
                                      color: Theme.of(context)
                                          .textTheme
                                          .bodySmall!
                                          .color,
                                      size: 20,
                                    ),
                                    labelText: "Family Status".tr,
                                    enabled: true,
                                    title: "Family Status".tr,
                                    width: 220,
                                    type: "Family_Status")
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 15.0),
                      padding: EdgeInsets.all(15.0),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(15)),
                          border:
                              Border.all(color: Color(0xffF6F6F6), width: 1.5)),
                      child: Column(
                        spacing: 5.0,
                        children: [
                          Row(
                            textDirection: Get.find<LocalizationController>()
                                        .currentLocale
                                        .value
                                        .languageCode ==
                                    'ar'
                                ? TextDirection.rtl
                                : TextDirection.ltr,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "More Information".tr,
                                style: TextStyle(fontSize: 18),
                              ),
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 15.0),
                            child: Wrap(
                              alignment: WrapAlignment.spaceBetween,
                              runAlignment: WrapAlignment.spaceBetween,
                              runSpacing: 25.0,
                              spacing: 25.0,
                              textDirection: Get.find<LocalizationController>()
                                          .currentLocale
                                          .value
                                          .languageCode ==
                                      'ar'
                                  ? TextDirection.rtl
                                  : TextDirection.ltr,
                              children: [
                                Long_TextField_Profile(
                                  upicon: Icon(
                                    Icons.food_bank_outlined,
                                    color: Theme.of(context)
                                        .textTheme
                                        .bodySmall!
                                        .color,
                                    size: 20,
                                  ),
                                  enabled: true,
                                  controller: careerHistory,
                                  Uptext: "Career History".tr,
                                ),
                                Long_TextField_Profile(
                                  upicon: Icon(
                                    Icons.comment_bank,
                                    color: Theme.of(context)
                                        .textTheme
                                        .bodySmall!
                                        .color,
                                    size: 20,
                                  ),
                                  controller: Qualification,
                                  Uptext: "Qualification".tr,
                                  enabled: true,
                                ),
                                Long_TextField_Profile(
                                  upicon: Icon(
                                    Icons.branding_watermark_sharp,
                                    color: Theme.of(context)
                                        .textTheme
                                        .bodySmall!
                                        .color,
                                    size: 20,
                                  ),
                                  controller: Experience,
                                  Uptext: "Experience".tr,
                                  enabled: true,
                                ),
                                Long_TextField_Profile(
                                  upicon: Icon(
                                    Icons.numbers_outlined,
                                    color: Theme.of(context)
                                        .textTheme
                                        .bodySmall!
                                        .color,
                                    size: 20,
                                  ),
                                  controller: Note,
                                  Uptext: "Note".tr,
                                  enabled: true,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                          top: 25.0, left: 15.0, right: 15.0, bottom: 15.0),
                      child: Text(
                        "Personal".tr,
                        style: TextStyle(fontSize: 18),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 15.0),
                      padding: EdgeInsets.all(15.0),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(15)),
                          border:
                              Border.all(color: Color(0xffF6F6F6), width: 1.5)),
                      child: Column(
                        spacing: 5.0,
                        children: [
                          Row(
                            textDirection: Get.find<LocalizationController>()
                                        .currentLocale
                                        .value
                                        .languageCode ==
                                    'ar'
                                ? TextDirection.rtl
                                : TextDirection.ltr,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Social Media Info".tr,
                                style: TextStyle(fontSize: 18),
                              ),
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 15.0),
                            child: Wrap(
                              alignment: WrapAlignment.spaceBetween,
                              runAlignment: WrapAlignment.spaceBetween,
                              runSpacing: 25.0,
                              spacing: 25.0,
                              textDirection: Get.find<LocalizationController>()
                                          .currentLocale
                                          .value
                                          .languageCode ==
                                      'ar'
                                  ? TextDirection.rtl
                                  : TextDirection.ltr,
                              children: [
                                TextField_Profile(
                                  upicon: Icon(
                                    Icons.facebook,
                                    color: Theme.of(context)
                                        .textTheme
                                        .bodySmall!
                                        .color,
                                    size: 20,
                                  ),
                                  controller: facebookUrl,
                                  Uptext: "Facebook URL".tr,
                                  enabled: true,
                                ),
                                TextField_Profile(
                                  upicon: Icon(
                                    Icons.facebook,
                                    color: Theme.of(context)
                                        .textTheme
                                        .bodySmall!
                                        .color,
                                    size: 20,
                                  ),
                                  enabled: true,
                                  controller: instagramUrl,
                                  Uptext: "Instagram URL".tr,
                                ),
                                TextField_Profile(
                                  upicon: Icon(
                                    Icons.transfer_within_a_station,
                                    color: Theme.of(context)
                                        .textTheme
                                        .bodySmall!
                                        .color,
                                    size: 20,
                                  ),
                                  controller: xPlatformUrl,
                                  Uptext: "X Platform URL".tr,
                                  enabled: true,
                                ),
                                TextField_Profile(
                                  upicon: Icon(
                                    Icons.linked_camera,
                                    color: Theme.of(context)
                                        .textTheme
                                        .bodySmall!
                                        .color,
                                    size: 20,
                                  ),
                                  controller: linkedinUrl,
                                  Uptext: "Linkedin URL".tr,
                                  enabled: true,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 15.0),
                      padding: EdgeInsets.all(15.0),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(15)),
                          border:
                              Border.all(color: Color(0xffF6F6F6), width: 1.5)),
                      child: Column(
                        spacing: 5.0,
                        children: [
                          Row(
                            textDirection: Get.find<LocalizationController>()
                                        .currentLocale
                                        .value
                                        .languageCode ==
                                    'ar'
                                ? TextDirection.rtl
                                : TextDirection.ltr,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Bank Info".tr,
                                style: TextStyle(fontSize: 18),
                              ),
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 15.0),
                            child: Wrap(
                              alignment: WrapAlignment.spaceBetween,
                              runAlignment: WrapAlignment.spaceBetween,
                              runSpacing: 25.0,
                              spacing: 25.0,
                              textDirection: Get.find<LocalizationController>()
                                          .currentLocale
                                          .value
                                          .languageCode ==
                                      'ar'
                                  ? TextDirection.rtl
                                  : TextDirection.ltr,
                              children: [
                                TextField_Profile(
                                  upicon: Icon(
                                    Icons.food_bank_outlined,
                                    color: Theme.of(context)
                                        .textTheme
                                        .bodySmall!
                                        .color,
                                    size: 20,
                                  ),
                                  enabled: true,
                                  controller: bankName,
                                  Uptext: "Bank Name".tr,
                                ),
                                TextField_Profile(
                                  upicon: Icon(
                                    Icons.comment_bank,
                                    color: Theme.of(context)
                                        .textTheme
                                        .bodySmall!
                                        .color,
                                    size: 20,
                                  ),
                                  controller: bankAccountTitle,
                                  Uptext: "Bank Account Title".tr,
                                  enabled: true,
                                ),
                                TextField_Profile(
                                  upicon: Icon(
                                    Icons.branding_watermark_sharp,
                                    color: Theme.of(context)
                                        .textTheme
                                        .bodySmall!
                                        .color,
                                    size: 20,
                                  ),
                                  controller: bankBranchName,
                                  Uptext: "Bank Branch Name".tr,
                                  enabled: true,
                                ),
                                TextField_Profile(
                                  upicon: Icon(
                                    Icons.numbers_outlined,
                                    color: Theme.of(context)
                                        .textTheme
                                        .bodySmall!
                                        .color,
                                    size: 20,
                                  ),
                                  controller: bankAccountNumber,
                                  Uptext: "Bank Account Number".tr,
                                  enabled: true,
                                ),
                                TextField_Profile(
                                  upicon: Icon(
                                    Icons.confirmation_num_outlined,
                                    color: Theme.of(context)
                                        .textTheme
                                        .bodySmall!
                                        .color,
                                    size: 20,
                                  ),
                                  controller: ifscCode,
                                  Uptext: "IFSC Code",
                                  enabled: true,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 15.0),
                      padding: EdgeInsets.all(15.0),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(15)),
                          border:
                              Border.all(color: Color(0xffF6F6F6), width: 1.5)),
                      child: Column(
                        spacing: 0.0,
                        children: [
                          Row(
                            textDirection: Get.find<LocalizationController>()
                                        .currentLocale
                                        .value
                                        .languageCode ==
                                    'ar'
                                ? TextDirection.rtl
                                : TextDirection.ltr,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Change Password".tr,
                                style: TextStyle(fontSize: 18),
                              ),
                            ],
                          ),
                          Column(
                            mainAxisSize: MainAxisSize.min,
                            textDirection: Get.find<LocalizationController>()
                                        .currentLocale
                                        .value
                                        .languageCode ==
                                    'ar'
                                ? TextDirection.rtl
                                : TextDirection.ltr,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(
                                    top: 15.0, bottom: 15.0),
                                child: Row(
                                  textDirection:
                                      Get.find<LocalizationController>()
                                                  .currentLocale
                                                  .value
                                                  .languageCode ==
                                              'ar'
                                          ? TextDirection.rtl
                                          : TextDirection.ltr,
                                  children: [
                                    TextField_Profile(
                                      upicon: Icon(
                                        Icons.password,
                                        color: Theme.of(context)
                                            .textTheme
                                            .bodySmall!
                                            .color,
                                        size: 20,
                                      ),
                                      controller: newpassword,
                                      Uptext: "New Password".tr,
                                      enabled: true,
                                    ),
                                  ],
                                ),
                              ),
                              Row(
                                textDirection:
                                    Get.find<LocalizationController>()
                                                .currentLocale
                                                .value
                                                .languageCode ==
                                            'ar'
                                        ? TextDirection.rtl
                                        : TextDirection.ltr,
                                children: [
                                  TextField_Profile(
                                    upicon: Icon(
                                      Icons.password_outlined,
                                      color: Theme.of(context)
                                          .textTheme
                                          .bodySmall!
                                          .color,
                                      size: 20,
                                    ),
                                    controller: confnewpassword,
                                    Uptext: "Confirm New Password".tr,
                                    enabled: true,
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                );
              }),
            ),
          );
  }
}

class ProfileImageWithHoverDialog extends StatefulWidget {
  const ProfileImageWithHoverDialog({Key? key}) : super(key: key);

  @override
  State<ProfileImageWithHoverDialog> createState() =>
      _ProfileImageWithHoverDialogState();
}

class _ProfileImageWithHoverDialogState
    extends State<ProfileImageWithHoverDialog> {
  Timer? _hoverTimer;
  bool _isDialogOpen = false;

  void _showImageDialog() {
    if (_isDialogOpen) return;
    _isDialogOpen = true;

    Get.dialog(
      Dialog(
        backgroundColor: Colors.transparent,
        child: GestureDetector(
          onTap: () => _closeDialog(),
          child: Hero(
            tag: 'profileImageHero',
            child: Material(
              color: Colors.transparent,
              child: Center(
                child: AnimatedContainer(
                  duration: const Duration(milliseconds: 500),
                  curve: Curves.fastOutSlowIn,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.5),
                        blurRadius: 20,
                        offset: const Offset(0, 10),
                      ),
                    ],
                  ),
                  child: ClipOval(
                    child: Image.asset(
                      "assets/images/Rectangle66.png",
                      fit: BoxFit.cover,
                      width: 400,
                      height: 400,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
      barrierDismissible: true,
    ).then((_) {
      _isDialogOpen = false;
    });
  }

  void _closeDialog() {
    if (_isDialogOpen) {
      Navigator.of(Get.overlayContext!).pop();
    }
  }

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) {
        _hoverTimer =
            Timer(const Duration(milliseconds: 500), _showImageDialog);
      },
      onExit: (_) {
        _hoverTimer?.cancel();
        _closeDialog();
      },
      child: Hero(
        tag: 'profileImageHero',
        child: CircleAvatar(
          maxRadius: 35,
          child: ClipOval(
            child: Image.asset(
              "assets/images/Rectangle66.png",
              fit: BoxFit.cover,
              width: 70,
              height: 70,
            ),
          ),
        ),
      ),
    );
  }
}
