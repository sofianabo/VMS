import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vms_school/Icons_File/v_m_s__icons_icons.dart';
import 'package:vms_school/Link/API/AdminAPI/School/School_Screen_APIs/Transactions/Transaction_API.dart';
import 'package:vms_school/Link/Controller/AdminController/School_Controllers/Transaction_Controller.dart';
import 'package:vms_school/view/Admin/School_Management/Transactions/Transaction_Management_Grid.dart';
import 'package:vms_school/widgets/Admin/Admin_School/DropDowTransaction.dart';
import 'package:vms_school/widgets/Calender.dart';
import 'package:vms_school/widgets/TextFormSearch.dart';

class Transaction_Management extends StatefulWidget {
  const Transaction_Management({super.key});

  @override
  State<Transaction_Management> createState() => _Transaction_ManagementState();
}

class _Transaction_ManagementState extends State<Transaction_Management> {
  TextEditingController search = TextEditingController();

  @override
  void initState() {
    Get_Transaction_Screen_API.Get_Transaction_Screen(rows: "25");
    Get.find<Transaction_Controller>().ressetAll();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    return Expanded(
        child: Column(
      children: [
        if (screenWidth > 769)
          Container(
            width: screenWidth,
            margin: const EdgeInsets.only(left: 30.0, right: 30.0, top: 30.0),
            child: GetBuilder<Transaction_Controller>(builder: (controller) {
              return Wrap(
                alignment: WrapAlignment.spaceBetween,
                runSpacing: 10.0,
                spacing: 15.0,
                crossAxisAlignment: WrapCrossAlignment.center,
                runAlignment: WrapAlignment.spaceBetween,
                children: [
                  Wrap(
                    alignment: WrapAlignment.start,
                    runSpacing: 10.0,
                    spacing: 15.0,
                    crossAxisAlignment: WrapCrossAlignment.center,
                    runAlignment: WrapAlignment.start,
                    children: [
                      DropDowTransaction(
                          isLoading: false,
                          title: "Role".tr,
                          width: 200,
                          type: "roll"),
                      DropDowTransaction(
                          isLoading: controller.isLoading,
                          title: "Action".tr,
                          width: 200,
                          type: "action"),
                      selectTransactionDate(
                        width: 200,
                      ),
                      TextFormSearch(
                        click: () {
                          controller.clearFilter();
                        },
                        onchange: (value) {
                          controller.searchRequestByName(
                              value,
                              controller.rollIndex,
                              controller.AttendencetDate.value.toString(),
                              controller.actionIndex);
                        },
                        width: 250,
                        radius: 5,
                        controller: search,
                        suffixIcon:
                            search.text.isNotEmpty ? Icons.close : Icons.search,
                      ),
                      DropDowTransaction(
                          isLoading: false,
                          title: "Rows",
                          width: 100,
                          type: "rows"),
                    ],
                  ),
                  Row(
                    spacing: 10.0,
                    mainAxisSize: MainAxisSize.min,
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
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(5))))),
                            onPressed: () {},
                            icon: Icon(VMS_Icons.xl,
                                size: 18,
                                color: Theme.of(context).highlightColor)),
                      ),
                    ],
                  )
                ],
              );
            }),
          ),
        if (screenWidth <= 769)
          Container(
            width: screenWidth,
            margin: const EdgeInsets.only(left: 30.0, right: 30.0, top: 30.0),
            child: GetBuilder<Transaction_Controller>(builder: (controller) {
              return SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    Padding(
                        padding: const EdgeInsets.only(left: 8.0),
                        child: DropDowTransaction(
                            isLoading: false,
                            title: "Role".tr,
                            width: 200,
                            type: "roll")),
                    Padding(
                        padding: const EdgeInsets.only(left: 8.0),
                        child: DropDowTransaction(
                            isLoading: controller.isLoading,
                            title: "Action".tr,
                            width: 200,
                            type: "action")),
                    Padding(
                      padding: const EdgeInsets.only(left: 8.0),
                      child: selectTransactionDate(
                        width: 200,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 8.0),
                      child: TextFormSearch(
                        click: () {
                          controller.clearFilter();
                        },
                        onchange: (value) {
                          controller.searchRequestByName(
                              value,
                              controller.rollIndex,
                              controller.AttendencetDate.value.toString(),
                              controller.actionIndex);
                        },
                        width: 250,
                        radius: 5,
                        controller: search,
                        suffixIcon:
                            search.text.isNotEmpty ? Icons.close : Icons.search,
                      ),
                    ),
                    const Padding(
                        padding: EdgeInsets.only(left: 8.0),
                        child: DropDowTransaction(
                            isLoading: false,
                            title: "Rows",
                            width: 100,
                            type: "rows")),
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
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(5))))),
                          onPressed: () {},
                          icon: Icon(VMS_Icons.xl,
                              size: 18,
                              color: Theme.of(context).highlightColor)),
                    ),
                  ],
                ),
              );
            }),
          ),
        Expanded(
            child: Padding(
          padding: const EdgeInsets.only(top: 15.0),
          child: Transaction_Management_Grid(),
        )),
      ],
    ));
  }
}
