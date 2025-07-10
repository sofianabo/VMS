import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:get/get.dart';
import 'package:vms_school/Icons_File/v_m_s__icons_icons.dart';
import 'package:vms_school/Link/API/AdminAPI/Students/Jalaa_APIS/Delete_Jalaa_Settings.dart';
import 'package:vms_school/Link/API/AdminAPI/Students/Jalaa_APIS/Preview_Jalaa_Settings.dart';
import 'package:vms_school/Link/Controller/AdminController/Students_Controllers/Jalaa_For_Students/Jalaa_Page_Controller.dart';
import 'package:vms_school/Translate/local_controller.dart';
import 'package:vms_school/view/Both_Platform/widgets/ButtonsDialog.dart';
import 'package:vms_school/view/Both_Platform/widgets/GridAnimation.dart';
import 'package:vms_school/view/Both_Platform/widgets/Schema_Widget.dart';
import 'package:vms_school/view/Both_Platform/widgets/VMSAlertDialog.dart';

class All_Jalaas_Grid extends StatelessWidget {
  const All_Jalaas_Grid({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    int getCrossAxisCount() {
      if (screenWidth >= 1132) return 4;
      if (screenWidth >= 950) return 3;
      if (screenWidth >= 620) return 2;
      return 1;
    }

    double getChildAspectRatio() {
      if (screenWidth >= 1070) return 0.9;
      if (screenWidth >= 950) return 0.9;
      if (screenWidth >= 838) return 1.4;
      if (screenWidth >= 769) return 1.3;
      if (screenWidth >= 620) return 1.0;
      if (screenWidth >= 539) return 1.5;
      return 1.3;
    }

    return Directionality(
      textDirection:
          Get.find<LocalizationController>().currentLocale.value.languageCode ==
                  'ar'
              ? TextDirection.rtl
              : TextDirection.ltr,
      child: GetBuilder<Jalaa_Page_Controller>(builder: (control) {
        return control.isJalaaLoading
            ? Container(
                width: screenWidth >= 768 ? screenWidth - 80 : screenWidth,
                child: GridView.builder(
                  padding: const EdgeInsets.only(top: 10, left: 40, right: 40),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: getCrossAxisCount(),
                      crossAxisSpacing: 20.0,
                      mainAxisSpacing: 20.0,
                      childAspectRatio: getChildAspectRatio()),
                  itemCount: 8,
                  itemBuilder: (context, index) {
                    return HoverScaleCard(
                      child: Container(
                          padding: const EdgeInsets.all(20),
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
                                      padding: const EdgeInsets.only(
                                          top: 5.0, bottom: 5.0),
                                      child:
                                          SchemaWidget(width: 145, height: 20)),
                                ],
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      SchemaWidget(width: 145, height: 20),
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            top: 5.0, bottom: 5.0),
                                        child: SchemaWidget(
                                            width: 145, height: 20),
                                      ),
                                      SchemaWidget(width: 145, height: 20),
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
                    duration: const Duration(seconds: 1),
                    delay: const Duration(seconds: 1)),
              )
            : control.jalaaSettings!.isNotEmpty
                ? Container(
                    width: screenWidth >= 768 ? screenWidth - 80 : screenWidth,
                    child: GridView.builder(
                      padding:
                          const EdgeInsets.only(top: 10, left: 40, right: 40),
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: getCrossAxisCount(),
                          crossAxisSpacing: 20.0,
                          mainAxisSpacing: 20.0,
                          childAspectRatio: getChildAspectRatio()),
                      itemCount: control.jalaaSettings!.length,
                      itemBuilder: (context, index) {
                        return HoverScaleCard(
                          child: GestureDetector(
                            onTap: () async {},
                            onLongPress: () async {
                              Preview_Jalaa_Settings_API()
                                  .Preview_Jalaa_Settings(
                                      id: control.jalaaSettings![index].id);
                            },
                            child: Container(
                                padding: const EdgeInsets.only(bottom: 15),
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
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Expanded(
                                        child: SizedBox(
                                            width: 500,
                                            child: Image.asset(
                                                fit: BoxFit.cover,
                                                getJalaaImageById(control
                                                        .jalaaSettings![index]
                                                        .shId ??
                                                    0)))),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Expanded(
                                          child: Padding(
                                            padding: const EdgeInsets.only(
                                                top: 10.0, bottom: 10.0),
                                            child: Center(
                                                child: Text(
                                                    maxLines: 1,
                                                    overflow:
                                                        TextOverflow.ellipsis,
                                                    Get.find<LocalizationController>()
                                                                .currentLocale
                                                                .value
                                                                .languageCode ==
                                                            'ar'
                                                        ? "${control.jalaaSettings![index].classes!.name ?? ""}"
                                                        : "${control.jalaaSettings![index].classes!.enName ?? ""}",
                                                    style: Get.theme.textTheme
                                                        .titleLarge!
                                                        .copyWith(
                                                            fontSize: 18))),
                                          ),
                                        ),
                                      ],
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          left: 8.0, right: 8.0),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(getJalaaTextById(control
                                                  .jalaaSettings![index].shId ??
                                              0)),
                                          IconButton(
                                            style: ButtonStyle(
                                                maximumSize:
                                                    WidgetStateProperty.all(
                                                        const Size(35, 35)),
                                                minimumSize:
                                                    WidgetStateProperty.all(
                                                        const Size(35, 35)),
                                                iconSize:
                                                    WidgetStateProperty.all(14),
                                                shape: WidgetStateProperty.all(
                                                    RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(5),
                                                )),
                                                backgroundColor:
                                                    WidgetStateProperty.all(
                                                        const Color(
                                                            0xffB03D3D))),
                                            onPressed: () {
                                              Get.dialog(VMSAlertDialog(
                                                  action: [
                                                    ButtonDialog(
                                                      width: 100,
                                                      text: "Delete".tr,
                                                      onPressed: () async {
                                                        await Delete_Jalaa_Settings_API()
                                                            .Delete_Jalaa_Settings(
                                                                Jalaa: control
                                                                        .jalaaSettings![
                                                                    index]);
                                                      },
                                                      color: const Color(
                                                          0xffB03D3D),
                                                    ),
                                                    const SizedBox(
                                                      width: 10,
                                                    ),
                                                    ButtonDialog(
                                                        width: 100,
                                                        text: "Cancel".tr,
                                                        onPressed: () {
                                                          Get.back();
                                                        },
                                                        color: Theme.of(context)
                                                            .primaryColor)
                                                  ],
                                                  contents: Container(
                                                    width: 300,
                                                    child: Text(
                                                        style: TextStyle(
                                                            color:
                                                                Colors.black),
                                                        maxLines: 3,
                                                        "Do you want to delete this template ?"
                                                            .tr),
                                                  ),
                                                  apptitle:
                                                      "Delete template".tr,
                                                  subtitle: "none"));
                                            },
                                            icon: const Icon(VMS_Icons.bin),
                                            color: Colors.white,
                                          ),
                                        ],
                                      ),
                                    )
                                  ],
                                )),
                          ),
                        );
                      },
                    ),
                  )
                : Center(
                    child: Text("No Jalaas Yet".tr,
                        style: Theme.of(context).textTheme.titleLarge!.copyWith(
                            fontSize: 22, fontWeight: FontWeight.normal)));
      }),
    );
  }
}

String getJalaaTextById(int id) {
  switch (id) {
    case 1:
      return "قالب ابتدائي (تقديرات)";
    case 2:
      return "قالب ابتدائي (خامس وسادس)";
    case 3:
      return "قالب إعدادي (سابع وثامن)";
    case 4:
      return "قالب إعدادي (تاسع)";
    default:
      return "قالب غير معروف";
  }
}

String getJalaaImageById(int id) {
  switch (id) {
    case 1:
      return "assets/images/Jalaa_Templete/1-4.png";
    case 2:
      return "assets/images/Jalaa_Templete/5-6.png";
    case 3:
      return "assets/images/Jalaa_Templete/7-8.png";
    case 4:
      return "assets/images/Jalaa_Templete/9.png";
    default:
      return "assets/images/default.png";
  }
}
