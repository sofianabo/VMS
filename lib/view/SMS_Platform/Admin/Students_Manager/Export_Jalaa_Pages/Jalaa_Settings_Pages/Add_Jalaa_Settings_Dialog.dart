import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vms_school/Link/API/AdminAPI/Students/Jalaa_APIS/Add_Jalaa_Settings.dart';
import 'package:vms_school/Link/Controller/AdminController/Students_Controllers/Jalaa_For_Students/Jalaa_Page_Controller.dart';
import 'package:vms_school/view/Both_Platform/widgets/Admin/Count_Page/Count_Page_Widgets.dart';
import 'package:vms_school/view/Both_Platform/widgets/GridAnimation.dart';
import 'package:vms_school/view/Both_Platform/widgets/VMSAlertDialog.dart';
import 'package:vms_school/view/SMS_Platform/Admin/Students_Manager/Export_Jalaa_Pages/Jalaa_Settings_Pages/Add_Jalaa_Page/Forth_Page_Jalaa.dart';
import 'package:vms_school/view/SMS_Platform/Admin/Students_Manager/Export_Jalaa_Pages/Jalaa_Settings_Pages/Add_Jalaa_Page/Second_Page_Add_Jalaa.dart';
import 'package:vms_school/view/SMS_Platform/Admin/Students_Manager/Export_Jalaa_Pages/Jalaa_Settings_Pages/Add_Jalaa_Page/Third_Page_Add_Jalaa.dart';

class Dialog_Add_Jalaa_Settings extends StatefulWidget {
  const Dialog_Add_Jalaa_Settings({super.key});

  @override
  State<Dialog_Add_Jalaa_Settings> createState() =>
      _Dialog_Add_Jalaa_SettingsState();
}

class _Dialog_Add_Jalaa_SettingsState extends State<Dialog_Add_Jalaa_Settings> {
  @override
  Widget build(BuildContext context) {
    final controller = Get.find<Jalaa_Page_Controller>();
    final screenWidth = MediaQuery.of(context).size.width * 0.7;
    TextEditingController first = TextEditingController(text: "");
    TextEditingController second = TextEditingController(text: "");
    int getCrossAxisCount() {
      if (screenWidth >= 950) return 3;
      if (screenWidth >= 400) return 2;
      return 1;
    }

    double getChildAspectRatio() {
      if (screenWidth >= 950) return 1.1;
      if (screenWidth >= 400) return 1.3;

      return 2.0;
    }

    return Padding(
      padding: const EdgeInsets.only(top: 20.0, bottom: 20.0),
      child: VMSProfileAlertDialog(
        action: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Obx(() => controller.currentIndex.value > 0
                  ? TextButton(
                      onPressed: controller.previousPage,
                      child: const Text("السابق"),
                    )
                  : const SizedBox.shrink()),
              Obx(() => controller.currentIndex.value == 2
                  ? TextButton(
                      onPressed: () {
                        if (controller.primarySubjects.isNotEmpty ||
                            controller.secondarySubjects.isNotEmpty) {
                          controller.nextPage();
                        }
                      },
                      child: const Text("التالي"),
                    )
                  : controller.currentIndex.value == 3
                      ? TextButton(
                          onPressed: () {
                            Add_Jalaa_Settings_API().Add_Jalaa_Settings(
                              first:first.text,
                              second:second.text,
                            );
                          },
                          child: const Text("إنهاء"),
                        )
                      : SizedBox.shrink()),
            ],
          )
        ],
        contents: SizedBox(
          width: 800,
          child: Column(
            children: [
              Obx(() => CountUpPage(
                    index: controller.currentIndex.value,
                    count: controller.count,
                  )),
              const SizedBox(height: 16),
              Expanded(
                child: PageView(
                  controller: controller.pageController,
                  physics:
                      const NeverScrollableScrollPhysics(), // يمنع التمرير اليدوي
                  children: [
                    GridView.builder(
                      padding: const EdgeInsets.only(
                          top: 10, left: 20, right: 20, bottom: 20),
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: getCrossAxisCount(),
                          crossAxisSpacing: 20.0,
                          mainAxisSpacing: 20.0,
                          childAspectRatio: getChildAspectRatio()),
                      itemCount: controller.jalaas.length,
                      itemBuilder: (context, index) {
                        final item = controller.jalaas[index];
                        return HoverScaleCard(
                          child: GestureDetector(
                            onTap: () async {
                              controller.nextPage();
                              controller.templeteId = item["id"];
                            },
                            child: Container(
                                padding: const EdgeInsets.only(
                                    left: 5, right: 5.0, bottom: 15.0),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(5),
                                    border: Border.all(
                                        color: Colors.grey, width: 0.5),
                                    color: Theme.of(context).cardColor,
                                    boxShadow: const [
                                      BoxShadow(
                                          color: Colors.black26,
                                          offset: Offset(0, 1),
                                          blurRadius: 0.5)
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
                                          item["image"],
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Expanded(
                                          child: Padding(
                                            padding: const EdgeInsets.only(
                                                top: 5.0, bottom: 5.0),
                                            child: Center(
                                              child: Text(
                                                item["text"],
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                )),
                          ),
                        );
                      },
                    ),
                    Second_Page_Add_Jalaa(),
                    Add_Jalaa_Third_Page(),
                    QuizTypeSorter(
                      first: first,
                      second: second,
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
        apptitle: "",
        subtitle: "",
      ),
    );
  }
}
