import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Add_Data_controller extends GetxController {
  var currentPage = 0.obs;
  PageController pageController = PageController();

  void goToPage(int page) {
    currentPage.value = page;
    pageController.animateToPage(
      page,
      duration: Duration(milliseconds: 500),
      curve: Curves.easeInOut,
    );
  }
}
