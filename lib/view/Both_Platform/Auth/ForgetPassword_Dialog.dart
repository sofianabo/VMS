import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vms_school/Link/API/AuthAPI/ForgetPassword_API.dart';
import 'package:vms_school/view/Both_Platform/Auth/Virifing_Password_Dialog.dart';
import 'package:vms_school/view/Both_Platform/widgets/ButtonsDialog.dart';
import 'package:vms_school/view/Both_Platform/widgets/TextFildWithUpper.dart';
import 'package:vms_school/view/Both_Platform/widgets/VMSAlertDialog.dart';

class ForgetPassword extends StatefulWidget {
  const ForgetPassword({super.key});

  @override
  State<ForgetPassword> createState() => _ForgetPasswordState();
}

enum LoadingStatus { loading, error, normal }

class _ForgetPasswordState extends State<ForgetPassword> {
  LoadingStatus isLoading = LoadingStatus.normal;
  TextEditingController username = TextEditingController();
  @override
  Widget build(BuildContext context) {
    void validateEmail() async {
      setState(() {
        isLoading = LoadingStatus.loading;
      });

      var response =
          await Forget_Password_API().Forget_Password(username: username.text);

      int? responseCode = response.statusCode;
      var data = response.data;

      if (responseCode == 200) {
        Get.back();
        Get.dialog(
            barrierDismissible: false,
            Virifing_Password_Dialog(
              username: username.text,
              email: data['email'],
            ));
        isLoading = LoadingStatus.normal;
      } else if (responseCode == 250) {
        setState(() {
          isLoading = LoadingStatus.error;
        });
      } else {
        setState(() {
          isLoading = LoadingStatus.normal;
        });
      }
    }

    return VMSAlertDialog(
        action: [],
        contents: Container(
          width: 320,
          child: Wrap(
              spacing: 15.0,
              crossAxisAlignment: WrapCrossAlignment.center,
              alignment: WrapAlignment.center,
              children: [
                Textfildwithupper(
                    width: 300,
                    onChanged: (p0) {
                      setState(() {
                        isLoading = LoadingStatus.normal;
                      });
                    },
                    isRequired: true,
                    controller: username,
                    Uptext: "Username".tr,
                    hinttext: "Username".tr),
                Padding(
                  padding: const EdgeInsets.only(top: 8.0),
                  child: isLoading == LoadingStatus.normal
                      ? ButtonDialog(
                          width: 100,
                          color: username.text.isNotEmpty
                              ? Get.theme.primaryColor
                              : Get.theme.disabledColor,
                          text: "Search".tr,
                          onPressed: () {
                            if (username.text.isNotEmpty) {
                              validateEmail();
                            }
                          },
                        )
                      : isLoading == LoadingStatus.loading
                          ? Container(
                              width: 100,
                              height: 40,
                              decoration: BoxDecoration(
                                color: Get.theme.primaryColor,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(5)),
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  SizedBox(
                                    width: 20, // تحديد العرض
                                    height: 20, // تحديد الارتفاع
                                    child: CircularProgressIndicator(
                                      color: Colors.white,
                                      strokeWidth: 2, // لتقليل سمك الحلقة
                                    ),
                                  ),
                                ],
                              ),
                            )
                          : GestureDetector(
                              onTap: () {
                                if (username.text.isNotEmpty &&
                                    isLoading == LoadingStatus.normal) {
                                  validateEmail();
                                }
                              },
                              child: Container(
                                padding: EdgeInsets.only(left: 8.0, right: 8.0),
                                height: 40,
                                decoration: BoxDecoration(
                                    color: Colors.redAccent,
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(5))),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  mainAxisSize: MainAxisSize.min,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  spacing: 5.0,
                                  children: [
                                    Text(
                                      "Username not found".tr,
                                      style: TextStyle(color: Colors.white),
                                    ),
                                    Icon(
                                      Icons.error,
                                      color: Colors.white,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                )
              ]),
        ),
        apptitle: "Find Your Account".tr,
        subtitle: "none");
  }
}
