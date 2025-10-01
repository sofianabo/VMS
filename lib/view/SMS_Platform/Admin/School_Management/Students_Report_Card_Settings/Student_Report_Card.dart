import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:excel/excel.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:file_picker/file_picker.dart';
import 'package:file_saver/file_saver.dart';

class ExcelToPdfScreen extends StatefulWidget {
  @override
  _ExcelToPdfScreenState createState() => _ExcelToPdfScreenState();
}

class _ExcelToPdfScreenState extends State<ExcelToPdfScreen> {
  late Excel _excel;
  late Sheet _sheet;
  bool _fileLoaded = false;
  TextEditingController _cellController = TextEditingController();
  TextEditingController _textController = TextEditingController();
  String? _fileName;

  @override
  void initState() {
    super.initState();
  }

  Future<void> _pickExcelFile() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['xlsx'],
      withData: true,
    );

    if (result != null && result.files.isNotEmpty) {
      final bytes = result.files.first.bytes;
      final name = result.files.first.name;

      if (bytes != null) {
        _initializeExcel(bytes);
        setState(() {
          _fileName = name;
          _fileLoaded = true;
        });
      }
    }
  }

  void _initializeExcel(Uint8List bytes) {
    _excel = Excel.decodeBytes(bytes)!;
    _sheet = _excel.tables[_excel.tables.keys.first]!;
  }

  void _writeToCell() {
    if (!_fileLoaded) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('الرجاء تحميل ملف Excel أولاً')),
      );
      return;
    }

    String cell = _cellController.text.trim().toUpperCase();
    String value = _textController.text;

    if (cell.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('الرجاء إدخال خانة صالحة')),
      );
      return;
    }

    try {
      int numericValue = int.tryParse(value) ?? 0;
      CellIndex cellIndex = CellIndex.indexByString(cell);
      _sheet.updateCell(cellIndex, IntCellValue(numericValue));
      _textController.clear();

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
            content: Text('تمت كتابة الرقم $numericValue في الخانة $cell')),
      );
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('خطأ في تحديد الخانة أو القيمة: $e')),
      );
    }
  }

  // التصدير إلى Excel (تم تطبيق التحويل)
  Future<void> _exportToExcel() async {
    if (!_fileLoaded) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('لا يوجد بيانات لتصديرها')),
      );
      return;
    }

    try {
      // 1. الحصول على البيانات كـ List<int>
      final List<int> listIntBytes = _excel.encode()!;
      // 2. 🟢 التحويل إلى Uint8List لحل الخطأ
      final Uint8List bytes = Uint8List.fromList(listIntBytes);

      final newFileName = _fileName?.replaceAll('.xlsx', '_modified.xlsx') ??
          'modified_excel.xlsx';

      await FileSaver.instance.saveFile(
        name: newFileName,
        bytes: bytes,
        mimeType: MimeType.microsoftExcel,
      );
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('حدث خطأ أثناء التصدير: $e')),
      );
    }
  }

  // التصدير إلى PDF (تم تطبيق التحويل)
  Future<void> _exportToPdf() async {
    if (!_fileLoaded) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('لا يوجد بيانات لتصديرها')),
      );
      return;
    }

    try {
      final pdf = pw.Document();

      pdf.addPage(
        pw.Page(
          pageFormat: PdfPageFormat.a4.landscape,
          build: (pw.Context context) {
            return pw.Directionality(
              textDirection: pw.TextDirection.rtl,
              child: pw.Table(
                border: pw.TableBorder.all(),
                columnWidths: _calculateColumnWidths(),
                children: _buildPdfTableRows(),
              ),
            );
          },
        ),
      );

      // 1. الحصول على البيانات كـ List<int>
      final List<int> listIntBytes = await pdf.save();
      // 2. 🟢 التحويل إلى Uint8List لحل الخطأ
      final Uint8List bytes = Uint8List.fromList(listIntBytes);

      final newFileName =
          _fileName?.replaceAll('.xlsx', '.pdf') ?? 'converted.pdf';

      await FileSaver.instance.saveFile(
        name: newFileName,
        bytes: bytes,
        mimeType: MimeType.pdf,
      );
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('حدث خطأ أثناء إنشاء PDF: $e')),
      );
    }
  }

  Map<int, pw.TableColumnWidth> _calculateColumnWidths() {
    Map<int, pw.TableColumnWidth> widths = {};
    for (int i = 0; i < _sheet.maxColumns; i++) {
      widths[i] = pw.FlexColumnWidth(1);
    }
    return widths;
  }

  List<pw.TableRow> _buildPdfTableRows() {
    List<pw.TableRow> rows = [];

    for (var row in _sheet.rows) {
      rows.add(
        pw.TableRow(
          children: row.map((cell) {
            return pw.Container(
              padding: pw.EdgeInsets.all(4),
              child: pw.Text(
                _getCellValue(cell),
                style: pw.TextStyle(
                  fontSize: 10,
                  font: pw.Font.courier(),
                ),
              ),
            );
          }).toList(),
        ),
      );
    }

    return rows;
  }

  String _getCellValue(Data? cell) {
    if (cell == null) return '';

    if (cell.value is String) {
      return cell.value as String;
    } else if (cell.value is num) {
      return cell.value.toString();
    } else if (cell.value is DateTime) {
      return cell.value.toString();
    } else if (cell.value is bool) {
      return cell.value.toString();
    }
    return cell.value?.toString() ?? '';
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: _pickExcelFile,
              child: Text("اختيار ملف Excel"),
            ),
            SizedBox(height: 10),
            if (_fileLoaded)
              Text(
                'ملف مفتوح: $_fileName',
                style: TextStyle(color: Colors.green),
              ),
            SizedBox(height: 20),
            TextField(
              controller: _cellController,
              decoration: InputDecoration(
                labelText: 'حدد الخانة (مثل A1)',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 10),
            TextField(
              controller: _textController,
              decoration: InputDecoration(
                labelText: 'أدخل النص',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _writeToCell,
              child: Text("حفظ في الخانة"),
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: _exportToExcel,
                  child: Text("حفظ كـ Excel"),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green,
                  ),
                ),
                ElevatedButton(
                  onPressed: _exportToPdf,
                  child: Text("حفظ كـ PDF"),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

// import 'dart:html' as html;
// import 'dart:typed_data';
// import 'package:flutter/material.dart';
// import 'package:excel/excel.dart';
// import 'package:pdf/pdf.dart';
// import 'package:pdf/widgets.dart' as pw;
//
// class ExcelToPdfScreen extends StatefulWidget {
//   @override
//   _ExcelToPdfScreenState createState() => _ExcelToPdfScreenState();
// }
//
// class _ExcelToPdfScreenState extends State<ExcelToPdfScreen> {
//   late Excel _excel;
//   late Sheet _sheet;
//   bool _fileLoaded = false;
//   TextEditingController _cellController = TextEditingController();
//   TextEditingController _textController = TextEditingController();
//   String? _fileName;
//
//   @override
//   void initState() {
//     super.initState();
//   }
//
//   Future<void> _pickExcelFile() async {
//     html.FileUploadInputElement uploadInput = html.FileUploadInputElement();
//     uploadInput.accept = '.xlsx';
//     uploadInput.click();
//
//     uploadInput.onChange.listen((e) async {
//       final files = uploadInput.files;
//
//       if (files!.isEmpty) return;
//
//       final reader = html.FileReader();
//       reader.readAsArrayBuffer(files[0]);
//
//       reader.onLoadEnd.listen((e) {
//         final bytes = reader.result as Uint8List;
//         _initializeExcel(bytes);
//         setState(() {
//           _fileName = files[0].name;
//           _fileLoaded = true;
//         });
//       });
//     });
//   }
//
//   void _initializeExcel(Uint8List bytes) {
//     _excel = Excel.decodeBytes(bytes)!;
//     _sheet = _excel.tables[_excel.tables.keys.first]!;
//   }
//
//   void _writeToCell() {
//     if (!_fileLoaded) {
//       ScaffoldMessenger.of(context).showSnackBar(
//         SnackBar(content: Text('الرجاء تحميل ملف Excel أولاً')),
//       );
//       return;
//     }
//
//     String cell = _cellController.text.trim().toUpperCase();
//     String value = _textController.text;
//
//     if (cell.isEmpty) {
//       ScaffoldMessenger.of(context).showSnackBar(
//         SnackBar(content: Text('الرجاء إدخال خانة صالحة')),
//       );
//       return;
//     }
//
//     try {
//       // التحقق من أن القيمة رقمية
//       int numericValue = int.tryParse(value) ?? 0;
//
//       CellIndex cellIndex = CellIndex.indexByString(cell);
//
//       // استخدام IntCellValue بدلاً من TextCellValue
//       _sheet.updateCell(cellIndex, IntCellValue(numericValue));
//
//       _textController.clear();
//
//       ScaffoldMessenger.of(context).showSnackBar(
//         SnackBar(
//             content: Text('تمت كتابة الرقم $numericValue في الخانة $cell')),
//       );
//     } catch (e) {
//       ScaffoldMessenger.of(context).showSnackBar(
//         SnackBar(content: Text('خطأ في تحديد الخانة أو القيمة: $e')),
//       );
//     }
//   }
//
//   Future<void> _exportToExcel() async {
//     if (!_fileLoaded) {
//       ScaffoldMessenger.of(context).showSnackBar(
//         SnackBar(content: Text('لا يوجد بيانات لتصديرها')),
//       );
//       return;
//     }
//
//     try {
//       final bytes = _excel.encode()!;
//       final blob = html.Blob([bytes]);
//       final url = html.Url.createObjectUrlFromBlob(blob);
//       final anchor = html.AnchorElement(href: url)
//         ..target = 'blank'
//         ..download = _fileName?.replaceAll('.xlsx', '_modified.xlsx') ??
//             'modified_excel.xlsx'
//         ..click();
//       html.Url.revokeObjectUrl(url);
//     } catch (e) {
//       ScaffoldMessenger.of(context).showSnackBar(
//         SnackBar(content: Text('حدث خطأ أثناء التصدير: $e')),
//       );
//     }
//   }
//
//   Future<void> _exportToPdf() async {
//     if (!_fileLoaded) {
//       ScaffoldMessenger.of(context).showSnackBar(
//         SnackBar(content: Text('لا يوجد بيانات لتصديرها')),
//       );
//       return;
//     }
//
//     try {
//       final pdf = pw.Document();
//
//       pdf.addPage(
//         pw.Page(
//           pageFormat: PdfPageFormat.a4.landscape,
//           build: (pw.Context context) {
//             return pw.Directionality(
//               textDirection: pw.TextDirection.rtl,
//               child: pw.Table(
//                 border: pw.TableBorder.all(),
//                 columnWidths: _calculateColumnWidths(),
//                 children: _buildPdfTableRows(),
//               ),
//             );
//           },
//         ),
//       );
//
//       final bytes = await pdf.save();
//       final blob = html.Blob([bytes], 'application/pdf');
//       final url = html.Url.createObjectUrlFromBlob(blob);
//       final anchor = html.AnchorElement(href: url)
//         ..target = 'blank'
//         ..download = _fileName?.replaceAll('.xlsx', '.pdf') ?? 'converted.pdf'
//         ..click();
//       html.Url.revokeObjectUrl(url);
//     } catch (e) {
//       ScaffoldMessenger.of(context).showSnackBar(
//         SnackBar(content: Text('حدث خطأ أثناء إنشاء PDF: $e')),
//       );
//     }
//   }
//
//   Map<int, pw.TableColumnWidth> _calculateColumnWidths() {
//     Map<int, pw.TableColumnWidth> widths = {};
//     for (int i = 0; i < _sheet.maxColumns; i++) {
//       widths[i] = pw.FlexColumnWidth(1);
//     }
//     return widths;
//   }
//
//   List<pw.TableRow> _buildPdfTableRows() {
//     List<pw.TableRow> rows = [];
//
//     for (var row in _sheet.rows) {
//       rows.add(
//         pw.TableRow(
//           children: row.map((cell) {
//             return pw.Container(
//               padding: pw.EdgeInsets.all(4),
//               child: pw.Text(
//                 _getCellValue(cell),
//                 style: pw.TextStyle(
//                   fontSize: 10,
//                   font: pw.Font.courier(),
//                 ),
//               ),
//             );
//           }).toList(),
//         ),
//       );
//     }
//
//     return rows;
//   }
//
//   String _getCellValue(Data? cell) {
//     // تغيير نوع المعلمة من Cell? إلى Data?
//     if (cell == null) return '';
//
//     if (cell.value is String) {
//       return cell.value as String;
//     } else if (cell.value is num) {
//       return cell.value.toString();
//     } else if (cell.value is DateTime) {
//       return cell.value.toString();
//     } else if (cell.value is bool) {
//       return cell.value.toString();
//     }
//     return cell.value?.toString() ?? '';
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Expanded(
//       child: Padding(
//         padding: const EdgeInsets.all(20.0),
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             ElevatedButton(
//               onPressed: _pickExcelFile,
//               child: Text("اختيار ملف Excel"),
//             ),
//             SizedBox(height: 10),
//             if (_fileLoaded)
//               Text(
//                 'ملف مفتوح: $_fileName',
//                 style: TextStyle(color: Colors.green),
//               ),
//             SizedBox(height: 20),
//             TextField(
//               controller: _cellController,
//               decoration: InputDecoration(
//                 labelText: 'حدد الخانة (مثل A1)',
//                 border: OutlineInputBorder(),
//               ),
//             ),
//             SizedBox(height: 10),
//             TextField(
//               controller: _textController,
//               decoration: InputDecoration(
//                 labelText: 'أدخل النص',
//                 border: OutlineInputBorder(),
//               ),
//             ),
//             SizedBox(height: 20),
//             ElevatedButton(
//               onPressed: _writeToCell,
//               child: Text("حفظ في الخانة"),
//             ),
//             SizedBox(height: 20),
//             Row(
//               mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//               children: [
//                 ElevatedButton(
//                   onPressed: _exportToExcel,
//                   child: Text("حفظ كـ Excel"),
//                   style: ElevatedButton.styleFrom(
//                     backgroundColor: Colors.green,
//                   ),
//                 ),
//                 ElevatedButton(
//                   onPressed: _exportToPdf,
//                   child: Text("حفظ كـ PDF"),
//                   style: ElevatedButton.styleFrom(
//                     backgroundColor: Colors.blue,
//                   ),
//                 ),
//               ],
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
