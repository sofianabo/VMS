import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:vms_school/Link/Controller/AdminController/School_Controllers/Admin_School_Time.dart';
import 'package:vms_school/Link/Controller/Teacher_Controller/StudyShareTeacherController.dart';
import 'package:vms_school/Link/Model/AdminModel/School_Models/SchoolTimeModel.dart';
import 'package:vms_school/Link/Model/Teacher_Model/StudyShareTeacherModel.dart';

class Studyshareteacher extends StatefulWidget {
  const Studyshareteacher({super.key});
  // final String id;
  // final int? indexOfStudent;
  // const Studyshareforchild({
  //   Key? key,
  //   required this.id,
  //   this.indexOfStudent,
  // }) : super(key: key);

  @override
  State<Studyshareteacher> createState() => _StudyshareteacherState();
}

Map<String, int> daysTeacherMorning = {
  "Sunday": 0,
  "Monday": 1,
  "Tuesday": 2,
  "Wednesday": 3,
  "Thursday": 4
};
Map<String, int> daysTeacherEvening = {
  "Sunday": 0,
  "Monday": 1,
  "Tuesday": 2,
  "Wednesday": 3,
  "Thursday": 4
};
Map<int, String> lessionsTeacherMorning = {
  1: 'First\n Lesson',
  2: 'second\n Lesson',
  3: 'Third\n Lesson',
  4: 'Forth\n Lesson',
  5: 'Fifth\n Lesson',
  6: 'Sixth\n Lesson',
  7: 'Seventh\n Lesson',
};
Map<int, String> lessionsTeacherEvening = {
  1: 'First\n Lesson',
  2: 'second\n Lesson',
  3: 'Third\n Lesson',
  4: 'Forth\n Lesson',
  5: 'Fifth\n Lesson',
  6: 'Sixth\n Lesson',
  7: 'Seventh\n Lesson',
};

List<Map<String, String>> tableDataTeacherMorning = [
  {
    'Day': 'Sunday',
    'First\n Lesson': 'No Lesson',
    'second\n Lesson': 'No Lesson ',
    'Third\n Lesson': 'No Lesson  ',
    'Forth\n Lesson': 'No Lesson   ',
    'Fifth\n Lesson': 'No Lesson    ',
    'Sixth\n Lesson': 'No Lesson     ',
    'Seventh\n Lesson': 'No Lesson    ',
  },
  {
    'Day': 'Monday',
    'First\n Lesson': 'No Lesson',
    'second\n Lesson': 'No Lesson ',
    'Third\n Lesson': 'No Lesson  ',
    'Forth\n Lesson': 'No Lesson   ',
    'Fifth\n Lesson': 'No Lesson    ',
    'Sixth\n Lesson': 'No Lesson     ',
    'Seventh\n Lesson': 'No Lesson    ',
  },
  {
    'Day': 'Tuesday',
    'First\n Lesson': 'No Lesson',
    'second\n Lesson': 'No Lesson ',
    'Third\n Lesson': 'No Lesson  ',
    'Forth\n Lesson': 'No Lesson   ',
    'Fifth\n Lesson': 'No Lesson    ',
    'Sixth\n Lesson': 'No Lesson     ',
    'Seventh\n Lesson': 'No Lesson    ',
  },
  {
    'Day': 'Wednesday',
    'First\n Lesson': 'No Lesson',
    'second\n Lesson': 'No Lesson ',
    'Third\n Lesson': 'No Lesson  ',
    'Forth\n Lesson': 'No Lesson   ',
    'Fifth\n Lesson': 'No Lesson    ',
    'Sixth\n Lesson': 'No Lesson     ',
    'Seventh\n Lesson': 'No Lesson    ',
  },
  {
    'Day': 'Thursday',
    'First\n Lesson': 'No Lesson',
    'second\n Lesson': 'No Lesson ',
    'Third\n Lesson': 'No Lesson  ',
    'Forth\n Lesson': 'No Lesson   ',
    'Fifth\n Lesson': 'No Lesson    ',
    'Sixth\n Lesson': 'No Lesson     ',
    'Seventh\n Lesson': 'No Lesson    ',
  },
];

