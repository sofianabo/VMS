// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:getx/view/Admin/TeacherQuorumGrid.dart';
import 'package:getx/widgets/DropDown.dart';
import 'package:getx/widgets/TextFormSearch.dart';

class TeacherQuorum extends StatelessWidget {
  TextEditingController search = TextEditingController();
  TeacherQuorum({super.key});
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
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                DropDown(title: "Type", width: 320, options: ['ddd', 'bfdb']),
                Container(
                    width: 663,
                    height: 40,
                    child: TextFormSearch(
                      controller: search,
                      suffixIcon: Icons.search,
                      radius: 5,
                    )),
              ],
            ),
            Container(
              margin: const EdgeInsets.only(right: 20, left: 20, top: 20),
              width: MediaQuery.of(context).size.width * 0.8,
              height: MediaQuery.of(context).size.height * 0.63,
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20)),
                color: Colors.white,
              ),
              child: TeacherQuorumGrid(),
            ),
          ],
        ),
      ),
    );
  }
}
