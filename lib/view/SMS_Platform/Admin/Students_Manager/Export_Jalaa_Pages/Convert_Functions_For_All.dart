import 'dart:ui' as ui;
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:printing/printing.dart';
import 'package:vms_school/Link/API/Share_Image.dart' show sendImageToServer;
import 'package:vms_school/Link/Controller/AdminController/Students_Controllers/Jalaa_For_Students/Jalaa_Controller.dart';
import 'package:vms_school/Link/Model/AdminModel/Students_Models/Jalaa_Model.dart';
import 'package:vms_school/view/SMS_Platform/Admin/Students_Manager/Export_Jalaa_Pages/Export_Jalaa.dart';

// المتغير العام للإلغاء
bool cancelOperation = false;

// الدالة الرئيسية للطباعة
Future<void> captureAndPrint() async {
  cancelOperation = false;
  CancelToken cansleToken = CancelToken();

  final ValueNotifier<int> progressNotifier = ValueNotifier<int>(0);

  // فتح الـ Dialog
  Get.dialog(
    PrintingDialog(
      progressNotifier: progressNotifier,
      cansleToken: cansleToken,
    ),
    barrierDismissible: false,
  );

  try {
    await Future.delayed(const Duration(milliseconds: 200));
    if (cancelOperation) return;
    progressNotifier.value = 20;

    final widget = Container(
      padding: const EdgeInsets.only(top: 70.0),
      color: Colors.white,
      child: buildPrintContent(), // هذا تابع يجب أن يرجع Widget للطباعة
    );

    await Future.delayed(const Duration(milliseconds: 100));
    if (cancelOperation) return;
    progressNotifier.value = 40;

    final image = await WidgetWraper.toImage(
      widget,
      logicalSize: const Size(1500, 1300),
      pixelRatio: 3.0,
    );

    await Future.delayed(const Duration(milliseconds: 100));
    if (cancelOperation) return;
    progressNotifier.value = 60;

    final imageBytes = await image.toByteData(format: ui.ImageByteFormat.png);
    if (imageBytes == null || cancelOperation) return;
    progressNotifier.value = 80;

    final pngBytes = imageBytes.buffer.asUint8List();
    final pdfBytes = await sendImageToServer(pngBytes, cansleToken);

    if (pdfBytes == null || cancelOperation) return;
    progressNotifier.value = 100;

    await Printing.layoutPdf(onLayout: (_) async => pdfBytes);
  } catch (e) {
    // يمكن إظهار خطأ هنا إن أردت
  } finally {
    if (Get.isDialogOpen ?? false) {
      Get.back(); // إغلاق الـ Dialog
    }
  }
}

class PrintingDialog extends StatelessWidget {
  final ValueNotifier<int> progressNotifier;
  CancelToken cansleToken = CancelToken();
  PrintingDialog(
      {super.key, required this.progressNotifier, required this.cansleToken});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text("تحميل"),
      content: ValueListenableBuilder<int>(
        valueListenable: progressNotifier,
        builder: (context, progress, _) {
          return Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              LinearProgressIndicator(value: progress / 100),
              const SizedBox(height: 15),
              Text("يتم تجهيز العناصر... ($progress%)"),
            ],
          );
        },
      ),
      actions: [
        TextButton(
          onPressed: () {
            cancelOperation = true;
            cansleToken.cancel();
            Get.back();
          },
          child: const Text("إلغاء"),
        ),
      ],
    );
  }
}

String convertToArabicNumbers(String input) {
  const english = ['0', '1', '2', '3', '4', '5', '6', '7', '8', '9'];
  const arabic = ['٠', '١', '٢', '٣', '٤', '٥', '٦', '٧', '٨', '٩'];

  for (int i = 0; i < english.length; i++) {
    input = input.replaceAll(english[i], arabic[i]);
  }
  return input;
}

int calculateTotalCMarks(List<MainCurriculum>? mainCurriculum) {
  int total = 0;

  if (mainCurriculum != null) {
    for (var curriculum in mainCurriculum) {
      if (curriculum.insideCurr != null) {
        for (var inside in curriculum.insideCurr!) {
          total += inside.maxMark ?? 0;
        }
      }
    }
  }

  return total;
}

int calculateTotalPassingMarks(List<MainCurriculum>? mainCurriculum) {
  int total = 0;

  if (mainCurriculum != null) {
    for (var curriculum in mainCurriculum) {
      if (curriculum.insideCurr != null) {
        for (var inside in curriculum.insideCurr!) {
          total += inside.passingMark ?? 0;
        }
      }
    }
  }

  return total;
}

int sumMarksAtIndex(List<MainCurriculum>? curriculumList, int index) {
  int total = 0;

  if (curriculumList != null) {
    for (var curriculum in curriculumList) {
      if (curriculum.insideCurr != null) {
        for (var inside in curriculum.insideCurr!) {
          if (inside.marks != null && index < inside.marks!.length) {
            total += inside.marks![index];
          }
        }
      }
    }
  }

  return total;
}

double marksall(
  List<MainCurriculum>? curriculumList,
) {
  double markOnJaper = 0.0;
  final mainCurrList = curriculumList;

  for (var mainCurr in mainCurrList!) {
    for (var inside in mainCurr.insideCurr!) {
      int sum = inside.marks!.fold(0, (prev, mark) => prev + mark);
      markOnJaper += (sum / 2).ceil();
    }
  }
  return markOnJaper;
}

String safeMarkText(List marks, int index) {
  if (marks.length > index) {
    try {
      return marks[index].toString();
    } catch (_) {
      return "";
    }
  }
  return "";
}

String GheabAttendance(String att) {
  if (att == "0") {
    return "-";
  } else {
    return att;
  }
}

int safeMarkNumber(List marks, int index) {
  if (marks.length > index) {
    try {
      return int.parse(marks[index].toString());
    } catch (_) {
      return 0;
    }
  }
  return 0;
}

int safeMarkNumberAtIndex(int index) {
  final val = sumMarksAtIndex(
      Get.find<Jalaa_Controller>().rebortCard!.rebort!.mainCurriculum, index);
  try {
    return int.parse(val.toString());
  } catch (_) {
    return 0;
  }
}

int getTotalPassingMarks() {
  final curriculumList =
      Get.find<Jalaa_Controller>().rebortCard?.rebort?.mainCurriculum;

  int total = 0;

  if (curriculumList != null) {
    for (var curriculum in curriculumList) {
      if (curriculum.insideCurr != null) {
        for (var inside in curriculum.insideCurr!) {
          total += inside.passingMark ?? 0;
        }
      }
    }
  }

  return total;
}
