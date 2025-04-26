import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:vms_school/widgets/TextFildWithUpper.dart';

class EnrollScreen extends StatelessWidget {
  EnrollScreen({super.key});

  TextEditingController Email = TextEditingController();
  TextEditingController Username = TextEditingController();
  TextEditingController First = TextEditingController();
  TextEditingController Last = TextEditingController();
  TextEditingController National = TextEditingController();
  TextEditingController Phone = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController Confirm = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xfff9f8fd),
      body: Directionality(
        textDirection: TextDirection.ltr,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          mainAxisSize: MainAxisSize.max,
          children: [
            Container(
              height: Get.height,
              width: Get.height * 0.7,
              child: Opacity(
                opacity: 0.9, // 25% opacity
                child: Image.asset(
                  "assets/images/Enroll_Images/2.jpg",
                  fit: BoxFit.fitHeight,
                ),
              ),
            ),

            // Container(
            //   height: Get.height,
            //   width: 400,
            //   child: PageView(
            //     controller: controller.pageController,
            //     physics: const NeverScrollableScrollPhysics(),
            //     onPageChanged: (index) {
            //       controller.currentPage.value = index;
            //     },
            //     children: controller.images.map((image) {
            //       return Image.asset(
            //         image,
            //         fit: BoxFit.cover,
            //         width: double.infinity,
            //         height: double.infinity,
            //         cacheWidth: (400 * Get.pixelRatio)
            //             .round(), // تحسين الأداء للصور الكبيرة
            //         cacheHeight: (Get.height * Get.pixelRatio).round(),
            //       );
            //     }).toList(),
            //   ),
            // ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(32.0),
                child: SingleChildScrollView(
                  child: Column(
                    spacing: 25.0,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SvgPicture.asset(
                        Theme.of(context).brightness == Brightness.dark
                            ? "assets/images/logodark.svg"
                            : "assets/images/logolight.svg",
                        width: 250,
                      ),
                      const SizedBox(height: 32),
                      Column(
                        children: [
                          Wrap(
                            spacing: 20.0,
                            runSpacing: 20.0,
                            crossAxisAlignment: WrapCrossAlignment.center,
                            children: [
                              Textfildwithupper(
                                  width: 250,
                                  controller: Email,
                                  Uptext: "Email",
                                  hinttext: "Email"),
                              Textfildwithupper(
                                  width: 250,
                                  controller: Username,
                                  Uptext: "Username",
                                  hinttext: "Username"),
                            ],
                          ),
                          Wrap(
                            spacing: 20.0,
                            runSpacing: 20.0,
                            crossAxisAlignment: WrapCrossAlignment.center,
                            children: [
                              Textfildwithupper(
                                  width: 250,
                                  controller: First,
                                  Uptext: "First Name",
                                  hinttext: "First Name"),
                              Textfildwithupper(
                                  width: 250,
                                  controller: Last,
                                  Uptext: "Last Name",
                                  hinttext: "Last Name"),
                            ],
                          ),
                          Wrap(
                            spacing: 20.0,
                            runSpacing: 20.0,
                            crossAxisAlignment: WrapCrossAlignment.center,
                            children: [
                              Textfildwithupper(
                                  width: 250,
                                  controller: National,
                                  Uptext: "National ID",
                                  hinttext: "National ID"),
                              Textfildwithupper(
                                  width: 250,
                                  controller: Phone,
                                  Uptext: "Phone",
                                  hinttext: "Phone"),
                            ],
                          ),
                          Wrap(
                            spacing: 20.0,
                            runSpacing: 20.0,
                            crossAxisAlignment: WrapCrossAlignment.center,
                            children: [
                              Textfildwithupper(
                                  width: 250,
                                  controller: password,
                                  Uptext: "Password",
                                  hinttext: "Password"),
                              Textfildwithupper(
                                  width: 250,
                                  controller: Confirm,
                                  Uptext: "Confirm Password",
                                  hinttext: "Confirm Password"),
                            ],
                          ),
                        ],
                      ),
                      const SizedBox(height: 32),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text("You Have Account ?"),
                          TextButton(
                            onPressed: () {},
                            child: const Text("Sign In"),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
