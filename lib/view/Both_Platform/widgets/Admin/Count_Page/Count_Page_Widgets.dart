import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CountUpPage extends StatelessWidget {
  final int count;
  final int index;

  const CountUpPage({super.key, required this.count, required this.index});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width * 0.37;

    // حجم كل دائرة
    const double circleWidth = 50;

    // عدد الـ dividers
    final int dividerCount = count - 1;

    // الحجم الإجمالي للدوائر
    final double totalCirclesWidth = count * circleWidth;

    // المساحة المتبقية للشاشة (مع مراعاة حافة بسيطة)
    final double remainingWidth = screenWidth - totalCirclesWidth - 32;

    // عرض كل Divider (أقل شيء 20 مثلاً، أو حسب ما يتوفر)
    final double dividerWidth =
        dividerCount > 0 ? remainingWidth / dividerCount : 0;

    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: List.generate(count * 2 - 1, (i) {
          if (i.isOdd) {
            // Divider
            final dividerIndex = i ~/ 2;
            final isActive = dividerIndex < index;

            return AnimatedContainer(
              curve: Curves.easeInOut,
              duration: Duration(milliseconds: 250),
              width: dividerWidth > 0 ? dividerWidth : 20,
              height: 4,
              color: isActive ? Get.theme.primaryColor : Colors.grey[400],
            );
          } else {
            final stepIndex = i ~/ 2;
            final isActive = stepIndex <= index;
            return AnimatedContainer(
              curve: Curves.easeInOut,
              duration: Duration(milliseconds: 500),
              width: circleWidth,
              height: circleWidth,
              decoration: BoxDecoration(
                color: isActive ? Get.theme.primaryColor : Colors.grey[400],
                shape: BoxShape.circle,
              ),
              alignment: Alignment.center,
              child: Text(
                '${stepIndex + 1}',
                style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            );
          }
        }),
      ),
    );
  }
}
