import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:get/get.dart';
import 'package:pdf/pdf.dart';
import 'dart:typed_data';
import 'dart:ui' as ui;
import 'package:pdf/widgets.dart' as pw;
import 'package:vms_school/Link/API/AdminAPI/School/School_Screen_APIs/PenaltyAPI/Get_All_Penalties_API.dart';
import 'dart:html' as html; // استخدام html للويب

import 'package:vms_school/Link/API/AdminAPI/Students/Students_APIs/Add_Students_Rewards.dart';
import 'package:vms_school/Link/Controller/AdminController/School_Controllers/Rewards_Controller.dart';
import 'package:vms_school/Link/Controller/AdminController/Students_Controllers/PenaltiesAndRewardsController.dart';
import 'package:vms_school/widgets/Admin/Admin_Students/Penality_And_Rewards_Dialog.dart';

Future saveRewardsAsPdf({
  required key,
  required bool saveLocal,
  String? rewardsName,
  String? StuId,
  String? StudentFullName,
}) async {
  final controller = Get.find<RewardsController>();

  Get.defaultDialog(
    barrierDismissible: false,
    title: "جاري التحميل...",
    content: Obx(() {
      return Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          CircularProgressIndicator(value: controller.progress.value),
          SizedBox(height: 20),
          Text("${(controller.progress.value * 100).toStringAsFixed(0)}%")
        ],
      );
    }),
  );

  // إضافة تأخير صغير ليتمكن المستخدم من رؤية الـ Dialog
  await Future.delayed(Duration(milliseconds: 500)); // تأخير نصف ثانية

  try {
    print("بدء عملية تحميل الصورة...");

    // رسم الصورة في PDF
    RenderRepaintBoundary boundary =
        key.currentContext!.findRenderObject() as RenderRepaintBoundary;
    ui.Image image = await boundary.toImage(pixelRatio: 2.0);
    ByteData? byteData = await image.toByteData(format: ui.ImageByteFormat.png);
    Uint8List pngBytes = byteData!.buffer.asUint8List();
    controller.progress.value = 0.35;

    final imageProvider = pw.MemoryImage(pngBytes);
    final pdfWidth = (PdfPageFormat.a4.landscape.width + 15);
    final pdfHeight = (PdfPageFormat.a4.landscape.height);

    // إنشاء PDF
    final pdf = pw.Document();
    pdf.addPage(
      pw.Page(
        pageFormat: PdfPageFormat(
          PdfPageFormat.a4.landscape.width,
          PdfPageFormat.a4.landscape.height,
        ),
        build: (pw.Context context) {
          return pw.Center(
            child: pw.Image(
              imageProvider,
              width: pdfWidth,
              height: pdfHeight,
            ),
          );
        },
      ),
    );

    // في حالة SaveLocal == true نقوم بحفظ الـ PDF محليًا في الويب
    if (saveLocal) {
      final pdfBytes = await pdf.save();

      // إنشاء رابط تحميل للـ PDF
      final blob = html.Blob([pdfBytes]);
      final url = html.Url.createObjectUrlFromBlob(blob);
      final anchor = html.AnchorElement(href: url)
        ..target = 'blank'
        ..download = 'rewards.pdf';

      anchor.click();

      controller.progress.value = 1.0;
      Get.back();

      print("تم تحميل PDF بنجاح 🎉");
    } else {
      final pdfBytes = await pdf.save();
      if (await Add_Students_Rewards_API().Add_Students_Rewards(
            name: rewardsName!,
            file: pdfBytes,
            StudentId: int.parse(StuId!),
          ) ==
          200) {
        controller.progress.value = 1.0;
        Get.back();
        Get.back();
        final controllers = Get.put(Penaltiesandrewardscontroller());

        controllers.fetchPenalties(int.parse(StuId.toString()));

        controllers.fetchRewards(int.parse(StuId.toString()));

        Get.dialog(
          Re_Pe_Page(Id: StuId.toString(), name: StudentFullName!),
        );
      }
    }
  } catch (e) {
    print("حدث خطأ أثناء إنشاء PDF: $e");
    Get.back();
  }
}

Future<void> processPdfInChunks(
    Uint8List pngBytes, RewardsController controller) async {
  final pdf = pw.Document();
  final imageProvider = pw.MemoryImage(pngBytes);
  final pdfWidth = (PdfPageFormat.a4.landscape.width);
  final pdfHeight = (PdfPageFormat.a4.landscape.height);

  pdf.addPage(
    pw.Page(
      pageFormat: PdfPageFormat(
        PdfPageFormat.a4.landscape.width,
        PdfPageFormat.a4.landscape.height,
      ),
      build: (pw.Context context) {
        return pw.Center(
          child: pw.Image(
            imageProvider,
            width: pdfWidth,
            height: pdfHeight,
          ),
        );
      },
    ),
  );

  controller.progress.value = 0.75;
  await Future.delayed(Duration(milliseconds: 100));
  final stopwatch = Stopwatch()..start(); // بدء التوقيت

  stopwatch.stop();
  print("تم حفظ الـ PDF. استغرق الحفظ: ${stopwatch.elapsedMilliseconds}ms");
}

Future<Uint8List> savePdf(pw.Document pdf) async {
  return await pdf.save();
}
