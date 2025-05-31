import 'package:flutter/material.dart';
import 'package:vms_school/Link/API/AdminAPI/DashBoard_APIs/Dashboard_API.dart';
import 'package:vms_school/view/SMS_Platform/Admin/Dashboard/Dashboard_First_Row.dart';
import 'package:vms_school/view/SMS_Platform/Admin/Dashboard/Dashboard_Second_Row.dart';
import 'package:vms_school/view/SMS_Platform/Admin/Dashboard/Dashboard_third_Row.dart';

class AdminDashboard extends StatefulWidget {
  const AdminDashboard({super.key});

  @override
  State<AdminDashboard> createState() => _AdminDashboardState();
}

class _AdminDashboardState extends State<AdminDashboard> {
  @override
  void initState() {
    Dashboard_API(context).initDashboard();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 20.0, right: 20.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Column(
                    spacing: 15.0,
                    children: [
                      const DashboardFirstRow(),
                      const DashboardSecondRow(),
                      DashboardThirdRow(),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    ));
  }
}
