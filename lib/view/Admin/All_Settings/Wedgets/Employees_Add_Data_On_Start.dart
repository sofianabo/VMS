import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vms_school/Link/Controller/AdminController/Employee_Controllers/Add_Data_controller.dart';
import 'package:vms_school/Translate/local_controller.dart';
import 'package:vms_school/view/Admin/All_Settings/Wedgets/Long_Text_Field.dart';
import 'package:vms_school/view/Admin/All_Settings/Wedgets/Profile_DatePicker.dart';
import 'package:vms_school/view/Admin/All_Settings/Wedgets/Profile_DropDown.dart';
import 'package:vms_school/view/Admin/All_Settings/Wedgets/TextField_Profile.dart';
import 'package:vms_school/widgets/ButtonsDialog.dart';

class Employees_Add_Data_On_Start extends StatelessWidget {
  Employees_Add_Data_On_Start({super.key});
  final add_Data_controller = Get.put(Add_Data_controller());

  TextEditingController Firstname = TextEditingController(text: "Laith");
  TextEditingController Lastname = TextEditingController(text: "Azzam");
  TextEditingController Mothername = TextEditingController(text: "f");
  TextEditingController Fathername = TextEditingController(text: "s");
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
  @override
  Widget build(BuildContext context) {
    return GetBuilder<Add_Data_controller>(builder: (add_Data_controller) {
      return AlertDialog(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(5))),
        content: Container(
          width: MediaQuery.of(context).size.width / 1.7,
          height: 550,
          child: PageView(
            physics: NeverScrollableScrollPhysics(),
            allowImplicitScrolling: false,
            scrollDirection: Axis.horizontal,
            onPageChanged: (index) {
              add_Data_controller.currentPage.value = index;
            },
            controller: add_Data_controller.pageController,
            children: [
              SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text("Add Your Photo Profile".tr),
                    Padding(
                      padding: const EdgeInsets.only(top: 15.0),
                      child: Center(
                        child: CircleAvatar(
                          radius: 150,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Align(
                      alignment: Alignment.topCenter,
                      child: SingleChildScrollView(
                        child: Column(
                          textDirection: Get.find<LocalizationController>()
                                      .currentLocale
                                      .value
                                      .languageCode ==
                                  'ar'
                              ? TextDirection.rtl
                              : TextDirection.ltr,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              margin: EdgeInsets.only(top: 15.0, bottom: 15.0),
                              padding: EdgeInsets.all(15.0),
                              child: Column(
                                spacing: 5.0,
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
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
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
                                      runSpacing: 25.0,
                                      spacing: 25.0,
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
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SingleChildScrollView(
                child: Column(
                  textDirection: Get.find<LocalizationController>()
                              .currentLocale
                              .value
                              .languageCode ==
                          'ar'
                      ? TextDirection.rtl
                      : TextDirection.ltr,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
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
                  ],
                ),
              ),
              SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Align(
                      alignment: Alignment.topCenter,
                      child: SingleChildScrollView(
                        child: Column(
                          textDirection: Get.find<LocalizationController>()
                                      .currentLocale
                                      .value
                                      .languageCode ==
                                  'ar'
                              ? TextDirection.rtl
                              : TextDirection.ltr,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              margin: EdgeInsets.only(top: 15.0),
                              padding: EdgeInsets.all(15.0),
                              child: Column(
                                spacing: 5.0,
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
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
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
                                      spacing: 25.0,
                                      textDirection:
                                          Get.find<LocalizationController>()
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
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        actions: [
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
              ButtonDialog(
                text: "Next".tr,
                onPressed: () async {
                  if (add_Data_controller.currentPage.value != 3) {
                    add_Data_controller
                        .goToPage(add_Data_controller.currentPage.value + 1);
                  }
                },
                color: Get.theme.primaryColor,
                width: 100,
              ),
              ButtonDialog(
                text: "Back".tr,
                onPressed: () {
                  if (add_Data_controller.currentPage.value > 0) {
                    add_Data_controller
                        .goToPage(add_Data_controller.currentPage.value - 1);
                  }
                },
                color: Get.theme.primaryColor,
                width: 100,
              ),
            ],
          )
        ],
      );
    });
  }
}
