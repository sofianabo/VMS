import 'dart:html' as html;
import 'package:excel/excel.dart';
import 'package:get/get.dart';
import 'package:getx/Link/Controller/AdminController/School_Info_Controller.dart';
import 'dart:typed_data';
import 'package:flutter/services.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:flutter/services.dart' show rootBundle;
import 'package:pdf/pdf.dart';

void exportToExcel(List<Map<String, dynamic>> data, List<String> headers) {
  if (data.isEmpty) {
    print("لا توجد بيانات للتصدير.");
    return;
  }

  var excel = Excel.createExcel();
  Sheet sheet = excel['Sheet1'];

  // Append headers to the sheet
  sheet.appendRow(headers);

  // Iterate over the data and append each row
  for (var school in data) {
    sheet.appendRow(school.values.toList());
  }

  String fileName = 'SchoolInfo.xlsx';
  var bytes = excel.save();

  if (bytes != null) {
    // Create a Blob from the byte array
    final blob = html.Blob([bytes]);

    // Create a URL from the Blob
    final url = html.Url.createObjectUrlFromBlob(blob);

    // Create a download link and trigger the download
    final anchor = html.AnchorElement(href: url)
      ..target = 'blank'
      ..download = fileName
      ..click();

    // Revoke the Object URL after the download
    html.Url.revokeObjectUrl(url);
  }
}

Future<void> exportToPdf(List<Map<String, dynamic>> schoolInfo) async {
  // تحميل الصورة
  ByteData bytes =
      await rootBundle.load('../../images/Logo.png'); // تأكد من مسار الصورة
  Uint8List imageBytes = bytes.buffer.asUint8List();
  final image = pw.MemoryImage(imageBytes);

  // تحميل الخط لدعم النصوص العربية
  ByteData fontData = await rootBundle
      .load('../../fonts/Cairo-Regular.ttf'); // تأكد من المسار الصحيح
  final font = pw.Font.ttf(fontData);

  final pdf = pw.Document();

  // عدد العناصر في كل صفحة
  const int itemsPerPage = 10;

  // تقسيم البيانات إلى عدة صفحات
  for (int i = 0; i < schoolInfo.length; i += itemsPerPage) {
    pdf.addPage(
      pw.Page(
        build: (pw.Context context) {
          return pw.Column(
            crossAxisAlignment: pw.CrossAxisAlignment.start,
            children: [
              // صورة الشعار في الأعلى
              pw.Row(
                mainAxisAlignment: pw.MainAxisAlignment.center,
                children: [
                  pw.Image(image, width: 250, height: 250),
                ],
              ),
              pw.SizedBox(height: 30),

              // عنوان الصفحة
              pw.Center(
                child: pw.Text(
                  'معلومات المدرسة',
                  style: pw.TextStyle(
                    fontSize: 20,
                    fontWeight: pw.FontWeight.bold,
                    font: font,
                  ),
                  textDirection: pw.TextDirection.rtl,
                ),
              ),
              pw.SizedBox(height: 20),

              // إنشاء الجدول
              ...buildSchoolData(
                  schoolInfo.sublist(
                    i,
                    (i + itemsPerPage < schoolInfo.length
                        ? i + itemsPerPage
                        : schoolInfo.length),
                  ),
                  font),
            ],
          );
        },
      ),
    );
  }

  // حفظ وتنزيل الملف
  final pdfBytes = await pdf.save();
  final blob = html.Blob([pdfBytes], 'application/pdf');
  final url = html.Url.createObjectUrlFromBlob(blob);
  final anchor = html.AnchorElement(href: url)
    ..setAttribute('download', 'SchoolInfo.pdf')
    ..click();
  html.Url.revokeObjectUrl(url);
}

List<pw.Widget> buildSchoolData(
    List<Map<String, dynamic>> schools, pw.Font font) {
  List<pw.Widget> rows = [];

  Map<String, String> fieldNames = {
    "School_Name": "اسم المدرسة",
    "License_Number": "رقم الترخيص",
    "Address": "العنوان",
    "Village": "القرية",
    "Region": "المنطقة",
    "Phone": "الهاتف",
    "Email": "البريد الإلكتروني",
    "Creation_Year": "سنة الإنشاء",
    "Clinic_Name": "اسم العيادة",
    "Congregation_number": "عدد الجمعيات",
    "Previous_name": "الاسم السابق",
    "Town_Chip": "رقم شعبة البلدية",
    "Fax": "الفاكس",
    "Work_Begin_Year": "سنة بدء العمل",
    "Country": "البلد",
    "Work_Type": "نوع العمل",
    "Outstanding_School": "مدرسة متميزة",
    "Taken_OverSchool": "مدرسة تم الاستحواذ عليها",
    "Reassignment_Teachers": "إعادة تعيين المعلمين",
    "Martyrs_Sons": "أبناء الشهداء",
    "Internet_Connection": "اتصال بالإنترنت",
    "Government_Connection": "اتصال حكومي",
    "Joint_Building": "مبنى مشترك",
    "Industrial_Section": "قسم صناعي",
  };

  for (var school in schools) {
    List<pw.Widget> columns = [];
    fieldNames.forEach((key, value) {
      String displayValue;

      // تحويل true/false إلى نعم/لا
      if (school[key] is bool) {
        displayValue = school[key] ? "نعم" : "لا";
      } else {
        displayValue = school[key]?.toString() ?? '';
      }

      columns.add(
        pw.Row(
          mainAxisAlignment: pw.MainAxisAlignment.end,
          children: [
            pw.Text(displayValue,
                style: pw.TextStyle(font: font),
                textDirection: pw.TextDirection.rtl),
            pw.Text("$value : ",
                style: pw.TextStyle(font: font),
                textDirection: pw.TextDirection.rtl),
          ],
        ),
      );
    });

    rows.add(
      pw.Column(children: columns),
    );
    rows.add(pw.SizedBox(height: 20)); // مسافة بين كل مدرسة
  }

  return rows;
}
