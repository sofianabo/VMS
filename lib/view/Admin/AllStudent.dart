// ignore_for_file: must_be_immutable, file_names

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx/Controller/WidgetController/CheckBoxController.dart';
import 'package:getx/view/Admin/AllStudentGrid.dart';
import 'package:getx/widgets/TextFormSearch.dart';

class AllStudent extends StatelessWidget {
  AllStudent({super.key});
  TextEditingController search = TextEditingController();
  final CheckboxController controller = Get.put(CheckboxController());

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
                SizedBox(
                    width: 970,
                    height: 40,
                    child: TextFormSearch(
                      radius: 20,
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
              child: AllStudentGrid(),
            ),
          ],
        ),
      ),
    );
  }
}
