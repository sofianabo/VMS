import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vms_school/Link/Controller/HomeScreenController.dart';
import 'package:vms_school/view/Auth/LoginScreen.dart';

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
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;

    return SizedBox(
      width: w,
      height: h,
      child: Stack(
        children: [
          SlideTransition(
            position: _animation,
            child: Image.asset(
              "assets/images/Home-Background.png",
              fit: BoxFit.cover,
              height: h / 1.368,
              width: w,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Image.asset(
                "assets/images/Home-Background2.png",
                width: w / 2.84,
                height: h / 1.52,
              ),
              // المحتوى النصي
              Container(
                margin: EdgeInsets.only(top: h / 13.68),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text("WE CARE ABOUT \n YOUR FUTURE".tr,
                        style: Get.theme.textTheme.titleLarge!
                            .copyWith(fontSize: 60)),
                    Padding(
                      padding: EdgeInsets.only(top: h / 68.4),
                      child: Text(
                        "Join us to enter a better world filled with advanced educational methods through Virtual Modern School"
                            .tr,
                        style: Get.theme.textTheme.titleLarge!
                            .copyWith(fontSize: 14),
                      ),
                    ),
                    SizedBox(height: h / 22.8),
                    // أزرار التسجيل والدخول
                    Container(
                      decoration: BoxDecoration(
                        border: Border.all(
                            color: Get.theme.primaryColor, width: 1.0),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      height: h / 13.68,
                      width: w / 3.657,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          GestureDetector(
                            child: Container(
                              width: w / 6.808,
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
                              // Get.to(() => Registration());
                            },
                          ),
                          GestureDetector(
                            child: Container(
                              width: w / 8,
                              height: h / 13.68,
                              alignment: Alignment.center,
                              child: Text('Sign In'.tr,
                                  style: Get.theme.textTheme.titleLarge!
                                      .copyWith(fontSize: 16)),
                            ),
                            onTap: () {
                              Get.to(() => LoginScreen());
                            },
                          ),
                        ],
                      ),
                    ),
                    // معلومات عن المعلمين والطلاب والزوار
                    GetBuilder<Homescreencontroller>(builder: (control) {
                      return SizedBox(
                        height: h / 3.42,
                        width: w / 3.657,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            _buildInfoCard(control.teacher.toString(),
                                "Teachers", "assets/images/avatar1.png"),
                            _buildInfoCard(control.student.toString(),
                                "Students", "assets/images/avatar2.png"),
                            _buildInfoCard(control.visitor.toString(),
                                "Visitors", "assets/images/avatar3.png"),
                          ],
                        ),
                      );
                    }),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildInfoCard(String title, String subtitle, String imagePath) {
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;
    return Container(
      height: h / 5.7,
      width: w / 12.8,
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
}
