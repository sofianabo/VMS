import 'dart:ui' as ui;
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:get/get.dart';
import 'package:vms_school/Link/Controller/AdminController/Students_Controllers/Jalaa_For_Students/Jalaa_Controller.dart';
import 'package:vms_school/view/SMS_Platform/Admin/Students_Manager/Export_Jalaa_Pages/Convert_Functions_For_All.dart';
import 'package:vms_school/view/SMS_Platform/Admin/Students_Manager/Export_Jalaa_Pages/SHID1_Pages/First_Table_SHID1/First_Table_Design_SHID1.dart';
import 'package:vms_school/view/SMS_Platform/Admin/Students_Manager/Export_Jalaa_Pages/SHID1_Pages/Second_Table_SHID1.dart';

class SH1_Jalaa extends StatefulWidget {
  SH1_Jalaa({super.key});

  @override
  State<SH1_Jalaa> createState() => _SH1_JalaaState();
}

class _SH1_JalaaState extends State<SH1_Jalaa> {
  final String fontFamily = "tnr";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: const Text("نموذج الإجلالة"),
      //   actions: [
      //     IconButton(
      //       icon: const Icon(Icons.print),
      //       onPressed: () => captureAndPrint(),
      //     ),
      //   ],
      // ),
      body: SingleChildScrollView(
        child: Padding(
            padding: const EdgeInsets.all(25.0), child: buildPrintContent()),
      ),
    );
  }
}

class CustomHeaderTable extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [First_Table_Design_SHID1(), Second_Table_Design_SHID1()],
          ),
          // GetBuilder<Jalaa_Controller>(builder: (controller) {
          //   int totalInsideCurrCount =
          //       controller.rebortCard!.rebort!.mainCurriculum?.fold<int>(0,
          //               (sum, main) => sum + (main.insideCurr?.length ?? 0)) ??
          //           0;
          //
          //   return Row(
          //     mainAxisSize: MainAxisSize.min,
          //     mainAxisAlignment: MainAxisAlignment.start,
          //     crossAxisAlignment: CrossAxisAlignment.start,
          //     children: [
          //
          //     ],
          //   );
          // }),
        ],
      ),
    );
  }
}

class WidgetWraper {
  static Future<ui.Image> toImage(
    Widget widget, {
    required Size logicalSize,
    double pixelRatio = 1.0,
  }) async {
    final repaintBoundary = RenderRepaintBoundary();
    final renderView = RenderView(
      view: WidgetsBinding.instance.platformDispatcher.views.first,
      child: RenderPositionedBox(
        alignment: Alignment.center,
        child: repaintBoundary,
      ),
      configuration: ViewConfiguration(
        logicalConstraints: BoxConstraints(maxHeight: 1200, maxWidth: 1500),
        devicePixelRatio: pixelRatio,
      ),
    );

    final pipelineOwner = PipelineOwner();
    final buildOwner = BuildOwner(focusManager: FocusManager());
    final renderElement = RenderObjectToWidgetAdapter<RenderBox>(
      container: repaintBoundary,
      child: Directionality(
        textDirection: TextDirection.rtl,
        child: Material(child: widget),
      ),
    ).attachToRenderTree(buildOwner);

    pipelineOwner.rootNode = renderView;
    renderView.prepareInitialFrame();
    buildOwner.buildScope(renderElement);
    buildOwner.finalizeTree();
    pipelineOwner.flushLayout();
    pipelineOwner.flushCompositingBits();
    pipelineOwner.flushPaint();

    final image = await repaintBoundary.toImage(pixelRatio: pixelRatio);
    return image;
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
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Column(
                  spacing: 5.0,
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("الجمهورية العربية السورية",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          fontFamily: fontFamily,
                        )),
                    Text("وزارة التربية و التعليم",
                        style: TextStyle(
                          fontFamily: fontFamily,
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        )),
                    Text("مديرية التربية و التعليم في محافظة: السويداء",
                        style: TextStyle(
                          fontFamily: fontFamily,
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        )),
                    Text("المدرسة الافتراضية الحديثة",
                        style: TextStyle(
                            fontFamily: fontFamily,
                            fontSize: 16,
                            fontWeight: FontWeight.bold)),
                  ],
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      "مرحلة التعليم الأساسي",
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        fontFamily: fontFamily,
                      ),
                    ),
                    Text(
                      "- الحلقة الأولى - / الصف الأول /",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        fontFamily: fontFamily,
                      ),
                    ),
                  ],
                ),
                Text(
                    convertToArabicNumbers(
                        "العام الدراسي: ${controller.rebortCard!.rebort!.studentsInfo!.seassion}"),
                    style: TextStyle(
                        fontFamily: fontFamily,
                        fontSize: 16,
                        fontWeight: FontWeight.bold)),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(top: 5.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                      convertToArabicNumbers(
                          "الرقم المتسلسل (${controller.rebortCard!.rebort!.studentsInfo!.tasalsol})"),
                      style: TextStyle(
                          fontFamily: fontFamily,
                          fontSize: 14,
                          fontWeight: FontWeight.bold)),
                  Text(
                      "اسم التلميذ/ة: ${controller.rebortCard!.rebort!.studentsInfo!.studentsFullName}",
                      style: TextStyle(
                          fontFamily: fontFamily,
                          fontSize: 14,
                          fontWeight: FontWeight.bold)),
                  Text(
                      " الأب:${controller.rebortCard!.rebort!.studentsInfo!.fatherName}",
                      style: TextStyle(
                          fontFamily: fontFamily,
                          fontSize: 14,
                          fontWeight: FontWeight.bold)),
                  Text(
                      "الأم: ${controller.rebortCard!.rebort!.studentsInfo!.motherName}",
                      style: TextStyle(
                          fontFamily: fontFamily,
                          fontSize: 14,
                          fontWeight: FontWeight.bold)),
                  Text(convertToArabicNumbers("الصف:الخامس"),
                      style: TextStyle(
                          fontFamily: fontFamily,
                          fontSize: 14,
                          fontWeight: FontWeight.bold)),
                  Text(
                      convertToArabicNumbers(
                          "الشعبة: ${controller.rebortCard!.rebort!.studentsInfo!.division}"),
                      style: TextStyle(
                          fontFamily: fontFamily,
                          fontSize: 14,
                          fontWeight: FontWeight.bold)),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 25.0, right: 65.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                      convertToArabicNumbers(
                          "تاريخ الميلاد: ${controller.rebortCard!.rebort!.studentsInfo!.birthdate}"),
                      style: TextStyle(
                          fontFamily: fontFamily,
                          fontSize: 14,
                          fontWeight: FontWeight.bold)),
                  Text(
                      "اللغة: (${controller.rebortCard!.rebort!.studentsInfo!.language})",
                      style: TextStyle(
                        fontFamily: fontFamily,
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                      )),
                  Text(
                      convertToArabicNumbers(
                          "رقمه في السجل العام: ${controller.rebortCard!.rebort!.studentsInfo!.raqSejel}"),
                      style: TextStyle(
                          fontFamily: fontFamily,
                          fontSize: 14,
                          fontWeight: FontWeight.bold)),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 40.0),
              child: Transform.scale(
                scale:
                    1.06, // ← قيمة التكبير (1.0 = الحجم الطبيعي، 2.0 = ضعف الحجم)
                child: CustomHeaderTable(),
              ),
            ),
          ],
        ),
      ),
    );
  });
}
