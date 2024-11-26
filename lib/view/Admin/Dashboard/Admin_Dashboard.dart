import 'package:flutter/material.dart';
import 'package:getx/Link/API/AdminAPI/Dashboard_API.dart';
import 'package:getx/view/Admin/Dashboard/Dashboard_First_Row.dart';
import 'package:getx/view/Admin/Dashboard/Dashboard_Second_Row.dart';
import 'package:getx/view/Admin/Dashboard/Dashboard_Second_Side.dart';
import 'package:getx/view/Admin/Dashboard/Dashboard_third_Row.dart';

class AdminDashboard extends StatefulWidget {
  AdminDashboard({super.key});

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
            padding: const EdgeInsets.only(top: 15.0, right: 15.0, left: 25.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  flex: 6,
                  child: Column(
                    children: [
                      DashboardFirstRow(),
                      DashboardSecondRow(),
                      DashboardThirdRow(),
                    ],
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Column(
                    children: [
                      DashboardSecondSide(),
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