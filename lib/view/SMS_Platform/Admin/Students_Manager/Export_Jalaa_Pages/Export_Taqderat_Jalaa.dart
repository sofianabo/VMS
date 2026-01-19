import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:get/get.dart';
import 'package:printing/printing.dart';
import 'package:vms_school/Link/API/Share_Image.dart';
import 'package:vms_school/Link/Controller/AdminController/Students_Controllers/Jalaa_For_Students/Jalaa_Controller.dart';
import 'package:vms_school/view/SMS_Platform/Admin/Students_Manager/Export_Jalaa_Pages/All_Jalaas_Dir/DawamTable.dart';
import 'package:vms_school/view/SMS_Platform/Admin/Students_Manager/Export_Jalaa_Pages/All_Jalaas_Dir/Final_Table.dart';
import 'package:vms_school/view/SMS_Platform/Admin/Students_Manager/Export_Jalaa_Pages/All_Jalaas_Dir/Final_Table_Taqderat.dart';
import 'package:vms_school/view/SMS_Platform/Admin/Students_Manager/Export_Jalaa_Pages/All_Jalaas_Dir/Tawjihat_Table.dart';
import 'package:vms_school/view/SMS_Platform/Admin/Students_Manager/Export_Jalaa_Pages/Convert_Functions_For_All.dart';
import 'package:vms_school/view/SMS_Platform/Admin/Students_Manager/Export_Jalaa_Pages/Export_Sames_Jalaa.dart';
import 'package:vms_school/view/SMS_Platform/Admin/Students_Manager/Export_Jalaa_Pages/Taqderat_Jalaa.dart';
import 'dart:ui' as ui;

class Export_Taqderat_Jalaa extends StatefulWidget {
  Export_Taqderat_Jalaa({super.key});

  @override
  State<Export_Taqderat_Jalaa> createState() => _Export_Taqderat_JalaaState();
}

class _Export_Taqderat_JalaaState extends State<Export_Taqderat_Jalaa> {
  final String fontFamily = "tnr";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("نموذج"),
        actions: [
          IconButton(
            icon: const Icon(Icons.print),
            onPressed: () => captureAndPrint(),
          ),
        ],
      ),
      body: Padding(
          padding: const EdgeInsets.all(25.0), child: buildPrintContent()),
    );
  }
}

