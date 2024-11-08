// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx/widgets/DropDown.dart';

class AppbarCustom extends StatelessWidget {
  const AppbarCustom({super.key});

  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;
    return Container(
      height: h / 6.84,
      margin: EdgeInsets.only(right: w / 21.33, left: w / 42.66),
      width: w,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              DropDown(
                  title: "Select Language",
                  width: w / 7.11,
                  options: ['en', 'ar']),
              Container(
                width: w / 15.8,
                height: h / 28.5,
                child: MaterialButton(
                  onPressed: () {},
                  child: Text(
                    "Classes",
                    style: Get.theme.primaryTextTheme.titleSmall,
                  ),
                ),
              ),
              Container(
                width: w / 15.8,
                height: h / 28.5,
                child: MaterialButton(
                  onPressed: () {},
                  child: Text(
                    "Courses",
                    style: Get.theme.primaryTextTheme.titleSmall,
                  ),
                ),
              ),
              Container(
                width: w / 15.8,
                height: h / 28.5,
                child: MaterialButton(
                  onPressed: () {},
                  child: Text(
                    "News",
                    style: Get.theme.primaryTextTheme.titleSmall,
                  ),
                ),
              ),
              Container(
                width: w / 15.8,
                height: h / 28.5,
                child: MaterialButton(
                  onPressed: () {},
                  child: Text(
                    "About Us",
                    style: Get.theme.primaryTextTheme.titleSmall,
                  ),
                ),
              ),
              Container(
                width: w / 15.8,
                height: h / 28.5,
                child: MaterialButton(
                  onPressed: () {},
                  child: Text(
                    "Contact Us",
                    style: Get.theme.primaryTextTheme.titleSmall,
                  ),
                ),
              ),
            ],
          ),
          SizedBox(
            height: h / 1.71,
            width: w / 2.56,
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
