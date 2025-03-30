import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vms_school/Icons_File/v_m_s__icons_icons.dart';
import 'package:vms_school/Link/API/AdminAPI/School/School_Screen_APIs/Grade_Screen/Add_Grade_API.dart';
import 'package:vms_school/Link/API/AdminAPI/School/School_Screen_APIs/Grade_Screen/Grade_Screen_API.dart';
import 'package:vms_school/Link/Controller/AdminController/School_Controllers/Grade_Controller.dart';
import 'package:vms_school/view/Admin/School_Management/Grade_Pages/GradeManagementGrid.dart';
import 'package:vms_school/widgets/ButtonsDialog.dart';
import 'package:vms_school/widgets/TextFildWithUpper.dart';
import 'package:vms_school/widgets/VMSAlertDialog.dart';

class GradeManagement extends StatefulWidget {
  const GradeManagement({super.key});

  @override
  State<GradeManagement> createState() => _GradeManagementState();
}

class _GradeManagementState extends State<GradeManagement> {
  @override
  void initState() {
    Get_All_Grade_API(context).Get_All_Grade();
    super.initState();
  }

  TextEditingController search = TextEditingController();
  TextEditingController arName = TextEditingController();
  TextEditingController enName = TextEditingController();
  TextEditingController feeCount = TextEditingController();

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
                          Get.dialog(GetBuilder<Grade_Controller>(
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

                                        bool isFeeEmpty = feeCount.text.isEmpty;

                                        controller.updateFieldError(
                                            "arname", isArNameEmpty);
                                        controller.updateFieldError(
                                            "enname", isEnNameEmpty);
                                        controller.updateFieldError(
                                            "fee", isFeeEmpty);

                                        if (!(isArNameEmpty ||
                                            isEnNameEmpty ||
                                            isFeeEmpty)) {
                                          await Add_Grade_API(context)
                                              .Add_Grade(
                                            name: arName.text,
                                            enName: enName.text,
                                            feeCount: feeCount.text,
                                          );
                                        }
                                      },
                                      color: Theme.of(context).primaryColor,
                                      width: 120),
                                ],
                                contents: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Column(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        Row(
                                          children: [
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  left: 15.0, right: 15.0),
                                              child: Textfildwithupper(
                                                  isRequired: true,
                                                  isError:
                                                      controller.IsennameError,
                                                  onChanged: (value) {
                                                    if (value.isNotEmpty) {
                                                      controller
                                                          .updateFieldError(
                                                              "enname", false);
                                                    }
                                                  },
                                                  controller: enName,
                                                  Uptext: "Grade En - Name".tr,
                                                  hinttext: "Grade En - Name".tr),
                                            ),
                                            Textfildwithupper(
                                                isRequired: true,
                                                isError:
                                                    controller.IsarnameError,
                                                onChanged: (value) {
                                                  if (value.isNotEmpty) {
                                                    controller.updateFieldError(
                                                        "arname", false);
                                                  }
                                                },
                                                controller: arName,
                                                Uptext: "Grade Ar - Name".tr,
                                                hinttext: "Grade Ar - Name".tr),
                                          ],
                                        ),
                                        Row(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  left: 15.0,
                                                  right: 15.0,
                                                  top: 15.0),
                                              child: Textfildwithupper(
                                                  isRequired: true,
                                                  isError:
                                                      controller.IsfeeError,
                                                  onChanged: (value) {
                                                    if (value.isNotEmpty) {
                                                      controller
                                                          .updateFieldError(
                                                              "fee", false);
                                                    }
                                                  },
                                                  controller: feeCount,
                                                  fieldType: "number",
                                                  Uptext: "Fee Count".tr,
                                                  hinttext: "Fee Count".tr),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                                apptitle: "Add Grade".tr,
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
          child: GradeTable(),
        )),
      ],
    ));
  }
}
