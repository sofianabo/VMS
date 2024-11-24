import 'package:flutter/material.dart';
import 'package:getx/view/Admin/Dashboardc/Dashboard_First_Row.dart';
import 'package:getx/view/Admin/Dashboardc/Dashboard_Second_Row.dart';
import 'package:getx/view/Admin/Dashboardc/Dashboard_Second_Side.dart';
import 'package:getx/view/Admin/Dashboardc/Dashboard_third_Row.dart';

class AdminDashboard extends StatelessWidget {
  AdminDashboard({super.key});

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
