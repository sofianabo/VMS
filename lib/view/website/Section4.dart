import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Section4 extends StatelessWidget {
  const Section4({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(bottom: 15.0),
      width: Get.width/2,

      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30), color: Color(0xffeaf0ff)),
      child: Column(
        children: [
          Directionality(
              textDirection: TextDirection.ltr,
              child: Padding(
                padding: const EdgeInsets.only(top: 18.0),
                child: Text("Why Us?", style: Get.theme.primaryTextTheme.titleLarge),
              )),
          const SizedBox(
            height: 25,
          ),
          Text(
              "Virtual Modern School is an online learning platform that helps students to learn the",
              style: Get.theme.primaryTextTheme.bodySmall),
          Text(
              "Syrian Education Curriculum from home. The courses of this platform are designed",
              style: Get.theme.primaryTextTheme.bodySmall),
          Text(
              "for elementary school, middle school, and high school all in one place.",
              style: Get.theme.primaryTextTheme.bodySmall),
          const SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Container(
                padding: EdgeInsets.only(top: 10,bottom: 10.0),
                height: 220,
                width: 190,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    color: Colors.white),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Image.asset(
                      "../../images/section4-image1.png",
                      height: 90,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text("Improving educational",
                        style: Get.theme.primaryTextTheme.bodySmall),
                    Text("Skills", style: Get.theme.primaryTextTheme.bodySmall)
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.only(top: 10,bottom: 10.0),
                height: 220,
                width: 190,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    color: Colors.white),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Image.asset(
                      "../../images/section4-image2.png",
                      height: 90,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text("Smart virtual",
                        style: Get.theme.primaryTextTheme.bodySmall),
                    Text("meeting",
                        style: Get.theme.primaryTextTheme.bodySmall)
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.only(top: 10,bottom: 10.0),
                height: 220,
                width: 190,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    color: Colors.white),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Image.asset(
                      "../../images/section4-image3.png",
                      height: 90,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text("Outstanding",
                        style: Get.theme.primaryTextTheme.bodySmall),
                    Text("user - friendliness",
                        style: Get.theme.primaryTextTheme.bodySmall)
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Container(
                padding: EdgeInsets.only(top: 10,bottom: 10.0),
                height: 220,
                width: 190,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    color: Colors.white),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Image.asset(
                      "../../images/section4-image4.png",
                      height: 90,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text("Instant live",
                        style: Get.theme.primaryTextTheme.bodySmall),
                    Text("Lessons",
                        style: Get.theme.primaryTextTheme.bodySmall)
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.only(top: 10,bottom: 10.0),
                height: 220,
                width: 190,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    color: Colors.white),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Image.asset(
                      "../../images/section4-image5.png",
                      height: 90,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text("Focus on results",
                        style: Get.theme.primaryTextTheme.bodySmall)
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.only(top: 10,bottom: 10.0),
                height: 220,
                width: 190,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    color: Colors.white),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Image.asset(
                      "../../images/section4-image6.png",
                      height: 90,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text("Multiple registration",
                        style: Get.theme.primaryTextTheme.bodySmall),
                    Text("options",
                        style: Get.theme.primaryTextTheme.bodySmall)
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
