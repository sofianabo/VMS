import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vms_school/Link/API/API.dart';
import 'package:vms_school/Link/API/AdminAPI/Employees_APIs/UpdateEmployeeIllness.dart';
import 'package:vms_school/Link/Controller/AdminController/Employee_Controllers/Add_Data_controller.dart';
import 'package:vms_school/Link/Controller/AdminController/School_Controllers/Illness_Controller.dart';
import 'package:vms_school/Translate/local_controller.dart';
import 'package:vms_school/view/Both_Platform/widgets/ButtonsDialog.dart';
import 'package:vms_school/view/Both_Platform/widgets/GridAnimation.dart';
import 'package:vms_school/view/Both_Platform/widgets/PDF_View.dart';
import 'package:vms_school/view/Both_Platform/widgets/TextFormSearch.dart';
import 'package:vms_school/view/Both_Platform/widgets/VMSAlertDialog.dart';
import '../Model/AdminModel/School_Models/Illness_Model.dart';

class Show_Teacher_Illnes_By_Id extends StatefulWidget {
  final String id;
  final int? index_of_Emp;
  final bool IsTeacher;
  Show_Teacher_Illnes_By_Id(
      {super.key,
      required this.id,
      this.index_of_Emp,
      required this.IsTeacher});

  @override
  State<Show_Teacher_Illnes_By_Id> createState() =>
      _Show_Teacher_Illnes_By_IdState();
}

class _Show_Teacher_Illnes_By_IdState extends State<Show_Teacher_Illnes_By_Id> {
  final TextEditingController search = TextEditingController();
  late Illness_Controller control;

  @override
  void initState() {
    super.initState();
    control = Get.find<Illness_Controller>();
  }

  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;

