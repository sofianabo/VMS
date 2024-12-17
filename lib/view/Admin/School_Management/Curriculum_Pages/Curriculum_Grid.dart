import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:get/get.dart';
import 'package:vms_school/Icons_File/v_m_s__icons_icons.dart';
import 'package:vms_school/Link/API/API.dart';
import 'package:vms_school/Link/Controller/WidgetController/DropDown_Controllers/DropDownCurriculumn_Controller.dart';
import 'package:vms_school/view/Admin/Dashboard/Dashboard_Second_Row.dart';
import 'package:vms_school/widgets/ButtonsDialog.dart';
import 'package:vms_school/widgets/GridAnimation.dart';
import 'package:vms_school/widgets/Schema_Widget.dart';
import 'package:vms_school/widgets/VMSAlertDialog.dart';

class CurriculumGrid extends StatelessWidget {
  CurriculumGrid({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<Curriculumn_Controller>(builder: (control) {
      return control.isLoading ?
      GridView.builder(
        padding: const EdgeInsets.only(top: 10, left: 40, right: 40),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 4,
            crossAxisSpacing: 20.0,
            mainAxisSpacing: 20.0,
            childAspectRatio: 0.9),
        itemCount: 8,
        itemBuilder: (context, index) {
          return HoverScaleCard(
            child: Container(
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    border: Border.all(color: Colors.grey, width: 0.5),
                    color: Colors.white,
                    boxShadow: const [
                      BoxShadow(
                          color: Colors.black26,
                          offset: Offset(0, 2),
                          blurRadius: 1)
                    ]),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                        child: SchemaWidget(width: 500, height: 150)),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Padding(
                            padding: const EdgeInsets.only(top: 5.0, bottom: 5.0),
                            child: SchemaWidget(width: 150, height: 20)
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            SchemaWidget(width: 150, height: 20),
                            Padding(
                              padding:
                              const EdgeInsets.only(top: 5.0, bottom: 5.0),
                              child: SchemaWidget(width: 150, height: 20),
                            ),
                            SchemaWidget(width: 150, height: 20),
                          ],
                        ),
                        SchemaWidget(width: 40, height: 40)
                      ],
                    )
                  ],
                )),
          );
        },
      ).animate(onPlay: (controller) => controller.repeat()).shimmer(
          angle: 1,
          color: Colors.grey.withOpacity(0.2),
          duration: Duration(seconds: 1),
          delay: Duration(seconds: 1))
          :
      control.curriculum!.isNotEmpty ? GridView.builder(
        padding: const EdgeInsets.only(top: 10, left: 40, right: 40),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 4,
            crossAxisSpacing: 20.0,
            mainAxisSpacing: 20.0,
            childAspectRatio: 0.9),
        itemCount: control.curriculum!.length,
        itemBuilder: (context, index) {
          return HoverScaleCard(
            child: Container(
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    border: Border.all(color: Colors.grey, width: 0.5),
                    color: Colors.white,
                    boxShadow: const [
                      BoxShadow(
                          color: Colors.black26,
                          offset: Offset(0, 2),
                          blurRadius: 1)
                    ]),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                        child: SizedBox(
                            width: 500,
                            child: Image.network(
                              "${getimage}${control.curriculum![index].imageId}",
                              fit: BoxFit.fitWidth,
                            ))),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 5.0, bottom: 5.0),
                          child: Text(
                            "${control.curriculum![index].name}",
                            style: TextStyle(
                                color: Get.theme.primaryColor,
                                fontSize: 18,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                                "Max Mark : ${control.curriculum![index].maxMark}"),
                            Padding(
                              padding:
                                  const EdgeInsets.only(top: 5.0, bottom: 5.0),
                              child: Text(
                                  "Passing Mark : ${control.curriculum![index].passingMark}"),
                            ),
                            Text(
                                "Is Failure Agent : ${control.curriculum![index].type == 1 ? "Yes" : "No"}",
                                style: TextStyle(
                                  color: control.curriculum![index].type ==
                                          "1"
                                      ? Color(0xffB03D3D)
                                      : Get.theme.primaryColor,
                                )),
                          ],
                        ),
                        Container(
                          width: 35,
                          height: 35,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(5),
                              boxShadow: const [
                                BoxShadow(
                                    color: Colors.black12,
                                    offset: Offset(0, 2),
                                    blurRadius: 1)
                              ]),
                          child: IconButton(
                              style: ButtonStyle(
                                  backgroundColor:
                                      WidgetStatePropertyAll(Color(0xffB03D3D)),
                                  shape: WidgetStatePropertyAll(
                                      RoundedRectangleBorder(
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(5))))),
                              onPressed: () {
                                Get.dialog(VMSAlertDialog(
                                    action: [
                                      ButtonDialog(
                                          text: "Delete",
                                          onPressed: () {
                                            // control.deleteCurriculum(index);
                                            // Get.back();
                                          },
                                          color: Color(0xffB03D3D),
                                          width: 80),
                                      ButtonDialog(
                                          text: "Cancel",
                                          onPressed: () {
                                            Get.back();
                                          },
                                          color: Get.theme.primaryColor,
                                          width: 80)
                                    ],
                                    contents: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        Container(
                                          width: 400,
                                        ),
                                        Row(
                                          children: [
                                            Text(
                                              "Do You Want To Delete (${control.curriculum![index].name}) Curriculum",
                                              style: Get.theme.textTheme.bodyMedium!
                                                  .copyWith(
                                                      fontSize: 16,
                                                      fontWeight:
                                                          FontWeight.normal),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                    apptitle: "Delete Division",
                                    subtitle: "none"));
                              },
                              icon: Icon(VMS_Icons.bin,
                                  size: 16, color: Colors.white)),
                        ),
                      ],
                    )
                  ],
                )),
          );
        },
      )
      :Center(child: Text("No Curriculum" , style: Get.theme.textTheme.titleLarge!.copyWith(
          fontSize: 22,
          fontWeight: FontWeight.normal
      )));
    });
  }
}