List<Map<String, String>> tableDataTeacherEvening = [
  {
    'Day': 'Sunday',
    'First\n Lesson': 'No Lesson',
    'second\n Lesson': 'No Lesson ',
    'Third\n Lesson': 'No Lesson  ',
    'Forth\n Lesson': 'No Lesson   ',
    'Fifth\n Lesson': 'No Lesson    ',
    'Sixth\n Lesson': 'No Lesson     ',
    'Seventh\n Lesson': 'No Lesson    ',
  },
  {
    'Day': 'Monday',
    'First\n Lesson': 'No Lesson',
    'second\n Lesson': 'No Lesson ',
    'Third\n Lesson': 'No Lesson  ',
    'Forth\n Lesson': 'No Lesson   ',
    'Fifth\n Lesson': 'No Lesson    ',
    'Sixth\n Lesson': 'No Lesson     ',
    'Seventh\n Lesson': 'No Lesson    ',
  },
  {
    'Day': 'Tuesday',
    'First\n Lesson': 'No Lesson',
    'second\n Lesson': 'No Lesson ',
    'Third\n Lesson': 'No Lesson  ',
    'Forth\n Lesson': 'No Lesson   ',
    'Fifth\n Lesson': 'No Lesson    ',
    'Sixth\n Lesson': 'No Lesson     ',
    'Seventh\n Lesson': 'No Lesson    ',
  },
  {
    'Day': 'Wednesday',
    'First\n Lesson': 'No Lesson',
    'second\n Lesson': 'No Lesson ',
    'Third\n Lesson': 'No Lesson  ',
    'Forth\n Lesson': 'No Lesson   ',
    'Fifth\n Lesson': 'No Lesson    ',
    'Sixth\n Lesson': 'No Lesson     ',
    'Seventh\n Lesson': 'No Lesson    ',
  },
  {
    'Day': 'Thursday',
    'First\n Lesson': 'No Lesson',
    'second\n Lesson': 'No Lesson ',
    'Third\n Lesson': 'No Lesson  ',
    'Forth\n Lesson': 'No Lesson   ',
    'Fifth\n Lesson': 'No Lesson    ',
    'Sixth\n Lesson': 'No Lesson     ',
    'Seventh\n Lesson': 'No Lesson    ',
  },
];

class PairTeacherMorning<F, S> {
  late final F first;
  late final S second;
  PairTeacherMorning(this.first, this.second);
  F getKey() {
    return first;
  }

  S getVal() {
    return second;
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! PairTeacherMorning<F, S>) return false;
    return first == other.first && other.second == second;
  }

  @override
  String toString() {
    return 'pair($first,$second)';
  }

  @override
  int get hashCode => first.hashCode ^ second.hashCode;
}

class PairTeacherEvening<F, S> {
  late final F first;
  late final S second;
  PairTeacherEvening(this.first, this.second);
  F getKey() {
    return first;
  }

  S getVal() {
    return second;
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! PairTeacherEvening<F, S>) return false;
    return first == other.first && other.second == second;
  }

  @override
  String toString() {
    return 'pair($first,$second)';
  }

  @override
  int get hashCode => first.hashCode ^ second.hashCode;
}

Map<PairTeacherMorning<int, int>, int> indexesTeacherMorning = {};
Map<PairTeacherEvening<int, int>, int> indexesTeacherEvening = {};

StudyShareTeacherModel? modTeacher;

