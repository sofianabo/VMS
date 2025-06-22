import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vms_school/Theme/themeController.dart';

Widget VMSAlertDialog({
  required List<Widget> action,
  required Widget contents,
  required String apptitle,
  required String subtitle,
}) {
  return BackdropFilter(
    filter: ImageFilter.blur(sigmaX: 2, sigmaY: 2),
    child: AlertDialog(
      actions: action,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(5),
      ),
      surfaceTintColor: Colors.transparent,
      insetPadding: EdgeInsets.zero,
      titlePadding: EdgeInsets.zero,
      contentPadding: subtitle != "none"
          ? const EdgeInsets.only(
              top: 35, left: 35.0, right: 35.0, bottom: 20.0)
          : const EdgeInsets.only(
              top: 0, left: 35.0, right: 35.0, bottom: 20.0),
      actionsPadding: action.isNotEmpty
          ? const EdgeInsets.all(15.0)
          : const EdgeInsets.all(5.0),
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
                  style: const TextStyle(fontSize: 20, wordSpacing: 2.5),
                ),
                subtitle != "none"
                    ? Padding(
                        padding: const EdgeInsets.only(top: 5.0),
                        child: Text(
                          subtitle,
                          style: const TextStyle(fontSize: 16),
                        ),
                      )
                    : const Text(""),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(5.0),
            child: IconButton(
              color: Get.theme.indicatorColor,
              focusColor: Get.theme.indicatorColor,
              hoverColor: Get.theme.indicatorColor,
              splashColor: Get.theme.indicatorColor,
              onPressed: () {
                Get.back();
              },
              icon: Icon(Icons.close_rounded,
                  color: Get.theme.secondaryHeaderColor),
            ),
          ),
        ],
      ),
    ),
  );
}

Widget VMSProfileAlertDialog({
  required List<Widget> action,
  required Widget contents,
  required String apptitle,
  required String subtitle,
}) {
  return BackdropFilter(
    filter: ImageFilter.blur(sigmaX: 2, sigmaY: 2),
    child: AlertDialog(
      actions: action,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(5),
      ),
      surfaceTintColor: Colors.transparent,
      insetPadding: EdgeInsets.zero,
      titlePadding: EdgeInsets.zero,
      contentPadding: subtitle != "none"
          ? const EdgeInsets.only(top: 2, left: 2.0, right: 2.0, bottom: 2.0)
          : const EdgeInsets.only(
              top: 0, left: 35.0, right: 35.0, bottom: 20.0),
      actionsPadding: const EdgeInsets.all(15.0),
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
                  style: const TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      wordSpacing: 2.5),
                ),
                subtitle != "none"
                    ? Padding(
                        padding: const EdgeInsets.only(top: 5.0),
                        child: Text(
                          subtitle,
                          style: const TextStyle(fontSize: 16),
                        ),
                      )
                    : const Text(""),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(5.0),
            child: IconButton(
              color: Get.theme.indicatorColor,
              focusColor: Get.theme.indicatorColor,
              hoverColor: Get.theme.indicatorColor,
              splashColor: Get.theme.indicatorColor,
              onPressed: () {
                Get.back();
              },
              icon: Icon(Icons.close_rounded,
                  color: Get.theme.secondaryHeaderColor),
            ),
          ),
        ],
      ),
    ),
  );
}

Widget VMSPolicyAlertDialog({
  required Widget contents,
  required String apptitle,
}) {
  return BackdropFilter(
    filter: ImageFilter.blur(sigmaX: 2, sigmaY: 2),
    child: AlertDialog(
      actions: [],
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(5),
      ),
      surfaceTintColor: Colors.transparent,
      insetPadding: EdgeInsets.zero,
      titlePadding: EdgeInsets.zero,
      contentPadding:
          const EdgeInsets.only(top: 2, left: 2.0, right: 2.0, bottom: 2.0),
      actionsPadding: const EdgeInsets.all(15.0),
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
                  style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.normal,
                      wordSpacing: 2.5),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(5.0),
            child: IconButton(
              color: Get.theme.indicatorColor,
              focusColor: Get.theme.indicatorColor,
              hoverColor: Get.theme.indicatorColor,
              splashColor: Get.theme.indicatorColor,
              onPressed: () {
                Get.back();
              },
              icon: Icon(Icons.close_rounded,
                  color: Get.theme.secondaryHeaderColor),
            ),
          ),
        ],
      ),
    ),
  );
}
