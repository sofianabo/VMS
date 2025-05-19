import 'dart:typed_data';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'dart:html' as html;
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:vms_school/Link/API/Error_API.dart';
import 'package:vms_school/Translate/local_controller.dart';

import '../Model/AdminModel/Students_Models/Students_Marks_Model.dart';

void exportDataToPdf<T>({
  required List<T> items,
  required List<String> headers,
  required Map<String, dynamic Function(T item)> fieldMappings,
  String fileName = 'exported_data',
}) async {
  try {
    List<Map<String, dynamic>> data = items.map((item) {
      return Map.fromEntries(
        fieldMappings.entries.map((entry) {
          return MapEntry(entry.key, entry.value(item));
        }),
      );
    }).toList();

    await exportToPdf(
      data: data,
      headers: headers,
      fileName: fileName,
    );

    print('تم التصدير إلى PDF بنجاح');
  } catch (e) {
    print('حدث خطأ أثناء التصدير: $e');
  }
}

Future<void> exportToPdf({
  required List<Map<String, dynamic>> data,
  required List<String> headers,
  required String fileName,
}) async {
  try {
    if (data.isEmpty) {
      ErrorMessage("No data available for export".tr);
      return;
    }

    ByteData fontData = await rootBundle.load('fonts/Cairo-Regular.ttf');
    final ttf = pw.Font.ttf(fontData);

    final pdf = pw.Document();

    const int rowsPerPage = 12; // عدد الصفوف لكل صفحة - عدل حسب الحاجة
    int totalPages = (data.length / rowsPerPage).ceil();

    for (int pageIndex = 0; pageIndex < totalPages; pageIndex++) {
      final pageData =
          data.skip(pageIndex * rowsPerPage).take(rowsPerPage).toList();

      pdf.addPage(
        pw.Page(
          pageFormat: PdfPageFormat.a4.landscape,
          build: (pw.Context context) {
            return pw.Directionality(
              textDirection: pw.TextDirection.rtl,
              child: pw.Column(
                children: [
                  pw.SizedBox(height: 10),
                  pw.Table.fromTextArray(
                    headers: headers,
                    data: pageData.map((row) {
                      return headers
                          .map((key) => _convertToString(row[key]))
                          .toList();
                    }).toList(),
                    cellAlignment: pw.Alignment.center,
                    headerStyle: pw.TextStyle(
                      fontWeight: pw.FontWeight.bold,
                      font: ttf,
                    ),
                    cellStyle: pw.TextStyle(font: ttf),
                    headerDecoration:
                        pw.BoxDecoration(color: PdfColors.grey300),
                    border: pw.TableBorder.all(color: PdfColors.grey700),
                    cellHeight: 30,
                  ),
                ],
              ),
            );
          },
        ),
      );
    }

    final bytes = await pdf.save();
    final blob = html.Blob([Uint8List.fromList(bytes)]);
    final url = html.Url.createObjectUrlFromBlob(blob);
    final anchor = html.AnchorElement(href: url)
      ..setAttribute(
          'download', fileName.endsWith('.pdf') ? fileName : '$fileName.pdf')
      ..click();
    html.Url.revokeObjectUrl(url);
  } catch (e) {
    print("حدث خطأ أثناء التصدير إلى PDF: $e");
  }
}

// دالة مساعدة لتحويل أي نوع إلى نص
String _convertToString(dynamic value) {
  if (value == null) return '';
  if (value is bool) return value ? 'نعم' : 'لا';
  if (value is DateTime) return value.toIso8601String();
  return value.toString();
}

