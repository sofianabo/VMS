import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vms_school/Theme/ThemeData.dart';
import 'package:vms_school/view/Both_Platform/widgets/Switcher.dart';

class AppbarCustom extends StatelessWidget {
  final GlobalKey section2Key;
  final GlobalKey section3Key;
  final GlobalKey section4Key;
  final GlobalKey section5Key;
  final GlobalKey section6Key;
  final GlobalKey section7Key;

  const AppbarCustom({
    super.key,
    required this.section2Key,
    required this.section3Key,
    required this.section4Key,
    required this.section5Key,
    required this.section6Key,
    required this.section7Key,
  });

  void scrollToSection(GlobalKey key) {
    final context = key.currentContext;
    if (context != null) {
      Scrollable.ensureVisible(
        context,
        duration: const Duration(milliseconds: 700),
        curve: Curves.easeInOut,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    bool isDesktop = screenWidth >= 1200;
    bool isTablet = screenWidth >= 983 && screenWidth < 1200;

    List<Widget> navItems = [
      buildNavItem("Eligibility".tr, () => scrollToSection(section2Key)),
      buildNavItem("Enrollment".tr, () => scrollToSection(section3Key)),
      buildNavItem("WhyUs".tr, () => scrollToSection(section4Key)),
      buildNavItem("AboutUs".tr, () => scrollToSection(section5Key)),
      buildNavItem("Programs".tr, () => scrollToSection(section6Key)),
      buildNavItem("Contact Us".tr, () => scrollToSection(section7Key)),
    ];
    if (isDesktop || isTablet) {
      Scaffold.of(context).closeDrawer();
    }
    return Container(
      height: (isDesktop || isTablet) ? 100 : 50,
      padding: const EdgeInsets.symmetric(horizontal: 25),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // Left side (Menu or Buttons)
          if (isDesktop || isTablet)
            Row(
              children: [
                LanguageSwitcher(
                  onLanguageToggle: (isArabic) {
                    print('Language switched to Arabic: $isArabic');
                  },
                ),
                const SizedBox(width: 16),
                ...navItems,
              ],
            )
          else
            Builder(
              builder: (context) => IconButton(
                icon: Icon(
                  Icons.menu,
                  color: Theme.of(context).primaryColor,
                ),
                onPressed: () => Scaffold.of(context).openDrawer(),
              ),
            ),

          // Right side (Logo)
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                if (isDesktop || isTablet)
                  SizedBox(
                    height: 70,
                    child: Image.asset(
                      "assets/images/Logo2.png",
                      fit: BoxFit.contain,
                    ),
                  )
                else
                  SizedBox(
                    height: 70,
                    child: Image.asset(
                      width: 100,
                      "assets/images/Logo2.png",
                      fit: BoxFit.contain,
                    ),
                  )
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget buildNavItem(String title, VoidCallback onTap) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 6.0),
      child: SizedBox(
        height: 40,
        child: TextButton(
          onPressed: onTap,
          child: Text(
            title,
            style: Get.theme.textTheme.bodyMedium!.copyWith(fontSize: 13),
          ),
        ),
      ),
    );
  }
}
