import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:vms_school/Link/Controller/AdminController/Main_Admin_Controller/Dashboard_Controller.dart';
import 'package:vms_school/view/Both_Platform/widgets/GridAnimation.dart';

class DashboardThirdRow extends StatelessWidget {
  const DashboardThirdRow({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final screenWidth = constraints.maxWidth;

        // تحديد عدد الأعمدة
        int crossAxisCount;
        if (screenWidth < 600) {
          crossAxisCount = 2; // موبايل
        } else if (screenWidth < 900) {
          crossAxisCount = 3; // تابلت
        } else {
          crossAxisCount = 6; // كمبيوتر
        }

        // تحديد نسب العنصر بناءً على حجم الشاشة
        double childAspectRatio;
        if (screenWidth < 600) {
          childAspectRatio = 1.1;
        } else if (screenWidth < 900) {
          childAspectRatio = 1.2;
        } else {
          childAspectRatio = 1.3;
        }

        return GetBuilder<Dashboard_Controller>(
          builder: (controller) {
            List<Map<String, dynamic>> dashed = [
              {
                'name': 'Total Students',
                'color': const Color(0xFFFFFFFF),
                'upIcon': 'stu.svg',
                'avg': '${controller.dsh?.allStudents ?? 0}',
              },
              {
                'name': 'Total Teacher',
                'color': const Color(0xffF9E5EA),
                'upIcon': 'tech.svg',
                'avg': '${controller.dsh?.allTeachers ?? 0}',
              },
              {
                'name': 'Total Employee',
                'color': const Color(0xffB8D8BA),
                'upIcon': 'emp.svg',
                'avg': '${controller.dsh?.allEmplooyes ?? 0}',
              },
              {
                'name': 'Total Visitor',
                'color': const Color(0xffDFEDF7),
                'upIcon': 'vist.svg',
                'avg': '${controller.dsh?.visitor ?? 0}',
              },
              {
                'name': 'Total Books',
                'color': const Color(0xffFBEDD9),
                'upIcon': 'divi.svg',
                'avg': '${controller.dsh?.elibraryCount ?? 0}',
              },
              {
                'name': 'Total Division',
                'color': const Color(0xffE7E6FB),
                'upIcon': 'divi.svg',
                'avg': '${controller.dsh?.divisin ?? 0}',
              },
            ];
            if (controller.Isloading) {
              return GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: crossAxisCount,
                  crossAxisSpacing: 10.0,
                  mainAxisSpacing: 10.0,
                  childAspectRatio: childAspectRatio,
                ),
                itemCount: 6,
                itemBuilder: (context, index) {
                  return HoverScaleCard(
                      child: Container(
                    padding: const EdgeInsets.all(13.0),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(color: Colors.grey, width: 0.2),
                      borderRadius: const BorderRadius.all(Radius.circular(5)),
                      boxShadow: const [
                        BoxShadow(
                          color: Colors.black12,
                          offset: Offset(0, 2),
                          blurRadius: 1,
                        ),
                      ],
                    ),
                  )
                          .animate(onPlay: (controller) => controller.repeat())
                          .shimmer(
                              angle: 1,
                              color: dashed[index]['color'],
                              duration: const Duration(seconds: 1),
                              delay: const Duration(seconds: 1)));
                },
              );
            }

            return GridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: crossAxisCount,
                crossAxisSpacing: 10.0,
                mainAxisSpacing: 10.0,
                childAspectRatio: childAspectRatio,
              ),
              itemCount: dashed.length,
              itemBuilder: (context, index) {
                return HoverScaleCard(
                  child: Container(
                    decoration: BoxDecoration(
                      color: dashed[index]['color'],
                      border: Border.all(color: Colors.grey, width: 0.2),
                      borderRadius: const BorderRadius.all(Radius.circular(5)),
                      boxShadow: const [
                        BoxShadow(
                          color: Colors.black12,
                          offset: Offset(0, 2),
                          blurRadius: 1,
                        ),
                      ],
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 1.0),
                          child: SvgPicture.asset(
                            "assets/images/${dashed[index]['upIcon']}",
                            width: 40.0,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 10.0),
                          child: Text(
                            "${dashed[index]['name']}".tr,
                            style: TextStyle(color: Colors.black),
                          ),
                        ),
                        Text("${dashed[index]['avg']}",
                            style: TextStyle(color: Colors.black)),
                      ],
                    ),
                  ),
                );
              },
            );
          },
        );
      },
    );
  }
}
