import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx/Link/Controller/AdminController/Class_Mgmt_Controller.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:getx/widgets/GridAnimation.dart';

class ClassesGrid extends StatelessWidget {
  ClassesGrid({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ClassMgmtController>(builder: (control) {
      return GridView.builder(
        padding: const EdgeInsets.only(top: 10, left: 40, right: 40),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 5,
            crossAxisSpacing: 20.0,
            mainAxisSpacing: 20.0,
            childAspectRatio: 1.1),
        itemCount: control.Classes.length,
        itemBuilder: (context, index) {
          return HoverScaleCard(
            child: GestureDetector(
              onTap: () {},
              child: Container(
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      border: Border.all(color: Colors.grey, width: 0.5),
                      color: Colors.white,
                      boxShadow: const [
                        BoxShadow(
                            color: Colors.black26,
                            offset: Offset(0, 2),
                            blurRadius: 1)
                      ]),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text("${control.Classes[index]['arName']}",
                              style: Get.theme.primaryTextTheme.titleLarge!
                                  .copyWith(
                                fontSize: 20,
                              )),
                        ],
                      ),
                      Text("${control.Classes[index]['class']}",
                          style: Get.theme.primaryTextTheme.titleLarge!
                              .copyWith(fontSize: 14, color: Colors.black)),
                      Text("${control.Classes[index]['division']}",
                          style: Get.theme.primaryTextTheme.titleLarge!
                              .copyWith(fontSize: 14, color: Colors.black)),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("Drive URL",
                              style: Get.theme.primaryTextTheme.titleLarge!
                                  .copyWith(
                                fontSize: 16,
                              )),
                          SvgPicture.asset(
                            "../../images/drive.svg",
                            width: 20,
                          )
                        ],
                      )
                    ],
                  )),
            ),
          );
        },
      );
    });
  }
}
