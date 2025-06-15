import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:get/get.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:vms_school/Link/Controller/LMS_Controllers/Admin_LMS/NumberOfContentController.dart';
import 'package:vms_school/Link/Controller/LMS_Controllers/Admin_LMS/Selected_Screen.dart';
import 'package:vms_school/view/Both_Platform/widgets/GridAnimation.dart';

class SelectedClassLMs extends StatelessWidget {
  const SelectedClassLMs({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    int getCrossAxisCount() {
      if (screenWidth >= 1432) return 5;
      if (screenWidth >= 1154) return 4;
      if (screenWidth >= 950) return 3;
      if (screenWidth >= 769) return 2;
      return 1;
    }

    double getChildAspectRatio() {
      if (screenWidth >= 1070) return 1.1;
      if (screenWidth >= 950) return 1.1;
      if (screenWidth >= 838) return 1.6;
      if (screenWidth >= 769) return 1.5;
      if (screenWidth >= 613) return 2.2;
      if (screenWidth >= 486) return 1.7;
      return 1.2;
    }

    return GetBuilder<Selected_Class_Controller>(builder: (control) {
      return control.isLoading == true
          ? LoadingAnimationWidget.staggeredDotsWave(
              color: Get.theme.primaryColor,
              size: 60,
            )
          : GridView.builder(
              padding: const EdgeInsets.only(top: 10, left: 50, right: 50),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: getCrossAxisCount(),
                  crossAxisSpacing: 20.0,
                  mainAxisSpacing: 20.0,
                  childAspectRatio: getChildAspectRatio()),
              itemCount: 8,
              itemBuilder: (context, index) {
                return HoverScaleCard(
                  child: GestureDetector(
                    onTap: () {
                      control
                          .addToPath("${control.dataList[index]['name']}".tr);
                    },
                    child: Container(
                      padding: const EdgeInsets.all(20),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(5)),
                          border: Border.all(
                              color: Theme.of(context)
                                  .textTheme
                                  .titleMedium!
                                  .color!,
                              width: 0.5),
                          color: Theme.of(context).cardColor,
                          boxShadow: const [
                            BoxShadow(
                                color: Colors.black26,
                                offset: Offset(0, 2),
                                blurRadius: 1)
                          ]),
                      child: Column(
                        spacing: 16.0,
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Icon(
                            control.dataList[index]['icon'],
                            color: Get.theme.textTheme.titleMedium!.color,
                            size: 50.0,
                          ),
                          Text(control.dataList[index]['name'],
                              style: Theme.of(context)
                                  .textTheme
                                  .titleMedium!
                                  .copyWith(
                                    fontSize: 19,
                                  )),
                          Expanded(
                            child: Center(
                              child: Text(
                                  maxLines: 4,
                                  overflow: TextOverflow.ellipsis,
                                  textAlign: TextAlign.center,
                                  control.dataList[index]['subtitle'],
                                  style: Theme.of(context)
                                      .textTheme
                                      .titleMedium!
                                      .copyWith(
                                        fontWeight: FontWeight.normal,
                                        fontSize: 10,
                                      )),
                            ),
                          ),
                          Text("( ${control.dataList[index]['count']} )",
                              style: Theme.of(context)
                                  .textTheme
                                  .titleMedium!
                                  .copyWith(
                                    fontSize: 14,
                                  )),
                        ],
                      ),
                    ),
                  ),
                );
              },
            );
    });
  }
}
