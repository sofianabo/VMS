// File Path: lib/Link/API/download_file_stub.dart

import 'DownloadFiles.dart';

class PlatformDownloaderStub implements PlatformDownloader {
  @override
  Future<void> downloadFile(String url, String fileName) async {
    // هذا الخطأ لن يظهر إلا إذا لم يتم تجميع التطبيق بنجاح
    throw UnsupportedError('downloadFile is not supported on this platform.');
  }
}

// تنفيذ الـ Getter المشترك
PlatformDownloader get downloader => PlatformDownloaderStub();
