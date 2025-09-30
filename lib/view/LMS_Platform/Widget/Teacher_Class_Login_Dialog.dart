import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vms_school/Link/API/LMS_APIs/Admin/Login_Teacher_API.dart';
import 'package:vms_school/Link/Controller/LMS_Controllers/Admin_LMS/Selected_Screen.dart';
import 'package:vms_school/view/Both_Platform/widgets/ButtonsDialog.dart';
import 'package:vms_school/view/Both_Platform/widgets/TextFildWithUpper.dart';
import 'package:vms_school/view/Both_Platform/widgets/VMSAlertDialog.dart';

class Teacher_Class_Login_Dialog extends StatefulWidget {
  const Teacher_Class_Login_Dialog({super.key});

  @override
  State<Teacher_Class_Login_Dialog> createState() =>
      _Teacher_Class_Login_DialogState();
}

enum LoadingStatus { loading, error, normal }

class _Teacher_Class_Login_DialogState
    extends State<Teacher_Class_Login_Dialog> {
  LoadingStatus isLoading = LoadingStatus.normal;
  TextEditingController username = TextEditingController();
  TextEditingController password = TextEditingController();

  Selected_Class_Controller SC_Controller =
      Get.find<Selected_Class_Controller>();

  @override
  Widget build(BuildContext context) {
    void validateEmail() async {
      setState(() {
        isLoading = LoadingStatus.loading;
      });

      var response = await Teacher_Login_By_Class_API().Teacher_Login_By_Class(
          username: username.text, password: password.text);

      int? responseCode = response.statusCode;
      var data = response.data;

      if (responseCode == 200) {
        // أغلق الديالوغ
        Get.back();

        // حفظ بيانات المعلم
        SC_Controller.setTeacherData(
            fullName: data["fullName"],
            imageId: data["imageId"],
            teacherId: data["teacherId"]);

        // بدء الجلسة (ساعة) + تخزين وقت الانتهاء
        SC_Controller.startTimer(durationSeconds: 3600);

        setState(() {
          isLoading = LoadingStatus.normal;
        });
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
              hinttext: "Username".tr,
            ),
            Textfildwithupper(
              width: 300,
              onChanged: (p0) {
                setState(() {
                  isLoading = LoadingStatus.normal;
                });
              },
              isRequired: true,
              controller: password,
              Uptext: "Password".tr,
              hinttext: "Password".tr,
            ),
            Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: isLoading == LoadingStatus.normal
                  ? ButtonDialog(
                      width: 100,
                      color:
                          username.text.isNotEmpty && password.text.isNotEmpty
                              ? Get.theme.primaryColor
                              : Get.theme.disabledColor,
                      text: "Login".tr,
                      onPressed: () {
                        if (username.text.isNotEmpty &&
                            password.text.isNotEmpty) {
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
                            borderRadius: const BorderRadius.all(
                              Radius.circular(5),
                            ),
                          ),
                          child: const Center(
                            child: SizedBox(
                              width: 20,
                              height: 20,
                              child: CircularProgressIndicator(
                                color: Colors.white,
                                strokeWidth: 2,
                              ),
                            ),
                          ),
                        )
                      : GestureDetector(
                          onTap: () {
                            if (username.text.isNotEmpty &&
                                password.text.isNotEmpty &&
                                isLoading == LoadingStatus.normal) {
                              validateEmail();
                            }
                          },
                          child: Container(
                            padding: const EdgeInsets.symmetric(horizontal: 8),
                            height: 40,
                            decoration: const BoxDecoration(
                              color: Colors.redAccent,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(5)),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              mainAxisSize: MainAxisSize.min,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text(
                                  "Un valued information".tr,
                                  style: const TextStyle(color: Colors.white),
                                ),
                                const SizedBox(width: 5),
                                const Icon(
                                  Icons.error,
                                  color: Colors.white,
                                ),
                              ],
                            ),
                          ),
                        ),
            )
          ],
        ),
      ),
      apptitle: "Login Your Account".tr,
      subtitle: "none",
    );
  }
}
