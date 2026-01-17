import 'dart:ui' as ui;
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:get/get.dart';
import 'package:vms_school/Link/Controller/AdminController/Students_Controllers/Jalaa_For_Students/Jalaa_Controller.dart';
import 'package:vms_school/view/SMS_Platform/Admin/Students_Manager/Export_Jalaa_Pages/All_Jalaas_Dir/All_Jalaas_Table.dart';
import 'package:vms_school/view/SMS_Platform/Admin/Students_Manager/Export_Jalaa_Pages/All_Jalaas_Dir/DawamTable.dart';
import 'package:vms_school/view/SMS_Platform/Admin/Students_Manager/Export_Jalaa_Pages/All_Jalaas_Dir/Final_Table.dart';
import 'package:vms_school/view/SMS_Platform/Admin/Students_Manager/Export_Jalaa_Pages/All_Jalaas_Dir/Tawjihat_Table.dart';
import 'package:vms_school/view/SMS_Platform/Admin/Students_Manager/Export_Jalaa_Pages/Convert_Functions_For_All.dart';

class ExportJalaa extends StatefulWidget {
  ExportJalaa({super.key});

  @override
  State<ExportJalaa> createState() => _ExportJalaaState();
}

class _ExportJalaaState extends State<ExportJalaa> {
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
      child: Column(
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
               All_Jalaas_Table(),
               Row(
                 mainAxisAlignment: MainAxisAlignment.start,
                 crossAxisAlignment: CrossAxisAlignment.start,
                 spacing: 50,
                 children: [
                   Row(
                     spacing: 60,
                     children: [
                       DawamTable(),
                       Tawjihat_Table()
                     ],
                   ),
                   Column( spacing: 15.0,
                     mainAxisAlignment: MainAxisAlignment.start,
                     crossAxisAlignment: CrossAxisAlignment.start,
                     children: [

                       Row( spacing: 20.0,
                         children: [
                           FinalTable(),

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
                                     width: 170,
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
                                     width: 170,
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
                         width: 745,
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
                 CustomHeaderTable(),
              ),
          ],
        ),
      ),
    );
  });
}
