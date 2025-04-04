import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:vms_school/Icons_File/v_m_s__icons_icons.dart';
import 'package:vms_school/Link/API/AdminAPI/School/School_DropDown/DropdownClassesAPI.dart';
import 'package:vms_school/Link/API/AdminAPI/School/School_Screen_APIs/Division_API/Add_Division_API.dart';
import 'package:vms_school/Link/API/AdminAPI/School/School_Screen_APIs/Division_API/Get_All_Division.dart';
import 'package:vms_school/Link/Controller/AdminController/Years_Controllers/Divisions_Controller.dart';
import 'package:vms_school/Link/Controller/WidgetController/Sessions_DropDown_Controller.dart';
import 'package:vms_school/view/Admin/School_Management/Division_Pages/Division_Grid.dart';
import 'package:vms_school/widgets/Admin_School/All_Screen_Sessions.dart';
import 'package:vms_school/widgets/Admin_School/DropDownDivisionMgmt.dart';
import 'package:vms_school/widgets/ButtonsDialog.dart';
import 'package:vms_school/widgets/TextFildWithUpper.dart';
import 'package:vms_school/widgets/VMSAlertDialog.dart';

class DivisionManagement extends StatefulWidget {
  const DivisionManagement({super.key});

  @override
  State<DivisionManagement> createState() => _DivisionManagementState();
}

class _DivisionManagementState extends State<DivisionManagement> {
  TextEditingController arName = TextEditingController();

  TextEditingController enName = TextEditingController();

