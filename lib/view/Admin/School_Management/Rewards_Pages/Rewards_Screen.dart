import 'package:flutter/material.dart';
import 'package:flutter_dropzone/flutter_dropzone.dart';
import 'package:get/get.dart';
import 'package:vms_school/Icons_File/v_m_s__icons_icons.dart';
import 'package:vms_school/Link/API/AdminAPI/School/School_Screen_APIs/Illness_APIs/Add_Illness_API.dart';
import 'package:vms_school/Link/API/AdminAPI/School/School_Screen_APIs/Illness_APIs/Get_All_Illness_API.dart';
import 'package:vms_school/Link/Controller/AdminController/School_Controllers/Illness_Controller.dart';
import 'package:vms_school/Theme/themeController.dart';
import 'package:vms_school/view/Admin/School_Management/Illness_Pages/Illness_Grid.dart';
import 'package:vms_school/widgets/ButtonsDialog.dart';
import 'package:vms_school/widgets/TextFildWithUpper.dart';
import 'package:vms_school/widgets/TextFormSearch.dart';
import 'package:vms_school/widgets/VMSAlertDialog.dart';

class Rewards_Screen extends StatefulWidget {
  Rewards_Screen({super.key});

  @override
  State<Rewards_Screen> createState() => _Ilness_ScreenState();
}

class _Ilness_ScreenState extends State<Rewards_Screen> {
  TextEditingController search = TextEditingController();
  TextEditingController name = TextEditingController();
  TextEditingController enName = TextEditingController();

  @override
  void initState() {
    Get_Illness_API(context).Get_Illness();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    return Expanded(
        child: Column(
      children: [
        Container(
          margin: EdgeInsets.only(left: 30.0, right: 30.0, top: 30.0),
          alignment: Alignment.center,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Row(
                    children: [
                      GetBuilder<Illness_Controller>(builder: (controller) {
                        return Padding(
                          padding: const EdgeInsets.only(left: 8.0),
                          child: TextFormSearch(
                            click: () {
                              controller.clearFilter();
                            },
                            onchange: (value) {
                              controller.searchByName(value);
                            },
                            width: w * 0.7,
                            radius: 5,
                            controller: search,
                            suffixIcon: search.text.isNotEmpty
                                ? Icons.close
                                : Icons.search,
                          ),
                        );
                      }),
                    ],
                  ),
                  Spacer(),
                  GetBuilder(
                      init: Themecontroller(),
                      builder: (thcont) {
                        return Row(
                          children: [
                            Container(
                              width: 40,
                              height: 40,
                              decoration: BoxDecoration(
                                  color: thcont.th!.cardColor,
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
                                          thcont.th!.cardColor),
                                      shape: WidgetStatePropertyAll(
                                          RoundedRectangleBorder(
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(5))))),
                                  onPressed: () {
                                    Get.dialog(GetBuilder<Illness_Controller>(
                                        builder: (controller) {
                                      return VMSAlertDialog(
                                          contents: Column(
                                            mainAxisSize: MainAxisSize.min,
                                            children: [
                                              Container(
                                                width: 400,
                                              ),
                                              Textfildwithupper(
                                                width: 350,
                                                controller: name,
                                                Uptext: "Name",
                                                hinttext: "Name",
                                              ),
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                    top: 10.0),
                                                child: Textfildwithupper(
                                                    width: 350,
                                                    controller: enName,
                                                    Uptext: "English Name",
                                                    hinttext: "English Name"),
                                              ),
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                    top: 10.0),
                                                child: Row(
                                                  children: [
                                                    Obx(() => Checkbox(
                                                          value: controller
                                                              .chronic.value,
                                                          onChanged: (value) {
                                                            controller
                                                                .togglechronic(
                                                                    value!);
                                                          },
                                                        )),
                                                    Text("Is Chronic",
                                                        style: Get
                                                            .theme
                                                            .textTheme
                                                            .bodyMedium!
                                                            .copyWith(
                                                                fontSize: 16)),
                                                  ],
                                                ),
                                              ),
                                            ],
                                          ),
                                          action: [
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.end,
                                              children: [
                                                ButtonDialog(
                                                    width: 150,
                                                    text: "Add Illness",
                                                    onPressed: () async {
                                                      await Add_Illness_API(
                                                              context)
                                                          .Add_Illness(
                                                        name: name.text,
                                                        enName: enName.text,
                                                        chronic: controller
                                                            .chronic.value,
                                                      );
                                                    },
                                                    color:
                                                        thcont.th!.canvasColor)
                                              ],
                                            )
                                          ],
                                          apptitle: "Add Illness",
                                          subtitle: "none");
                                    }));
                                  },
                                  icon: Icon(Icons.add,
                                      size: 18,
                                      color: thcont.th!.highlightColor)),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 10.0),
                              child: Container(
                                width: 40,
                                height: 40,
                                decoration: BoxDecoration(
                                    color: thcont.th!.cardColor,
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
                                            thcont.th!.cardColor),
                                        shape: WidgetStatePropertyAll(
                                            RoundedRectangleBorder(
                                                borderRadius: BorderRadius.all(
                                                    Radius.circular(5))))),
                                    onPressed: () {},
                                    icon: Icon(VMS_Icons.pdf,
                                        size: 18,
                                        color: thcont.th!.highlightColor)),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                  right: 10.0, left: 10.0),
                              child: Container(
                                width: 40,
                                height: 40,
                                decoration: BoxDecoration(
                                    color: thcont.th!.cardColor,
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
                                            thcont.th!.cardColor),
                                        shape: WidgetStatePropertyAll(
                                            RoundedRectangleBorder(
                                                borderRadius: BorderRadius.all(
                                                    Radius.circular(5))))),
                                    onPressed: () {},
                                    icon: Icon(VMS_Icons.xl,
                                        size: 18,
                                        color: thcont.th!.highlightColor)),
                              ),
                            ),
                          ],
                        );
                      })
                ],
              ),
            ],
          ),
        ),
        Expanded(
            child: Padding(
          padding: const EdgeInsets.only(top: 15.0),
          child: Illness_Grid(),
        )),
      ],
    ));
  }
}
