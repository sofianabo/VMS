// ignore_for_file: must_be_immutable, file_names

import 'package:flutter/material.dart';
import 'package:getx/view/Admin/RequestsGrid.dart';
import 'package:getx/widgets/Calender.dart';
import 'package:getx/widgets/DropDown.dart';
import 'package:getx/widgets/TextFormSearch.dart';

class Requests extends StatelessWidget {
  Requests({super.key});
  TextEditingController search = TextEditingController();
  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;
    return Container(
      margin: EdgeInsets.only(right: w / 12.8),
      width: w * 0.8,
      child: Container(
        margin: EdgeInsets.only(top: h / 68.4),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                DropDown(
                    title: "Status",
                    width: w / 5,
                    options: ['abbb', 'bfddfvd']),
                DatePicker(width:  w / 4.383,),
                TextFormSearch(
                  radius: 5,
                  controller: search,
                  suffixIcon: Icons.search,
                )
              ],
            ),
            Container(
              margin:
                  EdgeInsets.only(right: w / 64, left: w / 64, top: h / 34.2),
              width: w * 6,
              height: h * 0.63,
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20)),
                color: Colors.white,
              ),
              child: RequestsGrid(),
            ),
          ],
        ),
      ),
    );
  }
}
