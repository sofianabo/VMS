import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

Widget VMSAlertDialog({
  required List<Widget> action,
  required Widget contents,
  required String apptitle,
  required String subtitle,
}) {
  return BackdropFilter(
    filter: ImageFilter.blur(sigmaX: 2, sigmaY: 2), // Keep the blur effect
    child: AlertDialog(
      actions: action,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(5),
      ),
      surfaceTintColor: Colors.transparent,
      insetPadding: EdgeInsets.zero,
      titlePadding: EdgeInsets.zero,

      contentPadding: EdgeInsets.all(35.0),
      actionsPadding: EdgeInsets.all(15.0),
      content: contents,
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(right: 35.0, left: 35.0, top: 20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  apptitle,
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, wordSpacing: 2.5),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 5.0),
                  child: Text(
                    subtitle,
                    style: TextStyle(fontSize: 16),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(5.0),
            child: IconButton(
              color: Colors.white,
              focusColor: Colors.white,
              hoverColor: Colors.white,
              splashColor: Colors.white,
              onPressed: () {
                Get.back();
              },
              icon: Icon(Icons.close_rounded, color: Colors.black),
            ),
          ),
        ],
      ),
    ),
  );
}