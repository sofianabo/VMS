import 'package:flutter/material.dart';
import 'package:flutter_dropzone/flutter_dropzone.dart';
import 'package:get/get.dart';
import 'package:vms_school/Icons_File/v_m_s__icons_icons.dart';
import 'package:vms_school/Link/API/AdminAPI/School/School_Screen_APIs/Electronic_Library_API/Add_E_Book_API.dart';
import 'package:vms_school/Link/API/AdminAPI/School/School_Screen_APIs/Electronic_Library_API/Get_All_E_Book.dart';
import 'package:vms_school/Link/Controller/AdminController/Employee_Controllers/Add_Data_controller.dart';
import 'package:vms_school/Link/Controller/AdminController/School_Controllers/Labrary_Controller.dart';
import 'package:vms_school/Link/Functions/Export_Exle_Function.dart';
import 'package:vms_school/Link/Functions/Export_PDF_Function.dart';
import 'package:vms_school/Link/Model/AdminModel/School_Models/Labrary_Model.dart';
import 'package:vms_school/view/SMS_Platform/Admin/School_Management/Electronic_Pages/Electronic_Book_Grid.dart';
import 'package:vms_school/view/Both_Platform/widgets/ButtonsDialog.dart';
import 'package:vms_school/view/Both_Platform/widgets/TextFildWithUpper.dart';
import 'package:vms_school/view/Both_Platform/widgets/TextFormSearch.dart';
import 'package:vms_school/view/Both_Platform/widgets/VMSAlertDialog.dart';

class ElectronicBook extends StatefulWidget {
  const ElectronicBook({super.key});

  @override
  State<ElectronicBook> createState() => _ElectronicBookState();
}

class _ElectronicBookState extends State<ElectronicBook> {
  TextEditingController search = TextEditingController();