Future<void> exportTableToPdf({
  required List<dynamic> tableData,
  required String fileName,
  required String classes,
  required String division,
  required String type,
}) async {
  final pdf = pw.Document();

  // تحميل الخط العربي
  final fontData = await rootBundle.load('fonts/Cairo-Regular.ttf');
  final ttf = pw.Font.ttf(fontData);

  final Uint8List imageData =
      (await rootBundle.load('assets/images/logo2.png')).buffer.asUint8List();
  final pw.ImageProvider image = pw.MemoryImage(imageData);

  // قائمة الأيام الثابتة
  final allDays = [
    'Sunday',
    'Monday',
    'Tuesday',
    'Wednesday',
    'Thursday',
  ];

  // تجهيز البيانات: تجميع حسب اليوم
  Map<String, List<String?>> grouped = {
    for (var day in allDays) day: List.filled(7, null),
  };

  for (var item in tableData) {
    final day = item.day ?? 'Unknown';
    final lessonIndex = (item.lessonId ?? 1) - 1;

    if (grouped.containsKey(day)) {
      grouped[day]![lessonIndex] =
          "${Get.find<LocalizationController>().currentLocale.value.languageCode == 'ar' ? item.name : item.enName}\n ${item.fullName}" ??
              '';
    }
  }

  // الهيدر
  final headers = [
    'Day'.tr,
    'First Lesson'.tr,
    'second Lesson'.tr,
    'Third Lesson'.tr,
    'Forth Lesson'.tr,
    'Fifth Lesson'.tr,
    'Sixth Lesson'.tr,
    'Seventh Lesson'.tr,
  ];
  // البيانات بالترتيب الصحيح
  final data = allDays.map((day) {
    return [day.tr, ...grouped[day]!.map((e) => e ?? '')];
  }).toList();

  pdf.addPage(
    pw.Page(
      pageFormat: PdfPageFormat.a4.landscape,
      build: (pw.Context context) {
        return pw.Column(
          children: [
            // الصورة مع النصين تحتها
            pw.Column(
              mainAxisSize: pw.MainAxisSize.min,
              children: [
                pw.Image(image, width: 200), // حجم الصورة حسب رغبتك
                pw.SizedBox(height: 40),
              ],
            ),
            // الجدول
            pw.Directionality(
              textDirection: pw.TextDirection.rtl,
              child: pw.Table.fromTextArray(
                headers: headers,
                data: data,
                headerStyle:
                    pw.TextStyle(font: ttf, fontWeight: pw.FontWeight.bold),
                cellStyle: pw.TextStyle(font: ttf),
                cellAlignment: pw.Alignment.center,
                border: pw.TableBorder.all(color: PdfColors.grey700),
                cellHeight: 40,
              ),
            ),
          ],
        );
      },
    ),
  );

  final bytes = await pdf.save();
  final blob = html.Blob([Uint8List.fromList(bytes)]);
  final url = html.Url.createObjectUrlFromBlob(blob);
  final anchor = html.AnchorElement(href: url)
    ..setAttribute(
        'download', fileName.endsWith('.pdf') ? fileName : '$fileName.pdf')
    ..click();
  html.Url.revokeObjectUrl(url);
}

void exportDataToPdfFromText<T>({
  required List<T> items,
  required List<String> headers,
  required Map<String, dynamic Function(T item)> fieldMappings,
  String fileName = 'exported_data',
  String UpText = '',
}) async {
  try {
    List<Map<String, dynamic>> data = items.map((item) {
      return Map.fromEntries(
        fieldMappings.entries.map((entry) {
          return MapEntry(entry.key, entry.value(item));
        }),
      );
    }).toList();

    await exportToPdfFromText(
        data: data, headers: headers, fileName: fileName, UpText: UpText);

    print('تم التصدير إلى PDF بنجاح');
  } catch (e) {
    print('حدث خطأ أثناء التصدير: $e');
  }
}

Future<void> exportToPdfFromText({
  required List<Map<String, dynamic>> data,
  required List<String> headers,
  required String fileName,
  required String UpText,
}) async {
  try {
    if (data.isEmpty) {
      ErrorMessage("No data available for export".tr);
      return;
    }

    ByteData fontData = await rootBundle.load('fonts/Cairo-Regular.ttf');
    final ttf = pw.Font.ttf(fontData);

    final pdf = pw.Document();

    const int rowsPerPage = 12; // عدد الصفوف لكل صفحة - عدل حسب الحاجة
    int totalPages = (data.length / rowsPerPage).ceil();

    for (int pageIndex = 0; pageIndex < totalPages; pageIndex++) {
      final pageData =
          data.skip(pageIndex * rowsPerPage).take(rowsPerPage).toList();

      pdf.addPage(
        pw.Page(
          pageFormat: PdfPageFormat.a4,
          build: (pw.Context context) {
            return pw.Directionality(
              textDirection: pw.TextDirection.rtl,
              child: pw.Column(
                children: [
                  pw.SizedBox(height: 10),
                  pw.Text(
                      textAlign: pw.TextAlign.center,
                      UpText,
                      style: pw.TextStyle(
                        font: ttf,
                      )),
                  pw.SizedBox(height: 10),
                  pw.Table.fromTextArray(
                    headers: headers,
                    data: pageData.map((row) {
                      return headers
                          .map((key) => _convertToString(row[key]))
                          .toList();
                    }).toList(),
                    cellAlignment: pw.Alignment.center,
                    headerStyle: pw.TextStyle(
                      fontWeight: pw.FontWeight.bold,
                      font: ttf,
                    ),
                    cellStyle: pw.TextStyle(font: ttf),
                    headerDecoration:
                        pw.BoxDecoration(color: PdfColors.grey300),
                    border: pw.TableBorder.all(color: PdfColors.grey700),
                    cellHeight: 30,
                  ),
                ],
              ),
            );
          },
        ),
      );
    }

    final bytes = await pdf.save();
    final blob = html.Blob([Uint8List.fromList(bytes)]);
    final url = html.Url.createObjectUrlFromBlob(blob);
    final anchor = html.AnchorElement(href: url)
      ..setAttribute(
          'download', fileName.endsWith('.pdf') ? fileName : '$fileName.pdf')
      ..click();
    html.Url.revokeObjectUrl(url);
  } catch (e) {
    print("حدث خطأ أثناء التصدير إلى PDF: $e");
  }
}

