import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vms_school/Icons_File/v_m_s__icons_icons.dart';
import 'package:vms_school/Link/Controller/AdminController/DropDownCurriculumn_Controller.dart';
import 'package:vms_school/widgets/ButtonsDialog.dart';
import 'package:vms_school/widgets/GridAnimation.dart';
import 'package:vms_school/widgets/VMSAlertDialog.dart';

class CurriculumGrid extends StatelessWidget {
  CurriculumGrid({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<DropDownCurriculumn_Controller>(builder: (control) {
      return GridView.builder(
        padding: const EdgeInsets.only(top: 10, left: 40, right: 40),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 4,
            crossAxisSpacing: 20.0,
            mainAxisSpacing: 20.0,
            childAspectRatio: 0.9),
        itemCount: control.Curriculum.length,
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
                            child: Image.asset(
                              "../../images/book.jpg",
                              fit: BoxFit.fitWidth,
                            ))),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 5.0, bottom: 5.0),
                          child: Text(
                            "${control.Curriculum[index]['name']}",
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
                                "Max Mark : ${control.Curriculum[index]['max']}"),
                            Padding(
                              padding:
                                  const EdgeInsets.only(top: 5.0, bottom: 5.0),
                              child: Text(
                                  "Passing Mark : ${control.Curriculum[index]['passing']}"),
                            ),
                            Text(
                                "Is Failure Agent : ${control.Curriculum[index]['isFulling']}",
                                style: TextStyle(
                                  color: control.Curriculum[index]
                                              ['isFulling'] ==
                                          "true"
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
                                            control.deleteCurriculum(index);
                                            Get.back();
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
                                              "Do You Want To Delete (${control.Curriculum[index]['name']}) Curriculum",
                                              style: Get.theme.primaryTextTheme
                                                  .bodyMedium!
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
      );
    });
  }
}
