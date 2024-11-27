// ignore_for_file: must_be_immutable, file_names

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vms_school/Icons_File/v_m_s__icons_icons.dart';
import 'package:vms_school/Link/API/AdminAPI/DropDownStatusAPI.dart';
import 'package:vms_school/Link/API/AdminAPI/RequestsAPI.dart';
import 'package:vms_school/Link/API/AdminAPI/School_Info/School_Info_Export.dart';
import 'package:vms_school/Link/Controller/AdminController/RequestsController.dart';
import 'package:vms_school/view/Admin/RequestsGrid.dart';
import 'package:vms_school/widgets/Admin_Requests/RequestStatusDropDown.dart';
import 'package:vms_school/widgets/Calender.dart';
import 'package:vms_school/widgets/DropDown.dart';
import 'package:vms_school/widgets/TextFormSearch.dart';

class Requests extends StatefulWidget {
  Requests({super.key});

  @override
  State<Requests> createState() => _RequestsState();
}

class _RequestsState extends State<Requests> {
  TextEditingController search = TextEditingController();
  @override
  void initState() {
    GetAllRequestsapi(context).GetAllRequests();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    return Expanded(
        child: Column(
      children: [
        GetBuilder<Requestscontroller>(builder: (controller) {
          return Container(
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
                        Requeststatusdropdown(
                            title: "Status", width: w / 5, type: "status"),
                        Padding(
                          padding:
                              const EdgeInsets.only(left: 20.0, right: 20.0),
                          child: selectDateRequest(
                            width: w / 4.383,
                           
                          ),
                        ),
                        TextFormSearch(
                          onchange: (value) {
                            controller.searchRequestByName(value);
                          },
                          radius: 5,
                          controller: search,
                          suffixIcon: Icons.search,
                        ),
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
                              style: const ButtonStyle(
                                  shape: WidgetStatePropertyAll(
                                      RoundedRectangleBorder(
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(5))))),
                              onPressed: () {
                                ExleRequestsExport(controller.registration);
                              },
                              icon: Icon(VMS_Icons.xl,
                                  size: 18, color: Get.theme.primaryColor)),
                        ),
                        Padding(
                          padding:
                              const EdgeInsets.only(right: 10.0, left: 10.0),
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
                                onPressed: () {
                                  exportRequestsToPDF(controller.registration);
                                },
                                icon: Icon(VMS_Icons.pdf,
                                    size: 18, color: Get.theme.primaryColor)),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ],
            ),
          );
        }),
        Expanded(
            child: Padding(
          padding: const EdgeInsets.only(top: 15.0),
          child: RequestsGrid(),
        )),
      ],
    ));
  }
}