Future<void> exportQuizResultToPdf({
  required List<Student> students,
  required String Curr,
  required List<QuizType> quizTypes,
  String fileName = 'quiz_results',
}) async {
  final pdf = pw.Document();

  final fontData = await rootBundle.load('fonts/Cairo-Regular.ttf');
  final ttf = pw.Font.ttf(fontData);

  List<String> headers = ['اسم الطالب'];
  List<int> markKeys = [];
  Map<int, double> passingMarks = {};

  for (var quiz in quizTypes) {
    final items = quiz.items ?? [];

    if (items.isNotEmpty) {
      for (var item in items) {
        headers.add(item.name ?? '');
        if (item.id != null) {
          markKeys.add(item.id!);
          passingMarks[item.id!] = item.passingMark?.toDouble() ?? 0;
        }
      }
    } else {
      headers.add(quiz.name ?? '');
      if (quiz.id != null) {
        markKeys.add(quiz.id!);
        passingMarks[quiz.id!] = quiz.passingMark?.toDouble() ?? 0;
      }
    }
  }

  // أضف عمود الحالة
  headers.add('الحالة');

  const rowsPerPage = 11;
  for (int i = 0; i < students.length; i += rowsPerPage) {
    final pageStudents = students.sublist(
      i,
      (i + rowsPerPage > students.length) ? students.length : i + rowsPerPage,
    );

    pdf.addPage(
      pw.Page(
        pageFormat: PdfPageFormat.a4.landscape,
        build: (context) {
          return pw.Directionality(
            textDirection: pw.TextDirection.rtl,
            child: pw.Column(
              children: [
                pw.Center(
                  child: pw.Text(
                    "$Curr",
                    style: pw.TextStyle(
                      fontWeight: pw.FontWeight.bold,
                      font: ttf,
                    ),
                  ),
                ),
                pw.SizedBox(height: 20),
                // Header Row
                pw.Row(
                  children: headers
                      .map(
                        (h) => pw.Expanded(
                          child: pw.Container(
                            decoration: pw.BoxDecoration(
                              border: pw.Border.all(color: PdfColors.grey700),
                              color: PdfColors.grey300,
                            ),
                            padding: const pw.EdgeInsets.all(5),
                            alignment: pw.Alignment.center,
                            child: pw.Text(
                              h,
                              style: pw.TextStyle(
                                fontWeight: pw.FontWeight.bold,
                                font: ttf,
                              ),
                            ),
                          ),
                        ),
                      )
                      .toList(),
                ),
                // Data Rows with Borders
                ...pageStudents.map((student) {
                  Map<int, double> studentMarkMap = {
                    for (var m in student.mark ?? [])
                      if (m.id != null && m.mark != null)
                        m.id!: m.mark!.toDouble()
                  };

                  // حساب الحالة: إذا في علامة أقل من passingMark يكون راسب
                  bool hasFail = markKeys.any((id) {
                    final mark = studentMarkMap[id];
                    final passing = passingMarks[id] ?? 0;
                    return mark != null && mark < passing;
                  });

                  return pw.Row(
                    children: [
                      // Student Name
                      pw.Expanded(
                        child: pw.Container(
                          decoration: pw.BoxDecoration(
                            border: pw.Border.all(color: PdfColors.grey700),
                          ),
                          padding: const pw.EdgeInsets.all(5),
                          alignment: pw.Alignment.center,
                          child: pw.Text(
                            student.fullName ?? '',
                            style: pw.TextStyle(font: ttf),
                          ),
                        ),
                      ),
                      // Marks with Pass/Fail Coloring
                      ...markKeys.map((id) {
                        final mark = studentMarkMap[id];
                        final isFail =
                            mark != null && mark < (passingMarks[id] ?? 0);

                        return pw.Expanded(
                          child: pw.Container(
                            decoration: pw.BoxDecoration(
                              border: pw.Border.all(color: PdfColors.grey700),
                            ),
                            padding: const pw.EdgeInsets.all(5),
                            alignment: pw.Alignment.center,
                            child: pw.Text(
                              mark?.toStringAsFixed(0) ?? '',
                              style: pw.TextStyle(
                                font: ttf,
                                color: isFail ? PdfColors.red : PdfColors.black,
                              ),
                            ),
                          ),
                        );
                      }).toList(),
                      // الحالة (ناجح / راسب)
                      pw.Expanded(
                        child: pw.Container(
                          decoration: pw.BoxDecoration(
                            border: pw.Border.all(color: PdfColors.grey700),
                          ),
                          padding: const pw.EdgeInsets.all(5),
                          alignment: pw.Alignment.center,
                          child: pw.Text(
                            hasFail ? 'راسب' : 'ناجح',
                            style: pw.TextStyle(
                              font: ttf,
                              color: hasFail ? PdfColors.red : PdfColors.black,
                              fontWeight: pw.FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ],
                  );
                }).toList(),
              ],
            ),
          );
        },
      ),
    );
  }

  final bytes = await pdf.save();
  final blob = html.Blob([Uint8List.fromList(bytes)]);
  final url = html.Url.createObjectUrlFromBlob(blob);
  final anchor = html.AnchorElement(href: url)
    ..setAttribute('download', '$fileName.pdf')
    ..click();
  html.Url.revokeObjectUrl(url);
}
