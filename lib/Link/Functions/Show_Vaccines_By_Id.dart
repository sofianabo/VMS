import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vms_school/Link/API/AdminAPI/Students/Students_APIs/UpdateStudentsVaccines.dart';
import 'package:vms_school/Link/Controller/AdminController/School_Controllers/Vaccines_Controller.dart';
import 'package:vms_school/Link/Model/AdminModel/School_Models/Vaccines_Model.dart';
import 'package:vms_school/widgets/ButtonsDialog.dart';
import 'package:vms_school/widgets/GridAnimation.dart';
import 'package:vms_school/widgets/TextFormSearch.dart';
import 'package:vms_school/widgets/VMSAlertDialog.dart';

Show_Vaccines_By_Id_Funcation(BuildContext context, id) async {
  TextEditingController search = TextEditingController();
  bool isSelectedOnly = true;
  try {
    Get.dialog(VMSAlertDialog(
        action: [
          ButtonDialog(
              text: "Done",
              onPressed: () {
                Get.find<Vaccines_Controller>().SetFinalList();
                Update_Students_Vaccines_API(context).Update_Students_Vaccines(
                  id: id,
                  illness: Get.find<Vaccines_Controller>().finalList,
                );
              },
              color: Get.theme.primaryColor,
              width: 65)
        ],
        contents: Padding(
          padding: const EdgeInsets.only(top: 25.0, bottom: 25.0),
          child: SizedBox(
            width: 700,
            child: GetBuilder<Vaccines_Controller>(builder: (control) {
              List<Vaccine> filteredList = isSelectedOnly
                  ? control.filteredvaccine!
                      .where((illness) => control.isSelected(illness))
                      .toList()
                  : control.filteredvaccine!;

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
                        value: isSelectedOnly,
                        onChanged: (value) {
                          isSelectedOnly = value!;
                          Get.forceAppUpdate();
                        },
                      ),
                      Text('Show only selected items'),
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
                        return HoverScaleCard(
                          child: GestureDetector(
                            onTap: () {
                              control.toggleSelection(illness);
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
                                        "${illness.enName}",
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
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Text("${control.getFileName(illness)}",
                                          style: Get.theme.textTheme.bodyMedium!
                                              .copyWith(
                                                  fontSize: 14,
                                                  color: isSelected
                                                      ? Colors.white
                                                      : Get
                                                          .theme.primaryColor)),
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
                                                  color: isSelected
                                                      ? Colors.white
                                                      : Get.theme.primaryColor,
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
                                                      control.hasFile(illness)
                                                          ? () {
                                                              control.clearFile(
                                                                  illness);
                                                            }
                                                          : () {},
                                                  icon: Icon(
                                                      Icons
                                                          .delete_outline_outlined,
                                                      size: 20,
                                                      color: isSelected
                                                          ? control.hasFile(
                                                                  illness)
                                                              ? Get.theme
                                                                  .primaryColor
                                                              : Colors.grey
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
                                                  color: isSelected
                                                      ? Colors.white
                                                      : Get.theme.primaryColor,
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
                                                      control.hasFile(illness)
                                                          ? () {
                                                              //ksjdjks
                                                            }
                                                          : () {},
                                                  icon: Icon(
                                                      Icons
                                                          .file_download_outlined,
                                                      size: 20,
                                                      color: isSelected
                                                          ? control.hasFile(
                                                                  illness)
                                                              ? Get.theme
                                                                  .primaryColor
                                                              : Colors.grey
                                                          : Colors.white)),
                                            ),
                                          ),
                                        ],
                                      )
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
        apptitle: "Students Vaccine",
        subtitle: "none"));
  } catch (e) {
    print(e.toString());
  }
}
