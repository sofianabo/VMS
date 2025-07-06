import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vms_school/view/Both_Platform/widgets/Responsive.dart';

class Section6 extends StatelessWidget {
  const Section6({super.key});

  @override
  Widget build(BuildContext context) {
    double h = 640;
    double w = MediaQuery.of(context).size.width;
    return Container(
      margin: EdgeInsets.only(top: h / 17.1),
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.only(bottom: h / 34.2),
            child: Text("What Do We Do".tr,
                style: Get.theme.textTheme.titleMedium!.copyWith()),
          ),
          ResponsiveUI(
            desktopScreen: Column(
              children: [
                // النص الأول
                Container(
                  width: w / 1.7066,
                  padding: EdgeInsets.symmetric(horizontal: 40),
                  child: Text(
                    "We develop a culture of excellence that includes a robust instructional program aligned to the highest standards with a focus on implementing balanced literacy through reading and writing workshops, while cultivating competency across all subject areas."
                        .tr,
                    style: Get.theme.textTheme.bodyMedium!,
                    textAlign: TextAlign.center,
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                SizedBox(height: h / 34.2),
                // الصورة
                Container(
                  width: w / 1.7066,
                  height: h / 2.28,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(100),
                  ),
                  child: Image.asset(
                    "assets/images/section6-image1.jpg",
                    fit: BoxFit.cover,
                  ),
                ),
                // النص الثاني
                Container(
                  padding: EdgeInsets.only(top: h / 38, bottom: h / 68.4),
                  width: w / 1.7066,
                  child: Text(
                    "We are committed to developing well-rounded students who embody our core values: Be Safe, Be Respectful, Be Responsible, and Be Mindful. Our vibrant learning environment encourages discovery and creative expression, making every student feel valued.We provide our educators with robust professional development to enhance teaching practices and boost student success. Through collaboration and a community schools model, we align resources to ensure every student thrives. Join us in our journey towards excellence!"
                        .tr,
                    style: Get.theme.textTheme.bodyMedium!,
                    textAlign: TextAlign.center,
                    maxLines: 7,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ],
            ),
            tabletScreen: Column(
              children: [
                // النص الأول
                Container(
                  width: w / 1.5,
                  padding: EdgeInsets.symmetric(horizontal: 30),
                  child: Text(
                    "We develop a culture of excellence that includes a robust instructional program aligned to the highest standards with a focus on implementing balanced literacy through reading and writing workshops, while cultivating competency across all subject areas."
                        .tr,
                    style: Get.theme.textTheme.bodyMedium!,
                    textAlign: TextAlign.center,
                    maxLines: 4,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                SizedBox(height: h / 34.2),
                // الصورة
                Container(
                  width: w / 1.5,
                  height: h / 2.5,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(100),
                  ),
                  child: Image.asset(
                    "assets/images/section6-image1.jpg",
                    fit: BoxFit.cover,
                  ),
                ),
                // النص الثاني
                Container(
                  padding: EdgeInsets.only(top: h / 38, bottom: h / 68.4),
                  width: w / 1.5,
                  child: Text(
                    "We are committed to developing well-rounded students who embody our core values: Be Safe, Be Respectful, Be Responsible, and Be Mindful. Our vibrant learning environment encourages discovery and creative expression, making every student feel valued.We provide our educators with robust professional development to enhance teaching practices and boost student success. Through collaboration and a community schools model, we align resources to ensure every student thrives. Join us in our journey towards excellence!"
                        .tr,
                    style: Get.theme.textTheme.bodyMedium!,
                    textAlign: TextAlign.center,
                    maxLines: 8,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ],
            ),
            mobileScreen: Column(
              children: [
                // النص الأول
                Container(
                  width: w - 40,
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: Text(
                    "We develop a culture of excellence that includes a robust instructional program aligned to the highest standards with a focus on implementing balanced literacy through reading and writing workshops, while cultivating competency across all subject areas."
                        .tr,
                    style: Get.theme.textTheme.bodyMedium!,
                    textAlign: TextAlign.center,
                    maxLines: 5,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                SizedBox(height: 20),
                // الصورة
                Container(
                  width: w - 40,
                  height: 300,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(100),
                  ),
                  child: Image.asset(
                    "assets/images/section6-image1.jpg",
                    fit: BoxFit.cover,
                  ),
                ),
                // النص الثاني
                Container(
                  padding: EdgeInsets.only(top: 20, bottom: 20),
                  width: w - 40,
                  child: Text(
                    "We are committed to developing well-rounded students who embody our core values: Be Safe, Be Respectful, Be Responsible, and Be Mindful. Our vibrant learning environment encourages discovery and creative expression, making every student feel valued.We provide our educators with robust professional development to enhance teaching practices and boost student success. Through collaboration and a community schools model, we align resources to ensure every student thrives. Join us in our journey towards excellence!"
                        .tr,
                    style: Get.theme.textTheme.bodyMedium!,
                    textAlign: TextAlign.center,
                    maxLines: 10,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
