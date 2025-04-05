import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:dio/dio.dart';
import 'package:vms_school/view/website/Home.dart';

class ErrorHandler {
  static void handleDioError(DioException error) {
    String message;

    if (error.type == DioExceptionType.badResponse) {
      int statusCode = error.response?.statusCode ?? 0;
      if (statusCode == 401) {
        Get.off(
          () => Home(),
        );
      }
      switch (statusCode) {
        case 232:
          message = "عذرا لقد تم رفع الحضور لهذا اليوم سابقاً.";
          break;
        case 400:
          message = "طلب غير صحيح. يرجى المحاولة مرة أخرى.";
          break;
        case 401:
          message = "غير مصرح لك بالوصول. يرجى تسجيل الدخول.";
          break;
        case 402:
          message = "محجوزة للطلبات المدفوعة.";
          break;
        case 403:
          message = "تم رفض الوصول. ليس لديك الصلاحيات اللازمة.";
          break;
        case 404:
          message = "المورد المطلوب غير موجود.";
          break;
        case 412:
          message = "اسم المستخدم موجود بالفعل";
          break;
        case 409:
          Get.back();
          message = "لا تسمح بتداخل التواريخ";
          ErrorMessage(message);
          break;
        case 416:
          message = "نطاق البيانات المطلوب غير متاح.";
          break;
        case 418:
          message = "حدث خطأ في ارسال البيانات.";
          break;
        case 422:
          message = "لا يمكن معالجة البيانات المرسلة.";
          break;
        case 430:
          message = "المدرس لديه حصة اخرى في هذا الوقت.";
          break;
        case 431:
          message = "عذرا هذه الخانة تحتوي على حصة سابقة.";
          break;
        case 450:
          Get.back();
          message = "لا يمكن تكرار نفس الاسم";
          ErrorMessage(message);
          break;
        case 500:
          message = "حدث خطأ داخلي في الخادم. يرجى المحاولة لاحقًا.";
          break;
        case 503:
          message = "الخدمة غير متوفرة حاليًا. حاول لاحقًا.";
          break;
        default:
          message =
              "حدث خطأ غير متوقع برمز: $statusCode. يرجى المحاولة لاحقًا.";
      }
    } else if (error.type == DioExceptionType.connectionTimeout) {
      message = "انتهى وقت الاتصال بالخادم. يرجى التحقق من اتصالك.";
    } else if (error.type == DioExceptionType.sendTimeout) {
      message = "انتهى وقت إرسال الطلب. حاول مرة أخرى.";
    } else if (error.type == DioExceptionType.receiveTimeout) {
      message = "انتهى وقت استلام الرد من الخادم. حاول مرة أخرى.";
    } else if (error.type == DioExceptionType.cancel) {
      message = "تم إلغاء الطلب. حاول مرة أخرى.";
    } else {
      message = "حدث خطأ أثناء معالجة الطلب. يرجى المحاولة لاحقًا.";
    }

    ErrorMessage(message);
  }

  static void handleException(Exception e) {
    String message = "حدث خطأ أثناء معالجة الطلب. يرجى المحاولة لاحقًا.";

    if (Get.isSnackbarOpen) {
    } else {
      Get.snackbar(
        "خطأ",
        message,
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.red,
        colorText: Colors.white,
        duration: const Duration(seconds: 3),
      );
    }
  }
}

void ErrorMessage(String message) {
  // تحديد العرض الثابت
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
      maxWidth: fixedWidth, // استخدام العرض الثابت هنا
      messageText: Container(
        constraints: BoxConstraints(
          maxHeight: 14.0 *
              1.4 *
              10, // 14 هو حجم الخط، 1.4 هو الارتفاع، 10 هو الحد الأقصى للأسطر
        ),
        width: fixedWidth - 40, // نطرح الـ padding الداخلي
        padding: const EdgeInsets.symmetric(horizontal: 8),
        child: SingleChildScrollView(
          child: Text(
            message,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 14,
              height: 1.4,
            ),
            textAlign: TextAlign.right,
            softWrap: true,
            overflow: TextOverflow.ellipsis,
            maxLines: 10, // الحد الأقصى لعدد الأسطر
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
