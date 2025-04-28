import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:dio/dio.dart';
import 'package:vms_school/main.dart';
import 'package:vms_school/view/website/Home.dart';

class ErrorHandler {
  static void handleDioError(DioException error) {
    if (error.response?.statusCode == 401) {
      _clearSessionAndRedirect();
      return;
    }

    String message = _getErrorMessage(error);
    _showErrorSnackbar(message);
  }

  static void handleException(Exception e) {
    String message = "حدث خطأ أثناء معالجة الطلب. يرجى المحاولة لاحقًا.";
    _showErrorSnackbar(message);
  }

  static Future<void> _clearSessionAndRedirect() async {
    await prefs?.clear();
    Get.offAllNamed('/home');
    ErrorMessage("انتهت صلاحية الجلسة قم بتسجيل الدخول مرة اخرى");
  }

  static String _getErrorMessage(DioException error) {
    if (error.type == DioExceptionType.badResponse) {
      final statusCode = error.response?.statusCode ?? 0;
      return _getMessageForStatusCode(statusCode);
    }

    return _getMessageForErrorType(error.type);
  }

  static String _getMessageForStatusCode(int statusCode) {
    switch (statusCode) {
      case 232:
        return "عذرا لقد تم رفع الحضور لهذا اليوم سابقاً.";
      case 400:
        return "طلب غير صحيح. يرجى المحاولة مرة أخرى.";
      case 401:
        return "غير مصرح لك بالوصول. يرجى تسجيل الدخول.";
      case 402:
        return "محجوزة للطلبات المدفوعة.";
      case 403:
        return "تم رفض الوصول. ليس لديك الصلاحيات اللازمة.";
      case 404:
        return "المورد المطلوب غير موجود.";
      case 412:
        return "اسم المستخدم موجود بالفعل";
      case 409:
        return "لا تسمح بتداخل التواريخ";
      case 416:
        return "نطاق البيانات المطلوب غير متاح.";
      case 418:
        return "حدث خطأ في ارسال البيانات.";
      case 422:
        return "لا يمكن معالجة البيانات المرسلة.";
      case 430:
        return "المدرس لديه حصة اخرى في هذا الوقت.";
      case 431:
        return "عذرا هذه الخانة تحتوي على حصة سابقة.";
      case 450:
        return "لا يمكن تكرار نفس الاسم";
      case 500:
        return "حدث خطأ داخلي في الخادم. يرجى المحاولة لاحقًا.";
      case 503:
        return "الخدمة غير متوفرة حاليًا. حاول لاحقًا.";
      default:
        return "حدث خطأ غير متوقع برمز: $statusCode. يرجى المحاولة لاحقًا.";
    }
  }

  static String _getMessageForErrorType(DioExceptionType type) {
    switch (type) {
      case DioExceptionType.connectionTimeout:
        return "انتهى وقت الاتصال بالخادم. يرجى التحقق من اتصالك.";
      case DioExceptionType.sendTimeout:
        return "انتهى وقت إرسال الطلب. حاول مرة أخرى.";
      case DioExceptionType.receiveTimeout:
        return "انتهى وقت استلام الرد من الخادم. حاول مرة أخرى.";
      case DioExceptionType.cancel:
        return "تم إلغاء الطلب. حاول مرة أخرى.";
      default:
        return "حدث خطأ أثناء معالجة الطلب. يرجى المحاولة لاحقًا.";
    }
  }

  static void _showErrorSnackbar(String message) {
    if (Get.isSnackbarOpen) return;

    ErrorMessage(message);
  }
}

void ErrorMessage(String message) {
  final double fixedWidth = 350.0;

  Get.showSnackbar(
    GetSnackBar(
      title: null,
      message: null,
      snackPosition: SnackPosition.TOP,
      backgroundColor: Colors.red[700]!,
      duration: const Duration(seconds: 3),
      borderRadius: 5.0,
      margin: const EdgeInsets.only(top: 10, right: 10),
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
      animationDuration: const Duration(milliseconds: 500),
      forwardAnimationCurve: Curves.easeOutCubic,
      reverseAnimationCurve: Curves.easeInCubic,
      isDismissible: true,
      dismissDirection: DismissDirection.horizontal,
      icon: Padding(
        padding: const EdgeInsets.only(left: 10),
        child: IconButton(
          icon: const Icon(Icons.close, size: 20, color: Colors.white),
          onPressed: () => Get.back(),
        ),
      ),
      mainButton: null,
      onTap: (snack) => Get.back(),
      shouldIconPulse: false,
      barBlur: 0,
      overlayBlur: 0,
      snackStyle: SnackStyle.FLOATING,
      maxWidth: fixedWidth,
      messageText: Container(
        constraints: BoxConstraints(
          maxHeight: 14.0 * 1.4 * 10,
        ),
        width: fixedWidth - 40,
        padding: const EdgeInsets.symmetric(horizontal: 8),
        child: SingleChildScrollView(
          child: Text(
            message,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 14,
              height: 1.4,
            ),
            textAlign: TextAlign.center,
            softWrap: true,
            overflow: TextOverflow.ellipsis,
            maxLines: 10,
          ),
        ),
      ),
      boxShadows: [
        BoxShadow(
          color: Colors.black.withOpacity(0.2),
          blurRadius: 8,
          spreadRadius: 1,
          offset: const Offset(0, 2),
        ),
      ],
    ),
  );
}
