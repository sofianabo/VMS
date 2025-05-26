import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vms_school/Link/API/API.dart';
import 'package:vms_school/Link/API/AdminAPI/Employees_APIs/UpdateEmployeeIllness.dart';
import 'package:vms_school/Link/API/AdminAPI/Employees_APIs/Update_Employee_Info.dart';
import 'package:vms_school/Link/API/AdminAPI/School/School_Screen_APIs/Illness_APIs/Get_All_Illness_API.dart';
import 'package:vms_school/Link/API/AdminAPI/Teacher_APIS/Get_Teacher_Illness.dart';
import 'package:vms_school/Link/API/AdminAPI/Users/Get_My_Illness.dart';
import 'package:vms_school/Link/Controller/AdminController/Employee_Controllers/Add_Data_controller.dart';
import 'package:vms_school/Link/Controller/AdminController/Main_Admin_Controller/Admin_DropDown_Profile_Controller.dart';
import 'package:vms_school/Link/Controller/AdminController/Main_Admin_Controller/Admin_Profile_Content.dart';
import 'package:vms_school/Link/Controller/AdminController/School_Controllers/Illness_Controller.dart';
import 'package:vms_school/Translate/local_controller.dart';
import 'package:vms_school/widgets/Admin/AdminAllSettings/Button_Has_IconText.dart';
import 'package:vms_school/widgets/Admin/AdminAllSettings/TextField_Profile.dart';
import 'package:vms_school/widgets/GridAnimation.dart';
import 'package:vms_school/widgets/PDF_View.dart';
import 'package:vms_school/widgets/TextFormSearch.dart';

import '../../../Link/Model/AdminModel/School_Models/Illness_Model.dart'
    show Illness;

class My_Illness extends StatefulWidget {
  const My_Illness({super.key});

  @override
  State<My_Illness> createState() => _IllnessState();
}

class _IllnessState extends State<My_Illness> {
  @override
  void initState() {
    Get_My_Illness_API(context).Get_My_Illness();
    super.initState();
  }

  final TextEditingController search = TextEditingController();
  late Illness_Controller control;
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return LayoutBuilder(builder: (context, constraints) {
      return Align(
        alignment: Alignment.topCenter,
        child: Column(
          textDirection: Get.find<LocalizationController>()
                      .currentLocale
                      .value
                      .languageCode ==
                  'ar'
              ? TextDirection.rtl
              : TextDirection.ltr,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              textDirection: Get.find<LocalizationController>()
                          .currentLocale
                          .value
                          .languageCode ==
                      'ar'
                  ? TextDirection.ltr
                  : TextDirection.rtl,
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Button_Has_IconText(
                  onPressed: () async {
                    Get.find<Illness_Controller>().SetFinalList();
                    Update_Employee_Illness_API(context)
                        .Update_Employee_Illness(
                      id: Get.find<Add_Data_controller>().myData?.id,
                      illness: Get.find<Illness_Controller>().finalList,
                    );
                  },
                  text: "Save".tr,
                  icon: Icon(
                    Icons.save_outlined,
                    color: Colors.black,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                      top: 25.0, left: 15.0, right: 15.0, bottom: 15.0),
                  child: Text(
                    "My_Illness".tr,
                    style: TextStyle(fontSize: 18),
                  ),
                ),
              ],
            ),
            Expanded(
              child: GetBuilder<Illness_Controller>(builder: (control) {
                if (control.isLoading == true) {
                  return Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            width: 80,
                            height: 80,
                            child: Center(child: CircularProgressIndicator()),
                          ),
                        ],
                      ),
                    ],
                  );
                }
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
                              width: constraints.maxWidth - 8, // مع هامش 20

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
                      child: Padding(
                        padding: const EdgeInsets.only(left: 15.0, right: 15.0),
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
                                  control.toggleSelection(illness);
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
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                left: 5.0, right: 5.0),
                                            child: Container(
                                              width: 35,
                                              height: 35,
                                              decoration: BoxDecoration(
                                                  color: hasNewFile == true ||
                                                          hasOldFile == true
                                                      ? Colors.white
                                                      : Get.theme.disabledColor,
                                                  borderRadius:
                                                      BorderRadius.circular(5),
                                                  boxShadow: const [
                                                    BoxShadow(
                                                        color: Colors.black12,
                                                        offset: Offset(0, 2),
                                                        blurRadius: 1)
                                                  ]),
                                              child: IconButton(
                                                  onPressed:
                                                      hasNewFile == true ||
                                                              hasOldFile == true
                                                          ? () {
                                                              control.clearFile(
                                                                  illness);
                                                            }
                                                          : () {},
                                                  icon: Icon(
                                                      Icons
                                                          .delete_outline_outlined,
                                                      size: 20,
                                                      color: hasNewFile ==
                                                                  true ||
                                                              hasOldFile == true
                                                          ? Get.theme
                                                              .primaryColor
                                                          : Colors.white)),
                                            ),
                                          ),
                                          Container(
                                            width: 35,
                                            height: 35,
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
                                                size: 20,
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
                                                width: 35,
                                                height: 35,
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
                                                        size: 20,
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
                      ),
                    )
                  ],
                );
              }),
            ),
          ],
        ),
      );
    });
  }

  int _getCrossAxisCount(double width) {
    if (width > 1400) return 3;
    if (width > 975) return 2;
    return 1; // لعرض عمود واحد في الشاشات الصغيرة
  }
}
