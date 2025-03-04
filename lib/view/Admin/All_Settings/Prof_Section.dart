import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vms_school/Translate/local_controller.dart';
import 'package:vms_school/view/Admin/All_Settings/Button_Has_IconText.dart';
import 'package:vms_school/view/Admin/All_Settings/Profile_DatePicker.dart';
import 'package:vms_school/view/Admin/All_Settings/TextField_Profile.dart';
import 'package:vms_school/view/Admin/All_Settings/Wedgets/Profile_DropDown.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  var _isDarkMode = Get.isDarkMode.obs;
  TextEditingController Firstname = TextEditingController(text: "Laith");
  TextEditingController Lastname = TextEditingController(text: "Azzam");
  TextEditingController fatherName = TextEditingController();
  TextEditingController motherName = TextEditingController();
  TextEditingController phoneNumper = TextEditingController();
  TextEditingController emergencyNumber = TextEditingController();
  TextEditingController Address = TextEditingController();
  TextEditingController currentAddress = TextEditingController();
  TextEditingController careerHistory = TextEditingController();
  TextEditingController Qualification = TextEditingController();
  TextEditingController Experience = TextEditingController();
  TextEditingController Note = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
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
          Padding(
            padding: const EdgeInsets.only(
                top: 25.0, left: 15.0, right: 15.0, bottom: 15.0),
            child: Text(
              "Profile".tr,
              style: TextStyle(fontSize: 18),
            ),
          ),
          Container(
            padding: EdgeInsets.all(15.0),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(15)),
                border: Border.all(color: Color(0xffF6F6F6), width: 1.5)),
            child: Row(
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
                  textDirection: Get.find<LocalizationController>()
                              .currentLocale
                              .value
                              .languageCode ==
                          'ar'
                      ? TextDirection.rtl
                      : TextDirection.ltr,
                  children: [
                    CircleAvatar(
                      maxRadius: 35,
                      child: Image.asset(
                        "../../images/Rectangle66.png",
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                      child: Column(
                        textDirection: Get.find<LocalizationController>()
                                    .currentLocale
                                    .value
                                    .languageCode ==
                                'ar'
                            ? TextDirection.rtl
                            : TextDirection.ltr,
                        spacing: 5.0,
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Laith Haitham Azzam",
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.bold),
                          ),
                          Text("@Laithhazzam",
                              style: TextStyle(
                                fontSize: 12,
                              )),
                          Text("Technical Support",
                              style: TextStyle(
                                fontSize: 12,
                              )),
                        ],
                      ),
                    ),
                  ],
                ),
                Button_Has_IconText(
                  onPressed: () {},
                  text: "Edit".tr,
                  icon: Icon(
                    Icons.edit,
                    color: Colors.black,
                  ),
                )
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 15.0),
            padding: EdgeInsets.all(15.0),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(15)),
                border: Border.all(color: Color(0xffF6F6F6), width: 1.5)),
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
                    Button_Has_IconText(
                      onPressed: () {},
                      text: "Edit".tr,
                      icon: Icon(
                        Icons.edit,
                        color: Colors.black,
                      ),
                    )
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
                          Icons.personal_injury_rounded,
                          color: Theme.of(context).textTheme.bodySmall!.color,
                          size: 20,
                        ),
                        controller: Firstname,
                        Uptext: "First Name",
                        readOnly: false,
                        enabled: false,
                      ),
                      TextField_Profile(
                        upicon: Icon(
                          Icons.personal_injury_rounded,
                          color: Theme.of(context).textTheme.bodySmall!.color,
                          size: 20,
                        ),
                        controller: Lastname,
                        Uptext: "Last Name",
                        readOnly: true,
                        enabled: false,
                      ),
                      TextField_Profile(
                        upicon: Icon(
                          Icons.phone_enabled_outlined,
                          color: Theme.of(context).textTheme.bodySmall!.color,
                          size: 20,
                        ),
                        controller: phoneNumper,
                        Uptext: "Phone Number",
                        readOnly: true,
                        enabled: false,
                      ),
                      TextField_Profile(
                        upicon: Icon(
                          Icons.sos,
                          color: Theme.of(context).textTheme.bodySmall!.color,
                          size: 20,
                        ),
                        readOnly: true,
                        enabled: false,
                        controller: emergencyNumber,
                        Uptext: "Emergency Number",
                      ),
                      Profile_JoinDate(
                        upicon: Icon(
                          Icons.date_range_outlined,
                          color: Theme.of(context).textTheme.bodySmall!.color,
                          size: 20,
                        ),
                        enabled: false,
                        Uptext: "Join Date",
                        width: 220,
                      ),
                      Profile_BirthDate(
                        upicon: Icon(
                          Icons.date_range_rounded,
                          color: Theme.of(context).textTheme.bodySmall!.color,
                          size: 20,
                        ),
                        enabled: false,
                        Uptext: "Birthdate",
                        width: 220,
                      ),
                      TextField_Profile(
                        upicon: Icon(
                          Icons.location_on_outlined,
                          color: Theme.of(context).textTheme.bodySmall!.color,
                          size: 20,
                        ),
                        readOnly: true,
                        enabled: false,
                        controller: Address,
                        Uptext: "Address",
                      ),
                      TextField_Profile(
                        upicon: Icon(
                          Icons.my_location_outlined,
                          color: Theme.of(context).textTheme.bodySmall!.color,
                          size: 20,
                        ),
                        readOnly: false,
                        enabled: true,
                        controller: currentAddress,
                        Uptext: "Current Address",
                      ),
                      Profile_DropDown(
                          upicon: Icon(
                            Icons.transgender_outlined,
                            color: Theme.of(context).textTheme.bodySmall!.color,
                            size: 20,
                          ),
                          labelText: "Gender",
                          enabled: false,
                          title: "Gender",
                          width: 220,
                          type: "Gender"),
                      Profile_DropDown(
                          upicon: Icon(
                            Icons.family_restroom_outlined,
                            color: Theme.of(context).textTheme.bodySmall!.color,
                            size: 20,
                          ),
                          labelText: "Family Status",
                          enabled: true,
                          title: "Family Status",
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
    );
  }
}
