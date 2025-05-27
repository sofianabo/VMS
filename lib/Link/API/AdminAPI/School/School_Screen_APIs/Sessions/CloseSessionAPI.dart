import 'package:flutter/material.dart';
import 'package:vms_school/Link/API/API.dart';
import 'package:vms_school/Link/API/AdminAPI/School/School_Screen_APIs/Sessions/SessionAPI.dart';
import 'package:vms_school/Link/API/DioOption.dart';
import 'package:dio/dio.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:vms_school/Link/API/Error_API.dart';
import 'package:vms_school/Link/Controller/AdminController/School_Controllers/Session_Controller.dart';
import 'package:vms_school/widgets/Loading_Dialog.dart';

class Closesessionapi {
  BuildContext context;
  Closesessionapi(this.context);
  Dio dio = Dio();

  Closesession({sessionId, index}) async {
    CancelToken cancelToken = CancelToken();
    Loading_Dialog(cancelToken: cancelToken);
    try {
      String myurl = "$hostPort$closeSession";
      var response = await dio.post(
          cancelToken: cancelToken,
          myurl,
          options: getDioOptions(),
          data: {"sessionId": sessionId});
      if (response.statusCode == 200) {
        Get.find<SessionController>().updateStatus(index, "Closed".tr);
        Get.back();
      }
      if (response.statusCode == 250) {
        Get.back();
        if (response.data['Massege'] != null &&
            response.data['Massege'].isNotEmpty) {
          showErrorMessagesDialog(response.data['Massege']);
        } else {
          ErrorMessage("Unknown error occurred".tr);
        }
        return;
      } else {
        ErrorHandler.handleDioError(DioException(
          requestOptions: response.requestOptions,
          response: response,
          type: DioExceptionType.badResponse,
        ));
      }
    } catch (e) {
      if (e is DioException) {
        ErrorHandler.handleException(e);
      } else if (e is Exception) {
        ErrorHandler.handleException(e);
      } else {
        ErrorHandler.handleException(Exception(e.toString()));
      }
    }
  }
}

List<Map<String, dynamic>> getUniqueMessagesWithCount(List<dynamic> messages) {
  final uniqueMessages = <Map<String, dynamic>>[];
  final messageCounts = <String, int>{};

  for (var msg in messages) {
    final key = '${msg['massegeEn']}-${msg['massegeAr']}';
    messageCounts[key] = (messageCounts[key] ?? 0) + 1;

    if (messageCounts[key] == 1) {
      uniqueMessages.add({
        'en': msg['massegeEn'],
        'ar': msg['massegeAr'],
        'count': 1, // Initial count
      });
    } else {
      // Update count for existing message
      final existingMsg =
          uniqueMessages.firstWhere((m) => '${m['en']}-${m['ar']}' == key);
      existingMsg['count'] = messageCounts[key];
    }
  }

  return uniqueMessages;
}

void showErrorMessagesDialog(List<dynamic> messages) {
  final uniqueMessages = getUniqueMessagesWithCount(messages);
  final isArabic = Get.locale?.languageCode == 'ar';

  Get.dialog(
    AlertDialog(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(5.0))),
      titlePadding: EdgeInsets.all(15.0),
      insetPadding: EdgeInsets.all(15.0),
      contentPadding: EdgeInsets.all(15.0),
      actionsPadding: EdgeInsets.all(8.0),
      title: Text('Close Session'.tr),
      content: SizedBox(
        width: 450,
        height: 370,
        child: SingleChildScrollView(
          child: Column(
            spacing: 20,
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "you can not close this session".tr,
                style: Get.theme.textTheme.bodyMedium!
                    .copyWith(color: const Color(0xffB03D3D)),
              ),
              for (var msg in uniqueMessages)
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: Text(
                    isArabic
                        ? msg['ar']! + ' (${msg['count']}) ' + "Studentsss".tr
                        : msg['en']! + ' (${msg['count']}) ' + "Students",
                    style: Get.theme.textTheme.bodyMedium,
                  ),
                ),
            ],
          ),
        ),
      ),
      actions: [
        TextButton(
          onPressed: () {
            Get.back();
            Get.back();
          },
          child: Text('Close'.tr),
        ),
      ],
    ),
  );
}
