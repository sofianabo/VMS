import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx/Icons_File/v_m_s__icons_icons.dart';
import 'package:getx/Link/Controller/AdminController/Labrary_Controller.dart';
import 'package:getx/view/Admin/School_Management/Electronic_Pages/Electronic_Book_Grid.dart';
import 'package:getx/widgets/ButtonsDialog.dart';
import 'package:getx/widgets/TextFildWithUpper.dart';
import 'package:getx/widgets/TextFormSearch.dart';
import 'package:getx/widgets/VMSAlertDialog.dart';

class ElectronicBook extends StatefulWidget {
  ElectronicBook({super.key});

  @override
  State<ElectronicBook> createState() => _ElectronicBookState();
}

class _ElectronicBookState extends State<ElectronicBook> {
  TextEditingController search = TextEditingController();

  TextEditingController name = TextEditingController();

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
                      GetBuilder<Labrary_Controller>(builder: (context) {
                        return Padding(
                          padding: const EdgeInsets.only(left: 8.0),
                          child: TextFormSearch(
                            onchange: (value) {},
                            width: w * 0.7,
                            radius: 5,
                            controller: search,
                            suffixIcon: Icons.search,
                          ),
                        );
                      }),
                    ],
                  ),
                  Spacer(),
                  Row(
                    children: [
                      Container(
                        width: 40,
                        height: 40,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(5),
                            boxShadow: const [
                              BoxShadow(
                                  color: Colors.black12,
                                  offset: Offset(0, 2),
                                  blurRadius: 1)
                            ]),
                        child: IconButton(
                            style: ButtonStyle(
                                shape: WidgetStatePropertyAll(
                                    RoundedRectangleBorder(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(5))))),
                            onPressed: () {
                              Get.dialog(VMSAlertDialog(
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
                                          hinttext: "Name"),
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(top: 15.0),
                                        child: Container(
                                          decoration: BoxDecoration(
                                              borderRadius: BorderRadius.all(
                                                Radius.circular(5),
                                              ),
                                              border: Border.all(
                                                  color: Color(0xffD9D9D9))),
                                          alignment: Alignment.center,
                                          width: 350,
                                          height: 150,
                                          child: Text(
                                            textAlign: TextAlign.center,
                                            "Click To Add File\nOr\nDrag And Drop File Here",
                                            style: TextStyle(
                                                color: Color(0xffCBBFBF)),
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                  action: [
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        ButtonDialog(
                                            width: 150,
                                            text: "Add Book",
                                            onPressed: () {},
                                            color:
                                                Get.theme.colorScheme.primary)
                                      ],
                                    )
                                  ],
                                  apptitle: "Add Electronic Book",
                                  subtitle: "none"));
                            },
                            icon: Icon(Icons.add,
                                size: 18, color: Get.theme.primaryColor)),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 10.0),
                        child: Container(
                          width: 40,
                          height: 40,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(5),
                              boxShadow: const [
                                BoxShadow(
                                    color: Colors.black12,
                                    offset: Offset(0, 2),
                                    blurRadius: 1)
                              ]),
                          child: IconButton(
                              style: ButtonStyle(
                                  shape: WidgetStatePropertyAll(
                                      RoundedRectangleBorder(
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(5))))),
                              onPressed: () {},
                              icon: Icon(VMS_Icons.pdf,
                                  size: 18, color: Get.theme.primaryColor)),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 10.0, left: 10.0),
                        child: Container(
                          width: 40,
                          height: 40,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(5),
                              boxShadow: const [
                                BoxShadow(
                                    color: Colors.black12,
                                    offset: Offset(0, 2),
                                    blurRadius: 1)
                              ]),
                          child: IconButton(
                              style: ButtonStyle(
                                  shape: WidgetStatePropertyAll(
                                      RoundedRectangleBorder(
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(5))))),
                              onPressed: () {},
                              icon: Icon(VMS_Icons.xl,
                                  size: 18, color: Get.theme.primaryColor)),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ],
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
}