class CustomHeaderTable extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child:  Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          GetBuilder<Jalaa_Controller>(builder: (controller) {

            return Column(
              spacing: 15.0,
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [

                Taqderat_Jalaa(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  spacing: 13,
                  children: [
                    Column(
                      spacing: 15.0,
                      children: [
                        Row(
                          spacing: 15.0,
                          children: [
                            Container(
                              width: 200,
                              padding: EdgeInsets.all(5.0),
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.all(Radius.circular(50)),
                                border: Border.all( color: Colors.grey.withOpacity(0.3)),
                              ),
                              child:     Text(
                                  style: TextStyle(
                                      fontFamily: "tnr"
                                  ),
                                  "التوجيهات التربوية للمعلم"),
                            ),
                            Container(
                              alignment: Alignment.center,
                              width: 415,
                              padding: EdgeInsets.all(5.0),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.all(Radius.circular(50)),
                                border: Border.all(color: Colors.grey),
                              ),
                              child: Text(
                                  style: TextStyle(
                                      fontFamily: "tnr"
                                  ),
                                  "${controller.rebortCard!.rebort!.molahdat!.firstSemester}"),

                            ),
                          ],
                        ),
                        Row(
                          spacing: 20,
                          children: [
                            DawamTable(),
                            Tawjihat_Table(isTaqderat: true,)
                          ],
                        ),
                      ],
                    ),
                    Column( spacing: 15.0,
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          spacing: 15.0,
                          children: [
                            Container(
                              width: 200,
                              padding: EdgeInsets.all(5.0),
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.all(Radius.circular(50)),
                                border: Border.all( color: Colors.grey.withOpacity(0.3)),
                              ),
                              child:     Text(
                                  style: TextStyle(
                                      fontFamily: "tnr"
                                  ),
                                  "التوجيهات التربوية للمعلم"),
                            ),
                            Container(
                              alignment: Alignment.center,
                              width: 580,
                              padding: EdgeInsets.all(5.0),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.all(Radius.circular(50)),
                                border: Border.all(color: Colors.grey),
                              ),
                              child: Text(
                                  style: TextStyle(
                                      fontFamily: "tnr"
                                  ),
                                  "${controller.rebortCard!.rebort!.molahdat!.secondSemester}"),
                            ),
                          ],
                        ),
                        Row( spacing: 20.0,
                          children: [

                            FinalTableTaqderat(),

                            Column(
                              spacing: 15.0,
                              children: [

                                Row(
                                  spacing: 30.0,
                                  children: [
                                    Container(
                                      width: 140,
                                      alignment: Alignment.center,
                                      padding: EdgeInsets.all(10.0),
                                      decoration: BoxDecoration(
                                          borderRadius: BorderRadius.all(Radius.circular(10)),
                                          border: Border.all(color: Colors.grey),
                                          color: Colors.grey.withOpacity(0.3)

                                      ),
                                      child: Text("      اسم المدير/ة      ", style: TextStyle(fontFamily: "Cairo"),),
                                    ),
                                    Container(
                                        alignment: Alignment.center,
                                        width: 207,
                                        padding: EdgeInsets.all(10.0),
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.all(Radius.circular(10)),
                                          border: Border.all(color: Colors.grey),
                                        ),
                                        child: Text("${controller.rebortCard!.rebort!.molahdat!.schoolmanager}", style: TextStyle(fontFamily: "Cairo"),
                                        ))
                                  ],
                                ),
                                Row(
                                  spacing: 30.0,
                                  children: [
                                    Container(
                                      width: 140,
                                      height: 140,
                                      alignment: Alignment.center,
                                      padding: EdgeInsets.all(10.0),
                                      decoration: BoxDecoration(
                                          borderRadius: BorderRadius.all(Radius.circular(10)),
                                          border: Border.all(color: Colors.grey),
                                          color: Colors.grey.withOpacity(0.3)

                                      ),
                                      child: Text("توقيع و ختم\n المدير/ة",textAlign: TextAlign.center, style: TextStyle(fontFamily: "Cairo")),
                                    ),
                                    Container(
                                      alignment: Alignment.center,
                                      width: 207,
                                      height: 140,
                                      padding: EdgeInsets.all(10.0),
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.all(Radius.circular(10)),
                                        border: Border.all(color: Colors.grey),
                                      ),
                                      child: Text(""),
                                    )
                                  ],
                                )
                              ],
                            )
                          ],
                        ),
                        Container(
                          width: 792,
                          padding: EdgeInsets.all(5.0),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(50)),
                            border: Border.all(color: Colors.grey),

                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Text(
                                  style: TextStyle(
                                      fontFamily: "tnr"
                                  ),
                                  "حرر في يوم:  "),
                              Text(
                                  style: TextStyle(
                                      fontFamily: "tnr"
                                  ),
                                  "الواقع في       /       144 هـ"),
                              Text(
                                  style: TextStyle(
                                      fontFamily: "tnr"
                                  ),
                                  "الموافق لــ      /       /  2025 م"),
                            ],
                          ),
                        ),
                      ],
                    )
                  ],
                )
              ],

            );
          }),
          // The_Bottom_Table_Design()
        ],
      ),
    );
  }
}


