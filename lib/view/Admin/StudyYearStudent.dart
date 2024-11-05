// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:getx/view/Admin/StudyYearStudentsGrid.dart';
import 'package:getx/widgets/DropDown.dart';

class StudyTearStudents extends StatelessWidget {
  const StudyTearStudents({super.key});
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
                  title: "Session",
                  width: 115,options: ['add','bvv']
                ),
                DropDown(
                  title: "Grade",
                  width: 115,options: ['dda','bnn']
                ),
                DropDown(
                  title: "Class",
                  width: 115,options: ['ann','ddb']
                ),
                DropDown(
                  title: "Division",
                  width: 115,options: ['aee','bdd']
                ),
                DropDown(
                  title: "Student",
                  width: 115,options: ['ann','bff']
                ),
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
              child: StudyYearStudentGrid(),
            ),
          ],
        ),
      ),
    );
  }
}
