import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vms_school/Link/API/Guardians_API/Get_My_Children_API.dart';
import 'package:vms_school/Link/Controller/AdminController/School_Controllers/Illness_Controller.dart';
import 'package:vms_school/Link/Controller/AdminController/School_Controllers/Vaccines_Controller.dart';
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
}
