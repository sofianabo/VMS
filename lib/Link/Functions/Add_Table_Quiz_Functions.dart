import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:get/get.dart';
import 'package:reorderables/reorderables.dart';
import 'package:vms_school/Link/Controller/AdminController/School_Controllers/Teachernote_and_GradeReco.dart';
import 'package:vms_school/widgets/ButtonsDialog.dart';
import 'package:vms_school/widgets/TextFildWithUpper.dart';
import 'package:vms_school/widgets/VMSAlertDialog.dart';

Add_Group() {
  TextEditingController groupname = TextEditingController();
  TextEditingController ratio = TextEditingController();
  final teachernoteAndGradeReco = Get.put(TeachernoteAndGradeReco());
  teachernoteAndGradeReco.resetError();
  return GetBuilder<TeachernoteAndGradeReco>(builder: (controller) {
    double totalRatio = controller.items
        .fold(0, (sum, item) => sum + (item['ratio'] as num)); // حساب المجموع
    ratio.text = totalRatio.toString();
    return VMSAlertDialog(
      action: [
        ButtonDialog(
          text: "Add".tr,
          onPressed: () {
            bool isgroupnameError = groupname.text.trim().isEmpty;
            bool isratioError = ratio.text.trim().isEmpty ||
                int.parse(ratio.text.trim().toString()) == 0;
            controller.updateFieldError("groupName", isgroupnameError);
            controller.updateFieldError("ratio", isratioError);

            if (!(isgroupnameError || isratioError)) {
              double? ratioValue = double.tryParse(ratio.text);

              if (ratioValue != null) {
                controller.Add_Groub(
                  groupname.text,
                  ratioValue.toString(),
                  controller.items.toList().cast<Map<String, dynamic>>(),
                );
                Get.back();
              } else {
                Get.snackbar("Error", "Invalid ratio value");
              }
            }
          },
          color: Get.theme.primaryColor,
          width: 100,
        ),
      ],
      contents: Container(
        width: 500,
        height: 500,
        child: SingleChildScrollView(
          child: Column(
            children: [
              Row(
                children: [
                  Textfildwithupper(
                    width: 350,
                    isError: controller.isGroupNameError,
                    isRequired: true,
                    onChanged: (value) {
                      if (value.isNotEmpty) {
                        controller.updateFieldError("groupName", false);
                      }
                    },
                    controller: groupname,
                    Uptext: "Group Name".tr,
                    hinttext: "Group Name".tr,
                  ),
                  Padding(
                      padding: const EdgeInsets.only(left: 10.0),
                      child: Textfildwithupper(
                        readOnly: controller.items.isEmpty ? false : true,
                        width: 60,
                        fieldType: "number",
                        controller: ratio,
                        Uptext: "ratio",
                        hinttext: "ratio",
                      )),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(top: 15.0),
                child: Column(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        color: Get.theme.primaryColor,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(5),
                          topRight: Radius.circular(5),
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Group Items".tr,
                              style: TextStyle(color: Colors.white),
                            ),
                            Container(
                              width: 30,
                              height: 30,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(5),
                                boxShadow: const [
                                  BoxShadow(
                                    color: Colors.black12,
                                    offset: Offset(0, 2),
                                    blurRadius: 1,
                                  ),
                                ],
                              ),
                              child: IconButton(
                                onPressed: () {
                                  Get.dialog(
                                      barrierDismissible: false,
                                      Add_Items_Group());
                                },
                                icon: Icon(
                                  Icons.add,
                                  size: 14,
                                  color: Get.theme.primaryColor,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Table(
                      border: TableBorder(
                        left: BorderSide(width: 1, color: Colors.black),
                        right: BorderSide(width: 1, color: Colors.black),
                        bottom: BorderSide(width: 1, color: Colors.black),
                        horizontalInside: BorderSide.none,
                        verticalInside: BorderSide.none,
                      ),
                      columnWidths: {
                        0: FlexColumnWidth(),
                        1: FlexColumnWidth(),
                        2: FlexColumnWidth(),
                      },
                      children: [
                        TableRow(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Center(child: Text("Item Name".tr)),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Center(child: Text("Item ratio".tr)),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Center(child: Text("Operations".tr)),
                            ),
                          ],
                        ),
                      ],
                    ),
                    Obx(() {
                      var items = Get.find<TeachernoteAndGradeReco>().items;

                      return SingleChildScrollView(
                        child: Table(
                          border:
                              TableBorder.all(color: Colors.black, width: 1),
                          columnWidths: {
                            0: FlexColumnWidth(),
                            1: FlexColumnWidth(),
                            2: FlexColumnWidth(),
                          },
                          children: List.generate(
                            items.length,
                            (index) => TableRow(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Center(
                                    child: Text(items[index]['name'] as String),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Center(
                                      child: Text(
                                          items[index]['ratio'].toString())),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Container(
                                        width: 30,
                                        height: 30,
                                        decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius:
                                              BorderRadius.circular(5),
                                          boxShadow: const [
                                            BoxShadow(
                                              color: Colors.black12,
                                              offset: Offset(0, 2),
                                              blurRadius: 1,
                                            ),
                                          ],
                                        ),
                                        child: IconButton(
                                          onPressed: () {
                                            Get.dialog(
                                                barrierDismissible: false,
                                                Edit_Items_Group(
                                                    idx: index,
                                                    name: controller
                                                        .items[index]['name'],
                                                    isQuizables:
                                                        controller.items[index]
                                                            ['isQuizable'],
                                                    rat: controller.items[index]
                                                        ['ratio']));
                                          },
                                          icon: Icon(
                                            Icons.edit,
                                            size: 14,
                                            color: Get.theme.primaryColor,
                                          ),
                                        ),
                                      ),
                                      SizedBox(width: 10),
                                      Container(
                                        width: 30,
                                        height: 30,
                                        decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius:
                                              BorderRadius.circular(5),
                                          boxShadow: const [
                                            BoxShadow(
                                              color: Colors.black12,
                                              offset: Offset(0, 2),
                                              blurRadius: 1,
                                            ),
                                          ],
                                        ),
                                        child: IconButton(
                                          onPressed: () {
                                            controller.RemoveItem(index);
                                          },
                                          icon: Icon(
                                            Icons.delete,
                                            size: 14,
                                            color: Get.theme.primaryColor,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    })
                  ],
                ),
              )
            ],
          ),
        ),
      ),
      apptitle: "Add Group".tr,
      subtitle: "Add a New Group".tr,
    );
  });
}

Add_Items_Group() {
  TextEditingController itemName = TextEditingController();
  TextEditingController ratio = TextEditingController();
  var isQuizable = false.obs; // متغير لتحديد إذا كان العنصر كويزابل
  Get.find<TeachernoteAndGradeReco>().resetError();
  return GetBuilder<TeachernoteAndGradeReco>(builder: (controller) {
    return VMSAlertDialog(
      action: [
        ButtonDialog(
          text: "Add".tr,
          onPressed: () {
            bool isitemNameError = itemName.text.trim().isEmpty;
            bool isratioError = ratio.text.trim().isEmpty ||
                int.parse(ratio.text.trim().toString()) == 0;
            controller.updateFieldError("item", isitemNameError);
            controller.updateFieldError("itemratio", isratioError);

            if (!(isitemNameError || isratioError)) {
              double? ratioValue = double.tryParse(ratio.text);
              if (ratioValue != null && ratioValue > 0) {
                Get.find<TeachernoteAndGradeReco>().Add_Items(
                  name: itemName.text,
                  ratio: ratioValue.toString(),
                  IsQuizable: isQuizable.value,
                );
                Get.back();
              } else {
                Get.snackbar("Error", "Invalid ratio value");
              }
            }
          },
          color: Get.theme.primaryColor,
          width: 100,
        ),
      ],
      contents: Container(
        width: 420,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              children: [
                Obx(() => Checkbox(
                      value: isQuizable.value,
                      onChanged: (value) {
                        isQuizable.value = value!;
                      },
                    )),
                Text("Is Quizable".tr),
              ],
            ),
            Row(
              children: [
                Textfildwithupper(
                  width: 350,
                  controller: itemName,
                  isError: controller.isitemError,
                  onChanged: (val) {
                    if (val.isNotEmpty)
                      controller.updateFieldError("item", false);
                  },
                  Uptext: "Item Name".tr,
                  hinttext: "Item Name".tr,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 10.0),
                  child: Textfildwithupper(
                    width: 60,
                    isError: controller.isitemRatioError,
                    onChanged: (val) {
                      if (val.isNotEmpty)
                        controller.updateFieldError("itemratio", false);
                    },
                    controller: ratio,
                    fieldType: "number",
                    Uptext: "Ratio".tr,
                    hinttext: "Ratio".tr,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
      apptitle: "Add Item".tr,
      subtitle: "Add Group Item".tr,
    );
  });
}

Edit_Items_Group(
    {required int idx, double? rat, String? name, bool? isQuizables}) {
  TextEditingController itemName = TextEditingController(text: name);
  TextEditingController ratio = TextEditingController(text: rat.toString());
  var isQuizable = (isQuizables ?? false).obs;
  Get.find<TeachernoteAndGradeReco>().resetError();
  return GetBuilder<TeachernoteAndGradeReco>(builder: (controller) {
    return VMSAlertDialog(
      action: [
        ButtonDialog(
          text: "Edit".tr,
          onPressed: () {
            bool isitemNameError = itemName.text.trim().isEmpty;
            bool isratioError = ratio.text.trim().isEmpty ||
                int.parse(ratio.text.trim().toString()) == 0;
            controller.updateFieldError("item", isitemNameError);
            controller.updateFieldError("itemratio", isratioError);
            double? ratioValue = double.tryParse(ratio.text);

            if (!(isitemNameError || isratioError)) {
              if (ratioValue != null && ratioValue > 0) {
                Get.find<TeachernoteAndGradeReco>().EditItem(
                  idx: idx,
                  name: itemName.text,
                  ratio: ratioValue.toString(),
                  IsQuizable: isQuizable.value,
                );
                Get.back();
              } else {
                Get.snackbar("Error", "Invalid ratio value");
              }
            }
          },
          color: Get.theme.primaryColor,
          width: 100,
        ),
      ],
      contents: Container(
        width: 420,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              children: [
                Obx(() => Checkbox(
                      value: isQuizable.value,
                      onChanged: (value) {
                        isQuizable.value = value!;
                      },
                    )),
                Text("Is Quizable".tr),
              ],
            ),
            Row(
              children: [
                Textfildwithupper(
                    width: 350,
                    controller: itemName,
                    Uptext: "Item Name".tr,
                    hinttext: "Item Name".tr,
                    isError: controller.isitemError,
                    onChanged: (val) {
                      if (val.isNotEmpty)
                        controller.updateFieldError("item", false);
                    }),
                Padding(
                  padding: const EdgeInsets.only(left: 10.0),
                  child: Textfildwithupper(
                    width: 60,
                    controller: ratio,
                    fieldType: "number",
                    isError: controller.isitemRatioError,
                    onChanged: (val) {
                      if (val.isNotEmpty)
                        controller.updateFieldError("itemratio", false);
                    },
                    Uptext: "Ratio".tr,
                    hinttext: "Ratio".tr,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
      apptitle: "Edit Item".tr,
      subtitle: "Edit Group Item".tr,
    );
  });
}

Rerange_Group() {
  return VMSAlertDialog(
    action: [],
    contents: GetBuilder<TeachernoteAndGradeReco>(
      builder: (controller) {
        return Container(
          width: 400,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Expanded(
                child: SingleChildScrollView(
                  child: ReorderableColumn(
                    onReorder: (oldIndex, newIndex) {
                      final item = controller.groups.removeAt(oldIndex);
                      controller.groups.insert(newIndex, item);
                      controller.update();
                    },
                    children: List.generate(controller.groups.length, (index) {
                      final group = controller.groups[index];
                      return Container(
                        key: ValueKey(group['name']),
                        margin: const EdgeInsets.symmetric(vertical: 5),
                        child: Slidable(
                          key: ValueKey(group['name']),
                          startActionPane: ActionPane(
                            motion: ScrollMotion(),
                            children: [
                              SlidableAction(
                                onPressed: (context) {
                                  Get.dialog(
                                      barrierDismissible: false,
                                      Edit_Group(index));
                                },
                                backgroundColor: Colors.blue,
                                foregroundColor: Colors.white,
                                icon: Icons.edit,
                                label: 'Edit'.tr,
                              ),
                            ],
                          ),
                          endActionPane: ActionPane(
                            motion: ScrollMotion(),
                            children: [
                              SlidableAction(
                                onPressed: (context) {
                                  _showDeleteConfirmationDialog(
                                      index, controller);
                                },
                                backgroundColor: Colors.red,
                                foregroundColor: Colors.white,
                                icon: Icons.delete,
                                label: 'Delete'.tr,
                              ),
                            ],
                          ),
                          child: Card(
                            color: Get.theme.primaryColor,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5),
                            ),
                            child: Container(
                              width: 400,
                              padding: const EdgeInsets.all(10),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    group['name'],
                                    textAlign: TextAlign.center,
                                    style: TextStyle(color: Colors.white),
                                  ),
                                  Text(
                                    group['ratio'].toString(),
                                    textAlign: TextAlign.center,
                                    style: TextStyle(color: Colors.white),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      );
                    }),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    ),
    apptitle: "Rerange".tr,
    subtitle: "Rerange Group".tr,
  );
}

void _showDeleteConfirmationDialog(
    int index, TeachernoteAndGradeReco controller) {
  Get.dialog(
    Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: Container(
        width: 300,
        padding: EdgeInsets.all(16),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              "Confirm Delete".tr,
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 16),
            Text("Are you sure you want to delete this group?".tr),
            SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                TextButton(
                  onPressed: () {
                    Get.back();
                  },
                  child: Text("Cancel".tr),
                ),
                TextButton(
                  onPressed: () {
                    controller.RemoveGroup(index);
                    Get.back();
                  },
                  child: Text("Delete".tr),
                ),
              ],
            ),
          ],
        ),
      ),
    ),
  );
}

Edit_Group(int idx) {
  var group = Get.find<TeachernoteAndGradeReco>().groups[idx];
  TextEditingController groupname = TextEditingController(text: group['name']);
  TextEditingController ratio =
      TextEditingController(text: group['ratio'].toString());

  // ضبط العناصر للمجموعة
  Get.find<TeachernoteAndGradeReco>().SetItems(group['items']);

  return GetBuilder<TeachernoteAndGradeReco>(builder: (controller) {
    // حساب الـ ratio من الـ items
    double totalRatio = controller.items.isNotEmpty
        ? controller.items.fold(0, (sum, item) => sum + (item['ratio'] as num))
        : 0;

    // إذا كانت العناصر فارغة، إعادة تعيين الـ ratio إلى صفر
    if (controller.items.isEmpty) {
      ratio.text =
          group['ratio'].toString(); // إرسال قيمة الـ ratio الخاصة بالجروب
    } else {
      ratio.text =
          totalRatio.toString(); // تحديث قيمة الـ ratio استنادًا إلى العناصر
    }

    return VMSAlertDialog(
      action: [
        ButtonDialog(
          text: "Edit".tr,
          onPressed: () {
            double? ratioValue = double.tryParse(ratio.text);
            if (ratioValue != null) {
              controller.UpdateGroupItems(
                id: group['id'],
                size: group['size'],
                idx: idx,
                groupName: groupname.text,
                ratioValue: ratioValue,
                items: controller.items.toList().cast<Map<String, dynamic>>(),
              );
              Get.back();
            } else {
              Get.snackbar("Error", "Invalid ratio value");
            }
          },
          color: Get.theme.primaryColor,
          width: 100,
        ),
      ],
      contents: Container(
        width: 500,
        height: 500,
        child: Column(
          children: [
            Row(
              children: [
                Textfildwithupper(
                  width: 350,
                  controller: groupname,
                  Uptext: "Group Name".tr,
                  hinttext: "Group Name".tr,
                ),
                Padding(
                    padding: const EdgeInsets.only(left: 10.0),
                    child: Textfildwithupper(
                      // عدم السماح بتعديل الـ ratio إذا كان هناك عناصر
                      readOnly: controller.items.isNotEmpty,
                      width: 60,
                      fieldType: "number",

                      controller: ratio,
                      Uptext: "Ratio".tr,
                      hinttext: "Ratio".tr,
                    )),
              ],
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(top: 15.0),
                child: Column(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        color: Get.theme.primaryColor,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(5),
                          topRight: Radius.circular(5),
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Group Items".tr,
                              style: TextStyle(color: Colors.white),
                            ),
                            Container(
                              width: 30,
                              height: 30,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(5),
                                boxShadow: const [
                                  BoxShadow(
                                    color: Colors.black12,
                                    offset: Offset(0, 2),
                                    blurRadius: 1,
                                  ),
                                ],
                              ),
                              child: IconButton(
                                onPressed: () {
                                  Get.dialog(
                                      barrierDismissible: false,
                                      Add_Items_Group());
                                },
                                icon: Icon(
                                  Icons.add,
                                  size: 14,
                                  color: Get.theme.primaryColor,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Table(
                      border: TableBorder(
                        left: BorderSide(width: 1, color: Colors.black),
                        right: BorderSide(width: 1, color: Colors.black),
                        bottom: BorderSide(width: 1, color: Colors.black),
                        horizontalInside: BorderSide.none,
                        verticalInside: BorderSide.none,
                      ),
                      columnWidths: {
                        0: FlexColumnWidth(),
                        1: FlexColumnWidth(),
                        2: FlexColumnWidth(),
                      },
                      children: [
                        TableRow(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Center(child: Text("Item Name".tr)),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Center(child: Text("Item ratio".tr)),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Center(child: Text("Operations".tr)),
                            ),
                          ],
                        ),
                      ],
                    ),
                    Expanded(
                      child: Obx(() {
                        var items = Get.find<TeachernoteAndGradeReco>().items;

                        return SingleChildScrollView(
                          child: Table(
                            border:
                                TableBorder.all(color: Colors.black, width: 1),
                            columnWidths: {
                              0: FlexColumnWidth(),
                              1: FlexColumnWidth(),
                              2: FlexColumnWidth(),
                            },
                            children: List.generate(
                              items.length,
                              (index) => TableRow(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Center(
                                      child:
                                          Text(items[index]['name'] as String),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Center(
                                        child: Text(
                                            items[index]['ratio'].toString())),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Container(
                                          width: 30,
                                          height: 30,
                                          decoration: BoxDecoration(
                                            color: Colors.white,
                                            borderRadius:
                                                BorderRadius.circular(5),
                                            boxShadow: const [
                                              BoxShadow(
                                                color: Colors.black12,
                                                offset: Offset(0, 2),
                                                blurRadius: 1,
                                              ),
                                            ],
                                          ),
                                          child: IconButton(
                                            onPressed: () {
                                              Get.dialog(
                                                  barrierDismissible: false,
                                                  Edit_Items_Group(
                                                      idx: index,
                                                      name: controller
                                                          .items[index]['name'],
                                                      isQuizables: controller
                                                              .items[index]
                                                          ['isQuizable'],
                                                      rat: controller
                                                              .items[index]
                                                          ['ratio']));
                                            },
                                            icon: Icon(
                                              Icons.edit,
                                              size: 14,
                                              color: Get.theme.primaryColor,
                                            ),
                                          ),
                                        ),
                                        SizedBox(width: 10),
                                        Container(
                                          width: 30,
                                          height: 30,
                                          decoration: BoxDecoration(
                                            color: Colors.white,
                                            borderRadius:
                                                BorderRadius.circular(5),
                                            boxShadow: const [
                                              BoxShadow(
                                                color: Colors.black12,
                                                offset: Offset(0, 2),
                                                blurRadius: 1,
                                              ),
                                            ],
                                          ),
                                          child: IconButton(
                                            onPressed: () {
                                              controller.RemoveItem(index);
                                            },
                                            icon: Icon(
                                              Icons.delete,
                                              size: 14,
                                              color: Get.theme.primaryColor,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        );
                      }),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      apptitle: "Edit Group".tr,
      subtitle: "Editgroup".tr + " ${group['name']} " + "Groupp".tr,
    );
  });
}