Widget buildPrintContent() {
  final String fontFamily = "tnr";
  return GetBuilder<Jalaa_Controller>(builder: (controller) {
    return Padding(
      padding: const EdgeInsets.only(left: 30.0, right: 30),
      child: Container(

        alignment: Alignment.topCenter,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          spacing: 12.0,
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 12.0),
              child: Text("الجلاءُ المدرسيّ",
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      fontFamily: "Cairo",
                      color: Color(0xFF508D3E)

                  )),
            ),
            Container(
              padding: EdgeInsets.all(12.0),

              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(50)),
                border: Border.all(color: Colors.grey),

              ),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text("الرقم التسلسلي ${convertToArabicNumbers(controller.rebortCard!.rebort!.studentsInfo!.tasalsol.toString())}ّ",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        fontFamily: fontFamily,

                      )),

                  Text("المدرسة الافتراضية الحديثة",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        fontFamily: fontFamily,

                      )),
                  Text("الصف الخامس",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        fontFamily: fontFamily,

                      )),
                  Text("${controller.rebortCard!.rebort!.studentsInfo!.division}",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        fontFamily: fontFamily,

                      )),
                  Text("كود التحقق:",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        fontFamily: fontFamily,

                      )),
                  Text("رقم السجل العام ${convertToArabicNumbers(controller.rebortCard!.rebort!.studentsInfo!.tasalsol.toString())}",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        fontFamily: fontFamily,

                      )),
                ],
              ),
            ),
            Container(

              padding: EdgeInsets.all(12.0),
              child: Row(
                spacing: 4.0,
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                      alignment: Alignment.center,
                      padding: EdgeInsets.only(left: 8.0 , right: 8.0),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(50)),
                        border: Border.all(color: Colors.grey),
                      ),child: Text("التلميذ/ة",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        fontFamily: fontFamily,

                      ))),
                  Expanded(
                    child: Container(
                        alignment: Alignment.center,
                        padding: EdgeInsets.only(left: 8.0 , right: 8.0),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(50)),
                          border: Border.all(color: Colors.grey),
                        ),child: Text("${controller.rebortCard!.rebort!.studentsInfo!.studentsFullName}",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.normal,
                          fontFamily: fontFamily,

                        ))),
                  ),
                  Container(
                      alignment: Alignment.center,
                      padding: EdgeInsets.only(left: 8.0 , right: 8.0),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(50)),
                        border: Border.all(color: Colors.grey),
                      ),child: Text("ابن/ة السيد",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        fontFamily: fontFamily,

                      ))),
                  Expanded(
                    child: Container(
                        alignment: Alignment.center,
                        padding: EdgeInsets.only(left: 8.0 , right: 8.0),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(50)),
                          border: Border.all(color: Colors.grey),
                        ),child: Text("${controller.rebortCard!.rebort!.studentsInfo!.fatherName}",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.normal,
                          fontFamily: fontFamily,

                        ))),
                  ),
                  Container(
                      alignment: Alignment.center,
                      padding: EdgeInsets.only(left: 8.0 , right: 8.0),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(50)),
                        border: Border.all(color: Colors.grey),
                      ),child: Text("والدته/ها",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        fontFamily: fontFamily,

                      ))),
                  Expanded(
                    child: Container(
                        alignment: Alignment.center,
                        padding: EdgeInsets.only(left: 8.0 , right: 8.0),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(50)),
                          border: Border.all(color: Colors.grey),
                        ),child: Text("${controller.rebortCard!.rebort!.studentsInfo!.motherName}",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.normal,
                          fontFamily: fontFamily,

                        ))),
                  ),
                  Container(
                      alignment: Alignment.center,
                      padding: EdgeInsets.only(left: 8.0 , right: 8.0),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(50)),
                        border: Border.all(color: Colors.grey),
                      ),child: Text("مواليد",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        fontFamily: fontFamily,

                      ))),
                  Expanded(
                    child: Container(
                        alignment: Alignment.center,
                        padding: EdgeInsets.only(left: 8.0 , right: 8.0),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(50)),
                          border: Border.all(color: Colors.grey),
                        ),child: Text("${convertToArabicNumbers(controller.rebortCard!.rebort!.studentsInfo!.birthdate.toString())}",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.normal,
                          fontFamily: fontFamily,

                        ))),
                  ),
                  Container(
                      alignment: Alignment.center,
                      padding: EdgeInsets.only(left: 8.0 , right: 8.0),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(50)),
                        border: Border.all(color: Colors.grey),
                      ),child: Text("العام الدراسي",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        fontFamily: fontFamily,

                      ))),
                  Expanded(
                    child: Container(
                        alignment: Alignment.center,
                        padding: EdgeInsets.only(left: 8.0 , right: 8.0),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(50)),
                          border: Border.all(color: Colors.grey),
                        ),child: Text("${convertToArabicNumbers(controller.rebortCard!.rebort!.studentsInfo!.seassion.toString())}",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.normal,
                          fontFamily: fontFamily,

                        ))),
                  ),






                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10.0),
              child:  // ← قيمة التكبير (1.0 = الحجم الطبيعي، 2.0 = ضعف الحجم)
               CustomHeaderTable()),

          ],
        ),
      ),
    );
  });
}







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