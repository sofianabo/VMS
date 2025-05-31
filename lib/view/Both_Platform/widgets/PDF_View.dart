import 'package:url_launcher/url_launcher.dart';

Future<void> openFileInNewTab({required String filePath}) async {
  if (await canLaunchUrl(Uri.parse(filePath))) {
    await launchUrl(
      Uri.parse(filePath),
      webOnlyWindowName: '_blank', // هذا يضمن فتح الرابط في صفحة جديدة
    );
  } else {
    throw 'تعذر فتح الملف: $filePath';
  }
}