  TextEditingController driveUrl = TextEditingController();
  @override
  void initState() {
    Get.find<All_Screen_Sessions_Controller>().setSessionDefult();
    Get_All_Division_API(context).Get_All_Division();
    Getallclassapi.getAllClasses();
    Get.find<Divisions_Controller>().ClassIndex = "";
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: Column(
      children: [
        Container(
          margin: const EdgeInsets.only(left: 30.0, right: 30.0, top: 30.0),
          alignment: Alignment.center,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  DropDownAllSessions(
                      API: "division",
                      title: "Session".tr,
                      width: Get.width / 3,
                      type: "session"),
                  Padding(
                    padding: const EdgeInsets.only(left: 8.0),
                    child:
                        GetBuilder<Divisions_Controller>(builder: (controller) {
                      return DropDownDivisionMgmt(
                          isLoading: controller.isLoading,
                          title: "Class".tr,
                          width: Get.width / 3,
                          type: "class");
                    }),
                  ),
                  const Spacer(),
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
                        style: ButtonStyle(
                            backgroundColor: WidgetStatePropertyAll(
                                Theme.of(context).cardColor),
                            shape: WidgetStatePropertyAll(
                                RoundedRectangleBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(5))))),
                        onPressed: () {
                          arName.clear();
                          enName.clear();
                          driveUrl.clear();
                          Get.find<Divisions_Controller>()
                              .updateFieldError("ename", false);
                          Get.find<Divisions_Controller>()
                              .updateFieldError("arname", false);
                          Get.find<Divisions_Controller>()
                              .updateFieldError("meet", false);
                          Get.find<Divisions_Controller>()
                              .updateFieldError("class", false);
                          Get.dialog(barrierDismissible: false,
                              GetBuilder<Divisions_Controller>(
                                  builder: (controller) {
                            return VMSAlertDialog(
                                action: [
                                  ButtonDialog(
                                      text: "Add".tr,
                                      onPressed: () async {
                                        bool isArNameEmpty =
                                            arName.text.isEmpty;
                                        bool isEnNameEmpty =
                                            enName.text.isEmpty;
                                        bool isDriveEmpty =
                                            driveUrl.text.isEmpty;

                                        bool isclassEmpty = controller
                                                .ClassDiagIndex.isEmpty ||
                                            controller.ClassDiagIndex.isEmpty ==
                                                "";

                                        controller.updateFieldError(
                                            "ename", isEnNameEmpty);
                                        controller.updateFieldError(
                                            "arname", isArNameEmpty);
                                        controller.updateFieldError(
                                            "meet", isDriveEmpty);
                                        controller.updateFieldError(
                                            "class", isclassEmpty);

                                        if (!(isArNameEmpty ||
                                            isEnNameEmpty ||
                                            isDriveEmpty ||
                                            isclassEmpty)) {
                                          await Add_Division_API(context)
                                              .Add_Division(
                                            classId: controller.dropDiagClasses,
                                            enName: enName.text,
                                            name: arName.text,
                                            meetUrl: driveUrl.text,
                                          );

                                          arName.clear();
                                          enName.clear();
                                          driveUrl.clear();
                                          Get.back();
                                        }
                                      },
                                      color: Theme.of(context).primaryColor,
                                      width: 120),
                                ],
                                contents: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        Textfildwithupper(
                                            isError: controller.IsennameError,
                                            isRequired: true,
                                            onChanged: (value) {
                                              if (value.isNotEmpty) {
                                                controller.updateFieldError(
                                                    "ename", false);
                                              }
                                            },
                                            width: 250,
                                            controller: enName,
                                            Uptext: "Division En - Name".tr,
                                            hinttext: "Division En - Name".tr),
                                        Padding(
                                          padding: const EdgeInsets.only(
                                              left: 15.0,
                                              right: 15.0,
                                              bottom: 15.0),
                                          child: Textfildwithupper(
                                              isError: controller.IsarnameError,
                                              isRequired: true,
                                              onChanged: (value) {
                                                if (value.isNotEmpty) {
                                                  controller.updateFieldError(
                                                      "arname", false);
                                                }
                                              },
                                              width: 250,
                                              controller: arName,
                                              Uptext: "Division Ar - Name".tr,
                                              hinttext:
                                                  "Division Ar - Name".tr),
                                        ),
                                      ],
                                    ),
                                    Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.end,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        GetBuilder<Divisions_Controller>(
                                            builder: (controller) {
                                          return DropDownDivisionMgmt(
                                              isError: controller.IsclassError,
                                              isLoading: controller.isLoading,
                                              title: "Class".tr,
                                              width: 250,
                                              type: "classDiag");
                                        }),
                                        Row(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Textfildwithupper(
                                                isError: controller.IsmeetError,
                                                isRequired: true,
                                                onChanged: (value) {
                                                  if (value.isNotEmpty) {
                                                    controller.updateFieldError(
                                                        "meet", false);
                                                  }
                                                },
                                                width: 230,
                                                controller: driveUrl,
                                                Uptext: "Meet URL".tr,
                                                hinttext: "Meet URL".tr),
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  left: 5.0, top: 36.0),
                                              child: SvgPicture.asset(
                                                  "assets/images/meet.svg",
                                                  width: 25),
                                            )
                                          ],
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                                apptitle: "Add Division".tr,
                                subtitle: "none");
                          }));
                        },
                        icon: Icon(Icons.add,
                            size: 18, color: Theme.of(context).highlightColor)),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 10.0, left: 10.0),
                    child: Container(
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
                          style: ButtonStyle(
                              backgroundColor: WidgetStatePropertyAll(
                                  Theme.of(context).cardColor),
                              shape: WidgetStatePropertyAll(
                                  RoundedRectangleBorder(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(5))))),
                          onPressed: () {},
                          icon: Icon(VMS_Icons.pdf,
                              size: 18,
                              color: Theme.of(context).highlightColor)),
                    ),
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
                        style: ButtonStyle(
                            backgroundColor: WidgetStatePropertyAll(
                                Theme.of(context).cardColor),
                            shape: WidgetStatePropertyAll(
                                RoundedRectangleBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(5))))),
                        onPressed: () {},
                        icon: Icon(VMS_Icons.xl,
                            size: 18, color: Theme.of(context).highlightColor)),
                  ),
                ],
              ),
            ],
          ),
        ),
        Expanded(
            child: Padding(
          padding: const EdgeInsets.only(top: 15.0),
          child: DivisionGrid(),
        )),
      ],
    ));
  }
}
