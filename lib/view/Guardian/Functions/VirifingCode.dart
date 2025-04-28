import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vms_school/Link/API/API.dart';
import 'package:vms_school/Link/API/Error_API.dart';
import 'package:vms_school/Link/API/Guardians_API/Guardians_Verifing_API.dart';
import 'package:vms_school/widgets/ButtonsDialog.dart';

class GuaVerifingDialog extends StatefulWidget {
  String email;
  String data;

  GuaVerifingDialog({super.key, required this.email, required this.data});
  @override
  _GuaVerifingDialogState createState() => _GuaVerifingDialogState();
}

enum LoadingStatus { loading, done, normal }

class _GuaVerifingDialogState extends State<GuaVerifingDialog> {
  final TextEditingController controller1 = TextEditingController();
  final TextEditingController controller2 = TextEditingController();
  final TextEditingController controller3 = TextEditingController();
  final TextEditingController controller4 = TextEditingController();
  final TextEditingController controller5 = TextEditingController();
  final TextEditingController controller6 = TextEditingController();

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
  LoadingStatus isEmailLoading = LoadingStatus.normal;

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

  // This method validates the code and handles the "Enter" key press.
  void validateCode({required String data}) async {
    setState(() {
      showError = controllers.any((controller) => controller.text.isEmpty);
    });

    if (!showError) {
      setState(() {
        isLoading = LoadingStatus.loading;
      });
      String code = controllers.map((controller) => controller.text).join();
      if (await Verify_Gua_API().Verify_Account(
              email: widget.email, code: code, enroll_token: data) ==
          200) {
        setState(() {
          isLoading = LoadingStatus.done;
          Get.back();
        });
      } else {
        setState(() {
          isLoading = LoadingStatus.normal;
        });
      }
    }
  }

  Resend_Verifying_Code(String data) async {
    Dio dio = Dio();
    String myURI = "$hostPort$resendCodeGurdian";
    try {
      var response = await dio.post(data: {"enroll_token": data}, myURI);
      if (response.statusCode == 200) {
      } else {
        ErrorHandler.handleDioError(DioException(
          requestOptions: response.requestOptions,
          response: response,
          type: DioExceptionType.badResponse,
        ));
      }
      return response.statusCode;
    } catch (e) {}
  }

  void SendEmailCode({required String data}) async {
    setState(() {
      isEmailLoading = LoadingStatus.loading;
    });
    if (await Resend_Verifying_Code(data) == 200) {
      setState(() {
        isEmailLoading = LoadingStatus.normal;
      });
    } else {
      setState(() {
        isEmailLoading = LoadingStatus.normal;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.ltr,
      child: AlertDialog(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(10))),
        content: Container(
          width: 400,
          height: 150,
          child: Column(
            children: [
              Row(
                children: [
                  const Text("Enter Verification Code Sent to:"),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(top: 15.0, bottom: 30.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text("${widget.email}"),
                    if (isEmailLoading == LoadingStatus.normal)
                      GestureDetector(
                        onTap: () {
                          SendEmailCode(data: widget.data);
                        },
                        child: Text(
                          "Resend!",
                          style: TextStyle(
                            decoration: TextDecoration.underline,
                            color: Get.theme.primaryColor,
                          ),
                        ),
                      ),
                    if (isEmailLoading == LoadingStatus.loading)
                      Container(
                        width: 20,
                        height: 20,
                        child: CircularProgressIndicator(),
                      ),
                  ],
                ),
              ),
              Row(
                spacing: 10.0,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  buildTextFormField(controller1, focusNode1, 0, focusNode2),
                  buildTextFormField(controller2, focusNode2, 1, focusNode3),
                  buildTextFormField(controller3, focusNode3, 2, focusNode4),
                  buildTextFormField(controller4, focusNode4, 3, focusNode5),
                  buildTextFormField(controller5, focusNode5, 4, focusNode6),
                  buildTextFormField(controller6, focusNode6, 5, null),
                ],
              ),
            ],
          ),
        ),
        actions: [
          isLoading == LoadingStatus.normal
              ? ButtonDialog(
                  width: 120,
                  color: Get.theme.primaryColor,
                  text: "Verify",
                  onPressed: () {
                    validateCode(data: '${widget.data}');
                  },
                )
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
                  : Container(
                      width: 120,
                      height: 40,
                      decoration: BoxDecoration(
                          color: Get.theme.primaryColor,
                          borderRadius: BorderRadius.all(Radius.circular(5))),
                      child: Icon(
                        Icons.done,
                        color: Colors.white,
                      ),
                    ),
          GestureDetector(
            onTap: () async {
              Get.back();
            },
            child: Row(
              children: [
                Icon(Icons.close_sharp, size: 14, color: Color(0xffB03D3D)),
                SizedBox(width: 8),
                Text(
                  style: TextStyle(fontSize: 12, color: Color(0xffB03D3D)),
                  "Stop Completion and Verification".tr,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget buildTextFormField(TextEditingController controller,
      FocusNode focusNode, int index, FocusNode? nextFocusNode) {
    return SizedBox(
      width: 40,
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
        },
        onEditingComplete: () {
          validateCode(data: '${widget.data}');
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
