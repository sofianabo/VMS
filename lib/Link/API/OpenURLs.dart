import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:vms_school/Link/API/Error_API.dart';

enum LinkType {
  email,
  phone,
  youtube,
  facebook,
  website, // لأي رابط عادي
}

Future<void> launchLink({
  required String? url,
  required LinkType type,
  required BuildContext context, // لإظهار الرسائل
}) async {
  if (url == null || url.isEmpty) {
    ErrorMessage("الرابط غير متوفر");
    return;
  }

  Uri uri;

  try {
    switch (type) {
      case LinkType.email:
        uri = Uri(scheme: 'mailto', path: url);
        break;
      case LinkType.phone:
        uri = Uri(scheme: 'tel', path: url);
        break;
      case LinkType.youtube:
      case LinkType.facebook:
      case LinkType.website:
        // تأكد أن الرابط يبدأ بـ http/https
        uri = Uri.parse(url.startsWith('http') ? url : 'https://$url');
        break;
    }

    if (await canLaunchUrl(uri)) {
      await launchUrl(uri);
    } else {
      throw 'تعذر فتح الرابط';
    }
  } catch (e) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('حدث خطأ: ${e.toString()}')),
    );
  }
}
