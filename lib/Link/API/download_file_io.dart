// File Path: lib/Link/API/download_file_io.dart

import 'dart:io';
import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:path_provider/path_provider.dart'; // لتحديد مسار الحفظ
import 'package:vms_school/view/Both_Platform/widgets/Loading_Dialog.dart';
import 'DownloadFiles.dart'; // استيراد الواجهة

class PlatformDownloaderIO implements PlatformDownloader {
  @override
  Future<void> downloadFile(String url, String fileName) async {
    Dio dio = Dio();

    try {
      // تحديد المسار الآمن للحفظ
      final directory = Platform.isAndroid
          ? await getExternalStorageDirectory()
          : await getApplicationDocumentsDirectory();

      final filePath = '${directory!.path}/$fileName';

      CancelToken cancelToken = CancelToken();
      Loading_Dialog(cancelToken: cancelToken);

      // تحميل وحفظ الملف مباشرة إلى المسار المحلي
      await dio.download(
        url,
        filePath,
        cancelToken: cancelToken,
      );

      Get.back(); // إغلاق مربع الحوار
    } catch (e) {
      if (Get.isDialogOpen ?? false) {
        Get.back();
      }
      print("Download error (IO): $e");
    }
  }
}

// تنفيذ الـ Getter المشترك
PlatformDownloader get downloader => PlatformDownloaderIO();
