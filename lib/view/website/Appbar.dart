// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx/widgets/DropDown.dart';

class AppbarCustom extends StatelessWidget {
  const AppbarCustom({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      margin: const EdgeInsets.only(right: 60, left: 30),
      width: MediaQuery.of(context).size.width,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              DropDown(
                  title: "Select Language", width: 180, options: ['en', 'ar']),
              MaterialButton(
                onPressed: () {},
                child: Text(
                  "Classes",
                  style: Get.theme.primaryTextTheme.titleSmall,
                ),
              ),
              MaterialButton(
                onPressed: () {},
                child: Text(
                  "Courses",
                  style: Get.theme.primaryTextTheme.titleSmall,
                ),
              ),
              MaterialButton(
                onPressed: () {},
                child: Text(
                  "News",
                  style: Get.theme.primaryTextTheme.titleSmall,
                ),
              ),
              MaterialButton(
                onPressed: () {},
                child: Text(
                  "About Us",
                  style: Get.theme.primaryTextTheme.titleSmall,
                ),
              ),
              MaterialButton(
                onPressed: () {},
                child: Text(
                  "Contact Us",
                  style: Get.theme.primaryTextTheme.titleSmall,
                ),
              ),
            ],
          ),
          SizedBox(
            height: 400,
            width: 500,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Image.asset(
                  "../../images/Logo.png",
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
