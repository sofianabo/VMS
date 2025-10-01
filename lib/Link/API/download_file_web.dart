// File Path: lib/Link/API/download_file_web.dart

import 'dart:typed_data';
import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:file_saver/file_saver.dart'; // لتشغيل التنزيل في المتصفح
import 'package:vms_school/view/Both_Platform/widgets/Loading_Dialog.dart';
import 'DownloadFiles.dart'; // استيراد الواجهة

class PlatformDownloaderWeb implements PlatformDownloader {
  @override
  Future<void> downloadFile(String url, String fileName) async {
    Dio dio = Dio();
    try {
      CancelToken cancelToken = CancelToken();
      Loading_Dialog(cancelToken: cancelToken);

      final response = await dio.get(
        url,
        options: Options(responseType: ResponseType.bytes),
        cancelToken: cancelToken,
      );

      Get.back(); // إغلاق مربع الحوار

      if (response.statusCode == 200) {
        // استخدام file_saver لتنزيل البيانات
        await FileSaver.instance.saveFile(
          name: fileName,
          bytes: response.data as Uint8List,
          mimeType: MimeType.other,
        );
      }

    } catch (e) {
      if (Get.isDialogOpen ?? false) {
        Get.back();
      }
      print("Download error (Web): $e");
    }
  }
}

// تنفيذ الـ Getter المشترك
PlatformDownloader get downloader => PlatformDownloaderWeb();