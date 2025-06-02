import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vms_school/Link/API/AuthAPI/LoginAPI.dart';
import 'package:vms_school/Link/API/AuthAPI/Virify_Password_API.dart';
import 'package:vms_school/Link/Controller/AuthController/UserController.dart';
import 'package:vms_school/view/Both_Platform/widgets/ButtonsDialog.dart';
import 'package:vms_school/view/Both_Platform/widgets/TextFildWithUpper.dart';
import 'package:vms_school/view/Both_Platform/widgets/VMSAlertDialog.dart';

class Virifing_Password_Dialog extends StatefulWidget {
  Virifing_Password_Dialog(
      {required this.username, required this.email, super.key});
  String username;
  String email;
  @override
  State<Virifing_Password_Dialog> createState() =>
      _Virifing_Password_Dialog_State();
}

enum LoadingStatus { loading, done, normal, error }

class _Virifing_Password_Dialog_State extends State<Virifing_Password_Dialog> {
  final TextEditingController controller1 = TextEditingController();
  final TextEditingController controller2 = TextEditingController();
  final TextEditingController controller3 = TextEditingController();
  final TextEditingController controller4 = TextEditingController();
  final TextEditingController controller5 = TextEditingController();
  final TextEditingController controller6 = TextEditingController();
  final TextEditingController password = TextEditingController();
  final TextEditingController confirmPassword = TextEditingController();

  final FocusNode focusNode1 = FocusNode();
  final FocusNode focusNode2 = FocusNode();
  final FocusNode focusNode3 = FocusNode();
  final FocusNode focusNode4 = FocusNode();
  final FocusNode focusNode5 = FocusNode();
  final FocusNode focusNode6 = FocusNode();
  List<TextEditingController> controllers = [];
  List<FocusNode> focusNodes = [];
  bool showError = false;
  LoadingStatus isLoading = LoadingStatus.normal;

  @override
  void initState() {
    super.initState();
    controllers.addAll([
      controller1,
      controller2,
      controller3,
      controller4,
      controller5,
      controller6
    ]);
    focusNodes.addAll([
      focusNode1,
      focusNode2,
      focusNode3,
      focusNode4,
      focusNode5,
      focusNode6
    ]);

    WidgetsBinding.instance.addPostFrameCallback((_) {
      FocusScope.of(context).requestFocus(focusNode1);
    });
  }

