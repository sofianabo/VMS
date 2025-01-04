import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vms_school/Icons_File/v_m_s__icons_icons.dart';
import 'package:vms_school/Link/API/AdminAPI/School/School_DropDown/DropdownGradeAPI.dart';
import 'package:vms_school/Link/API/AdminAPI/School/School_Screen_APIs/Class_API/Get_All_Classes.dart';
import 'package:vms_school/Link/Controller/WidgetController/DropDown_Controllers/DropDownGradeController.dart.dart';
import 'package:vms_school/Link/Controller/WidgetController/Sessions_DropDown_Controller.dart';
import 'package:vms_school/view/Admin/School_Management/Transactions/Transaction_Management_Grid.dart';
import 'package:vms_school/widgets/Admin_School/All_Screen_Sessions.dart';
import 'package:vms_school/widgets/Admin_School/DropDownClassMgmt.dart';

class Transaction_Management extends StatefulWidget {
  Transaction_Management({super.key});

  @override
  State<Transaction_Management> createState() => _Transaction_ManagementState();
}

class _Transaction_ManagementState extends State<Transaction_Management> {
  @override
  void initState() {
    Get.find<All_Screen_Sessions_Controller>().setSessionDefult();
    Get_All_Classes_API(context).Get_All_Classes();
    Getallgradeapi.Getallgrade();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
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
                  DropDownAllSessions(
                    title: "Session",
                    width: Get.width / 3,
                    type: "session",
                    API: 'class',
                  ),
                  Padding(
                      padding: const EdgeInsets.only(left: 8.0),
                      child: GetBuilder<Dropdowngradecontroller>(
                          builder: (controller) {
                        return DropDownClassMgmt(
                            isLoading: controller.isLoading,
                            title: "Grade",
                            width: Get.width / 3,
                            type: "grade");
                      })),
                  Spacer(),
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
                              backgroundColor:
                                  WidgetStatePropertyAll(Color(0xffF9F8FD)),
                              shape: WidgetStatePropertyAll(
                                  RoundedRectangleBorder(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(5))))),
                          onPressed: () {},
                          icon: Icon(VMS_Icons.pdf,
                              size: 18, color: Get.theme.primaryColor)),
                    ),
                  ),
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
                            backgroundColor:
                                WidgetStatePropertyAll(Color(0xffF9F8FD)),
                            shape: WidgetStatePropertyAll(
                                RoundedRectangleBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(5))))),
                        onPressed: () {},
                        icon: Icon(VMS_Icons.xl,
                            size: 18, color: Get.theme.primaryColor)),
                  ),
                ],
              ),
            ],
          ),
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
