import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vms_school/Link/Controller/HomeController/HomeScreenController.dart';
import 'package:vms_school/view/Auth/LoginScreen.dart';
import 'package:vms_school/view/Guardian/MainScreen/GuardinMainScreen.dart';
import 'package:vms_school/widgets/Responsive.dart';

class Section1 extends StatefulWidget {
  const Section1({super.key});

  @override
  _Section1State createState() => _Section1State();
}

class _Section1State extends State<Section1>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Offset> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 20),
      vsync: this,
    )..repeat(reverse: true);

    _animation = Tween<Offset>(begin: Offset(0.0, 0.0), end: Offset(-0.4, 0.0))
        .animate(CurvedAnimation(parent: _controller, curve: Curves.easeInOut));
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth >= 1200) {
          return Stack(
            children: [
              SlideTransition(
                position: _animation,
                child: Image.asset(
                  "assets/images/Home-Background.png",
                  width: width,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 25.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Image.asset(
                      "assets/images/Home-Background2.png",
                      width: width / 2.84,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(
                            textAlign: TextAlign.center,
                            "WE CARE ABOUT \n YOUR FUTURE".tr,
                            style: Get.theme.textTheme.titleLarge!
                                .copyWith(fontSize: 60)),
                        Padding(
                          padding: EdgeInsets.only(top: 10.0, bottom: 20.0),
                          child: Text(
                            "Join us to enter a better world filled with advanced educational methods through Virtual Modern School"
                                .tr,
                            style: Get.theme.textTheme.titleLarge!
                                .copyWith(fontSize: 14),
                          ),
                        ),

                        // أزرار التسجيل والدخول
                        Container(
                          decoration: BoxDecoration(
                            border: Border.all(
                                color: Get.theme.primaryColor, width: 1.0),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          height: 45,
                          width: 352,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              GestureDetector(
                                child: Container(
                                  width: 175,
                                  height: 45,
                                  decoration: BoxDecoration(
                                      color: Get.theme.primaryColor,
                                      borderRadius: const BorderRadius.only(
                                          topRight: Radius.circular(11),
                                          bottomRight: Radius.circular(11))),
                                  alignment: Alignment.center,
                                  child: Text('Enroll'.tr,
                                      style: Get.theme.textTheme.displayMedium!
                                          .copyWith(fontSize: 16)),
                                ),
                                onTap: () {
                                  Get.toNamed("/enroll");
                                },
                              ),
                              GestureDetector(
                                child: Container(
                                  width: 175,
                                  height: 40,
                                  alignment: Alignment.center,
                                  child: Text('Sign In'.tr,
                                      style: Get.theme.textTheme.titleLarge!
                                          .copyWith(fontSize: 16)),
                                ),
                                onTap: () {
                                  // Get.to(GuardianMainScreen());
                                  Get.toNamed("/login");
                                },
                              ),
                            ],
                          ),
                        ),

                        GetBuilder<Homescreencontroller>(builder: (control) {
                          return Padding(
                            padding: const EdgeInsets.only(top: 22.0),
                            child: SizedBox(
                              width: 350,
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  _buildInfoCard(formatNumber(control.teacher),
                                      "Teachers", "assets/images/avatar1.png"),
                                  _buildInfoCard(formatNumber(control.student),
                                      "Students", "assets/images/avatar2.png"),
                                  _buildInfoCard(formatNumber(control.visitor),
                                      "Visitors", "assets/images/avatar3.png"),
                                ],
                              ),
                            ),
                          );
                        }),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          );
        } else if (constraints.maxWidth >= 983) {
          return Stack(
            children: [
              SlideTransition(
                position: _animation,
                child: Image.asset(
                  "assets/images/Home-Background.png",
                  width: width,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 25.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Image.asset(
                      "assets/images/Home-Background2.png",
                      width: width / 2.84,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(
                            textAlign: TextAlign.center,
                            "WE CARE ABOUT \n YOUR FUTURE".tr,
                            style: Get.theme.textTheme.titleLarge!
                                .copyWith(fontSize: 60)),
                        Padding(
                          padding: EdgeInsets.only(top: 10.0, bottom: 20.0),
                          child: Text(
                            "Join us to enter a better world filled with advanced educational methods through Virtual Modern School"
                                .tr,
                            style: Get.theme.textTheme.titleLarge!
                                .copyWith(fontSize: 14),
                          ),
                        ),
                        // أزرار التسجيل والدخول
                        Container(
                          decoration: BoxDecoration(
                            border: Border.all(
                                color: Get.theme.primaryColor, width: 1.0),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          height: 45,
                          width: 352,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              GestureDetector(
                                child: Container(
                                  width: 175,
                                  height: 45,
                                  decoration: BoxDecoration(
                                      color: Get.theme.primaryColor,
                                      borderRadius: const BorderRadius.only(
                                          topRight: Radius.circular(11),
                                          bottomRight: Radius.circular(11))),
                                  alignment: Alignment.center,
                                  child: Text('Enroll'.tr,
                                      style: Get.theme.textTheme.displayMedium!
                                          .copyWith(fontSize: 16)),
                                ),
                                onTap: () {
                                  Get.toNamed("/enroll");
                                },
                              ),
                              GestureDetector(
                                child: Container(
                                  width: 175,
                                  height: 40,
                                  alignment: Alignment.center,
                                  child: Text('Sign In'.tr,
                                      style: Get.theme.textTheme.titleLarge!
                                          .copyWith(fontSize: 16)),
                                ),
                                onTap: () {
                                  Get.toNamed("/login");
                                },
                              ),
                            ],
                          ),
                        ),

                        GetBuilder<Homescreencontroller>(builder: (control) {
                          return Padding(
                            padding: const EdgeInsets.only(top: 22.0),
                            child: SizedBox(
                              width: 350,
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  _buildInfoCard(formatNumber(control.teacher),
                                      "Teachers", "assets/images/avatar1.png"),
                                  _buildInfoCard(formatNumber(control.student),
                                      "Students", "assets/images/avatar2.png"),
                                  _buildInfoCard(formatNumber(control.visitor),
                                      "Visitors", "assets/images/avatar3.png"),
                                ],
                              ),
                            ),
                          );
                        }),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          );
        } else {
          return Stack(
            children: [
              SlideTransition(
                position: _animation,
                child: Image.asset(
                  "assets/images/Home-Background.png",
                  width: width,
                ),
              ),
              Container(
                width: width,
                child: Column(
                  spacing: 8.5,
                  children: [
                    Container(
                      width: 250,
                      height: 250,
                      child: Image.asset(
                        "assets/images/Home-Background2.png",
                        width: 150,
                      ),
                    ),
                    Text(
                        textAlign: TextAlign.center,
                        "WE CARE ABOUT YOUR FUTURE".tr,
                        style: Get.theme.textTheme.titleLarge!
                            .copyWith(fontSize: 35)),
                    Padding(
                      padding: EdgeInsets.only(
                          top: 10.0, bottom: 20.0, left: 20.0, right: 20.0),
                      child: Text(
                        textAlign: TextAlign.center,
                        "Join us to enter a better world filled with advanced educational methods through Virtual Modern School"
                            .tr,
                        style: Get.theme.textTheme.titleLarge!
                            .copyWith(fontSize: 14),
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                        border: Border.all(
                            color: Get.theme.primaryColor, width: 1.0),
                        borderRadius: BorderRadius.circular(6),
                      ),
                      height: 40,
                      width: 202,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          GestureDetector(
                            child: Container(
                              width: 100,
                              height: 40,
                              decoration: BoxDecoration(
                                  color: Get.theme.primaryColor,
                                  borderRadius: const BorderRadius.only(
                                      topRight: Radius.circular(5),
                                      bottomRight: Radius.circular(5))),
                              alignment: Alignment.center,
                              child: Text('Enroll'.tr,
                                  style: Get.theme.textTheme.displayMedium!
                                      .copyWith(fontSize: 12)),
                            ),
                            onTap: () {
                              Get.toNamed("/enroll");
                            },
                          ),
                          GestureDetector(
                            child: Container(
                              width: 100,
                              height: 30,
                              alignment: Alignment.center,
                              child: Text('Sign In'.tr,
                                  style: Get.theme.textTheme.titleLarge!
                                      .copyWith(fontSize: 12)),
                            ),
                            onTap: () {
                              Get.toNamed("/login");
                            },
                          ),
                        ],
                      ),
                    ),
                    GetBuilder<Homescreencontroller>(builder: (control) {
                      return Padding(
                        padding: const EdgeInsets.only(top: 22.0),
                        child: SizedBox(
                          width: 250,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              _buildInfoCardPhone(
                                  80,
                                  120,
                                  formatNumber(control.teacher),
                                  "Teachers",
                                  "assets/images/avatar1.png"),
                              _buildInfoCardPhone(
                                  80,
                                  120,
                                  formatNumber(control.student),
                                  "Students",
                                  "assets/images/avatar2.png"),
                              _buildInfoCardPhone(
                                  80,
                                  120,
                                  formatNumber(control.visitor),
                                  "Visitors",
                                  "assets/images/avatar3.png"),
                            ],
                          ),
                        ),
                      );
                    }),
                  ],
                ),
              ),
            ],
          );
        }
      },
    );
  }

  Widget _buildInfoCard(String title, String subtitle, String imagePath) {
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;
    return Container(
      height: 120,
      width: 107,
      decoration: BoxDecoration(
        color: Get.theme.cardColor,
        borderRadius: BorderRadius.circular(21),
        border: Border.all(color: Colors.grey, width: 2.0),
      ),
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.only(top: h / 68.4),
            height: h / 17.1,
            width: w / 32,
            decoration: BoxDecoration(
                color: Get.theme.cardColor,
                borderRadius: BorderRadius.circular(100)),
            child: Image.asset(imagePath),
          ),
          Padding(
            padding: EdgeInsets.only(top: h / 68.4),
            child: Text(title, style: Get.theme.textTheme.bodyMedium!),
          ),
          Padding(
            padding: EdgeInsets.only(top: h / 68.4),
            child: Text(subtitle.tr, style: Get.theme.textTheme.bodyMedium!),
          ),
        ],
      ),
    );
  }

  Widget _buildInfoCardPhone(double width, double hieght, String title,
      String subtitle, String imagePath) {
    return Container(
      height: hieght,
      width: width,
      decoration: BoxDecoration(
        color: Get.theme.cardColor,
        borderRadius: BorderRadius.circular(21),
        border: Border.all(color: Colors.grey, width: 2.0),
      ),
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.only(top: 10.0),
            height: 30,
            width: 30,
            decoration: BoxDecoration(
                color: Get.theme.cardColor,
                borderRadius: BorderRadius.circular(100)),
            child: Image.asset(
              imagePath,
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 10.0),
            child: Text(title,
                style: Get.theme.textTheme.bodyMedium!.copyWith(fontSize: 13)),
          ),
          Padding(
            padding: EdgeInsets.only(top: 10.0),
            child: Text(subtitle.tr,
                style: Get.theme.textTheme.bodyMedium!.copyWith(fontSize: 13)),
          ),
        ],
      ),
    );
  }
}

String formatNumber(int num) {
  if (num < 1000) {
    return num.toString();
  } else if (num < 1000000) {
    double k = num / 1000;
    return '${k.toStringAsFixed(k % 1 == 0 ? 0 : 1)}K';
  } else if (num < 1000000000) {
    double m = num / 1000000;
    return '${m.toStringAsFixed(m % 1 == 0 ? 0 : 1)}M';
  } else {
    double b = num / 1000000000;
    return '${b.toStringAsFixed(b % 1 == 0 ? 0 : 1)}B';
  }
}
