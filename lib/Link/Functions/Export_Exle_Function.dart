import 'dart:typed_data';
import 'package:excel/excel.dart';
import 'package:get/get.dart';
import 'dart:html' as html;

import 'package:vms_school/Link/API/Error_API.dart';
import 'package:vms_school/Translate/local_controller.dart';

import '../Model/AdminModel/Students_Models/Students_Marks_Model.dart';

void exportDataToExcel<T>({
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

    await exportToExcel(
      data: data,
      headers: headers,
      fileName: fileName,
    );

    print('تم التصدير بنجاح');
  } catch (e) {
    print('حدث خطأ أثناء التصدير: $e');
  }
}

exportToExcel({
  required List<Map<String, dynamic>> data,
  required List<String> headers,
  required String fileName,
}) async {
  try {
    if (data.isEmpty) {
      ErrorMessage("No data available for export".tr);
      return;
    }

    var excel = Excel.createExcel();
    Sheet sheet = excel['Sheet1'];

    final actualHeaders = headers;

    // إضافة العناوين
    sheet.appendRow(
        actualHeaders.map((header) => TextCellValue(header)).toList());

    // إضافة البيانات
    for (var row in data) {
      List<CellValue?> rowData = [];

      // تطبيق تحويل الصف إذا كان موجوداً
      final processedRow = row;

      // إما استخدام headers الأصلية أو المفاتيح من customHeaders
      final keysToUse = headers;

      for (var key in keysToUse) {
        var value = processedRow[key];
        rowData.add(_convertToCellValue(value));
      }

      sheet.appendRow(rowData);
    }

    // حفظ الملف وتنزيله
    var bytes = excel.save(fileName: '$fileName.xlsx');
    if (bytes != null) {
      final blob = html.Blob([Uint8List.fromList(bytes)]);
      final url = html.Url.createObjectUrlFromBlob(blob);
      html.Url.revokeObjectUrl(url);
    }
  } catch (e) {
    print("حدث خطأ أثناء التصدير: $e");
  }
}

// دالة مساعدة لتحويل القيم إلى أنواع CellValue المناسبة
CellValue _convertToCellValue(dynamic value) {
  if (value == null) {
    return TextCellValue('');
  } else if (value is String) {
    return TextCellValue(value);
  } else if (value is int) {
    return IntCellValue(value);
  } else if (value is double) {
    return DoubleCellValue(value);
  } else if (value is bool) {
    return TextCellValue(value ? 'نعم' : 'لا');
  } else if (value is DateTime) {
    return TextCellValue(value.toString());
  } else {
    return TextCellValue(value.toString());
  }
}

Future<void> exportTableToExcel({
  required List<dynamic> tableData,
  required String fileName,
  required String classes,
  required String division,
  required String type,
}) async {
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
          "${Get.find<LocalizationController>().currentLocale.value.languageCode == 'ar' ? item.name : item.enName}_${item.fullName}" ??
              '';
    }
  }

  // العناوين

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

  // البيانات
  List<Map<String, dynamic>> data = allDays.map((day) {
    final lessons = grouped[day]!;
    return Map.fromIterables(headers, [day.tr, ...lessons.map((e) => e ?? '')]);
  }).toList();

  // التصدير
  exportDataToExcel(
    items: data,
    headers: headers,
    fieldMappings: {
      for (var header in headers)
        header: (item) => (item as Map<String, dynamic>)[header],
    },
    fileName: fileName,
  );
}

void exportStudentMarksToExcel({
  required List<Student> students,
  required List<QuizType> quizTypes,
  String fileName = 'quiz_results',
}) {
  List<String> headers = ['اسم الطالب'];
  Map<String, double> passingMarks = {};
  List<int> markKeys = [];

  // تجهيز العناوين ومفاتيح العلامات
  for (var quiz in quizTypes) {
    final items = quiz.items ?? [];

    if (items.isNotEmpty) {
      for (var item in items) {
        final name = item.name ?? '';
        headers.add(name);
        if (item.id != null) {
          markKeys.add(item.id!);
          passingMarks[name] = item.passingMark?.toDouble() ?? 0;
        }
      }
    } else {
      final name = quiz.name ?? '';
      headers.add(name);
      if (quiz.id != null) {
        markKeys.add(quiz.id!);
        passingMarks[name] = quiz.passingMark?.toDouble() ?? 0;
      }
    }
  }

  // إضافة عمود "الحالة"
  headers.add('الحالة');

  // بناء fieldMappings
  Map<String, dynamic Function(Student)> fieldMappings = {};

  fieldMappings['اسم الطالب'] = (student) => student.fullName ?? '';

  for (int i = 0; i < markKeys.length; i++) {
    final id = markKeys[i];
    final name = headers[i + 1]; // +1 لتخطي اسم الطالب

    fieldMappings[name] = (student) {
      final mark = student.mark
          ?.firstWhere(
            (m) => m.id == id,
            orElse: () => Mark(id: id, mark: null),
          )
          .mark;

      return mark?.toStringAsFixed(0) ?? '';
    };
  }

  // الحالة ناجح / راسب
  fieldMappings['الحالة'] = (student) {
    bool hasFail = false;

    for (int i = 0; i < markKeys.length; i++) {
      final id = markKeys[i];
      final headerName = headers[i + 1];
      final passing = passingMarks[headerName] ?? 0;
      final mark = student.mark
          ?.firstWhere(
            (m) => m.id == id,
            orElse: () => Mark(id: id, mark: null),
          )
          .mark;

      if (mark != null && mark < passing) {
        hasFail = true;
        break;
      }
    }

    return hasFail ? 'راسب' : 'ناجح';
  };

  // التصدير
  exportDataToExcel<Student>(
    items: students,
    headers: headers,
    fieldMappings: fieldMappings,
    fileName: fileName,
  );
}
