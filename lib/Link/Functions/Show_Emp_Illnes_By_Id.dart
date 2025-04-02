import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vms_school/Link/API/API.dart';
import 'package:vms_school/Link/API/AdminAPI/Teacher_APIS/UpdateEmployeeIllness.dart';
import 'package:vms_school/Link/API/DownloadFiles.dart';
import 'package:vms_school/Link/Controller/AdminController/Employee_Controllers/Add_Data_controller.dart';
import 'package:vms_school/Link/Controller/AdminController/Employee_Controllers/AllEmpolyeeController.dart';
import 'package:vms_school/Link/Controller/AdminController/School_Controllers/Illness_Controller.dart';
import 'package:vms_school/Link/Controller/AdminController/Teacher_Controllers/AllTeachersController.dart';
import 'package:vms_school/Translate/local_controller.dart';
import 'package:vms_school/main.dart';
import 'package:vms_school/widgets/ButtonsDialog.dart';
import 'package:vms_school/widgets/GridAnimation.dart';
import 'package:vms_school/widgets/TextFormSearch.dart';
import 'package:vms_school/widgets/VMSAlertDialog.dart';
import '../Model/AdminModel/School_Models/Illness_Model.dart';

Show_Teacher_Illnes_By_Id(
    {required BuildContext context,
    id,
    int? index_of_Emp,
    required bool IsTeacher}) async {
  TextEditingController search = TextEditingController();
  try {
    Get.dialog(VMSAlertDialog(
        action: [
          ButtonDialog(
              text: "Done".tr,
              onPressed: () {
                if (Get.find<Add_Data_controller>().roll != "subAdmin") {
                  Get.find<Illness_Controller>().SetFinalList();
                  Update_Employee_Illness_API(context).Update_Employee_Illness(
                    id: id,
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
            width: 700,
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
                        child: TextFormSearch(
                          click: () {
                            control.clearFilter();
                          },
                          onchange: (value) {
                            control.searchByName(value);
                          },
                          width: 680,
                          radius: 5,
                          controller: search,
                          suffixIcon: search.text.isNotEmpty
                              ? Icons.close
                              : Icons.search,
                        ),
                      ),
                    ],
                  ),
                  Row(
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
                  Expanded(
                    child: GridView.builder(
                      padding:
                          const EdgeInsets.only(top: 10, left: 10, right: 10),
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
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
                                  "subAdmin") {
                                control.toggleSelection(illness);
                              }
                            },
                            child: Container(
                              padding: const EdgeInsets.all(20),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                border:
                                    Border.all(color: Colors.grey, width: 0.5),
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
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Expanded(
                                    child: Center(
                                      child: Text(
                                        textAlign: TextAlign.center,
                                        prefs!.getString(languageKey) == 'ar'
                                            ? "${illness.name}"
                                            : "${illness.enName}",
                                        style: Get.theme.textTheme.bodyMedium!
                                            .copyWith(
                                                fontSize: 18,
                                                color: isSelected
                                                    ? Colors.white
                                                    : Get.theme.primaryColor),
                                      ),
                                    ),
                                  ),
                                  Row(
                                    mainAxisSize: MainAxisSize.min,
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
                                              onPressed: hasNewFile == true ||
                                                      hasOldFile == true
                                                  ? () {
                                                      control
                                                          .clearFile(illness);
                                                    }
                                                  : () {},
                                              icon: Icon(
                                                  Icons.delete_outline_outlined,
                                                  size: 20,
                                                  color: hasNewFile == true ||
                                                          hasOldFile == true
                                                      ? Get.theme.primaryColor
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
                                                onPressed: hasOldFile == true
                                                    ? () {
                                                        final url =
                                                            '$getimage${control.finalList[index]['fileid']}';
                                                        if (IsTeacher == true) {
                                                          downloadFile("$url",
                                                              "${Get.find<Allteachercontroller>().filteredTeacher![index_of_Emp!].fullName} $illnesName.pdf");
                                                        } else {
                                                          downloadFile("$url",
                                                              "${Get.find<Allempolyeecontroller>().filteredreemployees[index_of_Emp!].fullName} $illnesName.pdf");
                                                        }
                                                      }
                                                    : () {},
                                                icon: Icon(
                                                    Icons
                                                        .file_download_outlined,
                                                    size: 20,
                                                    color: hasOldFile == true
                                                        ? Get.theme.primaryColor
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
        apptitle:
            IsTeacher == true ? "Teacher Illness".tr : "Employee Illness".tr,
        subtitle: "none"));
  } catch (e) {
    print(e.toString());
  }
}
