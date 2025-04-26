import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EnrollController extends GetxController {
  final List<String> images = [
    "assets/images/Enroll_Images/1.jpg",
    "assets/images/Enroll_Images/2.jpg",
    "assets/images/Enroll_Images/3.jpg",
    "assets/images/Enroll_Images/4.jpg",
    "assets/images/Enroll_Images/5.jpg",
  ];
//
//   var currentPage = 0.obs;
//   Timer? _timer;
//   late PageController pageController;
//
//   @override
//   void onInit() {
//     pageController = PageController();
//     super.onInit();
//     _precacheImages(); // تحميل الصور مسبقاً
//     WidgetsBinding.instance.addPostFrameCallback((_) {
//       startAutoSlide();
//     });
//   }
//
//   Future<void> _precacheImages() async {
//     for (var imagePath in images) {
//       await precacheImage(AssetImage(imagePath), Get.context!);
//     }
//   }
//
//   @override
//   void onClose() {
//     _timer?.cancel();
//     pageController.dispose();
//     super.onClose();
//   }
//
//   void startAutoSlide() {
//     _timer = Timer.periodic(const Duration(seconds: 5), (timer) {
//       nextPage();
//     });
//   }
//
//   void nextPage() {
//     final nextPage = currentPage.value + 1;
//     if (nextPage < images.length) {
//       currentPage.value = nextPage;
//     } else {
//       currentPage.value = 0;
//     }
//     pageController.animateToPage(
//       currentPage.value,
//       duration: const Duration(milliseconds: 800),
//       curve: Curves.easeInOut,
//     );
//   }
}
