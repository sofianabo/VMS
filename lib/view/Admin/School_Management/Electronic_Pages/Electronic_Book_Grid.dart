import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx/Icons_File/v_m_s__icons_icons.dart';
import 'package:getx/Link/API/AdminAPI/EditGuardianAPI.dart';
import 'package:getx/Link/Controller/AdminController/Labrary_Controller.dart';
import 'package:getx/Link/Controller/AdminController/allGaurdianController.dart';
import 'package:getx/widgets/ButtonsDialog.dart';
import 'package:getx/widgets/GridAnimation.dart';
import 'package:getx/widgets/TextFieldDialog.dart';
import 'package:getx/widgets/VMSAlertDialog.dart';

class ElectronicBookGrid extends StatelessWidget {
  ElectronicBookGrid({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<Labrary_Controller>(builder: (control) {
      return GridView.builder(
        padding: const EdgeInsets.only(top: 10, left: 40, right: 40),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: Get.width <= 1226 && Get.width >= 988
                ? 3
                : Get.width <= 987 && Get.width >= 759
                    ? 2
                    : Get.width <= 758
                        ? 1
                        : 4,
            crossAxisSpacing: 45.0,
            mainAxisSpacing: 20.0,
            childAspectRatio: Get.width <= 1226 && Get.width >= 988
                ? 2.2
                : Get.width <= 987 && Get.width >= 759
                    ? 2.7
                    : Get.width <= 758 && Get.width >= 573
                        ? 3.8
                        : Get.width <= 573
                            ? 3.0
                            : 1.8),
        itemCount: control.books.length,
        itemBuilder: (context, index) {
          return HoverScaleCard(
            child: GestureDetector(
              onTap: () {},
              child: Stack(
                alignment: Alignment.topLeft,
                children: [
                  Container(
                      padding: const EdgeInsets.all(5),
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
                        children: [
                          Spacer(),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(
                                width: 50,
                              ),
                              Expanded(
                                child: Center(
                                  child: Text(
                                    textAlign: TextAlign.center,
                                    "${control.books[index]['name']}",
                                    style: TextStyle(fontSize: 26),
                                  ),
                                ),
                              )
                            ],
                          ),
                          Spacer(),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              IconButton(
                                  style: ButtonStyle(
                                      backgroundColor: WidgetStatePropertyAll(
                                          Color(0xffB03D3D)),
                                      shape: WidgetStatePropertyAll(
                                          RoundedRectangleBorder(
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(5))))),
                                  onPressed: () {
                                    Get.dialog(VMSAlertDialog(
                                      action: [
                                        ButtonDialog(
                                            text: "Delete",
                                            onPressed: () {},
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
                                      contents: Container(
                                          width: 500,
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            children: [
                                              Text(
                                                "Do You Want To Delete ${control.books[index]['name']} Book",
                                                style: Get
                                                    .theme
                                                    .primaryTextTheme
                                                    .bodyMedium!
                                                    .copyWith(
                                                        fontSize: 16,
                                                        fontWeight:
                                                            FontWeight.normal),
                                              ),
                                            ],
                                          )),
                                      apptitle: "Delete Electronic Book",
                                      subtitle: "none",
                                    ));
                                  },
                                  icon: Icon(VMS_Icons.bin,
                                      size: 16, color: Colors.white)),
                            ],
                          )
                        ],
                      )),
                  Align(
                      alignment: Alignment(-1.5, 2),
                      child: Image.asset("../../images/labrary3d.png",
                          height: 300)),
                ],
              ),
            ),
          );
        },
      );
    });
  }
}