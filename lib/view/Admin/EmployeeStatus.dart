// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:getx/view/Admin/EmployeeStatusGrid.dart';
import 'package:getx/widgets/Calender.dart';
import 'package:getx/widgets/DropDown.dart';

class EmployeeStatus extends StatelessWidget {
  const EmployeeStatus({super.key});
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
                 DropDown(title: "Status",width: 115,options: ['asdvsd','bdfbfdb']),
                 DropDown(title: "job Title",width: 115,options: ['asdvsdv','hgngh']),
                DatePicker(),
                 DropDown(title: "Teacher",width: 115,options: ['asdsd','bewterg']),
                IconButton(onPressed: () {}, icon: const Icon(Icons.file_open)),
                IconButton(
                    onPressed: () {}, icon: const Icon(Icons.bookmark_remove)),
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
              child: EmpolyeeStatusGrid(),
            ),
          ],
        ),
      ),
    );
  }
}
