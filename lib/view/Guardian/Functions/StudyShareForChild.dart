import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:vms_school/Icons_File/v_m_s__icons_icons.dart';
import 'package:vms_school/Link/API/AdminAPI/School/School_DropDown/DropdownClassesAPI.dart';
import 'package:vms_school/Link/API/AdminAPI/School/School_Tables/AddLessonAPI.dart';
import 'package:vms_school/Link/API/AdminAPI/School/School_Tables/DeleteStudyShareAPI.dart';
import 'package:vms_school/Link/API/AdminAPI/School/School_Tables/EditStudyShareAPI.dart';
import 'package:vms_school/Link/API/AdminAPI/Teacher_APIS/GetAllTeachersAPI.dart';
import 'package:vms_school/Link/Controller/AdminController/School_Controllers/Admin_School_Time.dart';
import 'package:vms_school/Link/Model/AdminModel/School_Models/SchoolTimeModel.dart';
import 'package:vms_school/Translate/local_controller.dart';
import 'package:vms_school/main.dart';
import 'package:vms_school/widgets/Admin/Admin_Table/DropDownSchoolTime.dart';
import 'package:vms_school/widgets/ButtonsDialog.dart';
import 'package:vms_school/widgets/VMSAlertDialog.dart';

class Studyshareforchild extends StatefulWidget {
  const Studyshareforchild({super.key});
  //    final String id;
  // final int? indexOfStudent;
  // const Studyshareforchild({
  //   Key? key,
  //   required this.id,
  //   this.indexOfStudent,
  // }) : super(key: key);

  @override
  State<Studyshareforchild> createState() => _StudyshareforchildState();
}

Map<String, int> days = {
  "Sunday": 0,
  "Monday": 1,
  "Tuesday": 2,
  "Wednesday": 3,
  "Thursday": 4
};
Map<int, String> lessions = {
  1: 'First\n Lesson',
  2: 'second\n Lesson',
  3: 'Third\n Lesson',
  4: 'Forth\n Lesson',
  5: 'Fifth\n Lesson',
  6: 'Sixth\n Lesson',
  7: 'Seventh\n Lesson',
};
List<Map<String, String>> tableData = [
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

class Pair<F, S> {
  late final F first;
  late final S second;
  Pair(this.first, this.second);
  F getKey() {
    return first;
  }

  S getVal() {
    return second;
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! Pair<F, S>) return false;
    return first == other.first && other.second == second;
  }

  @override
  String toString() {
    return 'pair($first,$second)';
  }

  @override
  int get hashCode => first.hashCode ^ second.hashCode;
}

Map<Pair<int, int>, int> indexes = {};

SchoolTimeModel? m;

class _StudyshareforchildState extends State<Studyshareforchild> {
  @override
  void initState() {
   
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
      
        GetBuilder<AdminSchoolTimeController>(builder: (controller) {
          return Expanded(
              child: Padding(
            padding: const EdgeInsets.only(top: 15.0),
            child:  controller.isLoading
                        ? Center(
                            child: LoadingAnimationWidget.inkDrop(
                              color: Theme.of(context).primaryColor,
                              size: 60,
                            ),
                          )
                        : Padding(
                            padding:
                                const EdgeInsets.only(left: 30.0, right: 30.0),
                            child: SingleChildScrollView(
                              scrollDirection: Axis.vertical,
                              child: SingleChildScrollView(
                                  scrollDirection: Axis.horizontal,
                                  child: Table(
                                    defaultColumnWidth: FixedColumnWidth(
                                        160), // عرض ثابت لكل خلية
                                    border: TableBorder.all(
                                        color: Get.theme.primaryColor),
                                    children: [
                                      TableRow(
                                        children: [
                                          Container(
                                            width: 160,
                                            height: 50,
                                            alignment: Alignment.center,
                                            color: Theme.of(context)
                                                .indicatorColor,
                                            child: Center(
                                              child: Text('Day'.tr,
                                                  style: Theme.of(context)
                                                      .textTheme
                                                      .titleMedium!
                                                      .copyWith(fontSize: 18)),
                                            ),
                                          ),
                                          ...tableData[0]
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
                                                          style:
                                                              Theme.of(context)
                                                                  .textTheme
                                                                  .bodyMedium),
                                                    ),
                                                  )),
                                        ],
                                      ),
                                      for (var row in tableData)
                                        TableRow(
                                          children: [
                                            Container(
                                              width: 160,
                                              alignment: Alignment.center,
                                              height: 70,
                                              color: Theme.of(context)
                                                  .indicatorColor,
                                              child: Center(
                                                child: Text(
                                                    row['Day']?.tr ?? '',
                                                    style: Theme.of(context)
                                                        .textTheme
                                                        .bodyMedium),
                                              ),
                                            ),
                                            ...row.entries
                                                .where((entry) =>
                                                    entry.key != 'Day')
                                                .map((entry) => Container(
                                                    width: 160,
                                                    alignment:
                                                        Alignment.center,
                                                    height: 70,
                                                    child: m!.studyShare!
                                                                .isEmpty 
                                                        ? Text("")
                                                        
                                                            : Text(
                                                                textAlign:
                                                                    TextAlign
                                                                        .center,
                                                                entry
                                                                    .value,
                                                                style: Theme.of(
                                                                        context)
                                                                    .textTheme
                                                                    .bodyMedium))),
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
