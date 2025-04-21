import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:get/get.dart';
import 'package:vms_school/Icons_File/v_m_s__icons_icons.dart';
import 'package:vms_school/Link/API/API.dart';
import 'package:vms_school/Link/API/AdminAPI/School/School_Screen_APIs/Illness_APIs/Delete_Illness_API.dart';
import 'package:vms_school/Link/API/DownloadFiles.dart';
import 'package:vms_school/Link/Controller/AdminController/School_Controllers/Illness_Controller.dart';
import 'package:vms_school/Link/Controller/AdminController/School_Controllers/Labrary_Controller.dart';
import 'package:vms_school/Theme/themeController.dart';
import 'package:vms_school/Translate/local_controller.dart';
import 'package:vms_school/main.dart';
import 'package:vms_school/widgets/ButtonsDialog.dart';
import 'package:vms_school/widgets/GridAnimation.dart';
import 'package:vms_school/widgets/Schema_Widget.dart';
import 'package:vms_school/widgets/VMSAlertDialog.dart';

class Illness_Grid extends StatelessWidget {
  Illness_Grid({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    int getCrossAxisCount() {
      if (screenWidth >= 1132) return 4;
      if (screenWidth >= 950) return 3;
      if (screenWidth >= 539) return 2;
      return 1;
    }

    double getChildAspectRatio() {
      if (screenWidth >= 1070) return 1.2;
      if (screenWidth >= 950) return 1.2;
      if (screenWidth >= 838) return 1.7;
      if (screenWidth >= 769) return 1.6;
      if (screenWidth >= 620) return 1.6;
      if (screenWidth >= 539) return 1.8;
      return 1.9;
    }

    return GetBuilder<Illness_Controller>(builder: (control) {
      return control.isLoading == true
          ? GridView.builder(
              padding: const EdgeInsets.only(top: 10, left: 40, right: 40),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: getCrossAxisCount(),
                  crossAxisSpacing: 20.0,
                  mainAxisSpacing: 20.0,
                  childAspectRatio: getChildAspectRatio()),
              itemCount: 12,
              itemBuilder: (context, index) {
                return HoverScaleCard(
                  child: Stack(
                    alignment: Alignment.topLeft,
                    children: [
                      Container(
                          padding: const EdgeInsets.all(5),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              border:
                                  Border.all(color: Colors.grey, width: 0.5),
                              color: Theme.of(context).cardColor,
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
                                      child:
                                          SchemaWidget(width: 40, height: 15),
                                    ),
                                  )
                                ],
                              ),
                              Spacer(),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [SchemaWidget(width: 20, height: 20)],
                              )
                            ],
                          )),
                      Align(
                          alignment: Alignment(-1.5, 1),
                          child: Image.asset(
                            "assets/images/Illness.png",
                            height: 120,
                            color: Colors.grey.shade400,
                          )),
                    ],
                  ),
                ).animate(onPlay: (controller) => controller.repeat()).shimmer(
                    angle: 1,
                    color: Colors.grey.withOpacity(0.2),
                    duration: Duration(seconds: 1),
                    delay: Duration(seconds: 1));
              },
            )
          : control.filteredIllness!.isNotEmpty
              ? GridView.builder(
                  padding: const EdgeInsets.only(top: 10, left: 40, right: 40),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: getCrossAxisCount(),
                      crossAxisSpacing: 20.0,
                      mainAxisSpacing: 20.0,
                      childAspectRatio: getChildAspectRatio()),
                  itemCount: control.filteredIllness!.length,
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
                                    border: Border.all(
                                        color: Colors.grey, width: 0.5),
                                    color: Theme.of(context).cardColor,
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
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Container(
                                          width: 50,
                                        ),
                                        Expanded(
                                          child: Center(
                                              child: Column(children: [
                                            Text(
                                              textDirection: prefs!.getString(
                                                          languageKey) ==
                                                      "ar"
                                                  ? TextDirection.rtl
                                                  : TextDirection.ltr,
                                              textAlign: TextAlign.center,
                                              prefs!.getString(languageKey) ==
                                                      'ar'
                                                  ? "${control.filteredIllness![index].name}"
                                                  : "${control.filteredIllness![index].enName}",
                                              style: Get.textTheme.bodyMedium!
                                                  .copyWith(fontSize: 26),
                                            ),
                                            control.filteredIllness![index]
                                                        .chronic ==
                                                    1
                                                ? Text(
                                                    textDirection: prefs!
                                                                .getString(
                                                                    languageKey) ==
                                                            "ar"
                                                        ? TextDirection.rtl
                                                        : TextDirection.ltr,
                                                    textAlign: TextAlign.center,
                                                    "Is chronic : Yes".tr,
                                                    style: TextStyle(
                                                        fontSize: 14,
                                                        color:
                                                            Color(0xffB03D3D)),
                                                  )
                                                : Text(
                                                    textDirection: prefs!
                                                                .getString(
                                                                    languageKey) ==
                                                            "ar"
                                                        ? TextDirection.rtl
                                                        : TextDirection.ltr,
                                                    textAlign: TextAlign.center,
                                                    "Is chronic : No".tr,
                                                    style:
                                                        TextStyle(fontSize: 14),
                                                  )
                                          ])),
                                        )
                                      ],
                                    ),
                                    Spacer(),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.end,
                                      children: [
                                        IconButton(
                                            style: ButtonStyle(
                                                backgroundColor:
                                                    WidgetStatePropertyAll(
                                                        Color(0xffB03D3D)),
                                                shape: WidgetStatePropertyAll(
                                                    RoundedRectangleBorder(
                                                        borderRadius:
                                                            BorderRadius.all(
                                                                Radius.circular(
                                                                    5))))),
                                            onPressed: () {
                                              Get.dialog(VMSAlertDialog(
                                                action: [
                                                  ButtonDialog(
                                                      text: "Delete".tr,
                                                      onPressed: () async {
                                                        await Delete_Illness_API(
                                                                context)
                                                            .Delete_Illness(
                                                                Eid: control
                                                                    .filteredIllness![
                                                                        index]
                                                                    .id);
                                                      },
                                                      color: Color(0xffB03D3D),
                                                      width: 80),
                                                  ButtonDialog(
                                                      text: "Cancel".tr,
                                                      onPressed: () {
                                                        Get.back();
                                                      },
                                                      color: Theme.of(context)
                                                          .canvasColor,
                                                      width: 80)
                                                ],
                                                contents: Container(
                                                    width: 500,
                                                    child: Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .start,
                                                      children: [
                                                        Text(
                                                          "Do You Want To Deleteill"
                                                                  .tr +
                                                              " ( ${prefs!.getString(languageKey) == 'ar' ? "${control.filteredIllness![index].name}" : "${control.filteredIllness![index].enName}"} ) " +
                                                              "Illnesss".tr,
                                                          style: Get
                                                              .theme
                                                              .textTheme
                                                              .bodyMedium!
                                                              .copyWith(
                                                                  fontSize: 16,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .normal),
                                                        ),
                                                      ],
                                                    )),
                                                apptitle: "Delete Illness".tr,
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
                                alignment: Alignment(-1.5, 1),
                                child: Image.asset("assets/images/Illness.png",
                                    height: 120)),
                          ],
                        ),
                      ),
                    );
                  },
                )
              : Center(
                  child: Text("No Illness".tr,
                      style: Theme.of(context).textTheme.titleLarge!.copyWith(
                          fontSize: 22, fontWeight: FontWeight.normal)));
    });
  }
}
