import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ButtonAuth extends StatelessWidget {
  String text;
  VoidCallback onpressed;
  ButtonAuth({super.key, required this.text, required this.onpressed});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          MaterialButton(
            color: Get.theme.primaryColor,
            height: 60,
              minWidth: 200,
              splashColor:Get.theme.primaryColor,
             shape: RoundedRectangleBorder(
                 borderRadius: BorderRadius.circular(5),
             ),
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