    return LayoutBuilder(
      builder: (context, constraints) {
        final dialogWidth = constraints.maxWidth * 0.5; // 80% من عرض الشاشة
        return VMSAlertDialog(
            action: [
              if (Get.find<Add_Data_controller>().roll != "observer")
                ButtonDialog(
                    text: "Done".tr,
                    onPressed: () {
                      if (Get.find<Add_Data_controller>().roll != "subAdmin") {
                        Get.find<Illness_Controller>().SetFinalList();
                        Update_Employee_Illness_API(context)
                            .Update_Employee_Illness(
                          id: widget.id,
                          illness: Get.find<Illness_Controller>().finalList,
                        );
                      }
                    },
                    color: Get.find<Add_Data_controller>().roll == "subAdmin"
                        ? Get.theme.disabledColor
                        : Get.theme.primaryColor,
                    width: 65)
            ],
            contents: Padding(
              padding: const EdgeInsets.only(top: 25.0, bottom: 25.0),
              child: SizedBox(
                width: dialogWidth,
                child: GetBuilder<Illness_Controller>(builder: (control) {
                  List<Illness> filteredList = control.isSelectedOnly
                      ? control.filteredIllness!
                          .where((illness) => control.isSelected(illness))
                          .toList()
                      : control.filteredIllness!;

                  return Column(
                    children: [
                      Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 8.0),
                            child: Center(
                              child: TextFormSearch(
                                click: () {
                                  control.clearFilter();
                                },
                                onchange: (value) {
                                  control.searchByName(value);
                                },
                                width: dialogWidth - 8, // مع هامش 20

                                radius: 5,
                                controller: search,
                                suffixIcon: search.text.isNotEmpty
                                    ? Icons.close
                                    : Icons.search,
                              ),
                            ),
                          ),
                        ],
                      ),
                      if (Get.find<Add_Data_controller>().roll != "observer")
                        Padding(
                          padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
                          child: Row(
                            children: [
                              Checkbox(
                                value: control.isSelectedOnly,
                                onChanged: (value) {
                                  control.SetisSelectedOnly(value!);
                                },
                              ),
                              Text('Show only selected items'.tr),
                            ],
                          ),
                        ),
                      Expanded(
                        child: GridView.builder(
                          padding: const EdgeInsets.only(
                              top: 10, left: 10, right: 10),
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: _getCrossAxisCount(
                                MediaQuery.of(context).size.width),
                            crossAxisSpacing: 10.0,
                            mainAxisSpacing: 10.0,
                            childAspectRatio: 1.9,
                          ),
                          itemCount: filteredList.length,
                          itemBuilder: (context, index) {
                            final illness = filteredList[index];
                            final isSelected = control.isSelected(illness);
                            final hasOldFile = control.finalList.any((entry) =>
                                entry['id'] == illness.id &&
                                entry.containsKey('hasOldFile') &&
                                entry['hasOldFile'] == true);
                            final hasNewFile = control.finalList.any((entry) =>
                                entry['id'] == illness.id &&
                                entry.containsKey('hasNewFile') &&
                                entry['hasNewFile'] == true);
                            final illnesName = control.finalList.firstWhere(
                              (entry) =>
                                  entry['id'] == illness.id &&
                                  entry.containsKey('illnesName'),
                              orElse: () => {"illnesName": ""},
                            )['illnesName'];

                            return HoverScaleCard(
                              child: GestureDetector(
                                onTap: () {
                                  if (Get.find<Add_Data_controller>().roll !=
                                      "observer") {
                                    if (Get.find<Add_Data_controller>().roll !=
                                        "subAdmin") {
                                      control.toggleSelection(illness);
                                    }
                                  }
                                },
                                child: Container(
                                  padding: const EdgeInsets.all(20),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(5),
                                    border: Border.all(
                                        color: Colors.grey, width: 0.5),
                                    color: isSelected
                                        ? Get.theme.primaryColor
                                        : Colors.white,
                                    boxShadow: const [
                                      BoxShadow(
                                        color: Colors.black26,
                                        offset: Offset(0, 2),
                                        blurRadius: 1,
                                      ),
                                    ],
                                  ),
                                  child: Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Expanded(
                                        child: Center(
                                          child: Text(
                                            textAlign: TextAlign.center,
                                            Get.find<LocalizationController>()
                                                        .currentLocale
                                                        .value
                                                        .languageCode ==
                                                    'ar'
                                                ? "${illness.name}"
                                                : "${illness.enName}",
                                            style: Get
                                                .theme.textTheme.bodyMedium!
                                                .copyWith(
                                                    fontSize: 18,
                                                    color: isSelected
                                                        ? Colors.white
                                                        : Get.theme
                                                            .primaryColor),
                                          ),
                                        ),
                                      ),
                                      Row(
                                        mainAxisSize: MainAxisSize.min,
                                        spacing: 5,
                                        children: [
                                          if (Get.find<Add_Data_controller>()
                                                  .roll !=
                                              "observer")
                                            if (Get.find<Add_Data_controller>()
                                                    .roll !=
                                                "subAdmin")
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                    left: 5.0, right: 5.0),
                                                child: Container(
                                                  width:
                                                      constraints.maxWidth > 600
                                                          ? 35
                                                          : 25,
                                                  height:
                                                      constraints.maxWidth > 600
                                                          ? 35
                                                          : 25,
                                                  decoration: BoxDecoration(
                                                      color: hasNewFile ==
                                                                  true ||
                                                              hasOldFile == true
                                                          ? Colors.white
                                                          : Get.theme
                                                              .disabledColor,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              5),
                                                      boxShadow: const [
                                                        BoxShadow(
                                                            color:
                                                                Colors.black12,
                                                            offset:
                                                                Offset(0, 2),
                                                            blurRadius: 1)
                                                      ]),
                                                  child: IconButton(
                                                      onPressed: hasNewFile ==
                                                                  true ||
                                                              hasOldFile == true
                                                          ? () {
                                                              control.clearFile(
                                                                  illness);
                                                            }
                                                          : () {},
                                                      icon: Icon(
                                                          Icons
                                                              .delete_outline_outlined,
                                                          size:
                                                              w > 600 ? 20 : 10,
                                                          color: hasNewFile ==
                                                                      true ||
                                                                  hasOldFile ==
                                                                      true
                                                              ? Get.theme
                                                                  .primaryColor
                                                              : Colors.white)),
                                                ),
                                              ),
                                          if (Get.find<Add_Data_controller>()
                                                  .roll !=
                                              "observer")
                                            if (Get.find<Add_Data_controller>()
                                                    .roll !=
                                                "subAdmin")
                                              Container(
                                                width:
                                                    constraints.maxWidth > 600
                                                        ? 35
                                                        : 25,
                                                height:
                                                    constraints.maxWidth > 600
                                                        ? 35
                                                        : 25,
                                                decoration: BoxDecoration(
                                                  color: isSelected
                                                      ? Colors.white
                                                      : Get.theme.primaryColor,
                                                  borderRadius:
                                                      BorderRadius.circular(5),
                                                  boxShadow: const [
                                                    BoxShadow(
                                                      color: Colors.black12,
                                                      offset: Offset(0, 2),
                                                      blurRadius: 1,
                                                    )
                                                  ],
                                                ),
                                                child: IconButton(
                                                  onPressed: () {
                                                    control.attachFile(illness);
                                                  },
                                                  icon: Icon(
                                                    Icons.file_upload_outlined,
                                                    size: w > 600 ? 20 : 10,
                                                    color: isSelected
                                                        ? Get.theme.primaryColor
                                                        : Colors.white,
                                                  ),
                                                ),
                                              ),
                                          Padding(
                                              padding: const EdgeInsets.only(
                                                  left: 5.0, right: 5.0),
                                              child: Container(
                                                width:
                                                    constraints.maxWidth > 600
                                                        ? 35
                                                        : 25,
                                                height:
                                                    constraints.maxWidth > 600
                                                        ? 35
                                                        : 25,
                                                decoration: BoxDecoration(
                                                    color: hasOldFile == true
                                                        ? Colors.white
                                                        : Get.theme
                                                            .disabledColor,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            5),
                                                    boxShadow: const [
                                                      BoxShadow(
                                                          color: Colors.black12,
                                                          offset: Offset(0, 2),
                                                          blurRadius: 1)
                                                    ]),
                                                child: IconButton(
                                                    onPressed:
                                                        hasOldFile == true
                                                            ? () {
                                                                openFileInNewTab(
                                                                    filePath:
                                                                        '$getpdf${control.finalList[index]['fileid']}');
                                                              }
                                                            : () {},
                                                    icon: Icon(
                                                        Icons
                                                            .file_download_outlined,
                                                        size: w > 600 ? 20 : 10,
                                                        color: hasOldFile == true
                                                            ? Get.theme
                                                                .primaryColor
                                                            : Colors.white)),
                                              )),
                                        ],
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
                      )
                    ],
                  );
                }),
              ),
            ),
            apptitle: widget.IsTeacher == true
                ? "Teacher Illness".tr
                : "Employee Illness".tr,
            subtitle: "none");
      },
    );
  }

  int _getCrossAxisCount(double width) {
    if (width > 1000) return 2;
    return 1; // لعرض عمود واحد في الشاشات الصغيرة
  }
}
