import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:vms_school/Link/Controller/LMS_Controllers/Admin_LMS/Selected_Screen.dart';

class Appbartransaction extends StatefulWidget {
  const Appbartransaction({super.key});

  @override
  State<Appbartransaction> createState() => _AppbartransactionState();
}

class _AppbartransactionState extends State<Appbartransaction> {
  @override
  Widget build(BuildContext context) {
    double widthScreen = MediaQuery.of(context).size.width;
    return Container(
      margin: const EdgeInsets.only(right: 60, left: 50, top: 15, bottom: 15.0),
      height: 77,
      width: widthScreen,
      child: Row(
        spacing: 35.0,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: GetBuilder<Selected_Class_Controller>(
              builder: (controller) {
                return SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children:
                        List.generate(controller.moveMenu.length, (index) {
                      final item = controller.moveMenu[index];
                      return GestureDetector(
                        onTap: () => controller.onItemTap(index),
                        child: Row(
                          children: [
                            if (index > 0)
                              Padding(
                                padding: EdgeInsets.symmetric(horizontal: 4),
                                child: Text('/',
                                    style: TextStyle(
                                        color: Get.theme.primaryColor)),
                              ),
                            Container(
                              padding: EdgeInsets.all(8),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8),
                                color: index == controller.moveMenu.length - 1
                                    ? Get.theme.primaryColor
                                    : Colors.transparent,
                              ),
                              child: Text(
                                item,
                                style: TextStyle(
                                  color: index == controller.moveMenu.length - 1
                                      ? Colors.white
                                      : Get.theme.primaryColor,
                                  fontWeight:
                                      index == controller.moveMenu.length - 1
                                          ? FontWeight.bold
                                          : FontWeight.normal,
                                ),
                              ),
                            ),
                          ],
                        ),
                      );
                    }),
                  ),
                );
              },
            ),
          ),
          SvgPicture.asset(
            Theme.of(context).brightness == Brightness.dark
                ? "assets/images/logodark.svg"
                : "assets/images/logolight.svg",
            width: 250,
          ),
        ],
      ),
    );
  }
}