  void validateCode() async {
    setState(() {
      showError = controllers.any((controller) => controller.text.isEmpty);
    });

    if (!showError) {
      setState(() {
        isLoading = LoadingStatus.loading;
      });
      String code = controllers.map((controller) => controller.text).join();
      var response = await Virifing_Password_API().Virifing_Password(
          password: password.text, username: widget.username, code: code);

      if (response == 200) {
        LoginAPI(context).login(widget.username, password.text, isrepass: true);
      } else if (response == 412) {
        setState(() {
          FocusScope.of(context).requestFocus(focusNode6);
          isLoading = LoadingStatus.error;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<UserController>(builder: (controller) {
      return VMSAlertDialog(
          action: [
            isLoading == LoadingStatus.normal
                ? ButtonDialog(
                    width: 120,
                    color: Get.theme.primaryColor,
                    text: "Done".tr,
                    onPressed: () {
                      bool ispassword = password.text.isEmpty;
                      bool iscpassword = confirmPassword.text.isEmpty;
                      bool isConfirmPasswordValid =
                          confirmPassword.text != password.text;

                      controller.updateFieldError("password", ispassword);
                      controller.updateFieldError(
                          "cpassword", iscpassword || isConfirmPasswordValid);

                      if (!(ispassword ||
                          iscpassword ||
                          isConfirmPasswordValid)) {
                        validateCode();
                      }
                    })
                : isLoading == LoadingStatus.loading
                    ? Container(
                        width: 120,
                        height: 40,
                        decoration: BoxDecoration(
                          color: Get.theme.primaryColor,
                          borderRadius: BorderRadius.all(Radius.circular(5)),
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
                    : isLoading == LoadingStatus.error
                        ? Container(
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
                                  "Error Code".tr,
                                  style: TextStyle(color: Colors.white),
                                ),
                                Icon(
                                  Icons.error,
                                  color: Colors.white,
                                ),
                              ],
                            ),
                          )
                        : Container(
                            width: 120,
                            height: 40,
                            decoration: BoxDecoration(
                                color: Get.theme.primaryColor,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(5))),
                            child: Icon(
                              Icons.done,
                              color: Colors.white,
                            ),
                          ),
          ],
          contents: Container(
            width: 400,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              spacing: 15.0,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  spacing: 7.0,
                  children: [
                    Text("Enter Verification Code Sent to:".tr),
                    Text("${widget.email}"),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 15.0),
                  child: Directionality(
                    textDirection: TextDirection.ltr,
                    child: Row(
                      spacing: 10.0,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        buildTextFormField(
                            controller1, focusNode1, 0, focusNode2),
                        buildTextFormField(
                            controller2, focusNode2, 1, focusNode3),
                        buildTextFormField(
                            controller3, focusNode3, 2, focusNode4),
                        buildTextFormField(
                            controller4, focusNode4, 3, focusNode5),
                        buildTextFormField(
                            controller5, focusNode5, 4, focusNode6),
                        buildTextFormField(controller6, focusNode6, 5, null),
                      ],
                    ),
                  ),
                ),
                Textfildwithupper(
                    onChanged: (value) {
                      if (value.isNotEmpty) {
                        controller.updateFieldError("password", false);
                      }
                    },
                    isError: controller.IsPasswordError,
                    IconButton: IconButton(
                        onPressed: () {
                          controller.ChangeShowPassword(
                              !controller.ShowPassword);
                        },
                        icon: Icon(
                          controller.ShowPassword
                              ? Icons.visibility_off
                              : Icons.remove_red_eye_outlined,
                          color: Theme.of(context).textTheme.bodySmall!.color,
                        )),
                    hidePassword: controller.ShowPassword,
                    isRequired: true,
                    fieldType: "password",
                    width: 350,
                    controller: password,
                    Uptext: "New Password".tr,
                    hinttext: "New Password".tr),
                Textfildwithupper(
                    customErrorMessage: confirmPassword.text.trim() != "" &&
                            confirmPassword.text.isNotEmpty
                        ? "كلمات المرور غير متطابقة"
                        : "لا يمكن ترك الحقل فارغ",
                    width: 350,
                    onChanged: (value) {
                      if (value.isNotEmpty) {
                        controller.updateFieldError("cpassword", false);
                      }
                    },
                    isError: controller.IsCPasswordError,
                    fieldType: "password",
                    IconButton: IconButton(
                        onPressed: () {
                          controller.ChangeShowConfirmPassword(
                              !controller.ShowConfirmPassword);
                        },
                        icon: Icon(
                          controller.ShowConfirmPassword
                              ? Icons.visibility_off
                              : Icons.remove_red_eye_outlined,
                          color: Theme.of(context).textTheme.bodySmall!.color,
                        )),
                    hidePassword: controller.ShowConfirmPassword,
                    isRequired: true,
                    controller: confirmPassword,
                    hinttext: "Confirm New Password".tr,
                    Uptext: "Confirm New Password".tr),
              ],
            ),
          ),
          apptitle: "Change Password".tr,
          subtitle: "none");
    });
  }

  Widget buildTextFormField(TextEditingController controller,
      FocusNode focusNode, int index, FocusNode? nextFocusNode) {
    return SizedBox(
      width: MediaQuery.of(context).size.width >= 407 ? 50 : 40,
      child: TextFormField(
        controller: controller,
        focusNode: focusNode,
        keyboardType: TextInputType.number,
        textAlign: TextAlign.center,
        maxLength: 1,
        decoration: InputDecoration(
          counterText: '',
          filled: true,
          // Set border color to red if there is an error (empty text field)
          focusedBorder: showError && controller.text.isEmpty
              ? OutlineInputBorder(borderSide: BorderSide(color: Colors.red))
              : OutlineInputBorder(borderSide: BorderSide(color: Colors.grey)),
          enabledBorder: showError && controller.text.isEmpty
              ? OutlineInputBorder(borderSide: BorderSide(color: Colors.red))
              : OutlineInputBorder(borderSide: BorderSide(color: Colors.grey)),
        ),
        onChanged: (value) {
          if (value.isNotEmpty && nextFocusNode != null) {
            FocusScope.of(context).requestFocus(nextFocusNode);
          } else if (value.isEmpty && index != 0) {
            FocusScope.of(context).requestFocus(focusNodes[index - 1]);
          }
          if (isLoading != LoadingStatus.loading) {
            setState(() {
              isLoading = LoadingStatus.normal;
            });
          }
        },
        onEditingComplete: () {
          validateCode();
        },
        onTap: () {
          if (index != 0) {
            FocusScope.of(context).requestFocus(focusNode1);
          }
        },
      ),
    );
  }
}
