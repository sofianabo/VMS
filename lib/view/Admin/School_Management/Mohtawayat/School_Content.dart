import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vms_school/Icons_File/v_m_s__icons_icons.dart';
import 'package:vms_school/Link/API/AdminAPI/School/School_Screen_APIs/Get_School_Content.dart';
import 'package:vms_school/Link/API/AdminAPI/School/School_Screen_APIs/School_Content_API.dart';
import 'package:vms_school/Link/API/AdminAPI/School/School_Screen_APIs/Update_School_Content.dart';
import 'package:vms_school/Link/Controller/AdminController/School_Controllers/School_Content_Controller.dart';
import 'package:vms_school/view/Admin/School_Management/Mohtawayat/School_Content_Grid.dart';
import 'package:vms_school/widgets/ButtonsDialog.dart';
import 'package:vms_school/widgets/TextFildWithUpper.dart';
import 'package:vms_school/widgets/VMSAlertDialog.dart';

class School_Content extends StatefulWidget {
  const School_Content({super.key});

  @override
  State<School_Content> createState() => _School_ContentState();
}

class _School_ContentState extends State<School_Content> {
  @override
  void initState() {
    Get_Content_Screen_API(context).Get_Content_Screen();
    super.initState();
  }

  TextEditingController arName = TextEditingController();
  TextEditingController count = TextEditingController();

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
                          arName.clear();
                          count.clear();
                          Get.find<School_Content_Controller>()
                              .updateFieldError("arname", false);
                          Get.find<School_Content_Controller>()
                              .updateFieldError("count", false);
                          Get.dialog(barrierDismissible: false,
                              GetBuilder<School_Content_Controller>(
                                  builder: (controller) {
                            return VMSAlertDialog(
                                action: [
                                  ButtonDialog(
                                      text: "Add".tr,
                                      onPressed: () async {
                                        bool isArNameEmpty =
                                            arName.text.isEmpty;
                                        bool iscountEmpty = count.text.isEmpty;

                                        controller.updateFieldError(
                                            "arname", isArNameEmpty);
                                        controller.updateFieldError(
                                            "count", iscountEmpty);

                                        if (!(isArNameEmpty || iscountEmpty)) {
                                          await Add_Content_Screen_API(context)
                                              .Add_Content_Screen(
                                            name: arName.text,
                                            count: count.text,
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
                                            Textfildwithupper(
                                                isRequired: true,
                                                isError: controller.IsnameError,
                                                onChanged: (value) {
                                                  if (value.isNotEmpty) {
                                                    controller.updateFieldError(
                                                        "arname", false);
                                                  }
                                                },
                                                controller: arName,
                                                Uptext: "Content Name".tr,
                                                hinttext: "Content Name".tr),
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  left: 15.0, right: 15.0),
                                              child: Textfildwithupper(
                                                  isRequired: true,
                                                  fieldType: "number",
                                                  isError:
                                                      controller.IsCountError,
                                                  onChanged: (value) {
                                                    if (value.isNotEmpty) {
                                                      if (value == "0") {
                                                        count.clear();
                                                        count.text = "1";
                                                      }
                                                      controller
                                                          .updateFieldError(
                                                              "count", false);
                                                    }
                                                  },
                                                  controller: count,
                                                  Uptext: "Count".tr,
                                                  hinttext: "Count".tr),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                                apptitle: "Add".tr,
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
          child: School_Content_Grid(),
        )),
      ],
    ));
  }
}