  TextEditingController name = TextEditingController();
  TextEditingController enName = TextEditingController();
  DropzoneViewController? ctrl;
  @override
  void initState() {
    Get_All_E_Book_API(context).Get_All_E_Book();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return Expanded(
        child: Column(
      children: [
        if (Get.find<Add_Data_controller>().roll != "observer")
          if (screenWidth > 769)
            Container(
              width: screenWidth,
              margin: const EdgeInsets.only(left: 30.0, right: 30.0, top: 30.0),
              child: Wrap(
                alignment: WrapAlignment.spaceBetween,
                crossAxisAlignment: WrapCrossAlignment.center,
                runAlignment: WrapAlignment.spaceBetween,
                spacing: 10.0,
                runSpacing: 8.0,
                children: [
                  GetBuilder<Labrary_Controller>(builder: (controller) {
                    return TextFormSearch(
                      click: () {
                        controller.clearFilter();
                      },
                      onchange: (value) {
                        controller.searchByName(value);
                      },
                      width: screenWidth >= 1060
                          ? screenWidth * 0.7
                          : screenWidth >= 732
                              ? screenWidth * 0.8
                              : screenWidth * 0.9,
                      radius: 5,
                      controller: search,
                      suffixIcon:
                          search.text.isNotEmpty ? Icons.close : Icons.search,
                    );
                  }),
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    spacing: 10.0,
                    children: [
                      Container(
                        width: 40,
                        height: 40,
                        decoration: BoxDecoration(
                            color: Theme.of(context).cardColor,
                            borderRadius: BorderRadius.circular(5),
                            boxShadow: const [
                              BoxShadow(
                                  color: Colors.black12,
                                  offset: Offset(0, 2),
                                  blurRadius: 1)
                            ]),
                        child: IconButton(
                            style: const ButtonStyle(
                                shape: WidgetStatePropertyAll(
                                    RoundedRectangleBorder(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(5))))),
                            onPressed: () {
                              var controller = Get.find<Labrary_Controller>();
                              controller.selectedFile.value = null;
                              name.clear();
                              enName.clear();
                              controller.updateTextFile(
                                  "Click To Add File\nOr\nDrag And Drop File Here"
                                      .tr);
                              controller.updateFieldError("arname", false);
                              controller.updateFieldError("enname", false);
                              controller.updateFieldError("file", false);

                              Get.dialog(
                                Add_Electronic_Book(),
                                barrierDismissible: false,
                              );
                            },
                            icon: Icon(Icons.add,
                                size: 18,
                                color: Theme.of(context)
                                    .textTheme
                                    .titleMedium!
                                    .color!)),
                      ),
                      Container(
                        width: 40,
                        height: 40,
                        decoration: BoxDecoration(
                            color: Theme.of(context).cardColor,
                            borderRadius: BorderRadius.circular(5),
                            boxShadow: const [
                              BoxShadow(
                                  color: Colors.black12,
                                  offset: Offset(0, 2),
                                  blurRadius: 1)
                            ]),
                        child: IconButton(
                            style: const ButtonStyle(
                                shape: WidgetStatePropertyAll(
                                    RoundedRectangleBorder(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(5))))),
                            onPressed: () {
                              exportDataToPdf<Books>(
                                items: Get.find<Labrary_Controller>()
                                    .filteredEbook!,
                                headers: [
                                  "Name".tr,
                                  "English Name".tr,
                                ],
                                fieldMappings: {
                                  "Name".tr: (reg) => reg.name ?? "",
                                  "English Name".tr: (reg) => reg.enName ?? "",
                                },
                                fileName: "School Content".tr +
                                    '${DateTime.now().toIso8601String()}',
                              );
                            },
                            icon: Icon(VMS_Icons.pdf,
                                size: 18,
                                color: Theme.of(context)
                                    .textTheme
                                    .titleMedium!
                                    .color!)),
                      ),
                      Container(
                        width: 40,
                        height: 40,
                        decoration: BoxDecoration(
                            color: Theme.of(context).cardColor,
                            borderRadius: BorderRadius.circular(5),
                            boxShadow: const [
                              BoxShadow(
                                  color: Colors.black12,
                                  offset: Offset(0, 2),
                                  blurRadius: 1)
                            ]),
                        child: IconButton(
                            style: const ButtonStyle(
                                shape: WidgetStatePropertyAll(
                                    RoundedRectangleBorder(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(5))))),
                            onPressed: () {
                              exportDataToExcel<Books>(
                                items: Get.find<Labrary_Controller>()
                                    .filteredEbook!,
                                headers: [
                                  "Name".tr,
                                  "English Name".tr,
                                ],
                                fieldMappings: {
                                  "Name".tr: (reg) => reg.name ?? "",
                                  "English Name".tr: (reg) => reg.enName ?? "",
                                },
                                fileName: "School Content".tr +
                                    '${DateTime.now().toIso8601String()}',
                              );
                            },
                            icon: Icon(VMS_Icons.xl,
                                size: 18,
                                color: Theme.of(context)
                                    .textTheme
                                    .titleMedium!
                                    .color!)),
                      ),
                    ],
                  )
                ],
              ),
            ),
        if (Get.find<Add_Data_controller>().roll != "observer")
          if (screenWidth <= 769)
            Container(
              width: screenWidth,
              margin: const EdgeInsets.only(left: 30.0, right: 30.0, top: 30.0),
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  spacing: 10.0,
                  children: [
                    GetBuilder<Labrary_Controller>(builder: (controller) {
                      return TextFormSearch(
                        click: () {
                          controller.clearFilter();
                        },
                        onchange: (value) {
                          controller.searchByName(value);
                        },
                        width: screenWidth >= 1060
                            ? screenWidth * 0.7
                            : screenWidth >= 732
                                ? screenWidth * 0.8
                                : screenWidth * 0.9,
                        radius: 5,
                        controller: search,
                        suffixIcon:
                            search.text.isNotEmpty ? Icons.close : Icons.search,
                      );
                    }),
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      spacing: 10.0,
                      children: [
                        Container(
                          width: 40,
                          height: 40,
                          decoration: BoxDecoration(
                              color: Theme.of(context).cardColor,
                              borderRadius: BorderRadius.circular(5),
                              boxShadow: const [
                                BoxShadow(
                                    color: Colors.black12,
                                    offset: Offset(0, 2),
                                    blurRadius: 1)
                              ]),
                          child: IconButton(
                              style: const ButtonStyle(
                                  shape: WidgetStatePropertyAll(
                                      RoundedRectangleBorder(
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(5))))),
                              onPressed: () {
                                var controller = Get.find<Labrary_Controller>();
                                controller.selectedFile.value = null;
                                name.clear();
                                enName.clear();
                                controller.updateTextFile(
                                    "Click To Add File\nOr\nDrag And Drop File Here"
                                        .tr);
                                controller.updateFieldError("arname", false);
                                controller.updateFieldError("enname", false);
                                controller.updateFieldError("file", false);

                                Get.dialog(
                                  Add_Electronic_Book(),
                                  barrierDismissible: false,
                                );
                              },
                              icon: Icon(Icons.add,
                                  size: 18,
                                  color: Theme.of(context)
                                      .textTheme
                                      .titleMedium!
                                      .color!)),
                        ),
                        Container(
                          width: 40,
                          height: 40,
                          decoration: BoxDecoration(
                              color: Theme.of(context).cardColor,
                              borderRadius: BorderRadius.circular(5),
                              boxShadow: const [
                                BoxShadow(
                                    color: Colors.black12,
                                    offset: Offset(0, 2),
                                    blurRadius: 1)
                              ]),
                          child: IconButton(
                              style: const ButtonStyle(
                                  shape: WidgetStatePropertyAll(
                                      RoundedRectangleBorder(
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(5))))),
                              onPressed: () {
                                exportDataToPdf<Books>(
                                  items: Get.find<Labrary_Controller>()
                                      .filteredEbook!,
                                  headers: [
                                    "Name".tr,
                                    "English Name".tr,
                                  ],
                                  fieldMappings: {
                                    "Name".tr: (reg) => reg.name ?? "",
                                    "English Name".tr: (reg) =>
                                        reg.enName ?? "",
                                  },
                                  fileName: "School Content".tr +
                                      '${DateTime.now().toIso8601String()}',
                                );
                              },
                              icon: Icon(VMS_Icons.pdf,
                                  size: 18,
                                  color: Theme.of(context)
                                      .textTheme
                                      .titleMedium!
                                      .color!)),
                        ),
                        Container(
                          width: 40,
                          height: 40,
                          decoration: BoxDecoration(
                              color: Theme.of(context).cardColor,
                              borderRadius: BorderRadius.circular(5),
                              boxShadow: const [
                                BoxShadow(
                                    color: Colors.black12,
                                    offset: Offset(0, 2),
                                    blurRadius: 1)
                              ]),
                          child: IconButton(
                              style: const ButtonStyle(
                                  shape: WidgetStatePropertyAll(
                                      RoundedRectangleBorder(
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(5))))),
                              onPressed: () {
                                exportDataToExcel<Books>(
                                  items: Get.find<Labrary_Controller>()
                                      .filteredEbook!,
                                  headers: [
                                    "Name".tr,
                                    "English Name".tr,
                                  ],
                                  fieldMappings: {
                                    "Name".tr: (reg) => reg.name ?? "",
                                    "English Name".tr: (reg) =>
                                        reg.enName ?? "",
                                  },
                                  fileName: "School Content".tr +
                                      '${DateTime.now().toIso8601String()}',
                                );
                              },
                              icon: Icon(VMS_Icons.xl,
                                  size: 18,
                                  color: Theme.of(context)
                                      .textTheme
                                      .titleMedium!
                                      .color!)),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
        Expanded(
            child: Padding(
          padding: const EdgeInsets.only(top: 15.0),
          child: ElectronicBookGrid(),
        )),
      ],
    ));
  }

  Add_Electronic_Book() {
    return GetBuilder<Labrary_Controller>(builder: (controller) {
      return VMSAlertDialog(
          contents: SizedBox(
            width: 550,
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Wrap(
                    spacing: 20.0,
                    runSpacing: 20.0,
                    crossAxisAlignment: WrapCrossAlignment.center,
                    children: [
                      Textfildwithupper(
                          isRequired: true,
                          isError: controller.IsarnameError,
                          onChanged: (value) {
                            if (value.isNotEmpty) {
                              controller.updateFieldError("arname", false);
                            }
                          },
                          width: 350,
                          controller: name,
                          Uptext: "Name".tr,
                          hinttext: "Name".tr),
                      Textfildwithupper(
                          isRequired: true,
                          isError: controller.IsennameError,
                          onChanged: (value) {
                            if (value.isNotEmpty) {
                              controller.updateFieldError("enname", false);
                            }
                          },
                          width: 350,
                          controller: enName,
                          Uptext: "English Name".tr,
                          hinttext: "English Name".tr),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 10.0),
                    child: Wrap(
                      spacing: 20.0,
                      runSpacing: 20.0,
                      crossAxisAlignment: WrapCrossAlignment.center,
                      children: [
                        GestureDetector(
                          onTap: () {
                            controller.pickPDFFile();
                          },
                          child: AnimatedContainer(
                            duration: const Duration(milliseconds: 500),
                            decoration: BoxDecoration(
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(5)),
                              border: controller.IsfileError
                                  ? Border.all(color: Colors.redAccent)
                                  : Border.all(color: const Color(0xffD9D9D9)),
                              color: controller.isHoveringFile
                                  ? Theme.of(context).primaryColor
                                  : Get.theme.cardColor,
                            ),
                            alignment: Alignment.center,
                            width: 350,
                            height: 100,
                            child: Stack(
                              children: [
                                DropzoneView(
                                  operation: DragOperation.copy,
                                  cursor: CursorType.Default,
                                  onCreated:
                                      (DropzoneViewController controller) {
                                    ctrl = controller;
                                  },
                                  onHover: () {
                                    controller.updateHoverFile(true);
                                  },
                                  onLeave: () {
                                    controller.updateHoverFile(false);
                                  },
                                  onDropFiles: (List<DropzoneFileInterface>?
                                      files) async {
                                    if (files != null && files.length == 1) {
                                      final file = files.first;
                                      final mimeType =
                                          await ctrl?.getFileMIME(file);
                                      final fileName =
                                          await ctrl?.getFilename(file);
                                      final fileBytes =
                                          await ctrl?.getFileData(file);

                                      if (mimeType == 'application/pdf' ||
                                          fileName!
                                              .toLowerCase()
                                              .endsWith('.pdf')) {
                                        controller.selectedFile.value =
                                            fileBytes;
                                        controller.fileName.value = fileName!;
                                        controller.updateTextFile(
                                            "PDF File Successfully Dropped!"
                                                .tr);
                                        controller.updateFieldError(
                                            "file", false);
                                      } else {
                                        controller.updateTextFile(
                                            "Error: Unsupported File Type.".tr);
                                        controller.updateFieldError(
                                            "file", true);
                                      }
                                    } else {
                                      controller.updateTextFile(
                                          "Error: Only One File Is Allowed."
                                              .tr);
                                      controller.updateFieldError("file", true);
                                    }
                                  },
                                ),
                                Center(
                                  child: controller.selectedFile.value != null
                                      ? IconButton(
                                          onPressed: () {
                                            controller.Clearfile();
                                          },
                                          icon: Icon(
                                            Icons.delete_outline_outlined,
                                            color: Colors.redAccent,
                                          ))
                                      : Text(
                                          textAlign: TextAlign.center,
                                          controller.fileStatus,
                                          style: TextStyle(
                                            color: controller.isHoveringFile
                                                ? Colors.white
                                                : const Color(0xffCBBFBF),
                                          ),
                                        ),
                                ),
                              ],
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
          action: [
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                ButtonDialog(
                    width: 150,
                    text: "Add Book".tr,
                    onPressed: () async {
                      bool isArNameEmpty = name.text.isEmpty;
                      bool isEnNameEmpty = enName.text.isEmpty;
                      bool isfileEmpty = controller.selectedFile.value == null;

                      controller.updateFieldError("arname", isArNameEmpty);
                      controller.updateFieldError("enname", isEnNameEmpty);
                      controller.updateFieldError("file", isfileEmpty);

                      if (!(isArNameEmpty || isEnNameEmpty || isfileEmpty)) {
                        await Add_E_Book_API(context).Add_E_Book(
                          file: controller.selectedFile.value,
                          name: name.text,
                          enName: enName.text,
                        );
                        controller.selectedFile.value!.clear();
                        name.clear();
                        enName.clear();
                      }
                    },
                    color: Theme.of(context).primaryColor)
              ],
            )
          ],
          apptitle: "Add Electronic Book".tr,
          subtitle: "none");
    });
  }
}
