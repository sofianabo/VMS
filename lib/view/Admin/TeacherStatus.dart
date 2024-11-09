// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:getx/view/Admin/TeacherStatusGrid.dart';
import 'package:getx/widgets/Calender.dart';
import 'package:getx/widgets/DropDown.dart';

class TeacherStatus extends StatelessWidget {
  const TeacherStatus({super.key});
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
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                DropDown(title: "Status", width: 165, options: ['ddd', 'bfdb']),
                DropDown(title: "Class", width: 165, options: ['fdb', 'gfn']),
                DropDown(
                    title: "Division", width: 165, options: ['asa', 'weg']),
                DatePicker(
                  width: 165,
                ),
                DropDown(
                    title: "Teacher", width: 165, options: ['fgnfg', 'gfng']),
                IconButton(onPressed: () {}, icon: const Icon(Icons.file_open)),
                IconButton(
                    onPressed: () {}, icon: const Icon(Icons.bookmark_remove)),
              ],
            ),
            Container(
              margin: const EdgeInsets.only(top: 20),
              width: MediaQuery.of(context).size.width * 0.8,
              height: MediaQuery.of(context).size.height * 0.63,
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20)),
                color: Colors.white,
              ),
              child: TeacherStatusGrid(),
            ),
          ],
        ),
      ),
    );
  }
}