class _StudyshareteacherState extends State<Studyshareteacher> {
  late Studyshareteachercontroller c;

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        GetBuilder<Studyshareteachercontroller>(builder: (controller) {
          return Expanded(
              child: Padding(
            padding: const EdgeInsets.only(top: 15.0),
            child: controller.isLoading
                ? Center(
                    child: LoadingAnimationWidget.inkDrop(
                      color: Theme.of(context).primaryColor,
                      size: 60,
                    ),
                  )
                : Padding(
                    padding: const EdgeInsets.only(left: 30.0, right: 30.0),
                    child: SingleChildScrollView(
                      scrollDirection: Axis.vertical,
                      child: SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Column(
                            spacing: 20,
                            children: [
                              Text(
                                "Morning".tr,
                                style: Get.theme.textTheme.bodyMedium!
                                    .copyWith(fontSize: 20),
                              ),
                              Table(
                                defaultColumnWidth:
                                    FixedColumnWidth(120), // عرض ثابت لكل خلية
                                border: TableBorder.all(
                                    color: Get.theme.primaryColor),
                                children: [
                                  TableRow(
                                    children: [
                                      Container(
                                        width: 160,
                                        height: 50,
                                        alignment: Alignment.center,
                                        color: Theme.of(context).indicatorColor,
                                        child: Center(
                                          child: Text('Day'.tr,
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .titleMedium!
                                                  .copyWith(fontSize: 18)),
                                        ),
                                      ),
                                      ...tableDataTeacherMorning[0]
                                          .keys
                                          .where((key) => key != 'Day')
                                          .map((key) => Container(
                                                width: 160,
                                                height: 50,
                                                alignment: Alignment.center,
                                                color: Theme.of(context)
                                                    .indicatorColor,
                                                child: Center(
                                                  child: Text(
                                                      textAlign:
                                                          TextAlign.center,
                                                      key.tr,
                                                      style: Theme.of(context)
                                                          .textTheme
                                                          .bodyMedium),
                                                ),
                                              )),
                                    ],
                                  ),
                                  for (var row in tableDataTeacherMorning)
                                    TableRow(
                                      children: [
                                        Container(
                                          width: 160,
                                          alignment: Alignment.center,
                                          height: 70,
                                          color:
                                              Theme.of(context).indicatorColor,
                                          child: Center(
                                            child: Text(row['Day']?.tr ?? '',
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .bodyMedium),
                                          ),
                                        ),
                                        ...row.entries
                                            .where(
                                                (entry) => entry.key != 'Day')
                                            .map((entry) => Container(
                                                width: 160,
                                                alignment: Alignment.center,
                                                height: 70,
                                                child: entry.value
                                                        .contains("No Lesson")
                                                    ? Text("")
                                                    : Text(
                                                        textAlign:
                                                            TextAlign.center,
                                                        entry.value,
                                                        style: Theme.of(context)
                                                            .textTheme
                                                            .bodyMedium))),
                                      ],
                                    ),
                                ],
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 15.0),
                                child: Text(
                                  "Evening".tr,
                                  style: Get.theme.textTheme.bodyMedium!
                                      .copyWith(fontSize: 20),
                                ),
                              ),
                              Table(
                                defaultColumnWidth:
                                    FixedColumnWidth(120), // عرض ثابت لكل خلية
                                border: TableBorder.all(
                                    color: Get.theme.primaryColor),
                                children: [
                                  TableRow(
                                    children: [
                                      Container(
                                        width: 160,
                                        height: 50,
                                        alignment: Alignment.center,
                                        color: Theme.of(context).indicatorColor,
                                        child: Center(
                                          child: Text('Day'.tr,
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .titleMedium!
                                                  .copyWith(fontSize: 18)),
                                        ),
                                      ),
                                      ...tableDataTeacherEvening[0]
                                          .keys
                                          .where((key) => key != 'Day')
                                          .map((key) => Container(
                                                width: 160,
                                                height: 50,
                                                alignment: Alignment.center,
                                                color: Theme.of(context)
                                                    .indicatorColor,
                                                child: Center(
                                                  child: Text(
                                                      textAlign:
                                                          TextAlign.center,
                                                      key.tr,
                                                      style: Theme.of(context)
                                                          .textTheme
                                                          .bodyMedium),
                                                ),
                                              )),
                                    ],
                                  ),
                                  for (var row in tableDataTeacherEvening)
                                    TableRow(
                                      children: [
                                        Container(
                                          width: 160,
                                          alignment: Alignment.center,
                                          height: 70,
                                          color:
                                              Theme.of(context).indicatorColor,
                                          child: Center(
                                            child: Text(row['Day']?.tr ?? '',
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .bodyMedium),
                                          ),
                                        ),
                                        ...row.entries
                                            .where(
                                                (entry) => entry.key != 'Day')
                                            .map((entry) => Container(
                                                width: 160,
                                                alignment: Alignment.center,
                                                height: 70,
                                                child: entry.value
                                                        .contains("No Lesson")
                                                    ? Text("")
                                                    : Text(
                                                        textAlign:
                                                            TextAlign.center,
                                                        entry.value,
                                                        style: Theme.of(context)
                                                            .textTheme
                                                            .bodyMedium))),
                                      ],
                                    ),
                                ],
                              ),
                            ],
                          )),
                    ),
                  ),
          ));
        }),
      ],
    ));
  }
}
