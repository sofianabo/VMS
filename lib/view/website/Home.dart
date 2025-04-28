import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vms_school/Link/API/HomeScreenApI.dart';
import 'package:vms_school/Translate/local_controller.dart';
import 'package:vms_school/view/website/Appbar.dart';
import 'package:vms_school/view/website/Section1.dart';
import 'package:vms_school/view/website/Section2.dart';
import 'package:vms_school/view/website/Section3.dart';
import 'package:vms_school/view/website/Section4.dart';
import 'package:vms_school/view/website/Section5.dart';
import 'package:vms_school/view/website/Section6.dart';
import 'package:vms_school/view/website/Section7.dart';
import 'package:vms_school/widgets/Switcher.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

void _precacheImage(BuildContext context) {
  precacheImage(AssetImage("assets/images/Enroll_Images/2.jpg"), context);
  precacheImage(AssetImage("assets/images/Enroll_Images/5.jpg"), context);
}

class _HomeState extends State<Home> {
  final section2Key = GlobalKey();
  final section3Key = GlobalKey();
  final section4Key = GlobalKey();
  final section5Key = GlobalKey();
  final section6Key = GlobalKey();
  final section7Key = GlobalKey();

  final LocalizationController loc =
      Get.put(LocalizationController(), permanent: true);

  @override
  void initState() {
    super.initState();
    Homescreenapi(context).homescreen();
  }

  @override
  Widget build(BuildContext context) {
    _precacheImage(context);
    return Scaffold(
      drawer: Drawer(
        width: 200,
        backgroundColor: Theme.of(context).primaryColor,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(5), bottomLeft: Radius.circular(5))),
        child: ListView(
          padding: EdgeInsets.only(top: 20.0),
          children: [
            ListTile(
              title: Text(
                "Contact Us".tr,
                style: TextStyle(color: Colors.white, fontSize: 16),
              ),
              onTap: () {
                Get.back();
                Scrollable.ensureVisible(section7Key.currentContext!,
                    duration: const Duration(milliseconds: 700));
              },
            ),
            ListTile(
              title: Text(
                "AboutUs".tr,
                style: TextStyle(color: Colors.white, fontSize: 16),
              ),
              onTap: () {
                Get.back();
                Scrollable.ensureVisible(section5Key.currentContext!,
                    duration: const Duration(milliseconds: 700));
              },
            ),
            ListTile(
              title: Text(
                "WhyUs".tr,
                style: TextStyle(color: Colors.white, fontSize: 16),
              ),
              onTap: () {
                Get.back();
                Scrollable.ensureVisible(section4Key.currentContext!,
                    duration: const Duration(milliseconds: 700));
              },
            ),
            ListTile(
              title: Text(
                "Programs".tr,
                style: TextStyle(color: Colors.white, fontSize: 16),
              ),
              onTap: () {
                Get.back();
                Scrollable.ensureVisible(section6Key.currentContext!,
                    duration: const Duration(milliseconds: 700));
              },
            ),
            ListTile(
              title: Text(
                "Enrollment".tr,
                style: TextStyle(color: Colors.white, fontSize: 16),
              ),
              onTap: () {
                Get.back();
                Scrollable.ensureVisible(section3Key.currentContext!,
                    duration: const Duration(milliseconds: 700));
              },
            ),
            ListTile(
              title: Text(
                "Eligibility".tr,
                style: TextStyle(color: Colors.white, fontSize: 16),
              ),
              onTap: () {
                Get.back();

                Scrollable.ensureVisible(section2Key.currentContext!,
                    duration: const Duration(milliseconds: 700));
              },
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20.0, left: 40.0, right: 10),
              child: Container(
                width: 100,
                height: 35,
                decoration: BoxDecoration(
                  border: Border.all(color: Color(0xffD9D9D9)),
                  borderRadius: BorderRadius.circular(5.0),
                ),
                child: DropdownButtonHideUnderline(child:
                    GetBuilder<LocalizationController>(builder: (controller) {
                  // استخدام اللغة الحالية مباشرة من controller
                  String currentLanguage =
                      controller.currentLocale.value.languageCode;

                  String initialValue =
                      currentLanguage == 'ar' ? 'Arabicc'.tr : 'English'.tr;

                  return DropdownButton<String>(
                    style: TextStyle(color: Colors.white),
                    value: initialValue,
                    isDense: true,
                    dropdownColor: Theme.of(context).cardColor,
                    alignment:
                        AlignmentDirectional.centerStart, // النص في اليسار
                    icon: Padding(
                      padding: const EdgeInsets.only(left: 15.0),
                      child: Icon(Icons.arrow_drop_down, size: 16),
                    ), // السهم في اليمين افتراضيًا
                    items: ['English'.tr, 'Arabicc'.tr].map((String language) {
                      return DropdownMenuItem<String>(
                        value: language,
                        child: Text(language,
                            style: Theme.of(context).textTheme.bodyMedium),
                      );
                    }).toList(),
                    onChanged: (String? newValue) {
                      // عند تغيير اللغة، سيتم التبديل بين اللغتين بناءً على القيمة المحددة
                      if (newValue == "Arabicc".tr) {
                        Get.find<LocalizationController>()
                            .changeLanguage(const Locale('ar'));
                      } else {
                        Get.find<LocalizationController>()
                            .changeLanguage(const Locale('en'));
                      }
                    },
                  );
                })),
              ),
            ),
          ],
        ),
      ),
      body: Directionality(
        textDirection: TextDirection.rtl,
        child: SingleChildScrollView(
          child: Column(
            children: [
              AppbarCustom(
                section2Key: section2Key,
                section3Key: section3Key,
                section4Key: section4Key,
                section5Key: section5Key,
                section6Key: section6Key,
                section7Key: section7Key,
              ),
              Section1(),
              Section2(key: section2Key),
              Section3(key: section3Key),
              Section4(key: section4Key),
              Section5(key: section5Key),
              Section6(key: section6Key),
              Section7(key: section7Key),
            ],
          ),
        ),
      ),
    );
  }
}
