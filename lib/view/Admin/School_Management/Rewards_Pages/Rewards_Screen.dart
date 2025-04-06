import 'package:flutter/material.dart';
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
            // child: RewardsGrid(),
          )),
        ],
      ),
    );
  }
}
