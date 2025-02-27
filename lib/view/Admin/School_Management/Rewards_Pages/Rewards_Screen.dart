import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vms_school/Link/Controller/AdminController/School_Controllers/Rewards_Controller.dart';
import 'package:vms_school/Link/Functions/Export_Rewards.dart';
import 'package:vms_school/view/Admin/School_Management/Rewards_Pages/Rewards_Grid.dart';

class Rewards_Screen extends StatelessWidget {
  Rewards_Screen({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        children: [
          Expanded(
              child: Padding(
            padding: const EdgeInsets.only(top: 15.0),
            child: RewardsGrid(),
          )),
        ],
      ),
    );
  }
}
