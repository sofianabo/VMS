import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vms_school/Link/API/Guardians_API/Get_My_Children_API.dart';
import 'package:vms_school/Link/Controller/AdminController/Students_Controllers/Add_Students_Controller.dart';
import 'package:vms_school/Link/Controller/GuardianController/MyChildren_Controller.dart';
import 'package:vms_school/view/Guardian/AppBarGuardian.dart';
import 'package:vms_school/view/Guardian/Functions/Add_Student_For_Guardian.dart';
import 'package:vms_school/view/Guardian/MainScreen/GuardianMainScreenGrid.dart';
import 'package:vms_school/widgets/TextFormSearch.dart';

class GuardianMainScreen extends StatefulWidget {
  const GuardianMainScreen({super.key});

  @override
  State<GuardianMainScreen> createState() => _GuardianMainScreenState();
}

class _GuardianMainScreenState extends State<GuardianMainScreen> {
  TextEditingController search = TextEditingController();

  @override
  void initState() {
    Get_My_Children_API().Get_My_Children();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Expanded(
          child: Column(
        children: [
          Appbarguardian(),
          if (screenWidth > 769)
            Container(
              width: screenWidth,
              margin: const EdgeInsets.only(left: 30.0, right: 30.0, top: 10.0),
              child: Wrap(
                alignment: WrapAlignment.spaceBetween,
                crossAxisAlignment: WrapCrossAlignment.center,
                runAlignment: WrapAlignment.spaceBetween,
                spacing: 10.0,
                runSpacing: 8.0,
                children: [
                  GetBuilder<MyChildren_Controller>(builder: (controller) {
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
                              Get.find<Add_Students_Controller>().resetError();
                              Add_Students_Guardian_Functions();
                            },
                            icon: Icon(Icons.add,
                                size: 18,
                                color: Theme.of(context).highlightColor)),
                      ),
                    ],
                  )
                ],
              ),
            ),
          if (screenWidth <= 769)
            Container(
              width: screenWidth,
              margin: const EdgeInsets.only(left: 30.0, right: 30.0, top: 10.0),
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  spacing: 10.0,
                  children: [
                    GetBuilder<MyChildren_Controller>(builder: (controller) {
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
                                Get.find<Add_Students_Controller>()
                                    .resetError();
                                Add_Students_Guardian_Functions();
                              },
                              icon: Icon(Icons.add,
                                  size: 18,
                                  color: Theme.of(context).highlightColor)),
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
            child: GuardianMainScreenGrid(),
          )),
        ],
      )),
    );
  }

  // Add_Electronic_Book() {
  //   return GetBuilder<Guardianmainscreencontroller>(builder: (controller) {
  //     return VMSAlertDialog(
  //         contents: SizedBox(
  //           width: 550,
  //           child: SingleChildScrollView(
  //             child: Column(
  //               mainAxisSize: MainAxisSize.min,
  //               children: [
  //                 Wrap(
  //                   spacing: 20.0,
  //                   runSpacing: 20.0,
  //                   crossAxisAlignment: WrapCrossAlignment.center,
  //                   children: [
  //                     Textfildwithupper(
  //                         isRequired: true,
  //                         isError: controller.IsarnameError,
  //                         onChanged: (value) {
  //                           if (value.isNotEmpty) {
  //                             controller.updateFieldError("arname", false);
  //                           }
  //                         },
  //                         width: 350,
  //                         controller: name,
  //                         Uptext: "Name".tr,
  //                         hinttext: "Name".tr),
  //                     Textfildwithupper(
  //                         isRequired: true,
  //                         isError: controller.IsennameError,
  //                         onChanged: (value) {
  //                           if (value.isNotEmpty) {
  //                             controller.updateFieldError("enname", false);
  //                           }
  //                         },
  //                         width: 350,
  //                         controller: enName,
  //                         Uptext: "English Name".tr,
  //                         hinttext: "English Name".tr),
  //                   ],
  //                 ),
  //                 Padding(
  //                   padding: const EdgeInsets.only(top: 10.0),
  //                   child: Wrap(
  //                     spacing: 20.0,
  //                     runSpacing: 20.0,
  //                     crossAxisAlignment: WrapCrossAlignment.center,
  //                     children: [
  //                       GestureDetector(
  //                         onTap: () {
  //                           controller.pickPDFFile();
  //                         },
  //                         child: AnimatedContainer(
  //                           duration: const Duration(milliseconds: 500),
  //                           decoration: BoxDecoration(
  //                             borderRadius:
  //                                 const BorderRadius.all(Radius.circular(5)),
  //                             border: controller.IsfileError
  //                                 ? Border.all(color: Colors.redAccent)
  //                                 : Border.all(color: const Color(0xffD9D9D9)),
  //                             color: controller.isHoveringFile
  //                                 ? Theme.of(context).primaryColor
  //                                 : Get.theme.cardColor,
  //                           ),
  //                           alignment: Alignment.center,
  //                           width: 350,
  //                           height: 100,
  //                           child: Stack(
  //                             children: [
  //                               DropzoneView(
  //                                 operation: DragOperation.copy,
  //                                 cursor: CursorType.Default,
  //                                 onCreated:
  //                                     (DropzoneViewController controller) {
  //                                   ctrl = controller;
  //                                 },
  //                                 onHover: () {
  //                                   controller.updateHoverFile(true);
  //                                 },
  //                                 onLeave: () {
  //                                   controller.updateHoverFile(false);
  //                                 },
  //                                 onDropFiles: (List<DropzoneFileInterface>?
  //                                     files) async {
  //                                   if (files != null && files.length == 1) {
  //                                     final file = files.first;
  //                                     final mimeType =
  //                                         await ctrl?.getFileMIME(file);
  //                                     final fileName =
  //                                         await ctrl?.getFilename(file);
  //                                     final fileBytes =
  //                                         await ctrl?.getFileData(file);

  //                                     if (mimeType == 'application/pdf' ||
  //                                         fileName!
  //                                             .toLowerCase()
  //                                             .endsWith('.pdf')) {
  //                                       controller.selectedFile.value =
  //                                           fileBytes;
  //                                       controller.fileName.value = fileName!;
  //                                       controller.updateTextFile(
  //                                           "PDF File Successfully Dropped!"
  //                                               .tr);
  //                                       controller.updateFieldError(
  //                                           "file", false);
  //                                     } else {
  //                                       controller.updateTextFile(
  //                                           "Error: Unsupported File Type.".tr);
  //                                       controller.updateFieldError(
  //                                           "file", true);
  //                                     }
  //                                   } else {
  //                                     controller.updateTextFile(
  //                                         "Error: Only One File Is Allowed."
  //                                             .tr);
  //                                     controller.updateFieldError("file", true);
  //                                   }
  //                                 },
  //                               ),
  //                               Center(
  //                                 child: controller.selectedFile.value != null
  //                                     ? IconButton(
  //                                         onPressed: () {
  //                                           controller.Clearfile();
  //                                         },
  //                                         icon: Icon(
  //                                           Icons.delete_outline_outlined,
  //                                           color: Colors.redAccent,
  //                                         ))
  //                                     : Text(
  //                                         textAlign: TextAlign.center,
  //                                         controller.fileStatus,
  //                                         style: TextStyle(
  //                                           color: controller.isHoveringFile
  //                                               ? Colors.white
  //                                               : const Color(0xffCBBFBF),
  //                                         ),
  //                                       ),
  //                               ),
  //                             ],
  //                           ),
  //                         ),
  //                       ),
  //                     ],
  //                   ),
  //                 ),
  //               ],
  //             ),
  //           ),
  //         ),
  //         action: [
  //           Row(
  //             mainAxisAlignment: MainAxisAlignment.end,
  //             children: [
  //               ButtonDialog(
  //                   width: 150,
  //                   text: "Add Book".tr,
  //                   onPressed: () async {
  //                     bool isArNameEmpty = name.text.isEmpty;
  //                     bool isEnNameEmpty = enName.text.isEmpty;
  //                     bool isfileEmpty = controller.selectedFile.value == null;

  //                     controller.updateFieldError("arname", isArNameEmpty);
  //                     controller.updateFieldError("enname", isEnNameEmpty);
  //                     controller.updateFieldError("file", isfileEmpty);

  //                     if (!(isArNameEmpty || isEnNameEmpty || isfileEmpty)) {
  //                       await Add_E_Book_API(context).Add_E_Book(
  //                         file: controller.selectedFile.value,
  //                         name: name.text,
  //                         enName: enName.text,
  //                       );
  //                       controller.selectedFile.value!.clear();
  //                       name.clear();
  //                       enName.clear();
  //                     }
  //                   },
  //                   color: Theme.of(context).primaryColor)
  //             ],
  //           )
  //         ],
  //         apptitle: "Add Electronic Book".tr,
  //         subtitle: "none");
  //   });
  // }
}
