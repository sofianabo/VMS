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
    return Container(
      margin: const EdgeInsets.only(right: 100),
      width: MediaQuery.of(context).size.width * 0.8,
      child: Container(
        margin: const EdgeInsets.only(top: 10),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                DropDown(
                    title: "Status", width: 290, options: ['abbb', 'bfddfvd']),
                DatePicker(),
                SizedBox(
                    width: 290,
                    height: 40,
                    child: TextFormSearch(
                      controller: search,
                      suffixIcon: Icons.search,
                    ))
              ],
            ),
            Container(
              margin: const EdgeInsets.only(right: 20, left: 20, top: 20),
              width: MediaQuery.of(context).size.width * 6,
              height: MediaQuery.of(context).size.height * 0.63,
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
