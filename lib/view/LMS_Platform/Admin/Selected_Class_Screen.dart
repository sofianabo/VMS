import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:get/get.dart';
import 'package:vms_school/Link/Controller/LMS_Controllers/Admin_LMS/Selected_Screen.dart';
import 'package:vms_school/Translate/local_controller.dart';
import 'package:vms_school/view/Both_Platform/widgets/GridAnimation.dart';
import 'package:vms_school/view/LMS_Platform/Admin/Admin_Main_Screens/Appbar_Admin_LMS.dart';

class Selected_Class_Screen extends StatelessWidget {
  const Selected_Class_Screen({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    int getCrossAxisCount() {
      if (screenWidth >= 1278) return 5;
      if (screenWidth >= 1070) return 4;
      if (screenWidth >= 950) return 3;
      if (screenWidth >= 769) return 2;
      return 1;
    }

    double getChildAspectRatio() {
      if (screenWidth >= 1070) return 1.1;
      if (screenWidth >= 950) return 1.1;
      if (screenWidth >= 838) return 1.6;
      if (screenWidth >= 769) return 1.5;
      if (screenWidth >= 539) return 2.2;
      return 1.7;
    }

    return Scaffold(
      body: Column(
        children: [
          AppbarAdmin_LMS(),
          Expanded(
            child: Directionality(
              textDirection: Get.find<LocalizationController>()
                          .currentLocale
                          .value
                          .languageCode ==
                      'ar'
                  ? TextDirection.rtl
                  : TextDirection.ltr,
              child: GetBuilder<Selected_Class_Controller>(builder: (control) {
                return control.isLoading == true
                    ? GridView.builder(
                        padding:
                            const EdgeInsets.only(top: 10, left: 40, right: 40),
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: getCrossAxisCount(),
                            crossAxisSpacing: 20.0,
                            mainAxisSpacing: 20.0,
                            childAspectRatio: getChildAspectRatio()),
                        itemCount: 10,
                        itemBuilder: (context, index) {
                          return HoverScaleCard(
                            child: Container(
                                padding: const EdgeInsets.all(20),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(5),
                                    border: Border.all(
                                        color: Colors.grey, width: 0.5),
                                    color: Theme.of(context).cardColor,
                                    boxShadow: const [
                                      BoxShadow(
                                          color: Colors.black26,
                                          offset: Offset(0, 2),
                                          blurRadius: 1)
                                    ]),
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [],
                                )),
                          )
                              .animate(
                                  onPlay: (controller) => controller.repeat())
                              .shimmer(
                                  angle: 1,
                                  color: Colors.grey.withOpacity(0.2),
                                  duration: const Duration(seconds: 1),
                                  delay: const Duration(seconds: 1));
                        },
                      )
                    : GridView.builder(
                        padding:
                            const EdgeInsets.only(top: 10, left: 40, right: 40),
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: getCrossAxisCount(),
                            crossAxisSpacing: 20.0,
                            mainAxisSpacing: 20.0,
                            childAspectRatio: getChildAspectRatio()),
                        itemCount: 8,
                        itemBuilder: (context, index) {
                          return HoverScaleCard(
                            child: GestureDetector(
                              onTap: () {},
                              child: Container(
                                  padding: const EdgeInsets.all(20),
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(5),
                                      border: Border.all(
                                          color: Colors.grey, width: 0.5),
                                      color: Theme.of(context).cardColor,
                                      boxShadow: const [
                                        BoxShadow(
                                            color: Colors.black26,
                                            offset: Offset(0, 2),
                                            blurRadius: 1)
                                      ]),
                                  child: Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          Text("ss",
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .bodyMedium!
                                                  .copyWith(
                                                    fontSize: 20,
                                                  )),
                                        ],
                                      ),
                                    ],
                                  )),
                            ),
                          );
                        },
                      );
              }),
            ),
          ),
        ],
      ),
    );
  }
}
