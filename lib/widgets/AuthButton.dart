import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ButtonAuth extends StatelessWidget {
  String text;
  VoidCallback onpressed;
  ButtonAuth({super.key, required this.text, required this.onpressed});

  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;
    return Container(
      height: h / 10.532,
      width: w / 4.671,
      decoration: BoxDecoration(
          color: Get.theme.colorScheme.primary,
          borderRadius: BorderRadius.circular(10)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          MaterialButton(
              onPressed: onpressed,
              child: Row(
                children: [
                  Text(
                    text,
                    style: Get.theme.primaryTextTheme.headlineSmall!
                        .copyWith(fontSize: 15),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 8.0 , right: 8.0),
                    child: Icon(
                      Icons.login,
                      color: Colors.white,
                      size: 17,
                    ),
                  ),
                ],
              )),
        ],
      ),
    );
  }
}
